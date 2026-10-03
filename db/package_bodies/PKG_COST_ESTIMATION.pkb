CREATE OR REPLACE
"PACKAGE BODY pkg_cost_estimation
"
"AS
"
"
"
"  PROCEDURE proc_ins_mat_cost_frm_bom(p_bu		VARCHAR2,
"
"                                      p_plnt		VARCHAR2,
"
"				      p_doc_no		VARCHAR2,
"
"				      p_par_prod_id	VARCHAR2,
"
"				      p_par_prod_rev	NUMBER,
"
"				      p_trans_qty	NUMBER,
"
"				      p_bom_lvl		VARCHAR2,
"
"				      p_udp_flag	VARCHAR2,
"
"				      p_fgp_flag	VARCHAR2,
"
"				      p_pur_flag	VARCHAR2,
"
"				      p_pur_price_basis	VARCHAR2,
"
"				      p_user		VARCHAR2
"
"				     )
"
"  AS
"
"    CURSOR c_bom IS
"
"    SELECT bomhd_prod_id,
"
"           bomhd_prod_rev,
"
"           bomln_prod_id,
"
"           bomln_prod_rev,
"
"           bomln_store_id,
"
"           rouln_proc_id,
"
"           rouln_oprn_id,
"
"           bomln_prod_uom,
"
"           func_find_bom_qty(SYS_CONNECT_BY_PATH(bomln_required_qty,'*'),'*') bomln_required_qty,
"
"	   rouln_loc_id
"
"      FROM(SELECT bomhd_prod_id,
"
"                  bomhd_prod_rev,
"
"                  bomln_prod_id,
"
"                  bomln_prod_rev,
"
"                  bomln_store_id,
"
"                  rouln_proc_id,
"
"                  rouln_oprn_id,
"
"                  bomln_prod_uom,
"
"                  bomln_required_qty,
"
"		  rouln_loc_id
"
"             FROM bom_hd,routing_ln,bom_ln
"
"            WHERE bomhd_bu = rouln_bu
"
"              AND bomhd_plnt = rouln_plnt
"
"              AND bomhd_bom_no = rouln_bom_no
"
"              AND rouln_bu = bomln_bu(+)
"
"              AND rouln_plnt = bomln_plnt(+)
"
"              AND rouln_bom_no = bomln_bom_no(+)
"
"              AND rouln_oprn_seq_no = bomln_oprn_seq_no(+)
"
"              AND bomhd_status = 'A'
"
"              AND bomhd_primary = 'Y'
"
"              AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"              AND bomhd_bu = p_bu
"
"              AND bomhd_plnt = p_plnt
"
"           UNION ALL
"
"           SELECT NULL,
"
"                  NULL,
"
"                  p_par_prod_id,
"
"                  p_par_prod_rev,
"
"                  NULL,
"
"                  NULL,
"
"                  NULL,
"
"                  NULL,
"
"                  p_trans_qty,
"
"		  NULL
"
"             FROM DUAL)
"
"     WHERE p_bom_lvl = 'M'
"
"       AND bomhd_prod_id IS NOT NULL
"
"     START WITH bomhd_prod_id IS NULL
"
"    CONNECT BY bomhd_prod_id||bomhd_prod_rev = PRIOR bomln_prod_id||bomln_prod_rev
"
"    UNION ALL
"
"    SELECT bomhd_prod_id,
"
"           bomhd_prod_rev,
"
"           bomln_prod_id,
"
"           bomln_prod_rev,
"
"           bomln_store_id,
"
"           rouln_proc_id,
"
"           rouln_oprn_id,
"
"           bomln_prod_uom,
"
"           bomln_required_qty,
"
"	   rouln_loc_id
"
"      FROM bom_hd,routing_ln,bom_ln
"
"     WHERE bomhd_bu = rouln_bu
"
"       AND bomhd_plnt = rouln_plnt
"
"       AND bomhd_bom_no = rouln_bom_no
"
"       AND rouln_bu = bomln_bu(+)
"
"       AND rouln_plnt = bomln_plnt(+)
"
"       AND rouln_bom_no = bomln_bom_no(+)
"
"       AND rouln_oprn_seq_no = bomln_oprn_seq_no(+)
"
"       AND bomhd_status = 'A'
"
"       AND bomhd_primary = 'Y'
"
"       AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"       AND bomhd_bu = p_bu
"
"       AND bomhd_plnt = p_plnt
"
"       AND bomhd_prod_id = p_par_prod_id
"
"       AND bomhd_prod_rev = p_par_prod_rev
"
"       AND p_bom_lvl = 'S';
"
"
"
"CURSOR c_oh(c_resgrp_id VARCHAR2)
"
"  IS
"
"SELECT mrgoh_sub_elmnt_id,
"
"       mrgoh_oh_rate,
"
"       mrgoh_eff_date
"
"  FROM mfg_resgrp_oh_rates
"
" WHERE mrgoh_bu = p_bu
"
"   AND mrgoh_plnt = p_plnt
"
"   AND mrgoh_resgrp_id = c_resgrp_id
"
"   AND mrgoh_eff_date <= TRUNC(SYSDATE)
"
"  ORDER BY mrgoh_eff_date DESC;
"
"
"
"CURSOR cr_ctrl
"
"  IS
"
"SELECT oceh_oh_basis
"
"  FROM opport_cost_est_hd
"
" WHERE oceh_bu   = p_bu
"
"   AND oceh_plnt = p_plnt
"
"   AND oceh_doc_no = p_doc_no;
"
"
"
"CURSOR c_ce_price(c_prod_id VARCHAR2, c_prod_rev NUMBER)
"
"  IS
"
"SELECT pcehd_val_date,pcehd_tot_cost
"
"  FROM prod_cost_est_hd
"
" WHERE pcehd_bu = p_bu
"
"   AND pcehd_plnt = p_plnt
"
"   AND pcehd_prod_id = c_prod_id
"
"   AND pcehd_prod_rev = c_prod_rev
"
"   AND pcehd_val_date <= TRUNC(SYSDATE)
"
"  ORDER BY pcehd_val_date DESC;
"
"
"
"  CURSOR c_proc
"
"    IS
"
"  SELECT rouln_oprn_seq_no,
"
"         rouln_oprn_id,
"
"         mfgo_hrly_rate,
"
"         mfgo_rough,
"
"         mfgo_ht,
"
"         mfgo_uom,
"
"         rouln_oprn_flag
"
"    FROM bom_hd,
"
"         routing_ln,
"
"         mfg_oprns
"
"   WHERE bomhd_bu      = rouln_bu
"
"     AND bomhd_plnt    = rouln_plnt
"
"     AND bomhd_bom_no  = rouln_bom_no
"
"     AND rouln_bu      = mfgo_bu
"
"     AND rouln_oprn_id = mfgo_oprn_id
"
"     AND bomhd_primary = 'Y'
"
"     AND bomhd_status  = 'A'
"
"     AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"     AND bomhd_bu = p_bu
"
"     AND bomhd_plnt = p_plnt
"
"     AND bomhd_prod_id = p_par_prod_id
"
"     AND bomhd_prod_rev = p_par_prod_rev
"
" ORDER BY rouln_oprn_seq_no;
"
"
"
"
"
"CURSOR c_proc1(c_prod_id VARCHAR2,c_prod_rev NUMBER)
"
"    IS
"
"  SELECT rouln_oprn_seq_no,
"
"         rouln_oprn_id,
"
"         mfgo_hrly_rate,
"
"         mfgo_rough,
"
"         mfgo_ht,
"
"         mfgo_uom,
"
"         rouln_oprn_flag
"
"    FROM bom_hd,
"
"         routing_ln,
"
"         mfg_oprns
"
"   WHERE bomhd_bu      = rouln_bu
"
"     AND bomhd_plnt    = rouln_plnt
"
"     AND bomhd_bom_no  = rouln_bom_no
"
"     AND rouln_bu      = mfgo_bu
"
"     AND rouln_oprn_id = mfgo_oprn_id
"
"     AND bomhd_primary = 'Y'
"
"     AND bomhd_status  = 'A'
"
"     AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"     AND bomhd_bu = p_bu
"
"     AND bomhd_plnt = p_plnt
"
"     AND bomhd_prod_id = c_prod_id
"
"     AND bomhd_prod_rev = c_prod_rev
"
" ORDER BY rouln_oprn_seq_no;
"
"
"
"
"
"
"
"
"
"    v_seq_no		NUMBER;
"
"    v_dflt_store_id	VARCHAR2(10);
"
"    v_last_pur_cost	NUMBER;
"
"    v_mac_cost		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"    v_lb_seq_no		NUMBER;
"
"    v_rqrd_hrs		NUMBER(12,5);
"
"    v_rqrd_mins		NUMBER(12,5);
"
"    v_hrs		NUMBER;
"
"    v_mins		NUMBER(12,5);
"
"    c_oh1		c_oh%ROWTYPE;
"
"    cr_ctrl1		cr_ctrl%ROWTYPE;
"
"    v_std_price		NUMBER(17,5);
"
"    v_batch_qty		NUMBER(12,3);
"
"    v_proc_seq_no	NUMBER;
"
"
"
"    c_ce_price1		c_ce_price%ROWTYPE;
"
"
"
"  BEGIN
"
"
"
"   /*DELETE opport_mat_cost_est
"
"     WHERE omce_bu = p_bu
"
"       AND omce_plnt = p_plnt
"
"       AND omce_doc_no = p_doc_no;  */
"
"
"
"    DELETE opport_lab_cost_est
"
"     WHERE olce_bu = p_bu
"
"       AND olce_plnt = p_plnt
"
"       AND olce_doc_no = p_doc_no;
"
"
"
"    DELETE opport_oh_cost_est
"
"     WHERE ooce_bu = p_bu
"
"       AND ooce_plnt = p_plnt
"
"       AND ooce_doc_no = p_doc_no;
"
"
"
"    DELETE opport_inside_proc_cost_est
"
"     WHERE oipce_bu   = p_bu
"
"       AND oipce_plnt = p_plnt
"
"       AND oipce_doc_no  = p_doc_no;
"
"
"
"    DELETE opport_proc_cost_est
"
"     WHERE opce_bu    = p_bu
"
"       AND opce_plnt = p_plnt
"
"       AND opce_doc_no = p_doc_no;
"
"
"
"
"
"       OPEN cr_ctrl;
"
"       FETCH cr_ctrl INTO cr_ctrl1;
"
"       CLOSE cr_ctrl;
"
"
"
"--	 raise_application_error(-20999,'HRM'||p_par_prod_id||'/'||p_par_prod_rev);
"
"
"
"       SELECT bomhd_qty
"
"         INTO v_batch_qty
"
"         FROM bom_hd
"
"        WHERE bomhd_bu = p_bu
"
"          AND bomhd_plnt = p_plnt
"
"          AND bomhd_prod_id = p_par_prod_id
"
"          AND bomhd_prod_rev = p_par_prod_rev
"
"          AND bomhd_status = 'A'
"
"          AND bomhd_primary = 'Y'
"
"          AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"          AND ROWNUM = 1;
"
"
"
"          UPDATE opport_cost_est_hd
"
"             SET oceh_batch_qty = v_batch_qty
"
"           WHERE oceh_bu = p_bu
"
"             AND oceh_plnt = p_plnt
"
"             AND oceh_doc_no = p_doc_no;
"
"
"
"
"
"
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR r_bom IN c_bom
"
"    LOOP
"
"
"
"
"
"
"
"      v_dflt_store_id := CASE WHEN r_bom.bomln_prod_id IS NOT NULL THEN func_find_deflt_storeid(p_bu,p_plnt,r_bom.rouln_loc_id,r_bom.bomln_prod_id,r_bom.bomln_prod_rev,'N') END;
"
"
"
"      BEGIN
"
"      /*  SELECT sttr_bc_unit_cost
"
"	  INTO v_last_pur_cost
"
"	  FROM(SELECT sttr_bc_unit_cost
"
"	         FROM stock_trans
"
"                WHERE sttr_bu = p_bu
"
"	          AND sttr_store_id = v_dflt_store_id
"
"	          AND sttr_prod_id = r_bom.bomln_prod_id
"
"	          AND sttr_prod_rev = r_bom.bomln_prod_rev
"
"	          AND sttr_bucket_type = 'QOH'
"
"	          AND sttr_appl = 'POM'
"
"	          AND sttr_source_doc = 'GRN'
"
"		ORDER BY sttr_trans_date DESC,sttr_trans_seq_no DESC)
"
"         WHERE ROWNUM = 1;
"
"      EXCEPTION
"
"        WHEN OTHERS THEN
"
"          v_last_pur_cost := 0;  */
"
"
"
"        SELECT sttr_bc_unit_cost
"
"		  INTO v_last_pur_cost
"
"		  FROM(SELECT sttr_bc_unit_cost
"
"		         FROM stock_trans
"
"	                WHERE sttr_bu = p_bu
"
"		          AND sttr_store_id = v_dflt_store_id
"
"		          AND sttr_prod_id = r_bom.bomln_prod_id
"
"		          AND sttr_prod_rev = r_bom.bomln_prod_rev
"
"		          AND sttr_bucket_type = 'QOH'
"
"		          AND sttr_appl IN ( 'POM','ICM')
"
"		          AND sttr_source_doc IN ( 'MR','MRV')
"
"			ORDER BY sttr_trans_date DESC,sttr_trans_seq_no DESC)
"
"         WHERE ROWNUM = 1;
"
"        EXCEPTION
"
"        WHEN OTHERS THEN
"
"	       v_last_pur_cost := 0;
"
"      END;
"
"
"
"      BEGIN
"
"        SELECT stcost_cost
"
"	  INTO v_mac_cost
"
"	  FROM stock_costs
"
"         WHERE stcost_bu = p_bu
"
"	   AND stcost_store_id = v_dflt_store_id
"
"	   AND stcost_prod_id = r_bom.bomln_prod_id
"
"	   AND stcost_prod_rev = r_bom.bomln_prod_rev ;
"
"      EXCEPTION
"
"        WHEN OTHERS THEN
"
"	  v_mac_cost := 0;
"
"      END;
"
"
"
"      IF p_pur_price_basis = 'SUC' THEN
"
"         BEGIN
"
"         select prod_std_cost
"
"           into v_std_price
"
"           FROM products
"
"          WHERE prod_bu = p_bu
"
"            AND prod_id = r_bom.bomln_prod_id
"
"            AND prod_rev = r_bom.bomln_prod_rev;
"
"
"
"         EXCEPTION
"
"         WHEN OTHERS THEN
"
"          v_std_price := 0 ;
"
"         END;
"
"
"
"      END IF;
"
"
"
"
"
"      IF p_udp_flag = 'Y' THEN
"
"        v_unit_cost := 0;
"
"      ELSIF p_fgp_flag = 'Y' THEN
"
"        v_unit_cost := v_mac_cost;
"
"      ELSIF p_pur_flag = 'Y' THEN
"
"        IF p_pur_price_basis = 'LPP' THEN
"
"	  v_unit_cost := v_last_pur_cost;
"
"	ELSIF p_pur_price_basis = 'MAC' THEN
"
"	  v_unit_cost := v_mac_cost;
"
"	ELSIF p_pur_price_basis = 'SUC' THEN
"
"	   v_unit_cost := v_std_price;
"
"	ELSE
"
"	  v_unit_cost := 0;
"
"	END IF;
"
"      ELSE
"
"        v_unit_cost := 0;
"
"      END IF;
"
"
"
"      IF v_unit_cost = 0 THEN
"
"
"
"       OPEN c_ce_price(r_bom.bomln_prod_id,r_bom.bomln_prod_rev);
"
"       FETCH c_ce_price INTO c_ce_price1;
"
"       IF c_ce_price%FOUND THEN
"
"         v_unit_cost := c_ce_price1.pcehd_tot_cost;
"
"       END IF;
"
"       ClOSE c_ce_price;
"
"      END IF;
"
"
"
"
"
"      IF r_bom.bomln_prod_id IS NOT NULL THEN
"
"
"
"      --v_seq_no := v_seq_no + 1;
"
"
"
"      SELECT NVL(MAX(omce_seq_no),0) + 1
"
"            INTO v_seq_no
"
"        FROM opport_mat_cost_est
"
"       WHERE omce_bu = p_bu
"
"          AND omce_plnt = p_plnt
"
"          AND omce_doc_no = p_doc_no;
"
"
"
"      INSERT INTO opport_mat_cost_est(omce_bu,
"
"                                      omce_plnt,
"
"                                      omce_doc_no,
"
"                                      omce_seq_no,
"
"                                      omce_prod_id,
"
"                                      omce_prod_rev,
"
"				                      omce_prod_desc,
"
"                                      omce_req_qty,
"
"                                      omce_unit_cost,
"
"                                      omce_aftr_unit_cost,
"
"                                      omce_last_pur_price,
"
"                                      omce_mvg_avg_cost,
"
"                                      omce_cre_by,
"
"                                      omce_cre_date,
"
"                                      omce_unit_cost_type
"
"                                         )
"
"                                       VALUES(p_bu,
"
"                                          p_plnt,
"
"                                          p_doc_no,
"
"                                          v_seq_no,
"
"                                          r_bom.bomln_prod_id,
"
"                                          r_bom.bomln_prod_rev,
"
"                                          func_find_prod_qry_desc(p_bu,r_bom.bomln_prod_id,r_bom.bomln_prod_rev,1),
"
"                                          r_bom.bomln_required_qty,
"
"                                          v_unit_cost,
"
"                                          v_unit_cost,
"
"                                          v_last_pur_cost,
"
"                                          v_mac_cost,
"
"                                          p_user,
"
"                                          SYSDATE,
"
"                                          CASE WHEN p_pur_price_basis = 'SUC' THEN 'S' WHEN p_pur_price_basis = 'MAC' THEN 'C' ELSE 'L' END
"
"                                          );
"
"      END IF;
"
"
"
"
"
"
"
"    FOR cr_proc IN c_proc
"
"    LOOP
"
"
"
"    IF cr_proc.rouln_oprn_flag IN ('B','I','O') THEN
"
"
"
"       SELECT NVL(MAX(opce_seq_no),0) + 1
"
"         INTO v_proc_seq_no
"
"         FROM opport_proc_cost_est
"
"        WHERE opce_bu     = p_bu
"
"          AND opce_plnt   = p_plnt
"
"          AND opce_doc_no = p_doc_no;
"
"
"
"    	INSERT INTO opport_proc_cost_est(
"
"					opce_bu        ,
"
"					opce_plnt      ,
"
"					opce_doc_no    ,
"
"					opce_seq_no    ,
"
"					opce_proc_id   ,
"
"					opce_uom       ,
"
"					opce_units     ,
"
"					opce_hrly_rate ,
"
"					opce_cre_by    ,
"
"					opce_cre_date  ,
"
"					opce_upd_by    ,
"
"					opce_upd_date  ,
"
"					opce_margin_amt,
"
"					opce_margin_flag,
"
"					opce_suplr_id   ,
"
"					opce_type
"
"    	                                )
"
"    	                           VALUES(
"
"					p_bu        ,
"
"					p_plnt      ,
"
"					p_doc_no    ,
"
"					v_proc_seq_no    ,
"
"					cr_proc.rouln_oprn_id   ,
"
"					cr_proc.mfgo_uom       ,
"
"					1     ,
"
"					cr_proc.mfgo_hrly_rate ,
"
"					p_user    ,
"
"					SYSDATE  ,
"
"					NULL    ,
"
"					NULL  ,
"
"					0,
"
"					'N',
"
"					NULL   ,
"
"					NULL
"
"    	                                 );
"
"    	  END IF;
"
"
"
"    	  IF cr_proc.rouln_oprn_flag IN ('B','I') THEN
"
"
"
"    	  SELECT NVL(MAX(oipce_seq_no),0) + 1
"
"	           INTO v_proc_seq_no
"
"	           FROM opport_inside_proc_cost_est
"
"	          WHERE oipce_bu     = p_bu
"
"	            AND oipce_plnt   = p_plnt
"
"                    AND oipce_doc_no = p_doc_no;
"
"
"
"
"
"
"
"    	        INSERT INTO opport_inside_proc_cost_est(oipce_bu       ,
"
"							oipce_plnt     ,
"
"							oipce_doc_no   ,
"
"							oipce_seq_no   ,
"
"							oipce_proc_id  ,
"
"							oipce_uom      ,
"
"							oipce_units    ,
"
"							oipce_hrly_rate,
"
"							oipce_cre_by   ,
"
"							oipce_cre_date ,
"
"							oipce_upd_by   ,
"
"							oipce_upd_date )
"
"						 VALUES(p_bu       ,
"
"							p_plnt     ,
"
"							p_doc_no   ,
"
"							v_proc_seq_no   ,
"
"							cr_proc.rouln_oprn_id   ,
"
"							cr_proc.mfgo_uom       ,
"
"							1    ,
"
"							cr_proc.mfgo_hrly_rate,
"
"							p_user   ,
"
"							SYSDATE ,
"
"							NULL   ,
"
"							NULL );
"
"
"
"
"
"
"
"          END IF;
"
"    	                                 --v_proc_seq_no := v_proc_seq_no + 1;
"
"    END LOOP;
"
"
"
"    ------Child bom process --------------
"
"     FOR cr_proc1 IN c_proc1(r_bom.bomln_prod_id,r_bom.bomln_prod_rev)
"
"    LOOP
"
"
"
"    IF cr_proc1.rouln_oprn_flag IN ('B','I','O') THEN
"
"
"
"       SELECT NVL(MAX(opce_seq_no),0) + 1
"
"         INTO v_proc_seq_no
"
"         FROM opport_proc_cost_est
"
"        WHERE opce_bu     = p_bu
"
"          AND opce_plnt   = p_plnt
"
"          AND opce_doc_no = p_doc_no;
"
"
"
"    	INSERT INTO opport_proc_cost_est(
"
"					opce_bu        ,
"
"					opce_plnt      ,
"
"					opce_doc_no    ,
"
"					opce_seq_no    ,
"
"					opce_proc_id   ,
"
"					opce_uom       ,
"
"					opce_units     ,
"
"					opce_hrly_rate ,
"
"					opce_cre_by    ,
"
"					opce_cre_date  ,
"
"					opce_upd_by    ,
"
"					opce_upd_date  ,
"
"					opce_margin_amt,
"
"					opce_margin_flag,
"
"					opce_suplr_id   ,
"
"					opce_type
"
"    	                                )
"
"    	                           VALUES(
"
"					p_bu        ,
"
"					p_plnt      ,
"
"					p_doc_no    ,
"
"					v_proc_seq_no    ,
"
"					cr_proc1.rouln_oprn_id   ,
"
"					cr_proc1.mfgo_uom       ,
"
"					1     ,
"
"					cr_proc1.mfgo_hrly_rate ,
"
"					p_user    ,
"
"					SYSDATE  ,
"
"					NULL    ,
"
"					NULL  ,
"
"					0,
"
"					'N',
"
"					NULL   ,
"
"					NULL
"
"    	                                 );
"
"    	  END IF;
"
"
"
"    	  IF cr_proc1.rouln_oprn_flag IN ('B','I') THEN
"
"
"
"    	  SELECT NVL(MAX(oipce_seq_no),0) + 1
"
"	           INTO v_proc_seq_no
"
"	           FROM opport_inside_proc_cost_est
"
"	          WHERE oipce_bu     = p_bu
"
"	            AND oipce_plnt   = p_plnt
"
"                    AND oipce_doc_no = p_doc_no;
"
"
"
"
"
"
"
"    	        INSERT INTO opport_inside_proc_cost_est(oipce_bu       ,
"
"							oipce_plnt     ,
"
"							oipce_doc_no   ,
"
"							oipce_seq_no   ,
"
"							oipce_proc_id  ,
"
"							oipce_uom      ,
"
"							oipce_units    ,
"
"							oipce_hrly_rate,
"
"							oipce_cre_by   ,
"
"							oipce_cre_date ,
"
"							oipce_upd_by   ,
"
"							oipce_upd_date )
"
"						 VALUES(p_bu       ,
"
"							p_plnt     ,
"
"							p_doc_no   ,
"
"							v_proc_seq_no   ,
"
"							cr_proc1.rouln_oprn_id   ,
"
"							cr_proc1.mfgo_uom       ,
"
"							1    ,
"
"							cr_proc1.mfgo_hrly_rate,
"
"							p_user   ,
"
"							SYSDATE ,
"
"							NULL   ,
"
"							NULL );
"
"
"
"
"
"
"
"          END IF;
"
"    	                                 --v_proc_seq_no := v_proc_seq_no + 1;
"
"    END LOOP cr_proc1 ;
"
"
"
"    END LOOP c_bom;
"
"
"
"    v_proc_seq_no := 1;
"
"
"
"
"
"    FOR r_rs IN (SELECT mfgrg_res_type,
"
"                        borln_res_grp_id,
"
"                        borln_units_per_hour,
"
"                        borln_hrs_per_unit,
"
"                        borln_mins_per_unit,
"
"                        borln_secs_per_unit,
"
"                        mfgrg_hrly_rate
"
"                   FROM bom_hd,
"
"                        bor_ln,
"
"                        mfg_res_groups
"
"                  WHERE bomhd_bu = borln_bu
"
"                    AND bomhd_plnt = borln_plnt
"
"                    AND bomhd_bom_no = borln_bom_no
"
"                    AND borln_bu = mfgrg_bu
"
"                    AND borln_plnt = mfgrg_plnt
"
"                    AND mfgrg_grp_id = borln_res_grp_id
"
"                    AND bomhd_bu = p_bu
"
"                    AND bomhd_plnt = p_plnt
"
"                    AND bomhd_prod_id = p_par_prod_id
"
"                    AND bomhd_prod_rev = p_par_prod_rev
"
"                    AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"                    AND bomhd_primary = 'Y'
"
"                    AND bomhd_status  = 'A'
"
"                    AND mfgrg_res_type IN ('P','M')
"
"                    AND borln_res_grp_type = 'G'
"
"                    UNION ALL
"
"                    SELECT mfgrg_res_type,
"
"                           borln_res_grp_id,
"
"                           borln_units_per_hour,
"
"                           borln_hrs_per_unit,
"
"                           borln_mins_per_unit,
"
"                           borln_secs_per_unit,
"
"                           mfgrg_hrly_rate
"
"                      FROM(
"
"                    SELECT mfgrg_res_type,
"
"                        mfgr_group_id borln_res_grp_id,
"
"                        borln_units_per_hour,
"
"                        borln_hrs_per_unit,
"
"                        borln_mins_per_unit,
"
"                        borln_secs_per_unit,
"
"                        mfgrg_hrly_rate
"
"                   FROM bom_hd,
"
"                        bor_ln,
"
"                        mfg_res_groups,
"
"                        mfg_resources
"
"                  WHERE bomhd_bu = borln_bu
"
"                    AND bomhd_plnt = borln_plnt
"
"                    AND bomhd_bom_no = borln_bom_no
"
"                    AND borln_bu = mfgrg_bu
"
"                    AND borln_plnt = mfgrg_plnt
"
"                    AND mfgr_res_id = borln_res_grp_id
"
"                    AND mfgrg_bu = mfgr_bu
"
"                    AND mfgrg_plnt = mfgr_plnt
"
"                    AND mfgrg_grp_id = mfgr_group_id
"
"                    AND bomhd_bu = p_bu
"
"                    AND bomhd_plnt = p_plnt
"
"                    AND bomhd_prod_id = p_par_prod_id
"
"                    AND bomhd_prod_rev = p_par_prod_rev
"
"                    AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"                    AND bomhd_primary = 'Y'
"
"                    AND bomhd_status  = 'A'
"
"                    AND mfgrg_res_type IN ('P','M')
"
"                    AND borln_res_grp_type = 'R'
"
"                    AND borln_priority = 1 ) )
"
"    LOOP
"
"
"
"   v_rqrd_hrs := 0 ;
"
"   v_rqrd_mins := 0 ;
"
"
"
"       IF r_rs.borln_units_per_hour > 0 THEN
"
"       	  v_rqrd_hrs := 1/r_rs.borln_units_per_hour;
"
"       ELSE
"
"           v_rqrd_hrs  := r_rs.borln_hrs_per_unit;
"
"           v_rqrd_mins := r_rs.borln_mins_per_unit + (r_rs.borln_secs_per_unit/60);
"
"       END IF;
"
"
"
"       	UPDATE opport_lab_cost_est
"
"       	   SET olce_req_hrs = olce_req_hrs + NVL(v_rqrd_hrs,0),
"
"	       olce_req_mins = olce_req_mins + NVL(v_rqrd_mins,0),
"
"	       olce_unit_rate = NVL(r_rs.mfgrg_hrly_rate,0),
"
"	       olce_cre_by = p_user,
"
"	       olce_upd_by = sysdate
"
"	 WHERE olce_bu = p_bu
"
"	   AND olce_plnt = p_plnt
"
"	   AND olce_doc_no = p_doc_no
"
"	   AND olce_res_type = r_rs.mfgrg_res_type
"
"	   AND olce_resgrp_id = r_rs.borln_res_grp_id;
"
"
"
"       IF SQL%NOTFOUND THEN
"
"
"
"	      SELECT NVL(MAX(olce_seq_no),0) + 1
"
"		INTO v_lb_seq_no
"
"		FROM opport_lab_cost_est
"
"	       WHERE olce_bu = p_bu
"
"		 AND olce_plnt = p_plnt
"
"		 AND olce_doc_no = p_doc_no
"
"		 AND olce_res_type = r_rs.mfgrg_res_type;
"
"
"
"	      INSERT INTO opport_lab_cost_est(olce_bu,
"
"					      olce_plnt,
"
"					      olce_doc_no,
"
"					      olce_seq_no,
"
"					      olce_res_type,
"
"					      olce_resgrp_id,
"
"					      olce_req_hrs,
"
"					      olce_req_mins,
"
"					      olce_unit_rate,
"
"					      olce_cre_by,
"
"					      olce_cre_date
"
"					      )
"
"				       VALUES(p_bu,
"
"					      p_plnt,
"
"					      p_doc_no,
"
"					      v_lb_seq_no,
"
"					      r_rs.mfgrg_res_type,
"
"					      r_rs.borln_res_grp_id,
"
"					      NVL(v_rqrd_hrs,0),
"
"					      NVL(v_rqrd_mins,0),
"
"					      NVL(r_rs.mfgrg_hrly_rate,0),
"
"					      p_user,
"
"					      SYSDATE
"
"					      );
"
"	  END IF;
"
"
"
"    END LOOP;
"
"
"
"    IF cr_ctrl1.oceh_oh_basis = 'RB' THEN
"
"
"
"    FOR cr_l IN (SELECT *
"
"    		   FROM opport_lab_cost_est
"
"    		  WHERE olce_bu = p_bu
"
"    		    AND olce_plnt = p_plnt
"
"    		    AND olce_doc_no = p_doc_no
"
"    		 ORDER  BY olce_resgrp_id
"
"    		    )
"
"    		    LOOP
"
"
"
"
"
"
"
"
"
"    		    	IF cr_l.olce_req_mins >= 60 THEN
"
"    		    	   --RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||cr_l.olce_req_mins||'/'||cr_l.olce_resgrp_id||'/'|| cr_l.olce_res_type);
"
"    		    	   v_hrs := TRUNC(cr_l.olce_req_mins/60);
"
"    		    	   v_mins := MOD(cr_l.olce_req_mins,60);
"
"
"
"    		    	   UPDATE opport_lab_cost_est
"
"    		    	      SET olce_req_hrs = olce_req_hrs + v_hrs,
"
"    		    	          olce_req_mins = v_mins,
"
"    		    	          olce_upd_by = p_user,
"
"    		    	          olce_upd_date = SYSDATE
"
"    		    	    WHERE olce_bu = p_bu
"
"    		    	      AND olce_plnt = p_plnt
"
"    		    	      AND olce_doc_no = p_doc_no
"
"    		    	      AND olce_resgrp_id = cr_l.olce_resgrp_id
"
"    		    	      AND olce_res_type = cr_l.olce_res_type;
"
"
"
"
"
"    		    	END IF;
"
"
"
"    		    END LOOP;
"
"
"
"
"
"
"
"
"
"	    		    FOR cr_el IN (SELECT olce_resgrp_id ,
"
"				   SUM(olce_req_hrs + (olce_req_mins / 60)) olce_req_hrs
"
"	    		      FROM opport_lab_cost_est
"
"	    		     WHERE olce_bu = p_bu
"
"	    		       AND olce_plnt = p_plnt
"
"	    		       AND olce_doc_no = p_doc_no
"
"	    		      GROUP BY olce_resgrp_id)
"
"	    		      LOOP
"
"
"
"
"
"	    		      	FOR c_oh1 IN c_oh(cr_el.olce_resgrp_id)
"
"	    		      	LOOP
"
"
"
"	    		      	SELECT NVL(MAX(ooce_seq_no),0) + 1
"
"	    		      	  INTO v_seq_no
"
"	    		      	  FROM opport_oh_cost_est
"
"	    		      	 WHERE ooce_bu = p_bu
"
"	    		      	   AND ooce_plnt = p_plnt
"
"	    		      	   AND ooce_doc_no = p_doc_no;
"
"
"
"
"
"	    		      	INSERT INTO opport_oh_cost_est(
"
"								ooce_bu           ,
"
"								ooce_plnt         ,
"
"								ooce_doc_no       ,
"
"								ooce_seq_no       ,
"
"								ooce_oh_pfx       ,
"
"								ooce_oh_type      ,
"
"								ooce_oh_amt       ,
"
"								ooce_cre_by       ,
"
"								ooce_cre_date     ,
"
"								ooce_upd_by       ,
"
"								ooce_upd_date     ,
"
"								ooce_margin_amt   ,
"
"								ooce_rqrd_hrs     ,
"
"								ooce_unit_rate
"
"								)
"
"							VALUES(
"
"								p_bu           ,
"
"								p_plnt         ,
"
"								p_doc_no       ,
"
"								v_seq_no       ,
"
"								c_oh1.mrgoh_sub_elmnt_id       ,
"
"								'F'      ,
"
"								(cr_el.olce_req_hrs * c_oh1.mrgoh_oh_rate),
"
"								p_user       ,
"
"								SYSDATE     ,
"
"								NULL       ,
"
"								NULL     ,
"
"								0   ,
"
"								cr_el.olce_req_hrs     ,
"
"								c_oh1.mrgoh_oh_rate
"
"							      );
"
"					END LOOP;
"
"
"
"	    		      END LOOP;
"
"
"
"
"
"	    	END IF;
"
"
"
"
"
"
"
"
"
"    Commit;
"
"
"
"  END proc_ins_mat_cost_frm_bom;
"
"
"
"END pkg_cost_estimation;"
/
