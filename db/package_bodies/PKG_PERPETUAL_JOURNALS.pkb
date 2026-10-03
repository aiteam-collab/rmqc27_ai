CREATE OR REPLACE
"PACKAGE BODY pkg_perpetual_journals
"
"AS
"
"
"
"  FUNCTION func_get_inv_method(p_bu	business_units.bu_id%TYPE)
"
"    RETURN appl_control.applctrl_inv_method%TYPE
"
"  IS
"
"    v_inv_mthd			appl_control.applctrl_inv_method%TYPE;
"
"    v_grn_jrnl_rqrd_flag	glm_control.glmctrl_ps_jrnl_opt%TYPE;
"
"  BEGIN
"
"
"
"    SELECT applctrl_inv_method
"
"      INTO v_inv_mthd
"
"      FROM appl_control
"
"     WHERE applctrl_bu = p_bu;
"
"
"
"    SELECT glmctrl_ps_jrnl_opt
"
"      INTO v_grn_jrnl_rqrd_flag
"
"      FROM glm_control
"
"     WHERE glmctrl_bu = p_bu;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('func_get_inv_method - '||v_inv_mthd);
"
"
"
"    RETURN v_inv_mthd;
"
"
"
"  EXCEPTION
"
"    WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20022,'ADM ');
"
"  END func_get_inv_method;
"
"
"
"  PROCEDURE proc_find_store_gl_accts(p_bu		IN	business_units.bu_id%TYPE,
"
"                                     p_plnt		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"				     p_plnt_loc		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"                                     p_benf_type	IN	VARCHAR2,
"
"                                     p_benf_id		IN	VARCHAR2,
"
"                                     p_terr_id		IN	sales_area_terr.sat_terr_id%TYPE,
"
"                                     p_cls_id		IN	products.prod_cls%TYPE,
"
"                                     p_sub_cls_id	IN	products.prod_sub_cls%TYPE,
"
"                                     p_tcf_id		IN	VARCHAR2,
"
"                                     p_acct_plnt	OUT	profit_cost_centers.pcc_ac_plnt%TYPE,
"
"				     p_acct_plnt_loc	OUT	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE,
"
"                                     p_acct_lvl1	OUT	profit_cost_centers.pcc_ac_lvl1%TYPE,
"
"                                     p_acct_lvl2	OUT	profit_cost_centers.pcc_ac_lvl2%TYPE,
"
"                                     p_acct_lvl3	OUT	profit_cost_centers.pcc_ac_lvl3%TYPE,
"
"                                     p_acct_lvl4	OUT	profit_cost_centers.pcc_ac_lvl4%TYPE,
"
"				     p_acct_lvl5	OUT	profit_cost_centers.pcc_ac_lvl5%TYPE,
"
"				     p_acct_lvl6	OUT	profit_cost_centers.pcc_ac_lvl6%TYPE,
"
"                                     p_acct_lvl_prj	OUT	profit_cost_centers.pcc_ac_lvl_prj%TYPE,
"
"				     p_acct_cc_code	OUT	profit_cost_centers.pcc_cc_code%TYPE,
"
"                                     p_acct		OUT	gl_accts.glac_acct%TYPE,
"
"                                     p_acct_inv_type    IN	VARCHAR2	DEFAULT 'I',
"
"				     p_sub_plnt		IN	VARCHAR2	DEFAULT NULL,
"
"				     p_tax_pct		IN	NUMBER		DEFAULT NULL,
"
"				     p_gst_supply	IN	VARCHAR2	DEFAULT 'A',
"
"				     p_gst_type		IN	VARCHAR2	DEFAULT 'L',
"
"				     p_prod_id		IN	VARCHAR2	DEFAULT	NULL,
"
"				     p_prod_rev		IN	VARCHAR2	DEFAULT NULL
"
"                                    )
"
"  IS
"
"  BEGIN
"
"    DBMS_OUTPUT.PUT_LINE('proc_find_store_gl_accts - Begin');
"
"
"
"    IF p_benf_type = 'ST' THEN
"
"      DBMS_OUTPUT.PUT_LINE('Warehouse Account - '||p_benf_id);
"
"      BEGIN
"
"
"
"        IF p_acct_inv_type = 'I' THEN
"
"
"
"	  --IF func_get_perp_acct_source(p_bu) = 'W' THEN
"
"	 -- Raise_Application_Error(-20999,'HRM');
"
"
"
"	    SELECT store_gl_acct INTO p_acct
"
"	      FROM stores
"
"	     WHERE store_bu = p_bu
"
"	       AND store_plnt = p_plnt
"
"	       AND store_plnt_loc_id = p_plnt_loc
"
"               AND store_id = p_benf_id;
"
"
"
"	  /*ELSE
"
"
"
"	    BEGIN
"
"	      SELECT ia_acct INTO p_acct
"
"	        FROM (SELECT 1 seq,'Item Wise' seq_desc,ia_acct
"
"	                FROM inv_accts
"
"	               WHERE ia_bu = p_bu
"
"	                 AND ia_prod_id = p_prod_id
"
"			 AND ia_subcls_id IS NULL
"
"			 AND ia_cls_id IS NULL
"
"		      UNION ALL
"
"	              SELECT 2 seq,'Sub Class Wise' seq_desc,ia_acct
"
"	                FROM inv_accts
"
"	               WHERE ia_bu = p_bu
"
"	                 AND ia_subcls_id = p_sub_cls_id
"
"			 AND ia_prod_id IS NULL
"
"			 AND ia_cls_id IS NULL
"
"	              UNION ALL
"
"		      SELECT 3 seq,'Class Wise' seq_desc,ia_acct
"
"	                FROM inv_accts
"
"	               WHERE ia_bu = p_bu
"
"	                 AND ia_cls_id = p_cls_id
"
"	                 AND ia_subcls_id IS NULL
"
"		         AND ia_prod_id IS NULL
"
"		      ORDER BY seq)
"
"               WHERE ROWNUM = 1;
"
"	    EXCEPTION
"
"	      WHEN OTHERS THEN
"
"	        Raise_Application_Error(-20612,'ICM '||p_bu||'/'||p_cls_id||'/'||func_find_subclass_qry_desc(p_bu,p_sub_cls_id,1));
"
"	    END;
"
"
"
"          END IF;*/
"
"
"
"        ELSIF p_acct_inv_type = 'E' THEN
"
"
"
"	  SELECT store_exp_acct
"
"            INTO p_acct
"
"	    FROM stores
"
"	   WHERE store_bu = p_bu
"
"	     AND store_plnt = p_plnt
"
"	     AND store_plnt_loc_id = p_plnt_loc
"
"             AND store_id = p_benf_id;
"
"
"
"        END IF;
"
"
"
"	IF p_acct IS NULL THEN
"
"          Raise_Application_Error(-20612,'ICM '||p_plnt||' '||p_benf_id);
"
"        ELSE
"
"          proc_find_cost_center(p_bu, p_plnt, 'PR', p_acct, NULL, NULL, NULL, NULL, p_acct_lvl1, p_acct_lvl2, p_acct_lvl3, p_acct_lvl4,
"
"	                        p_acct_lvl5,p_acct_lvl6,p_acct_lvl_prj, p_acct_plnt,p_acct_cc_code,
"
"				p_acct_plnt_loc,p_cls_id,p_sub_cls_id,p_sub_plnt => p_sub_plnt);
"
"        END IF;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_Application_Error(-20269, 'ICM '||'-'||p_bu||'-'||p_plnt||'-'||p_benf_id);
"
"      END;
"
"    ELSIF p_benf_type = 'IV' THEN
"
"      DBMS_OUTPUT.PUT_LINE('Warehouse Inventory Variance Account - '||p_benf_id);
"
"      BEGIN
"
"
"
"	SELECT store_inv_var_acct
"
"          INTO p_acct
"
"	  FROM stores
"
"	 WHERE store_bu = p_bu
"
"	   AND store_plnt = p_plnt
"
"	   AND store_plnt_loc_id = p_plnt_loc
"
"           AND store_id = p_benf_id;
"
"
"
"	IF p_acct IS NULL THEN
"
"          Raise_Application_Error(-20027,'ICM '||p_plnt||' '||p_benf_id);
"
"        ELSE
"
"          proc_find_cost_center(p_bu, p_plnt, 'PR', p_acct, NULL, NULL, NULL, NULL, p_acct_lvl1, p_acct_lvl2, p_acct_lvl3, p_acct_lvl4,
"
"	                        p_acct_lvl5,p_acct_lvl6,p_acct_lvl_prj, p_acct_plnt,p_acct_cc_code,
"
"				p_acct_plnt_loc,p_cls_id,p_sub_cls_id,p_sub_plnt => p_sub_plnt);
"
"        END IF;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_Application_Error(-20027, 'ICM '||'-'||p_bu||'-'||p_plnt||'-'||p_benf_id);
"
"      END;
"
"    ELSIF p_benf_type = 'DT' THEN
"
"      DBMS_OUTPUT.PUT_LINE('Department Account - '||p_benf_id);
"
"      BEGIN
"
"        SELECT dca_asst_acct
"
"          INTO p_acct
"
"          FROM(SELECT 1 seq_no,dca_asst_acct
"
"	         FROM dept_cls_accts
"
"	        WHERE dca_bu = p_bu
"
"	          AND dca_dept_id = p_benf_id
"
"	          AND dca_sub_cls = p_sub_cls_id
"
"	       UNION ALL
"
"	       SELECT 2 seq_no,dca_asst_acct
"
"	         FROM dept_cls_accts
"
"	        WHERE dca_bu = p_bu
"
"	          AND dca_dept_id = p_benf_id
"
"	          AND dca_cls_id = p_cls_id
"
"	       ORDER BY seq_no)
"
"	 WHERE ROWNUM = 1;
"
"
"
"      IF p_acct IS NOT NULL THEN
"
"        proc_find_cost_center(p_bu, p_plnt, 'PR', p_acct, NULL, NULL, NULL, NULL, p_acct_lvl1, p_acct_lvl2, p_acct_lvl3, p_acct_lvl4,
"
"	                      p_acct_lvl5,p_acct_lvl6,p_acct_lvl_prj, p_acct_plnt,p_acct_cc_code,p_acct_plnt_loc,
"
"			      p_cls_id,p_sub_cls_id,p_sub_plnt=>p_sub_plnt);
"
"      END IF;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_Application_Error(-20001,'POM ' || '-' || p_benf_id || '-' || p_cls_id);
"
"      END;
"
"    ELSIF p_benf_type = 'DI' THEN
"
"      DBMS_OUTPUT.PUT_LINE('Discount Account - '||p_benf_id);
"
"      BEGIN
"
"        SELECT pura_glacct_id INTO p_acct
"
"	  FROM purchase_accts
"
"	 WHERE pura_bu = p_bu
"
"	   AND pura_terr_id = p_terr_id
"
"	   AND pura_class_id = p_cls_id
"
"	   --AND (pura_tc_pct = p_tax_pct OR pura_tc_pct IS NULL)
"
"	   AND pura_gst_supply = p_gst_type
"
"	   AND pura_gst_type = p_gst_supply
"
"	   AND pura_type = 'PD'
"
"	   AND pura_active_flag = 'Y';
"
"
"
"        IF p_acct IS NOT NULL THEN
"
"          proc_find_cost_center(p_bu, p_plnt, 'PR', p_acct, NULL, NULL, NULL, NULL, p_acct_lvl1, p_acct_lvl2, p_acct_lvl3, p_acct_lvl4, p_acct_lvl5,p_acct_lvl6,p_acct_lvl_prj, p_acct_plnt,p_acct_cc_code,p_acct_plnt_loc,p_cls_id,p_sub_cls_id,p_sub_plnt=>p_sub_plnt);
"
"        END IF;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_Application_Error(-20999,'Purchase Discount Account not found. Class :'||
"
"	  func_find_class_qry_desc(p_bu,p_cls_id,1)||' SubClass :'||func_find_subclass_qry_desc(p_bu,p_sub_cls_id,1));
"
"      END;
"
"    ELSIF p_benf_type = 'PDT' THEN
"
"      DBMS_OUTPUT.PUT_LINE('Purchase Department Account - '||p_benf_id);
"
"      BEGIN
"
"     --Raise_Application_Error(-20999,'HRM '||p_terr_id||'/'||p_cls_id||'/'||p_sub_cls_id||'/'||p_tax_pct||'/'||p_gst_supply||'/'||p_gst_type);
"
"
"
"        --IF func_get_perp_acct_source(p_bu) = 'W' THEN
"
"
"
"	SELECT pura_glacct_id
"
"	  INTO p_acct
"
"	  FROM (SELECT 1 seq_no,pura_glacct_id
"
"                  FROM purchase_accts
"
"                 WHERE pura_bu = p_bu
"
"                   AND pura_type = 'PR'
"
"                   AND pura_terr_id = p_terr_id
"
"                   AND pura_class_id IS NULL
"
"                   AND pura_sub_cls_id = p_sub_cls_id
"
"		   AND pura_prod_id IS NULL
"
"		   AND (pura_tc_pct = p_tax_pct OR pura_tc_pct IS NULL)
"
"		   AND pura_gst_supply = p_gst_type
"
"		   AND pura_gst_type = p_gst_supply
"
"	        UNION ALL
"
"   	        SELECT 2 seq_no,pura_glacct_id
"
"                  FROM purchase_accts
"
"                 WHERE pura_bu = p_bu
"
"                   AND pura_type = 'PR'
"
"                   AND pura_terr_id = p_terr_id
"
"                   AND pura_class_id = p_cls_id
"
"                   AND pura_sub_cls_id IS NULL
"
"		   AND pura_prod_id IS NULL
"
"		   AND (pura_tc_pct = p_tax_pct OR pura_tc_pct IS NULL)
"
"		   AND pura_gst_supply = p_gst_type
"
"		   AND pura_gst_type = p_gst_supply
"
"	        UNION ALL
"
"   	        SELECT 3 seq_no,pura_glacct_id
"
"                  FROM purchase_accts
"
"                 WHERE pura_bu = p_bu
"
"                   AND pura_type = 'PR'
"
"                   AND pura_terr_id = p_terr_id
"
"                   AND pura_class_id IS NULL
"
"                   AND pura_sub_cls_id IS NULL
"
"		   AND pura_prod_id = p_prod_id
"
"		   AND (pura_tc_pct = p_tax_pct OR pura_tc_pct IS NULL)
"
"		   AND pura_gst_supply = p_gst_type
"
"		   AND pura_gst_type = p_gst_supply
"
"	         ORDER BY seq_no)
"
"	 WHERE ROWNUM = 1;
"
"
"
"        /*ELSE
"
"
"
"	    BEGIN
"
"	      SELECT ia_acct INTO p_acct
"
"	        FROM (SELECT 1 seq,'Item Wise' seq_desc,ia_acct
"
"	                FROM inv_accts
"
"	               WHERE ia_bu = p_bu
"
"	                 AND ia_prod_id = p_prod_id
"
"			 AND ia_subcls_id IS NULL
"
"			 AND ia_cls_id IS NULL
"
"		      UNION ALL
"
"	              SELECT 2 seq,'Sub Class Wise' seq_desc,ia_acct
"
"	                FROM inv_accts
"
"	               WHERE ia_bu = p_bu
"
"	                 AND ia_subcls_id = p_sub_cls_id
"
"			 AND ia_prod_id IS NULL
"
"			 AND ia_cls_id IS NULL
"
"	              UNION ALL
"
"		      SELECT 3 seq,'Class Wise' seq_desc,ia_acct
"
"	                FROM inv_accts
"
"	               WHERE ia_bu = p_bu
"
"	                 AND ia_cls_id = p_cls_id
"
"	                 AND ia_subcls_id IS NULL
"
"		         AND ia_prod_id IS NULL
"
"		      ORDER BY seq)
"
"               WHERE ROWNUM = 1;
"
"	    EXCEPTION
"
"	      WHEN OTHERS THEN
"
"	        Raise_Application_Error(-20612,'ICM '||p_bu||'/'||p_cls_id||'/'||func_find_subclass_qry_desc(p_bu,p_sub_cls_id,1));
"
"	    END;
"
"
"
"        END IF;*/
"
"
"
"        IF p_acct IS NOT NULL THEN
"
"          proc_find_cost_center(p_bu, p_plnt, 'PR', p_acct, NULL, NULL, NULL, NULL, p_acct_lvl1, p_acct_lvl2, p_acct_lvl3, p_acct_lvl4, p_acct_lvl5,p_acct_lvl6,p_acct_lvl_prj, p_acct_plnt,p_acct_cc_code,p_acct_plnt_loc,p_cls_id,p_sub_cls_id,p_sub_plnt=>p_sub_plnt);
"
"        END IF;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_Application_Error(-20010,'POM '|| p_terr_id || '-' ||func_find_class_qry_desc(p_bu,p_cls_id,1)||'-'||func_find_subclass_qry_desc(p_bu,p_sub_cls_id,1)||'-'||p_tax_pct||'/'||p_gst_supply||'/'||p_gst_type);
"
"      END;
"
"    END IF;
"
"    DBMS_OUTPUT.PUT_LINE('proc_find_store_gl_accts - End');
"
"  END proc_find_store_gl_accts;
"
"
"
"  PROCEDURE proc_ins_jrnl(p_bu			VARCHAR2,
"
"  			  p_jrnl_trans_no	VARCHAR2,
"
"  			  p_plnt		VARCHAR2,
"
"  			  p_vou_type		VARCHAR2,
"
"			  p_vou_sub_type	VARCHAR2,
"
"  			  p_vou_pfx		VARCHAR2,
"
"  			  p_vou_no		VARCHAR2,
"
"  			  p_vou_seq_no		NUMBER,
"
"  			  p_prod_id		products.prod_id%TYPE,
"
"  			  p_prod_rev		products.prod_rev%TYPE,
"
"  			  p_prod_desc11		products.prod_desc11%TYPE,
"
"  			  p_acct_plnt		VARCHAR2,
"
"			  p_plnt_loc		VARCHAR2,
"
"  			  p_lvl1		VARCHAR2,
"
"  			  p_lvl2		VARCHAR2,
"
"  			  p_lvl3		VARCHAR2,
"
"  			  p_lvl4		VARCHAR2,
"
"			  p_lvl5		VARCHAR2,
"
"			  p_lvl6		VARCHAR2,
"
"  			  p_lvl_prj		VARCHAR2,
"
"			  p_cc_code		VARCHAR2,
"
"  			  p_acct		VARCHAR2,
"
"  			  p_acct_desc		VARCHAR2,
"
"  			  p_vou_date		DATE,
"
"  			  p_vou_year		NUMBER,
"
"  			  p_vou_period		NUMBER,
"
"  			  p_fc_db_amt		NUMBER,
"
"  			  p_fc_cr_amt		NUMBER,
"
"  			  p_bc_db_amt		NUMBER,
"
"  			  p_bc_cr_amt		NUMBER,
"
"  			  p_store_id		VARCHAR2,
"
"  			  p_store_name		VARCHAR2,
"
"  			  p_dept_id		VARCHAR2,
"
"  			  p_dept_name		VARCHAR2,
"
"  			  p_rcpt_qty		NUMBER,
"
"  			  p_unit_cost		NUMBER,
"
"  			  p_source_doc		VARCHAR2,
"
"  			  p_appl		VARCHAR2,
"
"  			  p_reference1		VARCHAR2,
"
"  			  p_reference2		VARCHAR2,
"
"  			  p_suplr_id		VARCHAR2,
"
"  			  p_suplr_name		VARCHAR2,
"
"  			  p_tc_id		VARCHAR2,
"
"  			  p_tc_desc		VARCHAR2,
"
"  			  p_cls_id		VARCHAR2,
"
"  			  p_cls_desc		VARCHAR2,
"
"  			  p_sub_cls_id		VARCHAR2,
"
"  			  p_sub_cls_desc	VARCHAR2,
"
"  			  p_user		VARCHAR2,
"
"			  p_ref_no		VARCHAR2	DEFAULT NULL,
"
"			  p_ref_date		DATE		DEFAULT NULL,
"
"			  p_hsn_code		VARCHAR2	DEFAULT NULL,
"
"			  p_assbl_value		NUMBER		DEFAULT NULL,
"
"			  p_tc_pct		NUMBER		DEFAULT NULL,
"
"                          p_gstin_no		VARCHAR2	DEFAULT NULL,
"
"                          p_gst_type		VARCHAR2	DEFAULT 'G',
"
"                          p_lc_import_flag	VARCHAR2	DEFAULT 'N',
"
"                          p_grn_tc_type		VARCHAR2	DEFAULT 'R',
"
"                          p_gst_input_type	VARCHAR2	DEFAULT NULL,
"
"			  p_rcpt_type		VARCHAR2	DEFAULT 'ST',
"
"			  p_exchange_rate	NUMBER		DEFAULT NULL
"
"  			 )
"
"  IS
"
"    v_jrnl_trans_seq_no	appl_journals.aj_jrnl_trns_seq_no%TYPE;
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_jrnl - Begin');
"
"
"
"    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0)+1
"
"      INTO v_jrnl_trans_seq_no
"
"      FROM appl_journals
"
"     WHERE aj_bu = p_bu
"
"       AND aj_plnt = p_plnt
"
"       AND aj_jrnl_trns_no = p_jrnl_trans_no;
"
"
"
"    INSERT INTO appl_journals(aj_bu,
"
"                              aj_jrnl_trns_no,
"
"                              aj_jrnl_trns_seq_no,
"
"                              aj_vou_type,
"
"                              aj_vou_pfx,
"
"                              aj_vou_no,
"
"                              aj_jrnl_date,
"
"                              aj_jrnl_year,
"
"                              aj_jrnl_period,
"
"                              aj_vou_line_no,
"
"                              aj_prod_id,
"
"                              aj_prod_rev,
"
"                              aj_prod_desc1,
"
"                              aj_suplr_id,
"
"                              aj_suplr_name,
"
"                              aj_gl_lvl1,
"
"                              aj_gl_lvl2,
"
"                              aj_gl_lvl3,
"
"                              aj_gl_lvl4,
"
"			      aj_gl_lvl5,
"
"			      aj_gl_lvl6,
"
"                              aj_gl_lvl_prj,
"
"			      aj_cc_code,
"
"                              aj_gl_acct,
"
"                              aj_gl_acct_desc,
"
"                              aj_fc_db_amt,
"
"                              aj_fc_cr_amt,
"
"                              aj_bc_db_amt,
"
"                              aj_bc_cr_amt,
"
"                              aj_store_id,
"
"                              aj_store_name,
"
"                              aj_dept_id,
"
"                              aj_dept_desc,
"
"                              aj_trans_qty,
"
"                              aj_unit_cost,
"
"                              aj_status,
"
"                              aj_appl,
"
"                              aj_reference1,
"
"                              aj_reference2,
"
"                              aj_cre_by,
"
"                              aj_cre_date,
"
"                              aj_plnt,
"
"                              aj_acctg_plnt,
"
"			      aj_gl_plnt_loc_id,
"
"			      aj_src_plnt_loc_id,
"
"                              aj_tc_id,
"
"                              aj_tc_desc,
"
"                              aj_cls_id,
"
"                              aj_cls_desc,
"
"                              aj_sub_cls_id,
"
"                              aj_sub_cls_desc,
"
"			      aj_ref_no,
"
"			      aj_ref_date,
"
"			      aj_hsn_code,
"
"			      aj_assbl_value,
"
"			      aj_tc_pct,
"
"                              aj_gstin_no,
"
"                              aj_suplr_type,
"
"                              aj_lc_import_flag,
"
"			      aj_grn_tc_type,
"
"			      aj_input_type,
"
"			      aj_vat_match_type,
"
"			      aj_sub_vou_type,
"
"			      aj_db_ex_rate,
"
"			      aj_cr_ex_rate
"
"                             )
"
"                       VALUES(p_bu,
"
"                              p_jrnl_trans_no,
"
"                              v_jrnl_trans_seq_no,
"
"                              p_vou_type,
"
"                              p_vou_pfx,
"
"                              p_vou_no,
"
"                              p_vou_date,
"
"                              p_vou_year,
"
"                              p_vou_period,
"
"                              p_vou_seq_no,
"
"                              p_prod_id,
"
"                              p_prod_rev,
"
"                              p_prod_desc11,
"
"                              p_suplr_id,
"
"                              p_suplr_name,
"
"                              p_lvl1,
"
"                              p_lvl2,
"
"                              p_lvl3,
"
"                              p_lvl4,
"
"			      p_lvl5,
"
"			      p_lvl6,
"
"                              p_lvl_prj,
"
"			      p_cc_code,
"
"                              p_acct,
"
"                              p_acct_desc,
"
"                              p_fc_db_amt,
"
"                              p_fc_cr_amt,
"
"                              p_bc_db_amt,
"
"                              p_bc_cr_amt,
"
"                              p_store_id,
"
"                              p_store_name,
"
"                              p_dept_id,
"
"                              p_dept_name,
"
"                              p_rcpt_qty,
"
"                              p_unit_cost,
"
"                              'N',
"
"                              p_appl,
"
"                              p_reference1,
"
"                              p_reference2,
"
"                              p_user,
"
"                              SYSDATE,
"
"                              p_plnt,
"
"                              p_acct_plnt,
"
"			      p_plnt_loc,
"
"			      p_plnt_loc,
"
"                              p_tc_id,
"
"                              p_tc_desc,
"
"                              p_cls_id,
"
"                              p_cls_desc,
"
"                              p_sub_cls_id,
"
"                              p_sub_cls_desc,
"
"			      p_ref_no,
"
"                              p_ref_date,
"
"                              p_hsn_code,
"
"                              p_assbl_value,
"
"                              p_tc_pct,
"
"                              p_gstin_no,
"
"                              p_gst_type,
"
"                              p_lc_import_flag,
"
"			      p_grn_tc_type,
"
"			      p_gst_input_type,
"
"			      p_rcpt_type,
"
"			      p_vou_sub_type,
"
"			      p_exchange_rate,
"
"			      p_exchange_rate
"
"                             );
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_jrnl - End');
"
"  END;
"
"
"
"  PROCEDURE proc_ins_inward_jrnl_frm_grn(p_bu		IN	business_units.bu_id%TYPE,
"
"					 p_plnt		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"					 p_vou_pfx	IN	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"					 p_vou_no	IN	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"					 p_vou_seq_no	IN	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"					 p_user		IN	VARCHAR2,
"
"					 p_lang		IN	NUMBER,
"
"					 p_res		OUT	VARCHAR2
"
"					)
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM pur_ord_receipt_hd_view,pur_ord_receipt_ln_view,products
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND prod_bu = porl_bu
"
"         AND prod_id = porl_prod_id
"
"         AND prod_rev = porl_prod_rev
"
"         AND porh_bu = p_bu
"
"         AND porh_plnt = p_plnt
"
"         AND porh_receipt_pfx = p_vou_pfx
"
"         AND porh_receipt_no = p_vou_no
"
"         AND (porl_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND porh_type NOT IN ('SA')
"
"         AND porl_matl_type NOT IN ('CS','PC')
"
"         AND porl_status NOT IN ('C')
"
"       ORDER BY porl_seq_no;
"
"
"
"    CURSOR c_veh(c_reg_no	VARCHAR2) IS
"
"    SELECT *
"
"      FROM transport_vehicles
"
"     WHERE tv_bu = p_bu
"
"       AND tv_reg_no = c_reg_no;
"
"
"
"    r_veh		c_veh%ROWTYPE;
"
"
"
"    CURSOR c_pomctrl IS
"
"    SELECT *
"
"      FROM pom_control
"
"     WHERE pomctrl_bu = p_bu
"
"       AND pomctrl_plnt = p_plnt;
"
"
"
"    r_pomctrl		c_pomctrl%ROWTYPE;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER;
"
"    v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_rcpt_inv_qty	NUMBER;
"
"
"
"    v_fc_cost		NUMBER;
"
"    v_fc_disc_cost    	NUMBER;
"
"    v_bc_cost		NUMBER;
"
"    v_disc_cost		NUMBER;
"
"    v_chrg_amt		NUMBER;
"
"    v_cons_mat_cost	NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"    var_rcpt_unit_cost	NUMBER;
"
"    v_tax_amt		NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"    v_prod_desc1	products.prod_desc11%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_meis_plnt		VARCHAR2(10);
"
"
"
"    v_suplr_cr_amt	NUMBER;
"
"    v_lc_suplr_cr_amt	NUMBER;
"
"    v_tot_tax_amt	NUMBER;
"
"    v_lc_chrg_amt	NUMBER;
"
"    v_lc_oth_chrg_amt	NUMBER;
"
"    v_lc_epcg_amt	NUMBER;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"    v_frt_cost		NUMBER;
"
"
"
"    v_sub_plnt		VARCHAR2(10);
"
"    v_ge_no		VARCHAR2(15);
"
"    v_to_store_id	VARCHAR2(10);
"
"
"
"    v_vat_flag		VARCHAR2(1);
"
"    v_rcm_acct_type	VARCHAR2(5);
"
"
"
"    v_suplr_vat_amt	NUMBER := 0;
"
"    v_lic_no		VARCHAR2(100);
"
"
"
"    v_prod_cls		prod_plants.prodplnt_cls%TYPE;
"
"    v_prod_subcls	prod_plants.prodplnt_sub_cls%TYPE;
"
"
"
"    v_plnt_loc_id	pur_ord_receipt_hd.porh_plnt_loc_id%TYPE;
"
"
"
"    v_tax_jrnl_source	glm_control.glmctrl_tax_jrnl_srce%TYPE;
"
"
"
"    v_lc_suplr_gst_type	suplr_ship_loc.ssl_gst_type%TYPE;
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_inward_jrnl_frm_grn - Begin');
"
"
"
"    OPEN c_pomctrl;
"
"    FETCH c_pomctrl INTO r_pomctrl;
"
"    CLOSE c_pomctrl;
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_plnt_loc_id := cr1.porh_plnt_loc_id;
"
"
"
"        v_vou_date := cr1.porh_receipt_date;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"        --v_rcpt_qty := (cr1.porl_receipt_qty/cr1.porl_conv_factor);
"
"	IF cr1.prod_stocked = 'Y' THEN
"
"	  v_rcpt_qty := cr1.porl_stock_receipt_qty;
"
"	ELSE
"
"	  v_rcpt_qty := (cr1.porl_temp_inv_qty/cr1.porl_conv_factor);
"
"	END IF;
"
"
"
"	--v_rcpt_inv_qty := (cr1.porl_temp_inv_qty/cr1.porl_conv_factor);
"
"	v_rcpt_inv_qty :=  cr1.porl_stock_receipt_qty + (cr1.porl_excess_qty/cr1.porl_conv_factor);
"
"
"
"
"
"	/*SELECT LISTAGG(porptc_meis_lic_no, ',') WITHIN GROUP (ORDER BY porptc_meis_lic_no)
"
"	  INTO v_lic_no
"
"	  FROM por_prod_tax_charges_view
"
"	 WHERE porptc_bu = p_bu
"
"           AND porptc_receipt_pfx = p_vou_pfx
"
"           AND porptc_receipt_no = p_vou_no
"
"           AND porptc_receipt_seq_no = cr1.porl_seq_no
"
"	   AND porptc_type = 'L'
"
"	   AND porptc_meis_lic_no IS NOT NULL;
"
"
"
"	IF v_lic_no IS NOT NULL THEN
"
"	  v_lic_no := 'Lic : '||v_lic_no;
"
"	END IF;*/
"
"
"
"	v_upd_ref2 := CASE WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'PR' THEN 'GRN#('
"
"		           WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'SC' THEN 'SRN#('
"
"			   ELSE 'GRN#('
"
"		      END;
"
"
"
"        v_upd_ref1 := SUBSTR('GRN #('|| p_vou_pfx || '/' || p_vou_no || ') / ' || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"	--v_upd_ref1 := SUBSTR('GRN #('|| p_vou_pfx || '/' || p_vou_no || ') / ' || v_lic_no || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.porl_seq_no||')/PO#('||cr1.porl_po_pfx||'/'||cr1.porl_po_no||'/'
"
"			       ||cr1.porl_po_seq_no||'/'||cr1.porl_po_sub_seq_no||')/'||func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),1,150);
"
"
"
"        BEGIN
"
"          SELECT SUM(prplc_tc_amt) INTO v_lc_chrg_amt
"
"            FROM pur_rcpt_prod_land_costs_vw
"
"           WHERE prplc_bu = p_bu
"
"             AND prplc_rcpt_no = p_vou_no
"
"             AND prplc_rcpt_seq_no = cr1.porl_seq_no
"
"             AND prplc_chrg_flag = 'N';
"
"        END;
"
"
"
"        /*BEGIN
"
"	  SELECT SUM(porptc_tc_amt)
"
"	    INTO v_lc_oth_chrg_amt
"
"	    FROM por_prod_tax_charges_view
"
"	   WHERE porptc_bu = p_bu
"
"             AND porptc_receipt_pfx = p_vou_pfx
"
"             AND porptc_receipt_no = p_vou_no
"
"             AND porptc_receipt_seq_no = cr1.porl_seq_no
"
"	     AND porptc_type = 'L'
"
"	     --AND porptc_tc_type = 'T'
"
"	     AND porptc_vat_flag = 'N'
"
"	     AND ((porptc_sl_type = 'L' AND porptc_offset_acct IS NOT NULL) OR porptc_sl_type = 'I');
"
"	END;*/
"
"
"
"        /*BEGIN
"
"	  SELECT SUM(porptc_tc_amt)
"
"	    INTO v_lc_epcg_amt
"
"	    FROM por_prod_tax_charges_view
"
"	   WHERE porptc_bu = p_bu
"
"             AND porptc_receipt_pfx = p_vou_pfx
"
"             AND porptc_receipt_no = p_vou_no
"
"             AND porptc_receipt_seq_no = cr1.porl_seq_no
"
"	     AND porptc_type = 'L'
"
"	     AND porptc_vat_flag = 'N'
"
"	     AND porptc_sl_type = 'E';
"
"	END;*/
"
"	v_lc_epcg_amt := 0;
"
"
"
"	IF cr1.porh_type = 'AT' THEN
"
"
"
"	  SELECT DISTINCT siln_ge_no INTO v_ge_no
"
"	    FROM sales_invoices_hd,sales_invoices_ln
"
"	   WHERE sihd_bu = siln_bu
"
"	     AND sihd_plant = siln_plnt
"
"	     AND sihd_doc_no = siln_doc_no
"
"	     AND sihd_bu = p_bu
"
"	     AND sihd_plant = p_plnt
"
"	     AND sihd_stk_trfr_grn_pfx = p_vou_pfx
"
"	     AND sihd_stk_trfr_grn_no = p_vou_no;
"
"
"
"
"
"	  SELECT gehd_to_store_id INTO v_to_store_id
"
"	    FROM gate_entry_hd
"
"	   WHERE gehd_bu = p_bu
"
"	     AND gehd_plnt = p_plnt
"
"	     AND gehd_doc_no = v_ge_no;
"
"
"
"	 /* SELECT sp_sub_plnt_id
"
"	    INTO v_sub_plnt
"
"	    FROM sub_plants,sub_plants_wh_asso
"
"	   WHERE sp_bu = spwa_bu
"
"	     AND sp_sub_plnt_id = spwa_sub_plnt_id
"
"	     AND sp_bu = p_bu
"
"	     AND sp_plnt_id = p_plnt
"
"	     AND spwa_store_id = v_to_store_id;*/
"
"
"
"	  /*SELECT suplr_sub_plnt
"
"	    INTO v_sub_plnt
"
"	    FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"	     AND suplr_suplr_id = cr1.porh_suplr_id;*/
"
"	ELSE
"
"	  v_sub_plnt := NULL;
"
"	END IF;
"
"
"
"        IF (cr1.porh_mode = 'PR' AND (cr1.porl_matl_type = 'PR' OR
"
"	    (cr1.porl_matl_type = 'T' AND (cr1.prod_tc_charge_flag = 'N' OR cr1.prod_gl_acct_type = 'C')))) OR
"
"	   (cr1.porh_mode = 'SC' AND cr1.porl_matl_type = 'T' AND cr1.prod_tc_charge_flag = 'N') THEN
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Purchase Journals');
"
"
"
"          v_fc_cost := (cr1.porl_sc_unit_cost * cr1.porl_conv_factor) * v_rcpt_qty;
"
"	  v_fc_disc_cost := v_fc_cost * (cr1.porl_disc_pct / 100) + (cr1.porl_sc_lm_disc_amt * v_rcpt_qty);
"
"	--Raise_Application_Error(-20999,'HRM '||cr1.porl_sc_unit_cost||'/'||cr1.porl_rebate_unit_cost||'/'||cr1.porl_conv_factor||'/'||v_rcpt_qty);
"
"          v_bc_cost := v_fc_cost * cr1.porh_exchange_rate;
"
"
"
"          v_disc_cost := v_bc_cost * (cr1.porl_disc_pct / 100) + (cr1.porl_sc_lm_disc_amt * v_rcpt_qty * cr1.porh_exchange_rate);
"
"
"
"          v_chrg_amt := ((((cr1.porl_sc_chrg_amt + cr1.porl_bag_chrg_amt) * cr1.porl_conv_factor) * v_rcpt_qty) * cr1.porh_exchange_rate) + ((NVL(v_lc_chrg_amt,0) + NVL(v_lc_oth_chrg_amt,0) + NVL(v_lc_epcg_amt,0) /*+ (cr1.porl_ap_lc_chrg_amt * v_rcpt_qty)*/));
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	  SELECT SUM(scmcls_act_cons_qty * scmcls_unit_cost) INTO v_cons_mat_cost
"
"	    FROM sub_contr_mat_cons_lot_ser
"
"	   WHERE scmcls_bu = cr1.porl_bu
"
"	     AND scmcls_receipt_no = cr1.porl_receipt_no
"
"	     AND scmcls_seq_no = cr1.porl_seq_no;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"	  IF cr1.prod_stocked = 'Y' THEN
"
"
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"                                     'ST',
"
"                                     v_store_id,
"
"				     cr1.porh_terr_id,
"
"				     cr1.porl_cls_id,
"
"				     cr1.porl_sub_cls_id,
"
"				     cr1.porl_tcf_id,
"
"				     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"				     v_acct_lvl1,
"
"				     v_acct_lvl2,
"
"				     v_acct_lvl3,
"
"				     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"				     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"				     v_acct,
"
"				     p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => cr1.porl_tax_pct,
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"                                     p_prod_id => cr1.porl_prod_id
"
"				    );
"
"
"
"	  ELSE
"
"	--Raise_Application_Error(-20999,'HRM '||cr1.porl_seq_no);
"
"	    v_dept_id := cr1.porl_storage_store_id;
"
"	    v_dept_desc := func_find_dept_desc(p_bu,v_dept_id,p_lang);
"
"
"
"	    IF /*cr1.porl_matl_type = 'T' AND*/ cr1.porl_pur_acct IS NOT NULL THEN
"
"	      v_acct := cr1.porl_pur_acct;
"
"	    ELSE
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"                                     'PDT',
"
"                                     v_dept_id,
"
"				     cr1.porh_terr_id,
"
"				     cr1.porl_cls_id,
"
"				     cr1.porl_sub_cls_id,
"
"				     cr1.porl_tcf_id,
"
"				     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"				     v_acct_lvl1,
"
"				     v_acct_lvl2,
"
"				     v_acct_lvl3,
"
"				     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"				     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"				     v_acct,
"
"				     p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => cr1.porl_tax_pct,
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"				     p_prod_id => cr1.porl_prod_id
"
"				    );
"
"	    END IF;
"
"
"
"            IF v_acct IS NOT NULL THEN
"
"              proc_find_cost_center(p_bu, cr1.porh_plnt, 'PR', v_acct, v_dept_id, NULL, NULL, NULL,
"
"	                            v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj, v_acct_plnt,v_acct_cc_code,
"
"				    v_acct_plnt_loc,
"
"				    p_loc_id => cr1.porh_plnt_loc_id
"
"				   );
"
"            END IF;
"
"
"
"	  END IF;
"
"
"
"	    IF cr1.porl_cc_code IS NOT NULL THEN
"
"
"
"	      v_acct_cc_code := cr1.porl_cc_code;
"
"
"
"	      SELECT pcc_ac_plnt,pcc_ac_lvl1,pcc_ac_lvl2,pcc_ac_lvl3,pcc_ac_lvl4,pcc_ac_lvl5,pcc_ac_lvl6,pcc_ac_lvl_prj
"
"		INTO v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj
"
"		FROM profit_cost_centers
"
"	       WHERE pcc_bu = p_bu
"
"		 AND pcc_cc_code = cr1.porl_cc_code;
"
"
"
"	    END IF;
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          IF cr1.porl_net_disc_flag = 'Y' THEN
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt) - v_disc_cost + NVL(v_cons_mat_cost,0);
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			  cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          ROUND(v_fc_cost-v_fc_disc_cost+NVL(v_lc_chrg_amt,0),v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          (((cr1.porl_sc_unit_cost - (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) + cr1.porl_sc_chrg_amt + cr1.porl_bag_chrg_amt) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"          ELSE
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt + NVL(v_cons_mat_cost,0));
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			  cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          ROUND(v_fc_cost+NVL(v_lc_chrg_amt,0),v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          ((cr1.porl_sc_unit_cost + cr1.porl_sc_chrg_amt + cr1.porl_bag_chrg_amt) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"
"
"          END IF;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"	  FOR cr_scm IN (SELECT *
"
"	                   FROM sub_contr_mat_cons_lot_ser,products
"
"			  WHERE prod_bu = scmcls_bu
"
"			    AND prod_id = scmcls_prod_id
"
"			    AND prod_rev = scmcls_prod_rev
"
"			    AND scmcls_bu = cr1.porl_bu
"
"			    AND scmcls_receipt_no = cr1.porl_receipt_no
"
"			    AND scmcls_seq_no = cr1.porl_seq_no
"
"			    AND scmcls_act_cons_qty > 0)
"
"	  LOOP
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Subcontract Consumption Journals - Start');
"
"
"
"	    v_store_id := cr_scm.scmcls_store_id;
"
"	    v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	  --Raise_Application_Error(-20999,'HRM '||cr_scm.scmcls_prod_id||'/'||func_find_subclass_desc(p_bu,cr_scm.prod_sub_cls,1));
"
"
"
"	    proc_find_store_gl_accts(p_bu,
"
"	                             cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"				     'ST',
"
"				     v_store_id,
"
"				     NULL,
"
"				     cr_scm.prod_cls,
"
"				     cr_scm.prod_sub_cls,
"
"				     NULL,
"
"				     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"				     v_acct_lvl1,
"
"				     v_acct_lvl2,
"
"				     v_acct_lvl3,
"
"				     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"				     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"				     v_acct,
"
"				     p_sub_plnt => v_sub_plnt,
"
"                                     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"                                     p_prod_id => cr_scm.scmcls_prod_id
"
"				    );
"
"
"
"	    v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"	                                                v_acct_lvl1,
"
"							v_acct_lvl2,
"
"							v_acct_lvl3,
"
"							v_acct_lvl4,
"
"							v_acct_lvl_prj,
"
"							v_acct,
"
"							v_acct_plnt,
"
"							p_lang
"
"						       );
"
"
"
"	    v_prod_desc1 := func_find_prod_desc(p_bu,
"
"			                        cr_scm.scmcls_prod_id,
"
"				                cr_scm.scmcls_prod_rev,
"
"						p_lang
"
"			                       );
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"			  cr1.porh_plnt,
"
"			  CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			  cr1.porh_type,
"
"			  cr1.porh_receipt_pfx,
"
"			  cr1.porl_receipt_no,
"
"			  cr1.porl_seq_no,
"
"			  cr_scm.scmcls_prod_id,
"
"			  cr_scm.scmcls_prod_rev,
"
"			  v_prod_desc1,
"
"			  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"			  v_acct_lvl1,
"
"			  v_acct_lvl2,
"
"			  v_acct_lvl3,
"
"			  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"			  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"			  v_acct,
"
"			  v_acct_desc,
"
"			  v_vou_date,
"
"			  v_vou_year,
"
"			  v_vou_period,
"
"			  0,
"
"			  ROUND(cr_scm.scmcls_act_cons_qty * cr_scm.scmcls_unit_cost,v_rnd),
"
"			  0,
"
"			  ROUND(cr_scm.scmcls_act_cons_qty * cr_scm.scmcls_unit_cost,v_rnd),
"
"			  v_store_id,
"
"			  v_store_desc,
"
"			  v_dept_id,
"
"			  v_dept_desc,
"
"			  cr_scm.scmcls_act_cons_qty,
"
"			  cr_scm.scmcls_unit_cost,
"
"			  'GRN',
"
"			  'POM',
"
"			  v_upd_ref1,
"
"			  v_upd_ref2,
"
"			  NULL,--cr1.porh_suplr_id,
"
"			  NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			  NULL,
"
"			  NULL,
"
"			  cr1.porl_cls_id,
"
"			  func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			  cr1.porl_sub_cls_id,
"
"			  func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"			 );
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Subcontract Consumption Journals - End');
"
"
"
"	  END LOOP;
"
"
"
"	  IF cr1.porl_excess_qty > 0 AND cr1.prod_stocked = 'Y' THEN
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Debit Journals for Excess Stk - Start');
"
"
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'X');
"
"	    v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"				     'ST',
"
"				     v_store_id,
"
"				     cr1.porh_terr_id,
"
"				     cr1.porl_cls_id,
"
"				     cr1.porl_sub_cls_id,
"
"				     cr1.porl_tcf_id,
"
"				     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"				     v_acct_lvl1,
"
"				     v_acct_lvl2,
"
"				     v_acct_lvl3,
"
"				     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"				     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"				     v_acct,
"
"				     p_sub_plnt => v_sub_plnt,
"
"                                     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"				     p_prod_id => cr1.porl_prod_id
"
"				    );
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                        v_acct_lvl1,
"
"							v_acct_lvl2,
"
"							v_acct_lvl3,
"
"							v_acct_lvl4,
"
"							v_acct_lvl_prj,
"
"							v_acct,
"
"							v_acct_plnt,
"
"							p_lang
"
"						       );
"
"
"
"            IF cr1.porl_net_disc_flag = 'Y' THEN
"
"            var_rcpt_unit_cost := (((((cr1.porl_sc_unit_cost) + cr1.porl_sc_chrg_amt + cr1.porl_bag_chrg_amt) -
"
"                                     ((cr1.porl_sc_unit_cost) * (cr1.porl_disc_pct / 100))
"
"				    ) * cr1.porh_exchange_rate
"
"			           ) + cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost /*+ cr1.porl_ap_lc_chrg_amt*/
"
"			          ) * cr1.porl_conv_factor;
"
"	    ELSE
"
"            var_rcpt_unit_cost := ((((cr1.porl_sc_unit_cost) + cr1.porl_sc_chrg_amt + cr1.porl_bag_chrg_amt) * cr1.porh_exchange_rate
"
"			           ) + cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost /*+ cr1.porl_ap_lc_chrg_amt*/
"
"			          ) * cr1.porl_conv_factor;
"
"            END IF;
"
"	    proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          ROUND((cr1.porl_excess_qty/cr1.porl_conv_factor) * var_rcpt_unit_cost,v_rnd),
"
"                          0,
"
"                          ROUND((cr1.porl_excess_qty/cr1.porl_conv_factor) * var_rcpt_unit_cost,v_rnd),
"
"                          0,
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          cr1.porl_excess_qty,
"
"                          var_rcpt_unit_cost,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"
"
"	  END IF;
"
"	  DBMS_OUTPUT.PUT_LINE('Debit Journals for Excess Stk - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Tax Journals - Start');
"
"
"
"          SELECT glmctrl_tax_jrnl_srce INTO v_tax_jrnl_source
"
"            FROM glm_control
"
"           WHERE glmctrl_bu = p_bu;
"
"
"
"          v_suplr_cr_amt := 0;
"
"      v_tot_tax_amt := 0;
"
"      v_suplr_vat_amt := 0;
"
"
"
"      IF cr1.porl_igst_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_igst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_igst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"	IF cr1.porl_rcm_flag = 'Y' THEN
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','GSTR',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_igst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(cr1.porl_igst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"	ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"	END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_igst_amt;
"
"      END IF;
"
"
"
"      IF cr1.porl_cgst_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_cgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_cgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        IF cr1.porl_rcm_flag = 'Y' THEN
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L','GSTR',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_cgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(cr1.porl_cgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"	ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"	END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_cgst_amt;
"
"      END IF;
"
"
"
"      IF cr1.porl_sgst_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_sgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_sgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"	IF cr1.porl_rcm_flag = 'Y' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S','GSTR',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_sgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(cr1.porl_sgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"	ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"	END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_sgst_amt;
"
"      END IF;
"
"
"
"      IF cr1.porl_utgst_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'U',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_utgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_utgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"	IF cr1.porl_rcm_flag = 'Y' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'U','GSTR',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_utgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(cr1.porl_utgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"	ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"	END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_sgst_amt;
"
"      END IF;
"
"
"
"      IF cr1.porl_cess_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'C',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,cr1.porl_cess_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_cess_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_cess_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        IF cr1.porl_rcm_flag = 'Y' THEN
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'C','GSTR',cr1.porl_cess_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_cess_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(cr1.porl_cess_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"        ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"	END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_cess_amt;
"
"      END IF;
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Tax Journals - End');
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Landed Cost Journals - Start');
"
"
"
"      FOR r_lc IN (SELECT *
"
"                     FROM pur_rcpt_prod_land_costs,products,classes
"
"                    WHERE prod_bu = prplc_bu
"
"		      AND prod_id = prplc_prod_id
"
"		      AND class_bu = prod_bu
"
"		      AND class_id = prod_cls
"
"		      AND prplc_bu = p_bu
"
"                      AND prplc_rcpt_no = cr1.porl_receipt_no
"
"                      AND prplc_rcpt_seq_no = cr1.porl_seq_no
"
"                    ORDER BY prplc_seq_no)
"
"      LOOP
"
"
"
"	IF r_lc.prplc_chrg_flag <> 'N' THEN
"
"
"
"	  IF r_lc.class_type = 'IG' AND r_lc.prplc_type <> 'L' THEN
"
"
"
"              proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','PDF',r_lc.prplc_tc_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"	  ELSIF r_lc.class_type <> 'IG' AND r_lc.prplc_type = 'S' THEN
"
"
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"                                     'PDT',
"
"                                     v_dept_id,
"
"				     cr1.porh_terr_id,
"
"				     r_lc.prod_cls,
"
"				     r_lc.prod_sub_cls,
"
"				     cr1.porl_tcf_id,
"
"				     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"				     v_acct_lvl1,
"
"				     v_acct_lvl2,
"
"				     v_acct_lvl3,
"
"				     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"				     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"				     v_acct,
"
"				     p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => r_lc.prplc_tc_pct,
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"				     p_prod_id => cr1.porl_prod_id
"
"				    );
"
"				    --Raise_Application_Error(20999,'Test ');
"
"            ELSIF r_lc.prplc_type = 'L' THEN
"
"
"
"	      v_acct := r_lc.prplc_pur_acct;
"
"
"
"	      proc_find_cost_center(p_bu, cr1.porh_plnt, 'PR',v_acct, v_dept_id, cr1.porl_proj_id, cr1.porl_so_pfx, cr1.porl_so_no,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj, v_acct_plnt,v_acct_cc_code,v_acct_plnt_loc,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"
"
"
"
"            END IF;
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(r_lc.prplc_tc_amt,v_rnd),
"
"                      0,
"
"                      ROUND(r_lc.prplc_tc_amt,v_rnd),
"
"		      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      r_lc.prplc_tc_amt / v_rcpt_inv_qty,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      r_lc.prplc_suplr_id,
"
"                      func_find_party_name(p_bu,r_lc.prplc_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"	END IF;
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Tax Journals - Start');
"
"
"
"	IF r_lc.prplc_type = 'S' THEN
"
"	  BEGIN
"
"	    SELECT ssl_gst_type INTO v_lc_suplr_gst_type
"
"	      FROM suplr_ship_loc
"
"	     WHERE ssl_bu = p_bu
"
"	       AND ssl_suplr_id = r_lc.prplc_suplr_id
"
"	       AND ssl_loc_name1 = r_lc.prplc_billfr_loc;
"
"	  EXCEPTION
"
"	    WHEN NO_DATA_FOUND THEN
"
"	      Raise_Application_Error(-20999,'Supplier not found.');
"
"	  END;
"
"	ELSE
"
"	  v_lc_suplr_gst_type := 'R';
"
"	END IF;
"
"
"
"      v_lc_suplr_cr_amt := 0;
"
"
"
"      IF r_lc.prplc_igst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','PDF',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        v_tax_amt := r_lc.prplc_igst_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(cr1.porl_igst_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        IF v_lc_suplr_gst_type = 'R' THEN
"
"
"
"	  v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"
"
"	ELSE
"
"
"
"	  proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','GSTR',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                         v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"		      0,
"
"                      ROUND(cr1.porl_igst_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"      IF r_lc.prplc_cgst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L','PDF',r_lc.prplc_igst_pct,NULL,--func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_lc.prplc_cgst_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(r_lc.prplc_cgst_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        IF v_lc_suplr_gst_type = 'R' THEN
"
"	  v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"	ELSE
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L','GSTR',r_lc.prplc_igst_pct,NULL,--func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"		      0,
"
"                      ROUND(r_lc.prplc_cgst_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"	END IF;
"
"
"
"
"
"      END IF;
"
"
"
"      IF r_lc.prplc_sgst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S','PDF',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        v_tax_amt := r_lc.prplc_sgst_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(r_lc.prplc_sgst_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        IF v_lc_suplr_gst_type = 'R' THEN
"
"	  v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"	ELSE
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S','GSTR',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"		      0,
"
"                      ROUND(r_lc.prplc_sgst_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"      IF r_lc.prplc_cess_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'C','PDF',r_lc.prplc_cess_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        v_tax_amt := r_lc.prplc_cess_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(r_lc.prplc_cess_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"
"
"      END IF;
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Tax Journals - End');
"
"
"
"      IF r_lc.prplc_type = 'L' THEN
"
"        v_acct := r_lc.prplc_offset_acct;
"
"	proc_find_cost_center(p_bu,cr1.porh_plnt,'PR',v_acct,v_dept_id,cr1.porl_proj_id,cr1.porl_so_pfx,cr1.porl_so_no,
"
"                              v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj, v_acct_plnt,
"
"			      v_acct_cc_code,v_acct_plnt_loc,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"      ELSE
"
"      proc_find_suplr_offset(p_bu,r_lc.prplc_suplr_id,cr1.porh_plnt,cr1.porh_plnt_loc_id,v_acct_plnt,
"
"                             v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct,v_acct_plnt_loc,v_sub_plnt,p_ap_accr_type => 'APALC');
"
"      END IF;
"
"
"
"      v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"      proc_ins_jrnl(p_bu,
"
"                    v_jrnl_trans_no,
"
"                    cr1.porh_plnt,
"
"                    CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"                    cr1.porh_type,
"
"                    cr1.porh_receipt_pfx,
"
"                    cr1.porl_receipt_no,
"
"                    cr1.porl_seq_no,
"
"                    cr1.porl_prod_id,
"
"                    cr1.porl_prod_rev,
"
"                    cr1.porl_prod_desc1,
"
"                    v_acct_plnt,
"
"                    cr1.porh_plnt_loc_id,
"
"                    v_acct_lvl1,
"
"                    v_acct_lvl2,
"
"                    v_acct_lvl3,
"
"                    v_acct_lvl4,
"
"                    v_acct_lvl5,
"
"                    v_acct_lvl6,
"
"                    v_acct_lvl_prj,
"
"                    v_acct_cc_code,
"
"                    v_acct,
"
"                    v_acct_desc,
"
"                    v_vou_date,
"
"                    v_vou_year,
"
"                    v_vou_period,
"
"                    0,
"
"                    ROUND(r_lc.prplc_tc_amt + v_lc_suplr_cr_amt,v_rnd),
"
"                    0,
"
"                    ROUND(r_lc.prplc_tc_amt + v_lc_suplr_cr_amt,v_rnd),
"
"                    v_store_id,
"
"                    v_store_desc,
"
"                    v_dept_id,
"
"                    v_dept_desc,
"
"                    v_rcpt_qty,
"
"                    (r_lc.prplc_tc_amt + v_lc_suplr_cr_amt) / v_rcpt_qty,
"
"                    'GRN',
"
"                    'POM',
"
"                    v_upd_ref1,
"
"                    v_upd_ref2,
"
"                    r_lc.prplc_suplr_id,
"
"                    func_find_party_name(p_bu,r_lc.prplc_suplr_id,p_lang),
"
"                    NULL,
"
"                    NULL,
"
"                    cr1.porl_cls_id,
"
"                    func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                    cr1.porl_sub_cls_id,
"
"                    func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                    p_user,
"
"                    p_ref_no => cr1.porh_suplr_doc_no,
"
"                    p_ref_date => cr1.porh_suplr_doc_date,
"
"	            p_hsn_code => cr1.porl_hsn_code,
"
"	            p_gstin_no => cr1.porh_gstn_no,
"
"	            p_gst_type => cr1.porh_gst_type,
"
"	            p_grn_tc_type => 'R',
"
"	            p_gst_input_type => cr1.porl_gst_input_type,
"
"	            p_rcpt_type => cr1.porh_type,
"
"	            p_exchange_rate => cr1.porh_exchange_rate
"
"                   );
"
"
"
"    END LOOP;
"
"    DBMS_OUTPUT.PUT_LINE('Landed Cost Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"	  IF cr1.porl_foc_flag = 'N' THEN
"
"            proc_find_suplr_offset(p_bu,
"
"			           cr1.porh_suplr_id,
"
"			           cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"			           v_acct_plnt,
"
"			           v_acct_lvl1,
"
"			           v_acct_lvl2,
"
"			           v_acct_lvl3,
"
"			           v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"			           v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"			           v_acct,
"
"				   v_acct_plnt_loc,
"
"				   v_sub_plnt,
"
"				   p_ap_accr_type => CASE WHEN cr1.porh_mode = 'SC' THEN 'APAS' WHEN cr1.porh_type = 'GRNPT' THEN 'APAST' ELSE 'APAP' END
"
"			          );
"
"	  ELSE
"
"	    proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"                                     'ST',
"
"                                     cr1.porl_storage_store_id,
"
"				     cr1.porh_terr_id,
"
"				     cr1.porl_cls_id,
"
"				     cr1.porl_sub_cls_id,
"
"				     cr1.porl_tcf_id,
"
"				     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"				     v_acct_lvl1,
"
"				     v_acct_lvl2,
"
"				     v_acct_lvl3,
"
"				     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"				     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"				     v_acct,
"
"				     p_sub_plnt => v_sub_plnt,
"
"                                     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag
"
"				    );
"
"          END IF;
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          v_fc_cost := ((cr1.porl_sc_unit_cost) * cr1.porl_conv_factor) * v_rcpt_inv_qty;
"
"	  v_fc_disc_cost := v_fc_cost * (cr1.porl_disc_pct / 100) + (cr1.porl_sc_lm_disc_amt * v_rcpt_qty);
"
"
"
"          v_bc_cost := v_fc_cost * cr1.porh_exchange_rate;
"
"
"
"          v_disc_cost := v_bc_cost * (cr1.porl_disc_pct / 100) + (cr1.porl_sc_lm_disc_amt * v_rcpt_qty * cr1.porh_exchange_rate);
"
"
"
"	  IF cr1.porh_frt_act = 'O' THEN
"
"
"
"	    SELECT SUM(prcs_share_amt)
"
"	      INTO v_frt_cost
"
"	      FROM pur_rct_chrg_shares
"
"	     WHERE prcs_bu = p_bu
"
"	       AND prcs_rcpt_pfx = p_vou_pfx
"
"	       AND prcs_rcpt_no = p_vou_no
"
"	       AND prcs_sou_seq_no = cr1.porl_seq_no
"
"	       AND EXISTS(SELECT 1
"
"	                    FROM pur_ord_receipt_ln,classes
"
"			   WHERE porl_bu = prcs_bu
"
"			     AND porl_receipt_no = prcs_rcpt_no
"
"			     AND porl_seq_no = prcs_rcpt_seq_no
"
"			     AND class_bu = porl_bu
"
"			     AND class_id = porl_cls_id
"
"			     AND porl_bu = p_bu
"
"			     AND porl_receipt_no = p_vou_no
"
"			     AND class_type = 'FR');
"
"
"
"            v_frt_cost := NVL(v_frt_cost,0);
"
"	  ELSE
"
"	    v_frt_cost := 0;
"
"	  END IF;
"
"
"
"	  IF v_frt_cost > 0 THEN
"
"
"
"	    OPEN c_veh(cr1.porh_veh_no);
"
"	    FETCH c_veh INTO r_veh;
"
"	      IF c_veh%NOTFOUND THEN
"
"	        v_frt_cost := 0;
"
"              ELSE
"
"
"
"	        IF r_veh.tv_acct_id IS NULL THEN
"
"		  Raise_Application_Error(-20729,'CDM ');
"
"		END IF;
"
"
"
"		IF r_veh.tv_lvl1 IS NULL OR r_veh.tv_lvl2 IS NULL OR r_veh.tv_lvl3 IS NULL OR r_veh.tv_lvl4 IS NULL OR r_veh.tv_prj_lvl IS NULL THEN
"
"		  Raise_Application_Error(-20002,'APM ');
"
"		END IF;
"
"
"
"                proc_ins_jrnl(p_bu,
"
"	                      v_jrnl_trans_no,
"
"	                      cr1.porh_plnt,
"
"	                      CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			      cr1.porh_type,
"
"	                      cr1.porh_receipt_pfx,
"
"	                      cr1.porl_receipt_no,
"
"	                      cr1.porl_seq_no,
"
"	                      cr1.porl_prod_id,
"
"	                      cr1.porl_prod_rev,
"
"	                      cr1.porl_prod_desc1,
"
"	                      cr1.porh_plnt,
"
"			      cr1.porh_plnt_loc_id,
"
"	                      r_veh.tv_lvl1,
"
"	                      r_veh.tv_lvl2,
"
"	                      r_veh.tv_lvl3,
"
"	                      r_veh.tv_lvl4,
"
"			      r_veh.tv_lvl5,
"
"			      r_veh.tv_lvl6,
"
"	                      r_veh.tv_prj_lvl,
"
"			      NULL,
"
"	                      r_veh.tv_acct_id,
"
"	                      func_find_gl_level_acct_desc(p_bu,r_veh.tv_lvl1,r_veh.tv_lvl2,r_veh.tv_lvl3,r_veh.tv_lvl4,r_veh.tv_prj_lvl,r_veh.tv_acct_id,cr1.porh_plnt,p_lang),
"
"	                      v_vou_date,
"
"	                      v_vou_year,
"
"	                      v_vou_period,
"
"	                      0,
"
"	                      ROUND(v_frt_cost,v_rnd),
"
"	                      0,
"
"	                      ROUND(v_frt_cost,v_rnd),
"
"	                      v_store_id,
"
"	                      v_store_desc,
"
"	                      v_dept_id,
"
"	                      v_dept_desc,
"
"	                      v_rcpt_qty,
"
"	                      v_frt_cost / v_rcpt_inv_qty,
"
"	                      'GRN',
"
"	                      'POM',
"
"	                      v_upd_ref1,
"
"	                      v_upd_ref2,
"
"	                      cr1.porh_suplr_id,
"
"	                      func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                      NULL,
"
"	                      NULL,
"
"                              cr1.porl_cls_id,
"
"                              func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                              cr1.porl_sub_cls_id,
"
"                              func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                      p_user,
"
"			      p_ref_no => cr1.porh_suplr_doc_no,
"
"			      p_ref_date => cr1.porh_suplr_doc_date,
"
"			      p_hsn_code => cr1.porl_hsn_code,
"
"			      p_assbl_value => 0,
"
"			      p_tc_pct => 0,
"
"			      p_gstin_no => cr1.porh_gstn_no,
"
"			      p_gst_type => cr1.porh_gst_type,
"
"			      p_lc_import_flag => 'N',
"
"			      p_grn_tc_type => 'R',
"
"			      p_gst_input_type => cr1.porl_gst_input_type,
"
"			      p_rcpt_type => cr1.porh_type,
"
"			      p_exchange_rate => cr1.porh_exchange_rate
"
"                             );
"
"
"
"	      END IF;
"
"	    CLOSE c_veh;
"
"
"
"	  END IF;
"
"
"
"          v_chrg_amt := ((((cr1.porl_sc_chrg_amt + cr1.porl_bag_chrg_amt) * cr1.porl_conv_factor) * v_rcpt_inv_qty) * cr1.porh_exchange_rate) /*+ (NVL(v_lc_chrg_amt,0))*/ - v_frt_cost - v_suplr_vat_amt /*+ (cr1.porl_ap_lc_chrg_amt * v_rcpt_qty)*/;
"
"
"
"          IF cr1.porl_net_disc_flag = 'Y' THEN
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt + v_suplr_cr_amt) - v_disc_cost /*+ NVL(cr1.porl_tcs_amt,0)*/;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  0,
"
"	                  ROUND(NVL(v_fc_cost,0) - NVL(v_fc_disc_cost,0) + NVL(v_tot_tax_amt,0),v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_inv_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"          ELSE
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt + v_suplr_cr_amt) - v_disc_cost /*+ NVL(cr1.porl_tcs_amt,0)*/;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  0,
"
"	                  ROUND(v_fc_cost + v_tot_tax_amt - v_fc_disc_cost,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"
"
"            IF v_disc_cost > 0 THEN
"
"
"
"              DBMS_OUTPUT.PUT_LINE('Discount Journals - Start');
"
"
"
"              proc_find_store_gl_accts(p_bu,
"
"                                       cr1.porh_plnt,
"
"				       cr1.porh_plnt_loc_id,
"
"                                       'DI',
"
"                                       v_store_id,
"
"                                       cr1.porh_terr_id,
"
"                                       cr1.porl_cls_id,
"
"                                       cr1.porl_sub_cls_id,
"
"                                       cr1.porl_tcf_id,
"
"                                       v_acct_plnt,
"
"				       v_acct_plnt_loc,
"
"                                       v_acct_lvl1,
"
"                                       v_acct_lvl2,
"
"                                       v_acct_lvl3,
"
"                                       v_acct_lvl4,
"
"				       v_acct_lvl5,
"
"				       v_acct_lvl6,
"
"                                       v_acct_lvl_prj,
"
"				       v_acct_cc_code,
"
"                                       v_acct,
"
"				       p_sub_plnt => v_sub_plnt,
"
"                                       p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				       p_gst_supply => cr1.porh_gst_clf_type,
"
"				       p_gst_type => cr1.porl_gst_exempt_flag
"
"                                      );
"
"
"
"	      v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"             proc_ins_jrnl(p_bu,
"
"	                    v_jrnl_trans_no,
"
"	                    cr1.porh_plnt,
"
"	                    CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			    cr1.porh_type,
"
"	                    cr1.porh_receipt_pfx,
"
"	                    cr1.porl_receipt_no,
"
"	                    cr1.porl_seq_no,
"
"	                    cr1.porl_prod_id,
"
"	                    cr1.porl_prod_rev,
"
"	                    cr1.porl_prod_desc1,
"
"	                    v_acct_plnt,
"
"			    cr1.porh_plnt_loc_id,
"
"	                    v_acct_lvl1,
"
"	                    v_acct_lvl2,
"
"	                    v_acct_lvl3,
"
"	                    v_acct_lvl4,
"
"			    v_acct_lvl5,
"
"			    v_acct_lvl6,
"
"	                    v_acct_lvl_prj,
"
"			    v_acct_cc_code,
"
"	                    v_acct,
"
"	                    v_acct_desc,
"
"	                    v_vou_date,
"
"	                    v_vou_year,
"
"	                    v_vou_period,
"
"	                    0,
"
"	                    ROUND(v_disc_cost,v_rnd),
"
"	                    0,
"
"	                    ROUND(v_disc_cost,v_rnd),
"
"	                    v_store_id,
"
"	                    v_store_desc,
"
"	                    v_dept_id,
"
"	                    v_dept_desc,
"
"	                    v_rcpt_qty,
"
"	                    v_disc_cost/v_rcpt_qty,
"
"	                    'GRN',
"
"	                    'POM',
"
"	                    v_upd_ref1,
"
"	                    v_upd_ref2,
"
"	                    NULL,--cr1.porh_suplr_id,
"
"	                    NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                    NULL,
"
"	                    NULL,
"
"	                    cr1.porl_cls_id,
"
"	                    func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"	                    cr1.porl_sub_cls_id,
"
"	                    func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                    p_user,
"
"			    p_ref_no => cr1.porh_suplr_doc_no,
"
"			    p_ref_date => cr1.porh_suplr_doc_date,
"
"			    p_hsn_code => cr1.porl_hsn_code,
"
"			    p_gstin_no => cr1.porh_gstn_no,
"
"			    p_gst_type => cr1.porh_gst_type,
"
"			    p_assbl_value => 0,
"
"			    p_tc_pct => 0,
"
"			    p_lc_import_flag => 'N',
"
"			    p_grn_tc_type => 'G',
"
"			    p_gst_input_type => cr1.porl_gst_input_type,
"
"			    p_rcpt_type => cr1.porh_type,
"
"			    p_exchange_rate => cr1.porh_exchange_rate
"
"	                   );
"
"              DBMS_OUTPUT.PUT_LINE('Discount Journals - End');
"
"            END IF;
"
"
"
"          END IF;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"        ELSIF cr1.porl_matl_type = 'T' AND cr1.prod_tc_charge_flag = 'Y' THEN
"
"
"
"	  v_suplr_cr_amt := 0;
"
"
"
"      IF cr1.porl_igst_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','PDF',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_igst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_igst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_igst_amt;
"
"      END IF;
"
"
"
"      IF cr1.porl_cgst_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L','PDF',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_cgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_cgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_cgst_amt;
"
"      END IF;
"
"
"
"      IF cr1.porl_sgst_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S','PDF',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_sgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_sgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_sgst_amt;
"
"      END IF;
"
"
"
"      IF cr1.porl_cess_amt > 0 AND v_tax_jrnl_source = 'G' THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'C','PDF',cr1.porl_tax_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := cr1.porl_cess_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(cr1.porl_cess_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"        v_tot_tax_amt := v_tot_tax_amt + cr1.porl_cess_amt;
"
"      END IF;
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Tax Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"	  IF v_suplr_cr_amt > 0 THEN
"
"
"
"          proc_find_suplr_offset(p_bu,
"
"			         cr1.porh_suplr_id,
"
"			         cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"			         v_acct_plnt,
"
"			         v_acct_lvl1,
"
"			         v_acct_lvl2,
"
"			         v_acct_lvl3,
"
"			         v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"			         v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"			         v_acct,
"
"				 v_acct_plnt_loc,
"
"				 p_ap_accr_type => 'APAP'
"
"			        );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"            proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  CASE WHEN cr1.porh_mode = 'PR' THEN 'GRNP' ELSE 'GRNS' END,
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  0,
"
"	                  ROUND(v_suplr_cr_amt,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_suplr_cr_amt,v_rnd),
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_suplr_cr_amt / v_rcpt_inv_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"          END IF;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Stock Transfer Journals - Start');
"
"
"
"	    BEGIN
"
"	      SELECT acct
"
"	        INTO v_acct
"
"		FROM (SELECT pura_glacct_id acct
"
"                        FROM purchase_accts
"
"                       WHERE pura_bu = p_bu
"
"                         AND pura_type = 'TS'
"
"                         AND pura_terr_id = cr1.porh_terr_id
"
"                         AND pura_tcf_id = cr1.porl_tcf_id
"
"                         AND pura_class_id IS NULL
"
"                         AND pura_sub_cls_id = cr1.porl_sub_cls_id
"
"                      UNION ALL
"
"                      SELECT pura_glacct_id acct
"
"                        FROM purchase_accts
"
"                       WHERE pura_bu = p_bu
"
"                         AND pura_type = 'TS'
"
"                         AND pura_terr_id = cr1.porh_terr_id
"
"                         AND pura_tcf_id = cr1.porl_tcf_id
"
"                         AND pura_class_id = cr1.porl_cls_id
"
"                         AND pura_sub_cls_id IS NULL);
"
"	      EXCEPTION
"
"	        WHEN OTHERS THEN
"
"		  Raise_Application_Error(-20999,'Stock Transfer Purchase Account not found.');
"
"	    END;
"
"
"
"	    proc_find_cost_center(p_bu, cr1.porh_plnt, 'PR',v_acct, v_dept_id, cr1.porl_proj_id, cr1.porl_so_pfx, cr1.porl_so_no,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj, v_acct_plnt,v_acct_cc_code,v_acct_plnt_loc,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"
"
"	    v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  0,
"
"	                  ROUND(v_fc_cost + v_suplr_cr_amt,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_inv_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"
"
"	    BEGIN
"
"	      SELECT fmc_acct INTO v_acct
"
"		FROM fin_mgmt_control
"
"	       WHERE fmc_bu = p_bu
"
"	         AND fmc_acct_type = 'SIT';
"
"	      EXCEPTION
"
"	        WHEN OTHERS THEN
"
"		  Raise_Application_Error(-20999,'Stock Transit Account not found.');
"
"	    END;
"
"
"
"	    proc_find_cost_center(p_bu, cr1.porh_plnt, 'PR',v_acct, v_dept_id, cr1.porl_proj_id, cr1.porl_so_pfx, cr1.porl_so_no,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj, v_acct_plnt,v_acct_cc_code,v_acct_plnt_loc,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"
"
"	    v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  ROUND(v_fc_cost + v_suplr_cr_amt,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"			  0,
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_inv_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Stock Transfer Journals - End');
"
"
"
"	  /*DBMS_OUTPUT.PUT_LINE('Purchase Adjustment Journals - Start');
"
"
"
"	  IF r_pomctrl.pomctrl_pur_adj_jrnl_rqrd_flag = 'Y' THEN
"
"
"
"	    BEGIN
"
"	      SELECT acct
"
"	        INTO v_acct
"
"		FROM (SELECT pura_glacct_id acct
"
"                        FROM purchase_accts
"
"                       WHERE pura_bu = p_bu
"
"                         AND pura_type = 'PR'
"
"                         AND pura_terr_id = cr1.porh_terr_id
"
"                         AND pura_tcf_id = cr1.porl_tcf_id
"
"                         AND pura_class_id IS NULL
"
"                         AND pura_sub_cls_id = cr1.porl_sub_cls_id
"
"                      UNION ALL
"
"                      SELECT pura_glacct_id acct
"
"                        FROM purchase_accts
"
"                       WHERE pura_bu = p_bu
"
"                         AND pura_type = 'PR'
"
"                         AND pura_terr_id = cr1.porh_terr_id
"
"                         AND pura_tcf_id = cr1.porl_tcf_id
"
"                         AND pura_class_id = cr1.porl_cls_id
"
"                         AND pura_sub_cls_id IS NULL);
"
"	      EXCEPTION
"
"	        WHEN OTHERS THEN
"
"		  Raise_Application_Error(-20001,'POM ');
"
"	    END;
"
"
"
"	    proc_find_cost_center(p_bu, p_plnt, 'PR',v_acct, v_dept_id, cr1.porl_proj_id, cr1.porl_so_pfx, cr1.porl_so_no,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl_prj, v_acct_plnt,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"
"
"	    v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"	                  v_acct_lvl_prj,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  0,
"
"	                  ROUND(v_fc_cost + v_suplr_cr_amt,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_inv_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"	    BEGIN
"
"	      SELECT fmc_acct
"
"                INTO v_acct
"
"		FROM fin_mgmt_control
"
"	       WHERE fmc_bu = p_bu
"
"	         AND fmc_acct_type = 'PAD';
"
"	      EXCEPTION
"
"	        WHEN OTHERS THEN
"
"		  Raise_Application_Error(-20999,'HRM Purchase Adj. Account not found.');
"
"	    END;
"
"
"
"	    proc_find_cost_center(p_bu, p_plnt, 'PR',v_acct, v_dept_id, cr1.porl_proj_id, cr1.porl_so_pfx, cr1.porl_so_no,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl_prj, v_acct_plnt,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"
"
"	    v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"	                  cr1.porl_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"	                  v_acct_lvl_prj,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  ROUND(v_fc_cost + v_suplr_cr_amt,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"			  0,
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_inv_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"	  END IF;
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Purchase Adjustment Journals - End');*/
"
"
"
"	ELSIF cr1.porh_mode = 'SC' THEN
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Subcontract Journals');
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"	  v_fc_cost := ((cr1.porl_sc_unit_cost) * cr1.porl_conv_factor) * v_rcpt_qty;
"
"	  IF cr1.porl_matl_type IN ('PR') THEN
"
"            v_bc_cost := v_fc_cost * cr1.porh_exchange_rate;
"
"	  ELSE
"
"	    v_bc_cost := v_fc_cost;
"
"	  END IF;
"
"          v_disc_cost := v_bc_cost * (cr1.porl_disc_pct / 100);
"
"          v_chrg_amt := ((((cr1.porl_sc_chrg_amt + cr1.porl_bag_chrg_amt)* cr1.porl_conv_factor) * v_rcpt_qty) * cr1.porh_exchange_rate) + ((cr1.porl_bc_land_cost * cr1.porl_conv_factor) * v_rcpt_qty);
"
"
"
"	  v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	  proc_find_store_gl_accts(p_bu,
"
"	                           cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   cr1.porh_terr_id,
"
"                                   cr1.porl_cls_id,
"
"                                   cr1.porl_sub_cls_id,
"
"                                   cr1.porl_tcf_id,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct,
"
"				   p_sub_plnt => v_sub_plnt,
"
"                                   p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				   p_gst_supply => cr1.porh_gst_clf_type,
"
"				   p_gst_type => cr1.porl_gst_exempt_flag
"
"                                  );
"
"
"
"	  v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"	  SELECT SUM(scmcls_act_cons_qty * scmcls_unit_cost)
"
"	    INTO v_cons_mat_cost
"
"	    FROM sub_contr_mat_cons_lot_ser
"
"	   WHERE scmcls_bu = cr1.porl_bu
"
"	     AND scmcls_receipt_no = cr1.porl_receipt_no
"
"	     AND scmcls_seq_no = cr1.porl_seq_no;
"
"
"
"          IF cr1.porl_matl_type IN ('PR') THEN
"
"	    v_bc_disc_cost := (v_bc_cost + v_chrg_amt + NVL(v_cons_mat_cost,0)) - v_disc_cost ;
"
"	  ELSIF cr1.porl_matl_type IN ('US','EB','SCR') THEN
"
"	    v_bc_disc_cost := (v_bc_cost + v_chrg_amt) - v_disc_cost ;
"
"	  ELSE
"
"	    v_bc_disc_cost := NVL(v_cons_mat_cost,0);
"
"	  END IF;
"
"
"
"	  proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"		        cr1.porh_plnt,
"
"			'GRNS',
"
"			cr1.porh_type,
"
"			cr1.porh_receipt_pfx,
"
"			cr1.porl_receipt_no,
"
"			cr1.porl_seq_no,
"
"			cr1.porl_prod_id,
"
"			cr1.porl_prod_rev,
"
"			cr1.porl_prod_desc1,
"
"			v_acct_plnt,
"
"			cr1.porh_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			ROUND(v_fc_cost + ((cr1.porl_bc_land_cost * cr1.porl_conv_factor) * v_rcpt_qty),v_rnd),
"
"			0,
"
"			ROUND(v_bc_disc_cost,v_rnd),
"
"			0,
"
"			v_store_id,
"
"			v_store_desc,
"
"			v_dept_id,
"
"			v_dept_desc,
"
"			v_rcpt_qty,
"
"			v_bc_disc_cost/v_rcpt_qty,
"
"			'GRN',
"
"			'POM',
"
"			v_upd_ref1,
"
"			v_upd_ref2,
"
"			NULL,--cr1.porh_suplr_id,
"
"			NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			NULL,
"
"			NULL,
"
"			cr1.porl_cls_id,
"
"			func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			cr1.porl_sub_cls_id,
"
"			func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			p_user,
"
"			p_ref_no => cr1.porh_suplr_doc_no,
"
"			p_ref_date => cr1.porh_suplr_doc_date,
"
"			p_hsn_code => cr1.porl_hsn_code,
"
"			p_gstin_no => cr1.porh_gstn_no,
"
"			p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"		       );
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"	  IF cr1.porl_matl_type = 'PR' THEN
"
"
"
"            v_suplr_cr_amt := 0;
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Tax Journals - Start');
"
"
"
"            SELECT glmctrl_tax_jrnl_srce INTO v_tax_jrnl_source
"
"              FROM glm_control
"
"             WHERE glmctrl_bu = p_bu;
"
"
"
"	    IF v_tax_jrnl_source = 'G' THEN
"
"
"
"	    FOR r_proc IN (SELECT *
"
"	                     FROM sub_contr_rcpt_process
"
"			    WHERE scrp_bu = p_bu
"
"			      AND scrp_rcpt_no = cr1.porl_receipt_no
"
"			      AND scrp_seq_no = cr1.porl_seq_no)
"
"	    LOOP
"
"
"
"            IF r_proc.scrp_igst_amt > 0 THEN
"
"
"
"              proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"              v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"              v_tax_amt := r_proc.scrp_igst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(r_proc.scrp_igst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        IF cr1.porl_rcm_flag = 'Y' THEN
"
"              proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','GSTR',r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"              v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"              v_tax_amt := r_proc.scrp_igst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(r_proc.scrp_igst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"        ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"        END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + r_proc.scrp_igst_amt;
"
"      END IF;
"
"
"
"      IF r_proc.scrp_cgst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_cgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(r_proc.scrp_cgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        IF cr1.porl_rcm_flag = 'Y' THEN
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L','GSTR',r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_cgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(r_proc.scrp_cgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"        ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"	END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + r_proc.scrp_cgst_amt;
"
"      END IF;
"
"
"
"      IF r_proc.scrp_sgst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_sgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(r_proc.scrp_sgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"	IF cr1.porl_rcm_flag = 'Y' THEN
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S','GSTR',r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_sgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(r_proc.scrp_sgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"	ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"        END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + r_proc.scrp_sgst_amt;
"
"      END IF;
"
"
"
"      IF r_proc.scrp_utgst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'U',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_utgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(r_proc.scrp_utgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"	IF cr1.porl_rcm_flag = 'Y' THEN
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'U','GSTR',r_proc.scrp_igst_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_utgst_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(r_proc.scrp_utgst_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"	ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"        END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + r_proc.scrp_sgst_amt;
"
"      END IF;
"
"
"
"      IF r_proc.scrp_cess_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'C',CASE WHEN cr1.porl_rcm_flag = 'Y' THEN 'PDR' ELSE 'PDF' END,r_proc.scrp_cess_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_cess_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"                ROUND(r_proc.scrp_cess_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                0,
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"
"
"        IF cr1.porl_rcm_flag = 'Y' THEN
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'C','GSTR',r_proc.scrp_cess_pct,func_find_hsnsac_type(p_bu,r_proc.scrp_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_proc.scrp_cess_amt * cr1.porh_exchange_rate;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                v_jrnl_trans_no,
"
"                cr1.porh_plnt,
"
"                'GRNS',
"
"              cr1.porh_type,
"
"                cr1.porh_receipt_pfx,
"
"                cr1.porl_receipt_no,
"
"                cr1.porl_seq_no,
"
"                cr1.porl_prod_id,
"
"                cr1.porl_prod_rev,
"
"                cr1.porl_prod_desc1,
"
"                v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                v_acct_lvl1,
"
"                v_acct_lvl2,
"
"                v_acct_lvl3,
"
"                v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                v_acct,
"
"                v_acct_desc,
"
"                v_vou_date,
"
"                v_vou_year,
"
"                v_vou_period,
"
"		0,
"
"                ROUND(r_proc.scrp_cess_amt ,v_rnd),
"
"                0,
"
"                ROUND(v_tax_amt ,v_rnd),
"
"                v_store_id,
"
"                v_store_desc,
"
"                v_dept_id,
"
"                v_dept_desc,
"
"                v_rcpt_qty,
"
"                (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                'GRN',
"
"                'POM',
"
"                v_upd_ref1,
"
"                v_upd_ref2,
"
"                NULL,--cr1.porh_suplr_id,
"
"                NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                NULL,
"
"                NULL,
"
"                cr1.porl_cls_id,
"
"                func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                cr1.porl_sub_cls_id,
"
"                func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"               );
"
"	ELSE
"
"          v_suplr_cr_amt := v_suplr_cr_amt + v_tax_amt;
"
"	END IF;
"
"
"
"        v_tot_tax_amt := v_tot_tax_amt + r_proc.scrp_cess_amt;
"
"      END IF;
"
"
"
"
"
"            END LOOP;
"
"	    END IF;
"
"	  DBMS_OUTPUT.PUT_LINE('Tax Journals - End');
"
"
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Landed Cost Journals - Start');
"
"
"
"      FOR r_lc IN (SELECT *
"
"                     FROM pur_rcpt_prod_land_costs,products,classes
"
"                    WHERE prod_bu = prplc_bu
"
"		      AND prod_id = prplc_prod_id
"
"		      AND class_bu = prod_bu
"
"		      AND class_id = prod_cls
"
"		      AND prplc_bu = p_bu
"
"                      AND prplc_rcpt_no = cr1.porl_receipt_no
"
"                      AND prplc_rcpt_seq_no = cr1.porl_seq_no
"
"                    ORDER BY prplc_seq_no)
"
"      LOOP
"
"
"
"	IF r_lc.prplc_chrg_flag <> 'N' THEN
"
"
"
"	  IF r_lc.class_type = 'IG' THEN
"
"
"
"              proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','PDF',r_lc.prplc_tc_pct,func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"	  ELSIF r_lc.class_type <> 'IG' AND r_lc.prplc_type = 'S' THEN
"
"
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"                                     'PDT',
"
"                                     v_dept_id,
"
"				     cr1.porh_terr_id,
"
"				     r_lc.prod_cls,
"
"				     r_lc.prod_sub_cls,
"
"				     cr1.porl_tcf_id,
"
"				     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"				     v_acct_lvl1,
"
"				     v_acct_lvl2,
"
"				     v_acct_lvl3,
"
"				     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"				     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"				     v_acct,
"
"				     p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => r_lc.prplc_tc_pct,
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"				     p_prod_id => cr1.porl_prod_id
"
"				    );
"
"				    --Raise_Application_Error(20999,'Test ');
"
"
"
"            ELSIF r_lc.prplc_type = 'L' THEN
"
"
"
"	      v_acct := r_lc.prplc_pur_acct;
"
"
"
"	      proc_find_cost_center(p_bu, cr1.porh_plnt, 'PR',v_acct, v_dept_id, cr1.porl_proj_id, cr1.porl_so_pfx, cr1.porl_so_no,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj, v_acct_plnt,
"
"				  v_acct_cc_code,v_acct_plnt_loc,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"
"
"	    END IF;
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      'GRNS',
"
"              cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"              cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"              v_acct_lvl5,
"
"              v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"              v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(r_lc.prplc_tc_amt,v_rnd),
"
"                      0,
"
"                      ROUND(r_lc.prplc_tc_amt,v_rnd),
"
"		      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      r_lc.prplc_tc_amt / v_rcpt_inv_qty,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      r_lc.prplc_suplr_id,
"
"                      func_find_party_name(p_bu,r_lc.prplc_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"              p_ref_no => cr1.porh_suplr_doc_no,
"
"              p_ref_date => cr1.porh_suplr_doc_date,
"
"	      p_hsn_code => cr1.porl_hsn_code,
"
"	      p_gstin_no => cr1.porh_gstn_no,
"
"	      p_gst_type => cr1.porh_gst_type,
"
"	      p_grn_tc_type => 'R',
"
"	      p_gst_input_type => cr1.porl_gst_input_type,
"
"	      p_rcpt_type => cr1.porh_type,
"
"	      p_exchange_rate => cr1.porh_exchange_rate
"
"                         );
"
"	END IF;
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Tax Journals - Start');
"
"
"
"      v_lc_suplr_cr_amt := 0;
"
"
"
"      IF r_lc.prplc_igst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'I','PDF',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        v_tax_amt := r_lc.prplc_igst_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      'GRNS',
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"
"
"      END IF;
"
"
"
"      IF r_lc.prplc_cgst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'L','PDF',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"
"
"        v_tax_amt := r_lc.prplc_cgst_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      'GRNS',
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"
"
"      END IF;
"
"
"
"      IF r_lc.prplc_sgst_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'S','PDF',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        v_tax_amt := r_lc.prplc_sgst_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      'GRNS',
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"
"
"      END IF;
"
"
"
"      IF r_lc.prplc_cess_amt > 0 THEN
"
"
"
"        proc_find_tax_acct_new(p_bu,cr1.porh_plnt,'C','PDF',r_lc.prplc_igst_pct,func_find_hsnsac_type(p_bu,r_lc.prplc_hsn_code),
"
"	                       v_acct,v_acct_plnt,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,
"
"                               v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct_plnt_loc);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"        v_tax_amt := r_lc.prplc_cess_amt;
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"                      cr1.porh_plnt,
"
"                      'GRNS',
"
"                      cr1.porh_type,
"
"                      cr1.porh_receipt_pfx,
"
"                      cr1.porl_receipt_no,
"
"                      cr1.porl_seq_no,
"
"                      cr1.porl_prod_id,
"
"                      cr1.porl_prod_rev,
"
"                      cr1.porl_prod_desc1,
"
"                      v_acct_plnt,
"
"                      cr1.porh_plnt_loc_id,
"
"                      v_acct_lvl1,
"
"                      v_acct_lvl2,
"
"                      v_acct_lvl3,
"
"                      v_acct_lvl4,
"
"                      v_acct_lvl5,
"
"                      v_acct_lvl6,
"
"                      v_acct_lvl_prj,
"
"                      v_acct_cc_code,
"
"                      v_acct,
"
"                      v_acct_desc,
"
"                      v_vou_date,
"
"                      v_vou_year,
"
"                      v_vou_period,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      ROUND(v_tax_amt ,v_rnd),
"
"                      0,
"
"                      v_store_id,
"
"                      v_store_desc,
"
"                      v_dept_id,
"
"                      v_dept_desc,
"
"                      v_rcpt_qty,
"
"                      (v_tax_amt/v_rcpt_qty) * cr1.porl_conv_factor,
"
"                      'GRN',
"
"                      'POM',
"
"                      v_upd_ref1,
"
"                      v_upd_ref2,
"
"                      NULL,--cr1.porh_suplr_id,
"
"                      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.porl_cls_id,
"
"                      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                      cr1.porl_sub_cls_id,
"
"                      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                      p_user,
"
"                      p_ref_no => cr1.porh_suplr_doc_no,
"
"                      p_ref_date => cr1.porh_suplr_doc_date,
"
"	              p_hsn_code => cr1.porl_hsn_code,
"
"	              p_gstin_no => cr1.porh_gstn_no,
"
"	              p_gst_type => cr1.porh_gst_type,
"
"	              p_grn_tc_type => 'R',
"
"	              p_gst_input_type => cr1.porl_gst_input_type,
"
"	              p_rcpt_type => cr1.porh_type,
"
"	              p_exchange_rate => cr1.porh_exchange_rate
"
"                     );
"
"
"
"        v_lc_suplr_cr_amt := v_lc_suplr_cr_amt + v_tax_amt;
"
"
"
"      END IF;
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Tax Journals - End');
"
"
"
"      IF r_lc.prplc_type = 'L' THEN
"
"        v_acct := r_lc.prplc_offset_acct;
"
"	proc_find_cost_center(p_bu, cr1.porh_plnt, 'PR',v_acct, v_dept_id, cr1.porl_proj_id, cr1.porl_so_pfx, cr1.porl_so_no,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj, v_acct_plnt,
"
"				  v_acct_cc_code,v_acct_plnt_loc,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"      ELSE
"
"      proc_find_suplr_offset(p_bu,r_lc.prplc_suplr_id,cr1.porh_plnt,cr1.porh_plnt_loc_id,v_acct_plnt,
"
"                             v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl5,v_acct_lvl6,v_acct_lvl_prj,v_acct_cc_code,v_acct,v_acct_plnt_loc,v_sub_plnt,p_ap_accr_type => 'APALC');
"
"      END IF;
"
"
"
"      v_acct_desc := func_find_gl_level_acct_desc(p_bu,v_acct_lvl1,v_acct_lvl2,v_acct_lvl3,v_acct_lvl4,v_acct_lvl_prj,v_acct,v_acct_plnt,p_lang);
"
"
"
"      proc_ins_jrnl(p_bu,
"
"                    v_jrnl_trans_no,
"
"                    cr1.porh_plnt,
"
"                    'GRNS',
"
"                    cr1.porh_type,
"
"                    cr1.porh_receipt_pfx,
"
"                    cr1.porl_receipt_no,
"
"                    cr1.porl_seq_no,
"
"                    cr1.porl_prod_id,
"
"                    cr1.porl_prod_rev,
"
"                    cr1.porl_prod_desc1,
"
"                    v_acct_plnt,
"
"                    cr1.porh_plnt_loc_id,
"
"                    v_acct_lvl1,
"
"                    v_acct_lvl2,
"
"                    v_acct_lvl3,
"
"                    v_acct_lvl4,
"
"                    v_acct_lvl5,
"
"                    v_acct_lvl6,
"
"                    v_acct_lvl_prj,
"
"                    v_acct_cc_code,
"
"                    v_acct,
"
"                    v_acct_desc,
"
"                    v_vou_date,
"
"                    v_vou_year,
"
"                    v_vou_period,
"
"                    0,
"
"                    ROUND(r_lc.prplc_tc_amt + v_lc_suplr_cr_amt,v_rnd),
"
"                    0,
"
"                    ROUND(r_lc.prplc_tc_amt + v_lc_suplr_cr_amt,v_rnd),
"
"                    v_store_id,
"
"                    v_store_desc,
"
"                    v_dept_id,
"
"                    v_dept_desc,
"
"                    v_rcpt_qty,
"
"                    (r_lc.prplc_tc_amt + v_lc_suplr_cr_amt) / v_rcpt_inv_qty,
"
"                    'GRN',
"
"                    'POM',
"
"                    v_upd_ref1,
"
"                    v_upd_ref2,
"
"                    r_lc.prplc_suplr_id,
"
"                    func_find_party_name(p_bu,r_lc.prplc_suplr_id,p_lang),
"
"                    NULL,
"
"                    NULL,
"
"                    cr1.porl_cls_id,
"
"                    func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                    cr1.porl_sub_cls_id,
"
"                    func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                    p_user,
"
"                    p_ref_no => cr1.porh_suplr_doc_no,
"
"                    p_ref_date => cr1.porh_suplr_doc_date,
"
"	            p_hsn_code => cr1.porl_hsn_code,
"
"	            p_gstin_no => cr1.porh_gstn_no,
"
"	            p_gst_type => cr1.porh_gst_type,
"
"	            p_grn_tc_type => 'R',
"
"	            p_gst_input_type => cr1.porl_gst_input_type,
"
"	            p_rcpt_type => cr1.porh_type,
"
"	            p_exchange_rate => cr1.porh_exchange_rate
"
"                   );
"
"
"
"    END LOOP;
"
"    DBMS_OUTPUT.PUT_LINE('Landed Cost Journals - End');
"
"
"
"	  END IF;
"
"
"
"
"
"	  FOR cr_scm IN (SELECT *
"
"	                   FROM sub_contr_mat_cons_lot_ser
"
"			  WHERE scmcls_bu = cr1.porl_bu
"
"			    AND scmcls_receipt_no = cr1.porl_receipt_no
"
"			    AND scmcls_seq_no = cr1.porl_seq_no
"
"			    AND scmcls_act_cons_qty > 0)
"
"	  LOOP
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Subcontract Consumption Journals - Start');
"
"
"
"	    v_store_id := cr_scm.scmcls_store_id;
"
"	    v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	  proc_find_store_gl_accts(p_bu,
"
"	                           cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   cr1.porh_terr_id,
"
"                                   cr1.porl_cls_id,
"
"                                   cr1.porl_sub_cls_id,
"
"                                   cr1.porl_tcf_id,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct,
"
"				   p_sub_plnt => v_sub_plnt,
"
"                                   p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				   p_gst_supply => cr1.porh_gst_clf_type,
"
"				   p_gst_type => cr1.porl_gst_exempt_flag
"
"                                  );
"
"
"
"	    v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"	                                                v_acct_lvl1,
"
"							v_acct_lvl2,
"
"							v_acct_lvl3,
"
"							v_acct_lvl4,
"
"							v_acct_lvl_prj,
"
"							v_acct,
"
"							v_acct_plnt,
"
"							p_lang
"
"						       );
"
"
"
"	    v_prod_desc1 := func_find_prod_desc(p_bu,
"
"			                        cr_scm.scmcls_prod_id,
"
"				                cr_scm.scmcls_prod_rev,
"
"						p_lang
"
"			                       );
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"			  cr1.porh_plnt,
"
"			  'GRNS',
"
"			  cr1.porh_type,
"
"			  cr1.porh_receipt_pfx,
"
"			  cr1.porl_receipt_no,
"
"			  cr1.porl_seq_no,
"
"			  cr_scm.scmcls_prod_id,
"
"			  cr_scm.scmcls_prod_rev,
"
"			  v_prod_desc1,
"
"			  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"			  v_acct_lvl1,
"
"			  v_acct_lvl2,
"
"			  v_acct_lvl3,
"
"			  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"			  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"			  v_acct,
"
"			  v_acct_desc,
"
"			  v_vou_date,
"
"			  v_vou_year,
"
"			  v_vou_period,
"
"			  0,
"
"			  ROUND(cr_scm.scmcls_act_cons_qty * cr_scm.scmcls_unit_cost,v_rnd),
"
"			  0,
"
"			  ROUND(cr_scm.scmcls_act_cons_qty * cr_scm.scmcls_unit_cost,v_rnd),
"
"			  v_store_id,
"
"			  v_store_desc,
"
"			  v_dept_id,
"
"			  v_dept_desc,
"
"			  cr_scm.scmcls_act_cons_qty,
"
"			  cr_scm.scmcls_unit_cost,
"
"			  'GRN',
"
"			  'POM',
"
"			  v_upd_ref1,
"
"			  v_upd_ref2,
"
"			  NULL,--cr1.porh_suplr_id,
"
"			  NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			  NULL,
"
"			  NULL,
"
"			  cr1.porl_cls_id,
"
"			  func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			  cr1.porl_sub_cls_id,
"
"			  func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"			 );
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Subcontract Consumption Journals - End');
"
"
"
"	  END LOOP;
"
"
"
"	  IF cr1.porl_matl_type = 'PR' THEN
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"	    proc_find_suplr_offset(p_bu,
"
"			           cr1.porh_suplr_id,
"
"				   cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"				   v_acct_plnt,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct,
"
"				   v_acct_plnt_loc,
"
"				   p_ap_accr_type => 'APAS'
"
"				  );
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                        v_acct_lvl1,
"
"							v_acct_lvl2,
"
"							v_acct_lvl3,
"
"							v_acct_lvl4,
"
"							v_acct_lvl_prj,
"
"							v_acct,
"
"							v_acct_plnt,
"
"							p_lang
"
"						       );
"
"
"
"	    v_bc_disc_cost := (NVL(v_bc_cost,0) + NVL(v_chrg_amt,0) + NVL(v_suplr_cr_amt,0) - NVL(v_lc_chrg_amt,0)) - NVL(v_disc_cost,0);
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"			  cr1.porh_plnt,
"
"			  'GRNS',
"
"			  cr1.porh_type,
"
"			  cr1.porh_receipt_pfx,
"
"			  cr1.porl_receipt_no,
"
"			  cr1.porl_seq_no,
"
"			  cr1.porl_prod_id,
"
"			  cr1.porl_prod_rev,
"
"			  cr1.porl_prod_desc1,
"
"			  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"			  v_acct_lvl1,
"
"			  v_acct_lvl2,
"
"			  v_acct_lvl3,
"
"			  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"			  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"			  v_acct,
"
"			  v_acct_desc,
"
"			  v_vou_date,
"
"			  v_vou_year,
"
"			  v_vou_period,
"
"			  0,
"
"			  ROUND(v_fc_cost + v_suplr_cr_amt,v_rnd),
"
"			  0,
"
"			  ROUND(v_bc_disc_cost,v_rnd),
"
"			  v_store_id,
"
"			  v_store_desc,
"
"			  v_dept_id,
"
"			  v_dept_desc,
"
"			  v_rcpt_qty,
"
"			  v_bc_disc_cost / v_rcpt_qty,
"
"			  'GRN',
"
"			  'POM',
"
"			  v_upd_ref1,
"
"			  v_upd_ref2,
"
"			  cr1.porh_suplr_id,
"
"			  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			  NULL,
"
"			  NULL,
"
"			  cr1.porl_cls_id,
"
"			  func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			  cr1.porl_sub_cls_id,
"
"			  func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"			 );
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"	  ELSIF cr1.porl_matl_type IN ('SCR','EB') THEN
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"	    SELECT store_exp_acct INTO v_acct
"
"	      FROM stores
"
"	     WHERE store_bu = p_bu
"
"	       AND store_id = cr1.porl_storage_store_id;
"
"
"
"	    proc_find_cost_center(p_bu, cr1.porh_plnt, 'PR', v_acct, NULL, NULL, NULL, NULL,
"
"	                          v_acct_lvl1, v_acct_lvl2, v_acct_lvl3, v_acct_lvl4, v_acct_lvl5,
"
"				  v_acct_lvl6, v_acct_lvl_prj, v_acct_plnt,v_acct_cc_code,
"
"				  v_acct_plnt_loc,cr1.porl_cls_id,cr1.porl_sub_cls_id);
"
"
"
"	    /*proc_find_suplr_offset(p_bu,
"
"			           cr1.porh_suplr_id,
"
"				   cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"				   v_acct_plnt,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct,
"
"				   v_acct_plnt_loc,
"
"				   p_ap_accr_type => 'APAS'
"
"				  );*/
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                        v_acct_lvl1,
"
"							v_acct_lvl2,
"
"							v_acct_lvl3,
"
"							v_acct_lvl4,
"
"							v_acct_lvl_prj,
"
"							v_acct,
"
"							v_acct_plnt,
"
"							p_lang
"
"						       );
"
"
"
"	    v_bc_disc_cost := (NVL(v_bc_cost,0) + NVL(v_chrg_amt,0) /*+ NVL(v_suplr_cr_amt,0)*/ - NVL(v_lc_chrg_amt,0)) - NVL(v_disc_cost,0);
"
"
"
"	    proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"			  cr1.porh_plnt,
"
"			  'GRNS',
"
"			  cr1.porh_type,
"
"			  cr1.porh_receipt_pfx,
"
"			  cr1.porl_receipt_no,
"
"			  cr1.porl_seq_no,
"
"			  cr1.porl_prod_id,
"
"			  cr1.porl_prod_rev,
"
"			  cr1.porl_prod_desc1,
"
"			  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"			  v_acct_lvl1,
"
"			  v_acct_lvl2,
"
"			  v_acct_lvl3,
"
"			  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"			  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"			  v_acct,
"
"			  v_acct_desc,
"
"			  v_vou_date,
"
"			  v_vou_year,
"
"			  v_vou_period,
"
"			  0,
"
"			  ROUND(v_fc_cost /*+ v_suplr_cr_amt*/,v_rnd),
"
"			  0,
"
"			  ROUND(v_bc_disc_cost,v_rnd),
"
"			  v_store_id,
"
"			  v_store_desc,
"
"			  v_dept_id,
"
"			  v_dept_desc,
"
"			  v_rcpt_qty,
"
"			  v_bc_disc_cost / v_rcpt_qty,
"
"			  'GRN',
"
"			  'POM',
"
"			  v_upd_ref1,
"
"			  v_upd_ref2,
"
"			  cr1.porh_suplr_id,
"
"			  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			  NULL,
"
"			  NULL,
"
"			  cr1.porl_cls_id,
"
"			  func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			  cr1.porl_sub_cls_id,
"
"			  func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type,
"
"			  p_exchange_rate => cr1.porh_exchange_rate
"
"			 );
"
"
"
"	    DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"	  END IF;
"
"
"
"        END IF;
"
"
"
"
"
"
"
"      END LOOP;
"
"
"
"      FOR r_hd IN (SELECT *
"
"                     FROM pur_ord_receipt_hd_view
"
"		    WHERE porh_bu = p_bu
"
"		      AND porh_receipt_no = p_vou_no)
"
"      LOOP
"
"      proc_ins_aj_variance_amt(p_bu,
"
"                               p_plnt,
"
"			       p_plnt,
"
"			       CASE WHEN r_hd.porh_mode = 'SC' THEN 'GRNS' ELSE 'GRNP' END,
"
"			       p_vou_pfx,
"
"			       p_vou_no,
"
"			       v_vou_date,
"
"			       v_vou_year,
"
"			       v_vou_period,
"
"			       'POM',
"
"			       'Purchase Receipts',
"
"			       p_user,
"
"			       NULL,
"
"			       1,
"
"			       p_plnt_loc_id => v_plnt_loc_id,
"
"			       p_sub_vou_type => r_hd.porh_type
"
"			      );
"
"
"
"      END LOOP;
"
"
"
"      p_res := 'Y';
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_inward_jrnl_frm_grn - End');
"
"
"
"  END proc_ins_inward_jrnl_frm_grn;
"
"
"
"/******************************INSPECTION WAREHOUSE JOURNALS*******************************************/
"
"PROCEDURE proc_ins_insp_jrnl_frm_grn(p_bu		business_units.bu_id%TYPE,
"
"				     p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				     p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				     p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				     p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				     p_user		VARCHAR2,
"
"				     p_lang		NUMBER
"
"				    )
"
"IS
"
"CURSOR c1 IS
"
"SELECT *
"
"  FROM pur_ord_receipt_hd_view,pur_ord_receipt_ln_view,products
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prod_bu = porl_bu
"
"   AND prod_id = porl_prod_id
"
"   AND prod_rev = porl_prod_rev
"
"   AND porh_bu = p_bu
"
"   AND porh_plnt = p_plnt
"
"   AND porh_receipt_pfx = p_vou_pfx
"
"   AND porh_receipt_no = p_vou_no
"
"   AND (porl_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"   AND porh_type NOT IN ('SA')
"
"   AND porl_matl_type NOT IN ('CS','PC')
"
"   --AND porl_status <> 'C'
"
"   AND (porl_status = 'N' OR (porl_status IN ('R','Q') AND porl_qc_doc_pfx IS NOT NULL AND porl_qc_doc_no IS NOT NULL))
"
"   AND prod_stocked = 'Y'
"
" ORDER BY porl_seq_no;
"
"
"
"CURSOR c2(c_rcpt_seq_no	NUMBER) IS
"
"SELECT prcls_sys_ls_no
"
"  FROM pur_rcpt_lot_serial_view
"
" WHERE prcls_bu = p_bu
"
"   AND prcls_doc_no = p_vou_no
"
"   AND prcls_doc_seq_no = c_rcpt_seq_no
"
"   AND prcls_sys_ls_no IS NOT NULL
"
" ORDER BY prcls_seq_no;
"
"
"
"v_jrnl_trans_no		NUMBER(15);
"
"v_vou_date		DATE;
"
"v_vou_year		NUMBER;
"
"v_vou_period		NUMBER;
"
"v_vou_type		VARCHAR2(5);
"
"
"
"v_rnd			NUMBER;
"
"
"
"v_rcpt_qty		NUMBER;
"
"v_unit_cost		NUMBER;
"
"
"
"v_store_id		stores.store_id%TYPE;
"
"v_store_desc		stores.store_desc1%TYPE;
"
"v_dept_id		departments.dept_id%TYPE;
"
"v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"v_chrg_type		VARCHAR2(5);
"
"v_exp_share_pct		NUMBER;
"
"
"
"v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"v_acct_plnt_loc		profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"v_acct_lvl_prj		profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"v_acct_cc_code		profit_cost_centers.pcc_cc_code%TYPE;
"
"v_acct			gl_accts.glac_acct%TYPE;
"
"v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"v_upd_ref1		VARCHAR2(200);
"
"v_upd_ref2		VARCHAR2(200);
"
"
"
"v_err_msg		VARCHAR2(4000);
"
"
"
"cr2			c2%ROWTYPE;
"
"
"
"  v_sub_plnt		VARCHAR2(10);
"
"  v_ge_no		VARCHAR2(15);
"
"  v_to_store_id		VARCHAR2(10);
"
"  v_plnt_loc_id	pur_ord_receipt_hd.porh_plnt_loc_id%TYPE;
"
"
"
"BEGIN
"
"
"
"  DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_grn - Begin');
"
"
"
"  IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"    v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"    DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"    v_vou_date := SYSDATE;
"
"    v_vou_year := func_find_year(p_bu,v_vou_date);
"
"    v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"    v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_plnt_loc_id := cr1.porh_plnt_loc_id;
"
"
"
"      IF cr1.porh_status = 'R' THEN
"
"        v_vou_date := cr1.porl_grn_recv_date;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"      ELSE
"
"        v_vou_date := SYSDATE;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"      END IF;
"
"
"
"      IF cr1.porh_type = 'AT' THEN
"
"	  SELECT DISTINCT siln_ge_no
"
"	    INTO v_ge_no
"
"	    FROM sales_invoices_hd,sales_invoices_ln
"
"	   WHERE sihd_bu = siln_bu
"
"	     AND sihd_plant = siln_plnt
"
"	     AND sihd_doc_no = siln_doc_no
"
"	     AND sihd_bu = p_bu
"
"	     AND sihd_plant = p_plnt
"
"	     AND sihd_stk_trfr_grn_pfx = p_vou_pfx
"
"	     AND sihd_stk_trfr_grn_no = p_vou_no;
"
"
"
"
"
"	  SELECT gehd_to_store_id
"
"	    INTO v_to_store_id
"
"	    FROM gate_entry_hd
"
"	   WHERE gehd_bu = p_bu
"
"	     AND gehd_plnt = p_plnt
"
"	     AND gehd_doc_no = v_ge_no;
"
"
"
"	  /*SELECT sp_sub_plnt_id
"
"	    INTO v_sub_plnt
"
"	    FROM sub_plants,sub_plants_wh_asso
"
"	   WHERE sp_bu = spwa_bu
"
"	     AND sp_sub_plnt_id = spwa_sub_plnt_id
"
"	     AND sp_bu = p_bu
"
"	     AND sp_plnt_id = p_plnt
"
"	     AND spwa_store_id = v_to_store_id;*/
"
"
"
"        /*SELECT suplr_sub_plnt
"
"          INTO v_sub_plnt
"
"          FROM suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_suplr_id = cr1.porh_suplr_id;*/
"
"      ELSE
"
"        v_sub_plnt := NULL;
"
"      END IF;
"
"
"
"      --v_rcpt_qty := (cr1.porl_temp_inv_qty/cr1.porl_conv_factor);
"
"      v_rcpt_qty := cr1.porl_stock_receipt_qty;
"
"
"
"      v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'I');
"
"
"
"      IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"          (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) THEN
"
"        v_unit_cost := ((((cr1.porl_sc_unit_cost + cr1.porl_bag_chrg_amt + cr1.porl_sc_chrg_amt - cr1.porl_sc_lm_disc_amt) -
"
"                          (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) * cr1.porh_exchange_rate) /*+
"
"			   cr1.porl_ap_lc_chrg_amt */+ cr1.porl_bc_land_cost -
"
"			  CASE WHEN cr1.porl_rebate_cost_type = 'N' THEN cr1.porl_rebate_unit_cost ELSE 0 END) * cr1.porl_conv_factor;
"
"      ELSE
"
"        v_unit_cost := (cr1.porl_scon_mat_unit_cost * cr1.porl_conv_factor) +
"
"	               ((cr1.porl_sc_chrg_amt * cr1.porh_exchange_rate * cr1.porl_conv_factor) +
"
"			cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost /*+ cr1.porl_ap_lc_chrg_amt*/);
"
"      END IF;
"
"
"
"      /*IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"          (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	   cr1.prod_cost_method = 'MAC' THEN
"
"
"
"	IF cr1.porl_status = 'R' THEN
"
"	  SELECT sttr_bc_unit_cost
"
"	    INTO v_unit_cost
"
"	    FROM stock_trans
"
"	   WHERE sttr_bu = p_bu
"
"	     AND sttr_store_id = v_store_id
"
"	     AND sttr_vou_no = cr1.porl_receipt_no
"
"	     AND sttr_vou_line_no = cr1.porl_seq_no
"
"	     AND sttr_trans_qty < 0;
"
"	ELSE
"
"          v_unit_cost := func_find_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id);
"
"	END IF;
"
"
"
"      ELSIF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	     (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	      cr1.prod_cost_method IN ('FIFO','LIFO') THEN
"
"
"
"        v_unit_cost := func_find_rcpt_batch_unitcost(p_bu,v_store_id,cr1.porl_prod_id,cr1.porl_prod_rev,
"
"	                                      cr1.porl_receipt_pfx,cr1.porl_receipt_no,cr1.porl_seq_no);
"
"
"
"      ELSE
"
"        OPEN c2(cr1.porl_seq_no);
"
"	FETCH c2 INTO cr2;
"
"	  IF c2%NOTFOUND THEN
"
"	    IF cr1.porl_status = 'R' THEN
"
"	      SELECT stsfg_unit_cost
"
"	        INTO v_unit_cost
"
"	        FROM stock_trans_sfg
"
"	       WHERE stsfg_bu = p_bu
"
"	         AND stsfg_store_id = v_store_id
"
"	         AND stsfg_vou_pfx = cr1.porl_receipt_pfx
"
"	         AND stsfg_vou_no = cr1.porl_receipt_no
"
"	         AND stsfg_vou_line_no = cr1.porl_seq_no
"
"		 AND (stsfg_ord_no = cr1.porl_prod_ord_no OR (stsfg_ord_no IS NULL AND cr1.porl_prod_ord_no IS NULL))
"
"		 AND stsfg_sf_code = cr1.porl_tar_sf_code
"
"		 AND stsfg_sys_ls_no IS NULL
"
"	         AND stsfg_trans_qty < 0;
"
"	    ELSE
"
"	      v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,NULL);
"
"	    END IF;
"
"	  ELSE
"
"	    LOOP
"
"	      v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr2.prcls_sys_ls_no);
"
"	      FETCH c2 INTO cr2;
"
"	      EXIT WHEN c2%NOTFOUND;
"
"	    END LOOP;
"
"	  END IF;
"
"	CLOSE c2;
"
"      END IF;*/
"
"
"
"        v_err_msg := v_unit_cost||' '||cr1.porh_mode||' '||cr1.porl_prod_id||' '||func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'I');
"
"
"
"	DBMS_OUTPUT.PUT_LINE(v_err_msg);
"
"
"
"	v_upd_ref2 := CASE WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'PR' THEN 'GRN#('
"
"		           WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'SC' THEN 'SRN#('
"
"			   ELSE 'GRN#('
"
"		      END;
"
"
"
"        v_upd_ref1 := SUBSTR('GRN #('|| p_vou_pfx || '/' || p_vou_no || ') / ' || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.porl_seq_no||')/PO#('||cr1.porl_po_pfx||'/'||cr1.porl_po_no||'/'
"
"			       ||cr1.porl_po_seq_no||'/'||cr1.porl_po_sub_seq_no||')/'||func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),1,150);
"
"
"
"        IF (cr1.porl_status = 'N' AND (cr1.porl_qc_doc_pfx IS NULL AND cr1.porl_qc_doc_no IS NULL)) OR
"
"            (cr1.porl_status IN ('Q','R') AND (cr1.porl_qc_doc_pfx IS NOT NULL AND cr1.porl_qc_doc_no IS NOT NULL))	THEN
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          v_vou_type := 'INRV';
"
"        ELSE
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'P');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          v_vou_type := 'PIRV';
"
"        END IF;
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - Start'||v_unit_cost);
"
"
"
"        proc_find_store_gl_accts(p_bu,
"
"                                 cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 cr1.porh_terr_id,
"
"				 cr1.porl_cls_id,
"
"				 cr1.porl_sub_cls_id,
"
"				 cr1.porl_tcf_id,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct,
"
"				 p_sub_plnt => v_sub_plnt,
"
"			         p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"			         p_gst_supply => cr1.porh_gst_clf_type,
"
"			         p_gst_type => cr1.porl_gst_exempt_flag
"
"				);
"
"
"
"	v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                              	    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"						   );
"
"
"
"	proc_ins_jrnl(p_bu,
"
"              	      v_jrnl_trans_no,
"
"		      cr1.porh_plnt,
"
"		      v_vou_type,
"
"		      cr1.porh_type,
"
"		      cr1.porh_receipt_pfx,
"
"		      cr1.porl_receipt_no,
"
"		      cr1.porl_seq_no,
"
"		      cr1.porl_prod_id,
"
"		      cr1.porl_prod_rev,
"
"		      cr1.porl_prod_desc1,
"
"		      v_acct_plnt,
"
"		      cr1.porh_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      v_vou_date,
"
"		      v_vou_year,
"
"		      v_vou_period,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'GRN',
"
"		      'POM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,--cr1.porh_suplr_id,
"
"		      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.porl_cls_id,
"
"		      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		      cr1.porl_sub_cls_id,
"
"		      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		      p_user,
"
"		      p_ref_no => cr1.porh_suplr_doc_no,
"
"		      p_ref_date => cr1.porh_suplr_doc_date,
"
"		      p_hsn_code => cr1.porl_hsn_code,
"
"		      p_gstin_no => cr1.porh_gstn_no,
"
"		      p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		     );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"        v_store_id   := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'I');
"
"        v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"        proc_find_store_gl_accts(p_bu,
"
"                                 cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 cr1.porh_terr_id,
"
"				 cr1.porl_cls_id,
"
"				 cr1.porl_sub_cls_id,
"
"				 cr1.porl_tcf_id,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct,
"
"				 p_sub_plnt => v_sub_plnt,
"
"			         p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"			         p_gst_supply => cr1.porh_gst_clf_type,
"
"			         p_gst_type => cr1.porl_gst_exempt_flag
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"						   );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"	              v_jrnl_trans_no,
"
"		      cr1.porh_plnt,
"
"		      v_vou_type,
"
"		      cr1.porh_type,
"
"		      cr1.porh_receipt_pfx,
"
"		      cr1.porl_receipt_no,
"
"		      cr1.porl_seq_no,
"
"		      cr1.porl_prod_id,
"
"		      cr1.porl_prod_rev,
"
"		      cr1.porl_prod_desc1,
"
"		      v_acct_plnt,
"
"		      cr1.porh_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      v_vou_date,
"
"		      v_vou_year,
"
"		      v_vou_period,
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'GRN',
"
"		      'POM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,--cr1.porh_suplr_id,
"
"		      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.porl_cls_id,
"
"		      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		      cr1.porl_sub_cls_id,
"
"		      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		      p_user,
"
"		      p_ref_no => cr1.porh_suplr_doc_no,
"
"		      p_ref_date => cr1.porh_suplr_doc_date,
"
"		      p_hsn_code => cr1.porl_hsn_code,
"
"		      p_gstin_no => cr1.porh_gstn_no,
"
"		      p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		     );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      proc_ins_aj_variance_amt(p_bu,
"
"                               p_plnt,
"
"			       p_plnt,
"
"			       'GRN',
"
"			       p_vou_pfx,
"
"			       p_vou_no,
"
"			       v_vou_date,
"
"			       v_vou_year,
"
"			       v_vou_period,
"
"			       'POM',
"
"			       'Purchase Receipts',
"
"			       p_user,
"
"			       NULL,
"
"			       1,
"
"			       p_plnt_loc_id => v_plnt_loc_id
"
"			      );
"
"
"
"
"
"      proc_ins_gl_jrnl(p_bu,
"
"                       p_plnt,
"
"		       v_vou_date,
"
"		       v_vou_year,
"
"		       v_vou_period,
"
"		       p_vou_pfx,
"
"		       p_vou_no,
"
"		       NULL,
"
"		       'POM',
"
"		       p_user,
"
"		       p_lang,
"
"		       'GRN'
"
"		      );
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_grn - End');
"
"    /*EXCEPTION
"
"      WHEN OTHERS THEN
"
"        Raise_Application_Error(-20999,'HRM '||v_err_msg);*/
"
"  END proc_ins_insp_jrnl_frm_grn;
"
"
"
"/******************************TQM INSPECTION WAREHOUSE JOURNALS*******************************************/
"
"  PROCEDURE proc_ins_insp_jrnl_frm_tqm(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"				       p_vou_no		tqm_qc_hd.tqhd_qc_no%TYPE,
"
"				       p_vou_rev	tqm_qc_hd.tqhd_qc_rev%TYPE,
"
"				       p_vou_seq_no	tqm_qc_ln.tqln_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM tqm_qc_hd_vw,
"
"             tqm_qc_ln_vw,
"
"             pur_ord_receipt_ln_view,
"
"             pur_ord_receipt_hd_view,
"
"             suppliers,
"
"             products
"
"       WHERE tqhd_bu = tqln_bu
"
"         AND tqhd_qc_no = tqln_qc_no
"
"         AND porl_bu = tqln_bu
"
"         AND porl_receipt_no = tqln_vou_no
"
"         AND porl_seq_no = tqln_vou_line_no
"
"         AND porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND suplr_bu = porh_bu
"
"         AND suplr_suplr_id = porh_suplr_id
"
"         AND prod_bu = porl_bu
"
"         AND prod_id = porl_prod_id
"
"         AND prod_rev = porl_prod_rev
"
"         AND tqhd_bu = p_bu
"
"         AND tqhd_qc_pfx = p_vou_pfx
"
"         AND tqhd_qc_no = p_vou_no
"
"         AND (tqhd_qc_rev = p_vou_rev OR (p_vou_rev IS NULL AND tqhd_status = 'A'))
"
"         AND (tqln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND (porh_mode = 'PR' OR (porh_mode = 'SC' AND porh_type NOT IN ('SL','SS')))
"
"         AND porl_matl_type NOT IN ('CS','PC')
"
"         AND prod_stocked = 'Y'
"
"       ORDER BY tqln_seq_no;
"
"
"
"    CURSOR c2 IS
"
"      SELECT porh_receipt_pfx,porl_receipt_no
"
"        FROM tqm_qc_hd_vw,
"
"             tqm_qc_ln_vw,
"
"             pur_ord_receipt_ln_view,
"
"	     pur_ord_receipt_hd_view
"
"       WHERE tqhd_bu = tqln_bu
"
"         AND tqhd_qc_no = tqln_qc_no
"
"         AND porl_bu = tqln_bu
"
"         AND porl_receipt_no = tqln_vou_no
"
"         AND porl_seq_no = tqln_vou_line_no
"
"	 AND porh_bu = porl_bu
"
"	 AND porh_receipt_no = porl_receipt_no
"
"         AND tqhd_bu = p_bu
"
"         AND tqhd_qc_pfx = p_vou_pfx
"
"         AND tqhd_qc_no = p_vou_no
"
"         AND tqhd_qc_rev = p_vou_rev
"
"         AND (tqln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"       GROUP BY porh_receipt_pfx,porl_receipt_no;
"
"
"
"CURSOR c3(c_vou_seq_no	NUMBER) IS
"
"SELECT tqmls_sys_ls_no
"
"  FROM tqm_lot_serial_nos_vw
"
" WHERE tqmls_bu = p_bu
"
"   AND tqmls_qc_pfx = p_vou_pfx
"
"   AND tqmls_qc_no = p_vou_no
"
"   AND tqmls_qc_rev = p_vou_rev
"
"   AND tqmls_qc_doc_seq_no = c_vou_seq_no
"
"   AND tqmls_sys_ls_no IS NOT NULL;
"
"
"
"v_jrnl_trans_no		NUMBER(15);
"
"v_vou_date		DATE;
"
"v_vou_year		NUMBER;
"
"v_vou_period		NUMBER;
"
"
"
"v_rnd			NUMBER;
"
"
"
"v_rcpt_qty		NUMBER;
"
"v_unit_cost		NUMBER;
"
"
"
"v_store_id		stores.store_id%TYPE;
"
"v_store_desc		stores.store_desc1%TYPE;
"
"v_dept_id		departments.dept_id%TYPE;
"
"v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"v_chrg_type		VARCHAR2(5);
"
"v_exp_share_pct		NUMBER;
"
"
"
"v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"v_acct_plnt_loc		profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"v_acct_lvl_prj		profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"v_acct_cc_code		profit_cost_centers.pcc_cc_code%TYPE;
"
"v_acct			gl_accts.glac_acct%TYPE;
"
"v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"v_upd_ref1		VARCHAR2(200);
"
"v_upd_ref2		VARCHAR2(200);
"
"
"
"cr3			c3%ROWTYPE;
"
"
"
"v_sub_plnt		VARCHAR2(10);
"
"  v_ge_no		VARCHAR2(15);
"
"  v_to_store_id		VARCHAR2(10);
"
"  v_plnt_loc_id	pur_ord_receipt_hd.porh_plnt_loc_id%TYPE;
"
"
"
"BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_tqm - Begin');
"
"    --Raise_Application_Error(-20001,'HRM '||p_vou_pfx||p_vou_no||p_vou_rev||p_vou_seq_no);
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"	  v_vou_date := SYSDATE;
"
"	  v_vou_year := func_find_year(p_bu,v_vou_date);
"
"	  v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"      v_plnt_loc_id := cr1.porh_plnt_loc_id;
"
"      IF cr1.porh_status = 'R' THEN
"
"        v_vou_date := cr1.porl_grn_recv_date;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"      ELSE
"
"        v_vou_date := NVL(TRUNC(cr1.tqhd_qc_compl_date),TRUNC(SYSDATE));
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"      END IF;
"
"
"
"	IF cr1.porh_type = 'AT' THEN
"
"
"
"	  SELECT DISTINCT siln_ge_no
"
"	    INTO v_ge_no
"
"	    FROM sales_invoices_hd,sales_invoices_ln
"
"	   WHERE sihd_bu = siln_bu
"
"	     AND sihd_plant = siln_plnt
"
"	     AND sihd_doc_no = siln_doc_no
"
"	     AND sihd_bu = p_bu
"
"	     AND sihd_plant = p_plnt
"
"	     AND sihd_stk_trfr_grn_no = cr1.porl_receipt_no;
"
"
"
"
"
"	  SELECT gehd_to_store_id
"
"	    INTO v_to_store_id
"
"	    FROM gate_entry_hd
"
"	   WHERE gehd_bu = p_bu
"
"	     AND gehd_plnt = p_plnt
"
"	     AND gehd_doc_no = v_ge_no;
"
"
"
"	  /*SELECT sp_sub_plnt_id
"
"	    INTO v_sub_plnt
"
"	    FROM sub_plants,sub_plants_wh_asso
"
"	   WHERE sp_bu = spwa_bu
"
"	     AND sp_sub_plnt_id = spwa_sub_plnt_id
"
"	     AND sp_bu = p_bu
"
"	     AND sp_plnt_id = p_plnt
"
"	     AND spwa_store_id = v_to_store_id;*/
"
"
"
"	  /*SELECT suplr_sub_plnt
"
"	    INTO v_sub_plnt
"
"	    FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"	     AND suplr_suplr_id = cr1.porh_suplr_id;*/
"
"	ELSE
"
"	  v_sub_plnt := NULL;
"
"	END IF;
"
"        --v_rcpt_qty := (cr1.tqln_receipt_qty/cr1.porl_conv_factor);
"
"	v_rcpt_qty := cr1.tqln_stk_receipt_qty;
"
"
"
"	v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"
"
"	/*IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	    (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	   cr1.prod_cost_method = 'MAC' THEN
"
"	  IF cr1.porl_status = 'R' THEN
"
"	  SELECT sttr_bc_unit_cost
"
"	    INTO v_unit_cost
"
"	    FROM stock_trans
"
"	   WHERE sttr_bu = p_bu
"
"	     AND sttr_store_id = v_store_id
"
"	     AND sttr_vou_pfx = cr1.porl_receipt_pfx
"
"	     AND sttr_vou_no = cr1.porl_receipt_no
"
"	     AND sttr_vou_line_no = cr1.porl_seq_no
"
"	     AND sttr_trans_qty < 0;
"
"	  ELSE
"
"	  v_unit_cost := func_find_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id);
"
"	  END IF;
"
"	ELSIF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	       (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	      cr1.prod_cost_method IN ('FIFO','LIFO') THEN
"
"          v_unit_cost := func_find_rcpt_batch_unitcost(p_bu,v_store_id,cr1.porl_prod_id,cr1.porl_prod_rev,
"
"	                                      cr1.porl_receipt_pfx,cr1.porl_receipt_no,cr1.porl_seq_no);
"
"	ELSE
"
"
"
"	  OPEN c3(cr1.tqln_seq_no);
"
"	  FETCH c3 INTO cr3;
"
"	    IF c3%NOTFOUND THEN
"
"	      v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,NULL);
"
"	    ELSE
"
"	      LOOP
"
"	        v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr3.tqmls_sys_ls_no);
"
"	        FETCH c3 INTO cr3;
"
"	        EXIT WHEN c3%NOTFOUND;
"
"	      END LOOP;
"
"	    END IF;
"
"	  CLOSE c3;
"
"	END IF;*/
"
"
"
"        IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"            (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) THEN
"
"          v_unit_cost := ((((cr1.porl_sc_unit_cost + cr1.porl_bag_chrg_amt + cr1.porl_sc_chrg_amt - cr1.porl_sc_lm_disc_amt) -
"
"                            (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) * cr1.porh_exchange_rate) /*+
"
"	  		   cr1.porl_ap_lc_chrg_amt*/ + cr1.porl_bc_land_cost -
"
"	  		  CASE WHEN cr1.porl_rebate_cost_type = 'N' THEN cr1.porl_rebate_unit_cost ELSE 0 END) * cr1.porl_conv_factor;
"
"        ELSE
"
"          v_unit_cost := (cr1.porl_scon_mat_unit_cost * cr1.porl_conv_factor) +
"
"	                 ((cr1.porl_sc_chrg_amt * cr1.porh_exchange_rate * cr1.porl_conv_factor) +
"
"	  		cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost /*+ cr1.porl_ap_lc_chrg_amt*/);
"
"        END IF;
"
"
"
"        v_upd_ref2 := CASE WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'PR' THEN 'GRN#('
"
"		                   WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'SC' THEN 'SRN#('
"
"						   ELSE 'GRN#('
"
"					  END;
"
"
"
"        v_upd_ref1 := SUBSTR('GRN #('|| p_vou_pfx || '/' || p_vou_no || ') / ' || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.porl_seq_no||')/PO#('||cr1.porl_po_pfx||'/'||cr1.porl_po_no||'/'
"
"			       ||cr1.porl_po_seq_no||'/'||cr1.porl_po_sub_seq_no||')/'||func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),1,150);
"
"
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'P');
"
"		v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"		DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"		proc_find_store_gl_accts(p_bu,
"
"                                 cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 cr1.porh_terr_id,
"
"				 cr1.porl_cls_id,
"
"				 cr1.porl_sub_cls_id,
"
"				 cr1.porl_tcf_id,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct,
"
"				 p_sub_plnt => v_sub_plnt,
"
"			         p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"			         p_gst_supply => cr1.porh_gst_clf_type,
"
"			         p_gst_type => cr1.porl_gst_exempt_flag
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"													v_acct_lvl2,
"
"													v_acct_lvl3,
"
"													v_acct_lvl4,
"
"													v_acct_lvl_prj,
"
"													v_acct,
"
"													v_acct_plnt,
"
"													p_lang
"
"												   );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"					  cr1.porh_plnt,
"
"					  'PIRV',
"
"					  cr1.porh_type,
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr1.porl_prod_desc1,
"
"					  v_acct_plnt,
"
"					  cr1.porh_plnt_loc_id,
"
"					  v_acct_lvl1,
"
"					  v_acct_lvl2,
"
"					  v_acct_lvl3,
"
"					  v_acct_lvl4,
"
"					  v_acct_lvl5,
"
"					  v_acct_lvl6,
"
"					  v_acct_lvl_prj,
"
"					  v_acct_cc_code,
"
"					  v_acct,
"
"					  v_acct_desc,
"
"					  v_vou_date,
"
"					  v_vou_year,
"
"					  v_vou_period,
"
"					  ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"					  0,
"
"					  ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"					  0,
"
"					  v_store_id,
"
"					  v_store_desc,
"
"					  v_dept_id,
"
"					  v_dept_desc,
"
"					  v_rcpt_qty,
"
"					  v_unit_cost,
"
"					  'GRN',
"
"					  'POM',
"
"					  v_upd_ref1,
"
"					  v_upd_ref2,
"
"					  NULL,--cr1.porh_suplr_id,
"
"					  NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"					  NULL,
"
"					  NULL,
"
"					  cr1.porl_cls_id,
"
"					  func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"					  cr1.porl_sub_cls_id,
"
"					  func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"					  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"					 );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"        v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"        proc_find_store_gl_accts(p_bu,
"
"                                 cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 cr1.porh_terr_id,
"
"				 cr1.porl_cls_id,
"
"				 cr1.porl_sub_cls_id,
"
"				 cr1.porl_tcf_id,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct,
"
"				 p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"													v_acct_lvl2,
"
"													v_acct_lvl3,
"
"													v_acct_lvl4,
"
"													v_acct_lvl_prj,
"
"													v_acct,
"
"													v_acct_plnt,
"
"													p_lang
"
"												   );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"					  cr1.porh_plnt,
"
"					  'PIRV',
"
"					  cr1.porh_type,
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr1.porl_prod_desc1,
"
"					  v_acct_plnt,
"
"					  v_acct_plnt_loc,
"
"					  v_acct_lvl1,
"
"					  v_acct_lvl2,
"
"					  v_acct_lvl3,
"
"					  v_acct_lvl4,
"
"					  v_acct_lvl5,
"
"					  v_acct_lvl6,
"
"					  v_acct_lvl_prj,
"
"					  v_acct_cc_code,
"
"					  v_acct,
"
"					  v_acct_desc,
"
"					  v_vou_date,
"
"					  v_vou_year,
"
"					  v_vou_period,
"
"					  0,
"
"					  ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"					  0,
"
"					  ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"					  v_store_id,
"
"					  v_store_desc,
"
"					  v_dept_id,
"
"					  v_dept_desc,
"
"					  v_rcpt_qty,
"
"					  v_unit_cost,
"
"					  'GRN',
"
"					  'POM',
"
"					  v_upd_ref1,
"
"					  v_upd_ref2,
"
"					  NULL,--cr1.porh_suplr_id,
"
"					  NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"					  NULL,
"
"					  NULL,
"
"					  cr1.porl_cls_id,
"
"					  func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"					  cr1.porl_sub_cls_id,
"
"					  func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"					  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"					 );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"        proc_ins_aj_variance_amt(p_bu,
"
"                                 p_plnt,
"
"			         p_plnt,
"
"				 'GRN',
"
"				 cr2.porh_receipt_pfx,
"
"				 cr2.porl_receipt_no,
"
"				 v_vou_date,
"
"				 v_vou_year,
"
"				 v_vou_period,
"
"				 'POM',
"
"				 'Purchase Receipts',
"
"				 p_user,
"
"				 NULL,
"
"				 1,
"
"				 p_plnt_loc_id => v_plnt_loc_id
"
"				);
"
"
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         p_plnt,
"
"			 v_vou_date,
"
"			 v_vou_year,
"
"			 v_vou_period,
"
"			 cr2.porh_receipt_pfx,
"
"			 cr2.porl_receipt_no,
"
"			 NULL,
"
"			 'POM',
"
"			 p_user,
"
"			 p_lang,
"
"			 'GRN'
"
"			);
"
"      END LOOP;
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_tqm - End');
"
"
"
"  END proc_ins_insp_jrnl_frm_tqm;
"
"
"
"/******************************GRN RECEIVED QTY JOURNALS*******************************************/
"
"  PROCEDURE proc_ins_rcpt_jrnl_frm_grn(p_bu			business_units.bu_id%TYPE,
"
"				                       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"									   p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"									   p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"									   p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"									   p_user		VARCHAR2,
"
"									   p_lang		NUMBER
"
"									  )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM pur_ord_receipt_hd_view,pur_ord_receipt_ln_view,products
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND prod_bu = porl_bu
"
"         AND prod_id = porl_prod_id
"
"         AND prod_rev = porl_prod_rev
"
"         AND porh_bu = p_bu
"
"         AND porh_plnt = p_plnt
"
"         AND porh_receipt_pfx = p_vou_pfx
"
"         AND porh_receipt_no = p_vou_no
"
"         AND (porl_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND porh_type NOT IN ('SA')
"
"         AND porl_matl_type NOT IN ('CS','PC')
"
"         AND porl_status <> 'C'
"
"         AND prod_stocked = 'Y'
"
"       ORDER BY porl_seq_no;
"
"
"
"CURSOR c2(c_rcpt_seq_no	NUMBER) IS
"
"SELECT prcls_sys_ls_no
"
"  FROM pur_rcpt_lot_serial_view
"
" WHERE prcls_bu = p_bu
"
"   AND prcls_doc_no = p_vou_no
"
"   AND prcls_doc_seq_no = c_rcpt_seq_no
"
"   AND prcls_sys_ls_no IS NOT NULL
"
" ORDER BY prcls_seq_no;
"
"
"
"v_jrnl_trans_no		NUMBER(15);
"
"v_vou_date		DATE;
"
"v_vou_year		NUMBER;
"
"v_vou_period		NUMBER;
"
"
"
"v_rnd			NUMBER;
"
"
"
"v_rcpt_qty		NUMBER;
"
"v_acpt_qty		NUMBER;
"
"v_rej_qty		NUMBER;
"
"v_aod_qty		NUMBER;
"
"
"
"v_unit_cost		NUMBER;
"
"
"
"v_store_id		stores.store_id%TYPE;
"
"v_store_desc		stores.store_desc1%TYPE;
"
"v_dept_id		departments.dept_id%TYPE;
"
"v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"v_chrg_type		VARCHAR2(5);
"
"v_exp_share_pct		NUMBER;
"
"
"
"v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"v_acct_plnt_loc		profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"v_acct_lvl_prj		profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"v_acct_cc_code		profit_cost_centers.pcc_cc_code%TYPE;
"
"v_acct			gl_accts.glac_acct%TYPE;
"
"v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"v_upd_ref1		VARCHAR2(200);
"
"v_upd_ref2		VARCHAR2(200);
"
"
"
"cr2			c2%ROWTYPE;
"
"
"
"v_sub_plnt		VARCHAR2(10);
"
"  v_ge_no		VARCHAR2(15);
"
"  v_to_store_id		VARCHAR2(10);
"
"  v_plnt_loc_id	pur_ord_receipt_hd.porh_plnt_loc_id%TYPE;
"
"
"
"BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_rcpt_jrnl_frm_grn - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_vou_date := SYSDATE;
"
"      v_vou_year := func_find_year(p_bu,v_vou_date);
"
"      v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"      v_plnt_loc_id := cr1.porh_plnt_loc_id;
"
"      IF cr1.porl_status = 'R' THEN
"
"        v_vou_date := NVL(cr1.porl_grn_recv_date,cr1.porh_receipt_date);
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"      ELSE
"
"        v_vou_date := SYSDATE;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"      END IF;
"
"
"
"        /*v_rcpt_qty := (cr1.porl_accepted_qty + cr1.porl_rejected_qty + cr1.porl_aod_qty)/cr1.porl_conv_factor;
"
"        v_acpt_qty := (cr1.porl_accepted_qty/cr1.porl_conv_factor);
"
"        v_rej_qty := (cr1.porl_rejected_qty/cr1.porl_conv_factor);
"
"        v_aod_qty := (cr1.porl_aod_qty/cr1.porl_conv_factor);*/
"
"
"
"        v_rcpt_qty := (cr1.porl_stk_accepted_qty + cr1.porl_stk_rejected_qty + cr1.porl_stk_aod_qty);
"
"
"
"	IF func_find_aod_wh_req_flag(p_bu,cr1.porl_plnt) = 'N' THEN
"
"          v_acpt_qty := cr1.porl_stk_accepted_qty + cr1.porl_stk_aod_qty;
"
"	  v_aod_qty := 0;
"
"	ELSE
"
"	  v_acpt_qty := cr1.porl_stk_accepted_qty;
"
"	  v_aod_qty := cr1.porl_stk_aod_qty;
"
"	END IF;
"
"
"
"        v_rej_qty := cr1.porl_stk_rejected_qty;
"
"
"
"	IF cr1.porh_type = 'AT' THEN
"
"	  SELECT DISTINCT siln_ge_no
"
"	    INTO v_ge_no
"
"	    FROM sales_invoices_hd,sales_invoices_ln
"
"	   WHERE sihd_bu = siln_bu
"
"	     AND sihd_plant = siln_plnt
"
"	     AND sihd_doc_no = siln_doc_no
"
"	     AND sihd_bu = p_bu
"
"	     AND sihd_plant = p_plnt
"
"	     AND sihd_stk_trfr_grn_pfx = p_vou_pfx
"
"	     AND sihd_stk_trfr_grn_no = p_vou_no;
"
"
"
"
"
"	  SELECT gehd_to_store_id
"
"	    INTO v_to_store_id
"
"	    FROM gate_entry_hd
"
"	   WHERE gehd_bu = p_bu
"
"	     AND gehd_plnt = p_plnt
"
"	     AND gehd_doc_no = v_ge_no;
"
"
"
"	  /*SELECT sp_sub_plnt_id
"
"	    INTO v_sub_plnt
"
"	    FROM sub_plants,sub_plants_wh_asso
"
"	   WHERE sp_bu = spwa_bu
"
"	     AND sp_sub_plnt_id = spwa_sub_plnt_id
"
"	     AND sp_bu = p_bu
"
"	     AND sp_plnt_id = p_plnt
"
"	     AND spwa_store_id = v_to_store_id;*/
"
"
"
"	  /*SELECT suplr_sub_plnt
"
"	    INTO v_sub_plnt
"
"	    FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"	     AND suplr_suplr_id = cr1.porh_suplr_id;*/
"
"	ELSE
"
"	  v_sub_plnt := NULL;
"
"	END IF;
"
"
"
"	IF cr1.porl_qc_doc_pfx IS NULL AND cr1.porl_qc_doc_no IS NULL THEN
"
"	  v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'I');
"
"	ELSE
"
"	  v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'P');
"
"	END IF;
"
"
"
"	/*IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	    (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	   cr1.prod_cost_method = 'MAC' THEN
"
"	  IF cr1.porl_status = 'R' THEN
"
"	  	  SELECT sttr_bc_unit_cost
"
"	    INTO v_unit_cost
"
"	    FROM stock_trans
"
"	   WHERE sttr_bu = p_bu
"
"	     AND sttr_store_id = v_store_id
"
"	     AND sttr_vou_pfx = cr1.porl_receipt_pfx
"
"	     AND sttr_vou_no = cr1.porl_receipt_no
"
"	     AND sttr_vou_line_no = cr1.porl_seq_no
"
"	     AND sttr_trans_qty < 0;
"
"	  ELSE
"
"	  v_unit_cost := func_find_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id);
"
"	  END IF;
"
"	ELSIF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	       (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	      cr1.prod_cost_method IN ('FIFO','LIFO') THEN
"
"          v_unit_cost := func_find_rcpt_batch_unitcost(p_bu,v_store_id,cr1.porl_prod_id,cr1.porl_prod_rev,
"
"	                                      cr1.porl_receipt_pfx,cr1.porl_receipt_no,cr1.porl_seq_no);
"
"      ELSE
"
"        OPEN c2(cr1.porl_seq_no);
"
"	FETCH c2 INTO cr2;
"
"	  IF c2%NOTFOUND THEN
"
"	    v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,NULL);
"
"	  ELSE
"
"	    LOOP
"
"	      v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr2.prcls_sys_ls_no);
"
"	      FETCH c2 INTO cr2;
"
"	      EXIT WHEN c2%NOTFOUND;
"
"	    END LOOP;
"
"	  END IF;
"
"	CLOSE c2;
"
"      END IF;*/
"
"
"
"      IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"          (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) THEN
"
"        v_unit_cost := ((((cr1.porl_sc_unit_cost + cr1.porl_bag_chrg_amt + cr1.porl_sc_chrg_amt - cr1.porl_sc_lm_disc_amt) -
"
"                          (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) * cr1.porh_exchange_rate) +
"
"			   cr1.porl_ap_lc_chrg_amt + cr1.porl_bc_land_cost -
"
"			  CASE WHEN cr1.porl_rebate_cost_type = 'N' THEN cr1.porl_rebate_unit_cost ELSE 0 END) * cr1.porl_conv_factor;
"
"      ELSE
"
"        v_unit_cost := (cr1.porl_scon_mat_unit_cost * cr1.porl_conv_factor) +
"
"	               ((cr1.porl_sc_chrg_amt * cr1.porh_exchange_rate * cr1.porl_conv_factor) +
"
"			cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost + cr1.porl_ap_lc_chrg_amt);
"
"      END IF;
"
"
"
"
"
"        v_upd_ref2 := CASE WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'PR' THEN 'GRN#('
"
"		           WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'SC' THEN 'SRN#('
"
"			   ELSE 'GRN#('
"
"		      END;
"
"
"
"        v_upd_ref1 := SUBSTR('GRN #('|| p_vou_pfx || '/' || p_vou_no || ') / ' || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.porl_seq_no||')/PO#('||cr1.porl_po_pfx||'/'||cr1.porl_po_no||'/'
"
"			       ||cr1.porl_po_seq_no||'/'||cr1.porl_po_sub_seq_no||')/'||func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),1,150);
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"	--Raise_Application_Error(-20999,'HRM '||v_rcpt_qty||'/'||v_acpt_qty||'/'||v_rej_qty||'/'||v_aod_qty||'/'||v_unit_cost);
"
"	IF v_acpt_qty > 0 THEN
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Accepted Qty. Journals');
"
"
"
"	  v_store_id := cr1.porl_storage_store_id;
"
"	  v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	  proc_find_store_gl_accts(p_bu,
"
"                                   cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"				   'ST',
"
"				   v_store_id,
"
"				   cr1.porh_terr_id,
"
"				   cr1.porl_cls_id,
"
"				   cr1.porl_sub_cls_id,
"
"				   cr1.porl_tcf_id,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct,
"
"				   p_sub_plnt => v_sub_plnt,
"
"			     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"                                    p_prod_id => cr1.porl_prod_id
"
"				  );
"
"
"
"            IF cr1.porl_cc_plnt IS NOT NULL AND cr1.porl_cc_lvl1 IS NOT NULL THEN
"
"	      v_acct_plnt := cr1.porl_cc_plnt;
"
"	      v_acct_lvl1 := cr1.porl_cc_lvl1;
"
"	      v_acct_lvl2 := cr1.porl_cc_lvl2;
"
"	      v_acct_lvl3 := cr1.porl_cc_lvl3;
"
"	      v_acct_lvl4 := cr1.porl_cc_lvl4;
"
"	      v_acct_lvl_prj := cr1.porl_cc_prj_lvl;
"
"	    END IF;
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						      v_acct_lvl2,
"
"						      v_acct_lvl3,
"
"						      v_acct_lvl4,
"
"						      v_acct_lvl_prj,
"
"						      v_acct,
"
"						      v_acct_plnt,
"
"						      p_lang
"
"						     );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"			cr1.porh_plnt,
"
"			'GRN',
"
"			cr1.porh_type,
"
"			cr1.porh_receipt_pfx,
"
"			cr1.porl_receipt_no,
"
"			cr1.porl_seq_no,
"
"			cr1.porl_prod_id,
"
"			cr1.porl_prod_rev,
"
"			cr1.porl_prod_desc1,
"
"			v_acct_plnt,
"
"			cr1.porh_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			ROUND(v_acpt_qty * v_unit_cost,v_rnd),
"
"			0,
"
"			ROUND(v_acpt_qty * v_unit_cost,v_rnd),
"
"			0,
"
"			v_store_id,
"
"			v_store_desc,
"
"			v_dept_id,
"
"			v_dept_desc,
"
"			v_acpt_qty,
"
"			v_unit_cost,
"
"			'GRN',
"
"			'POM',
"
"			v_upd_ref1,
"
"			v_upd_ref2,
"
"			NULL,--cr1.porh_suplr_id,
"
"			NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			NULL,
"
"			NULL,
"
"			cr1.porl_cls_id,
"
"			func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			cr1.porl_sub_cls_id,
"
"			func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			p_user,
"
"			p_ref_no => cr1.porh_suplr_doc_no,
"
"			p_ref_date => cr1.porh_suplr_doc_date,
"
"			p_hsn_code => cr1.porl_hsn_code,
"
"			p_gstin_no => cr1.porh_gstn_no,
"
"			p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		       );
"
"
"
"        END IF;
"
"
"
"        IF v_rej_qty > 0 THEN
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Rejected Qty. Journals');
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'J');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"				   'ST',
"
"				   v_store_id,
"
"				   cr1.porh_terr_id,
"
"				   cr1.porl_cls_id,
"
"				   cr1.porl_sub_cls_id,
"
"				   cr1.porl_tcf_id,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct,
"
"				   p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"				     p_prod_id => cr1.porl_prod_id
"
"				  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						      v_acct_lvl2,
"
"						      v_acct_lvl3,
"
"						      v_acct_lvl4,
"
"						      v_acct_lvl_prj,
"
"						      v_acct,
"
"						      v_acct_plnt,
"
"						      p_lang
"
"						     );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"			cr1.porh_plnt,
"
"			'GRN',
"
"			cr1.porh_type,
"
"			cr1.porh_receipt_pfx,
"
"			cr1.porl_receipt_no,
"
"			cr1.porl_seq_no,
"
"			cr1.porl_prod_id,
"
"			cr1.porl_prod_rev,
"
"			cr1.porl_prod_desc1,
"
"			v_acct_plnt,
"
"			cr1.porh_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			ROUND(v_rej_qty * v_unit_cost,v_rnd),
"
"			0,
"
"			ROUND(v_rej_qty * v_unit_cost,v_rnd),
"
"			0,
"
"			v_store_id,
"
"			v_store_desc,
"
"			v_dept_id,
"
"			v_dept_desc,
"
"			v_rej_qty,
"
"			v_unit_cost,
"
"			'GRN',
"
"			'POM',
"
"			v_upd_ref1,
"
"			v_upd_ref2,
"
"			NULL,--cr1.porh_suplr_id,
"
"			NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			NULL,
"
"			NULL,
"
"			cr1.porl_cls_id,
"
"			func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			cr1.porl_sub_cls_id,
"
"			func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			p_user,
"
"			p_ref_no => cr1.porh_suplr_doc_no,
"
"			p_ref_date => cr1.porh_suplr_doc_date,
"
"			p_hsn_code => cr1.porl_hsn_code,
"
"			p_gstin_no => cr1.porh_gstn_no,
"
"			p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                       );
"
"
"
"        END IF;
"
"
"
"        IF v_aod_qty > 0 THEN
"
"
"
"          DBMS_OUTPUT.PUT_LINE('AOD Qty. Journals');
"
"
"
"	  v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'A');
"
"	  v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	  proc_find_store_gl_accts(p_bu,
"
"                                   cr1.porh_plnt,
"
"				   cr1.porh_plnt_loc_id,
"
"				   'ST',
"
"				   v_store_id,
"
"				   cr1.porh_terr_id,
"
"				   cr1.porl_cls_id,
"
"				   cr1.porl_sub_cls_id,
"
"				   cr1.porl_tcf_id,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct,
"
"				   p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"				     p_prod_id => cr1.porl_prod_id
"
"				  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						      v_acct_lvl2,
"
"						      v_acct_lvl3,
"
"						      v_acct_lvl4,
"
"						      v_acct_lvl_prj,
"
"						      v_acct,
"
"						      v_acct_plnt,
"
"						      p_lang
"
"						     );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"			cr1.porh_plnt,
"
"			'GRN',
"
"			cr1.porh_type,
"
"			cr1.porh_receipt_pfx,
"
"			cr1.porl_receipt_no,
"
"			cr1.porl_seq_no,
"
"			cr1.porl_prod_id,
"
"			cr1.porl_prod_rev,
"
"			cr1.porl_prod_desc1,
"
"			v_acct_plnt,
"
"			cr1.porh_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			ROUND(v_aod_qty * v_unit_cost,v_rnd),
"
"			0,
"
"			ROUND(v_aod_qty * v_unit_cost,v_rnd),
"
"			0,
"
"			v_store_id,
"
"			v_store_desc,
"
"			v_dept_id,
"
"			v_dept_desc,
"
"			v_aod_qty,
"
"			v_unit_cost,
"
"			'GRN',
"
"			'POM',
"
"			v_upd_ref1,
"
"			v_upd_ref2,
"
"			NULL,--cr1.porh_suplr_id,
"
"			NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"			NULL,
"
"			NULL,
"
"			cr1.porl_cls_id,
"
"			func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"			cr1.porl_sub_cls_id,
"
"			func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"			p_user,
"
"			p_ref_no => cr1.porh_suplr_doc_no,
"
"			p_ref_date => cr1.porh_suplr_doc_date,
"
"			p_hsn_code => cr1.porl_hsn_code,
"
"			p_gstin_no => cr1.porh_gstn_no,
"
"			p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		       );
"
"
"
"        END IF;
"
"
"
"	DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"	DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"	IF cr1.porl_qc_doc_pfx IS NULL AND cr1.porl_qc_doc_no IS NULL THEN
"
"	  v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'I');
"
"	ELSE
"
"	  v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'P');
"
"	END IF;
"
"
"
"	v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	proc_find_store_gl_accts(p_bu,
"
"                                 cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 cr1.porh_terr_id,
"
"				 cr1.porl_cls_id,
"
"				 cr1.porl_sub_cls_id,
"
"				 cr1.porl_tcf_id,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct,
"
"				 p_sub_plnt => v_sub_plnt,
"
"				     p_tax_pct => func_find_hsn_sac_pct(p_bu,cr1.porl_hsn_code,TRUNC(v_vou_date)),
"
"				     p_gst_supply => cr1.porh_gst_clf_type,
"
"				     p_gst_type => cr1.porl_gst_exempt_flag,
"
"				     p_prod_id => cr1.porl_prod_id
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"						   );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"		      cr1.porh_plnt,
"
"		      'GRN',
"
"		      cr1.porh_type,
"
"		      cr1.porh_receipt_pfx,
"
"		      cr1.porl_receipt_no,
"
"		      cr1.porl_seq_no,
"
"		      cr1.porl_prod_id,
"
"		      cr1.porl_prod_rev,
"
"		      cr1.porl_prod_desc1,
"
"		      v_acct_plnt,
"
"		      cr1.porh_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      v_vou_date,
"
"		      v_vou_year,
"
"		      v_vou_period,
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'GRN',
"
"		      'POM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,--cr1.porh_suplr_id,
"
"		      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.porl_cls_id,
"
"		      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		      cr1.porl_sub_cls_id,
"
"		      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		      p_user,
"
"		      p_ref_no => cr1.porh_suplr_doc_no,
"
"		      p_ref_date => cr1.porh_suplr_doc_date,
"
"		      p_hsn_code => cr1.porl_hsn_code,
"
"		      p_gstin_no => cr1.porh_gstn_no,
"
"		      p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		     );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      proc_ins_aj_variance_amt(p_bu,
"
"                               p_plnt,
"
"			       p_plnt,
"
"			       'GRN',
"
"			       p_vou_pfx,
"
"			       p_vou_no,
"
"			       v_vou_date,
"
"			       v_vou_year,
"
"			       v_vou_period,
"
"			       'POM',
"
"			       'Purchase Receipts',
"
"			       p_user,
"
"			       NULL,
"
"			       1,
"
"			       p_plnt_loc_id => v_plnt_loc_id
"
"			      );
"
"
"
"      proc_ins_gl_jrnl(p_bu,
"
"                       p_plnt,
"
"		       v_vou_date,
"
"		       v_vou_year,
"
"		       v_vou_period,
"
"		       p_vou_pfx,
"
"		       p_vou_no,
"
"		       NULL,
"
"		       'POM',
"
"		       p_user,
"
"		       p_lang,
"
"		       'GRN'
"
"		      );
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_rcpt_jrnl_frm_grn - End');
"
"
"
"  END proc_ins_rcpt_jrnl_frm_grn;
"
"
"
"/******************************TQM INSPECTION CANCELLED JOURNALS*******************************************/
"
"  PROCEDURE proc_can_insp_jrnl_frm_tqm(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"				       p_vou_no		tqm_qc_hd.tqhd_qc_no%TYPE,
"
"				       p_vou_seq_no	tqm_qc_ln.tqln_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM tqm_qc_plan_hd,
"
"             tqm_qc_plan_ln,
"
"             pur_ord_receipt_ln,
"
"             pur_ord_receipt_hd,
"
"             suppliers,
"
"             products
"
"       WHERE tqphd_bu = tqpln_bu
"
"         AND tqphd_pln_no = tqpln_pln_no
"
"         AND porl_bu = tqpln_bu
"
"         AND porl_receipt_no = tqpln_vou_no
"
"         AND porl_seq_no = tqpln_vou_line_no
"
"         AND porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND suplr_bu = porh_bu
"
"         AND suplr_suplr_id = porh_suplr_id
"
"         AND prod_bu = porl_bu
"
"         AND prod_id = porl_prod_id
"
"         AND prod_rev = porl_prod_rev
"
"         AND tqphd_bu = p_bu
"
"         AND tqphd_pln_pfx = p_vou_pfx
"
"         AND tqphd_pln_no = p_vou_no
"
"         AND (tqpln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND (porh_mode = 'PR' OR (porh_mode = 'SC' AND porh_type NOT IN ('SL','SS')))
"
"         AND porl_matl_type NOT IN ('PC','CS')
"
"         AND prod_stocked = 'Y'
"
"       ORDER BY tqpln_seq_no;
"
"
"
"    CURSOR c2(c_pln_pfx		VARCHAR2,
"
"              c_pln_no		VARCHAR2,
"
"	      c_seq_no		NUMBER) IS
"
"    SELECT tqplsd_sys_ls_no,tqplsd_lot_no,tqplsd_serial_no
"
"      FROM tqm_qc_plan_lot_serial_dtls
"
"     WHERE tqplsd_bu = p_bu
"
"       AND tqplsd_pln_no = c_pln_no
"
"       AND tqplsd_seq_no = c_seq_no
"
"     ORDER BY tqplsd_sub_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER;
"
"    v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"    v_vou_pfx		VARCHAR2(5);
"
"    v_vou_no		VARCHAR2(15);
"
"
"
"    cr2			c2%ROWTYPE;
"
"
"
"    v_sub_plnt		VARCHAR2(10);
"
"    v_ge_no		VARCHAR2(15);
"
"    v_to_store_id	VARCHAR2(10);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_can_insp_jrnl_frm_tqm - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_vou_date := SYSDATE;
"
"      v_vou_year := func_find_year(p_bu,v_vou_date);
"
"      v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"	IF cr1.porh_type = 'AT' THEN
"
"	  SELECT DISTINCT siln_ge_no
"
"	    INTO v_ge_no
"
"	    FROM sales_invoices_hd,sales_invoices_ln
"
"	   WHERE sihd_bu = siln_bu
"
"	     AND sihd_plant = siln_plnt
"
"	     AND sihd_doc_no = siln_doc_no
"
"	     AND sihd_bu = p_bu
"
"	     AND sihd_plant = p_plnt
"
"	     AND sihd_stk_trfr_grn_pfx = p_vou_pfx
"
"	     AND sihd_stk_trfr_grn_no = p_vou_no;
"
"
"
"
"
"	  SELECT gehd_to_store_id
"
"	    INTO v_to_store_id
"
"	    FROM gate_entry_hd
"
"	   WHERE gehd_bu = p_bu
"
"	     AND gehd_plnt = p_plnt
"
"	     AND gehd_doc_no = v_ge_no;
"
"
"
"	  /*SELECT sp_sub_plnt_id
"
"	    INTO v_sub_plnt
"
"	    FROM sub_plants,sub_plants_wh_asso
"
"	   WHERE sp_bu = spwa_bu
"
"	     AND sp_sub_plnt_id = spwa_sub_plnt_id
"
"	     AND sp_bu = p_bu
"
"	     AND sp_plnt_id = p_plnt
"
"	     AND spwa_store_id = v_to_store_id;*/
"
"
"
"	  /*SELECT suplr_sub_plnt
"
"	    INTO v_sub_plnt
"
"	    FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"	     AND suplr_suplr_id = cr1.porh_suplr_id;*/
"
"	ELSE
"
"	  v_sub_plnt := NULL;
"
"	END IF;
"
"
"
"        --v_rcpt_qty := (cr1.tqpln_receipt_qty/cr1.porl_conv_factor);
"
"
"
"	v_rcpt_qty := cr1.tqpln_stk_receipt_qty;
"
"
"
"	v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"
"
"	/*IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	    (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	   cr1.prod_cost_method = 'MAC' THEN
"
"	  v_unit_cost := func_find_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id);
"
"	ELSIF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	       (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	      cr1.prod_cost_method IN ('FIFO','LIFO') THEN
"
"          v_unit_cost := func_find_rcpt_batch_unitcost(p_bu,v_store_id,cr1.porl_prod_id,cr1.porl_prod_rev,
"
"	                                      cr1.porl_receipt_pfx,cr1.porl_receipt_no,cr1.porl_seq_no);
"
"	ELSE
"
"	  OPEN c2(cr1.tqpln_pln_pfx,cr1.tqpln_pln_no,cr1.tqpln_seq_no);
"
"	  FETCH c2 INTO cr2;
"
"	    IF c2%NOTFOUND THEN
"
"	      v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,NULL);
"
"	    ELSE
"
"	      LOOP
"
"	        v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr2.tqplsd_sys_ls_no);
"
"	        FETCH c2 INTO cr2;
"
"	        EXIT WHEN c2%NOTFOUND;
"
"	      END LOOP;
"
"	    END IF;
"
"	  CLOSE c2;
"
"	END IF;*/
"
"
"
"      IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"          (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) THEN
"
"        v_unit_cost := ((((cr1.porl_sc_unit_cost + cr1.porl_bag_chrg_amt + cr1.porl_sc_chrg_amt - cr1.porl_sc_lm_disc_amt) -
"
"                          (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) * cr1.porh_exchange_rate) +
"
"			   cr1.porl_ap_lc_chrg_amt + cr1.porl_bc_land_cost -
"
"			  CASE WHEN cr1.porl_rebate_cost_type = 'N' THEN cr1.porl_rebate_unit_cost ELSE 0 END) * cr1.porl_conv_factor;
"
"      ELSE
"
"        v_unit_cost := (cr1.porl_scon_mat_unit_cost * cr1.porl_conv_factor) +
"
"	               ((cr1.porl_sc_chrg_amt * cr1.porh_exchange_rate * cr1.porl_conv_factor) +
"
"			cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost + cr1.porl_ap_lc_chrg_amt);
"
"      END IF;
"
"
"
"	v_upd_ref2 := CASE WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'PR' THEN 'GRN#('
"
"		           WHEN cr1.porh_type = 'ST' AND cr1.porh_mode = 'SC' THEN 'SRN#('
"
"			   ELSE 'GRN#('
"
"		      END;
"
"
"
"        v_upd_ref1 := SUBSTR('GRN #('|| cr1.porh_receipt_pfx || '/' || p_vou_no || ') / ' || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.porl_seq_no||')/QC#('||cr1.porl_po_pfx||'/'||cr1.porl_po_no||'/'
"
"			       ||cr1.porl_po_seq_no||'/'||cr1.porl_po_sub_seq_no||')/'||func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),1,150);
"
"
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'I');
"
"        v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"        proc_find_store_gl_accts(p_bu,
"
"                                 cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 cr1.porh_terr_id,
"
"				 cr1.porl_cls_id,
"
"				 cr1.porl_sub_cls_id,
"
"				 cr1.porl_tcf_id,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct,
"
"				 p_sub_plnt => v_sub_plnt
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"						   );
"
"
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"		      cr1.porh_plnt,
"
"		      'INRV',
"
"		      cr1.porh_type,
"
"		      cr1.porh_receipt_pfx,
"
"		      cr1.porl_receipt_no,
"
"		      cr1.porl_seq_no,
"
"		      cr1.porl_prod_id,
"
"		      cr1.porl_prod_rev,
"
"		      cr1.porl_prod_desc1,
"
"		      v_acct_plnt,
"
"		      cr1.porh_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      v_vou_date,
"
"		      v_vou_year,
"
"		      v_vou_period,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'GRN',
"
"		      'POM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,--cr1.porh_suplr_id,
"
"		      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.porl_cls_id,
"
"		      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		      cr1.porl_sub_cls_id,
"
"		      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		      p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		     );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.porh_plnt,cr1.porh_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   cr1.porh_terr_id,
"
"                                   cr1.porl_cls_id,
"
"                                   cr1.porl_sub_cls_id,
"
"                                   cr1.porl_tcf_id,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct,
"
"				   p_sub_plnt => v_sub_plnt
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"	              v_jrnl_trans_no,
"
"		      cr1.porh_plnt,
"
"		      'INRV',
"
"		      cr1.porh_type,
"
"		      cr1.porh_receipt_pfx,
"
"		      cr1.porl_receipt_no,
"
"		      cr1.porl_seq_no,
"
"		      cr1.porl_prod_id,
"
"		      cr1.porl_prod_rev,
"
"		      cr1.porl_prod_desc1,
"
"		      v_acct_plnt,
"
"		      cr1.porh_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      v_vou_date,
"
"		      v_vou_year,
"
"		      v_vou_period,
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"	              v_unit_cost,
"
"		      'GRN',
"
"		      'POM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,--cr1.porh_suplr_id,
"
"		      NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.porl_cls_id,
"
"		      func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		      cr1.porl_sub_cls_id,
"
"		      func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		      p_user,
"
"		      p_ref_no => cr1.porh_suplr_doc_no,
"
"		      p_ref_date => cr1.porh_suplr_doc_date,
"
"		      p_hsn_code => cr1.porl_hsn_code,
"
"		      p_gstin_no => cr1.porh_gstn_no,
"
"		      p_gst_type => cr1.porh_gst_type,
"
"		      p_grn_tc_type => 'R',
"
"		      p_gst_input_type => cr1.porl_gst_input_type,
"
"		      p_rcpt_type => cr1.porh_type
"
"		     );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"          v_vou_pfx := cr1.porh_receipt_pfx;
"
"	  v_vou_no := cr1.porl_receipt_no;
"
"
"
"      END LOOP;
"
"
"
"      proc_ins_aj_variance_amt(p_bu,
"
"                               p_plnt,
"
"			       p_plnt,
"
"			       'GRN',
"
"			       v_vou_pfx,
"
"			       v_vou_no,
"
"			       v_vou_date,
"
"			       v_vou_year,
"
"			       v_vou_period,
"
"			       'POM',
"
"			       'Purchase Receipts',
"
"			       p_user,
"
"			       NULL,
"
"			       1
"
"			      );
"
"
"
"      proc_ins_gl_jrnl(p_bu,
"
"                       p_plnt,
"
"		       v_vou_date,
"
"		       v_vou_year,
"
"		       v_vou_period,
"
"		       v_vou_pfx,
"
"		       v_vou_no,
"
"		       NULL,
"
"		       'POM',
"
"		       p_user,
"
"		       p_lang,
"
"		       'GRN'
"
"		      );
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_can_insp_jrnl_frm_tqm - End');
"
"
"
"  END proc_can_insp_jrnl_frm_tqm;
"
"
"
"/******************************GRN INSPECTION CANCELLED JOURNALS*******************************************/
"
"  PROCEDURE proc_can_insp_jrnl_frm_grn(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				       p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				       p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND prod_bu = porl_bu
"
"         AND prod_id = porl_prod_id
"
"         AND prod_rev = porl_prod_rev
"
"         AND porh_bu = p_bu
"
"         AND porh_plnt = p_plnt
"
"         AND porh_receipt_pfx = p_vou_pfx
"
"         AND porh_receipt_no = p_vou_no
"
"         AND (porl_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND porh_type NOT IN ('SA')
"
"         AND porl_status NOT IN ('C')
"
"         AND prod_stocked = 'Y'
"
"	 AND porh_jrnl_flag = 'Y'
"
"	 AND porh_inspn_flag = 'Y'
"
"       ORDER BY porl_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER;
"
"    v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_fc_cost		NUMBER;
"
"    v_bc_cost		NUMBER;
"
"    v_disc_cost		NUMBER;
"
"    v_chrg_amt		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_suplr_cr_amt	NUMBER;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"    v_sub_plnt		VARCHAR2(10);
"
"    v_ge_no		VARCHAR2(15);
"
"    v_to_store_id	VARCHAR2(10);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_can_insp_jrnl_frm_grn - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_vou_date := SYSDATE;
"
"      v_vou_year := func_find_year(p_bu,v_vou_date);
"
"      v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"	IF cr1.porh_type = 'AT' THEN
"
"	  SELECT DISTINCT siln_ge_no
"
"	    INTO v_ge_no
"
"	    FROM sales_invoices_hd,sales_invoices_ln
"
"	   WHERE sihd_bu = siln_bu
"
"	     AND sihd_plant = siln_plnt
"
"	     AND sihd_doc_no = siln_doc_no
"
"	     AND sihd_bu = p_bu
"
"	     AND sihd_plant = p_plnt
"
"	     AND sihd_stk_trfr_grn_pfx = p_vou_pfx
"
"	     AND sihd_stk_trfr_grn_no = p_vou_no;
"
"
"
"
"
"	  SELECT gehd_to_store_id
"
"	    INTO v_to_store_id
"
"	    FROM gate_entry_hd
"
"	   WHERE gehd_bu = p_bu
"
"	     AND gehd_plnt = p_plnt
"
"	     AND gehd_doc_no = v_ge_no;
"
"
"
"	  /*SELECT sp_sub_plnt_id
"
"	    INTO v_sub_plnt
"
"	    FROM sub_plants,sub_plants_wh_asso
"
"	   WHERE sp_bu = spwa_bu
"
"	     AND sp_sub_plnt_id = spwa_sub_plnt_id
"
"	     AND sp_bu = p_bu
"
"	     AND sp_plnt_id = p_plnt
"
"	     AND spwa_store_id = v_to_store_id;*/
"
"
"
"	  /*SELECT suplr_sub_plnt
"
"	    INTO v_sub_plnt
"
"	    FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"	     AND suplr_suplr_id = cr1.porh_suplr_id;*/
"
"	ELSE
"
"	  v_sub_plnt := NULL;
"
"	END IF;
"
"
"
"        --v_rcpt_qty := (cr1.porl_temp_inv_qty/cr1.porl_conv_factor);
"
"	v_rcpt_qty := cr1.porl_stock_receipt_qty;
"
"
"
"	/*IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	    (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	   cr1.prod_cost_method = 'MAC' THEN
"
"	  v_unit_cost := func_find_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id);
"
"	ELSIF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"	       (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) AND
"
"	      cr1.prod_cost_method IN ('FIFO','LIFO') THEN
"
"          v_unit_cost := func_find_rcpt_batch_unitcost(p_bu,v_store_id,cr1.porl_prod_id,cr1.porl_prod_rev,
"
"	                                      cr1.porl_receipt_pfx,cr1.porl_receipt_no,cr1.porl_seq_no);
"
"	ELSE
"
"	  v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr1.porl_po_sys_ls_no);
"
"	END IF;*/
"
"
"
"      IF ((cr1.porh_mode = 'PR' AND cr1.porl_matl_type = 'PR') OR
"
"          (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR'))) THEN
"
"        v_unit_cost := ((((cr1.porl_sc_unit_cost + cr1.porl_bag_chrg_amt + cr1.porl_sc_chrg_amt - cr1.porl_sc_lm_disc_amt) -
"
"                          (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) * cr1.porh_exchange_rate) +
"
"			   cr1.porl_ap_lc_chrg_amt + cr1.porl_bc_land_cost -
"
"			  CASE WHEN cr1.porl_rebate_cost_type = 'N' THEN cr1.porl_rebate_unit_cost ELSE 0 END) * cr1.porl_conv_factor;
"
"      ELSE
"
"        v_unit_cost := (cr1.porl_scon_mat_unit_cost * cr1.porl_conv_factor) +
"
"	               ((cr1.porl_sc_chrg_amt * cr1.porh_exchange_rate * cr1.porl_conv_factor) +
"
"			cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost + cr1.porl_ap_lc_chrg_amt);
"
"      END IF;
"
"
"
"        v_upd_ref1 := SUBSTR('GRN #('|| p_vou_pfx || '/' || p_vou_no || ') / ' || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.porl_seq_no||')/PO#('||cr1.porl_po_pfx||'/'||cr1.porl_po_no||'/'
"
"			       ||cr1.porl_po_seq_no||'/'||cr1.porl_po_sub_seq_no||')/'||func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),1,150);
"
"
"
"        IF cr1.porh_mode = 'PR' THEN
"
"
"
"          /*********************************Debit Journals********************************/
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_suplr_offset(p_bu,
"
"			         cr1.porh_suplr_id,
"
"			         cr1.porh_plnt,
"
"				 cr1.porh_plnt_loc_id,
"
"			         v_acct_plnt,
"
"			         v_acct_lvl1,
"
"			         v_acct_lvl2,
"
"			         v_acct_lvl3,
"
"			         v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"			         v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"			         v_acct,
"
"				 v_acct_plnt_loc
"
"			        );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          /*BEGIN
"
"            SELECT ROUND(SUM(ROUND(porptc_tc_amt * cr1.porh_exchange_rate,v_rnd)),v_rnd)
"
"              INTO v_suplr_cr_amt
"
"	      FROM por_prod_tax_charges,
"
"	           tax_charges,
"
"	           tax_charges_types
"
"	     WHERE porptc_bu = p_bu
"
"	       AND porptc_receipt_pfx = p_vou_pfx
"
"	       AND porptc_receipt_no = p_vou_no
"
"	       AND porptc_receipt_seq_no = cr1.porl_seq_no
"
"	       AND porptc_type = 'R'
"
"	       AND porptc_bu = tc_bu
"
"	       AND porptc_tc_id = tc_tc_id
"
"	       AND tc_bu = tctype_bu
"
"	       AND tc_type_id = tctype_id
"
"	       AND porptc_vat_flag = 'Y' --Non-Charge
"
"	       AND porptc_sl_type <> 'E'
"
"	       AND porptc_pvsnl_flag = 'N';
"
"	  EXCEPTION
"
"	    WHEN OTHERS THEN
"
"	    NULL;
"
"	  END;*/
"
"
"
"          IF cr1.porl_net_disc_flag = 'Y' THEN
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt + v_suplr_cr_amt) - v_disc_cost;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  ROUND(v_fc_cost + v_suplr_cr_amt,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  0,
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  NULL,--cr1.porh_suplr_id,
"
"	                  NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"          ELSE
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt + v_suplr_cr_amt) - v_disc_cost;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  ROUND(v_fc_cost,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  0,
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  NULL,--cr1.porh_suplr_id,
"
"	                  NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"            IF v_disc_cost > 0 THEN
"
"
"
"              DBMS_OUTPUT.PUT_LINE('Discount Journals - Start');
"
"
"
"              proc_find_store_gl_accts(p_bu,
"
"                                       cr1.porh_plnt,
"
"				       cr1.porh_plnt_loc_id,
"
"                                       'DI',
"
"                                       v_store_id,
"
"                                       cr1.porh_terr_id,
"
"                                       cr1.porl_cls_id,
"
"                                       cr1.porl_sub_cls_id,
"
"                                       cr1.porl_tcf_id,
"
"                                       v_acct_plnt,
"
"				       v_acct_plnt_loc,
"
"                                       v_acct_lvl1,
"
"                                       v_acct_lvl2,
"
"                                       v_acct_lvl3,
"
"                                       v_acct_lvl4,
"
"				       v_acct_lvl5,
"
"				       v_acct_lvl6,
"
"                                       v_acct_lvl_prj,
"
"				       v_acct_cc_code,
"
"                                       v_acct,
"
"				       p_sub_plnt => v_sub_plnt
"
"                                      );
"
"
"
"	      v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"	                                                  v_acct_lvl1,
"
"	                                                  v_acct_lvl2,
"
"	                                                  v_acct_lvl3,
"
"	                                                  v_acct_lvl4,
"
"	                                                  v_acct_lvl_prj,
"
"	                                                  v_acct,
"
"	                                                  v_acct_plnt,
"
"	                                                  p_lang
"
"	                                                 );
"
"              proc_ins_jrnl(p_bu,
"
"	                    v_jrnl_trans_no,
"
"	                    cr1.porh_plnt,
"
"	                    'GRNP',
"
"			    cr1.porh_type,
"
"	                    cr1.porh_receipt_pfx,
"
"	                    cr1.porl_receipt_no,
"
"	                    cr1.porl_seq_no,
"
"	                    cr1.porl_prod_id,
"
"	                    cr1.porl_prod_rev,
"
"	                    cr1.porl_prod_desc1,
"
"	                    v_acct_plnt,
"
"			    cr1.porh_plnt_loc_id,
"
"	                    v_acct_lvl1,
"
"	                    v_acct_lvl2,
"
"	                    v_acct_lvl3,
"
"	                    v_acct_lvl4,
"
"			    v_acct_lvl5,
"
"			    v_acct_lvl6,
"
"	                    v_acct_lvl_prj,
"
"			    v_acct_cc_code,
"
"	                    v_acct,
"
"	                    v_acct_desc,
"
"	                    v_vou_date,
"
"	                    v_vou_year,
"
"	                    v_vou_period,
"
"	                    ROUND(v_disc_cost,v_rnd),
"
"	                    0,
"
"	                    ROUND(v_disc_cost,v_rnd),
"
"	                    0,
"
"	                    v_store_id,
"
"	                    v_store_desc,
"
"	                    v_dept_id,
"
"	                    v_dept_desc,
"
"	                    v_rcpt_qty,
"
"	                    v_disc_cost/v_rcpt_qty,
"
"	                    'GRN',
"
"	                    'POM',
"
"	                    v_upd_ref1,
"
"	                    v_upd_ref2,
"
"	                    NULL,--cr1.porh_suplr_id,
"
"	                    NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                    NULL,
"
"	                    NULL,
"
"	                    cr1.porl_cls_id,
"
"	                    func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"	                    cr1.porl_sub_cls_id,
"
"	                    func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                    p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"	                   );
"
"              DBMS_OUTPUT.PUT_LINE('Discount Journals - End');
"
"            END IF;
"
"
"
"          END IF;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          IF cr1.porl_status = 'N' AND (cr1.porl_qc_doc_pfx IS NOT NULL AND cr1.porl_qc_doc_no IS NOT NULL) THEN
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'I');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          ELSE
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'P');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          END IF;
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.porh_plnt,cr1.porh_plnt_loc_id,
"
"                                   CASE WHEN cr1.prod_stocked = 'N' THEN 'DT' ELSE 'ST' END,
"
"                                   v_store_id,
"
"                                   cr1.porh_terr_id,
"
"                                   cr1.porl_cls_id,
"
"                                   cr1.porl_sub_cls_id,
"
"                                   cr1.porl_tcf_id,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct,
"
"				   p_sub_plnt => v_sub_plnt
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          IF cr1.porl_net_disc_flag = 'Y' THEN
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt) - v_disc_cost ;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          'GRNP',
"
"			  cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          0,
"
"                          ROUND(v_fc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          (((cr1.porl_sc_unit_cost - (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) + cr1.porl_sc_chrg_amt) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"          ELSE
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt);
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          'GRNP',
"
"			  cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          0,
"
"                          ROUND(v_fc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          ((cr1.porl_sc_unit_cost + cr1.porl_sc_chrg_amt) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"          END IF;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Tax Journals - Start');
"
"
"
"          /*FOR tax_cr IN (SELECT *
"
"                           FROM por_prod_tax_charges,
"
"                                tax_charges,
"
"                                tax_charges_types
"
"                          WHERE porptc_bu = p_bu
"
"                            AND porptc_receipt_pfx = p_vou_pfx
"
"                            AND porptc_receipt_no = p_vou_no
"
"                            AND porptc_receipt_seq_no = cr1.porl_seq_no
"
"                            AND porptc_type = 'R'
"
"                            AND porptc_bu = tc_bu
"
"                            AND porptc_tc_id = tc_tc_id
"
"                            AND tc_bu = tctype_bu
"
"                            AND tc_type_id = tctype_id
"
"                            AND porptc_vat_flag = 'Y' --Non-Charge
"
"                            AND porptc_pvsnl_flag = 'N'
"
"			    AND porptc_sl_type <> 'E'
"
"                          ORDER BY porptc_print_seq_no)
"
"          LOOP
"
"            IF  tax_cr.tctype_type_id NOT IN ('SRVT','CSRVT','SSRVT','KSRVT','SBSRVT') THEN
"
"              IF tax_cr.tc_pnl_r_lbty = 'L' OR (cr1.porh_ins_pay_flag = 'C' AND tax_cr.tc_type_id = 'INS') THEN
"
"                v_tax_suplr_desc := func_find_party_name(p_bu,tax_cr.tc_suplr_id,p_lang);
"
"              ELSIF tax_cr.tc_pnl_r_lbty = 'E' THEN
"
"                IF tax_cr.tc_charge_flag = 'R' THEN
"
"                  v_chrg_type := 'PNR';
"
"                ELSE
"
"                  IF tax_cr.porptc_vat_flag = 'Y' THEN
"
"                    v_chrg_type := 'PR';
"
"                  ELSE
"
"                    v_chrg_type := 'PNR';
"
"                  END IF;
"
"                END IF;
"
"                proc_find_tax_acct(p_bu,
"
"				   cr1.porh_plnt,
"
"				   NULL,--'PR',
"
"				   tax_cr.tc_tc_id,
"
"				   cr1.porl_sub_cls_id,
"
"				   cr1.porl_cls_id,
"
"				   tax_cr.porptc_tc_pct,
"
"				   v_chrg_type,
"
"				   cr1.porl_tcf_id,
"
"				   cr1.porl_dept_id,
"
"				   cr1.porl_proj_id,
"
"				   v_acct_plnt,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct,
"
"				   v_acct_cc_code,
"
"				   v_acct_plnt_loc,
"
"				   v_exp_share_pct,
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"			       p_loc_id => cr1.porh_plnt_loc_id
"
"				  );
"
"
"
"                v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"		                                            v_acct_lvl1,
"
"		                                            v_acct_lvl2,
"
"		                                            v_acct_lvl3,
"
"		                                            v_acct_lvl4,
"
"		                                            v_acct_lvl_prj,
"
"		                                            v_acct,
"
"		                                            v_acct_plnt,
"
"		                                            p_lang
"
"		                                           );
"
"              END IF;
"
"
"
"              IF cr1.porh_ins_pay_flag = 'C' AND tax_cr.tc_type_id = 'INS' THEN
"
"
"
"                proc_ins_jrnl(p_bu,
"
"		              v_jrnl_trans_no,
"
"		              cr1.porh_plnt,
"
"		              'GRNP',
"
"		              cr1.porh_receipt_pfx,
"
"		              cr1.porl_receipt_no,
"
"		              cr1.porl_seq_no,
"
"		              cr1.porl_prod_id,
"
"		              cr1.porl_prod_rev,
"
"		              cr1.porl_prod_desc1,
"
"		              v_acct_plnt,
"
"			      cr1.porh_plnt_loc_id,
"
"		              v_acct_lvl1,
"
"		              v_acct_lvl2,
"
"		              v_acct_lvl3,
"
"		              v_acct_lvl4,
"
"			      v_acct_lvl5,
"
"			      v_acct_lvl6,
"
"		              v_acct_lvl_prj,
"
"			      v_acct_cc_code,
"
"		              v_acct,
"
"		              v_acct_desc,
"
"		              v_vou_date,
"
"		              v_vou_year,
"
"		              v_vou_period,
"
"		              0,
"
"		              ROUND(tax_cr.porptc_tc_amt,v_rnd),
"
"		              0,
"
"		              ROUND(tax_cr.porptc_tc_amt * cr1.porh_exchange_rate,v_rnd),
"
"		              v_store_id,
"
"		              v_store_desc,
"
"		              v_dept_id,
"
"		              v_dept_desc,
"
"		              v_rcpt_qty,
"
"		              ((tax_cr.porptc_tc_amt/v_rcpt_qty) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"		              'GRN',
"
"		              'POM',
"
"		              v_upd_ref1,
"
"		              v_upd_ref2,
"
"		              NULL,--cr1.porh_suplr_id,
"
"		              NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		              tax_cr.tc_tc_id,
"
"		              tax_cr.tc_desc1,
"
"		              cr1.porl_cls_id,
"
"		              func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		              cr1.porl_sub_cls_id,
"
"		              func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		              p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		             );
"
"
"
"              ELSE
"
"
"
"	          proc_ins_jrnl(p_bu,
"
"		  		v_jrnl_trans_no,
"
"		  		cr1.porh_plnt,
"
"		  		'GRNP',
"
"		  		cr1.porh_receipt_pfx,
"
"		  		cr1.porl_receipt_no,
"
"		  		cr1.porl_seq_no,
"
"		  		cr1.porl_prod_id,
"
"		  		cr1.porl_prod_rev,
"
"		  		cr1.porl_prod_desc1,
"
"		  		v_acct_plnt,
"
"				cr1.porh_plnt_loc_id,
"
"		  		v_acct_lvl1,
"
"		  		v_acct_lvl2,
"
"		  		v_acct_lvl3,
"
"		  		v_acct_lvl4,
"
"				v_acct_lvl5,
"
"				v_acct_lvl6,
"
"		  		v_acct_lvl_prj,
"
"				v_acct_cc_code,
"
"		  		v_acct,
"
"		  		v_acct_desc,
"
"		  		v_vou_date,
"
"		  		v_vou_year,
"
"		  		v_vou_period,
"
"		  		0,
"
"		  		ROUND((tax_cr.porptc_tc_amt) ,v_rnd),
"
"		  		0,
"
"		  		ROUND((tax_cr.porptc_tc_amt * cr1.porh_exchange_rate) ,v_rnd),
"
"		  		v_store_id,
"
"		  		v_store_desc,
"
"		  		v_dept_id,
"
"		  		v_dept_desc,
"
"		  		v_rcpt_qty,
"
"		  		((tax_cr.porptc_tc_amt/v_rcpt_qty) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"		  		'GRN',
"
"		  		'POM',
"
"		  		v_upd_ref1,
"
"		  		v_upd_ref2,
"
"		  		NULL,--cr1.porh_suplr_id,
"
"		  		NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		  		tax_cr.tc_tc_id,
"
"		  		tax_cr.tc_desc1,
"
"		  		cr1.porl_cls_id,
"
"		  		func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		  		cr1.porl_sub_cls_id,
"
"		  		func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		  		p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type
"
"		  	       );
"
"
"
"              END IF;
"
"
"
"            END IF;
"
"
"
"          END LOOP;*/
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Tax Journals - End');
"
"        END IF;
"
"
"
"      END LOOP;
"
"      proc_ins_gl_jrnl(p_bu,
"
"                       p_plnt,
"
"		       v_vou_date,
"
"		       v_vou_year,
"
"		       v_vou_period,
"
"		       p_vou_pfx,
"
"		       p_vou_no,
"
"		       NULL,
"
"		       'POM',
"
"		       p_user,
"
"		       p_lang,
"
"		       'GRN'
"
"		      );
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_can_insp_jrnl_frm_grn - End');
"
"
"
"  END proc_can_insp_jrnl_frm_grn;
"
"
"
"/******************************GRN CANCELLED JOURNALS*******************************************/
"
"  PROCEDURE proc_can_rcpt_jrnl_frm_grn(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				       p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				       p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND prod_bu = porl_bu
"
"         AND prod_id = porl_prod_id
"
"         AND prod_rev = porl_prod_rev
"
"         AND porh_bu = p_bu
"
"         AND porh_plnt = p_plnt
"
"         AND porh_receipt_pfx = p_vou_pfx
"
"         AND porh_receipt_no = p_vou_no
"
"         AND (porl_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND porh_type NOT IN ('SA')
"
"         AND porl_matl_type = 'PR'
"
"         AND porl_status = 'R'
"
"         AND prod_stocked = 'Y'
"
"       ORDER BY porl_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"	v_vou_date		DATE;
"
"	v_vou_year		NUMBER;
"
"	v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_acpt_qty		NUMBER;
"
"    v_rej_qty		NUMBER;
"
"    v_aod_qty		NUMBER;
"
"
"
"    v_fc_cost		NUMBER;
"
"    v_bc_cost		NUMBER;
"
"    v_disc_cost		NUMBER;
"
"    v_chrg_amt		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_suplr_cr_amt	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"    v_sub_plnt		VARCHAR2(10);
"
"    v_ge_no		VARCHAR2(15);
"
"    v_to_store_id	VARCHAR2(10);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_can_rcpt_jrnl_frm_grn - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"	  v_vou_date := SYSDATE;
"
"	  v_vou_year := func_find_year(p_bu,v_vou_date);
"
"	  v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"	IF cr1.porh_type = 'AT' THEN
"
"	  SELECT DISTINCT siln_ge_no
"
"	    INTO v_ge_no
"
"	    FROM sales_invoices_hd,sales_invoices_ln
"
"	   WHERE sihd_bu = siln_bu
"
"	     AND sihd_plant = siln_plnt
"
"	     AND sihd_doc_no = siln_doc_no
"
"	     AND sihd_bu = p_bu
"
"	     AND sihd_plant = p_plnt
"
"	     AND sihd_stk_trfr_grn_pfx = p_vou_pfx
"
"	     AND sihd_stk_trfr_grn_no = p_vou_no;
"
"
"
"
"
"	  SELECT gehd_to_store_id
"
"	    INTO v_to_store_id
"
"	    FROM gate_entry_hd
"
"	   WHERE gehd_bu = p_bu
"
"	     AND gehd_plnt = p_plnt
"
"	     AND gehd_doc_no = v_ge_no;
"
"
"
"	  /*SELECT sp_sub_plnt_id
"
"	    INTO v_sub_plnt
"
"	    FROM sub_plants,sub_plants_wh_asso
"
"	   WHERE sp_bu = spwa_bu
"
"	     AND sp_sub_plnt_id = spwa_sub_plnt_id
"
"	     AND sp_bu = p_bu
"
"	     AND sp_plnt_id = p_plnt
"
"	     AND spwa_store_id = v_to_store_id;*/
"
"
"
"	  /*SELECT suplr_sub_plnt
"
"	    INTO v_sub_plnt
"
"	    FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"	     AND suplr_suplr_id = cr1.porh_suplr_id;*/
"
"	ELSE
"
"	  v_sub_plnt := NULL;
"
"	END IF;
"
"
"
"        /*v_rcpt_qty := (cr1.porl_accepted_qty + cr1.porl_rejected_qty + cr1.porl_aod_qty/cr1.porl_conv_factor);
"
"        v_acpt_qty := (cr1.porl_accepted_qty/cr1.porl_conv_factor);
"
"        v_rej_qty := (cr1.porl_rejected_qty/cr1.porl_conv_factor);
"
"        v_aod_qty := (cr1.porl_rejected_qty/cr1.porl_conv_factor);*/
"
"
"
"        v_rcpt_qty := cr1.porl_stock_receipt_qty;
"
"        v_acpt_qty := cr1.porl_stk_accepted_qty;
"
"        v_rej_qty := cr1.porl_stk_rejected_qty;
"
"        v_aod_qty := cr1.porl_stk_aod_qty;
"
"
"
"        IF cr1.porh_type = 'ST' AND cr1.porh_mode = 'PR' THEN
"
"          v_upd_ref2 := 'GRN#(';
"
"        ELSIF cr1.porh_type = 'ST' AND cr1.porh_mode = 'SC' THEN
"
"          v_upd_ref2 := 'SRN#(';
"
"        ELSIF cr1.porh_type = 'RR' THEN
"
"          v_upd_ref2 := 'Replacement GRN#(';
"
"        ELSIF cr1.porh_type  = 'TS' THEN
"
"          v_upd_ref2 := 'Transfer GRN#(';
"
"        ELSIF cr1.porh_type = 'RW' THEN
"
"          v_upd_ref2 := 'Rework SRN#(';
"
"        ELSIF cr1.porh_type = 'SV' THEN
"
"          v_upd_ref2 := 'Value Add. SRN#(';
"
"        ELSIF cr1.porh_type = 'DF' THEN
"
"          v_upd_ref2 := 'Defect SRN#(';
"
"        END IF;
"
"
"
"        v_upd_ref1 := SUBSTR('GRN #('|| p_vou_pfx || '/' || p_vou_no || ') / ' || func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang), 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.porl_seq_no||')/PO#('||cr1.porl_po_pfx||'/'||cr1.porl_po_no||'/'
"
"			       ||cr1.porl_po_seq_no||'/'||cr1.porl_po_sub_seq_no||')/'||func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),1,150);
"
"
"
"        IF cr1.porh_mode = 'PR' THEN
"
"
"
"          /*********************************Debit Journals********************************/
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_suplr_offset(p_bu,
"
"			         cr1.porh_suplr_id,
"
"			         cr1.porh_plnt,cr1.porh_plnt_loc_id,
"
"			         v_acct_plnt,
"
"			         v_acct_lvl1,
"
"			         v_acct_lvl2,
"
"			         v_acct_lvl3,
"
"			         v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"			         v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"			         v_acct,
"
"				 v_acct_plnt_loc
"
"			        );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          /*BEGIN
"
"            SELECT ROUND(SUM(ROUND(porptc_tc_amt * cr1.porh_exchange_rate,v_rnd)),v_rnd)
"
"              INTO v_suplr_cr_amt
"
"	      FROM por_prod_tax_charges,
"
"	           tax_charges,
"
"	           tax_charges_types
"
"	     WHERE porptc_bu = p_bu
"
"	       AND porptc_receipt_pfx = p_vou_pfx
"
"	       AND porptc_receipt_no = p_vou_no
"
"	       AND porptc_receipt_seq_no = cr1.porl_seq_no
"
"	       AND porptc_type = 'R'
"
"	       AND porptc_bu = tc_bu
"
"	       AND porptc_tc_id = tc_tc_id
"
"	       AND tc_bu = tctype_bu
"
"	       AND tc_type_id = tctype_id
"
"	       AND porptc_vat_flag = 'Y' --Non-Charge
"
"	       AND porptc_sl_type <> 'E'
"
"	       AND porptc_pvsnl_flag = 'N';
"
"	  EXCEPTION
"
"	    WHEN OTHERS THEN
"
"	    NULL;
"
"	  END;*/
"
"
"
"          IF cr1.porl_net_disc_flag = 'Y' THEN
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt + v_suplr_cr_amt) - v_disc_cost;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  ROUND(v_fc_cost + v_suplr_cr_amt,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  0,
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"          ELSE
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt + v_suplr_cr_amt) - v_disc_cost;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"	                  v_jrnl_trans_no,
"
"	                  cr1.porh_plnt,
"
"	                  'GRNP',
"
"			  cr1.porh_type,
"
"	                  cr1.porh_receipt_pfx,
"
"	                  cr1.porl_receipt_no,
"
"	                  cr1.porl_seq_no,
"
"	                  cr1.porl_prod_id,
"
"	                  cr1.porl_prod_rev,
"
"	                  cr1.porl_prod_desc1,
"
"	                  v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"	                  v_acct_lvl1,
"
"	                  v_acct_lvl2,
"
"	                  v_acct_lvl3,
"
"	                  v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"	                  v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"	                  v_acct,
"
"	                  v_acct_desc,
"
"	                  v_vou_date,
"
"	                  v_vou_year,
"
"	                  v_vou_period,
"
"	                  ROUND(v_fc_cost,v_rnd),
"
"	                  0,
"
"	                  ROUND(v_bc_disc_cost,v_rnd),
"
"	                  0,
"
"	                  v_store_id,
"
"	                  v_store_desc,
"
"	                  v_dept_id,
"
"	                  v_dept_desc,
"
"	                  v_rcpt_qty,
"
"	                  v_bc_disc_cost / v_rcpt_qty,
"
"	                  'GRN',
"
"	                  'POM',
"
"	                  v_upd_ref1,
"
"	                  v_upd_ref2,
"
"	                  cr1.porh_suplr_id,
"
"	                  func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                  NULL,
"
"	                  NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                  p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"            IF v_disc_cost > 0 THEN
"
"
"
"              DBMS_OUTPUT.PUT_LINE('Discount Journals - Start');
"
"
"
"              proc_find_store_gl_accts(p_bu,
"
"                                       cr1.porh_plnt,cr1.porh_plnt_loc_id,
"
"                                       'DI',
"
"                                       v_store_id,
"
"                                       cr1.porh_terr_id,
"
"                                       cr1.porl_cls_id,
"
"                                       cr1.porl_sub_cls_id,
"
"                                       cr1.porl_tcf_id,
"
"                                       v_acct_plnt,v_acct_plnt_loc,
"
"                                       v_acct_lvl1,
"
"                                       v_acct_lvl2,
"
"                                       v_acct_lvl3,
"
"                                       v_acct_lvl4,
"
"				       v_acct_lvl5,
"
"				       v_acct_lvl6,
"
"                                       v_acct_lvl_prj,
"
"				       v_acct_cc_code,
"
"                                       v_acct,
"
"				       p_sub_plnt => v_sub_plnt
"
"                                      );
"
"
"
"	      v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"	                                                  v_acct_lvl1,
"
"	                                                  v_acct_lvl2,
"
"	                                                  v_acct_lvl3,
"
"	                                                  v_acct_lvl4,
"
"	                                                  v_acct_lvl_prj,
"
"	                                                  v_acct,
"
"	                                                  v_acct_plnt,
"
"	                                                  p_lang
"
"	                                                 );
"
"              proc_ins_jrnl(p_bu,
"
"	                    v_jrnl_trans_no,
"
"	                    cr1.porh_plnt,
"
"	                    'GRNP',
"
"			    cr1.porh_type,
"
"	                    cr1.porh_receipt_pfx,
"
"	                    cr1.porl_receipt_no,
"
"	                    cr1.porl_seq_no,
"
"	                    cr1.porl_prod_id,
"
"	                    cr1.porl_prod_rev,
"
"	                    cr1.porl_prod_desc1,
"
"	                    v_acct_plnt,
"
"			    cr1.porh_plnt_loc_id,
"
"	                    v_acct_lvl1,
"
"	                    v_acct_lvl2,
"
"	                    v_acct_lvl3,
"
"	                    v_acct_lvl4,
"
"			    v_acct_lvl5,
"
"			    v_acct_lvl6,
"
"	                    v_acct_lvl_prj,
"
"			    v_acct_cc_code,
"
"	                    v_acct,
"
"	                    v_acct_desc,
"
"	                    v_vou_date,
"
"	                    v_vou_year,
"
"	                    v_vou_period,
"
"	                    ROUND(v_disc_cost,v_rnd),
"
"	                    0,
"
"	                    ROUND(v_disc_cost,v_rnd),
"
"	                    0,
"
"	                    v_store_id,
"
"	                    v_store_desc,
"
"	                    v_dept_id,
"
"	                    v_dept_desc,
"
"	                    v_rcpt_qty,
"
"	                    v_disc_cost/v_rcpt_qty,
"
"	                    'GRN',
"
"	                    'POM',
"
"	                    v_upd_ref1,
"
"	                    v_upd_ref2,
"
"	                    NULL,--cr1.porh_suplr_id,
"
"	                    NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"	                    NULL,
"
"	                    NULL,
"
"	                    cr1.porl_cls_id,
"
"	                    func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"	                    cr1.porl_sub_cls_id,
"
"	                    func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"	                    p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"	                   );
"
"              DBMS_OUTPUT.PUT_LINE('Discount Journals - End');
"
"            END IF;
"
"
"
"          END IF;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          IF cr1.porl_accepted_qty > 0 THEN
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Accepted Qty. Journals');
"
"
"
"            v_fc_cost := (cr1.porl_sc_unit_cost * cr1.porl_conv_factor) * v_acpt_qty;
"
"            v_bc_cost := v_fc_cost * cr1.porh_exchange_rate;
"
"            v_disc_cost := v_bc_cost * (cr1.porl_disc_pct / 100);
"
"            v_chrg_amt := (cr1.porl_sc_chrg_amt * v_acpt_qty) * cr1.porh_exchange_rate;
"
"
"
"            v_store_id := cr1.porl_storage_store_id;
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,cr1.porh_plnt_loc_id,
"
"                                     'ST',
"
"                                     v_store_id,
"
"                                     cr1.porh_terr_id,
"
"                                     cr1.porl_cls_id,
"
"                                     cr1.porl_sub_cls_id,
"
"                                     cr1.porl_tcf_id,
"
"                                     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"                                     v_acct_lvl1,
"
"                                     v_acct_lvl2,
"
"                                     v_acct_lvl3,
"
"                                     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"                                     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"                                     v_acct,
"
"				     p_sub_plnt => v_sub_plnt
"
"                                    );
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                        v_acct_lvl1,
"
"                                                        v_acct_lvl2,
"
"                                                        v_acct_lvl3,
"
"                                                        v_acct_lvl4,
"
"                                                        v_acct_lvl_prj,
"
"                                                        v_acct,
"
"                                                        v_acct_plnt,
"
"                                                        p_lang
"
"                                                       );
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt) - v_disc_cost ;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          'GRN',
"
"			  cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          0,
"
"                          ROUND(v_fc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_acpt_qty,
"
"                          (((cr1.porl_sc_unit_cost - (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) + cr1.porl_sc_chrg_amt) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"          END IF;
"
"
"
"          IF cr1.porl_rejected_qty > 0 THEN
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Rejected Qty. Journals');
"
"
"
"            v_fc_cost := (cr1.porl_sc_unit_cost * cr1.porl_conv_factor) * v_rej_qty;
"
"            v_bc_cost := v_fc_cost * cr1.porh_exchange_rate;
"
"            v_disc_cost := v_bc_cost * (cr1.porl_disc_pct / 100);
"
"            v_chrg_amt := (cr1.porl_sc_chrg_amt * v_rej_qty) * cr1.porh_exchange_rate;
"
"
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'J');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"                                     'ST',
"
"                                     v_store_id,
"
"                                     cr1.porh_terr_id,
"
"                                     cr1.porl_cls_id,
"
"                                     cr1.porl_sub_cls_id,
"
"                                     cr1.porl_tcf_id,
"
"                                     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"                                     v_acct_lvl1,
"
"                                     v_acct_lvl2,
"
"                                     v_acct_lvl3,
"
"                                     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"                                     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"                                     v_acct,
"
"				     p_sub_plnt => v_sub_plnt
"
"                                    );
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                        v_acct_lvl1,
"
"                                                        v_acct_lvl2,
"
"                                                        v_acct_lvl3,
"
"                                                        v_acct_lvl4,
"
"                                                        v_acct_lvl_prj,
"
"                                                        v_acct,
"
"                                                        v_acct_plnt,
"
"                                                        p_lang
"
"                                                       );
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt) - v_disc_cost ;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          'GRN',
"
"			  cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          0,
"
"                          ROUND(v_fc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rej_qty,
"
"                          (((cr1.porl_sc_unit_cost - (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) + cr1.porl_sc_chrg_amt) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"          END IF;
"
"
"
"          IF cr1.porl_aod_qty > 0 THEN
"
"
"
"            DBMS_OUTPUT.PUT_LINE('AOD Qty. Journals');
"
"
"
"            v_fc_cost := (cr1.porl_sc_unit_cost * cr1.porl_conv_factor) * v_aod_qty;
"
"            v_bc_cost := v_fc_cost * cr1.porh_exchange_rate;
"
"            v_disc_cost := v_bc_cost * (cr1.porl_disc_pct / 100);
"
"            v_chrg_amt := (cr1.porl_sc_chrg_amt * v_aod_qty) * cr1.porh_exchange_rate;
"
"
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'A');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.porh_plnt,cr1.porh_plnt_loc_id,
"
"                                     'ST',
"
"                                     v_store_id,
"
"                                     cr1.porh_terr_id,
"
"                                     cr1.porl_cls_id,
"
"                                     cr1.porl_sub_cls_id,
"
"                                     cr1.porl_tcf_id,
"
"                                     v_acct_plnt,v_acct_plnt_loc,
"
"                                     v_acct_lvl1,
"
"                                     v_acct_lvl2,
"
"                                     v_acct_lvl3,
"
"                                     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"                                     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"                                     v_acct,
"
"				     p_sub_plnt => v_sub_plnt
"
"                                    );
"
"
"
"            v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                        v_acct_lvl1,
"
"                                                        v_acct_lvl2,
"
"                                                        v_acct_lvl3,
"
"                                                        v_acct_lvl4,
"
"                                                        v_acct_lvl_prj,
"
"                                                        v_acct,
"
"                                                        v_acct_plnt,
"
"                                                        p_lang
"
"                                                       );
"
"
"
"            v_bc_disc_cost := (v_bc_cost + v_chrg_amt) - v_disc_cost;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.porh_plnt,
"
"                          'GRN',
"
"			  cr1.porh_type,
"
"                          cr1.porh_receipt_pfx,
"
"                          cr1.porl_receipt_no,
"
"                          cr1.porl_seq_no,
"
"                          cr1.porl_prod_id,
"
"                          cr1.porl_prod_rev,
"
"                          cr1.porl_prod_desc1,
"
"                          v_acct_plnt,cr1.porh_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          0,
"
"                          ROUND(v_fc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_aod_qty,
"
"                          (((cr1.porl_sc_unit_cost - (cr1.porl_sc_unit_cost * (cr1.porl_disc_pct / 100))) + cr1.porl_sc_chrg_amt) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"                          'GRN',
"
"                          'POM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,--cr1.porh_suplr_id,
"
"                          NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.porl_cls_id,
"
"                          func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"                          cr1.porl_sub_cls_id,
"
"                          func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"                          p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"                         );
"
"
"
"          END IF;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Tax Journals - Start');
"
"
"
"          /*FOR tax_cr IN (SELECT *
"
"                           FROM por_prod_tax_charges,
"
"                                tax_charges,
"
"                                tax_charges_types
"
"                          WHERE porptc_bu = p_bu
"
"                            AND porptc_receipt_pfx = p_vou_pfx
"
"                            AND porptc_receipt_no = p_vou_no
"
"                            AND porptc_receipt_seq_no = cr1.porl_seq_no
"
"                            AND porptc_type = 'R'
"
"                            AND porptc_bu = tc_bu
"
"                            AND porptc_tc_id = tc_tc_id
"
"                            AND tc_bu = tctype_bu
"
"                            AND tc_type_id = tctype_id
"
"                            AND porptc_vat_flag = 'Y' --Non-Charge
"
"                            AND porptc_pvsnl_flag = 'N'
"
"			    AND porptc_sl_type <> 'E'
"
"                          ORDER BY porptc_print_seq_no)
"
"          LOOP
"
"            IF  tax_cr.tctype_type_id NOT IN ('SRVT','CSRVT','SSRVT','KSRVT','SBSRVT') THEN
"
"              IF tax_cr.tc_pnl_r_lbty = 'L' OR (cr1.porh_ins_pay_flag = 'C' AND tax_cr.tc_type_id = 'INS') THEN
"
"                v_tax_suplr_desc := func_find_party_name(p_bu,tax_cr.tc_suplr_id,p_lang);
"
"              ELSIF tax_cr.tc_pnl_r_lbty = 'E' THEN
"
"                IF tax_cr.tc_charge_flag = 'R' THEN
"
"                  v_chrg_type := 'PNR';
"
"                ELSE
"
"                  IF tax_cr.porptc_vat_flag = 'Y' THEN
"
"                    v_chrg_type := 'PR';
"
"                  ELSE
"
"                    v_chrg_type := 'PNR';
"
"                  END IF;
"
"                END IF;
"
"                proc_find_tax_acct(p_bu,
"
"				   cr1.porh_plnt,
"
"				   NULL,--'PR',
"
"				   tax_cr.tc_tc_id,
"
"				   cr1.porl_sub_cls_id,
"
"				   cr1.porl_cls_id,
"
"				   tax_cr.porptc_tc_pct,
"
"				   v_chrg_type,
"
"				   cr1.porl_tcf_id,
"
"				   cr1.porl_dept_id,
"
"				   cr1.porl_proj_id,
"
"				   v_acct_plnt,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct,
"
"				   v_acct_cc_code,
"
"				   v_acct_plnt_loc,
"
"				   v_exp_share_pct,
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       func_find_hsnsac_type(p_bu,cr1.porl_hsn_code),
"
"			       cr1.porh_plnt_loc_id
"
"				  );
"
"
"
"                v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"		                                            v_acct_lvl1,
"
"		                                            v_acct_lvl2,
"
"		                                            v_acct_lvl3,
"
"		                                            v_acct_lvl4,
"
"		                                            v_acct_lvl_prj,
"
"		                                            v_acct,
"
"		                                            v_acct_plnt,
"
"		                                            p_lang
"
"		                                           );
"
"              END IF;
"
"
"
"              IF cr1.porh_ins_pay_flag = 'C' AND tax_cr.tc_type_id = 'INS' THEN
"
"
"
"                proc_ins_jrnl(p_bu,
"
"		              v_jrnl_trans_no,
"
"		              cr1.porh_plnt,
"
"		              'GRNP',
"
"		              cr1.porh_receipt_pfx,
"
"		              cr1.porl_receipt_no,
"
"		              cr1.porl_seq_no,
"
"		              cr1.porl_prod_id,
"
"		              cr1.porl_prod_rev,
"
"		              cr1.porl_prod_desc1,
"
"		              v_acct_plnt,
"
"			      cr1.porh_plnt_loc_id,
"
"		              v_acct_lvl1,
"
"		              v_acct_lvl2,
"
"		              v_acct_lvl3,
"
"		              v_acct_lvl4,
"
"			      v_acct_lvl5,
"
"			      v_acct_lvl6,
"
"		              v_acct_lvl_prj,
"
"			      v_acct_cc_code,
"
"		              v_acct,
"
"		              v_acct_desc,
"
"		              v_vou_date,
"
"		              v_vou_year,
"
"		              v_vou_period,
"
"		              0,
"
"		              ROUND(tax_cr.porptc_tc_amt,v_rnd),
"
"		              0,
"
"		              ROUND(tax_cr.porptc_tc_amt * cr1.porh_exchange_rate,v_rnd),
"
"		              v_store_id,
"
"		              v_store_desc,
"
"		              v_dept_id,
"
"		              v_dept_desc,
"
"		              v_rcpt_qty,
"
"		              ((tax_cr.porptc_tc_amt/v_rcpt_qty) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"		              'GRN',
"
"		              'POM',
"
"		              v_upd_ref1,
"
"		              v_upd_ref2,
"
"		              NULL,--cr1.porh_suplr_id,
"
"		              NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		              tax_cr.tc_tc_id,
"
"		              tax_cr.tc_desc1,
"
"		              cr1.porl_cls_id,
"
"		              func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		              cr1.porl_sub_cls_id,
"
"		              func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		              p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		             );
"
"
"
"              ELSE
"
"
"
"	          proc_ins_jrnl(p_bu,
"
"		  		v_jrnl_trans_no,
"
"		  		cr1.porh_plnt,
"
"		  		'GRNP',
"
"		  		cr1.porh_receipt_pfx,
"
"		  		cr1.porl_receipt_no,
"
"		  		cr1.porl_seq_no,
"
"		  		cr1.porl_prod_id,
"
"		  		cr1.porl_prod_rev,
"
"		  		cr1.porl_prod_desc1,
"
"		  		v_acct_plnt,
"
"				cr1.porh_plnt_loc_id,
"
"		  		v_acct_lvl1,
"
"		  		v_acct_lvl2,
"
"		  		v_acct_lvl3,
"
"		  		v_acct_lvl4,
"
"				v_acct_lvl5,
"
"				v_acct_lvl6,
"
"		  		v_acct_lvl_prj,
"
"				v_acct_cc_code,
"
"		  		v_acct,
"
"		  		v_acct_desc,
"
"		  		v_vou_date,
"
"		  		v_vou_year,
"
"		  		v_vou_period,
"
"		  		0,
"
"		  		ROUND((tax_cr.porptc_tc_amt) ,v_rnd),
"
"		  		0,
"
"		  		ROUND((tax_cr.porptc_tc_amt * cr1.porh_exchange_rate) ,v_rnd),
"
"		  		v_store_id,
"
"		  		v_store_desc,
"
"		  		v_dept_id,
"
"		  		v_dept_desc,
"
"		  		v_rcpt_qty,
"
"		  		((tax_cr.porptc_tc_amt/v_rcpt_qty) * cr1.porh_exchange_rate) * cr1.porl_conv_factor,
"
"		  		'GRN',
"
"		  		'POM',
"
"		  		v_upd_ref1,
"
"		  		v_upd_ref2,
"
"		  		NULL,--cr1.porh_suplr_id,
"
"		  		NULL,--func_find_party_name(p_bu,cr1.porh_suplr_id,p_lang),
"
"		  		tax_cr.tc_tc_id,
"
"		  		tax_cr.tc_desc1,
"
"		  		cr1.porl_cls_id,
"
"		  		func_find_class_desc(p_bu,cr1.porl_cls_id,p_lang),
"
"		  		cr1.porl_sub_cls_id,
"
"		  		func_find_subclass_desc(p_bu,cr1.porl_sub_cls_id,p_lang),
"
"		  		p_user,
"
"			  p_ref_no => cr1.porh_suplr_doc_no,
"
"			  p_ref_date => cr1.porh_suplr_doc_date,
"
"			  p_hsn_code => cr1.porl_hsn_code,
"
"			  p_gstin_no => cr1.porh_gstn_no,
"
"			  p_gst_type => cr1.porh_gst_type,
"
"			  p_grn_tc_type => 'R',
"
"			  p_gst_input_type => cr1.porl_gst_input_type,
"
"			  p_rcpt_type => cr1.porh_type
"
"		  	       );
"
"
"
"              END IF;
"
"
"
"            END IF;
"
"
"
"          END LOOP;*/
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Tax Journals - End');
"
"
"
"        END IF;
"
"
"
"      END LOOP;
"
"      proc_ins_gl_jrnl(p_bu,
"
"                       p_plnt,
"
"		       v_vou_date,
"
"		       v_vou_year,
"
"		       v_vou_period,
"
"		       p_vou_pfx,
"
"		       p_vou_no,
"
"		       NULL,
"
"		       'POM',
"
"		       p_user,
"
"		       p_lang,
"
"		       'GRN'
"
"		      );
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_can_rcpt_jrnl_frm_grn - End');
"
"
"
"  END proc_can_rcpt_jrnl_frm_grn;
"
"
"
"/* This procedure used to create journal of Material Return for Inward Transaction */
"
"
"
"  PROCEDURE proc_ins_inward_jrnl_frm_mr(p_bu			business_units.bu_id%TYPE,
"
"				        p_plnt			bus_unit_plants.bup_plant_id%TYPE,
"
"				        p_vou_no		store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				        p_vou_seq_no		store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				        p_user			VARCHAR2,
"
"				        p_lang			NUMBER,
"
"					p_post_jrnl_flag	VARCHAR2	DEFAULT 'Y'
"
"				       )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM store_stock_trans_hd_vw,store_stock_trans_ln_vw,products
"
"       WHERE ssthd_bu = sstln_bu
"
"         AND ssthd_doc_no = sstln_doc_no
"
"         AND prod_bu = sstln_bu
"
"         AND prod_id = sstln_prod_id
"
"         AND prod_rev = sstln_prod_rev
"
"         AND ssthd_bu = p_bu
"
"         AND ssthd_plnt = p_plnt
"
"         AND ssthd_doc_no = p_vou_no
"
"         AND (sstln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND ssthd_status <> 'C'
"
"         AND prod_stocked = 'Y'
"
"         AND prod_cust_spec_mat_flag = 'N'
"
"         AND ROUND((sstln_trans_qty * sstln_unit_cost),2) > 0
"
"       ORDER BY sstln_seq_no;
"
"
"
"    CURSOR c2(c_cap_asset_id VARCHAR2) IS
"
"      SELECT *
"
"        FROM fixed_assets
"
"       WHERE fa_bu = p_bu
"
"         AND fa_plnt = p_plnt
"
"         AND fa_asset_id = c_cap_asset_id
"
"         AND fa_tang_type = 'TW'
"
"         AND fa_asset_status = 'Y';
"
"
"
"    cr2			c2%ROWTYPE;
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_type		VARCHAR2(5);
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"    v_doc_date		DATE;
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_inward_jrnl_frm_mr - Begin');
"
"
"
"    IF ((func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y') OR
"
"        (func_get_inv_method(p_bu) = 'S' AND func_find_jrnl_rqrd(p_bu) = 'Y')) THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_rcpt_qty := (cr1.sstln_trans_qty/cr1.sstln_conv_factor);
"
"        v_bc_disc_cost := (cr1.sstln_unit_cost * cr1.sstln_conv_factor) * v_rcpt_qty;
"
"
"
"        v_upd_ref1 := SUBSTR('Mat. Rtn. #'|| p_vou_no, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR('Mat. Rtn. #('||p_vou_no
"
"    			       ||'/'||cr1.sstln_seq_no||')/MI#('||cr1.sstln_mi_doc_no||'/'||cr1.sstln_mi_seq_no||'/'
"
"			       ||cr1.sstln_mi_sub_seq_no||'/'||cr1.sstln_mi_doc_date||')/',1,150);
"
"
"
"          --IF cr1.sstln_qc_pfx IS NULL AND cr1.sstln_qc_no IS NULL THEN
"
"	    --v_store_id := cr1.ssthd_to_store_id;
"
"	  --ELSE
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q');
"
"	  --END IF;
"
"
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          v_vou_type := 'MRTN';
"
"
"
"          /*********************************Debit Journals********************************/
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct,
"
"                                   'I'
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"                        cr1.ssthd_plnt,
"
"                        v_vou_type,
"
"			v_vou_type,
"
"                        NULL,
"
"                        cr1.ssthd_doc_no,
"
"                        cr1.sstln_seq_no,
"
"                        cr1.sstln_prod_id,
"
"                        cr1.sstln_prod_rev,
"
"                        cr1.prod_desc11,
"
"                        v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"                        v_acct_lvl1,
"
"                        v_acct_lvl2,
"
"                        v_acct_lvl3,
"
"                        v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"                        v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"                        v_acct,
"
"                        v_acct_desc,
"
"                        cr1.ssthd_date, --SYSDATE,
"
"                        func_find_year(p_bu,cr1.ssthd_date),
"
"                        func_find_period(p_bu,cr1.ssthd_date),
"
"                        ROUND(v_bc_disc_cost,v_rnd),
"
"                        0,
"
"                        ROUND(v_bc_disc_cost,v_rnd),
"
"                        0,
"
"                        v_store_id,
"
"                        v_store_desc,
"
"                        v_dept_id,
"
"                        v_dept_desc,
"
"                        v_rcpt_qty,
"
"                        (cr1.sstln_unit_cost * cr1.sstln_conv_factor),
"
"                        'MT',
"
"                        'ICM',
"
"                        v_upd_ref1,
"
"                        v_upd_ref2,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        cr1.prod_cls,
"
"                        func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                        cr1.prod_sub_cls,
"
"                        func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                        p_user
"
"                       );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          IF cr1.ssthd_fm_doc_type IN ('D') THEN
"
"            v_dept_id := cr1.ssthd_fm_store_id;
"
"            v_dept_desc := func_find_dept_desc(p_bu,v_dept_id,p_lang);
"
"          ELSE
"
"            v_store_id := cr1.ssthd_fm_store_id;
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          END IF;
"
"          IF cr1.sstln_cap_asset_id IS NULL THEN
"
"            proc_find_store_gl_accts(p_bu,
"
"                                     cr1.ssthd_plnt,
"
"				     cr1.ssthd_plnt_loc_id,
"
"                                     CASE WHEN cr1.ssthd_fm_doc_type IN ('D') THEN 'DT' ELSE 'ST' END,
"
"                                     --CASE WHEN cr1.ssthd_fm_doc_type IN ('D') THEN v_dept_id ELSE cr1.ssthd_to_store_id END,
"
"				     CASE WHEN cr1.ssthd_fm_doc_type IN ('D') THEN v_dept_id ELSE v_store_id END,
"
"                                     NULL,
"
"                                     cr1.prod_cls,
"
"                                     cr1.prod_sub_cls,
"
"                                     NULL,
"
"                                     v_acct_plnt,
"
"				     v_acct_plnt_loc,
"
"                                     v_acct_lvl1,
"
"                                     v_acct_lvl2,
"
"                                     v_acct_lvl3,
"
"                                     v_acct_lvl4,
"
"				     v_acct_lvl5,
"
"				     v_acct_lvl6,
"
"                                     v_acct_lvl_prj,
"
"				     v_acct_cc_code,
"
"                                     v_acct,
"
"                                     CASE WHEN cr1.ssthd_fm_doc_type = 'D' THEN 'E' ELSE 'I' END
"
"                                    );
"
"          ELSE
"
"
"
"            OPEN c2(cr1.sstln_cap_asset_id);
"
"     	    FETCH c2 INTO cr2;
"
"            CLOSE c2;
"
"
"
"            proc_find_fam_acct(p_bu,
"
"			       cr2.fa_sub_group_id,
"
"			       cr2.fa_dept_id,
"
"			       'ASSET',
"
"			       p_plnt,
"
"			       cr1.sstln_cap_asset_id,
"
"			       v_acct_lvl1,
"
"			       v_acct_lvl2,
"
"			       v_acct_lvl3,
"
"			       v_acct_lvl4,
"
"			       v_acct_lvl5,
"
"			       v_acct_lvl6,
"
"			       v_acct_lvl_prj,
"
"			       v_acct_cc_code,
"
"			       v_acct,
"
"			       v_acct_plnt,
"
"			       v_acct_plnt_loc,
"
"			       p_loc_id => cr1.ssthd_plnt_loc_id
"
"    			      );
"
"          END IF;
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"	                v_jrnl_trans_no,
"
"	                cr1.ssthd_plnt,
"
"	                v_vou_type,
"
"			v_vou_type,
"
"	                NULL,
"
"	                cr1.ssthd_doc_no,
"
"	                cr1.sstln_seq_no,
"
"	                cr1.sstln_prod_id,
"
"	                cr1.sstln_prod_rev,
"
"	                cr1.prod_desc11,
"
"	                v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"	                v_acct_lvl1,
"
"	                v_acct_lvl2,
"
"	                v_acct_lvl3,
"
"	                v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"	                v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"	                v_acct,
"
"	                v_acct_desc,
"
"	                cr1.ssthd_date,
"
"	                func_find_year(p_bu,cr1.ssthd_date),
"
"	                func_find_period(p_bu,cr1.ssthd_date),
"
"	                0,
"
"	                ROUND(v_bc_disc_cost,v_rnd),
"
"	                0,
"
"	                ROUND(v_bc_disc_cost,v_rnd),
"
"	                v_store_id,
"
"	                v_store_desc,
"
"	                v_dept_id,
"
"	                v_dept_desc,
"
"	                v_rcpt_qty,
"
"	                v_bc_disc_cost / v_rcpt_qty,
"
"	                'MT',
"
"	                'ICM',
"
"	                v_upd_ref1,
"
"	                v_upd_ref2,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                cr1.prod_cls,
"
"	                func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"	                cr1.prod_sub_cls,
"
"	                func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"	                p_user
"
"	               );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      SELECT ssthd_date
"
"        INTO v_doc_date
"
"        FROM store_stock_trans_hd_vw
"
"       WHERE ssthd_bu = p_bu
"
"         AND ssthd_plnt = p_plnt
"
"         AND ssthd_doc_no = p_vou_no;
"
"
"
"      IF p_post_jrnl_flag = 'Y' THEN
"
"        proc_ins_gl_jrnl(p_bu,
"
"      		         p_plnt,
"
"      		         v_doc_date,
"
"      		         func_find_year(p_bu,v_doc_date),
"
"      		         func_find_period(p_bu,v_doc_date),
"
"      		         NULL,
"
"      		         p_vou_no,
"
"      		         p_vou_no,
"
"      		         'ICM',
"
"      		         p_user,
"
"      		         p_lang,
"
"      		         'Material Return'
"
"      		        );
"
"      END IF;
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_inward_jrnl_frm_mr - End');
"
"
"
"  END proc_ins_inward_jrnl_frm_mr;
"
"
"
"/* This Procedure used to create Perpetual journal of Material Return for Inspection Transaction */
"
"
"
"  PROCEDURE proc_ins_insp_jrnl_frm_mr(p_bu		business_units.bu_id%TYPE,
"
"				      p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				      p_vou_no		store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				      p_vou_seq_no	store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				      p_user		VARCHAR2,
"
"				      p_lang		NUMBER
"
"				      )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM store_stock_trans_hd_vw,store_stock_trans_ln_vw,products
"
"       WHERE ssthd_bu = sstln_bu
"
"         AND ssthd_doc_no = sstln_doc_no
"
"         AND prod_bu = sstln_bu
"
"         AND prod_id = sstln_prod_id
"
"         AND prod_rev = sstln_prod_rev
"
"         AND ssthd_bu = p_bu
"
"         AND ssthd_plnt = p_plnt
"
"         AND ssthd_doc_no = p_vou_no
"
"         AND (sstln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND ssthd_status <> 'C'
"
"         AND prod_stocked = 'Y'
"
"         AND prod_cust_spec_mat_flag = 'N'
"
"         AND ROUND((sstln_trans_qty*sstln_unit_cost),2) > 0
"
"       ORDER BY sstln_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_type		VARCHAR2(5);
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_fc_cost		NUMBER;
"
"    v_bc_cost		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"    v_doc_date		DATE;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_mr - Begin');
"
"
"
"    IF ((func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y') OR
"
"        (func_get_inv_method(p_bu) = 'S' AND func_find_jrnl_rqrd(p_bu) = 'Y')) THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_rcpt_qty := (cr1.sstln_trans_qty/cr1.sstln_conv_factor);
"
"
"
"        v_upd_ref1 := SUBSTR('Mat. Rtn. #'|| p_vou_no, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR('Mat. Rtn. #('||p_vou_no
"
"    			       ||'/'||cr1.sstln_seq_no||')/MI#('||cr1.sstln_mi_doc_no||'/'||cr1.sstln_mi_seq_no||'/'
"
"			       ||cr1.sstln_mi_sub_seq_no||'/'||cr1.sstln_mi_doc_date||')/',1,150);
"
"
"
"        IF cr1.sstln_status = 'N' OR (cr1.sstln_status = 'I' AND cr1.sstln_qc_pfx IS NOT NULL AND cr1.sstln_qc_no IS NOT NULL) THEN
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          v_vou_type := 'MTV';
"
"
"
"        ELSE
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'P');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          v_vou_type := 'MTV';
"
"
"
"        END IF;
"
"
"
"	--raise_application_error(-20999,'HRM'||'-'||v_store_id||'-'||cr1.sstln_status||'-'||cr1.sstln_qc_pfx||'-'||cr1.sstln_qc_no);
"
"
"
"	IF cr1.ssthd_status = 'I' THEN
"
"	  SELECT DISTINCT sttr_bc_unit_cost
"
"	    INTO v_fc_cost
"
"	    FROM stock_trans
"
"	   WHERE sttr_bu = p_bu
"
"	     AND sttr_store_id = func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'I')
"
"	     AND sttr_prod_id = cr1.sstln_prod_id
"
"	     AND sttr_prod_rev = cr1.sstln_prod_rev
"
"	     AND sttr_vou_pfx IS NULL
"
"	     AND sttr_vou_no = cr1.ssthd_doc_no
"
"	     AND sttr_vou_line_no = cr1.sstln_seq_no
"
"	     AND sttr_trans_qty > 0;
"
"
"
"	  v_fc_cost := v_rcpt_qty * v_fc_cost;
"
"
"
"	ELSE
"
"	IF func_find_prod_cost_method(p_bu,cr1.sstln_prod_id,cr1.sstln_prod_rev) IN ('MAC') THEN
"
"          v_fc_cost := ((CASE WHEN cr1.sstln_sg_flag = 'S' THEN func_find_unitcost(p_bu,
"
"        				 cr1.sstln_prod_id,
"
"        				 cr1.sstln_prod_rev,
"
"        				 func_find_store_fr_type(p_bu,
"
"        				 			 cr1.ssthd_plnt,
"
"								 cr1.ssthd_plnt_loc_id,
"
"        				 			 'I'
"
"        				 			)
"
"        				)
"
"        		WHEN cr1.sstln_sg_flag = 'F' THEN cr1.sstln_unit_cost END) * cr1.sstln_conv_factor) * v_rcpt_qty;
"
"        ELSE
"
"          v_fc_cost := (cr1.sstln_unit_cost * cr1.sstln_conv_factor) * v_rcpt_qty;
"
"        END IF;
"
"        END IF;
"
"
"
"        v_bc_cost := v_fc_cost;
"
"
"
"          /*********************************Debit Journals********************************/
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          v_bc_disc_cost := v_bc_cost;
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"                        cr1.ssthd_plnt,
"
"                        v_vou_type,
"
"			NULL,
"
"                        NULL,
"
"                        cr1.ssthd_doc_no,
"
"                        cr1.sstln_seq_no,
"
"                        cr1.sstln_prod_id,
"
"                        cr1.sstln_prod_rev,
"
"                        cr1.prod_desc11,
"
"                        v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"                        v_acct_lvl1,
"
"                        v_acct_lvl2,
"
"                        v_acct_lvl3,
"
"                        v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"                        v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"                        v_acct,
"
"                        v_acct_desc,
"
"                        cr1.ssthd_date,
"
"                        func_find_year(p_bu,cr1.ssthd_date),
"
"                        func_find_period(p_bu,cr1.ssthd_date),
"
"                        ROUND(v_fc_cost,v_rnd),
"
"                        0,
"
"                        ROUND(v_bc_disc_cost,v_rnd),
"
"                        0,
"
"                        v_store_id,
"
"                        v_store_desc,
"
"                        v_dept_id,
"
"                        v_dept_desc,
"
"                        v_rcpt_qty,
"
"                        (cr1.sstln_unit_cost * cr1.sstln_conv_factor),
"
"                        'MT',
"
"                        'ICM',
"
"                        v_upd_ref1,
"
"                        v_upd_ref2,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        cr1.prod_cls,
"
"                        func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                        cr1.prod_sub_cls,
"
"                        func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                        p_user
"
"                       );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'I');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          v_bc_disc_cost := v_bc_cost;
"
"
"
"          proc_ins_jrnl(p_bu,
"
"	                v_jrnl_trans_no,
"
"	                cr1.ssthd_plnt,
"
"	                v_vou_type,
"
"			NULL,
"
"	                NULL,
"
"	                cr1.ssthd_doc_no,
"
"	                cr1.sstln_seq_no,
"
"	                cr1.sstln_prod_id,
"
"	                cr1.sstln_prod_rev,
"
"	                cr1.prod_desc11,
"
"	                v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"	                v_acct_lvl1,
"
"	                v_acct_lvl2,
"
"	                v_acct_lvl3,
"
"	                v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"	                v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"	                v_acct,
"
"	                v_acct_desc,
"
"	                cr1.ssthd_date,
"
"	                func_find_year(p_bu,cr1.ssthd_date),
"
"	                func_find_period(p_bu,cr1.ssthd_date),
"
"	                0,
"
"	                ROUND(v_fc_cost,v_rnd),
"
"	                0,
"
"	                ROUND(v_bc_disc_cost,v_rnd),
"
"	                v_store_id,
"
"	                v_store_desc,
"
"	                v_dept_id,
"
"	                v_dept_desc,
"
"	                v_rcpt_qty,
"
"	                v_bc_disc_cost / v_rcpt_qty,
"
"	                'MT',
"
"	                'ICM',
"
"	                v_upd_ref1,
"
"	                v_upd_ref2,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                cr1.prod_cls,
"
"	                func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"	                cr1.prod_sub_cls,
"
"	                func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"	                p_user
"
"	               );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      SELECT ssthd_date
"
"        INTO v_doc_date
"
"        FROM store_stock_trans_hd_vw
"
"       WHERE ssthd_bu = p_bu
"
"         AND ssthd_plnt = p_plnt
"
"         AND ssthd_doc_no = p_vou_no;
"
"
"
"      proc_ins_gl_jrnl(p_bu,
"
"      		       p_plnt,
"
"      		       v_doc_date,
"
"      		       func_find_year(p_bu,v_doc_date),
"
"      		       func_find_period(p_bu,v_doc_date),
"
"      		       NULL,
"
"      		       p_vou_no,
"
"      		       p_vou_no,
"
"      		       'ICM',
"
"      		       p_user,
"
"      		       p_lang,
"
"      		       'Material Return - Inspection'
"
"      		      );
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_mr - End');
"
"
"
"  END proc_ins_insp_jrnl_frm_mr;
"
"
"
"/* This Procedure used to create Perpetual journal of Material Return for Inspection Completion Transaction */
"
"
"
"  PROCEDURE proc_ins_mr_insp_jrnl_frm_tqm(p_bu		business_units.bu_id%TYPE,
"
"				          p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				       	  p_vou_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"				   	  p_vou_no	tqm_qc_hd.tqhd_qc_no%TYPE,
"
"				   	  p_vou_rev	tqm_qc_hd.tqhd_qc_rev%TYPE,
"
"				   	  p_vou_seq_no	tqm_qc_ln.tqln_seq_no%TYPE,
"
"				   	  p_user	VARCHAR2,
"
"				   	  p_lang	NUMBER
"
"				  	 )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM tqm_qc_hd_vw,
"
"             tqm_qc_ln_vw,
"
"             store_stock_trans_hd_vw,
"
"             store_stock_trans_ln_vw,
"
"             products
"
"       WHERE tqhd_bu = tqln_bu
"
"         AND tqhd_qc_no = tqln_qc_no
"
"         AND ssthd_bu = tqln_bu
"
"         AND ssthd_doc_no = tqln_vou_no
"
"         AND sstln_seq_no = tqln_vou_line_no
"
"         AND ssthd_bu = sstln_bu
"
"         AND ssthd_doc_no = sstln_doc_no
"
"         AND prod_bu = sstln_bu
"
"         AND prod_id = sstln_prod_id
"
"         AND prod_rev = sstln_prod_rev
"
"         AND tqhd_bu = p_bu
"
"         AND tqhd_qc_pfx = p_vou_pfx
"
"         AND tqhd_qc_no = p_vou_no
"
"         AND (tqln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND prod_stocked = 'Y'
"
"         AND prod_cust_spec_mat_flag = 'N'
"
"       ORDER BY tqln_seq_no;
"
"
"
"    CURSOR c2 IS
"
"      SELECT tqhd_date,ssthd_doc_no
"
"        FROM tqm_qc_hd_vw,
"
"             tqm_qc_ln_vw,
"
"             store_stock_trans_hd_vw,
"
"             store_stock_trans_ln_vw,
"
"             products
"
"       WHERE tqhd_bu = tqln_bu
"
"         AND tqhd_qc_no = tqln_qc_no
"
"         AND ssthd_bu = tqln_bu
"
"         AND ssthd_doc_no = tqln_vou_no
"
"         AND sstln_seq_no = tqln_vou_line_no
"
"         AND ssthd_bu = sstln_bu
"
"         AND ssthd_doc_no = sstln_doc_no
"
"         AND prod_bu = sstln_bu
"
"         AND prod_id = sstln_prod_id
"
"         AND prod_rev = sstln_prod_rev
"
"         AND tqhd_bu = p_bu
"
"         AND tqhd_qc_pfx = p_vou_pfx
"
"         AND tqhd_qc_no = p_vou_no
"
"         AND (tqln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND prod_stocked = 'Y'
"
"         AND prod_cust_spec_mat_flag = 'N'
"
"       GROUP BY tqhd_date,ssthd_doc_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_mr_insp_jrnl_frm_tqm - Begin');
"
"
"
"    IF ((func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y') OR
"
"        (func_get_inv_method(p_bu) = 'S' AND func_find_jrnl_rqrd(p_bu) = 'Y')) THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_rcpt_qty := (cr1.sstln_trans_qty/cr1.sstln_conv_factor);
"
"
"
"	IF cr1.ssthd_status = 'I' THEN
"
"	  SELECT DISTINCT sttr_bc_unit_cost
"
"	    INTO v_unit_cost
"
"	    FROM stock_trans
"
"	   WHERE sttr_bu = p_bu
"
"	     AND sttr_store_id = func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q')
"
"	     AND sttr_prod_id = cr1.sstln_prod_id
"
"	     AND sttr_prod_rev = cr1.sstln_prod_rev
"
"	     AND sttr_vou_pfx IS NULL
"
"	     AND sttr_vou_no = cr1.ssthd_doc_no
"
"	     AND sttr_vou_line_no = cr1.sstln_seq_no
"
"	     AND sttr_trans_qty > 0;
"
"	ELSE
"
"	  v_unit_cost := CASE WHEN cr1.sstln_sg_flag = 'S' AND cr1.prod_cost_method = 'MAC' THEN func_find_unitcost(p_bu,cr1.sstln_prod_id,cr1.sstln_prod_rev,func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q'))
"
"			      WHEN cr1.sstln_sg_flag = 'F' THEN cr1.sstln_unit_cost
"
"			      ELSE cr1.sstln_unit_cost END;
"
"        END IF;
"
"
"
"
"
"	v_upd_ref2 := 'Material Return#(';
"
"
"
"        v_upd_ref1 := SUBSTR('Mat. Rtn. #'|| p_vou_no, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_no
"
"    			       ||'/'||cr1.sstln_seq_no || ' / ' || cr1.prod_desc11,1,150);
"
"
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'P');
"
"	v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"	proc_find_store_gl_accts(p_bu,
"
"                                 cr1.ssthd_plnt,
"
"				 cr1.ssthd_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"					           );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"		      cr1.ssthd_plnt,
"
"		      'MTV',
"
"		      'MTV',
"
"		      NULL,
"
"		      cr1.ssthd_doc_no,
"
"		      cr1.sstln_seq_no,
"
"		      cr1.sstln_prod_id,
"
"		      cr1.sstln_prod_rev,
"
"		      cr1.prod_desc11,
"
"		      v_acct_plnt,
"
"		      cr1.ssthd_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      cr1.tqhd_date, --SYSDATE,
"
"		      func_find_year(p_bu,cr1.tqhd_date),
"
"		      func_find_period(p_bu,cr1.tqhd_date),
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'MT',
"
"		      'ICM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.prod_cls,
"
"		      func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"		      cr1.prod_sub_cls,
"
"		      func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"		      p_user
"
"		     );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q');
"
"        v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"        proc_find_store_gl_accts(p_bu,
"
"                                 cr1.ssthd_plnt,
"
"				 cr1.ssthd_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"					           );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"  		      v_jrnl_trans_no,
"
"		      cr1.ssthd_plnt,
"
"		      'MTV',
"
"		      'MTV',
"
"		      NULL,
"
"		      cr1.ssthd_doc_no,
"
"		      cr1.sstln_seq_no,
"
"		      cr1.sstln_prod_id,
"
"		      cr1.sstln_prod_rev,
"
"		      cr1.prod_desc11,
"
"		      v_acct_plnt,
"
"		      cr1.ssthd_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      cr1.tqhd_date, --SYSDATE,
"
"		      func_find_year(p_bu,cr1.tqhd_date),
"
"		      func_find_period(p_bu,cr1.tqhd_date),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'MT',
"
"		      'ICM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.prod_cls,
"
"		      func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"		      cr1.prod_sub_cls,
"
"		      func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"		      p_user
"
"		     );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"        proc_ins_gl_jrnl(p_bu,
"
"		         p_plnt,
"
"		         cr2.tqhd_date,
"
"		         func_find_year(p_bu,cr2.tqhd_date),
"
"		         func_find_period(p_bu,cr2.tqhd_date),
"
"		         NULL,
"
"		         cr2.ssthd_doc_no,
"
"		         cr2.ssthd_doc_no,
"
"		         'ICM',
"
"		         p_user,
"
"		         p_lang,
"
"		         'Material Return - Inspection'
"
"	                );
"
"      END LOOP;
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_mr_insp_jrnl_frm_tqm - End');
"
"
"
"  END proc_ins_mr_insp_jrnl_frm_tqm;
"
"
"
"/* This procedure is used to create journal of Material return for posting */
"
"
"
"  PROCEDURE proc_ins_mat_ret_jrnl(p_bu			business_units.bu_id%TYPE,
"
"				  p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				  p_vou_no		store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				  p_vou_seq_no		store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				  p_user		VARCHAR2,
"
"				  p_lang		NUMBER,
"
"				  p_date		DATE DEFAULT SYSDATE
"
"				 )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM store_stock_trans_hd_vw,store_stock_trans_ln_vw,products
"
"       WHERE ssthd_bu = sstln_bu
"
"         AND ssthd_doc_no = sstln_doc_no
"
"         AND prod_bu = sstln_bu
"
"         AND prod_id = sstln_prod_id
"
"         AND prod_rev = sstln_prod_rev
"
"         AND ssthd_bu = p_bu
"
"         AND ssthd_plnt = p_plnt
"
"         AND ssthd_doc_no = p_vou_no
"
"         AND (sstln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND sstln_status <> 'C'
"
"         AND prod_stocked = 'Y'
"
"         AND prod_cust_spec_mat_flag = 'N'
"
"       ORDER BY sstln_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER;
"
"    v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_acpt_qty		NUMBER;
"
"    v_rej_qty		NUMBER;
"
"
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_mat_ret_jrnl - Begin');
"
"
"
"    IF ((func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y') OR
"
"        (func_get_inv_method(p_bu) = 'S' AND func_find_jrnl_rqrd(p_bu) = 'Y')) THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      /*v_vou_date   := SYSDATE;
"
"      v_vou_year   := func_find_year(p_bu,v_vou_date);
"
"      v_vou_period := func_find_period(p_bu,v_vou_date);*/
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"	IF cr1.ssthd_status = 'I' THEN
"
"          v_vou_date   := cr1.ssthd_date;
"
"          v_vou_year   := func_find_year(p_bu,cr1.ssthd_date);
"
"          v_vou_period := func_find_period(p_bu,cr1.ssthd_date);
"
"	ELSE
"
"          v_vou_date   := p_date;
"
"          v_vou_year   := func_find_year(p_bu,v_vou_date);
"
"          v_vou_period := func_find_period(p_bu,v_vou_date);
"
"        END IF;
"
"
"
"        v_rcpt_qty := (cr1.sstln_accepted_qty + cr1.sstln_rejected_qty / cr1.sstln_conv_factor);
"
"        v_acpt_qty := (cr1.sstln_accepted_qty/cr1.sstln_conv_factor);
"
"        v_rej_qty := (cr1.sstln_rejected_qty/cr1.sstln_conv_factor);
"
"
"
"	IF cr1.ssthd_status = 'I' THEN
"
"	  SELECT DISTINCT sttr_bc_unit_cost
"
"	    INTO v_unit_cost
"
"	    FROM stock_trans
"
"	   WHERE sttr_bu = p_bu
"
"	     AND sttr_store_id = func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'P')
"
"	     AND sttr_prod_id = cr1.sstln_prod_id
"
"	     AND sttr_prod_rev = cr1.sstln_prod_rev
"
"	     AND sttr_vou_pfx IS NULL
"
"	     AND sttr_vou_no = cr1.ssthd_doc_no
"
"	     AND sttr_vou_line_no = cr1.sstln_seq_no
"
"	     AND sttr_trans_qty > 0;
"
"	ELSE
"
"        IF func_find_prod_cost_method(p_bu,cr1.sstln_prod_id,cr1.sstln_prod_rev) IN ('MAC') THEN
"
"
"
"	  v_unit_cost := CASE WHEN cr1.sstln_sg_flag = 'S' THEN func_find_unitcost(p_bu,cr1.sstln_prod_id,cr1.sstln_prod_rev,func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'P'))
"
"			    WHEN cr1.sstln_sg_flag = 'F' THEN cr1.sstln_unit_cost
"
"			END;
"
"        ELSE
"
"          v_unit_cost := cr1.sstln_unit_cost;
"
"        END IF;
"
"        END IF;
"
"
"
"        v_upd_ref2 := 'Material Return #(';
"
"
"
"        v_upd_ref1 := SUBSTR('Mat. Rtn. #'|| p_vou_no, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||'/'||p_vou_no
"
"    			       ||'/'||cr1.sstln_seq_no||'/'||cr1.prod_desc11,1,150);
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"		IF cr1.sstln_accepted_qty > 0 THEN
"
"
"
"		  DBMS_OUTPUT.PUT_LINE('Accepted Qty. Journals');
"
"
"
"		  v_store_id := cr1.ssthd_to_store_id;
"
"		  v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"		  proc_find_store_gl_accts(p_bu,
"
"                                           cr1.ssthd_plnt,
"
"					   cr1.ssthd_plnt_loc_id,
"
"					   'ST',
"
"					   v_store_id,
"
"					   NULL,
"
"					   NULL,
"
"					   NULL,
"
"					   NULL,
"
"					   v_acct_plnt,
"
"					   v_acct_plnt_loc,
"
"					   v_acct_lvl1,
"
"					   v_acct_lvl2,
"
"					   v_acct_lvl3,
"
"					   v_acct_lvl4,
"
"					   v_acct_lvl5,
"
"					   v_acct_lvl6,
"
"					   v_acct_lvl_prj,
"
"					   v_acct_cc_code,
"
"					   v_acct
"
"					  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						  v_acct_lvl2,
"
"						  v_acct_lvl3,
"
"						  v_acct_lvl4,
"
"						  v_acct_lvl_prj,
"
"						  v_acct,
"
"						  v_acct_plnt,
"
"						  p_lang
"
"						 );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"						cr1.ssthd_plnt,
"
"						'MTV',
"
"						'MTV',
"
"						NULL,
"
"						cr1.ssthd_doc_no,
"
"						cr1.sstln_seq_no,
"
"						cr1.sstln_prod_id,
"
"						cr1.sstln_prod_rev,
"
"						cr1.prod_desc11,
"
"						v_acct_plnt,
"
"						cr1.ssthd_plnt_loc_id,
"
"						v_acct_lvl1,
"
"						v_acct_lvl2,
"
"						v_acct_lvl3,
"
"						v_acct_lvl4,
"
"						v_acct_lvl5,
"
"						v_acct_lvl6,
"
"						v_acct_lvl_prj,
"
"						v_acct_cc_code,
"
"						v_acct,
"
"						v_acct_desc,
"
"						v_vou_date,
"
"						v_vou_year,
"
"						v_vou_period,
"
"						ROUND(v_acpt_qty * v_unit_cost,v_rnd),
"
"						0,
"
"						ROUND(v_acpt_qty * v_unit_cost,v_rnd),
"
"						0,
"
"						v_store_id,
"
"						v_store_desc,
"
"						v_dept_id,
"
"						v_dept_desc,
"
"						v_acpt_qty,
"
"						v_unit_cost,
"
"						'MT',
"
"						'ICM',
"
"						v_upd_ref1,
"
"						v_upd_ref2,
"
"						NULL,
"
"						NULL,
"
"						NULL,
"
"						NULL,
"
"						cr1.prod_cls,
"
"						func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"						cr1.prod_sub_cls,
"
"						func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"						p_user
"
"					   );
"
"
"
"        END IF;
"
"
"
"        IF cr1.sstln_rejected_qty > 0 THEN
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Rejected Qty. Journals');
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'J');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"				   'ST',
"
"				   v_store_id,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct
"
"				  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						  v_acct_lvl2,
"
"						  v_acct_lvl3,
"
"						  v_acct_lvl4,
"
"						  v_acct_lvl_prj,
"
"						  v_acct,
"
"						  v_acct_plnt,
"
"						  p_lang
"
"						 );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"						cr1.ssthd_plnt,
"
"						'MTV','MTV',
"
"						NULL,
"
"						cr1.ssthd_doc_no,
"
"						cr1.sstln_seq_no,
"
"						cr1.sstln_prod_id,
"
"						cr1.sstln_prod_rev,
"
"						cr1.prod_desc11,
"
"						v_acct_plnt,
"
"						cr1.ssthd_plnt_loc_id,
"
"						v_acct_lvl1,
"
"						v_acct_lvl2,
"
"						v_acct_lvl3,
"
"						v_acct_lvl4,
"
"						v_acct_lvl5,
"
"						v_acct_lvl6,
"
"						v_acct_lvl_prj,
"
"						v_acct_cc_code,
"
"						v_acct,
"
"						v_acct_desc,
"
"						v_vou_date,
"
"						v_vou_year,
"
"						v_vou_period,
"
"						ROUND(v_rej_qty * v_unit_cost,v_rnd),
"
"						0,
"
"						ROUND(v_rej_qty * v_unit_cost,v_rnd),
"
"						0,
"
"						v_store_id,
"
"						v_store_desc,
"
"						v_dept_id,
"
"						v_dept_desc,
"
"						v_rej_qty,
"
"						v_unit_cost,
"
"						'MT',
"
"						'ICM',
"
"						v_upd_ref1,
"
"						v_upd_ref2,
"
"						NULL,
"
"						NULL,
"
"						NULL,
"
"						NULL,
"
"						cr1.prod_cls,
"
"						func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"						cr1.prod_sub_cls,
"
"						func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"						p_user
"
"                       );
"
"
"
"        END IF;
"
"
"
"		DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"		DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"		v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'P');
"
"		v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"		proc_find_store_gl_accts(p_bu,
"
"                                 cr1.ssthd_plnt,
"
"				 cr1.ssthd_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						v_acct_lvl2,
"
"						v_acct_lvl3,
"
"						v_acct_lvl4,
"
"						v_acct_lvl_prj,
"
"						v_acct,
"
"						v_acct_plnt,
"
"						p_lang
"
"					   );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"					  cr1.ssthd_plnt,
"
"					  'MTV','MTV',
"
"					  NULL,
"
"					  cr1.ssthd_doc_no,
"
"					  cr1.sstln_seq_no,
"
"					  cr1.sstln_prod_id,
"
"					  cr1.sstln_prod_rev,
"
"					  cr1.prod_desc11,
"
"					  v_acct_plnt,
"
"					  cr1.ssthd_plnt_loc_id,
"
"					  v_acct_lvl1,
"
"					  v_acct_lvl2,
"
"					  v_acct_lvl3,
"
"					  v_acct_lvl4,
"
"					  v_acct_lvl5,
"
"					  v_acct_lvl6,
"
"					  v_acct_lvl_prj,
"
"					  v_acct_cc_code,
"
"					  v_acct,
"
"					  v_acct_desc,
"
"					  v_vou_date,
"
"					  v_vou_year,
"
"					  v_vou_period,
"
"					  0,
"
"					  ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"					  0,
"
"					  ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"					  v_store_id,
"
"					  v_store_desc,
"
"					  v_dept_id,
"
"					  v_dept_desc,
"
"					  v_rcpt_qty,
"
"					  v_unit_cost,
"
"					  'MT',
"
"					  'ICM',
"
"					  v_upd_ref1,
"
"					  v_upd_ref2,
"
"					  NULL,
"
"					  NULL,
"
"					  NULL,
"
"					  NULL,
"
"					  cr1.prod_cls,
"
"					  func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"					  cr1.prod_sub_cls,
"
"					  func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"					  p_user
"
"					 );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      proc_ins_aj_variance_amt(p_bu,
"
"                               p_plnt,
"
"			       p_plnt,
"
"			       'MTV',
"
"			       NULL,
"
"			       p_vou_no,
"
"			       v_vou_date,
"
"			       v_vou_year,
"
"			       v_vou_period,
"
"			       'ICM',
"
"			       'Material Return',
"
"			       p_user,
"
"			       NULL,
"
"			       1
"
"			      );
"
"
"
"      proc_ins_gl_jrnl(p_bu,
"
"		       p_plnt,
"
"		       v_vou_date,
"
"		       v_vou_year,
"
"		       v_vou_period,
"
"		       NULL,
"
"		       p_vou_no,
"
"		       p_vou_no,
"
"		       'ICM',
"
"		       p_user,
"
"		       p_lang,
"
"		       'Material Return - Inspection'
"
"	              );
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_mat_ret_jrnl - End');
"
"
"
"  END proc_ins_mat_ret_jrnl;
"
"
"
"/* This procedure used to create journal of Material Return for Inspection Cancel */
"
"  PROCEDURE proc_ins_can_insp_jrnl_frm_mr(p_bu		business_units.bu_id%TYPE,
"
"				          p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				          p_vou_no	store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				          p_vou_seq_no	store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				          p_user	VARCHAR2,
"
"				          p_lang	NUMBER
"
"				         )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM store_stock_trans_hd,store_stock_trans_ln,products
"
"       WHERE ssthd_bu = sstln_bu
"
"         AND ssthd_doc_no = sstln_doc_no
"
"         AND prod_bu = sstln_bu
"
"         AND prod_id = sstln_prod_id
"
"         AND prod_rev = sstln_prod_rev
"
"         AND ssthd_bu = p_bu
"
"         AND ssthd_plnt = p_plnt
"
"         AND ssthd_doc_no = p_vou_no
"
"         AND (sstln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND ssthd_status <> 'C'
"
"         AND prod_stocked = 'Y'
"
"         AND prod_cust_spec_mat_flag = 'N'
"
"       ORDER BY sstln_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_type		VARCHAR2(5);
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_fc_cost		NUMBER;
"
"    v_bc_cost		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_can_insp_jrnl_frm_mr - Begin');
"
"
"
"    IF ((func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y') OR
"
"        (func_get_inv_method(p_bu) = 'S' AND func_find_jrnl_rqrd(p_bu) = 'Y')) THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_rcpt_qty := (cr1.sstln_trans_qty/cr1.sstln_conv_factor);
"
"        v_fc_cost := (func_find_unitcost(p_bu,
"
"        				 cr1.sstln_prod_id,
"
"        				 cr1.sstln_prod_rev,
"
"        				 func_find_store_fr_type(p_bu,
"
"        				 			 cr1.ssthd_plnt,
"
"								 cr1.ssthd_plnt_loc_id,
"
"        				 			 'Q'
"
"        				 			)
"
"        				) * cr1.sstln_conv_factor) * v_rcpt_qty;
"
"        v_bc_cost := v_fc_cost;
"
"
"
"        v_upd_ref1 := SUBSTR('Mat. Rtn. #'|| p_vou_no, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR('Mat. Rtn. #('||p_vou_no
"
"    			       ||'/'||cr1.sstln_seq_no||')/MI#('||cr1.sstln_mi_doc_no||'/'||cr1.sstln_mi_seq_no||'/'
"
"			       ||cr1.sstln_mi_sub_seq_no||'/'||cr1.sstln_mi_doc_date||')/',1,150);
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'I');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          v_vou_type := 'MTV';
"
"
"
"          /*********************************Debit Journals********************************/
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          v_bc_disc_cost := v_bc_cost;
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"                        cr1.ssthd_plnt,
"
"                        v_vou_type,
"
"			NULL,
"
"                        NULL,
"
"                        cr1.ssthd_doc_no,
"
"                        cr1.sstln_seq_no,
"
"                        cr1.sstln_prod_id,
"
"                        cr1.sstln_prod_rev,
"
"                        cr1.prod_desc11,
"
"                        v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"                        v_acct_lvl1,
"
"                        v_acct_lvl2,
"
"                        v_acct_lvl3,
"
"                        v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"                        v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"                        v_acct,
"
"                        v_acct_desc,
"
"                        SYSDATE,
"
"                        func_find_year(p_bu,SYSDATE),
"
"                        func_find_period(p_bu,SYSDATE),
"
"                        ROUND(v_fc_cost,v_rnd),
"
"                        0,
"
"                        ROUND(v_bc_disc_cost,v_rnd),
"
"                        0,
"
"                        v_store_id,
"
"                        v_store_desc,
"
"                        v_dept_id,
"
"                        v_dept_desc,
"
"                        v_rcpt_qty,
"
"                        (cr1.sstln_unit_cost * cr1.sstln_conv_factor),
"
"                        'MT',
"
"                        'ICM',
"
"                        v_upd_ref1,
"
"                        v_upd_ref2,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        cr1.prod_cls,
"
"                        func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                        cr1.prod_sub_cls,
"
"                        func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                        p_user
"
"                       );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"                                   CASE WHEN cr1.ssthd_fm_doc_type IN ('D') THEN 'DT' ELSE 'ST' END,
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          v_bc_disc_cost := v_bc_cost;
"
"
"
"          proc_ins_jrnl(p_bu,
"
"	                v_jrnl_trans_no,
"
"	                cr1.ssthd_plnt,
"
"	                v_vou_type,
"
"			NULL,
"
"	                NULL,
"
"	                cr1.ssthd_doc_no,
"
"	                cr1.sstln_seq_no,
"
"	                cr1.sstln_prod_id,
"
"	                cr1.sstln_prod_rev,
"
"	                cr1.prod_desc11,
"
"	                v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"	                v_acct_lvl1,
"
"	                v_acct_lvl2,
"
"	                v_acct_lvl3,
"
"	                v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"	                v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"	                v_acct,
"
"	                v_acct_desc,
"
"	                SYSDATE,
"
"	                func_find_year(p_bu,SYSDATE),
"
"	                func_find_period(p_bu,SYSDATE),
"
"	                0,
"
"	                ROUND(v_fc_cost,v_rnd),
"
"	                0,
"
"	                ROUND(v_bc_disc_cost,v_rnd),
"
"	                v_store_id,
"
"	                v_store_desc,
"
"	                v_dept_id,
"
"	                v_dept_desc,
"
"	                v_rcpt_qty,
"
"	                v_bc_disc_cost / v_rcpt_qty,
"
"	                'MT',
"
"	                'ICM',
"
"	                v_upd_ref1,
"
"	                v_upd_ref2,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                cr1.prod_cls,
"
"	                func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"	                cr1.prod_sub_cls,
"
"	                func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"	                p_user
"
"	               );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      proc_ins_gl_jrnl(p_bu,
"
"		       p_plnt,
"
"		       SYSDATE,
"
"		       func_find_year(p_bu,SYSDATE),
"
"		       func_find_period(p_bu,SYSDATE),
"
"		       NULL,
"
"		       p_vou_no,
"
"		       p_vou_no,
"
"		       'ICM',
"
"		       p_user,
"
"		       p_lang,
"
"		       'Material Return - Inspection'
"
"	              );
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_can_insp_jrnl_frm_mr - End');
"
"
"
"  END proc_ins_can_insp_jrnl_frm_mr;
"
"
"
"/* This procedure used to create journal of Material Return for Recreate Inspection Request */
"
"  PROCEDURE proc_recre_insp_jrnl_frm_mr(p_bu		business_units.bu_id%TYPE,
"
"				          p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				          p_vou_no	store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				          p_vou_seq_no	store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				          p_user	VARCHAR2,
"
"				          p_lang	NUMBER
"
"				         )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM store_stock_trans_hd,store_stock_trans_ln,products
"
"       WHERE ssthd_bu = sstln_bu
"
"         AND ssthd_doc_no = sstln_doc_no
"
"         AND prod_bu = sstln_bu
"
"         AND prod_id = sstln_prod_id
"
"         AND prod_rev = sstln_prod_rev
"
"         AND ssthd_bu = p_bu
"
"         AND ssthd_plnt = p_plnt
"
"         AND ssthd_doc_no = p_vou_no
"
"         AND (sstln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND ssthd_status <> 'C'
"
"         AND prod_stocked = 'Y'
"
"         AND prod_cust_spec_mat_flag = 'N'
"
"       ORDER BY sstln_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_type		VARCHAR2(5);
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_fc_cost		NUMBER;
"
"    v_bc_cost		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_recre_insp_jrnl_frm_mr - Begin');
"
"
"
"    IF ((func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y') OR
"
"        (func_get_inv_method(p_bu) = 'S' AND func_find_jrnl_rqrd(p_bu) = 'Y')) THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_rcpt_qty := (cr1.sstln_trans_qty/cr1.sstln_conv_factor);
"
"        v_fc_cost := (func_find_unitcost(p_bu,
"
"        				 cr1.sstln_prod_id,
"
"        				 cr1.sstln_prod_rev,
"
"        				 func_find_store_fr_type(p_bu,
"
"        				 			 cr1.ssthd_plnt,
"
"								 cr1.ssthd_plnt_loc_id,
"
"        				 			 'I'
"
"        				 			)
"
"        				) * cr1.sstln_conv_factor) * v_rcpt_qty;
"
"        v_bc_cost := v_fc_cost;
"
"
"
"        v_upd_ref1 := SUBSTR('Mat. Rtn. #'|| p_vou_no, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR('Mat. Rtn. #('||p_vou_no
"
"    			       ||'/'||cr1.sstln_seq_no||')/MI#('||cr1.sstln_mi_doc_no||'/'||cr1.sstln_mi_seq_no||'/'
"
"			       ||cr1.sstln_mi_sub_seq_no||'/'||cr1.sstln_mi_doc_date||')/',1,150);
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          v_vou_type := 'MTV';
"
"
"
"          /*********************************Debit Journals********************************/
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          v_bc_disc_cost := v_bc_cost;
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"                        cr1.ssthd_plnt,
"
"                        v_vou_type,
"
"			NULL,
"
"                        NULL,
"
"                        cr1.ssthd_doc_no,
"
"                        cr1.sstln_seq_no,
"
"                        cr1.sstln_prod_id,
"
"                        cr1.sstln_prod_rev,
"
"                        cr1.prod_desc11,
"
"                        v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"                        v_acct_lvl1,
"
"                        v_acct_lvl2,
"
"                        v_acct_lvl3,
"
"                        v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"                        v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"                        v_acct,
"
"                        v_acct_desc,
"
"                        SYSDATE,
"
"                        func_find_year(p_bu,SYSDATE),
"
"                        func_find_period(p_bu,SYSDATE),
"
"                        ROUND(v_fc_cost,v_rnd),
"
"                        0,
"
"                        ROUND(v_bc_disc_cost,v_rnd),
"
"                        0,
"
"                        v_store_id,
"
"                        v_store_desc,
"
"                        v_dept_id,
"
"                        v_dept_desc,
"
"                        v_rcpt_qty,
"
"                        (cr1.sstln_unit_cost * cr1.sstln_conv_factor),
"
"                        'MT',
"
"                        'ICM',
"
"                        v_upd_ref1,
"
"                        v_upd_ref2,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        cr1.prod_cls,
"
"                        func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                        cr1.prod_sub_cls,
"
"                        func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                        p_user
"
"                       );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'I');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.ssthd_plnt,
"
"				   cr1.ssthd_plnt_loc_id,
"
"                                   CASE WHEN cr1.ssthd_fm_doc_type IN ('D') THEN 'DT' ELSE 'ST' END,
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"          v_bc_disc_cost := v_bc_cost;
"
"
"
"          proc_ins_jrnl(p_bu,
"
"	                v_jrnl_trans_no,
"
"	                cr1.ssthd_plnt,
"
"	                v_vou_type,
"
"			NULL,
"
"	                NULL,
"
"	                cr1.ssthd_doc_no,
"
"	                cr1.sstln_seq_no,
"
"	                cr1.sstln_prod_id,
"
"	                cr1.sstln_prod_rev,
"
"	                cr1.prod_desc11,
"
"	                v_acct_plnt,
"
"			cr1.ssthd_plnt_loc_id,
"
"	                v_acct_lvl1,
"
"	                v_acct_lvl2,
"
"	                v_acct_lvl3,
"
"	                v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"	                v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"	                v_acct,
"
"	                v_acct_desc,
"
"	                SYSDATE,
"
"	                func_find_year(p_bu,SYSDATE),
"
"	                func_find_period(p_bu,SYSDATE),
"
"	                0,
"
"	                ROUND(v_fc_cost,v_rnd),
"
"	                0,
"
"	                ROUND(v_bc_disc_cost,v_rnd),
"
"	                v_store_id,
"
"	                v_store_desc,
"
"	                v_dept_id,
"
"	                v_dept_desc,
"
"	                v_rcpt_qty,
"
"	                v_bc_disc_cost / v_rcpt_qty,
"
"	                'MT',
"
"	                'ICM',
"
"	                v_upd_ref1,
"
"	                v_upd_ref2,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                cr1.prod_cls,
"
"	                func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"	                cr1.prod_sub_cls,
"
"	                func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"	                p_user
"
"	               );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"    END IF;
"
"
"
"    proc_ins_gl_jrnl(p_bu,
"
"		     p_plnt,
"
"		     SYSDATE,
"
"		     func_find_year(p_bu,SYSDATE),
"
"		     func_find_period(p_bu,SYSDATE),
"
"		     NULL,
"
"		     p_vou_no,
"
"		     p_vou_no,
"
"		     'ICM',
"
"		     p_user,
"
"		     p_lang,
"
"		     'Material Return - Inspection'
"
"	            );
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_recre_insp_jrnl_frm_mr - End');
"
"
"
"  END proc_recre_insp_jrnl_frm_mr;
"
"
"
"/* Sales Return Journal Start */
"
"  PROCEDURE proc_ins_inward_jrnl_frm_sr(p_bu		IN	business_units.bu_id%TYPE,
"
"					p_plnt		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"					p_vou_pfx	IN	sales_invoices_hd.sihd_inv_pfx%TYPE,
"
"					p_vou_no	IN	sales_invoices_hd.sihd_inv_no%TYPE,
"
"					p_vou_seq_no	IN	sales_invoices_ln.siln_seq_no%TYPE,
"
"					p_user		IN	VARCHAR2,
"
"					p_lang		IN	NUMBER
"
"				       )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM sales_invoices_hd,sales_invoices_ln,products,suppliers
"
"       WHERE sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND prod_bu = siln_bu
"
"         AND prod_id = siln_prod_id
"
"         AND prod_rev = siln_prod_rev
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_plant = p_plnt
"
"         AND sihd_inv_pfx = p_vou_pfx
"
"         AND sihd_inv_no = p_vou_no
"
"         AND (siln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND sihd_type IN ('SR')
"
"         AND sihd_status NOT IN ('C')
"
"         AND prod_stocked = 'Y'
"
"       ORDER BY siln_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER;
"
"    v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"    v_prod_desc1	products.prod_desc11%TYPE;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"    v_cogs_rqrd_flag	VARCHAR2(1);
"
"    v_plnt_state_id	VARCHAR2(10);
"
"    v_cust_state_id	VARCHAR2(10);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_inward_jrnl_frm_sr - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_vou_date := cr1.sihd_inv_date;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"        v_rcpt_qty := (cr1.siln_inv_qty/cr1.siln_conv_factor);
"
"
"
"	v_upd_ref2 := CASE WHEN cr1.siln_old_inv_pfx IS NOT NULL AND cr1.sihd_type = 'SR' THEN 'Sales Return W.Inv. W.Mat#('
"
"		           WHEN cr1.siln_old_inv_pfx IS NULL AND cr1.sihd_type = 'SR' THEN 'Sales Return W/O.Inv. W.Mat#('
"
"			   END;
"
"
"
"        v_upd_ref1 := SUBSTR('Sales Return #('|| p_vou_pfx || '/' || p_vou_no || ') / Return Receipts / ' || func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang)
"
"	                  || ' / ' || cr1.siln_prod_desc1, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.siln_seq_no||')/Old Invoice#('||cr1.siln_old_inv_pfx||'/'||cr1.siln_old_inv_no||'/'
"
"			       ||cr1.siln_old_seq_no||')/'||func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang),1,150);
"
"
"
"	SELECT bup_state
"
"	  INTO v_plnt_state_id
"
"	  FROM bus_unit_plants
"
"	 WHERE bup_bu = p_bu
"
"	   AND bup_plant_id = p_plnt;
"
"
"
"	SELECT ssl_state
"
"	  INTO v_cust_state_id
"
"	  FROM suplr_ship_loc
"
"	 WHERE ssl_bu = p_bu
"
"	   AND ssl_suplr_id = cr1.sihd_cust_id
"
"	   AND ssl_loc_name1 = cr1.sihd_billto_loc_name;
"
"
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Sales Return Journals');
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'I');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	  v_unit_cost := func_find_unitcost(p_bu,
"
"          				    cr1.siln_prod_id,
"
"          				    cr1.siln_prod_rev,
"
"          				    func_find_deflt_storeid(p_bu,
"
"          							    p_plnt,
"
"								    cr1.sihd_plnt_loc_id,
"
"          							    cr1.siln_prod_id,
"
"          							    cr1.siln_prod_rev,
"
"          							    'N'));
"
"          v_bc_disc_cost := ((CASE WHEN v_unit_cost = 0 THEN cr1.siln_price ELSE v_unit_cost END) * cr1.siln_conv_factor) * v_rcpt_qty;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.sihd_plant,
"
"				   cr1.sihd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   cr1.prod_cls,
"
"                                   cr1.prod_sub_cls,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.sihd_plant,
"
"                          'SI',
"
"			  NULL,
"
"                          cr1.sihd_inv_pfx,
"
"                          cr1.sihd_inv_no,
"
"                          cr1.siln_seq_no,
"
"                          cr1.siln_prod_id,
"
"                          cr1.siln_prod_rev,
"
"                          cr1.siln_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.sihd_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          0,
"
"                          'SI',
"
"                          'SOM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.sihd_cust_id,
"
"                          func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang),
"
"                          cr1.prod_cls,
"
"                          func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                          cr1.prod_sub_cls,
"
"                          func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                          p_user
"
"                         );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"         /* SELECT somctrl_cogs_jrnl_rqrd_flag
"
"            INTO v_cogs_rqrd_flag
"
"            FROM som_control
"
"           WHERE somctrl_bu = p_bu;
"
"
"
"          IF v_cogs_rqrd_flag = 'N' THEN
"
"            raise_application_error(-20999,'HRM');
"
"          END IF;*/
"
"
"
"          proc_find_saca_lvl_acct(p_bu,
"
"                                  cr1.sihd_plant,
"
"				  cr1.sihd_plnt_loc_id,
"
"                                  cr1.sihd_sales_area,
"
"                                  cr1.suplr_sales_terr,
"
"                                  cr1.prod_cls,
"
"                                  cr1.prod_sub_cls,
"
"                                  cr1.siln_sales_price_class,
"
"                                  NULL,
"
"                                  'COGS',
"
"                                  v_acct_lvl1,
"
"                                  v_acct_lvl2,
"
"                                  v_acct_lvl3,
"
"                                  v_acct_lvl4,
"
"				  v_acct_lvl5,
"
"				  v_acct_lvl6,
"
"                                  v_acct_lvl_prj,
"
"                                  v_acct,
"
"                                  v_acct_plnt,
"
"				  v_acct_cc_code,
"
"				  v_acct_plnt_loc,
"
"                                  p_plnt_state_id => v_plnt_state_id,
"
"                                  p_cust_state_id => v_cust_state_id
"
"                                 );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.sihd_plant,
"
"                          'SI',
"
"			  NULL,
"
"                          cr1.sihd_inv_pfx,
"
"                          cr1.sihd_inv_no,
"
"                          cr1.siln_seq_no,
"
"                          cr1.siln_prod_id,
"
"                          cr1.siln_prod_rev,
"
"                          cr1.siln_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.sihd_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          0,
"
"                          'SI',
"
"                          'SOM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.sihd_cust_id,
"
"                          func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang),
"
"                          cr1.prod_cls,
"
"                          func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                          cr1.prod_sub_cls,
"
"                          func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                          p_user
"
"                         );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_inward_jrnl_frm_sr - End');
"
"
"
"  END proc_ins_inward_jrnl_frm_sr;
"
"
"
"  PROCEDURE proc_ins_insp_jrnl_frm_sr(p_bu		IN	business_units.bu_id%TYPE,
"
"				      p_plnt		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"				      p_vou_pfx		IN	sales_invoices_hd.sihd_inv_pfx%TYPE,
"
"				      p_vou_no		IN	sales_invoices_hd.sihd_inv_no%TYPE,
"
"				      p_vou_seq_no	IN	sales_invoices_ln.siln_seq_no%TYPE,
"
"				      p_user		IN	VARCHAR2,
"
"				      p_lang		IN	NUMBER
"
"				     )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM sales_invoices_hd,sales_invoices_ln,products,suppliers
"
"       WHERE sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND prod_bu = siln_bu
"
"         AND prod_id = siln_prod_id
"
"         AND prod_rev = siln_prod_rev
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_plant = p_plnt
"
"         AND sihd_inv_pfx = p_vou_pfx
"
"         AND sihd_inv_no = p_vou_no
"
"         AND (siln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND sihd_type IN ('SR')
"
"         AND sihd_status NOT IN ('C')
"
"         AND prod_stocked = 'Y'
"
"       ORDER BY siln_seq_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER;
"
"    v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_bc_disc_cost	NUMBER;
"
"    v_bc_cost		NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"    v_prod_desc1	products.prod_desc11%TYPE;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_sr - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_vou_date := SYSDATE;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"        v_rcpt_qty := (cr1.siln_inv_qty/cr1.siln_conv_factor);
"
"
"
"	v_upd_ref2 := CASE WHEN cr1.siln_old_inv_pfx IS NOT NULL AND cr1.sihd_type = 'SR' THEN 'Sales Return W.Inv. W.Mat#('
"
"		           WHEN cr1.siln_old_inv_pfx IS NULL AND cr1.sihd_type = 'SR'  THEN 'Sales Return W/O.Inv. W.Mat#('
"
"			   END;
"
"
"
"        v_upd_ref1 := SUBSTR('Sales Return #('|| p_vou_pfx || '/' || p_vou_no || ') / Return Receipts / ' || func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang)
"
"	                  || ' / ' || cr1.siln_prod_desc1, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.siln_seq_no||')/Old Invoice#('||cr1.siln_old_inv_pfx||'/'||cr1.siln_old_inv_no||'/'
"
"			       ||cr1.siln_old_seq_no||')/'||func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang),1,150);
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Sales Return Journals');
"
"
"
"	  IF cr1.sihd_status = 'N' THEN
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'Q');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          ELSE
"
"            v_store_id := func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'P');
"
"            v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"          END IF;
"
"
"
"          v_bc_disc_cost := (func_find_unitcost(p_bu,cr1.siln_prod_id,cr1.siln_prod_rev,func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'I')) * cr1.siln_conv_factor) * v_rcpt_qty;
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.sihd_plant,
"
"				   cr1.sihd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   cr1.prod_cls,
"
"                                   cr1.prod_sub_cls,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.sihd_plant,
"
"                          'SI',
"
"			  NULL,
"
"                          cr1.sihd_inv_pfx,
"
"                          cr1.sihd_inv_no,
"
"                          cr1.siln_seq_no,
"
"                          cr1.siln_prod_id,
"
"                          cr1.siln_prod_rev,
"
"                          cr1.siln_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.sihd_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          0,
"
"                          'SI',
"
"                          'SOM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.sihd_cust_id,
"
"                          func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang),
"
"                          cr1.prod_cls,
"
"                          func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                          cr1.prod_sub_cls,
"
"                          func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                          p_user
"
"                         );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          v_store_id := func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'I');
"
"          v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   cr1.sihd_plant,
"
"				   cr1.sihd_plnt_loc_id,
"
"                                   'ST',
"
"                                   v_store_id,
"
"                                   NULL,
"
"                                   cr1.prod_cls,
"
"                                   cr1.prod_sub_cls,
"
"                                   NULL,
"
"                                   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"                                   v_acct_lvl1,
"
"                                   v_acct_lvl2,
"
"                                   v_acct_lvl3,
"
"                                   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"                                   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"                                   v_acct
"
"                                  );
"
"
"
"          v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"                                                      v_acct_lvl2,
"
"                                                      v_acct_lvl3,
"
"                                                      v_acct_lvl4,
"
"                                                      v_acct_lvl_prj,
"
"                                                      v_acct,
"
"                                                      v_acct_plnt,
"
"                                                      p_lang
"
"                                                     );
"
"
"
"            v_bc_disc_cost := v_bc_cost;
"
"
"
"            proc_ins_jrnl(p_bu,
"
"                          v_jrnl_trans_no,
"
"                          cr1.sihd_plant,
"
"                          'SI',
"
"			  NULL,
"
"                          cr1.sihd_inv_pfx,
"
"                          cr1.sihd_inv_no,
"
"                          cr1.siln_seq_no,
"
"                          cr1.siln_prod_id,
"
"                          cr1.siln_prod_rev,
"
"                          cr1.siln_prod_desc1,
"
"                          v_acct_plnt,
"
"			  cr1.sihd_plnt_loc_id,
"
"                          v_acct_lvl1,
"
"                          v_acct_lvl2,
"
"                          v_acct_lvl3,
"
"                          v_acct_lvl4,
"
"			  v_acct_lvl5,
"
"			  v_acct_lvl6,
"
"                          v_acct_lvl_prj,
"
"			  v_acct_cc_code,
"
"                          v_acct,
"
"                          v_acct_desc,
"
"                          v_vou_date,
"
"                          v_vou_year,
"
"                          v_vou_period,
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          0,
"
"                          ROUND(v_bc_disc_cost,v_rnd),
"
"                          v_store_id,
"
"                          v_store_desc,
"
"                          v_dept_id,
"
"                          v_dept_desc,
"
"                          v_rcpt_qty,
"
"                          0,
"
"                          'SI',
"
"                          'SOM',
"
"                          v_upd_ref1,
"
"                          v_upd_ref2,
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.sihd_cust_id,
"
"                          func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang),
"
"                          cr1.prod_cls,
"
"                          func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"                          cr1.prod_sub_cls,
"
"                          func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"                          p_user
"
"                         );
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_insp_jrnl_frm_sr - End');
"
"
"
"  END proc_ins_insp_jrnl_frm_sr;
"
"
"
"  PROCEDURE proc_ins_sr_insp_jrnl_frm_tqm(p_bu		business_units.bu_id%TYPE,
"
"				          p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				       	  p_vou_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"				   	  p_vou_no	tqm_qc_hd.tqhd_qc_no%TYPE,
"
"				   	  p_vou_rev	tqm_qc_hd.tqhd_qc_rev%TYPE,
"
"				   	  p_vou_seq_no	tqm_qc_ln.tqln_seq_no%TYPE,
"
"				   	  p_user	VARCHAR2,
"
"				   	  p_lang	NUMBER
"
"				  	 )
"
"  IS
"
"    CURSOR c1 IS
"
"      SELECT *
"
"        FROM tqm_qc_hd,
"
"             tqm_qc_ln,
"
"             sales_invoices_hd,
"
"             sales_invoices_ln,
"
"             products
"
"       WHERE tqhd_bu = tqln_bu
"
"         AND tqhd_qc_no = tqln_qc_no
"
"         AND sihd_bu = tqln_bu
"
"         AND sihd_inv_no = tqln_vou_no
"
"         AND siln_seq_no = tqln_vou_line_no
"
"         AND sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND prod_bu = siln_bu
"
"         AND prod_id = siln_prod_id
"
"         AND prod_rev = siln_prod_rev
"
"         AND tqhd_bu = p_bu
"
"         AND tqhd_qc_pfx = p_vou_pfx
"
"         AND tqhd_qc_no = p_vou_no
"
"         AND (tqln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND prod_stocked = 'Y'
"
"       ORDER BY tqln_seq_no;
"
"
"
"    CURSOR c2 IS
"
"      SELECT sihd_inv_pfx,sihd_inv_no
"
"        FROM tqm_qc_hd,
"
"             tqm_qc_ln,
"
"             sales_invoices_hd,
"
"             sales_invoices_ln,
"
"             products
"
"       WHERE tqhd_bu = tqln_bu
"
"         AND tqhd_qc_no = tqln_qc_no
"
"         AND sihd_bu = tqln_bu
"
"         AND sihd_inv_no = tqln_vou_no
"
"         AND siln_seq_no = tqln_vou_line_no
"
"         AND sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND prod_bu = siln_bu
"
"         AND prod_id = siln_prod_id
"
"         AND prod_rev = siln_prod_rev
"
"         AND tqhd_bu = p_bu
"
"         AND tqhd_qc_pfx = p_vou_pfx
"
"         AND tqhd_qc_no = p_vou_no
"
"         AND (tqln_seq_no = p_vou_seq_no OR p_vou_seq_no IS NULL)
"
"         AND prod_stocked = 'Y'
"
"       GROUP BY sihd_inv_pfx,sihd_inv_no;
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_store_desc	stores.store_desc1%TYPE;
"
"    v_dept_id		departments.dept_id%TYPE;
"
"    v_dept_desc		departments.dept_name1%TYPE;
"
"
"
"    v_tax_suplr_desc	suppliers.suplr_name1%TYPE;
"
"    v_chrg_type		VARCHAR2(5);
"
"    v_exp_share_pct	NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"
"
"    v_upd_ref1		VARCHAR2(200);
"
"    v_upd_ref2		VARCHAR2(200);
"
"
"
"  BEGIN
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_sr_insp_jrnl_frm_tqm - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_rcpt_qty := (cr1.siln_inv_qty/cr1.siln_conv_factor);
"
"
"
"	v_unit_cost := func_find_unitcost(p_bu,
"
"					  cr1.siln_prod_id,
"
"					  cr1.siln_prod_rev,
"
"					  func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'Q'));
"
"
"
"        v_upd_ref2 := 'Sales Return#(';
"
"
"
"        v_upd_ref1 := SUBSTR('Sales Return #('|| p_vou_pfx || '/' || p_vou_no || ') / Return Receipts / ' || func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang)
"
"	                  || ' / ' || cr1.siln_prod_desc1, 1, 150);
"
"
"
"        v_upd_ref2 := SUBSTR(v_upd_ref2||p_vou_pfx||'/'||p_vou_no
"
"    			       ||'/'||cr1.siln_seq_no||')/Old Invoice#('||cr1.siln_old_inv_pfx||'/'||cr1.siln_old_inv_no||'/'
"
"			       ||cr1.siln_old_seq_no||')/'||func_find_party_name(p_bu,cr1.sihd_cust_id,p_lang),1,150);
"
"
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'P');
"
"	v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"	DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"	proc_find_store_gl_accts(p_bu,
"
"                                 cr1.sihd_plant,
"
"				 cr1.sihd_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"					           );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"                      v_jrnl_trans_no,
"
"		      cr1.sihd_plant,
"
"		      'SI',
"
"		      NULL,
"
"		      cr1.sihd_inv_pfx,
"
"		      cr1.sihd_inv_no,
"
"		      cr1.siln_seq_no,
"
"		      cr1.siln_prod_id,
"
"		      cr1.siln_prod_rev,
"
"		      cr1.prod_desc11,
"
"		      v_acct_plnt,
"
"		      cr1.sihd_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      SYSDATE,
"
"		      func_find_year(p_bu,SYSDATE),
"
"		      func_find_period(p_bu,SYSDATE),
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'SI',
"
"		      'SOM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.prod_cls,
"
"		      func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"		      cr1.prod_sub_cls,
"
"		      func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"		      p_user
"
"		     );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.sihd_plant,cr1.sihd_plnt_loc_id,'Q');
"
"        v_store_desc := func_find_store_desc(p_bu,v_store_id,p_lang);
"
"
"
"        proc_find_store_gl_accts(p_bu,
"
"                                 cr1.sihd_plant,
"
"				 cr1.sihd_plnt_loc_id,
"
"				 'ST',
"
"				 v_store_id,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 NULL,
"
"				 v_acct_plnt,
"
"				 v_acct_plnt_loc,
"
"				 v_acct_lvl1,
"
"				 v_acct_lvl2,
"
"				 v_acct_lvl3,
"
"				 v_acct_lvl4,
"
"				 v_acct_lvl5,
"
"				 v_acct_lvl6,
"
"				 v_acct_lvl_prj,
"
"				 v_acct_cc_code,
"
"				 v_acct
"
"				);
"
"
"
"        v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                    v_acct_lvl1,
"
"						    v_acct_lvl2,
"
"						    v_acct_lvl3,
"
"						    v_acct_lvl4,
"
"						    v_acct_lvl_prj,
"
"						    v_acct,
"
"						    v_acct_plnt,
"
"						    p_lang
"
"					           );
"
"
"
"        proc_ins_jrnl(p_bu,
"
"  		      v_jrnl_trans_no,
"
"		      cr1.sihd_plant,
"
"		      'SI',
"
"		      NULL,
"
"		      cr1.sihd_inv_pfx,
"
"		      cr1.sihd_inv_no,
"
"		      cr1.siln_seq_no,
"
"		      cr1.siln_prod_id,
"
"		      cr1.siln_prod_rev,
"
"		      cr1.prod_desc11,
"
"		      v_acct_plnt,
"
"		      cr1.sihd_plnt_loc_id,
"
"		      v_acct_lvl1,
"
"		      v_acct_lvl2,
"
"		      v_acct_lvl3,
"
"		      v_acct_lvl4,
"
"		      v_acct_lvl5,
"
"		      v_acct_lvl6,
"
"		      v_acct_lvl_prj,
"
"		      v_acct_cc_code,
"
"		      v_acct,
"
"		      v_acct_desc,
"
"		      SYSDATE,
"
"		      func_find_year(p_bu,SYSDATE),
"
"		      func_find_period(p_bu,SYSDATE),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      0,
"
"		      ROUND(v_rcpt_qty * v_unit_cost,v_rnd),
"
"		      v_store_id,
"
"		      v_store_desc,
"
"		      v_dept_id,
"
"		      v_dept_desc,
"
"		      v_rcpt_qty,
"
"		      v_unit_cost,
"
"		      'SI',
"
"		      'SOM',
"
"		      v_upd_ref1,
"
"		      v_upd_ref2,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      NULL,
"
"		      cr1.prod_cls,
"
"		      func_find_class_desc(p_bu,cr1.prod_cls,p_lang),
"
"		      cr1.prod_sub_cls,
"
"		      func_find_subclass_desc(p_bu,cr1.prod_sub_cls,p_lang),
"
"		      p_user
"
"		     );
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"
"
"      END LOOP;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"        proc_ins_gl_jrnl(p_bu,
"
"		         p_plnt,
"
"		         SYSDATE,
"
"		         func_find_year(p_bu,SYSDATE),
"
"		         func_find_period(p_bu,SYSDATE),
"
"		         cr2.sihd_inv_pfx,
"
"		         cr2.sihd_inv_no,
"
"		         cr2.sihd_inv_no,
"
"		         'SOM',
"
"		         p_user,
"
"		         p_lang,
"
"		         'Sales Return - Inspection'
"
"	                );
"
"      END LOOP;
"
"    END IF;
"
"
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_sr_insp_jrnl_frm_tqm - End');
"
"
"
"  END proc_ins_sr_insp_jrnl_frm_tqm;
"
"
"
"  PROCEDURE proc_ins_stk_cnt_jrnl(p_bu		business_units.bu_id%TYPE,
"
"				  p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				  p_vou_no	stock_count_hd.schd_ord_no%TYPE,
"
"				  p_user	VARCHAR2,
"
"				  p_lang	NUMBER
"
"				 )
"
"  IS
"
"  CURSOR c1 IS
"
"  SELECT schd_plnt,schd_plnt_loc_id,schd_count_date,schd_ord_no,scln_seq_no,
"
"         scln_store_id,store_desc1,
"
"         scln_prod_id,scln_prod_rev,prod_desc11,
"
"	 scln_prod_cls,scln_prod_subcls,
"
"	 (scln_phy_qty - scln_sys_qty) stk_qty,
"
"         ABS(scln_phy_qty - scln_sys_qty) stk_cnt_qty,
"
"	 scln_unit_cost
"
"    FROM stock_count_hd,stock_count_ln,products,stores
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
"     AND store_bu = scln_bu
"
"     AND store_id = scln_store_id
"
"     AND schd_bu = p_bu
"
"     AND schd_plnt = p_plnt
"
"     AND schd_ord_no = p_vou_no
"
"     AND schd_status = 'A'
"
"     AND (scln_phy_qty - scln_sys_qty) <> 0
"
"   ORDER BY scln_seq_no;
"
"
"
"
"
"    v_jrnl_trans_no	NUMBER(15);
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER;
"
"    v_vou_period	NUMBER;
"
"
"
"    v_rnd		NUMBER;
"
"
"
"    v_acct_plnt		profit_cost_centers.pcc_ac_plnt%TYPE;
"
"    v_acct_plnt_loc	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE;
"
"    v_acct_lvl1		profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"    v_acct_lvl2		profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"    v_acct_lvl3		profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"    v_acct_lvl4		profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"    v_acct_lvl5		profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"    v_acct_lvl6		profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"    v_acct_lvl_prj	profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"    v_acct_cc_code	profit_cost_centers.pcc_cc_code%TYPE;
"
"    v_acct		gl_accts.glac_acct%TYPE;
"
"    v_acct_desc		gl_accts.glac_acct_desc1%TYPE;
"
"    v_sub_plnt		VARCHAR2(10);
"
"
"
"  BEGIN
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_stk_cnt_jrnl - Begin');
"
"
"
"    IF func_get_inv_method(p_bu) = 'T' AND func_find_jrnl_rqrd(p_bu) = 'Y' THEN
"
"
"
"      v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"      DBMS_OUTPUT.PUT_LINE('Journal Transaction No. : '||v_jrnl_trans_no);
"
"
"
"      v_rnd := func_find_appl_rnddigit(p_bu);
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_vou_date := cr1.schd_count_date;
"
"        v_vou_year := func_find_year(p_bu,v_vou_date);
"
"        v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"        IF cr1.stk_qty > 0 THEN
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   p_plnt,
"
"				   cr1.schd_plnt_loc_id,
"
"				   'ST',
"
"				   cr1.scln_store_id,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct
"
"				  );
"
"
"
"	  v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						      v_acct_lvl2,
"
"						      v_acct_lvl3,
"
"						      v_acct_lvl4,
"
"						      v_acct_lvl_prj,
"
"						      v_acct,
"
"						      v_acct_plnt,
"
"						      p_lang
"
"						     );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"			cr1.schd_plnt,
"
"			'IC',
"
"			'IC',
"
"			NULL,
"
"			cr1.schd_ord_no,
"
"			cr1.scln_seq_no,
"
"			cr1.scln_prod_id,
"
"			cr1.scln_prod_rev,
"
"			cr1.prod_desc11,
"
"			v_acct_plnt,
"
"			cr1.schd_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			0,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			0,
"
"			cr1.scln_store_id,
"
"			cr1.store_desc1,
"
"			NULL,
"
"			NULL,
"
"			cr1.stk_cnt_qty,
"
"			cr1.scln_unit_cost,
"
"			'IC',
"
"			'ICM',
"
"			'Inventory Count #('||cr1.schd_ord_no||')',
"
"			'Inventory Count #('||cr1.schd_ord_no||'/'||cr1.scln_seq_no||')',
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			cr1.scln_prod_cls,
"
"			func_find_class_desc(p_bu,cr1.scln_prod_cls,p_lang),
"
"			cr1.scln_prod_subcls,
"
"			func_find_subclass_desc(p_bu,cr1.scln_prod_subcls,p_lang),
"
"			p_user
"
"		       );
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   p_plnt,
"
"				   cr1.schd_plnt_loc_id,
"
"				   'IV',
"
"				   cr1.scln_store_id,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct
"
"				  );
"
"
"
"	  v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						      v_acct_lvl2,
"
"						      v_acct_lvl3,
"
"						      v_acct_lvl4,
"
"						      v_acct_lvl_prj,
"
"						      v_acct,
"
"						      v_acct_plnt,
"
"						      p_lang
"
"						     );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"			cr1.schd_plnt,
"
"			'IC',
"
"			'IC',
"
"			NULL,
"
"			cr1.schd_ord_no,
"
"			cr1.scln_seq_no,
"
"			cr1.scln_prod_id,
"
"			cr1.scln_prod_rev,
"
"			cr1.prod_desc11,
"
"			v_acct_plnt,
"
"			cr1.schd_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			0,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			0,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			cr1.scln_store_id,
"
"			cr1.store_desc1,
"
"			NULL,
"
"			NULL,
"
"			cr1.stk_cnt_qty,
"
"			cr1.scln_unit_cost,
"
"			'IC',
"
"			'ICM',
"
"			'Inventory Count #('||cr1.schd_ord_no||')',
"
"			'Inventory Count #('||cr1.schd_ord_no||'/'||cr1.scln_seq_no||')',
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			cr1.scln_prod_cls,
"
"			func_find_class_desc(p_bu,cr1.scln_prod_cls,p_lang),
"
"			cr1.scln_prod_subcls,
"
"			func_find_subclass_desc(p_bu,cr1.scln_prod_subcls,p_lang),
"
"			p_user
"
"		       );
"
"	  DBMS_OUTPUT.PUT_LINE('credit Journals - End');
"
"
"
"
"
"        ELSE
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Debit Journals - Start');
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   p_plnt,
"
"				   cr1.schd_plnt_loc_id,
"
"				   'IV',
"
"				   cr1.scln_store_id,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct
"
"				  );
"
"
"
"	  v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						      v_acct_lvl2,
"
"						      v_acct_lvl3,
"
"						      v_acct_lvl4,
"
"						      v_acct_lvl_prj,
"
"						      v_acct,
"
"						      v_acct_plnt,
"
"						      p_lang
"
"						     );
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"			cr1.schd_plnt,
"
"			'IC',
"
"			'IC',
"
"			NULL,
"
"			cr1.schd_ord_no,
"
"			cr1.scln_seq_no,
"
"			cr1.scln_prod_id,
"
"			cr1.scln_prod_rev,
"
"			cr1.prod_desc11,
"
"			v_acct_plnt,
"
"			cr1.schd_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			0,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			0,
"
"			cr1.scln_store_id,
"
"			cr1.store_desc1,
"
"			NULL,
"
"			NULL,
"
"			cr1.stk_cnt_qty,
"
"			cr1.scln_unit_cost,
"
"			'IC',
"
"			'ICM',
"
"			'Inventory Count #('||cr1.schd_ord_no||')',
"
"			'Inventory Count #('||cr1.schd_ord_no||'/'||cr1.scln_seq_no||')',
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			cr1.scln_prod_cls,
"
"			func_find_class_desc(p_bu,cr1.scln_prod_cls,p_lang),
"
"			cr1.scln_prod_subcls,
"
"			func_find_subclass_desc(p_bu,cr1.scln_prod_subcls,p_lang),
"
"			p_user
"
"		       );
"
"	  DBMS_OUTPUT.PUT_LINE('Debit Journals - End');
"
"
"
"	  DBMS_OUTPUT.PUT_LINE('Credit Journals - Start');
"
"
"
"          proc_find_store_gl_accts(p_bu,
"
"                                   p_plnt,
"
"				   cr1.schd_plnt_loc_id,
"
"				   'ST',
"
"				   cr1.scln_store_id,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   NULL,
"
"				   v_acct_plnt,
"
"				   v_acct_plnt_loc,
"
"				   v_acct_lvl1,
"
"				   v_acct_lvl2,
"
"				   v_acct_lvl3,
"
"				   v_acct_lvl4,
"
"				   v_acct_lvl5,
"
"				   v_acct_lvl6,
"
"				   v_acct_lvl_prj,
"
"				   v_acct_cc_code,
"
"				   v_acct,
"
"				   p_sub_plnt => v_sub_plnt
"
"				  );
"
"
"
"	  v_acct_desc := func_find_gl_level_acct_desc(p_bu,
"
"                                                      v_acct_lvl1,
"
"						      v_acct_lvl2,
"
"						      v_acct_lvl3,
"
"						      v_acct_lvl4,
"
"						      v_acct_lvl_prj,
"
"						      v_acct,
"
"						      v_acct_plnt,
"
"						      p_lang
"
"						     );
"
"
"
"          proc_ins_jrnl(p_bu,
"
"                        v_jrnl_trans_no,
"
"			cr1.schd_plnt,
"
"			'IC',
"
"			'IC',
"
"			NULL,
"
"			cr1.schd_ord_no,
"
"			cr1.scln_seq_no,
"
"			cr1.scln_prod_id,
"
"			cr1.scln_prod_rev,
"
"			cr1.prod_desc11,
"
"			v_acct_plnt,
"
"			cr1.schd_plnt_loc_id,
"
"			v_acct_lvl1,
"
"			v_acct_lvl2,
"
"			v_acct_lvl3,
"
"			v_acct_lvl4,
"
"			v_acct_lvl5,
"
"			v_acct_lvl6,
"
"			v_acct_lvl_prj,
"
"			v_acct_cc_code,
"
"			v_acct,
"
"			v_acct_desc,
"
"			v_vou_date,
"
"			v_vou_year,
"
"			v_vou_period,
"
"			0,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			0,
"
"			ROUND(cr1.stk_cnt_qty * cr1.scln_unit_cost,v_rnd),
"
"			cr1.scln_store_id,
"
"			cr1.store_desc1,
"
"			NULL,
"
"			NULL,
"
"			cr1.stk_cnt_qty,
"
"			cr1.scln_unit_cost,
"
"			'IC',
"
"			'ICM',
"
"			'Inventory Count #('||cr1.schd_ord_no||')',
"
"			'Inventory Count #('||cr1.schd_ord_no||'/'||cr1.scln_seq_no||')',
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			NULL,
"
"			cr1.scln_prod_cls,
"
"			func_find_class_desc(p_bu,cr1.scln_prod_cls,p_lang),
"
"			cr1.scln_prod_subcls,
"
"			func_find_subclass_desc(p_bu,cr1.scln_prod_subcls,p_lang),
"
"			p_user
"
"		       );
"
"          DBMS_OUTPUT.PUT_LINE('Credit Journals - End');
"
"	END IF;
"
"
"
"      END LOOP;
"
"
"
"    END IF;
"
"    DBMS_OUTPUT.PUT_LINE('proc_ins_stk_cnt_jrnl - End');
"
"  END;
"
"
"
"BEGIN
"
"  NULL;
"
"END pkg_perpetual_journals;"
/
