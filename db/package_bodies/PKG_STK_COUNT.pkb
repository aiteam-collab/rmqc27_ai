CREATE OR REPLACE
"PACKAGE BODY pkg_stk_count
"
"AS
"
"  PROCEDURE proc_ins_rec_frm_stk_count (p_bu           VARCHAR2,
"
"                                         p_doc_no       VARCHAR2,
"
"                                         p_store_id     VARCHAR2,
"
"                                         p_ason_date    DATE,
"
"                                         p_user         VARCHAR2,
"
"                                         p_loc_grp      VARCHAR2 DEFAULT NULL
"
"					 )
"
"  AS
"
"      v_emp_id    VARCHAR2 (10) := func_find_emp_id (p_bu, p_user);
"
"      v_ip_addr   VARCHAR2 (20) := Audit_Info.Get_Ip_Address;
"
"      v_os_user   VARCHAR2 (50) := Audit_Info.Get_Os_User;
"
"  BEGIN
"
"
"
"      DELETE stock_count_ln
"
"       WHERE scln_bu = p_bu AND scln_ord_no = p_doc_no;
"
"
"
"      INSERT INTO stock_count_ln (scln_bu,
"
"                                  scln_ord_no,
"
"                                  scln_seq_no,
"
"                                  scln_matl_type,
"
"                                  scln_store_id,
"
"                                  scln_prod_id,
"
"                                  scln_prod_rev,
"
"                                  scln_prod_cls,
"
"                                  scln_prod_subcls,
"
"                                  scln_uom,
"
"                                  scln_sys_qty,
"
"                                  scln_phy_qty,
"
"                                  scln_unit_cost,
"
"                                  scln_reference,
"
"                                  scln_cre_by,
"
"                                  scln_cre_emp_id,
"
"                                  scln_cre_ip_addr,
"
"                                  scln_cre_os_user,
"
"                                  scln_cre_date,
"
"                                  scln_bin_id,
"
"                                  scln_sys_ls_no,
"
"                                  scln_lot_no,
"
"                                  scln_prod_grp,
"
"                                  scln_prod_subgrp,
"
"                                  scln_prod_ord_no,
"
"                                  scln_sf_code,
"
"                                  scln_compld_oprn_seq,
"
"                                  scln_compld_proc_id,
"
"                                  scln_lot_type,
"
"                                  scln_serial_no,
"
"                                  scln_source_type,
"
"                                  scln_source_id,
"
"                                  scln_mfg_date,
"
"                                  scln_expiry_date)
"
"           SELECT p_bu,
"
"                  p_doc_no,
"
"                  ROW_NUMBER () OVER (ORDER BY sttr_prod_id) seq_no,
"
"                  'S',
"
"                  p_store_id,
"
"                  sttr_prod_id,
"
"                  sttr_prod_rev,
"
"                  prod_cls,
"
"                  prod_sub_cls,
"
"                  prod_uom,
"
"                  SUM (sttr_trans_qty) sys_qty,
"
"                  SUM (sttr_trans_qty) phy_cnt,
"
"                  NVL (
"
"                     (SELECT CASE WHEN SUM (t2.sttr_trans_qty) = 0
"
"                                THEN 0 ELSE  SUM ( t2.sttr_trans_qty * t2.sttr_bc_unit_cost) / SUM (t2.sttr_trans_qty) END
"
"                        FROM stock_trans t2
"
"                       WHERE     t2.sttr_bu = p_bu
"
"                             AND t2.sttr_store_id = p_store_id
"
"                             AND t2.sttr_bucket_type = 'QOH'
"
"                             AND t2.sttr_trans_date <= p_ason_date
"
"                             AND t2.sttr_prod_id = t1.sttr_prod_id
"
"                             AND t2.sttr_prod_rev = t1.sttr_prod_rev),0) unitcost,
"
"                  'STOCK COUNT',
"
"                  p_user,
"
"                  v_emp_id,
"
"                  v_ip_addr,
"
"                  v_os_user,
"
"                  SYSDATE,
"
"                  sttr_bin_id,
"
"                  sttr_sys_ls_no,
"
"                  sttr_lot_no,
"
"                  prod_group_id,
"
"                  prod_subgroup_id,
"
"                  sttr_ord_no,
"
"                  sttr_sf_code,
"
"                  NULL,
"
"                  NULL,
"
"                  sttr_lot_type,
"
"                  sttr_serial_no,
"
"                  sttr_source_type,
"
"                  sttr_source_id,
"
"                  SYSDATE,
"
"                  SYSDATE
"
"             FROM (SELECT sttr_store_id,
"
"                          sttr_prod_id,
"
"                          sttr_prod_rev,
"
"                          prod_cls,
"
"                          prod_sub_cls,
"
"                          prod_uom,
"
"                          NULL sttr_bin_id,
"
"                          NULL sttr_sys_ls_no,
"
"                          NULL sttr_lot_no,
"
"                          prod_group_id,
"
"                          prod_subgroup_id,
"
"                          NULL sttr_ord_no,
"
"                          NULL sttr_sf_code,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL sttr_lot_type,
"
"                          NULL sttr_serial_no,
"
"                          NULL sttr_source_type,
"
"                          NULL sttr_source_id,
"
"                          sttr_trans_qty
"
"                     FROM stock_trans, stores, products
"
"                    WHERE     sttr_bu = store_bu
"
"                          AND sttr_store_id = store_id
"
"                          AND prod_bu = sttr_bu
"
"                          AND prod_id = sttr_prod_id
"
"                          AND prod_rev = sttr_prod_rev
"
"                          AND sttr_bucket_type = 'QOH'
"
"                          AND sttr_bu = p_bu
"
"                          AND sttr_store_id = p_store_id
"
"                          AND store_bin_flag = 'N'
"
"                          AND prod_ser_lot_opt = 'N'
"
"                          AND sttr_trans_date <= p_ason_date
"
"                   UNION ALL
"
"                   SELECT lsst_store_id,
"
"                          lsst_prod_id,
"
"                          lsst_prod_rev,
"
"                          prod_cls,
"
"                          prod_sub_cls,
"
"                          prod_uom,
"
"                          NULL lsst_bin_id,
"
"                          lsst_sys_ls_no,
"
"                          lsst_lot_no,
"
"                          prod_group_id,
"
"                          prod_subgroup_id,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          lsst_prod_type,
"
"                          lsst_ser_no,
"
"                          lsst_source_type,
"
"                          lsst_source_id,
"
"                          lsst_trans_qty
"
"                     FROM lot_ser_stock_trans, stores, products
"
"                    WHERE     lsst_bu = store_bu
"
"                          AND lsst_store_id = store_id
"
"                          AND prod_bu = lsst_bu
"
"                          AND prod_id = lsst_prod_id
"
"                          AND prod_rev = lsst_prod_rev
"
"                          AND lsst_bu = p_bu
"
"                          AND lsst_store_id = p_store_id
"
"                          AND store_bin_flag = 'N'
"
"                          AND prod_ser_lot_opt = 'L'
"
"                          AND lsst_trans_date <= p_ason_date
"
"                   UNION ALL
"
"                   SELECT bint_store_id,
"
"                          bint_prod_id,
"
"                          bint_prod_rev,
"
"                          prod_cls,
"
"                          prod_sub_cls,
"
"                          prod_uom,
"
"                          bint_bin_id,
"
"                          bint_sys_ls_no,
"
"                          bint_lot_no,
"
"                          prod_group_id,
"
"                          prod_subgroup_id,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          bint_trans_qty
"
"                     FROM bin_trans,
"
"                          stores,
"
"                          store_bins,
"
"                          products
"
"                    WHERE     bint_bu = store_bu
"
"                          AND bint_store_id = store_id
"
"                          AND stbin_bu = bint_bu
"
"                          AND stbin_store_id = bint_store_id
"
"                          AND stbin_bin_id = bint_bin_id
"
"                          AND prod_bu = bint_bu
"
"                          AND prod_id = bint_prod_id
"
"                          AND prod_rev = bint_prod_rev
"
"                          AND bint_bu = p_bu
"
"                          AND bint_store_id = p_store_id
"
"                          AND store_bin_flag = 'Y'
"
"                          AND bint_trans_date <= p_ason_date
"
"                          AND (stbin_group_id = p_loc_grp OR p_loc_grp IS NULL)
"
"		  UNION ALL
"
"		  SELECT stsfg_store_id,
"
"		         stsfg_prod_id,
"
"			 stsfg_prod_rev,
"
"			 prod_cls,
"
"			 prod_sub_cls,
"
"			 prod_uom,
"
"			 NULL stsfg_bin_id,
"
"			 NULL stsfg_sys_ls_no,
"
"			 stsfg_lot_no,
"
"			 prod_group_id,
"
"			 prod_subgroup_id,
"
"			 stsfg_ord_no,
"
"			 stsfg_sf_code,
"
"			 NULL,
"
"			 stsfg_process_id,
"
"			 NULL,
"
"			 stsfg_serial_no,
"
"			 NULL,
"
"			 NULL,
"
"			 stsfg_trans_qty
"
"		    FROM stock_trans_sfg,
"
"                         products,
"
"                         prod_plants
"
"                     WHERE stsfg_bu = prod_bu
"
"                        AND stsfg_prod_id = prod_id
"
"                        AND stsfg_prod_rev = prod_rev
"
"                        AND stsfg_bu = p_bu
"
"                        AND stsfg_store_id = p_store_id
"
"			AND TRUNC(stsfg_trans_date) <= p_ason_date
"
"                        AND stsfg_bucket_type = 'QOH'
"
"			 ) t1
"
"         GROUP BY sttr_prod_id,
"
"                  sttr_prod_rev,
"
"                  prod_cls,
"
"                  prod_sub_cls,
"
"                  prod_uom,
"
"                  sttr_bin_id,
"
"                  sttr_sys_ls_no,
"
"                  sttr_lot_no,
"
"                  prod_group_id,
"
"                  prod_subgroup_id,
"
"		  prod_group_id,
"
"                  prod_subgroup_id,
"
"                  sttr_serial_no,
"
"                  sttr_source_id,
"
"		  sttr_lot_type,
"
"                  sttr_source_type,
"
"		  sttr_ord_no,
"
"		  sttr_sf_code;
"
"
"
"      UPDATE stock_count_ln
"
"         SET scln_unit_cost =
"
"                NVL (
"
"                   (SELECT CASE WHEN SUM (t2.sttr_trans_qty) = 0 THEN 0 ELSE SUM ( t2.sttr_trans_qty * t2.sttr_bc_unit_cost)
"
"                                 / SUM (t2.sttr_trans_qty) END
"
"                      FROM stock_trans t2
"
"                     WHERE     t2.sttr_bu = scln_bu
"
"                           AND t2.sttr_store_id = scln_store_id
"
"                           AND t2.sttr_bucket_type = 'QOH'
"
"                           AND t2.sttr_trans_date <= p_ason_date
"
"                           AND t2.sttr_prod_id = scln_prod_id
"
"                           AND t2.sttr_prod_rev = scln_prod_rev),0)
"
"       WHERE scln_bu = p_bu AND scln_ord_no = p_doc_no AND scln_unit_cost = 0;
"
"  END proc_ins_rec_frm_stk_count;
"
"
"
"  PROCEDURE proc_ins_rec_frm_stk_count_temp(p_bu           VARCHAR2,
"
"                                            p_doc_no       VARCHAR2,
"
"					    p_plnt         VARCHAR2,
"
"                                            p_store_id     VARCHAR2,
"
"                                            p_user         VARCHAR2
"
"					   )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT ROW_NUMBER () OVER (ORDER BY prod_id) seq_no,
"
"         mat_type,
"
"         prod_id,
"
"         prod_rev,
"
"         description1,
"
"         prod_uom,
"
"         prod_cls,
"
"         prod_sub_cls,
"
"         prod_group_id,
"
"         prod_subgroup_id
"
"  FROM (
"
"  SELECT 'S' mat_type,
"
"         prod_id,
"
"         prod_rev,
"
"        DECODE ( applctrl_desc_level,1,prod_desc11,NVL (prod_desc21, prod_desc11)) description1,
"
"        prod_uom,
"
"        prod_cls,
"
"        prod_sub_cls,
"
"        prod_group_id,
"
"        prod_subgroup_id
"
"      FROM products,
"
"           prod_plants,
"
"           appl_control
"
"         WHERE prod_bu = prodplnt_bu
"
"           AND prod_id = prodplnt_prod_id
"
"           AND prod_rev = prodplnt_prod_rev
"
"           AND applctrl_bu = prod_bu
"
"           AND prod_bu =  p_bu
"
"	   AND prodplnt_plnt = p_plnt
"
"           AND prod_status = 'A'
"
"	   AND prodplnt_status = 'A'
"
"          )
"
"          GROUP BY prod_id,
"
"                   prod_rev,
"
"                   description1,
"
"                   prod_uom,
"
"                   prod_cls,
"
"                   prod_sub_cls,
"
"                   prod_group_id,
"
"                   prod_subgroup_id,
"
"                   mat_type
"
"		   ;
"
"
"
"
"
"   TYPE t1 IS TABLE OF c1%ROWTYPE INDEX BY PLS_INTEGER;
"
"   cr1  t1;
"
"   BEGIN
"
"
"
"      DELETE stock_count_load_temp
"
"       WHERE sclt_bu = p_bu;
"
"
"
"    OPEN c1;
"
"	  FETCH c1  BULK COLLECT INTO cr1;
"
"	    FORALL i IN 1..cr1.COUNT()
"
"		INSERT INTO stock_count_load_temp(sclt_bu,
"
"                                                  sclt_ord_no,
"
"                                                  sclt_seq_no,
"
"                                                  sclt_matl_type,
"
"                                                  sclt_store_id,
"
"                                                  sclt_prod_id,
"
"                                                  sclt_prod_rev,
"
"                                                  sclt_uom,
"
"                                                  sclt_prod_cls,
"
"                                                  sclt_prod_subcls,
"
"                                                  sclt_prod_grp,
"
"                                                  sclt_prod_subgrp,
"
"                                                  sclt_sys_qty,
"
"                                                  sclt_sel_flag
"
"						 )
"
"					 VALUES(p_bu,
"
"						p_doc_no,
"
"						cr1(i).seq_no,
"
"						cr1(i).mat_type,
"
"						p_store_id,
"
"						cr1(i).prod_id,
"
"						cr1(i).prod_rev,
"
"						cr1(i).prod_uom,
"
"						cr1(i).prod_cls,
"
"						cr1(i).prod_sub_cls,
"
"						cr1(i).prod_group_id,
"
"						cr1(i).prod_subgroup_id,
"
"						/*cr1(i).sys_qty,*/0,
"
"						'N'
"
"						);
"
"	CLOSE c1;
"
"
"
"
"
"   END proc_ins_rec_frm_stk_count_temp;
"
"
"
"  PROCEDURE proc_ins_rec_frm_stk_count_trans(p_bu           VARCHAR2,
"
"                                             p_doc_no       VARCHAR2,
"
"                                             p_user         VARCHAR2
"
"					    )
"
"  AS
"
"  CURSOR c1 IS
"
"    SELECT *
"
"      FROM stock_count_load_temp
"
"     WHERE sclt_bu = p_bu
"
"       AND sclt_ord_no = p_doc_no
"
"       AND sclt_sel_flag = 'Y'
"
"       AND sclt_sel_user = p_user;
"
"
"
" CURSOR c2(c_store_id VARCHAR2,
"
"           c_prod_id VARCHAR2,
"
"	   c_prod_rev VARCHAR2)
"
"	   IS
"
"
"
"                          SELECT stock_matl_type,
"
"			        stock_store_id,
"
"                                stock_prod_id,
"
"                                stock_prod_rev,
"
"                                prod_desc11,
"
"                                prod_uom,
"
"                                stock_sys_ls_no,
"
"                                stock_lot_no,
"
"                                stock_ser_no,
"
"                                stock_source_type,
"
"                                stock_source_id,
"
"                                stock_bin_id,
"
"                                stock_so_type,
"
"                                stock_so_pfx,
"
"                                stock_so_no,
"
"                                stock_so_seq_no,
"
"                                stock_proj_id,
"
"                                stock_so_schld_desc,
"
"                                stock_prod_ord_no,
"
"                                stock_sf_code,
"
"                                stock_compld_oprn_seq,
"
"                                stock_compld_proc_id,
"
"                                Stk_Qty Trans_Qty,
"
"                                SYSDATE,
"
"                                prod_cls,
"
"                                prod_sub_cls,
"
"                                prod_group_id,
"
"                                prod_subgroup_id,
"
"                                heat_no,
"
"                                test_no,
"
"				expiry_date,
"
"				prod_indicator,
"
"				prod_ser_lot_opt
"
"      FROM(SELECT 'S' stock_matl_type,stock_store_id,stock_prod_id,stock_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,NULL stock_bin_id,
"
"                  'NA' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,stock_expiry_date expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM stocks, stores, products
"
"            WHERE stock_bu = store_bu
"
"              AND stock_store_id = store_id
"
"              AND prod_bu = stock_bu
"
"              AND prod_id = stock_prod_id
"
"              AND prod_rev = stock_prod_rev
"
"              AND stock_bu = p_bu
"
"              AND stock_store_id = c_store_id
"
"	      AND stock_prod_id = c_prod_id
"
"	      AND stock_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              --AND (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) > 0
"
"	   UNION ALL
"
"           SELECT 'S' sqoh_matl_type,sqoh_store_id,sqoh_prod_id,sqoh_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,
"
"		  (SELECT binstk_bin_id FROM bin_stocks WHERE binstk_bu = sqoh_bu AND binstk_store_id = sqoh_store_id
"
"		     AND binstk_prod_id = sqoh_prod_id AND binstk_prod_rev = sqoh_prod_rev
"
"		     AND binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked) > 0
"
"		     AND ROWNUM = 1) stock_bin_id,
"
"                  sqoh_type,sqoh_so_ord_pfx,sqoh_so_ord_no,sqoh_seq_no,sqoh_proj_id,sqoh_so_schld_desc,
"
"	          NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (sqoh_so_qty - (sqoh_so_alloc_qty)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM so_qty_on_hand, stores, products
"
"            WHERE sqoh_bu = store_bu
"
"              AND sqoh_store_id = store_id
"
"              AND prod_bu = sqoh_bu
"
"              AND prod_id = sqoh_prod_id
"
"              AND prod_rev = sqoh_prod_rev
"
"              AND sqoh_bu = p_bu
"
"              AND sqoh_store_id = c_store_id
"
"	      AND sqoh_prod_id = c_prod_id
"
"	      AND sqoh_prod_rev = c_prod_rev
"
"              --AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'I'
"
"              --AND (sqoh_so_qty - (sqoh_so_alloc_qty)) > 0
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,NULL lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'NA' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (lss_qty_hand - lss_qty_allocated) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM lot_ser_stocks, stores, products
"
"            WHERE lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"              AND lss_store_id = c_store_id
"
"	      AND lss_prod_id = c_prod_id
"
"	      AND lss_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt <> 'N'
"
"              --AND (lss_qty_hand - lss_qty_allocated) > 0
"
"	    --  AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"	   UNION ALL
"
"           SELECT 'S' stock_matl_type,binstk_store_id,binstk_prod_id,binstk_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,binstk_bin_id stock_bin_id,
"
"                  'NA' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM bin_stocks, stores, products
"
"            WHERE binstk_bu = store_bu
"
"              AND binstk_store_id = store_id
"
"              AND prod_bu = binstk_bu
"
"              AND prod_id = binstk_prod_id
"
"              AND prod_rev = binstk_prod_rev
"
"              AND binstk_bu = p_bu
"
"              AND binstk_store_id = c_store_id
"
"	      AND binstk_prod_id = c_prod_id
"
"	      AND binstk_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              --AND (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked)) > 0
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,bsld_bin_id lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'N' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM lot_ser_stocks,bin_serial_lot_details, stores, products
"
"            WHERE lss_bu = bsld_bu
"
"	      AND lss_store_id = bsld_store_id
"
"	      AND lss_prod_id = bsld_prod_id
"
"	      AND lss_prod_rev = bsld_prod_rev
"
"	      AND lss_sys_ls_no = bsld_sys_ls_no
"
"	      AND lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"              AND lss_store_id = c_store_id
"
"	      AND lss_prod_id = c_prod_id
"
"	      AND lss_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt <> 'N'
"
"	      AND bsld_sf_code IS NULL
"
"              --AND (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) > 0
"
"	      --AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"	   UNION ALL
"
"	   SELECT 'F' stock_matl_type,stsfs_store_id,stsfs_prod_id,stsfs_prod_rev,prod_desc11,prod_uom,
"
"	     stsfs_sys_ls_no,stsfs_lot_no,stsfs_serial_no,stsfs_source_type,stsfs_source_id,
"
"             CASE WHEN store_bin_flag = 'Y' THEN
"
"	     (SELECT binstk_bin_id
"
"	       FROM bin_stocks
"
"	      WHERE binstk_bu = stsfs_bu
"
"	        AND binstk_store_id = stsfs_store_id
"
"		AND binstk_prod_id = stsfs_prod_id
"
"		AND binstk_prod_rev = stsfs_prod_rev
"
"		AND binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked) > 0
"
"		AND binstk_sf_code IS NOT NULL
"
"		AND ROWNUM = 1) ELSE NULL END stock_bin_id,
"
"	     CASE WHEN sfsos_so_schld_desc IS NULL THEN 'NA' ELSE sfsos_type END sfsos_type,sfsos_so_prefix,sfsos_so_no,sfsos_so_seq_no,sfsos_proj_id,sfsos_so_schld_desc,
"
"	      stsfs_ord_no,stsfs_sf_code,stsfs_oprn_ln_seq_no,stsfs_process_id,
"
"	      (stsfs_qty - (stsfs_alloc_qty + stsfs_qty_transit_in)) Stk_Qty,
"
"	       prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,stsfs_expiry_date expiry_date,
"
"	       prod_indicator,prod_ser_lot_opt
"
"	      FROM store_sf_stocks,store_sf_so_stock,stores, products
"
"	    WHERE stsfs_bu = sfsos_bu(+)
"
"              AND stsfs_trans_no = sfsos_trans_no(+)
"
"	      AND stsfs_bu = store_bu
"
"              AND stsfs_store_id = store_id
"
"              AND prod_bu = stsfs_bu
"
"              AND prod_id = stsfs_prod_id
"
"              AND prod_rev = stsfs_prod_rev
"
"              AND stsfs_bu = p_bu
"
"              AND stsfs_store_id = c_store_id
"
"	      AND stsfs_prod_id = c_prod_id
"
"	      AND stsfs_prod_rev = c_prod_rev
"
"	      AND stsfs_sf_code IS NOT NULL
"
"             --AND (stsfs_qty - stsfs_alloc_qty) > 0
"
"          );
"
"
"
"
"
"      v_seq_no	NUMBER;
"
"      v_emp_id    VARCHAR2 (10) := func_find_emp_id (p_bu, p_user);
"
"      v_ip_addr   VARCHAR2 (20) := Audit_Info.Get_Ip_Address;
"
"      v_os_user   VARCHAR2 (50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"    DELETE stock_count_ln
"
"     WHERE scln_bu = p_bu
"
"       AND scln_ord_no = p_doc_no;
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      FOR cr2 IN c2(cr1.sclt_store_id,cr1.sclt_prod_id,cr1.sclt_prod_rev)
"
"      LOOP
"
"
"
"        v_seq_no := v_seq_no + 1;
"
"
"
"        INSERT INTO stock_count_ln(scln_bu,
"
"                                   scln_ord_no,
"
"                                   scln_seq_no,
"
"                                   scln_matl_type,
"
"                                   scln_store_id,
"
"                                   scln_prod_id,
"
"                                   scln_prod_rev,
"
"                                   scln_prod_cls,
"
"                                   scln_prod_subcls,
"
"                                   scln_uom,
"
"                                   scln_sys_qty,
"
"                                   scln_phy_qty,
"
"                                   scln_unit_cost,
"
"                                   scln_reference,
"
"                                   scln_cre_by,
"
"                                   scln_cre_emp_id,
"
"                                   scln_cre_ip_addr,
"
"                                   scln_cre_os_user,
"
"                                   scln_cre_date,
"
"                                   scln_bin_id,
"
"                                   scln_sys_ls_no,
"
"                                   scln_lot_no,
"
"                                   scln_prod_grp,
"
"                                   scln_prod_subgrp,
"
"                                   scln_prod_ord_no,
"
"                                   scln_sf_code,
"
"                                   scln_compld_oprn_seq,
"
"                                   scln_compld_proc_id,
"
"                                   scln_lot_type,
"
"                                   scln_serial_no,
"
"                                   scln_source_type,
"
"                                   scln_source_id,
"
"                                   scln_mfg_date,
"
"                                   scln_expiry_date,
"
"				   scln_heat_no,
"
"                                   scln_test_no,
"
"                                   scln_bin_flag,
"
"                                   scln_so_type,
"
"                                   scln_so_no,
"
"                                   scln_proj_id,
"
"                                   scln_so_schld_desc,
"
"				   scln_prod_indicator
"
"				  )
"
"		            VALUES(p_bu,
"
"                                   p_doc_no,
"
"                                   v_seq_no,
"
"                                   cr2.stock_matl_type,
"
"                                   cr1.sclt_store_id,
"
"                                   cr1.sclt_prod_id,
"
"                                   cr1.sclt_prod_rev,
"
"                                   cr1.sclt_prod_cls,
"
"                                   cr1.sclt_prod_subcls,
"
"                                   cr1.sclt_uom,
"
"                                   /*cr2.Trans_Qty,*/0,
"
"                                   0,
"
"                                   0,--Unit Cost
"
"                                   'STOCK COUNT',
"
"                                   p_user,
"
"                                   v_emp_id,
"
"                                   v_ip_addr,
"
"                                   v_os_user,
"
"                                   SYSDATE,
"
"                                   cr2.stock_bin_id,
"
"                                   cr2.stock_sys_ls_no,
"
"                                   cr2.stock_lot_no,
"
"                                   cr1.sclt_prod_grp,
"
"                                   cr1.sclt_prod_subgrp,
"
"                                   cr2.stock_prod_ord_no,
"
"                                   cr2.stock_sf_code,
"
"                                   cr2.stock_compld_oprn_seq,
"
"                                   cr2.stock_compld_proc_id,
"
"                                   cr2.prod_ser_lot_opt,
"
"                                   cr2.stock_ser_no,
"
"                                   cr2.stock_source_type,
"
"                                   cr2.stock_source_id,
"
"                                   SYSDATE,
"
"                                   (cr2.expiry_date),
"
"				   NVL(cr2.heat_no,cr2.stock_lot_no),
"
"				   NVL(cr2.test_no,cr2.stock_lot_no),
"
"				   (SELECT store_bin_flag FROM stores WHERE store_bu = p_bu AND store_id = cr1.sclt_store_id),
"
"				   cr2.stock_so_type,
"
"				   cr2.stock_so_no,
"
"				   cr2.stock_proj_id,
"
"				   cr2.stock_so_schld_desc,
"
"				   cr2.prod_indicator
"
"				  );
"
"
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"    DELETE stock_count_load_temp
"
"     WHERE sclt_bu = p_bu
"
"       AND sclt_sel_user = p_user;
"
"
"
"  END proc_ins_rec_frm_stk_count_trans;
"
"
"
"  PROCEDURE proc_upd_sys_stk_frm_stk_count(p_bu		VARCHAR2,
"
"                                           p_doc_no	VARCHAR2,
"
"                                           p_user	VARCHAR2,
"
"					   p_user_emp	VARCHAR2,
"
"					   p_date       DATE
"
"					  )
"
"  AS
"
"  CURSOR c_stk(c_store_id	VARCHAR2,
"
"               c_prod_id	VARCHAR2,
"
"	       c_prod_rev	NUMBER,
"
"	       c_prod_ord_no	VARCHAR2,
"
"	       c_sf_code	VARCHAR2,
"
"	       c_sys_ls_no	NUMBER,
"
"	       c_bin_id		VARCHAR2,
"
"	       c_so_ref		VARCHAR2) IS
"
"    SELECT Stk_Qty
"
"      FROM(SELECT 'S' stock_matl_type,stock_store_id,stock_prod_id,stock_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,NULL stock_bin_id,
"
"                  'N' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date
"
"             FROM stocks, stores, products
"
"            WHERE stock_bu = store_bu
"
"              AND stock_store_id = store_id
"
"              AND prod_bu = stock_bu
"
"              AND prod_id = stock_prod_id
"
"              AND prod_rev = stock_prod_rev
"
"              AND stock_bu = p_bu
"
"              AND stock_store_id = c_store_id
"
"	      AND stock_prod_id = c_prod_id
"
"	      AND stock_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              --AND (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) > 0
"
"           UNION ALL
"
"           SELECT 'S' sqoh_matl_type,sqoh_store_id,sqoh_prod_id,sqoh_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,
"
"		  (SELECT binstk_bin_id FROM bin_stocks WHERE binstk_bu = sqoh_bu AND binstk_store_id = sqoh_store_id
"
"		     AND binstk_prod_id = sqoh_prod_id AND binstk_prod_rev = sqoh_prod_rev
"
"		     AND binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked) > 0
"
"		     AND ROWNUM = 1) stock_bin_id,
"
"                  sqoh_type,sqoh_so_ord_pfx,sqoh_so_ord_no,sqoh_seq_no,sqoh_proj_id,sqoh_so_schld_desc,
"
"	          NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (sqoh_so_qty - (sqoh_so_alloc_qty)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date
"
"             FROM so_qty_on_hand, stores, products
"
"            WHERE sqoh_bu = store_bu
"
"              AND sqoh_store_id = store_id
"
"              AND prod_bu = sqoh_bu
"
"              AND prod_id = sqoh_prod_id
"
"              AND prod_rev = sqoh_prod_rev
"
"              AND sqoh_bu = p_bu
"
"              AND sqoh_store_id = c_store_id
"
"	      AND sqoh_prod_id = c_prod_id
"
"	      AND sqoh_prod_rev = c_prod_rev
"
"              --AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'I'
"
"              AND (sqoh_so_qty - (sqoh_so_alloc_qty)) > 0
"
"	      AND sqoh_so_schld_desc = c_so_ref
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,NULL lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'N' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (lss_qty_hand - lss_qty_allocated) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date
"
"             FROM lot_ser_stocks, stores, products
"
"            WHERE lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"              AND lss_store_id = c_store_id
"
"	      AND lss_prod_id = c_prod_id
"
"	      AND lss_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt <> 'N'
"
"              AND (lss_qty_hand - lss_qty_allocated) > 0
"
"	    --  AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"	      AND lss_sys_ls_no = c_sys_ls_no
"
"	   UNION ALL
"
"           SELECT 'S' stock_matl_type,binstk_store_id,binstk_prod_id,binstk_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,binstk_bin_id stock_bin_id,
"
"                  'N' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date
"
"             FROM bin_stocks, stores, products
"
"            WHERE binstk_bu = store_bu
"
"              AND binstk_store_id = store_id
"
"              AND prod_bu = binstk_bu
"
"              AND prod_id = binstk_prod_id
"
"              AND prod_rev = binstk_prod_rev
"
"              AND binstk_bu = p_bu
"
"              AND binstk_store_id = c_store_id
"
"	      AND binstk_prod_id = c_prod_id
"
"	      AND binstk_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              AND (binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked)) > 0
"
"	      AND binstk_bin_id = c_bin_id
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,bsld_bin_id lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'N' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date
"
"             FROM lot_ser_stocks,bin_serial_lot_details, stores, products
"
"            WHERE lss_bu = bsld_bu
"
"	      AND lss_store_id = bsld_store_id
"
"	      AND lss_prod_id = bsld_prod_id
"
"	      AND lss_prod_rev = bsld_prod_rev
"
"	      AND lss_sys_ls_no = bsld_sys_ls_no
"
"	      AND lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"              AND lss_store_id = c_store_id
"
"	      AND lss_prod_id = c_prod_id
"
"	      AND lss_prod_rev = c_prod_rev
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt <> 'N'
"
"	      AND bsld_sf_code IS NULL
"
"              AND (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) > 0
"
"	  --    AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"	      AND lss_sys_ls_no = c_sys_ls_no
"
"	      AND bsld_bin_id = c_bin_id
"
"	UNION ALL
"
"	 SELECT 'F' stock_matl_type,stsfs_store_id,stsfs_prod_id,stsfs_prod_rev,prod_desc11,prod_uom,
"
"	     stsfs_sys_ls_no,stsfs_lot_no,stsfs_serial_no,stsfs_source_type,stsfs_source_id,
"
"             NULL stock_bin_id,
"
"	     CASE WHEN sfsos_so_schld_desc IS NULL THEN 'NA' ELSE sfsos_type END sfsos_type,sfsos_so_prefix,sfsos_so_no,sfsos_so_seq_no,sfsos_proj_id,sfsos_so_schld_desc,
"
"	      stsfs_ord_no,stsfs_sf_code,stsfs_oprn_ln_seq_no,stsfs_process_id,
"
"	      (stsfs_qty - (stsfs_alloc_qty + stsfs_qty_transit_in)) Stk_Qty,
"
"	       prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,stsfs_expiry_date expiry_date
"
"	      FROM store_sf_stocks,store_sf_so_stock,stores, products
"
"	    WHERE stsfs_bu = sfsos_bu(+)
"
"              AND stsfs_trans_no = sfsos_trans_no(+)
"
"	      AND stsfs_bu = store_bu
"
"              AND stsfs_store_id = store_id
"
"              AND prod_bu = stsfs_bu
"
"              AND prod_id = stsfs_prod_id
"
"              AND prod_rev = stsfs_prod_rev
"
"              AND stsfs_bu = p_bu
"
"              AND stsfs_store_id = c_store_id
"
"	      AND stsfs_prod_id = c_prod_id
"
"	      AND stsfs_prod_rev = c_prod_rev
"
"	      AND (stsfs_ord_no = c_prod_ord_no OR (stsfs_ord_no IS NULL AND c_prod_ord_no IS NULL))
"
"	      AND stsfs_sf_code = c_sf_code
"
"	      AND (stsfs_sys_ls_no = c_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND c_sys_ls_no IS NULL))
"
"              AND (stsfs_qty - stsfs_alloc_qty) > 0
"
"          );
"
"
"
"    CURSOR c3 IS
"
"    SELECT stock_matl_type,stock_store_id,stock_prod_id,stock_prod_rev,prod_desc11,prod_uom,stock_sys_ls_no,stock_lot_no,stock_ser_no,stock_source_type,
"
"           stock_source_id,stock_bin_id,stock_so_type,stock_so_pfx,stock_so_no,stock_so_seq_no,stock_proj_id,stock_so_schld_desc,stock_prod_ord_no,
"
"	   stock_sf_code,stock_compld_oprn_seq,stock_compld_proc_id,Stk_Qty Trans_Qty,prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,
"
"	   heat_no,test_no,expiry_date,prod_indicator,prod_ser_lot_opt
"
"      FROM(SELECT 'S' stock_matl_type,stock_store_id,stock_prod_id,stock_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,NULL stock_bin_id,
"
"                  'NA' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,stock_expiry_date expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM stocks, stores, products
"
"            WHERE stock_bu = store_bu
"
"              AND stock_store_id = store_id
"
"              AND prod_bu = stock_bu
"
"              AND prod_id = stock_prod_id
"
"              AND prod_rev = stock_prod_rev
"
"              AND stock_bu = p_bu
"
"	      AND NOT EXISTS(SELECT 1
"
"	                   FROM stock_count_hd,stock_count_ln
"
"			  WHERE schd_bu = scln_bu
"
"			    AND schd_ord_no = scln_ord_no
"
"			    AND scln_bu = p_bu
"
"			    AND scln_ord_no = p_doc_no
"
"			    AND scln_store_id = stock_store_id
"
"			    AND scln_prod_id = stock_prod_id
"
"			    AND scln_prod_rev = stock_prod_rev)
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              AND (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) > 0/*Uncommended*/
"
"	   UNION ALL
"
"           SELECT 'S' sqoh_matl_type,sqoh_store_id,sqoh_prod_id,sqoh_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,
"
"		  (SELECT binstk_bin_id FROM bin_stocks WHERE binstk_bu = sqoh_bu AND binstk_store_id = sqoh_store_id
"
"		     AND binstk_prod_id = sqoh_prod_id AND binstk_prod_rev = sqoh_prod_rev
"
"		     AND binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked) > 0
"
"		     AND ROWNUM = 1) stock_bin_id,
"
"                  sqoh_type,sqoh_so_ord_pfx,sqoh_so_ord_no,sqoh_seq_no,sqoh_proj_id,sqoh_so_schld_desc,
"
"	          NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (sqoh_so_qty - (sqoh_so_alloc_qty)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM so_qty_on_hand, stores, products
"
"            WHERE sqoh_bu = store_bu
"
"              AND sqoh_store_id = store_id
"
"              AND prod_bu = sqoh_bu
"
"              AND prod_id = sqoh_prod_id
"
"              AND prod_rev = sqoh_prod_rev
"
"              AND sqoh_bu = p_bu
"
"	      AND NOT EXISTS(SELECT 1
"
"	                       FROM stock_count_hd,stock_count_ln
"
"			      WHERE schd_bu = scln_bu
"
"			        AND schd_ord_no = scln_ord_no
"
"			        AND scln_bu = p_bu
"
"			        AND scln_ord_no = p_doc_no
"
"			        AND scln_store_id = sqoh_store_id
"
"			        AND scln_prod_id = sqoh_prod_id
"
"			        AND scln_prod_rev = sqoh_prod_rev
"
"			        AND scln_so_schld_desc = sqoh_so_schld_desc)
"
"              --AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'I'
"
"              AND (sqoh_so_qty - (sqoh_so_alloc_qty)) > 0
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,NULL lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'NA' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (lss_qty_hand - lss_qty_allocated) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM lot_ser_stocks, stores, products
"
"            WHERE lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"	      AND NOT EXISTS(SELECT 1
"
"	                   FROM stock_count_hd,stock_count_ln
"
"			  WHERE schd_bu = scln_bu
"
"			    AND schd_ord_no = scln_ord_no
"
"			    AND scln_bu = p_bu
"
"			    AND scln_ord_no = p_doc_no
"
"			    AND scln_store_id = lss_store_id
"
"			    AND scln_prod_id = lss_prod_id
"
"			    AND scln_prod_rev = lss_prod_rev
"
"			    AND scln_sys_ls_no = lss_sys_ls_no)
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt <> 'N'
"
"	      AND lss_vou_date <= p_date
"
"              AND (lss_qty_hand - lss_qty_allocated) > 0/*Uncommended*/
"
"	    --  AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"	   UNION ALL
"
"           SELECT 'S' stock_matl_type,binstk_store_id,binstk_prod_id,binstk_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,binstk_bin_id stock_bin_id,
"
"                  'NA' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM bin_stocks, stores, products
"
"            WHERE binstk_bu = store_bu
"
"              AND binstk_store_id = store_id
"
"              AND prod_bu = binstk_bu
"
"              AND prod_id = binstk_prod_id
"
"              AND prod_rev = binstk_prod_rev
"
"              AND binstk_bu = p_bu
"
"	      AND NOT EXISTS(SELECT 1
"
"	                       FROM stock_count_hd,stock_count_ln
"
"			      WHERE schd_bu = scln_bu
"
"			        AND schd_ord_no = scln_ord_no
"
"			        AND scln_bu = p_bu
"
"			        AND scln_ord_no = p_doc_no
"
"			        AND scln_store_id = binstk_store_id
"
"			        AND scln_prod_id = binstk_prod_id
"
"			        AND scln_prod_rev = binstk_prod_rev
"
"			        AND scln_bin_id = binstk_bin_id)
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              AND (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked)) > 0/*Uncommended*/
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,bsld_bin_id lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'N' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date,
"
"		  prod_indicator,prod_ser_lot_opt
"
"             FROM lot_ser_stocks,bin_serial_lot_details, stores, products
"
"            WHERE lss_bu = bsld_bu
"
"	      AND lss_store_id = bsld_store_id
"
"	      AND lss_prod_id = bsld_prod_id
"
"	      AND lss_prod_rev = bsld_prod_rev
"
"	      AND lss_sys_ls_no = bsld_sys_ls_no
"
"	      AND lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"	      AND EXISTS(SELECT 1
"
"	                   FROM stock_count_hd,stock_count_ln
"
"			  WHERE schd_bu = scln_bu
"
"			    AND schd_ord_no = scln_ord_no
"
"			    AND scln_bu = p_bu
"
"			    AND scln_ord_no = p_doc_no
"
"			    AND scln_store_id = bsld_store_id
"
"			    AND scln_prod_id = bsld_prod_id
"
"			    AND scln_prod_rev = bsld_prod_rev
"
"			    AND NOT(scln_bin_id = bsld_bin_id AND scln_sys_ls_no = bsld_sys_ls_no))
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt <> 'N'
"
"	      AND bsld_sf_code IS NULL
"
"              AND (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) > 0/*Uncommended*/
"
"	      AND lss_vou_date <= p_date
"
"	      --AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"	   UNION ALL
"
"	   SELECT 'F' stock_matl_type,stsfs_store_id,stsfs_prod_id,stsfs_prod_rev,prod_desc11,prod_uom,
"
"	     stsfs_sys_ls_no,stsfs_lot_no,stsfs_serial_no,stsfs_source_type,stsfs_source_id,
"
"             CASE WHEN store_bin_flag = 'Y' THEN
"
"	     (SELECT binstk_bin_id
"
"	       FROM bin_stocks
"
"	      WHERE binstk_bu = stsfs_bu
"
"	        AND binstk_store_id = stsfs_store_id
"
"		AND binstk_prod_id = stsfs_prod_id
"
"		AND binstk_prod_rev = stsfs_prod_rev
"
"		AND binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked) > 0
"
"		AND binstk_sf_code IS NOT NULL
"
"		AND ROWNUM = 1) ELSE NULL END stock_bin_id,
"
"	     CASE WHEN sfsos_so_schld_desc IS NULL THEN 'NA' ELSE sfsos_type END sfsos_type,sfsos_so_prefix,sfsos_so_no,sfsos_so_seq_no,sfsos_proj_id,sfsos_so_schld_desc,
"
"	      stsfs_ord_no,stsfs_sf_code,stsfs_oprn_ln_seq_no,stsfs_process_id,
"
"	      (stsfs_qty - (stsfs_alloc_qty + stsfs_qty_transit_in)) Stk_Qty,
"
"	       prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,stsfs_expiry_date expiry_date,
"
"	       prod_indicator,prod_ser_lot_opt
"
"	      FROM store_sf_stocks,store_sf_so_stock,stores, products
"
"	    WHERE stsfs_bu = sfsos_bu(+)
"
"              AND stsfs_trans_no = sfsos_trans_no(+)
"
"	      AND stsfs_bu = store_bu
"
"              AND stsfs_store_id = store_id
"
"              AND prod_bu = stsfs_bu
"
"              AND prod_id = stsfs_prod_id
"
"              AND prod_rev = stsfs_prod_rev
"
"              AND stsfs_bu = p_bu
"
"	      AND EXISTS(SELECT 1
"
"	                   FROM stock_count_hd,stock_count_ln
"
"			  WHERE schd_bu = scln_bu
"
"			    AND schd_ord_no = scln_ord_no
"
"			    AND scln_bu = p_bu
"
"			    AND scln_ord_no = p_doc_no
"
"			    AND scln_store_id = stsfs_store_id
"
"			    AND scln_prod_id = stsfs_prod_id
"
"			    AND scln_prod_rev = stsfs_prod_rev)
"
"	      AND stsfs_sf_code IS NOT NULL
"
"            AND (stsfs_qty - stsfs_alloc_qty) > 0/*Uncommended*/
"
"	    AND stsfs_trans_date <= p_date
"
"          )
"
"     WHERE EXISTS(SELECT 1
"
"                    FROM stock_count_hd,stock_count_ln
"
"                   WHERE schd_bu = scln_bu
"
"		     AND schd_ord_no = scln_ord_no
"
"		     AND scln_bu = p_bu
"
"		     AND scln_ord_no = p_doc_no
"
"		     AND scln_store_id = stock_store_id
"
"		     AND scln_prod_id = stock_prod_id
"
"		     AND scln_prod_rev = stock_prod_rev);
"
"
"
"    v_seq_no		NUMBER;
"
"    v_emp_id 		VARCHAR2 (10) := func_find_emp_id (p_bu, p_user);
"
"    v_ip_addr		VARCHAR2 (20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2 (50) := Audit_Info.Get_Os_User;
"
"
"
"    v_stk		stock_count_ln.scln_sys_qty%TYPE;
"
"    v_trans_unit_cost	stock_count_ln.scln_unit_cost%TYPE;
"
"    v_sf_unit_cost      stock_count_ln.scln_unit_cost%TYPE;
"
"
"
"  BEGIN
"
"
"
"    UPDATE stock_count_ln
"
"       SET scln_sys_qty = 0
"
"     WHERE scln_bu = p_bu
"
"       AND scln_ord_no = p_doc_no
"
"       AND scln_sys_qty <> 0;
"
"
"
"    UPDATE stock_count_ln
"
"       SET scln_sys_ls_no = (SELECT lss_sys_ls_no
"
"                               FROM lot_ser_stocks
"
"			      WHERE lss_bu = scln_bu
"
"			        AND lss_store_id = scln_store_id
"
"				AND lss_prod_id = scln_prod_id
"
"				AND lss_prod_rev = scln_prod_rev
"
"				AND lss_ser_no = TRIM(scln_serial_no))
"
"     WHERE scln_bu = p_bu
"
"       AND scln_ord_no = p_doc_no
"
"       AND scln_sys_ls_no IS NULL
"
"       AND scln_serial_no IS NOT NULL;
"
"
"
"    UPDATE stock_count_ln
"
"       SET scln_sys_ls_no = (SELECT MAX(lss_sys_ls_no)
"
"                               FROM lot_ser_stocks
"
"			      WHERE lss_bu = scln_bu
"
"			        AND lss_store_id = scln_store_id
"
"				AND lss_prod_id = scln_prod_id
"
"				AND lss_prod_rev = scln_prod_rev
"
"				AND lss_lot_no = TRIM(scln_lot_no))
"
"     WHERE scln_bu = p_bu
"
"       AND scln_ord_no = p_doc_no
"
"       AND scln_sys_ls_no IS NULL
"
"       AND scln_lot_no IS NOT NULL;
"
"
"
"    UPDATE stock_count_ln
"
"       SET scln_expiry_date = (SELECT lss_expiry_date
"
"                                 FROM lot_ser_stocks
"
"			        WHERE lss_bu = scln_bu
"
"			          AND lss_store_id = scln_store_id
"
"				  AND lss_prod_id = scln_prod_id
"
"				  AND lss_prod_rev = scln_prod_rev
"
"				  AND lss_sys_ls_no = scln_sys_ls_no)
"
"     WHERE scln_bu = p_bu
"
"       AND scln_ord_no = p_doc_no
"
"       AND scln_expiry_date IS NULL
"
"       AND scln_sys_ls_no IS NOT NULL;
"
"
"
"    FOR cr1 IN (SELECT *
"
"                  FROM stock_count_hd,stock_count_ln
"
"		 WHERE schd_bu = scln_bu
"
"		   AND schd_ord_no = scln_ord_no
"
"		   AND scln_bu = p_bu
"
"		   AND scln_ord_no = p_doc_no
"
"		  ORDER BY scln_seq_no
"
"		  )
"
"    LOOP
"
"
"
"      v_stk := 0;
"
"
"
"      OPEN c_stk(cr1.scln_store_id,cr1.scln_prod_id,cr1.scln_prod_rev,cr1.scln_prod_ord_no,cr1.scln_sf_code,
"
"                 cr1.scln_sys_ls_no,cr1.scln_bin_id,cr1.scln_so_schld_desc);
"
"      FETCH c_stk INTO v_stk;
"
"      CLOSE c_stk;
"
"
"
"
"
"      IF cr1.scln_matl_type ='S' THEN
"
"
"
"        BEGIN
"
"          SELECT CASE WHEN SUM(sttr_trans_qty) = 0 THEN 0 ELSE (SUM(sttr_trans_qty * sttr_bc_unit_cost)/SUM(sttr_trans_qty)) END INTO v_trans_unit_cost
"
"            FROM stock_trans
"
"           WHERE sttr_bu = p_bu
"
"             AND sttr_store_id = cr1.scln_store_id
"
"             AND sttr_prod_id = cr1.scln_prod_id
"
"	     AND sttr_prod_rev = cr1.scln_prod_rev
"
"	     AND sttr_bucket_type = 'QOH'
"
"	     AND TRUNC(sttr_trans_date) <= TRUNC(cr1.schd_count_date);
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          v_trans_unit_cost := 0;
"
"        END;
"
"
"
"      ELSIF cr1.scln_matl_type ='F' THEN
"
"
"
"
"
"        BEGIN
"
"          SELECT NVL(stsfs_unit_cost, 0) INTO v_sf_unit_cost
"
"            FROM store_sf_stocks
"
"           WHERE stsfs_bu = p_bu
"
"             AND stsfs_store_id = cr1.scln_store_id
"
"             AND stsfs_prod_id =  cr1.scln_prod_id
"
"             AND stsfs_prod_rev =  cr1.scln_prod_rev
"
"             AND (stsfs_ord_no = cr1.scln_prod_ord_no OR (stsfs_ord_no IS NULL AND cr1.scln_prod_ord_no IS NULL))
"
"             AND stsfs_sf_code = cr1.scln_sf_code
"
"             AND (stsfs_sys_ls_no = cr1.scln_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND cr1.scln_sys_ls_no IS NULL));
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          v_sf_unit_cost := 0;
"
"        END;
"
"
"
"      END IF;
"
"
"
"      BEGIN
"
"        UPDATE stock_count_ln
"
"           SET scln_sys_qty = NVL(v_stk,0),
"
"	       scln_unit_cost = CASE WHEN cr1.scln_matl_type = 'F' THEN NVL(v_sf_unit_cost,0) ELSE NVL(v_trans_unit_cost,0) END,
"
"               scln_upd_by = p_user,
"
"               scln_upd_emp_id = p_user_emp,
"
"               scln_upd_date = SYSDATE
"
"         WHERE scln_bu = p_bu
"
"           AND scln_ord_no = p_doc_no
"
"           AND scln_seq_no = cr1.scln_seq_no
"
"           AND scln_prod_id = cr1.scln_prod_id
"
"           AND scln_prod_rev = cr1.scln_prod_rev;
"
"      END;
"
"
"
"    END LOOP;
"
"
"
"
"
"    SELECT NVL(MAX(scln_seq_no),0) INTO v_seq_no
"
"      FROM stock_count_ln
"
"     WHERE scln_bu = p_bu
"
"       AND scln_ord_no = p_doc_no;
"
"
"
"    FOR cr3 IN c3
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"
"
" IF cr3.stock_matl_type ='S' THEN
"
"
"
"        BEGIN
"
"          SELECT CASE WHEN SUM(sttr_trans_qty) = 0 THEN 0 ELSE (SUM(sttr_trans_qty * sttr_bc_unit_cost)/SUM(sttr_trans_qty)) END INTO v_trans_unit_cost
"
"            FROM stock_trans
"
"           WHERE sttr_bu = p_bu
"
"             AND sttr_store_id = cr3.stock_store_id
"
"             AND sttr_prod_id = cr3.stock_prod_id
"
"	     AND sttr_prod_rev = cr3.stock_prod_rev
"
"	     AND TRUNC(sttr_trans_date) <= TRUNC(/*cr1.schd_count_date*/SYSDATE);
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          v_trans_unit_cost := 0;
"
"        END;
"
"
"
"      ELSIF cr3.stock_matl_type ='F' THEN
"
"
"
"
"
"        BEGIN
"
"          SELECT NVL(stsfs_unit_cost, 0) INTO v_sf_unit_cost
"
"            FROM store_sf_stocks
"
"           WHERE stsfs_bu = p_bu
"
"             AND stsfs_store_id   = cr3.stock_store_id
"
"             AND stsfs_prod_id    =  cr3.stock_prod_id
"
"             AND stsfs_prod_rev   =  cr3.stock_prod_rev
"
"             AND (stsfs_ord_no    = cr3.stock_prod_ord_no OR (stsfs_ord_no IS NULL AND cr3.stock_prod_ord_no IS NULL))
"
"             AND stsfs_sf_code    = cr3.stock_sf_code
"
"             AND (stsfs_sys_ls_no = cr3.stock_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND cr3.stock_sys_ls_no IS NULL));
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          v_sf_unit_cost := 0;
"
"        END;
"
"
"
"END IF;
"
"
"
"
"
"
"
"
"
"      INSERT INTO stock_count_ln(scln_bu,
"
"                                 scln_ord_no,
"
"                                 scln_seq_no,
"
"                                 scln_matl_type,
"
"                                 scln_store_id,
"
"                                 scln_prod_id,
"
"                                 scln_prod_rev,
"
"                                 scln_prod_cls,
"
"                                 scln_prod_subcls,
"
"                                 scln_uom,
"
"                                 scln_sys_qty,
"
"                                 scln_phy_qty,
"
"                                 scln_unit_cost,
"
"                                 scln_reference,
"
"                                 scln_cre_by,
"
"                                 scln_cre_emp_id,
"
"                                 scln_cre_ip_addr,
"
"                                 scln_cre_os_user,
"
"                                 scln_cre_date,
"
"                                 scln_bin_id,
"
"                                 scln_sys_ls_no,
"
"                                 scln_lot_no,
"
"                                 scln_prod_grp,
"
"                                 scln_prod_subgrp,
"
"                                 scln_prod_ord_no,
"
"                                 scln_sf_code,
"
"                                 scln_compld_oprn_seq,
"
"                                 scln_compld_proc_id,
"
"                                 scln_lot_type,
"
"                                 scln_serial_no,
"
"                                 scln_source_type,
"
"                                 scln_source_id,
"
"                                 scln_mfg_date,
"
"                                 scln_expiry_date,
"
"				 scln_heat_no,
"
"                                 scln_test_no,
"
"                                 scln_bin_flag,
"
"                                 scln_so_type,
"
"                                 scln_so_no,
"
"                                 scln_proj_id,
"
"                                 scln_so_schld_desc,
"
"				 scln_prod_indicator,
"
"				 scln_rec_source
"
"				)
"
"		          VALUES(p_bu,
"
"                                 p_doc_no,
"
"                                 v_seq_no,
"
"                                 cr3.stock_matl_type,
"
"                                 cr3.stock_store_id,
"
"                                 cr3.stock_prod_id,
"
"                                 cr3.stock_prod_rev,
"
"                                 cr3.prod_cls,
"
"                                 cr3.prod_sub_cls,
"
"                                 cr3.prod_uom,
"
"                                 cr3.Trans_Qty,
"
"                                 0,
"
"                                 CASE WHEN cr3.stock_matl_type = 'F' THEN NVL(v_sf_unit_cost,0) ELSE NVL(v_trans_unit_cost,0) END,--Unit Cost
"
"                                 'STOCK COUNT',
"
"                                 p_user,
"
"                                 v_emp_id,
"
"                                 v_ip_addr,
"
"                                 v_os_user,
"
"                                 SYSDATE,
"
"                                 cr3.stock_bin_id,
"
"                                 cr3.stock_sys_ls_no,
"
"                                 cr3.stock_lot_no,
"
"                                 cr3.prod_group_id,
"
"                                 cr3.prod_subgroup_id,
"
"                                 cr3.stock_prod_ord_no,
"
"                                 cr3.stock_sf_code,
"
"                                 cr3.stock_compld_oprn_seq,
"
"                                 cr3.stock_compld_proc_id,
"
"                                 cr3.prod_ser_lot_opt,
"
"                                 cr3.stock_ser_no,
"
"                                 cr3.stock_source_type,
"
"                                 cr3.stock_source_id,
"
"                                 SYSDATE,
"
"                                 (cr3.expiry_date),
"
"				 NVL(cr3.heat_no,cr3.stock_lot_no),
"
"				 NVL(cr3.test_no,cr3.stock_lot_no),
"
"				 (SELECT store_bin_flag FROM stores WHERE store_bu = p_bu AND store_id = cr3.stock_store_id),
"
"				 cr3.stock_so_type,
"
"				 cr3.stock_so_no,
"
"				 cr3.stock_proj_id,
"
"				 cr3.stock_so_schld_desc,
"
"				 cr3.prod_indicator,
"
"				 'SC'
"
"				);
"
"    END LOOP;
"
"
"
"    FOR cr1 IN (SELECT scln_seq_no,scln_sys_qty,scln_phy_qty,scln_unit_cost
"
"		  FROM stock_count_ln
"
"		 WHERE scln_bu = p_bu
"
"		   AND scln_ord_no = p_doc_no)
"
"    LOOP
"
"      IF cr1.scln_sys_qty > cr1.scln_phy_qty THEN
"
"
"
"        UPDATE stock_count_ln
"
"           SET scln_shortage_qty = (cr1.scln_sys_qty - cr1.scln_phy_qty),
"
"	       scln_shortage_value = (cr1.scln_sys_qty - cr1.scln_phy_qty) * cr1.scln_unit_cost,
"
"	       scln_overage_qty = 0,
"
"	       scln_overage_value = 0
"
"	 WHERE scln_bu = p_bu
"
"           AND scln_ord_no = p_doc_no
"
"           AND scln_seq_no = cr1.scln_seq_no;
"
"
"
"     ELSIF cr1.scln_phy_qty > cr1.scln_sys_qty THEN
"
"
"
"        UPDATE stock_count_ln
"
"           SET scln_shortage_qty = 0,
"
"	       scln_shortage_value = 0,
"
"	       scln_overage_qty = (cr1.scln_phy_qty - cr1.scln_sys_qty),
"
"	       scln_overage_value = (cr1.scln_phy_qty - cr1.scln_sys_qty) * cr1.scln_unit_cost
"
"	 WHERE scln_bu = p_bu
"
"           AND scln_ord_no = p_doc_no
"
"           AND scln_seq_no = cr1.scln_seq_no;
"
"
"
"     ELSE
"
"
"
"       UPDATE stock_count_ln
"
"           SET scln_shortage_qty = 0,
"
"	       scln_shortage_value = 0,
"
"	       scln_overage_qty = 0,
"
"	       scln_overage_value = 0
"
"	 WHERE scln_bu = p_bu
"
"           AND scln_ord_no = p_doc_no
"
"           AND scln_seq_no = cr1.scln_seq_no;
"
"
"
"     END IF;
"
"
"
"        UPDATE stock_count_hd
"
"           SET schd_upd_count = 'Y'
"
"	 WHERE schd_bu = p_bu
"
"           AND schd_ord_no = p_doc_no;
"
"
"
"    END LOOP;
"
"
"
"  END proc_upd_sys_stk_frm_stk_count;
"
"
"
"  PROCEDURE proc_post_stk_frm_stk_count(p_bu		VARCHAR2,
"
"                                        p_doc_no	VARCHAR2,
"
"                                        p_user		VARCHAR2,
"
"                                        p_user_emp	VARCHAR2
"
"                                       )
"
"  AS
"
"
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM stock_count_hd,stock_count_ln,products
"
"   WHERE schd_bu = scln_bu
"
"     AND schd_ord_no = scln_ord_no
"
"     AND prod_bu = scln_bu
"
"     AND prod_id = scln_prod_id
"
"     AND prod_rev = scln_prod_rev
"
"     AND scln_bu = p_bu
"
"     AND scln_ord_no = p_doc_no
"
"     AND (scln_phy_qty - scln_sys_qty) <> 0
"
"   ORDER BY scln_seq_no;
"
"
"
"    v_sys_ls_no		NUMBER(15);
"
"    v_stk_qty		NUMBER(12,3);
"
"    v_stk_batch_no	NUMBER(5);
"
"
"
"    v_cb_bal_qty	NUMBER(12,3);
"
"    v_cb_upd_qty	NUMBER(12,3);
"
"    v_prod_ord_no       VARCHAR2(30);
"
"    v_res               VARCHAR2(100);
"
"
"
"  BEGIN
"
"
"
"    FOR r_scl IN (SELECT *
"
"		    FROM stock_count_hd,stock_count_ln,products
"
"		   WHERE schd_bu = scln_bu
"
"		     AND schd_ord_no = scln_ord_no
"
"		     AND prod_bu = scln_bu
"
"		     AND prod_id = scln_prod_id
"
"		     AND prod_rev = scln_prod_rev
"
"		     AND scln_bu = p_bu
"
"		     AND scln_ord_no = p_doc_no
"
"		     AND scln_lot_type <> 'N'
"
"		     AND (scln_phy_qty - scln_sys_qty) > 0
"
"		     AND scln_matl_type = 'S'
"
"		     AND scln_new_sys_ls_no IS NULL
"
"		   ORDER BY scln_seq_no)
"
"    LOOP
"
"      v_sys_ls_no := NULL;
"
"      proc_lot_ser_operation(p_bu,
"
"			     r_scl.scln_store_id,
"
"			     r_scl.scln_prod_id,
"
"			     r_scl.scln_prod_rev,
"
"			     r_scl.scln_lot_type,
"
"			     v_sys_ls_no,
"
"			     r_scl.scln_lot_no,
"
"			     r_scl.scln_serial_no,
"
"			     NVL(r_scl.scln_source_type,'N'),
"
"			     r_scl.scln_source_id,
"
"			     NVL(r_scl.scln_mfg_date,r_scl.schd_count_date),
"
"			     r_scl.scln_expiry_date,
"
"			     (r_scl.scln_phy_qty - r_scl.scln_sys_qty),
"
"			     r_scl.scln_unit_cost,
"
"			     1,
"
"			     'G',
"
"			     r_scl.schd_count_date,
"
"			     'IC',
"
"			     NULL,
"
"			     r_scl.scln_ord_no,
"
"			     r_scl.scln_seq_no,
"
"			     r_scl.scln_seq_no,
"
"			     'ICM',
"
"			     'Stock Count'||' '||r_scl.scln_ord_no,
"
"			     NULL,
"
"			     p_user,
"
"			     p_heat_no => r_scl.scln_heat_no,
"
"		             p_test_no => r_scl.scln_test_no
"
"			    );
"
"
"
"    END LOOP;
"
"
"
"
"
"
"
"    FOR r_hd IN (SELECT * FROM stock_count_hd WHERE schd_bu = p_bu AND schd_ord_no = p_doc_no)
"
"    LOOP
"
"      --  Raise_Application_Error(-20999,'HRM'||'-'||r_hd.schd_plnt||'-'||r_hd.schd_plnt_loc_id||'-'||r_hd.schd_ord_no);
"
"      proc_cre_prod_ord_stk_cnt(p_bu,r_hd.schd_plnt,r_hd.schd_plnt_loc_id,r_hd.schd_ord_no,p_user,1,v_res,v_prod_ord_no);
"
"    END LOOP;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_stk_qty := cr1.scln_phy_qty - cr1.scln_sys_qty;
"
"
"
"      IF cr1.scln_matl_type = 'S' THEN
"
"
"
"        proc_upd_stocks(p_bu,
"
"                        cr1.scln_store_id,
"
"			NULL,
"
"                        cr1.scln_prod_id,
"
"                        cr1.scln_prod_rev,
"
"                        0,
"
"                        0,
"
"                        v_stk_qty,
"
"                        0,
"
"                        0,
"
"                        cr1.scln_unit_cost,
"
"                        cr1.scln_unit_cost,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        cr1.scln_seq_no,
"
"                        0,
"
"                        NULL,
"
"                        cr1.scln_ord_no,
"
"                        NULL,
"
"                        cr1.scln_ord_no,
"
"                        NULL,
"
"                        cr1.schd_year,
"
"                        cr1.schd_period,
"
"                        cr1.schd_count_date,
"
"                        NULL,
"
"                        'ICM',
"
"                        'IC',
"
"                        NULL,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        NULL,
"
"                        cr1.scln_prod_cls,
"
"                        cr1.scln_ord_no,
"
"                        'IC',
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"			cr1.schd_count_date,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        p_qc_qty => 0,
"
"                        p_ref1 => cr1.schd_reference,
"
"                        p_ref2 => 'STOCK COUNT',
"
"		        p_prod_cls_desc => cr1.scln_prod_cls_desc,
"
"		        p_prod_sub_cls_id => cr1.scln_prod_subcls,
"
"		        p_prod_sub_cls_desc => cr1.scln_prod_subcls_desc,
"
"		        p_prod_grp_id	 => cr1.scln_prod_grp,
"
"		        p_prod_grp_desc => cr1.scln_prod_grp_desc,
"
"		        p_prod_sub_grp_id => cr1.scln_prod_subgrp,
"
"		        p_prod_sub_grp_desc => cr1.scln_prod_subgrp_desc,
"
"		        p_prod_cls_type => cr1.scln_prod_cls_type
"
"                       );
"
"
"
"        IF cr1.scln_so_no IS NOT NULL OR cr1.scln_proj_id IS NOT NULL THEN
"
"
"
"          proc_upd_so_stocks(p_bu,
"
"	  		     cr1.scln_store_id,
"
"	  		     cr1.scln_prod_id,
"
"	  		     cr1.scln_prod_rev,
"
"	  		     v_stk_qty,
"
"	  		     0,
"
"	  		     cr1.scln_unit_cost,
"
"	  		     NULL,
"
"	  		     cr1.scln_so_no,
"
"	  		     NULL,
"
"	  		     NULL,
"
"	  		     cr1.schd_count_date,
"
"	  		     'IC',
"
"	  		     NULL,
"
"	  		     cr1.scln_ord_no,
"
"	  		     NULL,
"
"	  		     NULL,
"
"	  		     cr1.scln_ord_no,
"
"	  		     cr1.scln_seq_no,
"
"	  		     'IC',
"
"	  		     'ICM',
"
"	  		     cr1.schd_reference,
"
"	  		     'STOCK COUNT',
"
"	  		     p_user,
"
"	  		     cr1.scln_so_type,
"
"	  		     cr1.scln_proj_id,
"
"	  		     NULL,
"
"			     0,
"
"			     p_so_prj_schld_desc => NVL(cr1.scln_so_schld_desc,cr1.scln_so_no)
"
"	  		    );
"
"
"
"        END IF;
"
"
"
"	IF cr1.prod_cost_method <> 'MAC' THEN
"
"
"
"	  IF v_stk_qty > 0 THEN
"
"
"
"	    proc_upd_stock_batches(p_bu,
"
"	                           cr1.scln_store_id,
"
"	                           cr1.scln_prod_id,
"
"	                           cr1.scln_prod_rev,
"
"	                           NULL,
"
"	                           v_stk_qty,
"
"	                           0,
"
"	                           0,
"
"	                           0,
"
"	                           cr1.scln_unit_cost,
"
"	                           cr1.scln_unit_cost,
"
"	                           0,
"
"	                           0,
"
"	                           0,
"
"	                           0,
"
"	                           'N',
"
"	                           cr1.schd_count_date,
"
"	                           NULL,
"
"	                           cr1.scln_ord_no,
"
"	                           cr1.scln_seq_no,
"
"	                           'MI',
"
"	                           NULL,
"
"	                           cr1.scln_ord_no,
"
"	                           cr1.scln_seq_no,
"
"	                           NULL,
"
"	                           cr1.scln_prod_cls,
"
"	                           'IC',
"
"	                           'ICM',
"
"	                           NULL,
"
"	                           NULL,
"
"	                           NULL,
"
"	                           NULL,
"
"	                           p_user,
"
"				   p_prod_cls_desc => cr1.scln_prod_cls_desc,
"
"				   p_prod_subcls => cr1.scln_prod_subcls,
"
"				   p_prod_subcls_desc => cr1.scln_prod_subcls_desc,
"
"				   p_prod_grp => cr1.scln_prod_grp,
"
"				   p_prod_grp_desc => cr1.scln_prod_grp_desc,
"
"				   p_prod_subgrp => cr1.scln_prod_subgrp,
"
"				   p_prod_subgrp_desc => cr1.scln_prod_subgrp_desc,
"
"				   p_prod_cls_type => cr1.scln_prod_cls_type,
"
"				   p_sys_ls_no => cr1.scln_sys_ls_no
"
"	                          );
"
"
"
"	    IF cr1.prod_ser_lot_opt <> 'N' AND cr1.prod_cb_level = 'L' THEN
"
"
"
"	      SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	        FROM stocks_batches
"
"	       WHERE sb_bu = p_bu
"
"	         AND sb_store_id = cr1.scln_store_id
"
"	         AND sb_prod_id = cr1.scln_prod_id
"
"	         AND sb_prod_rev = cr1.scln_prod_rev
"
"	         AND sb_receipt_pfx IS NULL
"
"	         AND sb_po_no = cr1.scln_ord_no
"
"	         AND sb_receipt_seq_no = cr1.scln_seq_no;
"
"
"
"	      proc_upd_ls_stk_batch(p_bu,cr1.scln_store_id,cr1.scln_prod_id,cr1.scln_prod_rev,cr1.scln_sys_ls_no,v_stk_batch_no,v_stk_qty,p_user);
"
"
"
"	    END IF;
"
"
"
"	  ELSE
"
"
"
"	    v_cb_bal_qty := ABS(v_stk_qty);
"
"
"
"	    IF cr1.prod_cb_level = 'L' THEN
"
"
"
"	      FOR r_cb IN (SELECT sb_batch_id,sb_bc_unit_cost,SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) stk_qty
"
"                             FROM stocks_batches
"
"                            WHERE sb_bu = p_bu
"
"                              AND sb_store_id = cr1.scln_store_id
"
"                              AND sb_prod_id = cr1.scln_prod_id
"
"                              AND sb_prod_rev = cr1.scln_prod_rev
"
"                              AND EXISTS(SELECT 1
"
"                                           FROM ls_stk_batch_dtls
"
"                                          WHERE lssbd_bu = sb_bu
"
"                                            AND lssbd_store_id = sb_store_id
"
"                                            AND lssbd_prod_id = sb_prod_id
"
"                                            AND lssbd_prod_rev = sb_prod_rev
"
"                                            AND lssbd_sys_ls_no = cr1.scln_sys_ls_no
"
"                                            AND lssbd_batch_no = sb_batch_id)
"
"		              AND (sb_qty_in - sb_qty_out) > 0
"
"                            GROUP BY sb_batch_id,sb_bc_unit_cost,sb_cost_method
"
"                           HAVING SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                            ORDER BY DECODE(sb_cost_method,'FIFO',sb_batch_id,NULL) ASC,DECODE(sb_cost_method,'LIFO',sb_batch_id,NULL) DESC)
"
"	      LOOP
"
"
"
"
"
"                IF v_cb_bal_qty > r_cb.stk_qty THEN
"
"                  v_cb_upd_qty := r_cb.stk_qty;
"
"                  v_cb_bal_qty := v_cb_bal_qty - r_cb.stk_qty;
"
"                ELSE
"
"                  v_cb_upd_qty := v_cb_bal_qty;
"
"                  v_cb_bal_qty := 0;
"
"                END IF;
"
"
"
"		proc_upd_stock_batches(p_bu,
"
"	                               cr1.scln_store_id,
"
"	                               cr1.scln_prod_id,
"
"	                               cr1.scln_prod_rev,
"
"	                               r_cb.sb_batch_id,
"
"	                               0,
"
"	                               v_cb_upd_qty,
"
"	                               0,
"
"	                               0,
"
"	                               r_cb.sb_bc_unit_cost,
"
"	                               cr1.scln_unit_cost,
"
"	                               0,
"
"	                               0,
"
"	                               0,
"
"	                               0,
"
"	                               'N',
"
"	                               cr1.schd_count_date,
"
"	                               NULL,
"
"	                               cr1.scln_ord_no,
"
"	                               cr1.scln_seq_no,
"
"	                               'MI',
"
"	                               NULL,
"
"	                               cr1.scln_ord_no,
"
"	                               cr1.scln_seq_no,
"
"	                               NULL,
"
"	                               cr1.scln_prod_cls,
"
"	                               'IC',
"
"	                               'ICM',
"
"	                               NULL,
"
"	                               NULL,
"
"	                               NULL,
"
"	                               NULL,
"
"	                               p_user,
"
"				       p_prod_cls_desc => cr1.scln_prod_cls_desc,
"
"				       p_prod_subcls => cr1.scln_prod_subcls,
"
"				       p_prod_subcls_desc => cr1.scln_prod_subcls_desc,
"
"				       p_prod_grp => cr1.scln_prod_grp,
"
"				       p_prod_grp_desc => cr1.scln_prod_grp_desc,
"
"				       p_prod_subgrp => cr1.scln_prod_subgrp,
"
"				       p_prod_subgrp_desc => cr1.scln_prod_subgrp_desc,
"
"				       p_prod_cls_type => cr1.scln_prod_cls_type,
"
"				       p_sys_ls_no => cr1.scln_sys_ls_no
"
"	                              );
"
"
"
"	      END LOOP;
"
"
"
"	    ELSE
"
"
"
"	      FOR r_cb IN (SELECT sb_batch_id,sb_bc_unit_cost,SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) stk_qty
"
"                             FROM stocks_batches
"
"                            WHERE sb_bu = p_bu
"
"                              AND sb_store_id = cr1.scln_store_id
"
"                              AND sb_prod_id = cr1.scln_prod_id
"
"                              AND sb_prod_rev = cr1.scln_prod_rev
"
"		              AND (sb_qty_in - sb_qty_out) > 0
"
"                            GROUP BY sb_batch_id,sb_bc_unit_cost,sb_cost_method
"
"                           HAVING SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                            ORDER BY DECODE(sb_cost_method,'FIFO',sb_batch_id,NULL) ASC,DECODE(sb_cost_method,'LIFO',sb_batch_id,NULL) DESC)
"
"	      LOOP
"
"
"
"                IF v_cb_bal_qty > r_cb.stk_qty THEN
"
"                  v_cb_upd_qty := r_cb.stk_qty;
"
"                  v_cb_bal_qty := v_cb_bal_qty - r_cb.stk_qty;
"
"                ELSE
"
"                  v_cb_upd_qty := v_cb_bal_qty;
"
"                  v_cb_bal_qty := 0;
"
"                END IF;
"
"
"
"		proc_upd_stock_batches(p_bu,
"
"	                               cr1.scln_store_id,
"
"	                               cr1.scln_prod_id,
"
"	                               cr1.scln_prod_rev,
"
"	                               r_cb.sb_batch_id,
"
"	                               0,
"
"	                               v_cb_upd_qty,
"
"	                               0,
"
"	                               0,
"
"	                               r_cb.sb_bc_unit_cost,
"
"	                               cr1.scln_unit_cost,
"
"	                               0,
"
"	                               0,
"
"	                               0,
"
"	                               0,
"
"	                               'N',
"
"	                               cr1.schd_count_date,
"
"	                               NULL,
"
"	                               cr1.scln_ord_no,
"
"	                               cr1.scln_seq_no,
"
"	                               'MI',
"
"	                               NULL,
"
"	                               cr1.scln_ord_no,
"
"	                               cr1.scln_seq_no,
"
"	                               NULL,
"
"	                               cr1.scln_prod_cls,
"
"	                               'IC',
"
"	                               'ICM',
"
"	                               NULL,
"
"	                               NULL,
"
"	                               NULL,
"
"	                               NULL,
"
"	                               p_user,
"
"				       p_prod_cls_desc => cr1.scln_prod_cls_desc,
"
"				       p_prod_subcls => cr1.scln_prod_subcls,
"
"				       p_prod_subcls_desc => cr1.scln_prod_subcls_desc,
"
"				       p_prod_grp => cr1.scln_prod_grp,
"
"				       p_prod_grp_desc => cr1.scln_prod_grp_desc,
"
"				       p_prod_subgrp => cr1.scln_prod_subgrp,
"
"				       p_prod_subgrp_desc => cr1.scln_prod_subgrp_desc,
"
"				       p_prod_cls_type => cr1.scln_prod_cls_type,
"
"				       p_sys_ls_no => cr1.scln_sys_ls_no
"
"	                              );
"
"
"
"	      END LOOP;
"
"
"
"	    END IF;
"
"
"
"	    IF v_cb_bal_qty <> 0 THEN
"
"	      Raise_Application_Error(-20999,'Cost Batch Qty. on hand is low.'||v_cb_bal_qty);
"
"	    END IF;
"
"
"
"	  END IF;
"
"
"
"	END IF;
"
"
"
"
"
"	IF cr1.prod_ser_lot_opt <> 'N' THEN
"
"
"
"	  /*IF cr1.scln_sys_ls_no IS NULL THEN
"
"	    Raise_Application_Error(-20999,cr1.scln_seq_no||'/'||v_stk_qty||'/'||cr1.scln_lot_no||'/'||cr1.scln_serial_no||'/'||v_sys_ls_no||'-'||cr1.scln_sys_ls_no);
"
"	  END IF;*/
"
"
"
"	  proc_upd_lot_ser_stocks(p_bu,
"
"                                  cr1.scln_store_id,
"
"                                  cr1.scln_prod_id,
"
"                                  cr1.scln_prod_rev,
"
"                                  CASE WHEN v_stk_qty < 0 THEN cr1.scln_sys_ls_no ELSE cr1.scln_new_sys_ls_no END,
"
"                                  v_stk_qty,
"
"                                  0,
"
"                                  0,
"
"                                  cr1.scln_unit_cost,
"
"                                  cr1.prod_ser_lot_opt,
"
"                                  cr1.scln_lot_no,
"
"                                  cr1.scln_serial_no,
"
"                                  cr1.scln_source_type,
"
"                                  cr1.scln_source_id,
"
"                                  cr1.scln_expiry_date,
"
"                                  cr1.schd_count_date,
"
"                                  'IC',
"
"                                  NULL,
"
"                                  cr1.scln_ord_no,
"
"                                  cr1.scln_seq_no,
"
"                                  'ICM',
"
"                                  cr1.schd_reference,
"
"                                  'STOCK COUNT',
"
"                                  p_user,
"
"				  p_so_no => cr1.scln_so_no,
"
"				  p_so_ref => cr1.scln_so_schld_desc,
"
"				  p_vou_ls_line_no => cr1.scln_seq_no,
"
"				  p_batch_no => v_stk_batch_no,
"
"				  p_heat_no => cr1.scln_heat_no,
"
"				  p_test_no => cr1.scln_test_no
"
"                                 );
"
"
"
"	END IF;
"
"
"
"	IF cr1.scln_bin_flag = 'Y' THEN
"
"
"
"	  proc_upd_bin_stocks(p_bu,
"
"	    		      cr1.scln_store_id,
"
"	    		      cr1.scln_prod_id,
"
"	    		      cr1.scln_prod_rev,
"
"	    		      cr1.scln_bin_id,
"
"	    		      CASE WHEN v_stk_qty < 0 THEN cr1.scln_sys_ls_no ELSE cr1.scln_new_sys_ls_no END,
"
"	    		      cr1.scln_lot_no,
"
"	    		      cr1.scln_serial_no,
"
"	    		      cr1.scln_source_type,
"
"	    		      cr1.scln_source_id,
"
"	    		      v_stk_qty,
"
"	    		      0,
"
"	    		      0,
"
"	    		      0,
"
"	    		      cr1.scln_unit_cost,
"
"                              cr1.schd_count_date,
"
"	    		      'IC',
"
"	    		      NULL,
"
"	    		      cr1.scln_ord_no,
"
"	    		      cr1.scln_seq_no,
"
"	    		      'ICM',
"
"	    		      p_user
"
"	    		     );
"
"	END IF;
"
"
"
"      ELSE
"
"
"
"	IF cr1.scln_sys_qty > 0 AND cr1.scln_phy_qty > 0 AND cr1.scln_phy_qty > cr1.scln_sys_qty THEN
"
"	  Raise_Application_Error(-20999,'Not Allowed.');
"
"	END IF;
"
"
"
"	IF v_stk_qty < 0 AND cr1.scln_prod_ord_no IS NOT NULL THEN
"
"	  UPDATE prod_order_hd
"
"	     SET prohd_closeshort_qty = prohd_closeshort_qty + ABS(v_stk_qty)
"
"	   WHERE prohd_bu = p_bu
"
"	     AND prohd_plnt = cr1.schd_plnt
"
"	     AND prohd_ord_no = cr1.scln_prod_ord_no;
"
"	END IF;
"
"
"
"
"
"	/*IF cr1.scln_prod_ord_no IS NULL THEN
"
"	    Raise_Application_Error(-20999,cr1.scln_seq_no||'~'||cr1.scln_prod_ord_no||'~'||v_prod_ord_no);
"
"	  END IF;*/
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"	                       cr1.scln_prod_ord_no,
"
"			       cr1.scln_compld_proc_id,
"
"			       cr1.scln_sf_code,
"
"			       cr1.scln_store_id,
"
"			       cr1.scln_prod_id ,
"
"			       cr1.scln_prod_rev,
"
"			       cr1.scln_sys_ls_no,
"
"			       cr1.scln_lot_no,
"
"			       cr1.scln_serial_no,
"
"			       cr1.scln_expiry_date,
"
"			       v_stk_qty,
"
"			       0,
"
"			       cr1.scln_unit_cost,
"
"			       cr1.schd_plnt,
"
"			       cr1.scln_source_id,
"
"			       cr1.scln_source_type,
"
"			       NULL,
"
"			       cr1.scln_so_no,
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       cr1.scln_ord_no,
"
"			       NULL,
"
"			       cr1.scln_ord_no,
"
"			       cr1.scln_seq_no,
"
"			       cr1.scln_seq_no,
"
"			       cr1.schd_count_date,
"
"	  		       cr1.schd_year,
"
"                               cr1.schd_period,
"
"                               cr1.prod_cost_method,
"
"			       'IC',
"
"			       'ICM',
"
"			       cr1.scln_prod_cls,
"
"			       'Stock Count'||' '||cr1.scln_ord_no,
"
"			       'Stock Count'||' '||cr1.scln_ord_no,
"
"			       cr1.scln_unit_cost,
"
"			       cr1.scln_unit_cost,
"
"			       'PO',
"
"			       p_user,
"
"			       p_type => cr1.scln_so_type,
"
"			       p_proj => cr1.scln_proj_id,
"
"			       p_task => NULL,
"
"			       p_trans_in_qty => 0,
"
"			       p_prod_cls_desc     => cr1.scln_prod_cls_desc,
"
"			       p_prod_sub_cls_id   => cr1.scln_prod_subcls,
"
"			       p_prod_sub_cls_desc => cr1.scln_prod_subcls_desc,
"
"			       p_prod_grp_id	   => cr1.scln_prod_grp,
"
"			       p_prod_grp_desc	   => cr1.scln_prod_grp_desc,
"
"			       p_prod_sub_grp_id   => cr1.scln_prod_subgrp,
"
"			       p_prod_sub_grp_desc => cr1.scln_prod_subgrp_desc,
"
"			       p_prod_cls_type     => cr1.scln_prod_cls_type,
"
"			       p_oprn_ln_seq      => cr1.scln_compld_oprn_seq
"
"			      );
"
"
"
"        IF cr1.scln_bin_flag = 'Y' THEN
"
"
"
"	  proc_upd_bin_stocks(p_bu,
"
"	    		      cr1.scln_store_id,
"
"	    		      cr1.scln_prod_id,
"
"	    		      cr1.scln_prod_rev,
"
"	    		      cr1.scln_bin_id,
"
"	    		      cr1.scln_sys_ls_no,
"
"	    		      cr1.scln_lot_no,
"
"	    		      cr1.scln_serial_no,
"
"	    		      cr1.scln_source_type,
"
"	    		      cr1.scln_source_id,
"
"	    		      v_stk_qty,
"
"	    		      0,
"
"	    		      0,
"
"	    		      0,
"
"	    		      cr1.scln_unit_cost,
"
"                              cr1.schd_count_date,
"
"	    		      'IC',
"
"	    		      NULL,
"
"	    		      cr1.scln_ord_no,
"
"	    		      cr1.scln_seq_no,
"
"	    		      'ICM',
"
"	    		      p_user,
"
"			      p_prod_ord_no => cr1.scln_prod_ord_no,
"
"			      p_sf_code => cr1.scln_sf_code
"
"	    		     );
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"    END LOOP;
"
"
"
"  END proc_post_stk_frm_stk_count;
"
"
"
"END pkg_stk_count;"
/
