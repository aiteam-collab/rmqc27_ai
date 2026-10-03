CREATE OR REPLACE
"PACKAGE BODY pkg_shearing
"
"IS
"
"	PROCEDURE proc_decrease_cons(
"
"								p_bu		VARCHAR2,
"
"								p_plnt		VARCHAR2,
"
"								p_plnt_loc_id   VARCHAR2,
"
"								p_doc_no	VARCHAR2,
"
"								p_doc_date	DATE,
"
"								p_user		VARCHAR2,
"
"								p_lang		NUMBER
"
"								)
"
"	IS
"
"	CURSOR c1
"
"	  IS
"
"	SELECT *
"
"	  FROM prod_cut_proc_hd
"
"	 WHERE pcph_bu = p_bu
"
"	   AND pcph_plnt = p_plnt
"
"	   AND pcph_doc_no = p_doc_no
"
"	   AND pcph_cons_flag = 'N';
"
"
"
"
"
"
"
"	 CURSOR c_so(c_store_id VARCHAR2,
"
"				 c_prod_id VARCHAR2,
"
"				 c_prod_rev NUMBER,
"
"				 c_proj_id VARCHAR2,
"
"				 c_task_id VARCHAR2
"
"				 )
"
"		 IS
"
"	SELECT NVL(SUM(sqoh_so_qty - sqoh_so_alloc_qty),0) sqoh_qty
"
"	  FROM so_qty_on_hand
"
"	 WHERE sqoh_bu = p_bu
"
"	   AND sqoh_store_id = c_store_id
"
"	   AND sqoh_prod_id = c_prod_id
"
"	   AND sqoh_prod_rev = c_prod_rev
"
"	   AND sqoh_proj_id = c_proj_id
"
"	   AND sqoh_task_id = c_task_id;
"
"
"
"
"
"
"
"	CURSOR c7 (c_store_id VARCHAR2, c_prod_id VARCHAR2, c_prod_rev NUMBER)
"
"	  IS
"
"	  SELECT stock_store_id
"
"	    FROM stocks
"
"	   WHERE stock_bu = p_bu
"
"	     AND stock_store_id = c_store_id
"
"	     AND stock_prod_id = c_prod_id
"
"	     AND stock_prod_rev = c_prod_rev;
"
"
"
"	 CURSOR c8(c_prod_id VARCHAR2, c_prod_rev NUMBER, c_store_id VARCHAR2)
"
"	   IS
"
"	 SELECT sb_batch_id,
"
"			sb_bc_unit_cost,
"
"			sb_qty
"
"	   FROM(
"
"	 SELECT sb_batch_id,
"
"			sb_bc_unit_cost,
"
"			SUM((sb_qty_in - (sb_qty_allocated + sb_qty_out))) sb_qty
"
"	   FROM stocks_batches
"
"	  WHERE sb_bu = p_bu
"
"		AND sb_prod_id = c_prod_id
"
"		AND sb_prod_rev = c_prod_rev
"
"		AND sb_store_id = c_store_id
"
"		AND sb_cost_method = 'FIFO'
"
"		AND ((sb_qty_in - (sb_qty_allocated + sb_qty_out))) > 0
"
"	 GROUP BY sb_batch_id, sb_bc_unit_cost
"
"	 ORDER BY sb_batch_id)
"
"	 UNION ALL
"
"	 SELECT sb_batch_id,
"
"		sb_bc_unit_cost,
"
"			 sb_qty
"
"		FROM(
"
"	  SELECT sb_batch_id,
"
"			 sb_bc_unit_cost,
"
"			 SUM((sb_qty_in - (sb_qty_allocated + sb_qty_out))) sb_qty
"
"		FROM stocks_batches
"
"	   WHERE sb_bu = p_bu
"
"		 AND sb_prod_id = c_prod_id
"
"		 AND sb_prod_rev = c_prod_rev
"
"		 AND sb_store_id = c_store_id
"
"		 AND sb_cost_method = 'LIFO'
"
"		 AND ((sb_qty_in - (sb_qty_allocated + sb_qty_out))) > 0
"
"	  GROUP BY sb_batch_id,sb_bc_unit_cost
"
"	 ORDER BY sb_batch_id DESC);
"
"
"
"
"
"	CURSOR c9(c_prod_id VARCHAR2, c_prod_rev NUMBER, c_store_id VARCHAR2, c_lot_no VARCHAR2)
"
"	  IS
"
"	  SELECT lss_source_id,lss_source_type,lss_sys_ls_no,(lss_qty_hand - lss_qty_allocated) lss_qty_avbl
"
"		FROM lot_ser_stocks
"
"	   WHERE lss_bu = p_bu
"
"		 AND lss_prod_id = c_prod_id
"
"		 AND lss_prod_rev = c_prod_rev
"
"		 AND lss_store_id = c_store_id
"
"		 AND lss_lot_no = c_lot_no
"
"		 AND (lss_qty_hand - lss_qty_allocated) >0;
"
"
"
"	CURSOR c10(c_prod_id VARCHAR2, c_prod_rev NUMBER, c_store_id VARCHAR2)
"
"	IS
"
"	SELECT NVL(SUM((stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked))),0) stock_qty_hand
"
"	  FROM stocks
"
"	 WHERE stock_bu  = p_bu
"
"	   AND stock_prod_id = c_prod_id
"
"	   AND stock_prod_rev = c_prod_rev
"
"	   AND stock_store_id = c_store_id
"
"	   AND ((stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked))) > 0;
"
"
"
"	CURSOR c11(c_prod_id VARCHAR2, c_prod_rev NUMBER, c_store_id VARCHAR2,c_lot_no VARCHAR2)
"
"	  IS
"
"	SELECT binstk_bin_id,binstk_source_id,binstk_source_type,
"
"		   SUM(binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked)) binstk_qty_qoh
"
"	  FROM bin_stocks
"
"	 WHERE binstk_bu = p_bu
"
"	   AND binstk_prod_id = c_prod_id
"
"	   AND binstk_prod_rev = c_prod_rev
"
"	   AND binstk_store_id = c_store_id
"
"	   AND func_find_prod_Ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('N')
"
"	 GROUP BY binstk_source_id,binstk_source_type,binstk_bin_id
"
"	 HAVING SUM(binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked)) > 0
"
"	 UNION ALL
"
"	SELECT bsld_bin_id,bsld_source_id,bsld_source_type,
"
"		   SUM(bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) binstk_qty_qoh
"
"	  FROM bin_serial_lot_details
"
"	 WHERE bsld_bu = p_bu
"
"	   AND bsld_prod_id = c_prod_id
"
"	   AND bsld_prod_rev = c_prod_rev
"
"	   AND bsld_store_id = c_store_id
"
"	   AND bsld_lot_no = c_lot_no
"
"	   AND func_find_prod_Ser_lot_type(p_bu,c_prod_id,c_prod_rev) NOT IN ('N')
"
"	 GROUP BY bsld_source_id,bsld_source_type,bsld_bin_id
"
"	 HAVING SUM(bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) > 0;
"
"
"
"		v_year	NUMBER;
"
"		v_period	NUMBER;
"
"		v_unit_cost	NUMBER(17,5);
"
"		v_proj_id	projects.prj_proj_id%TYPE;
"
"		v_task_id	proj_tasks.prjtsk_task_id%TYPE;
"
"		v_req_qty	NUMBER(12,3);
"
"		v_rem_qty	NUMBER(12,3);
"
"		v_elg_qty	NUMBER(12,3);
"
"		v_tot_elg_qty NUMBER(12,3);
"
"		v_sys_ls_no NUMBER;
"
"		v_rm_prod_id VARCHAR2(25);
"
"		v_rm_prod_rev NUMBER(5);
"
"		v_rm_store_id VARCHAR2(10);
"
"		v_rm_lot_no  VARCHAR2(50);
"
"		v_lot_req_qty NUMBER(12,3);
"
"		v_lot_rem_qty NUMBER(12,3);
"
"		v_lot_elg_qty NUMBER(12,3);
"
"		v_lot_tot_elg_qty NUMBER(12,3);
"
"		v_par_req_qty	 NUMBER(12,3);
"
"		v_par_rem_qty	NUMBER(12,3);
"
"		v_par_elg_qty	NUMBER(12,3);
"
"		v_par_tot_elg_qty  NUMBER(12,3);
"
"		v_req_bin_qty	NUMBER(12,3);
"
"		v_rem_bin_qty	NUMBER(12,3);
"
"		v_elg_bin_qty	NUMBER(12,3);
"
"		v_tot_elg_bin_qty	NUMBER(12,3);
"
"		v_prod_cls_desc                 VARCHAR2(200)   ;
"
"		v_prod_subcls         	        VARCHAR2(10)    ;
"
"		v_prod_subcls_desc    		VARCHAR2(200)   ;
"
"		v_prod_grp            		VARCHAR2(10)    ;
"
"		v_prod_grp_desc       		VARCHAR2(50)	;
"
"		v_prod_subgrp         		VARCHAR2(10)	;
"
"		v_prod_subgrp_desc    		VARCHAR2(50)	;
"
"		v_prod_cls_type                 VARCHAR2(10)    ;
"
"
"
"
"
"	   c_so1	c_so%ROWTYPE;
"
"	   cr9		c9%ROWTYPE;
"
"	   cr10		c10%ROWTYPE;
"
"
"
"
"
"	BEGIN
"
"
"
"	proc_find_year_period(p_bu,p_doc_date,v_year,v_period);
"
"
"
"	FOR cr1 IN c1
"
"		  LOOP
"
"			proc_get_prod_param_det(p_bu           ,
"
"						p_plnt                 ,
"
"						cr1.pcph_prod_id       ,
"
"						cr1.pcph_prod_rev      ,
"
"						v_prod_cls_desc        ,
"
"						v_prod_subcls          ,
"
"						v_prod_subcls_desc     ,
"
"						v_prod_grp             ,
"
"						v_prod_grp_desc        ,
"
"						v_prod_subgrp          ,
"
"						v_prod_subgrp_desc     ,
"
"						v_prod_cls_type        ,
"
"						p_user                 ,
"
"						p_lang                 );
"
"
"
"			v_par_req_qty := cr1.pcph_cons_qty;
"
"			v_par_rem_qty := cr1.pcph_cons_qty;
"
"			v_par_elg_qty := 0;
"
"			v_par_tot_elg_qty := 0;
"
"
"
"			IF cr1.pcph_unit_cost = 0 THEN
"
"		   v_unit_cost := 1;
"
"		ELSE
"
"		   v_unit_cost := cr1.pcph_unit_cost;
"
"		END IF;
"
"
"
"		OPEN c10(cr1.pcph_prod_id,cr1.pcph_prod_rev,cr1.pcph_store_id);
"
"		FETCH c10 INTO cr10;
"
"		IF cr10.stock_qty_hand > 0 THEN
"
"			IF v_par_rem_qty >= cr10.stock_qty_hand THEN
"
"			   v_par_elg_qty := cr10.stock_qty_hand;
"
"			   v_par_rem_qty := v_par_rem_qty - v_par_elg_qty;
"
"			   v_par_tot_elg_qty := v_par_tot_elg_qty + v_par_elg_qty;
"
"			ELSIF v_par_rem_qty < cr10.stock_qty_hand THEN
"
"			   v_par_elg_qty := v_par_rem_qty;
"
"			   v_par_rem_qty := v_par_rem_qty - v_par_elg_qty;
"
"			   v_par_tot_elg_qty := v_par_tot_elg_qty + v_par_elg_qty;
"
"			END IF;
"
"
"
"			IF v_par_elg_qty > 0 THEN
"
"
"
"				 proc_upd_stocks(
"
"						p_bu,
"
"						cr1.pcph_store_id,
"
"						NULL,			--p_dept_id
"
"						cr1.pcph_prod_id,	--p_prod_id
"
"						cr1.pcph_prod_rev,	--p_prod_rev
"
"						0,			--p_req_qty
"
"						0,			--p_ord_qty
"
"						-v_par_elg_qty,	--p_qoh_qty
"
"						0,			--p_allo_qty
"
"						0, 	                --p_mi_allo_qty
"
"						cr1.pcph_unit_cost,		--p_sc_cost
"
"						cr1.pcph_unit_cost,		--p_bc_cost
"
"						0,			--p_bc_disc_cost
"
"						NULL,			--p_net_disc_flag
"
"						0,			--p_land_cost
"
"						0,			--p_charge_amt
"
"						0,			--p_non_charge_amt
"
"						1,	--p_seq_no
"
"						NULL,		        --p_sub_seq_no
"
"						NULL,			--p_ord_pfx
"
"						p_doc_no,		--p_ord_no
"
"						NULL,			--p_receipt_pfx
"
"						p_doc_no,			--p_receipt_no
"
"						NULL,			--p_suplr_id
"
"						v_year,		        --p_year
"
"						v_period,		--p_period
"
"						p_doc_date,			--p_date
"
"						NULL,			--p_cust_id
"
"						'SFM',			--p_appl
"
"						'MCM',			--p_source
"
"						NULL,			--p_rule
"
"						p_user,			--p_upd_by
"
"						SYSDATE,		--p_upd_date
"
"						NULL,			--p_sales_area
"
"						func_find_product_class(p_bu,p_plnt,cr1.pcph_prod_id,cr1.pcph_prod_rev),		--p_class_id
"
"						NULL,			--p_jo_no
"
"						NULL,			--p_order_type
"
"						NULL,			--p_proj_id
"
"						0,			--p_lm_disc_amt
"
"						0,			--p_suplr_qty
"
"						NULL,			--p_mfg_date
"
"						NULL,			--p_expiry_date
"
"						NULL,			--p_subcon_suplr_id
"
"						0,			--p_subcon_bc_cost
"
"						0,			--p_subcon_lbr_cost
"
"						NULL,			--p_receipt_seq_no
"
"						NULL,			--p_terr_id
"
"						0,			--p_cust_qoh
"
"						0,			--p_qc_qty
"
"						substr('Raw Material Cutting'||'-'||'Quantity Decreased'||'-'||p_doc_no,1,100),
"
"						substr('Raw Material Cutting'||'-'||'Quantity Decreased'||'-'||p_doc_no,1,200),
"
"						p_prod_cls_desc        => v_prod_cls_desc ,
"
"						p_prod_sub_cls_id      => v_prod_subcls   ,
"
"						p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"						p_prod_grp_id          => v_prod_grp,
"
"						p_prod_grp_desc        => v_prod_grp_desc,
"
"						p_prod_sub_grp_id      => v_prod_subgrp,
"
"						p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"						p_prod_cls_type        => v_prod_cls_type
"
"				   );
"
"
"
"			END IF;
"
"
"
"
"
"			 IF cr1.pcph_proj_id IS NOT NULL AND cr1.pcph_task_id IS NOT NULL THEN
"
"							  OPEN c_so(cr1.pcph_store_id,cr1.pcph_prod_id,cr1.pcph_prod_rev,cr1.pcph_proj_id,cr1.pcph_task_id);
"
"							  FETCH c_so INTO c_so1;
"
"							  IF c_so1.sqoh_qty < cr1.pcph_cons_qty THEN
"
"								 RAISe_APPLICATION_ERROR(-20251,'ICM' ||'So Stock qty low');
"
"							  END IF;
"
"
"
"							  CLOSE c_so;
"
"
"
"							  proc_upd_so_stocks(
"
"								 p_bu                           ,
"
"								 cr1.pcph_store_id               ,
"
"								 cr1.pcph_prod_id                      ,
"
"								 cr1.pcph_prod_rev                     ,
"
"								 -cr1.pcph_cons_qty,
"
"								 0                    ,
"
"								 cr1.pcph_unit_cost                    ,
"
"								 NULL                       ,
"
"								 NULL                        ,
"
"								 NULL                    ,
"
"								 NULL                ,
"
"								 p_doc_date               ,
"
"								 'PO'                 ,
"
"								 NULL                  ,
"
"								 cr1.pcph_doc_no                   ,
"
"								 NULL                  ,
"
"								 NULL                 ,
"
"								 cr1.pcph_doc_no                  ,
"
"								 1              ,
"
"								 'MC'               ,
"
"								 'SFM'                     ,
"
"								 substr('Consumption Quantity Decreased in Shearing'||'-'||p_doc_no||'-'||p_doc_no,1,100),
"
"								 substr('Consumption Quantity Decreased in Shearing'||'-'||p_doc_no||'-'||p_doc_no,1,100),
"
"								 p_user                         ,
"
"								 'P'                         ,
"
"								 cr1.pcph_proj_id                      ,
"
"								 cr1.pcph_task_id    ,
"
"								 0
"
"										);
"
"
"
"
"
"							  v_proj_id := cr1.pcph_proj_id;
"
"							  v_task_id := cr1.pcph_task_id;
"
"
"
"
"
"				   END IF;
"
"
"
"
"
"
"
"
"
"
"
"		ELSE
"
"		   RAISE_APPLICATION_ERROR(-20251,'ICM');
"
"		END IF;
"
"		CLOSE c10;
"
"
"
"				  IF func_find_prod_cost_method(p_bu,cr1.pcph_prod_id,cr1.pcph_prod_rev) IN ('FIFO','LIFO') THEN
"
"
"
"					  v_req_qty := cr1.pcph_cons_qty;
"
"					  v_rem_qty := v_req_qty;
"
"					  v_elg_qty := 0;
"
"					  v_tot_elg_qty := 0;
"
"
"
"
"
"					   FOR cr8 IN c8(cr1.pcph_prod_id,cr1.pcph_prod_rev,cr1.pcph_store_id)
"
"					   LOOP
"
"							IF v_rem_qty >= cr8.sb_qty THEN
"
"							   v_elg_qty := cr8.sb_qty;
"
"							   v_rem_qty := v_rem_qty - v_elg_qty;
"
"							   v_tot_elg_qty := v_tot_elg_qty + v_elg_qty;
"
"							ELSIF v_rem_qty < cr8.sb_qty THEN
"
"							   v_elg_qty := v_rem_qty;
"
"							   v_rem_qty := v_rem_qty - v_elg_qty;
"
"							   v_tot_elg_qty := v_tot_elg_qty + v_elg_qty;
"
"							END IF;
"
"
"
"						IF v_elg_qty > 0 THEN
"
"							 proc_upd_stock_batches(
"
"									   p_bu                ,
"
"									cr1.pcph_store_id ,
"
"									cr1.pcph_prod_id,
"
"									cr1.pcph_prod_rev,
"
"									cr8.sb_batch_id,
"
"									0,
"
"									v_elg_qty                ,
"
"									0                ,
"
"									0                ,
"
"									cr8.sb_bc_unit_cost      ,
"
"									cr8.sb_bc_unit_cost     ,
"
"									0                ,
"
"									0                ,
"
"									0                ,
"
"									0                ,
"
"									'N'              ,
"
"									p_doc_date           ,
"
"									NULL             ,
"
"									p_doc_no         ,
"
"									1,
"
"									'PO'          ,
"
"									NULL          ,
"
"									p_doc_no      ,
"
"									1  ,
"
"									1,
"
"									func_find_product_class(p_bu,p_plnt,cr1.pcph_prod_id,cr1.pcph_prod_rev),
"
"									'PMC',
"
"									'SFM',
"
"									NULL     ,
"
"									p_doc_date    ,
"
"									NULL     ,
"
"									NULL    ,
"
"									p_user ,
"
"									NULL,
"
"									NULL,
"
"									p_prod_cls_desc        => v_prod_cls_desc ,
"
"									p_prod_subcls          => v_prod_subcls   ,
"
"									p_prod_subcls_desc     => v_prod_subcls_desc,
"
"									p_prod_grp             => v_prod_grp,
"
"									p_prod_grp_desc        => v_prod_grp_desc,
"
"									p_prod_subgrp          => v_prod_subgrp,
"
"									p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"									p_prod_cls_type        => v_prod_cls_type
"
"								);
"
"						END IF;
"
"
"
"						EXIT WHEN v_rem_qty <= 0 OR v_tot_elg_qty = v_req_qty;
"
"
"
"
"
"					   END LOOP;
"
"
"
"					   IF v_rem_qty > 0 THEN
"
"						  raise_application_error(-20251,'ICM');
"
"					   END IF;
"
"
"
"
"
"			   END IF;
"
"
"
"			   IF func_find_store_bin_flag(p_bu,cr1.pcph_store_id) = 'Y' AND func_find_prod_ser_lot_type(p_bu,cr1.pcph_prod_id,cr1.pcph_prod_rev) = 'N' THEN
"
"
"
"							  v_req_bin_qty := cr1.pcph_cons_qty;
"
"							  v_rem_bin_qty := v_req_bin_qty;
"
"							  v_elg_bin_qty := 0;
"
"							  v_tot_elg_bin_qty := 0;
"
"
"
"						FOR cr11 IN c11(cr1.pcph_prod_id,cr1.pcph_prod_rev,cr1.pcph_store_id,cr1.pcph_lot_no)
"
"						LOOP
"
"
"
"							  IF v_rem_bin_qty >= cr11.binstk_qty_qoh THEN
"
"								   v_elg_bin_qty := cr11.binstk_qty_qoh;
"
"								   v_rem_bin_qty := v_rem_bin_qty - v_elg_bin_qty;
"
"								   v_tot_elg_bin_qty := v_tot_elg_bin_qty + v_elg_bin_qty;
"
"							  ELSIF v_rem_bin_qty < cr11.binstk_qty_qoh THEN
"
"								   v_elg_bin_qty := v_rem_bin_qty;
"
"								   v_rem_bin_qty := v_rem_bin_qty - v_elg_bin_qty;
"
"								   v_tot_elg_bin_qty := v_tot_elg_bin_qty + v_elg_bin_qty;
"
"							  END IF;
"
"
"
"							IF v_elg_bin_qty > 0 THEN
"
"
"
"
"
"								proc_upd_bin_stocks(p_bu              ,
"
"										cr1.pcph_store_id        ,
"
"										cr1.pcph_prod_id         ,
"
"										cr1.pcph_prod_rev        ,
"
"										cr11.binstk_bin_id          ,
"
"										NULL       ,
"
"										NULL          ,
"
"										NULL          ,
"
"										cr1.pcph_source_type        ,
"
"										cr1.pcph_source_id          ,
"
"										-v_elg_bin_qty        ,
"
"										0       ,
"
"										0        ,
"
"										0        ,
"
"										cr1.pcph_unit_cost       ,
"
"										p_doc_date      ,
"
"										'FRM'        ,
"
"										NULL         ,
"
"										p_doc_no          ,
"
"										NULL     ,
"
"										'SFM'            ,
"
"										p_user
"
"										);
"
"
"
"							END IF;
"
"
"
"						 END LOOP c11;
"
"
"
"						IF v_rem_bin_qty > 0 THEN
"
"						  RAISE_APPLICATION_ERROR(-20251,'ICM'|| '-' || p_doc_no || cr1.pcph_store_id || '-' || cr1.pcph_prod_id || '-' ||cr1.pcph_prod_rev);
"
"						 END IF;
"
"					  END IF;
"
"
"
"
"
"
"
"			IF cr1.pcph_lot_no IS NOT NULL THEN
"
"
"
"				 v_lot_req_qty := cr1.pcph_cons_qty;
"
"				 v_lot_rem_qty := cr1.pcph_cons_qty;
"
"				 v_lot_elg_qty := 0;
"
"				 v_lot_tot_elg_qty := 0;
"
"
"
"					  FOR cr9 IN c9(cr1.pcph_prod_id,cr1.pcph_prod_rev,cr1.pcph_store_id,cr1.pcph_lot_no)
"
"					  LOOP
"
"
"
"						 IF cr9.lss_qty_avbl >= v_lot_rem_qty THEN
"
"							v_lot_elg_qty := v_lot_rem_qty;
"
"							v_lot_rem_qty := v_lot_rem_qty - v_lot_elg_qty;
"
"							v_lot_tot_elg_qty := v_lot_tot_elg_qty + v_lot_elg_qty;
"
"						 ELSIF cr9.lss_qty_avbl < v_lot_rem_qty THEN
"
"							v_lot_elg_qty := cr9.lss_qty_avbl;
"
"							v_lot_rem_qty := v_lot_rem_qty - v_lot_elg_qty;
"
"							v_lot_tot_elg_qty := v_lot_tot_elg_qty + v_lot_elg_qty;
"
"						 END IF;
"
"
"
"
"
"						 v_rm_prod_id := cr1.pcph_prod_id;
"
"						 v_rm_prod_rev := cr1.pcph_prod_rev;
"
"						 v_rm_store_id := cr1.pcph_store_id;
"
"						 v_rm_lot_no   := cr1.pcph_lot_no;
"
"
"
"			   --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"			   proc_upd_lot_ser_stocks(
"
"									   p_bu,
"
"									   cr1.pcph_store_id,
"
"									   cr1.pcph_prod_id,
"
"									   cr1.pcph_prod_rev,
"
"									   cr9.lss_sys_ls_no,
"
"									   -v_lot_elg_qty,
"
"									   0,
"
"									   0,
"
"									   v_unit_cost,
"
"									   func_find_prod_ser_lot_type(p_bu,cr1.pcph_prod_id,cr1.pcph_prod_rev),
"
"									   v_rm_lot_no,
"
"									   NULL,
"
"									   cr9.lss_source_type,
"
"									   cr9.lss_source_id,
"
"									   func_find_prod_expiry_date(p_bu,cr1.pcph_prod_id,cr1.pcph_prod_rev,p_doc_date),
"
"									   p_doc_date,
"
"									   'MCM',
"
"									   NULL,
"
"									   p_doc_no,
"
"									   1,
"
"									   'SFM',
"
"									   substr('Raw Material Cutting'||'-'||'Quantity Decreased'||'-'||p_doc_no,1,100),
"
"									   substr('Raw Material Cutting'||'-'||'Quantity Decreased'||'-'||p_doc_no,1,200),
"
"									   p_user
"
"									);
"
"
"
"
"
"
"
"
"
"						IF func_find_store_bin_flag(p_bu,cr1.pcph_store_id) = 'Y' THEN
"
"
"
"							  v_req_bin_qty := v_lot_elg_qty;
"
"							  v_rem_bin_qty := v_req_bin_qty;
"
"							  v_elg_bin_qty := 0;
"
"							  v_tot_elg_bin_qty := 0;
"
"
"
"							 -- RAISE_APPLICATION_ERROR(-20999,'HRM' || func_find_Store_bin_flag(p_bu,cr1.pcph_store_id)||'/'||v_lot_elg_qty||'/'||v_req_bin_qty ||'/'||v_rem_bin_qty);
"
"
"
"						FOR cr11 IN c11(cr1.pcph_prod_id,cr1.pcph_prod_rev,cr1.pcph_store_id,v_rm_lot_no)
"
"						LOOP
"
"
"
"							  IF v_rem_bin_qty >= cr11.binstk_qty_qoh THEN
"
"								   v_elg_bin_qty := cr11.binstk_qty_qoh;
"
"								   v_rem_bin_qty := v_rem_bin_qty - v_elg_bin_qty;
"
"								   v_tot_elg_qty := v_tot_elg_qty + v_elg_bin_qty;
"
"							  ELSIF v_rem_bin_qty < cr11.binstk_qty_qoh THEN
"
"								   v_elg_bin_qty := v_rem_bin_qty;
"
"								   v_rem_bin_qty := v_rem_bin_qty - v_elg_bin_qty;
"
"								   v_tot_elg_bin_qty := v_tot_elg_bin_qty + v_elg_bin_qty;
"
"							  END IF;
"
"
"
"								IF v_elg_bin_qty > 0 THEN
"
"
"
"									--RAISE_APPLICATION_ERROR(-20999,'HRM' ||cr9.lss_sys_ls_no ||'/'||v_rm_lot_no ||'/'||cr9.lss_source_type||'/'||cr9.lss_source_id||'/'||cr11.binstk_bin_id);
"
"									proc_upd_bin_stocks(p_bu              ,
"
"											cr1.pcph_store_id        ,
"
"											cr1.pcph_prod_id         ,
"
"											cr1.pcph_prod_rev        ,
"
"											cr11.binstk_bin_id          ,
"
"											cr9.lss_sys_ls_no      ,
"
"											v_rm_lot_no         ,
"
"											NULL          ,
"
"											cr9.lss_source_type       ,
"
"											cr9.lss_source_id          ,
"
"											-v_elg_bin_qty        ,
"
"											0       ,
"
"											0        ,
"
"											0        ,
"
"											cr1.pcph_unit_cost       ,
"
"											p_doc_date      ,
"
"											'FRM'        ,
"
"											NULL         ,
"
"											p_doc_no          ,
"
"											NULL     ,
"
"											'SFM'            ,
"
"											p_user
"
"											);
"
"
"
"									 END IF;
"
"
"
"								END LOOP c11;
"
"
"
"									IF v_rem_bin_qty > 0 THEN
"
"									  RAISE_APPLICATION_ERROR(-20251,'ICM'|| '-' || p_doc_no || cr1.pcph_store_id || '-' || cr1.pcph_prod_id || '-' ||cr1.pcph_prod_rev);
"
"									END IF;
"
"
"
"								END IF;
"
"
"
"
"
"
"
"
"
"						END LOOP;
"
"
"
"
"
"				   IF v_lot_rem_qty > 0 THEN
"
"					  RAISE_APPLICATION_ERROR(-20251,'ICM'|| '-' || p_doc_no || cr1.pcph_store_id || '-' || cr1.pcph_prod_id || '-' ||cr1.pcph_prod_rev);
"
"				   END IF;
"
"
"
"				   END IF;
"
"
"
"
"
"		END LOOP;
"
"
"
"		--  RAISE_APPLICATION_ERROR(-20251,'ICM'|| '-' || p_bu || p_plnt || '-' || p_doc_no );
"
"		UPDATE prod_cut_proc_hd
"
"		   SET pcph_cons_flag = 'Y',
"
"			   pcph_upd_by = p_user,
"
"			   pcph_upd_date = SYSDATE
"
"		WHERE pcph_bu = p_bu
"
"		  AND pcph_plnt = p_plnt
"
"		  AND pcph_doc_no = p_doc_no;
"
"
"
"		  proc_calc_shearing_op_cost(p_bu,p_plnt,p_doc_no,p_user,p_lang);
"
"
"
"
"
"	END	proc_decrease_cons;
"
"
"
"	PROCEDURE proc_inc_scrap(
"
"							 p_bu		VARCHAR2,
"
"							 p_plnt		VARCHAR2,
"
"							 p_plnt_loc_id  VARCHAR2,
"
"							 p_doc_date	DATE,
"
"							 p_doc_no	VARCHAR2,
"
"							 p_lang		NUMBER,
"
"							 p_user		VARCHAR2
"
"							 )
"
"    IS
"
"	CURSOR c1
"
"	  IS
"
"	SELECT pceb_seq_no,
"
"		   pceb_prod_id,
"
"		   pceb_prod_rev,
"
"		   pceb_store_id,
"
"		   pceb_lot_no,
"
"		   pceb_accept_qty,
"
"		   pceb_reject_qty,
"
"		   pceb_thickness,
"
"		   pceb_width,
"
"		   pceb_length,
"
"		   pceb_prod_kgs,
"
"		   pcph_loc_id
"
"	  FROM prod_cut_proc_hd,
"
"	       prod_cut_end_bits
"
"	 WHERE pcph_bu = pceb_bu
"
"	   AND pcph_plnt = pceb_plnt
"
"	   AND pcph_doc_no = pceb_doc_no
"
"	   AND pceb_bu = p_bu
"
"	   AND pceb_plnt = p_plnt
"
"	   AND pceb_doc_no = p_doc_no
"
"	   AND pceb_rev_flag = 'N'
"
"	   AND pceb_es_type IN ('S');
"
"
"
"
"
"
"
"
"
"	CURSOR c2(c_prod_id 	VARCHAR2,
"
"		  c_prod_rev 	NUMBER,
"
"		  c_source_id 	VARCHAR2,
"
"		  c_source_type VARCHAR2,
"
"		  c_lot_no 	VARCHAR2
"
"		  )
"
"	  IS
"
"	SELECT plsn_sys_ls_no
"
"	  FROM prod_lot_ser_nos
"
"	 WHERE plsn_bu = p_bu
"
"	   AND plsn_prod_id = c_prod_id
"
"	   AND plsn_prod_rev = c_prod_rev
"
"	   AND plsn_source_id = c_source_id
"
"	   AND plsn_source_type = c_source_type
"
"	   AND plsn_lot_no = c_lot_no;
"
"
"
"
"
"
"
"
"
"			v_rej_store 			VARCHAR2(10);
"
"			v_stock_cnt			NUMBER;
"
"			var_ref2			VARCHAR2(500);
"
"			v_unit_cost			NUMBER(17,5);
"
"			v_sys_ls_no			NUMBER(15);
"
"			v_prod_cls_desc                 VARCHAR2(200)   ;
"
"			v_prod_subcls         	        VARCHAR2(10)    ;
"
"			v_prod_subcls_desc    		VARCHAR2(200)   ;
"
"			v_prod_grp            		VARCHAR2(10)    ;
"
"			v_prod_grp_desc       		VARCHAR2(50)	;
"
"			v_prod_subgrp         		VARCHAR2(10)	;
"
"			v_prod_subgrp_desc    		VARCHAR2(50)	;
"
"			v_prod_cls_type                 VARCHAR2(10)    ;
"
"
"
"	   cr2			c2%ROWTYPE;
"
"
"
"
"
"	BEGIN
"
"
"
"
"
"
"
"		FOR cr1 IN c1
"
"		LOOP
"
"		proc_get_prod_param_det(p_bu           ,
"
"				p_plnt                 ,
"
"				cr1.pceb_prod_id	,
"
"				cr1.pceb_prod_rev       ,
"
"				v_prod_cls_desc        ,
"
"				v_prod_subcls          ,
"
"				v_prod_subcls_desc     ,
"
"				v_prod_grp             ,
"
"				v_prod_grp_desc        ,
"
"				v_prod_subgrp          ,
"
"				v_prod_subgrp_desc     ,
"
"				v_prod_cls_type        ,
"
"				p_user                 ,
"
"				p_lang                 );
"
"
"
"--RAISE_APPLICATION_ERROR(-20999,p_bu||'/ '||p_plnt||'/ '||p_plnt_loc_id||'/ '||cr1.pceb_prod_id||'/ '||cr1.pceb_prod_rev);
"
"
"
"			v_rej_store := func_find_Dflt_store_id(p_bu,p_plnt,p_plnt_loc_id,cr1.pceb_prod_id,cr1.pceb_prod_rev);
"
"
"
"				 UPDATE prod_cut_end_bits
"
"					SET pceb_rev_flag = 'Y',
"
"						pceb_upd_by = p_user,
"
"						pceb_upd_date = SYSDATE
"
"				  WHERE pceb_bu = p_bu
"
"					AND pceb_plnt = p_plnt
"
"					AND pceb_doc_no = p_doc_no
"
"					AND pceb_seq_no = cr1.pceb_seq_no;
"
"
"
"			SELECT COUNT(*)
"
"			  INTO v_stock_cnt
"
"			  FROM stocks
"
"			 WHERE stock_bu = p_bu
"
"			   AND stock_prod_id = cr1.pceb_prod_id
"
"			   AND stock_prod_rev = cr1.pceb_prod_rev
"
"			   AND stock_store_id = v_rej_store;
"
"
"
"			   IF v_stock_cnt = 0 THEN
"
"				  proc_cre_stocks(
"
"								p_bu              ,
"
"								cr1.pceb_prod_id         ,
"
"								cr1.pceb_prod_rev        ,
"
"								v_rej_store,
"
"								p_user
"
"								 );
"
"			   END IF;
"
"
"
"				v_unit_cost := func_find_std_cost(p_bu,p_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev,p_doc_date);
"
"
"
"			   IF v_unit_cost = 0 THEN
"
"
"
"				  SELECT pcph_unit_cost
"
"					INTO v_unit_cost
"
"					FROM prod_cut_proc_hd
"
"				   WHERE pcph_bu = p_bu
"
"					 AND pcph_plnt = p_plnt
"
"					 AND pcph_doc_no = p_doc_no;
"
"
"
"			   END IF;
"
"
"
"
"
"			   IF cr1.pceb_accept_qty > 0 THEN
"
"
"
"							       proc_upd_stocks(
"
"										p_bu,
"
"										v_rej_store,
"
"										NULL,			--p_dept_id
"
"										cr1.pceb_prod_id,	--p_prod_id
"
"										cr1.pceb_prod_rev,	--p_prod_rev
"
"										0,			--p_req_qty
"
"										0,			--p_ord_qty
"
"										cr1.pceb_accept_qty,	--p_qoh_qty
"
"										0,			--p_allo_qty
"
"										0, 	                --p_mi_allo_qty
"
"										v_unit_cost,		--p_sc_cost
"
"										v_unit_cost,		--p_bc_cost
"
"										0,			--p_bc_disc_cost
"
"										NULL,			--p_net_disc_flag
"
"										0,			--p_land_cost
"
"										0,			--p_charge_amt
"
"										0,			--p_non_charge_amt
"
"										1,	--p_seq_no
"
"										NULL,		        --p_sub_seq_no
"
"										NULL,			--p_ord_pfx
"
"										p_doc_no,		--p_ord_no
"
"										NULL,			--p_receipt_pfx
"
"										p_doc_no,			--p_receipt_no
"
"										NULL,			--p_suplr_id
"
"										func_find_year(p_bu,p_doc_date),		        --p_year
"
"										func_find_period(p_bu,p_doc_date),		--p_period
"
"										p_doc_date,			--p_date
"
"										NULL,			--p_cust_id
"
"										'SFM',			--p_appl
"
"										'MR',			--p_source
"
"										NULL,			--p_rule
"
"										p_user,			--p_upd_by
"
"										SYSDATE,		--p_upd_date
"
"										NULL,			--p_sales_area
"
"										func_find_product_class(p_bu,p_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev),		--p_class_id
"
"										NULL,			--p_jo_no
"
"										NULL,			--p_order_type
"
"										NULL,			--p_proj_id
"
"										0,			--p_lm_disc_amt
"
"										0,			--p_suplr_qty
"
"										NULL,			--p_mfg_date
"
"										NULL,			--p_expiry_date
"
"										NULL,			--p_subcon_suplr_id
"
"										0,			--p_subcon_bc_cost
"
"										0,			--p_subcon_lbr_cost
"
"										NULL,			--p_receipt_seq_no
"
"										NULL,			--p_terr_id
"
"										0,			--p_cust_qoh
"
"										0,			--p_qc_qty
"
"										substr('Stock increased for shearing Scrap'||'-'||p_doc_no,1,100),
"
"										substr('Stock increased for shearing Scrap'||'-'||p_doc_no,1,200),
"
"										p_prod_cls_desc        => v_prod_cls_desc ,
"
"										p_prod_sub_cls_id      => v_prod_subcls   ,
"
"										p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"										p_prod_grp_id          => v_prod_grp,
"
"										p_prod_grp_desc        => v_prod_grp_desc,
"
"										p_prod_sub_grp_id      => v_prod_subgrp,
"
"										p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"										p_prod_cls_type        => v_prod_cls_type
"
"										);
"
"
"
"				   v_sys_ls_no := NULL;
"
"
"
"
"
"				   IF func_find_prod_ser_lot_type(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev) NOT IN ('N') THEN
"
"
"
"					   OPEN c2(cr1.pceb_prod_id,cr1.pceb_prod_rev,
"
"							   func_find_deflt_storeid(p_bu,p_plnt,cr1.pcph_loc_id,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'),
"
"							   'P',cr1.pceb_lot_no);
"
"				   FETCH c2 INTO cr2;
"
"				   IF c2%FOUND THEN
"
"
"
"					  v_sys_ls_no := cr2.plsn_sys_ls_no;
"
"
"
"				   ELSIF c2%NOTFOUND THEN
"
"					 			 proc_lot_ser_operation(
"
"											p_bu,			--p_bu
"
"											v_rej_store,		--p_store_id
"
"											cr1.pceb_prod_id,		--p_prod_id
"
"											cr1.pceb_prod_rev,		--p_prod_rev
"
"											func_find_prod_ser_lot_type(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"											v_sys_ls_no,			--p_sys_ls_no
"
"											cr1.pceb_lot_no,		--p_lot_no
"
"											NULL,		--p_ser_no
"
"											'P',		--p_sou_type
"
"											func_find_deflt_storeid(p_bu,p_plnt,cr1.pcph_loc_id,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'),		--p_sou_id
"
"											TRUNC(p_doc_date),		--p_mfg_date
"
"											NULL,			--p_expiry_date
"
"											0,			--p_trans_qty
"
"											NULL,			--p_unit_cost
"
"											1,			--p_conv_factor
"
"											'I',			--p_oper_flag
"
"											TRUNC(p_doc_date),	--p_vou_date
"
"											'SFR',			--p_vou_type
"
"											NULL,			--p_vou_pfx
"
"											p_doc_no,		--p_vou_no
"
"											cr1.pceb_seq_no,			--p_vou_line_no
"
"											NULL,			--p_cons_line_no
"
"											'SFM',			--p_appl
"
"											'LOT/SERIAL Record Creation',	--p_ref1
"
"											'LS Creation through Shearing',--p_ref2
"
"											p_user,
"
"											p_thickness => cr1.pceb_thickness,
"
"											p_width    => cr1.pceb_width,
"
"						                                        p_length  =>   NVL(cr1.pceb_length ,cr1.pceb_prod_kgs)
"
"											);
"
"				   END IF;
"
"				   CLOSE c2;
"
"
"
"
"
"				    IF v_sys_ls_no IS NULL THEN
"
"
"
"						  OPEN c2(cr1.pceb_prod_id,cr1.pceb_prod_rev,
"
"						   func_find_deflt_storeid(p_bu,p_plnt,cr1.pcph_loc_id,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'),
"
"						   'P',cr1.pceb_lot_no);
"
"						  FETCH c2 INTO cr2;
"
"						  IF c2%FOUND THEN
"
"							 v_sys_ls_no := cr2.plsn_sys_ls_no;
"
"						  END IF;
"
"						  CLOSE c2;
"
"
"
"					END IF;
"
"
"
"
"
"
"
"					proc_upd_lot_ser_stocks(
"
"											p_bu, 		--p_bu
"
"											v_rej_store, 	--p_store_id
"
"											cr1.pceb_prod_id, 	--p_prod_id
"
"											cr1.pceb_prod_rev, 	--p_prod_rev
"
"											v_sys_ls_no, 	--p_sys_ls_no
"
"											cr1.pceb_accept_qty,	--p_qty_hand
"
"											0, 			--p_qty_alloc
"
"											0, 			--p_qty_transit
"
"											v_unit_cost, 		--p_unit_cost
"
"											func_find_prod_ser_lot_type(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"											cr1.pceb_lot_no, 	--p_lot_no
"
"											NULL, 	--p_ser_no
"
"											'P', --p_sou_type
"
"											func_find_deflt_storeid(p_bu,p_plnt,cr1.pcph_loc_id,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'), 	--p_sou_id
"
"											NULL,
"
"											--cr3.isbd_expiry_date, 		--p_exp_date
"
"											TRUNC(SYSDATE),		--p_vou_date
"
"											'MR', 		--p_vou_type
"
"											NULL,			--p_vou_pfx
"
"											p_doc_no,		--p_vou_no
"
"											cr1.pceb_seq_no,			--p_vou_line_no
"
"											'ICM', 		--p_appl
"
"											'RM LOT/SERIAL INCREASE', --p_ref1
"
"											'LOT/SERIAL INCREASE. FOR :'||p_doc_no ||'/'||cr1.pceb_seq_no, --p_ref2
"
"											p_user
"
"											);
"
"
"
"
"
"				END IF;
"
"
"
"				IF func_find_prod_cost_method(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev) IN ('FIFO','LIFO') THEN
"
"
"
"						proc_upd_stock_batches
"
"											(p_bu,				 --p_bu,
"
"											 v_rej_store,		 --p_store_id,
"
"											 cr1.pceb_prod_id,		 --p_prod_id,
"
"											 cr1.pceb_prod_rev,		 --p_prod_rev,
"
"											 NULL,	 --p_batch_no,
"
"											 cr1.pceb_accept_qty,		 --p_in_qty,
"
"											 0,		 		 --p_out_qty,
"
"											 0,		 		 --p_alloc_qty,
"
"											 0,				 --p_pick_qty,
"
"											 v_unit_cost,		 --p_bc_unit_cost,
"
"											 0,				 --p_fc_unit_cost,
"
"											 0,				 --p_chrg_cost,
"
"											 0,				 --p_nonchrg_cost,
"
"											 0,				 --p_land_cost,
"
"											 0,				 --p_disc_amt,
"
"											 'N',				 --p_net_disc_flag,
"
"											 TRUNC(p_doc_date),			 --p_trans_date,
"
"											 NULL,				 --p_vou_pfx,
"
"											 p_doc_no,			 --p_vou_no,
"
"											 cr1.pceb_seq_no,		 		 --p_vou_line_no,
"
"											 'PO',				 --p_ord_type,
"
"											 NULL,				 --p_ord_pfx,
"
"											 p_doc_no,			 --p_ord_no,
"
"											 cr1.pceb_seq_no,		 		 --p_ord_seq_no,
"
"											 NULL,				 --p_ord_sub_seq_no,
"
"											 func_find_product_class(p_bu,p_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev),--p_prod_cls,
"
"											 'MR',--p_source_doc,
"
"											 'ICM',				 --p_appl,
"
"											 NULL,				 --p_grn_bill_no,
"
"											 NULL,				 --p_grn_bill_date,
"
"											 NULL,				 --p_grn_dc_no,
"
"											 NULL,				 --p_grn_dc_date,
"
"											 p_user,			 --p_user,
"
"											 NULL, 				 --p_bnfry_type,
"
"											 NULL, 				 --p_bnfry_id,
"
"											p_prod_cls_desc        => v_prod_cls_desc ,
"
"											p_prod_subcls          => v_prod_subcls   ,
"
"											p_prod_subcls_desc     => v_prod_subcls_desc,
"
"											p_prod_grp             => v_prod_grp,
"
"											p_prod_grp_desc        => v_prod_grp_desc,
"
"											p_prod_subgrp          => v_prod_subgrp,
"
"											p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"											p_prod_cls_type        => v_prod_cls_type
"
"											);
"
"				END IF;
"
"
"
"
"
"				END IF;
"
"
"
"
"
"		END LOOP;
"
"
"
"
"
"	END proc_inc_scrap;
"
"
"
"	PROCEDURE proc_inc_shearing(p_bu			VARCHAR2,
"
"								p_plnt			VARCHAR2,
"
"								p_plnt_loc_id		VARCHAR2,
"
"								p_doc_no		VARCHAR2,
"
"								p_user			VARCHAR2,
"
"								p_lang			NUMBER,
"
"								p_result	OUT	VARCHAR2
"
"								)
"
"	IS
"
"
"
"	CURSOR c0
"
"	    IS
"
"        SELECT pomctrl_aod_rqrd_flag
"
"	  FROM pom_control
"
"	 WHERE pomctrl_bu 	= p_bu
"
"	   AND pomctrl_plnt 	= p_plnt;
"
"
"
"	CURSOR c1(c_aod_ctrl	VARCHAR2)
"
"	  IS
"
"	SELECT 'STD' pcph_type,
"
"	           pcph_proj_id,
"
"		   pcph_doc_date,
"
"		   pcph_task_id,
"
"		   pcph_so_pfx,
"
"		   pcph_so_no,
"
"		   pcph_so_seq_no,
"
"		   pcph_so_sub_seq_no,
"
"		   pceb_plnt,
"
"		   pceb_doc_no,
"
"		   pceb_seq_no,
"
"		   pceb_prod_id,
"
"		   pceb_prod_rev,
"
"		   pceb_store_id,
"
"		   pceb_lot_no,
"
"		   pceb_source_id,
"
"		   pceb_source_type,
"
"		   pceb_prod_qty,
"
"		   pceb_accept_qty + (CASE c_aod_ctrl WHEN 'N' THEN pceb_aod_qty ELSE 0 END) pceb_accept_qty,
"
"		   pceb_reject_qty,
"
"		   pceb_es_type,
"
"		   pceb_sel_flag,
"
"		   pceb_sel_user,
"
"		   pceb_status,
"
"		   pcph_unit_cost,
"
"		   pceb_thickness,
"
"		   pceb_width,
"
"		   pceb_length,
"
"		   pcph_mach_id,
"
"		   pcph_end_date,
"
"		   pcph_start_date,
"
"		   pcph_prodn_unit_cost,
"
"		   pcph_trans_no,
"
"		   pcph_oprn_id,
"
"		   pcph_prod_ord_no,
"
"		   pcph_sf_code,
"
"		   pcph_oprn_ln_seq,
"
"		   pceb_unit_cost,
"
"		   pceb_prod_weight,
"
"		   pceb_acpt_kgs,
"
"		   pceb_rej_kgs,
"
"		   pcph_loc_id
"
"	  FROM prod_cut_proc_hd,prod_cut_end_bits
"
"	 WHERE pcph_bu = pceb_bu
"
"	   AND pcph_plnt = pceb_plnt
"
"	   AND pcph_doc_no = pceb_doc_no
"
"	   AND pcph_bu = p_bu
"
"	   AND pcph_plnt = p_plnt
"
"	   AND pcph_doc_no = p_doc_no
"
"     UNION ALL
"
"SELECT 'AOD' pcph_type,
"
"           pcph_proj_id,
"
"           pcph_doc_date,
"
"           pcph_task_id,
"
"           pcph_so_pfx,
"
"           pcph_so_no,
"
"           pcph_so_seq_no,
"
"           pcph_so_sub_seq_no,
"
"           pceb_plnt,
"
"           pceb_doc_no,
"
"           pceb_seq_no,
"
"           pceb_prod_id,
"
"           pceb_prod_rev,
"
"           (SELECT store_id
"
"	      FROM stores
"
"             WHERE store_bu = pcph_bu
"
"	       AND store_plnt = pceb_plnt
"
"	       AND store_physical = 'A')  pceb_store_id,
"
"           pceb_lot_no,
"
"           pceb_source_id,
"
"           pceb_source_type,
"
"           pceb_prod_qty,
"
"           pceb_aod_qty,
"
"           0,
"
"           pceb_es_type,
"
"           pceb_sel_flag,
"
"           pceb_sel_user,
"
"           pceb_status,
"
"           pcph_unit_cost,
"
"           pceb_thickness,
"
"           pceb_width,
"
"           pceb_length,
"
"           pcph_mach_id,
"
"           pcph_end_date,
"
"           pcph_start_date,
"
"           pcph_prodn_unit_cost,
"
"           pcph_trans_no,
"
"           pcph_oprn_id,
"
"           pcph_prod_ord_no,
"
"           pcph_sf_code,
"
"	   pcph_oprn_ln_seq,
"
"	   pceb_unit_cost,
"
"		   pceb_prod_weight,
"
"		   pceb_acpt_kgs,
"
"		   pceb_rej_kgs,
"
"		   pcph_loc_id
"
"      FROM prod_cut_proc_hd,
"
"           prod_cut_end_bits
"
"     WHERE pcph_bu = pceb_bu
"
"       AND pcph_plnt = pceb_plnt
"
"       AND pcph_doc_no = pceb_doc_no
"
"       AND pcph_bu = p_bu
"
"       AND pcph_plnt = p_plnt
"
"       AND pcph_doc_no = p_doc_no
"
"       AND c_aod_ctrl = 'Y'
"
"       AND pceb_aod_qty >0
"
"	 ORDER BY pceb_plnt,
"
"			  pceb_doc_no,
"
"			  pceb_seq_no;
"
"
"
"	CURSOR c2 (c_store_id VARCHAR2, c_prod_id VARCHAR2, c_prod_rev NUMBER)
"
"	  IS
"
"	  SELECT stock_store_id
"
"		FROM stocks
"
"	   WHERE stock_bu 		= p_bu
"
"		 AND stock_store_id 	= c_store_id
"
"		 AND stock_prod_id 	= c_prod_id
"
"		 AND stock_prod_rev 	= c_prod_rev;
"
"
"
"
"
"	CURSOR c9(c_prod_id VARCHAR2, c_prod_rev NUMBER, c_store_id VARCHAR2,c_source_type VARCHAR2,c_lot_no VARCHAR2,
"
"		  c_thickness NUMBER, c_width NUMBER, c_length NUMBER
"
"		  )
"
"	 IS
"
"	SELECT plsn_sys_ls_no,plsn_mfg_date,plsn_expiry_date
"
"	  FROM prod_lot_ser_nos
"
"	 WHERE plsn_bu = p_bu
"
"	   AND plsn_prod_id = c_prod_id
"
"	   AND plsn_prod_rev = c_prod_rev
"
"	   AND plsn_lot_no = c_lot_no
"
"	   AND plsn_source_id = c_store_id
"
"	   AND plsn_source_type = c_source_type
"
"	   AND plsn_thickness = c_thickness
"
"	   AND plsn_width = c_width
"
"	   AND plsn_length = c_length
"
"	   AND (c_thickness > 0 OR c_width > 0 OR c_length > 0)
"
"	  UNION ALL
"
"	  SELECT plsn_sys_ls_no,
"
"	  	 plsn_mfg_date,plsn_expiry_date
"
"	  FROM prod_lot_ser_nos
"
"	 WHERE plsn_bu = p_bu
"
"	   AND plsn_prod_id = c_prod_id
"
"	   AND plsn_prod_rev = c_prod_rev
"
"	   AND plsn_lot_no = c_lot_no
"
"	   AND plsn_source_id = c_store_id
"
"	   AND plsn_source_type = c_source_type
"
"	   AND (c_thickness = 0 AND c_width = 0 AND c_length = 0);
"
"
"
"	CURSOR c_res_cost(c_res_id	VARCHAR2)
"
"	IS
"
"	SELECT mfgr_hrly_rate mfgr_hrly_cost
"
"	  FROM mfg_resources
"
"	 WHERE mfgr_bu = p_bu
"
"	   AND mfgr_plnt = p_plnt
"
"	   AND mfgr_res_id = c_res_id
"
"	   AND mfgr_res_type = 'M';
"
"
"
"	  CURSOR c10(c_prod_ord_no VARCHAR2)
"
"	  IS
"
"	  SELECT prohd_order_qty
"
"	     FROM prod_order_hd
"
"	    WHERE prohd_bu = p_bu
"
"	      AND prohd_plnt = p_plnt
"
"	      AND prohd_ord_no = c_prod_ord_no;
"
"
"
"
"
"	CURSOR c_plan
"
"	  IS
"
"	SELECT planctrl_exp_date_frm_chld_lot
"
"	  FROM planning_control
"
"	 WHERE planctrl_bu = p_bu
"
"	   AND planctrl_plnt = p_plnt;
"
"
"
"
"
"	CURSOR c_in
"
"	  IS
"
"	SELECT pcph_prod_id,pcph_prod_rev,
"
"	       pcph_lot_no,
"
"	       pcph_sys_ls_no
"
"	  FROM prod_cut_proc_hd
"
"	 WHERE pcph_bu =  p_bu
"
"	   AND pcph_plnt = p_plnt
"
"	   AND pcph_doc_no = p_doc_no;
"
"
"
"	  cr0                   c0%ROWTYPE;
"
"	  cr2			c2%ROWTYPE;
"
"	  cr9			c9%ROWTYPE;
"
"	  r_cost 		c_res_cost%ROWTYPE;
"
"	  c_plan1		c_plan%ROWTYPE;
"
"	  c_in1			c_in%ROWTYPE;
"
"	  cr10                  c10%ROWTYPE;
"
"
"
"	  v_sys_ls_no 			NUMBER;
"
"	  v_status			VARCHAR2(1);
"
"	  v_qty				NUMBER(12,3);
"
"	  v_aod_flag			VARCHAR2(10);
"
"	  v_ref1			VARCHAR2(500);
"
"	  v_line_cnt   			NUMBER;
"
"	  v_oc_insp_store   	        VARCHAR2(10);
"
"	  v_req_qty 	    	        NUMBER(12,3);
"
"	  v_rem_qty	   		NUMBER(12,3);
"
"	  v_elg_qty 	    	        NUMBER(12,3);
"
"	  v_tot_elg_qty	    	        NUMBER(12,3);
"
"	  v_batch_req_qty   	        NUMBER(12,3);
"
"	  v_batch_rem_qty   	        NUMBER(12,3);
"
"	  v_batch_elg_qty   	        NUMBER(12,3);
"
"	  v_batch_tot_elg_qty           NUMBER(12,3);
"
"	  v_req_lot_qty	    	        NUMBER(12,3);
"
"	  v_rem_lot_qty			NUMBER(12,3);
"
"	  v_elg_lot_qty 		NUMBER(12,3);
"
"	  v_elg_tot_lot_qty 	        NUMBER(12,3);
"
"	  v_res_cost			NUMBER(12,3) := 0;
"
"	  v_unit_cost			NUMBER(17,5) := 0;
"
"	  v_unit_wgt			NUMBER(12,3);
"
"          v_oth_uom_qty			NUMBER(12,3);
"
"          v_comp_qty                    NUMBER(12,3);
"
"          v_prod_cls_desc               VARCHAR2(200);
"
"	  v_prod_subcls                 VARCHAR2(10);
"
"	  v_prod_subcls_desc            VARCHAR2(200);
"
"	  v_prod_grp                    VARCHAR2(10);
"
"	  v_prod_grp_desc               VARCHAR2(50);
"
"	  v_prod_subgrp                 VARCHAR2(10);
"
"	  v_prod_subgrp_desc            VARCHAR2(50);
"
"	  v_prod_cls_type               VARCHAR2(10);
"
"	  v_expiry_date		        DATE;
"
"	  v_mfg_date		        DATE;
"
"
"
"
"
"	BEGIN
"
"
"
"
"
"		OPEN c0;
"
"	        FETCH c0 INTO cr0;
"
"		CLOSE c0;
"
"
"
"		p_result := 'N';
"
"
"
"		proc_calc_shearing_op_cost(p_bu,p_plnt,p_doc_no,p_user,p_lang);
"
"
"
"		FOR cr1 IN c1(cr0.pomctrl_aod_rqrd_flag)
"
"		LOOP
"
"
"
"		IF cr1.pcph_type = 'AOD' AND cr1.pceb_store_id IS NULL THEN
"
"		  RAISE_APPLICATION_ERROR(-20033,'ICM');
"
"        END IF;
"
"
"
"
"
"		proc_get_prod_param_det(p_bu           ,
"
"								p_plnt                 ,
"
"								cr1.pceb_prod_id       ,
"
"								cr1.pceb_prod_rev      ,
"
"								v_prod_cls_desc        ,
"
"								v_prod_subcls          ,
"
"								v_prod_subcls_desc     ,
"
"								v_prod_grp             ,
"
"								v_prod_grp_desc        ,
"
"								v_prod_subgrp          ,
"
"								v_prod_subgrp_desc     ,
"
"								v_prod_cls_type        ,
"
"								p_user                 ,
"
"								p_lang                 );
"
"
"
"			UPDATE prod_ord_oper_status
"
"			   SET pros_queue_qty = pros_queue_qty - CASE WHEN pros_queue_qty >= cr1.pceb_prod_qty THEN cr1.pceb_prod_qty ELSE pros_queue_qty END,
"
"			       pros_comp_qty = pros_comp_qty + CASE WHEN pros_queue_qty >= cr1.pceb_prod_qty THEN cr1.pceb_prod_qty ELSE pros_queue_qty END,
"
"			       pros_upd_by = p_user,
"
"			       pros_upd_date = SYSDATE
"
"			 WHERE pros_bu = p_bu
"
"			   AND pros_plnt = p_plnt
"
"			   AND pros_ord_no = cr1.pcph_prod_ord_no
"
"			   AND pros_oprn_id = cr1.pcph_oprn_id
"
"			   AND pros_sf_code = cr1.pcph_sf_code
"
"			   AND pros_trans_no = cr1.pcph_trans_no
"
"			   AND pros_prod_id = cr1.pceb_prod_id
"
"			   AND pros_prod_rev = cr1.pceb_prod_rev;
"
"
"
"			   --AND pros_queue_qty >= cr1.pceb_prod_qty;
"
"
"
"			UPDATE prod_ord_trans_record
"
"			   SET potr_queue_qty = potr_queue_qty - CASE WHEN potr_queue_qty >= cr1.pceb_prod_qty THEN cr1.pceb_prod_qty ELSE potr_queue_qty END,
"
"			       potr_comp_qty = potr_comp_qty + CASE WHEN potr_queue_qty >= cr1.pceb_prod_qty THEN cr1.pceb_prod_qty ELSE potr_queue_qty END,
"
"			       potr_upd_by = p_user,
"
"			       potr_upd_date = SYSDATE
"
"			 WHERE potr_bu = p_bu
"
"			   AND potr_plnt = p_plnt
"
"			   AND potr_ord_no = cr1.pcph_prod_ord_no
"
"			   AND potr_oprn_id = cr1.pcph_oprn_id
"
"			   AND potr_sf_code = cr1.pcph_sf_code
"
"			   AND potr_trans_no = cr1.pcph_trans_no
"
"			   AND potr_item_id =  cr1.pceb_prod_id
"
"			   AND potr_rev = cr1.pceb_prod_rev;
"
"
"
"
"
"			   --AND potr_queue_qty >= cr1.pceb_prod_qty;
"
"
"
"
"
"
"
"
"
"			   UPDATE prod_order_hd
"
"			      SET prohd_received_qty = prohd_received_qty + CASE WHEN (prohd_order_qty - prohd_received_qty) >= cr1.pceb_accept_qty THEN cr1.pceb_accept_qty ELSE (prohd_order_qty - prohd_received_qty) END,
"
"			          prohd_upd_by = p_user,
"
"			          prohd_upd_date = SYSDATE
"
"			     WHERE prohd_bu = p_bu
"
"			       AND prohd_plnt = p_plnt
"
"			       AND prohd_ord_no = cr1.pcph_prod_ord_no
"
"			       AND prohd_prod_id = cr1.pceb_prod_id
"
"			       AND prohd_prod_rev = cr1.pceb_prod_rev;
"
"
"
"				--v_oc_insp_store := func_find_store_fr_type(p_bu,cr1.pceb_plnt,cr1.pcph_loc_id,'O');
"
"
"
"			   OPEN c2(cr1.pceb_store_id,cr1.pceb_prod_id,cr1.pceb_prod_rev);
"
"			   FETCH c2 INTO cr2;
"
"			   IF c2%NOTFOUND THEN
"
"
"
"							  proc_cre_stocks(
"
"											  p_bu,
"
"											  cr1.pceb_prod_id,
"
"											  cr1.pceb_prod_rev,
"
"											  cr1.pceb_store_id,
"
"											  p_user
"
"								  );
"
"			   END IF;
"
"			   CLOSE c2;
"
"
"
"					 IF cr1.pceb_es_type = 'C' THEN
"
"							v_ref1 := 'Semi Finished Cutting'||'-'||'Quantity Increased'||'-'||cr1.pceb_doc_no||'/'||cr1.pceb_seq_no;
"
"					 ELSIF cr1.pceb_es_type = 'E' THEN
"
"							v_ref1 := 'End Bits Cutting'||'-'||'Quantity Increased'||'-'||cr1.pceb_doc_no ||'/'||cr1.pceb_seq_no;
"
"					 ELSIF cr1.pceb_es_type = 'S' THEN
"
"							v_ref1 := 'Scrap'||'-'||'Quantity Increased'||'-'||cr1.pceb_doc_no ||'/'||cr1.pceb_seq_no;
"
"					 END IF;
"
"
"
"					v_unit_cost := cr1.pceb_unit_cost;
"
"
"
"			--RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||cr1.pceb_es_type||'~'||cr1.pceb_accept_qty);
"
"
"
"					IF cr1.pceb_accept_qty > 0 THEN
"
"
"
"						proc_upd_stocks(
"
"										p_bu,
"
"										cr1.pceb_store_id,
"
"										NULL,			--p_dept_id
"
"										cr1.pceb_prod_id,	--p_prod_id
"
"										cr1.pceb_prod_rev,	--p_prod_rev
"
"										0,			--p_req_qty
"
"										0,			--p_ord_qty
"
"										(cr1.pceb_accept_qty),	--p_qoh_qty
"
"										0,			--p_allo_qty
"
"										0, 	                --p_mi_allo_qty
"
"										v_unit_cost,            --cr1.pcph_unit_cost,		--p_sc_cost
"
"										v_unit_cost,            --cr1.pcph_unit_cost,		--p_bc_cost
"
"										0,			--p_bc_disc_cost
"
"										NULL,			--p_net_disc_flag
"
"										0,			--p_land_cost
"
"										0,			--p_charge_amt
"
"										0,			--p_non_charge_amt
"
"										cr1.pceb_seq_no,	--p_seq_no
"
"										NULL,		        --p_sub_seq_no
"
"										NULL,			--p_ord_pfx
"
"										cr1.pceb_doc_no,		--p_ord_no
"
"										NULL,			--p_receipt_pfx
"
"										cr1.pceb_doc_no,			--p_receipt_no
"
"										NULL,			--p_suplr_id
"
"										func_find_year(p_bu,TRUNC(cr1.pcph_doc_date)),		        --p_year
"
"										func_find_period(p_bu,TRUNC(cr1.pcph_doc_date)),		--p_period
"
"										TRUNC(cr1.pcph_doc_date),		--p_date
"
"										NULL,			--p_cust_id
"
"										'SFM',			--p_appl
"
"										'FRM',			--p_source
"
"										NULL,			--p_rule
"
"										p_user,			--p_upd_by
"
"										SYSDATE,		--p_upd_date
"
"										NULL,			--p_sales_area
"
"										func_find_product_class(p_bu,cr1.pceb_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev),		--p_class_id
"
"										NULL,			--p_jo_no
"
"										NULL,			--p_order_type
"
"										NULL,			--p_proj_id
"
"										0,			--p_lm_disc_amt
"
"										0,			--p_suplr_qty
"
"										NULL,			--p_mfg_date
"
"										NULL,			--p_expiry_date
"
"										NULL,			--p_subcon_suplr_id
"
"										0,			--p_subcon_bc_cost
"
"										0,			--p_subcon_lbr_cost
"
"										NULL,			--p_receipt_seq_no
"
"										NULL,			--p_terr_id
"
"										0,			--p_cust_qoh
"
"										0,			--p_qc_qty
"
"										SUBSTR(v_ref1,1,100),
"
"										SUBSTR(v_ref1,1,200),
"
"										p_prod_cls_desc        => v_prod_cls_desc ,
"
"										p_prod_sub_cls_id      => v_prod_subcls   ,
"
"										p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"										p_prod_grp_id          => v_prod_grp,
"
"										p_prod_grp_desc        => v_prod_grp_desc,
"
"										p_prod_sub_grp_id      => v_prod_subgrp,
"
"										p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"										p_prod_cls_type        => v_prod_cls_type
"
"										);
"
"
"
"						        IF cr1.pcph_proj_id  IS NOT NULL AND cr1.pcph_task_id IS NOT NULL THEN
"
"
"
"							--RAISE_APPLICATION_ERROR(-20999,'HRM'||cr1.pceb_accept_qty||' / '||cr1.pceb_store_id||' / '||cr1.pceb_prod_id||' / '||cr1.pcph_unit_cost);
"
"
"
"
"
"							                                    proc_upd_so_stocks
"
"												(
"
"												  p_bu,				--P_BU
"
"												  cr1.pceb_store_id,		--P_STORE_ID
"
"												  cr1.pceb_prod_id,		--P_PROD_ID
"
"												  cr1.pceb_prod_rev,		--P_PROD_REV
"
"												  cr1.pceb_accept_qty,		--P_QTY_HAND
"
"												  0,				--P_QTY_ALLOC
"
"												  v_unit_cost,--cr1.pcph_unit_cost,		--P_UNIT_COST
"
"												  NULL,		--P_SO_PFX
"
"												  NULL,		--P_SO_NO
"
"												  NULL,		--P_SO_SEQ_NO
"
"												  NULL,	--P_SO_SUB_SEQ_NO
"
"												  TRUNC(cr1.pcph_doc_date),			--P_UPD_TRANS_DATE
"
"												  'PO',
"
"												  NULL,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  'MR',
"
"												  'SFM',
"
"												  'Material',
"
"												  substr(v_ref1,1,100),
"
"												  p_user,			--P_USER
"
"												  'P',
"
"												  cr1.pcph_proj_id ,
"
"												  cr1.pcph_task_id
"
"												 );
"
"
"
"							ELSIF cr1.pcph_so_pfx IS NOT NULL AND cr1.pcph_so_no IS NOT NULL AND cr1.pcph_so_seq_no IS NOT NULL AND cr1.pcph_so_sub_seq_no IS NOT NULL THEN
"
"
"
"								proc_upd_so_stocks
"
"												 (
"
"												  p_bu,				--P_BU
"
"												  cr1.pceb_store_id,		--P_STORE_ID
"
"												  cr1.pceb_prod_id,		--P_PROD_ID
"
"												  cr1.pceb_prod_rev,		--P_PROD_REV
"
"												  cr1.pceb_accept_qty,		--P_QTY_HAND
"
"												  0,				--P_QTY_ALLOC
"
"												  v_unit_cost,--cr1.pcph_unit_cost,		--P_UNIT_COST
"
"												  cr1.pcph_so_pfx,		--P_SO_PFX
"
"												  cr1.pcph_so_no,		--P_SO_NO
"
"												  cr1.pcph_so_seq_no,		--P_SO_SEQ_NO
"
"												  cr1.pcph_so_sub_seq_no,	--P_SO_SUB_SEQ_NO
"
"												  TRUNC(cr1.pcph_doc_date),			--P_UPD_TRANS_DATE
"
"												  'PO',
"
"												  NULL,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  'MR',
"
"												  'SFM',
"
"												  'Material',
"
"												  substr(v_ref1,1,100),
"
"												  p_user,			--P_USER
"
"												  'SO',
"
"												  NULL ,
"
"												  NULL
"
"												 );
"
"						   END IF;
"
"
"
"
"
"						IF func_find_prod_cost_method(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev) IN ('FIFO','LIFO') THEN
"
"
"
"								   proc_upd_stock_batches(
"
"														p_bu                ,
"
"														cr1.pceb_store_id ,
"
"														cr1.pceb_prod_id,
"
"														cr1.pceb_prod_rev,
"
"														NULL,
"
"														cr1.pceb_accept_qty,
"
"														0                ,
"
"														0                ,
"
"														0                ,
"
"														v_unit_cost,--cr1.pcph_unit_cost      ,
"
"														v_unit_cost,--cr1.pcph_unit_cost      ,
"
"														0                ,
"
"														0                ,
"
"														0                ,
"
"														0                ,
"
"														'N'              ,
"
"														trunc(cr1.pcph_doc_date)           ,
"
"														NULL             ,
"
"														cr1.pceb_doc_no         ,
"
"														cr1.pceb_seq_no,
"
"														'PO'          ,
"
"														NULL          ,
"
"														cr1.pceb_doc_no      ,
"
"														cr1.pceb_seq_no  ,
"
"														cr1.pceb_seq_no,
"
"														func_find_product_class(p_bu,cr1.pceb_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"														'FRM',
"
"														'SFM',
"
"														NULL     ,
"
"														SYSDATE    ,
"
"														NULL     ,
"
"														NULL    ,
"
"														p_user ,
"
"														NULL,
"
"														NULL ,
"
"														p_prod_cls_desc        => v_prod_cls_desc ,
"
"														p_prod_subcls          => v_prod_subcls   ,
"
"														p_prod_subcls_desc     => v_prod_subcls_desc,
"
"														p_prod_grp             => v_prod_grp,
"
"														p_prod_grp_desc        => v_prod_grp_desc,
"
"														p_prod_subgrp          => v_prod_subgrp,
"
"														p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"														p_prod_cls_type        => v_prod_cls_type
"
"														);
"
"						END IF;
"
"
"
"					                  v_sys_ls_no := NULL;
"
"
"
"					        IF cr1.pceb_length > 0 THEN
"
"
"
"							      --v_unit_wgt := (cr1.pceb_thickness * cr1.pceb_width * cr1.pceb_length * 7.85)/1000000;
"
"							      --v_oth_uom_qty := v_unit_wgt * cr1.pceb_accept_qty;
"
"
"
"                                                              v_unit_wgt := cr1.pceb_prod_weight;
"
"							      v_oth_uom_qty := cr1.pceb_acpt_kgs;
"
"
"
"		                                           END IF;
"
"
"
"							   IF cr1.pceb_lot_no IS NOT NULL THEN
"
"
"
"								  OPEN c9(cr1.pceb_prod_id, cr1.pceb_prod_rev, cr1.pceb_store_id,'P',cr1.pceb_lot_no,cr1.pceb_thickness,cr1.pceb_width,cr1.pceb_length);
"
"								  FETCH c9 INTO cr9;
"
"								  IF c9%NOTFOUND THEN
"
"
"
"
"
"								  	OPEN c_plan;
"
"								  	FETCH c_plan INTO c_plan1;
"
"								  	IF c_plan%NOTFOUND THEN
"
"										RAISE_APPLICATION_ERROR(-20560,'PLN');
"
"								  	END IF;
"
"								  	CLOSE c_plan;
"
"
"
"
"
"
"
"								  	IF c_plan1.planctrl_exp_date_frm_chld_lot = 'Y' THEN
"
"
"
"								  		OPEN c_in;
"
"								  		FETCH c_in INTO c_in1;
"
"								  		CLOSE c_in;
"
"
"
"								  		SELECT plsn_expiry_date,plsn_mfg_date
"
"								  		  INTO v_expiry_date,v_mfg_date
"
"								  		  FROM prod_lot_ser_nos
"
"								  		 WHERE plsn_bu = p_bu
"
"								  		   AND plsn_prod_id = c_in1.pcph_prod_id
"
"								  		   AND plsn_prod_rev = c_in1.pcph_prod_rev
"
"								  		   AND plsn_sys_ls_no = c_in1.pcph_sys_ls_no
"
"								  		   AND plsn_lot_no = c_in1.pcph_lot_no;
"
"
"
"
"
"
"
"								  	ELSE
"
"
"
"								  		v_mfg_date := cr1.pcph_doc_date;
"
"								  		v_expiry_date := func_find_prod_expiry_date(p_bu,cr1.pceb_prod_id, cr1.pceb_prod_rev,v_mfg_date);
"
"
"
"
"
"								  	END IF;
"
"
"
"									   IF v_mfg_date IS NULL THEN
"
"										v_mfg_date := cr1.pcph_doc_date;
"
"									   END IF;
"
"
"
"									   IF v_expiry_date IS NULL THEN
"
"										v_expiry_date := func_find_prod_expiry_date(p_bu,cr1.pceb_prod_id, cr1.pceb_prod_rev,v_mfg_date);
"
"
"
"								  	   END IF;
"
"
"
"
"
"
"
"
"
"
"
"									  proc_lot_ser_operation( p_bu,                	--p_bu
"
"												  cr1.pceb_store_id, 	--p_store_id
"
"												  cr1.pceb_prod_id,   	--p_prod_id
"
"												  cr1.pceb_prod_rev,  	--p_prod_rev
"
"												  func_find_prod_ser_lot_type(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"												  v_sys_ls_no,                	--p_sys_ls_no
"
"												  cr1.pceb_lot_no,      --p_lot_no
"
"												  NULL,            	--p_ser_no
"
"												  'P',                 	--p_sou_type
"
"												  cr1.pceb_store_id, 	--p_sou_id
"
"												  v_mfg_date,      	--p_mfg_date
"
"												  v_expiry_date,                	--p_expiry_date
"
"												  0,  	--p_trans_qty
"
"												  v_unit_cost,                	--p_unit_cost
"
"												  1,                   	--p_conv_factor
"
"												  'I',                  --p_oper_flag
"
"												  TRUNC(cr1.pcph_doc_date), 	--p_vou_date
"
"												  'SFR',                --p_vou_type
"
"												  NULL,                	--p_vou_pfx
"
"												  cr1.pceb_doc_no, --p_vou_noy
"
"												  NULL,                	--p_vou_line_no
"
"												  NULL,                	--p_cons_line_no
"
"												  'SFM',                --p_appl
"
"												  'LOT/SERIAL RECORD CREATION',    --p_ref1
"
"												  'LS CREATION THROUGH CRUSHING PROCESS',--p_ref2
"
"												   p_user,
"
"												   p_thickness => cr1.pceb_thickness,
"
"												   p_width    => cr1.pceb_width,
"
"												   p_length  =>   cr1.pceb_length ,
"
"												   p_oth_uom_unit_wgt => NVL(v_unit_wgt,0),
"
"												   p_oth_uom_qty  => NVL(v_oth_uom_qty,0)
"
"												);
"
"
"
"								  ELSE
"
"
"
"									 v_sys_ls_no := cr9.plsn_sys_ls_no;
"
"
"
"									 v_mfg_date := cr9.plsn_mfg_date;
"
"									 v_expiry_date := cr9.plsn_expiry_date;
"
"
"
"								  END IF;
"
"								  CLOSE c9;
"
"
"
"									IF v_sys_ls_no IS NULL THEN
"
"
"
"											 OPEN c9(cr1.pceb_prod_id, cr1.pceb_prod_rev, cr1.pceb_store_id,'P',cr1.pceb_lot_no,cr1.pceb_thickness,cr1.pceb_width,cr1.pceb_length);
"
"											 FETCH c9 INTO cr9;
"
"											 CLOSE c9;
"
"
"
"
"
"										OPEN c_plan;
"
"										FETCH c_plan INTO c_plan1;
"
"										IF c_plan%NOTFOUND THEN
"
"											RAISE_APPLICATION_ERROR(-20560,'PLN');
"
"										END IF;
"
"										CLOSE c_plan;
"
"
"
"										v_sys_ls_no := cr9.plsn_sys_ls_no;
"
"
"
"								  		IF c_plan1.planctrl_exp_date_frm_chld_lot = 'Y' THEN
"
"
"
"
"
"												OPEN c_in;
"
"												FETCH c_in INTO c_in1;
"
"												CLOSE c_in;
"
"
"
"												SELECT plsn_expiry_date,plsn_mfg_date
"
"												  INTO v_expiry_date,v_mfg_date
"
"												  FROM prod_lot_ser_nos
"
"												 WHERE plsn_bu = p_bu
"
"												   AND plsn_prod_id = c_in1.pcph_prod_id
"
"												   AND plsn_prod_rev = c_in1.pcph_prod_rev
"
"												   AND plsn_sys_ls_no = c_in1.pcph_sys_ls_no
"
"												   AND plsn_lot_no = c_in1.pcph_lot_no;
"
"
"
"
"
"										ELSE
"
"
"
"											v_mfg_date := cr1.pcph_doc_date;
"
"											v_expiry_date := func_find_prod_expiry_date(p_bu,cr1.pceb_prod_id, cr1.pceb_prod_rev,v_mfg_date);
"
"
"
"										END IF;
"
"
"
"									END IF;
"
"
"
"			  UPDATE prod_cut_end_bits
"
"				 SET pceb_sys_ls_no = v_sys_ls_no,
"
"				     pceb_source_id = func_find_deflt_storeid(p_bu,p_plnt,cr1.pcph_loc_id,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'),
"
"				     pceb_source_type = 'P',
"
"				     pceb_upd_by = p_user,
"
"				     pceb_upd_date = SYSDATE
"
"			       WHERE pceb_bu = p_bu
"
"				 AND pceb_plnt = cr1.pceb_plnt
"
"				 AND pceb_doc_no = cr1.pceb_doc_no
"
"				 AND pceb_seq_no = cr1.pceb_seq_no;
"
"
"
"			proc_upd_lot_ser_stocks(p_bu, 		--p_bu
"
"						cr1.pceb_store_id, 	--p_store_id
"
"						cr1.pceb_prod_id, 	--p_prod_id
"
"						cr1.pceb_prod_rev, 	--p_prod_rev
"
"						v_sys_ls_no, 	--p_sys_ls_no
"
"						cr1.pceb_accept_qty,	--p_qty_hand
"
"						0, 			--p_qty_alloc
"
"						0, 			--p_qty_transit
"
"						v_unit_cost,--cr1.pcph_unit_cost, 		--p_unit_cost
"
"						func_find_prod_ser_lot_type(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"						cr1.pceb_lot_no, 	--p_lot_no
"
"						NULL, 	--p_ser_no
"
"						'P',    --p_sou_type
"
"						func_find_deflt_storeid(p_bu,p_plnt,cr1.pcph_loc_id,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'), 	--p_sou_id
"
"						NULL,
"
"						--cr3.isbd_expiry_date, 		--p_exp_date
"
"						TRUNC(cr1.pcph_doc_date) ,		--p_vou_date
"
"						'MR', 		--p_vou_type
"
"						NULL,			--p_vou_pfx
"
"						p_doc_no,		--p_vou_no
"
"						cr1.pceb_seq_no,			--p_vou_line_no
"
"						'ICM', 		--p_appl
"
"						'Shearing stock increased for Output items', --p_ref1
"
"						'LOT/SERIAL INCREASE. FOR :'||p_doc_no ||'/'||cr1.pceb_seq_no, --p_ref2
"
"						p_user,
"
"						p_oth_uom_qty     => NVL(v_oth_uom_qty,0),
"
"						p_oth_uom_unit_wgt => NVL(v_unit_wgt,0)
"
"						);
"
"
"
"				 END IF;
"
"
"
"			  OPEN c10(cr1.pcph_prod_ord_no);
"
"			  FETCH c10 INTO cr10;
"
"			  CLOSE c10;
"
"
"
"			END IF;
"
"
"
"			IF cr1.pceb_reject_qty > 0 THEN
"
"
"
"						/*proc_upd_stocks(
"
"										p_bu,
"
"										func_find_store_fr_type(p_bu,p_plnt,'J'),
"
"										NULL,			--p_dept_id
"
"										cr1.pceb_prod_id,	--p_prod_id
"
"										cr1.pceb_prod_rev,	--p_prod_rev
"
"										0,			--p_req_qty
"
"										0,			--p_ord_qty
"
"										(cr1.pceb_reject_qty),	--p_qoh_qty
"
"										0,			--p_allo_qty
"
"										0, 	                --p_mi_allo_qty
"
"										v_unit_cost,            --cr1.pcph_unit_cost,		--p_sc_cost
"
"										v_unit_cost,            --cr1.pcph_unit_cost,		--p_bc_cost
"
"										0,			--p_bc_disc_cost
"
"										NULL,			--p_net_disc_flag
"
"										0,			--p_land_cost
"
"										0,			--p_charge_amt
"
"										0,			--p_non_charge_amt
"
"										cr1.pceb_seq_no,	--p_seq_no
"
"										NULL,		        --p_sub_seq_no
"
"										NULL,			--p_ord_pfx
"
"										cr1.pceb_doc_no,		--p_ord_no
"
"										NULL,			--p_receipt_pfx
"
"										cr1.pceb_doc_no,			--p_receipt_no
"
"										NULL,			--p_suplr_id
"
"										func_find_year(p_bu,TRUNC(cr1.pcph_doc_date)),		        --p_year
"
"										func_find_period(p_bu,TRUNC(cr1.pcph_doc_date)),		--p_period
"
"										TRUNC(cr1.pcph_doc_date),		--p_date
"
"										NULL,			--p_cust_id
"
"										'SFM',			--p_appl
"
"										'FRM',			--p_source
"
"										NULL,			--p_rule
"
"										p_user,			--p_upd_by
"
"										SYSDATE,		--p_upd_date
"
"										NULL,			--p_sales_area
"
"										func_find_product_class(p_bu,cr1.pceb_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev),		--p_class_id
"
"										NULL,			--p_jo_no
"
"										NULL,			--p_order_type
"
"										NULL,			--p_proj_id
"
"										0,			--p_lm_disc_amt
"
"										0,			--p_suplr_qty
"
"										NULL,			--p_mfg_date
"
"										NULL,			--p_expiry_date
"
"										NULL,			--p_subcon_suplr_id
"
"										0,			--p_subcon_bc_cost
"
"										0,			--p_subcon_lbr_cost
"
"										NULL,			--p_receipt_seq_no
"
"										NULL,			--p_terr_id
"
"										0,			--p_cust_qoh
"
"										0,			--p_qc_qty
"
"										SUBSTR(v_ref1,1,100),
"
"										SUBSTR(v_ref1,1,200),
"
"										p_prod_cls_desc        => v_prod_cls_desc ,
"
"										p_prod_sub_cls_id      => v_prod_subcls   ,
"
"										p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"										p_prod_grp_id          => v_prod_grp,
"
"										p_prod_grp_desc        => v_prod_grp_desc,
"
"										p_prod_sub_grp_id      => v_prod_subgrp,
"
"										p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"										p_prod_cls_type        => v_prod_cls_type
"
"										);*/
"
"
"
"
"
"
"
"
"
"					IF cr1.pcph_prod_ord_no IS NOT NULL THEN
"
"
"
"						proc_upd_oprn_status_qtys(
"
"												p_bu               ,
"
"												p_plnt             ,
"
"												cr1.pcph_prod_ord_no           ,
"
"												cr1.pcph_oprn_id          ,
"
"												cr1.pcph_oprn_ln_seq,
"
"												'1'          ,
"
"												0        ,
"
"												0         ,
"
"												0      ,
"
"												0          ,
"
"												0           ,
"
"												0        ,
"
"												cr1.pceb_reject_qty        ,
"
"												0       ,
"
"												0    ,
"
"												0       ,
"
"												0        ,
"
"												0      ,
"
"												0           ,
"
"												v_sys_ls_no        ,
"
"												cr1.pceb_lot_no           ,
"
"												NULL           ,
"
"												NULL            ,
"
"												'PQC'             ,
"
"												p_user             ,
"
"												NULL         ,
"
"												0      ,
"
"												'N'    ,
"
"												0 ,
"
"												'N'       ,
"
"												NULL    ,
"
"												NULL
"
"												);
"
"
"
"					END IF;
"
"
"
"						  /* IF cr1.pcph_proj_id  IS NOT NULL AND cr1.pcph_task_id IS NOT NULL THEN
"
"
"
"
"
"							  proc_upd_so_stocks
"
"												(
"
"												  p_bu,				--P_BU
"
"												  func_find_store_fr_type(p_bu,p_plnt,'J'),		--P_STORE_ID
"
"												  cr1.pceb_prod_id,		--P_PROD_ID
"
"												  cr1.pceb_prod_rev,		--P_PROD_REV
"
"												  cr1.pceb_reject_qty,		--P_QTY_HAND
"
"												  0,				--P_QTY_ALLOC
"
"												  v_unit_cost,--cr1.pcph_unit_cost,		--P_UNIT_COST
"
"												  NULL,		--P_SO_PFX
"
"												  NULL,		--P_SO_NO
"
"												  NULL,		--P_SO_SEQ_NO
"
"												  NULL,	--P_SO_SUB_SEQ_NO
"
"												  TRUNC(cr1.pcph_doc_date),			--P_UPD_TRANS_DATE
"
"												  'PO',
"
"												  NULL,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  'MR',
"
"												  'SFM',
"
"												  'Material',
"
"												  substr(v_ref1,1,100),
"
"												  p_user,			--P_USER
"
"												  'P',
"
"												  cr1.pcph_proj_id ,
"
"												  cr1.pcph_task_id
"
"												 );
"
"
"
"							ELSIF cr1.pcph_so_pfx IS NOT NULL AND cr1.pcph_so_no IS NOT NULL AND cr1.pcph_so_seq_no IS NOT NULL AND cr1.pcph_so_sub_seq_no IS NOT NULL THEN
"
"
"
"
"
"								proc_upd_so_stocks
"
"												 (
"
"												  p_bu,				--P_BU
"
"												  func_find_store_fr_type(p_bu,p_plnt,'J'),		--P_STORE_ID
"
"												  cr1.pceb_prod_id,		--P_PROD_ID
"
"												  cr1.pceb_prod_rev,		--P_PROD_REV
"
"												  cr1.pceb_reject_qty,		--P_QTY_HAND
"
"												  0,				--P_QTY_ALLOC
"
"												  v_unit_cost,--cr1.pcph_unit_cost,		--P_UNIT_COST
"
"												  cr1.pcph_so_pfx,		--P_SO_PFX
"
"												  cr1.pcph_so_no,		--P_SO_NO
"
"												  cr1.pcph_so_seq_no,		--P_SO_SEQ_NO
"
"												  cr1.pcph_so_sub_seq_no,	--P_SO_SUB_SEQ_NO
"
"												  TRUNC(cr1.pcph_doc_date),			--P_UPD_TRANS_DATE
"
"												  'PO',
"
"												  NULL,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_seq_no,
"
"												  cr1.pceb_doc_no,
"
"												  cr1.pceb_seq_no,
"
"												  'MR',
"
"												  'SFM',
"
"												  'Material',
"
"												  substr(v_ref1,1,100),
"
"												  p_user,			--P_USER
"
"												  'SO',
"
"												  NULL ,
"
"												  NULL
"
"												 );
"
"						   END IF;
"
"
"
"
"
"						IF func_find_prod_cost_method(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev) IN ('FIFO','LIFO') THEN
"
"
"
"								   proc_upd_stock_batches(
"
"														p_bu                ,
"
"														func_find_store_fr_type(p_bu,p_plnt,'J') ,
"
"														cr1.pceb_prod_id,
"
"														cr1.pceb_prod_rev,
"
"														NULL,
"
"														cr1.pceb_reject_qty,
"
"														0                ,
"
"														0                ,
"
"														0                ,
"
"														v_unit_cost,--cr1.pcph_unit_cost      ,
"
"														v_unit_cost,--cr1.pcph_unit_cost      ,
"
"														0                ,
"
"														0                ,
"
"														0                ,
"
"														0                ,
"
"														'N'              ,
"
"														TRUNC(cr1.pcph_doc_date)           ,
"
"														NULL             ,
"
"														cr1.pceb_doc_no         ,
"
"														cr1.pceb_seq_no,
"
"														'PO'          ,
"
"														NULL          ,
"
"														cr1.pceb_doc_no      ,
"
"														cr1.pceb_seq_no  ,
"
"														cr1.pceb_seq_no,
"
"														func_find_product_class(p_bu,cr1.pceb_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"														'FRM',
"
"														'SFM',
"
"														NULL     ,
"
"														SYSDATE    ,
"
"														NULL     ,
"
"														NULL    ,
"
"														p_user ,
"
"														NULL,
"
"														NULL ,
"
"														p_prod_cls_desc        => v_prod_cls_desc ,
"
"														p_prod_subcls          => v_prod_subcls   ,
"
"														p_prod_subcls_desc     => v_prod_subcls_desc,
"
"														p_prod_grp             => v_prod_grp,
"
"														p_prod_grp_desc        => v_prod_grp_desc,
"
"														p_prod_subgrp          => v_prod_subgrp,
"
"														p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"														p_prod_cls_type        => v_prod_cls_type
"
"															);
"
"						END IF;
"
"
"
"					                  v_sys_ls_no := NULL;
"
"
"
"					                   IF cr1.pceb_length > 0 THEN
"
"
"
"							      --v_unit_wgt := (cr1.pceb_thickness * cr1.pceb_width * cr1.pceb_length * 7.85)/1000000;
"
"							      --v_oth_uom_qty := v_unit_wgt * cr1.pceb_reject_qty;
"
"							      v_unit_wgt := cr1.pceb_prod_weight;
"
"							      v_oth_uom_qty := cr1.pceb_rej_kgs;
"
"
"
"		                                           END IF;
"
"
"
"							   IF cr1.pceb_lot_no IS NOT NULL THEN
"
"
"
"								  OPEN c9(cr1.pceb_prod_id, cr1.pceb_prod_rev, cr1.pceb_store_id,'P',cr1.pceb_lot_no,cr1.pceb_thickness,cr1.pceb_width,cr1.pceb_length);
"
"								  FETCH c9 INTO cr9;
"
"								  IF c9%NOTFOUND THEN
"
"
"
"
"
"
"
"								  	OPEN c_plan;
"
"								  	FETCH c_plan INTO c_plan1;
"
"								  	IF c_plan%NOTFOUND THEN
"
"										RAISE_APPLICATION_ERROR(-20560,'PLN');
"
"								  	END IF;
"
"								  	CLOSE c_plan;
"
"
"
"
"
"
"
"								  	IF c_plan1.planctrl_exp_date_frm_chld_lot = 'Y' THEN
"
"
"
"								  		OPEN c_in;
"
"								  		FETCH c_in INTO c_in1;
"
"								  		CLOSE c_in;
"
"
"
"								  		SELECT plsn_expiry_date,plsn_mfg_date
"
"								  		  INTO v_expiry_date,v_mfg_date
"
"								  		  FROM prod_lot_ser_nos
"
"								  		 WHERE plsn_bu = p_bu
"
"								  		   AND plsn_prod_id = c_in1.pcph_prod_id
"
"								  		   AND plsn_prod_rev = c_in1.pcph_prod_rev
"
"								  		   AND plsn_sys_ls_no = c_in1.pcph_sys_ls_no
"
"								  		   AND plsn_lot_no = c_in1.pcph_lot_no;
"
"
"
"
"
"
"
"								  	ELSE
"
"
"
"								  		v_mfg_date := cr1.pcph_doc_date;
"
"								  		v_expiry_date := func_find_prod_expiry_date(p_bu,cr1.pceb_prod_id, cr1.pceb_prod_rev,v_mfg_date);
"
"
"
"
"
"								  	END IF;
"
"
"
"
"
"									  proc_lot_ser_operation( p_bu,                	--p_bu
"
"															  cr1.pceb_store_id, 	--p_store_id
"
"															  cr1.pceb_prod_id,   	--p_prod_id
"
"															  cr1.pceb_prod_rev,  	--p_prod_rev
"
"															  func_find_prod_ser_lot_type(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"															  v_sys_ls_no,                	--p_sys_ls_no
"
"															  cr1.pceb_lot_no,      --p_lot_no
"
"															  NULL,            	--p_ser_no
"
"															  'P',                 	--p_sou_type
"
"															  cr1.pceb_store_id, 	--p_sou_id
"
"															  v_mfg_date,      	--p_mfg_date
"
"															  v_expiry_date,                	--p_expiry_date
"
"															  0,  	--p_trans_qty
"
"															  v_unit_cost,                	--p_unit_cost
"
"															  1,                   	--p_conv_factor
"
"															  'I',                  --p_oper_flag
"
"															  TRUNC(cr1.pcph_doc_date), 	--p_vou_date
"
"															  'SFR',                --p_vou_type
"
"															  NULL,                	--p_vou_pfx
"
"															  cr1.pceb_doc_no, --p_vou_noy
"
"															  NULL,                	--p_vou_line_no
"
"															  NULL,                	--p_cons_line_no
"
"															  'SFM',                --p_appl
"
"															  'LOT/SERIAL RECORD CREATION',    --p_ref1
"
"															  'LS CREATION THROUGH CRUSHING PROCESS',--p_ref2
"
"															   p_user,
"
"															   p_thickness => cr1.pceb_thickness,
"
"															   p_width    => cr1.pceb_width,
"
"						                                                                           p_length  =>   cr1.pceb_length ,
"
"						                                                                           p_oth_uom_unit_wgt => NVL(v_unit_wgt,0),
"
"						                                                                           p_oth_uom_qty  => NVL(v_oth_uom_qty,0)
"
"															);
"
"
"
"								  ELSE
"
"
"
"									 v_sys_ls_no := cr9.plsn_sys_ls_no;
"
"
"
"								  END IF;
"
"								  CLOSE c9;
"
"
"
"									IF v_sys_ls_no IS NULL THEN
"
"
"
"											 OPEN c9(cr1.pceb_prod_id, cr1.pceb_prod_rev, cr1.pceb_store_id,'P',cr1.pceb_lot_no,cr1.pceb_thickness,cr1.pceb_width,cr1.pceb_length);
"
"											 FETCH c9 INTO cr9;
"
"											 CLOSE c9;
"
"
"
"										v_sys_ls_no := cr9.plsn_sys_ls_no;
"
"
"
"
"
"											OPEN c_plan;
"
"											FETCH c_plan INTO c_plan1;
"
"											IF c_plan%NOTFOUND THEN
"
"												RAISE_APPLICATION_ERROR(-20560,'PLN');
"
"											END IF;
"
"											CLOSE c_plan;
"
"
"
"
"
"
"
"
"
"
"
"										IF c_plan1.planctrl_exp_date_frm_chld_lot = 'Y' THEN
"
"
"
"
"
"												OPEN c_in;
"
"												FETCH c_in INTO c_in1;
"
"												CLOSE c_in;
"
"
"
"												SELECT plsn_expiry_date,plsn_mfg_date
"
"												  INTO v_expiry_date,v_mfg_date
"
"												  FROM prod_lot_ser_nos
"
"												 WHERE plsn_bu = p_bu
"
"												   AND plsn_prod_id = c_in1.pcph_prod_id
"
"												   AND plsn_prod_rev = c_in1.pcph_prod_rev
"
"												   AND plsn_sys_ls_no = c_in1.pcph_sys_ls_no
"
"												   AND plsn_lot_no = c_in1.pcph_lot_no;
"
"
"
"
"
"										ELSE
"
"
"
"											v_mfg_date := cr1.pcph_doc_date;
"
"											v_expiry_date := func_find_prod_expiry_date(p_bu,cr1.pceb_prod_id, cr1.pceb_prod_rev,v_mfg_date);
"
"
"
"
"
"										END IF;
"
"
"
"
"
"
"
"									END IF;
"
"
"
"
"
"								      UPDATE prod_cut_end_bits
"
"									 SET pceb_sys_ls_no = v_sys_ls_no,
"
"									     pceb_source_id = func_find_deflt_storeid(p_bu,p_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'),
"
"									     pceb_source_type = 'P',
"
"									     pceb_upd_by = p_user,
"
"									     pceb_upd_date = SYSDATE
"
"								       WHERE pceb_bu = p_bu
"
"									 AND pceb_plnt = cr1.pceb_plnt
"
"									 AND pceb_doc_no = cr1.pceb_doc_no
"
"									 AND pceb_seq_no = cr1.pceb_seq_no;
"
"
"
"								proc_upd_lot_ser_stocks(
"
"														p_bu, 		--p_bu
"
"														func_find_store_fr_type(p_bu,p_plnt,'J'), 	--p_store_id
"
"														cr1.pceb_prod_id, 	--p_prod_id
"
"														cr1.pceb_prod_rev, 	--p_prod_rev
"
"														v_sys_ls_no, 	--p_sys_ls_no
"
"														cr1.pceb_reject_qty,	--p_qty_hand
"
"														0, 			--p_qty_alloc
"
"														0, 			--p_qty_transit
"
"														v_unit_cost,--cr1.pcph_unit_cost, 		--p_unit_cost
"
"														func_find_prod_ser_lot_type(p_bu,cr1.pceb_prod_id,cr1.pceb_prod_rev),
"
"														cr1.pceb_lot_no, 	--p_lot_no
"
"														NULL, 	--p_ser_no
"
"														'P',    --p_sou_type
"
"														func_find_deflt_storeid(p_bu,p_plnt,cr1.pceb_prod_id,cr1.pceb_prod_rev,'N'), 	--p_sou_id
"
"														NULL,
"
"														--cr3.isbd_expiry_date, 		--p_exp_date
"
"														TRUNC(cr1.pcph_doc_date) ,		--p_vou_date
"
"														'MR', 		--p_vou_type
"
"														NULL,			--p_vou_pfx
"
"														p_doc_no,		--p_vou_no
"
"														cr1.pceb_seq_no,			--p_vou_line_no
"
"														'ICM', 		--p_appl
"
"														'Shearing stock increased for Output items', --p_ref1
"
"														'LOT/SERIAL INCREASE. FOR :'||p_doc_no ||'/'||cr1.pceb_seq_no, --p_ref2
"
"														p_user,
"
"														p_oth_uom_qty     => NVL(v_oth_uom_qty, 0),
"
"							                                                        p_oth_uom_unit_wgt => NVL(v_unit_wgt,0)
"
"														);
"
"
"
"							   END IF;*/
"
"
"
"END IF;
"
"
"
"		   UPDATE prod_cut_end_bits
"
"			  SET pceb_status = 'P',
"
"				  pceb_upd_by = p_user,
"
"				  pceb_upd_date = SYSDATE,
"
"				  pceb_unit_cost = v_unit_cost
"
"			WHERE pceb_bu = p_bu
"
"			  AND pceb_plnt = cr1.pceb_plnt
"
"			  AND pceb_doc_no = cr1.pceb_doc_no
"
"			  AND pceb_seq_no = cr1.pceb_seq_no
"
"			  AND pceb_prod_id = cr1.pceb_prod_id
"
"			  AND pceb_prod_rev = cr1.pceb_prod_rev;
"
"
"
"		p_result := 'Y';
"
"
"
"		END LOOP;
"
"
"
"		IF p_result = 'Y' THEN
"
"
"
"		 UPDATE prod_cut_proc_hd
"
"			SET pcph_status = 'P',
"
"				pcph_upd_by = p_user,
"
"				pcph_upd_date = SYSDATE
"
"		  WHERE pcph_bu = p_bu
"
"			AND pcph_plnt = P_plnt
"
"			AND pcph_doc_no = p_doc_no;
"
"
"
"		END IF;
"
"
"
"	END	proc_inc_shearing;
"
"
"
"END pkg_shearing;"
/
