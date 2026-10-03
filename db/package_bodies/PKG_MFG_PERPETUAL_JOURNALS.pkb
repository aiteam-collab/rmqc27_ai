CREATE OR REPLACE
"PACKAGE BODY pkg_mfg_perpetual_journals
"
"IS
"
"	PROCEDURE proc_delete_journals(p_bu				VARCHAR2,
"
"								   p_plnt	        VARCHAR2,
"
"								   p_trans_no	    VARCHAR2,
"
"								   p_vou_type	    VARCHAR2,
"
"								   p_appl           VARCHAR2
"
"								   )
"
"	IS
"
"	BEGIN
"
"
"
"		DELETE
"
"		  FROM appl_journals
"
"		 WHERE aj_bu				= p_bu
"
"		   AND aj_plnt 				= p_plnt
"
"		   AND aj_vou_no			= p_trans_no
"
"		   AND aj_vou_type		  	= p_vou_type
"
"		   AND aj_appl				= p_appl;
"
"
"
"	END	proc_delete_journals;
"
"
"
"	PROCEDURE proc_ins_oprn_comp_wh(
"
"									p_bu			VARCHAR2,
"
"								    p_plnt			VARCHAR2,
"
"								    p_plnt_loc_id		VARCHAR2,
"
"								    p_trans_no		VARCHAR2,
"
"								    p_doc_date		DATE,
"
"								    p_prod_id		VARCHAR2,
"
"								    p_prod_rev		NUMBER,
"
"								    p_prod_ord_no		VARCHAR2,
"
"								    p_comp_qty		NUMBER,
"
"								    p_user			VARCHAR2,
"
"								    p_lang			NUMBER
"
"								    )
"
"	IS
"
"	CURSOR c_mat_cons
"
"    IS
"
"    SELECT ptmc_seq_no,
"
"	       ptmc_prod_id,
"
"		   ptmc_prod_rev,
"
"		   ptmc_store_id,
"
"  	       ptmc_cons_qty,
"
"		   ptmc_unit_cost,
"
"		   (ptmc_cons_qty * ptmc_unit_cost) ptmc_ext_cost
"
"      FROM prod_transfer_mat_cons
"
"     WHERE ptmc_bu = p_bu
"
"       AND ptmc_plnt = p_plnt
"
"       AND ptmc_trans_no = p_trans_no
"
"       AND ptmc_cons_qty > 0
"
"     ORDER BY ptmc_seq_no;
"
"
"
"	CURSOR c_mach
"
"	IS
"
"	SELECT ptru_units,
"
"	       ptru_hrly_rate,
"
"		   ptru_res_id,
"
"		   ext_rate
"
"	  FROM(
"
"    SELECT ptru_units      ,
"
"		   ptru_hrly_rate  ,
"
"		   ptru_res_id,
"
"		   ptru_extend_rate ext_rate
"
"	  FROM prod_transfer_res_usage,
"
"		   mfg_resources,
"
"		   mfg_res_groups
"
"	 WHERE ptru_bu = mfgr_bu
"
"	   AND ptru_plnt = mfgr_plnt
"
"	   AND ptru_res_id = mfgr_res_id
"
"	   AND mfgr_bu = mfgrg_bu
"
"	   AND mfgr_plnt = mfgrg_plnt
"
"	   AND mfgr_group_id = mfgrg_grp_id
"
"	   AND ptru_bu = p_bu
"
"	   AND ptru_plnt = p_plnt
"
"	   AND ptru_trans_no = p_trans_no
"
"	   --AND func_find_resgrp_charge_type(mfgrg_bu,mfgrg_plnt,mfgrg_grp_id) = 'A'
"
"			);
"
"
"
"	CURSOR c_store_acct(c_store_id VARCHAR2)
"
"     IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = p_plnt
"
"       AND store_id = c_store_id;
"
"
"
"	CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"	  IS
"
"	SELECT mfgr_acct       ,
"
"		   mfgr_acct_plnt  ,
"
"		   mfgr_prj_lvl    ,
"
"		   mfgr_lvl1       ,
"
"		   mfgr_lvl2       ,
"
"		   mfgr_lvl3       ,
"
"		   mfgr_lvl4
"
"	  FROM mfg_resources
"
"	 WHERE mfgr_bu = p_bu
"
"	   AND mfgr_plnt = p_plnt
"
"	   AND mfgr_res_id = c_mach_id;
"
"
"
"	CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"	   IS
"
"	SELECT mfgrg_ac_lvl1,
"
"		   mfgrg_ac_lvl2,
"
"		   mfgrg_ac_lvl3,
"
"		   mfgrg_ac_lvl4,
"
"		   mfgrg_current_acct ,
"
"		   mfgrg_ac_lvl_prj,
"
"		   mfgrg_acct_plnt
"
"	  FROM mfg_res_groups,
"
"		   mfg_resources
"
"	 WHERE mfgrg_bu = mfgr_bu
"
"	   AND mfgrg_plnt = mfgr_plnt
"
"	   AND mfgrg_grp_id = mfgr_group_id
"
"	   AND mfgrg_bu = p_bu
"
"	   AND mfgrg_plnt = p_plnt
"
"	   AND mfgr_bu = p_bu
"
"	   AND mfgr_plnt = p_plnt
"
"	   AND mfgr_res_id = c_mach_id;
"
"
"
"
"
"	CURSOR c_oh
"
"	  IS
"
"	SELECT *
"
"	  FROM prod_transfer_process,
"
"	       oh_basis_subelement
"
"	 WHERE ptp_bu  = ohbs_bu
"
"	   AND ptp_plnt = ohbs_plnt
"
"	   AND ptp_oprn_id = ohbs_oprn_id
"
"	   AND ohbs_bu = p_bu
"
"	   AND ohbs_plnt = p_plnt
"
"	   AND ohbs_prod_id = p_prod_id
"
"	   AND ohbs_prod_rev = p_prod_rev
"
"	   AND ohbs_status = 'A'
"
"	   AND ohbs_basis = 'A'
"
"	   AND ptp_bu = p_bu
"
"	   AND ptp_plnt = p_plnt
"
"	   AND ptp_trans_no = p_trans_no;
"
"
"
"	 CURSOR c_oh_acct(c_element_id VARCHAR2)
"
"	   IS
"
"	 SELECT moa_acct
"
"	   FROM mfg_oh_accts
"
"	  WHERE moa_bu = p_bu
"
"		AND moa_cs_elmnt_id = c_element_id;
"
"
"
"	r_store_acct			c_store_acct%ROWTYPE;
"
"    r_res_acct				c_res_acct%ROWTYPE;
"
"    r_resgrp_acct			c_resgrp_acct%ROWTYPE;
"
"    r_oh					c_oh%ROWTYPE;
"
"    r_oh_cost				c_oh_acct%ROWTYPE;
"
"
"
"    v_material_cost			NUMBER(17,5);
"
"    v_mach_cost				NUMBER(17,5);
"
"    v_oh_cost				NUMBER(17,5);
"
"    v_total_cost			NUMBER(17,5);
"
"    v_oc_store				VARCHAR2(10);
"
"    v_dbt_acct				stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl			VARCHAR2(10);
"
"    v_dbt_lvl1				VARCHAR2(4);
"
"    v_dbt_lvl2				VARCHAR2(4);
"
"    v_dbt_lvl3				VARCHAR2(4);
"
"    v_dbt_lvl4				VARCHAR2(4);
"
"    v_dbt_lvl5				VARCHAR2(4);
"
"    v_dbt_lvl6				VARCHAR2(4);
"
"    v_dbt_acct_plnt			VARCHAR2(10);
"
"    v_crd_lvl1				VARCHAR2(4);
"
"    v_crd_lvl2				VARCHAR2(4);
"
"    v_crd_lvl3				VARCHAR2(4);
"
"    v_crd_lvl4				VARCHAR2(4);
"
"    v_crd_lvl5				VARCHAR2(20);
"
"    v_crd_lvl6				VARCHAR2(20);
"
"    v_crd_acct_plnt			VARCHAR2(10);
"
"    v_crd_acct				stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl			VARCHAR2(10);
"
"    v_jrnl_trans_no			VARCHAR2(15);
"
"    v_jrnl_trans_seq_no		NUMBER;
"
"    v_crd_cc_code			VARCHAR2(200);
"
"    v_dbt_cc_code		VARCHAR2(200);
"
"    v_dbt_plnt_loc_id		VARCHAR2(10);
"
"    v_crd_plnt_loc_id		VARCHAR2(10);
"
"
"
"
"
"	BEGIN
"
"
"
"	v_material_cost := 0;
"
"
"
"  	FOR r_cons IN c_mat_cons
"
"  	LOOP
"
"  		v_material_cost := v_material_cost + ROUND(r_cons.ptmc_ext_cost,func_find_appl_rnddigit(p_bu));
"
"  	END LOOP;
"
"
"
"  	v_mach_cost := 0;
"
"
"
"  	FOR r_mach_cost IN c_mach
"
"  	LOOP
"
"  		v_mach_cost := v_mach_cost + r_mach_cost.ext_rate;
"
"  	END LOOP;
"
"
"
"  	v_oh_cost := 0;
"
"
"
"  	FOR r_oh_cost IN c_oh
"
"  	LOOP
"
"  		v_oh_cost := v_oh_cost + (r_oh.ohbs_rate * p_comp_qty);
"
"
"
"  	END LOOP;
"
"
"
"	v_total_cost := v_material_cost + v_mach_cost + v_oh_cost;
"
"
"
"	v_oc_store := func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'O');
"
"
"
"	OPEN c_store_acct(v_oc_store);
"
"  	FETCH c_store_acct INTO r_store_acct;
"
"		IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"		   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"		ELSE
"
"		   v_dbt_acct := r_store_acct.store_gl_acct;
"
"		END IF;
"
"  	CLOSE c_store_acct;
"
"
"
"
"
"		proc_find_cost_center(
"
"							  p_bu    ,
"
"							  p_plnt  ,
"
"							  NULL,
"
"							  v_dbt_acct,
"
"							  NULL ,
"
"							  NULL ,
"
"							  NULL ,
"
"							  NULL ,
"
"							  v_dbt_lvl1,
"
"							  v_dbt_lvl2,
"
"							  v_dbt_lvl3,
"
"							  v_dbt_lvl4,
"
"							  v_dbt_lvl5,
"
"							  v_dbt_lvl6,
"
"							  v_dbt_prj_lvl,
"
"							  v_dbt_acct_plnt,
"
"							  v_dbt_cc_code,
"
"							  v_dbt_plnt_loc_id
"
"							  );
"
"
"
"
"
"	IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"		OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"	   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"	END IF;
"
"
"
"
"
"		v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"		SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"		  INTO v_jrnl_trans_seq_no
"
"		  FROM appl_journals
"
"		 WHERE aj_bu = p_bu
"
"		   AND aj_plnt = p_plnt
"
"		   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"		INSERT INTO appl_journals(
"
"								aj_bu                     ,
"
"								aj_plnt                   ,
"
"								aj_jrnl_trns_no           ,
"
"								aj_jrnl_trns_seq_no       ,
"
"								aj_acctg_plnt             ,
"
"								aj_gl_lvl1                ,
"
"								aj_gl_lvl2                ,
"
"								aj_gl_lvl3                ,
"
"								aj_gl_lvl4                ,
"
"								aj_gl_acct                ,
"
"								aj_gl_acct_desc           ,
"
"								aj_reference1             ,
"
"								aj_reference2             ,
"
"								aj_fc_db_amt              ,
"
"								aj_fc_cr_amt              ,
"
"								aj_bc_db_amt              ,
"
"								aj_bc_cr_amt              ,
"
"								aj_db_ex_rate             ,
"
"								aj_cr_ex_rate             ,
"
"								aj_jrnl_date              ,
"
"								aj_jrnl_year              ,
"
"								aj_jrnl_period            ,
"
"								aj_store_id               ,
"
"								aj_store_name             ,
"
"								aj_cls_id                 ,
"
"								aj_cls_desc               ,
"
"								aj_sub_cls_id             ,
"
"								aj_sub_cls_desc           ,
"
"								aj_prod_id                ,
"
"								aj_prod_rev               ,
"
"								aj_prod_desc1             ,
"
"								aj_tc_id                  ,
"
"								aj_tc_desc                ,
"
"								aj_suplr_id               ,
"
"								aj_suplr_name             ,
"
"								aj_cust_id                ,
"
"								aj_cust_name              ,
"
"								aj_area_id                ,
"
"								aj_area_desc              ,
"
"								aj_terr_id                ,
"
"								aj_terr_desc              ,
"
"								aj_bank_id                ,
"
"								aj_bank_name              ,
"
"								aj_fa_grp_id              ,
"
"								aj_fa_grp_desc            ,
"
"								aj_fa_id                  ,
"
"								aj_fa_desc                ,
"
"								aj_dept_id                ,
"
"								aj_dept_desc              ,
"
"								aj_proj_id                ,
"
"								aj_proj_desc              ,
"
"								aj_res_grp_id             ,
"
"								aj_res_grp_desc           ,
"
"								aj_res_id                 ,
"
"								aj_res_desc               ,
"
"								aj_emp_id                 ,
"
"								aj_emp_name               ,
"
"								aj_trans_qty              ,
"
"								aj_unit_cost              ,
"
"								aj_unit_price             ,
"
"								aj_source_doc_mode        ,
"
"								aj_appl                   ,
"
"								aj_status                 ,
"
"								aj_jrnl_no                ,
"
"								aj_cre_by                 ,
"
"								aj_cre_date               ,
"
"								aj_upd_by                 ,
"
"								aj_upd_date               ,
"
"								aj_offset_doc_no          ,
"
"								aj_vou_type               ,
"
"								aj_vou_pfx                ,
"
"								aj_vou_no                 ,
"
"								aj_vou_line_no            ,
"
"								aj_ref_no                 ,
"
"								aj_ref_date,
"
"								aj_gl_lvl_prj
"
"								)
"
"						 VALUES(
"
"								p_bu                     ,
"
"								p_plnt                   ,
"
"								v_jrnl_trans_no           ,
"
"								v_jrnl_trans_seq_no       ,
"
"								v_dbt_acct_plnt             ,
"
"								v_dbt_lvl1                ,
"
"								v_dbt_lvl2                ,
"
"								v_dbt_lvl3                ,
"
"								v_dbt_lvl4                ,
"
"								v_dbt_acct                ,
"
"								func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"								'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"								'PRODUCTION COMPLETION'             ,
"
"								ROUND(v_total_cost,func_find_appl_rnddigit(p_bu))              ,
"
"								0              ,
"
"								ROUND(v_total_cost,func_find_appl_rnddigit(p_bu)) ,
"
"								0              ,
"
"								1             ,
"
"								1             ,
"
"								p_doc_date              ,
"
"								func_find_year(p_bu,p_doc_date)              ,
"
"								func_find_period(p_bu,p_doc_date)            ,
"
"								v_oc_store               ,
"
"								func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"								func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"								func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"								func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"								func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"								p_prod_id               ,
"
"								p_prod_rev              ,
"
"								func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"								NULL                  ,
"
"								NULL                ,
"
"								NULL               ,
"
"								NULL             ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL              ,
"
"								NULL            ,
"
"								NULL                  ,
"
"								NULL                ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL             ,
"
"								NULL           ,
"
"								NULL                 ,
"
"								NULL               ,
"
"								NULL                 ,
"
"								NULL               ,
"
"								p_comp_qty              ,
"
"								v_total_cost/p_comp_qty              ,
"
"								v_total_cost/p_comp_qty           ,
"
"								NULL        ,
"
"								'SFM'                   ,
"
"								'N'                 ,
"
"								NULL                ,
"
"								p_user                 ,
"
"								SYSDATE               ,
"
"								NULL                 ,
"
"								NULL               ,
"
"								NULL          ,
"
"								'PCM'               ,
"
"								NULL                ,
"
"								p_trans_no                 ,
"
"								1            ,
"
"								NULL                 ,
"
"								NULL,
"
"								v_dbt_prj_lvl
"
"								);
"
"
"
"			FOR r_cons IN c_mat_cons
"
"			LOOP
"
"					OPEN c_store_acct(r_cons.ptmc_store_id);
"
"					FETCH c_store_acct INTO r_store_acct;
"
"					IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"						RAISE_APPLICATION_ERROR(-20002,'APM');
"
"					ELSE
"
"					   v_crd_acct := r_store_acct.store_gl_acct;
"
"					END IF;
"
"					CLOSE c_store_acct;
"
"
"
"
"
"					proc_find_cost_center(
"
"										p_bu    ,
"
"										p_plnt  ,
"
"										NULL,
"
"										v_crd_acct,
"
"										NULL ,
"
"										NULL ,
"
"										NULL ,
"
"										NULL ,
"
"										v_crd_lvl1,
"
"										v_crd_lvl2,
"
"										v_crd_lvl3,
"
"										v_crd_lvl4,
"
"										v_crd_lvl5,
"
"										v_crd_lvl6,
"
"										v_crd_prj_lvl,
"
"										v_crd_acct_plnt,
"
"										v_crd_cc_code,
"
"										v_crd_plnt_loc_id
"
"										);
"
"
"
"
"
"					IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"						OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"					   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"					END IF;
"
"
"
"
"
"								SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"								  INTO v_jrnl_trans_seq_no
"
"								  FROM appl_journals
"
"								 WHERE aj_bu = p_bu
"
"								   AND aj_plnt = p_plnt
"
"								   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"								INSERT INTO appl_journals(
"
"														aj_bu                     ,
"
"														aj_plnt                   ,
"
"														aj_jrnl_trns_no           ,
"
"														aj_jrnl_trns_seq_no       ,
"
"														aj_acctg_plnt             ,
"
"														aj_gl_lvl1                ,
"
"														aj_gl_lvl2                ,
"
"														aj_gl_lvl3                ,
"
"														aj_gl_lvl4                ,
"
"														aj_gl_acct                ,
"
"														aj_gl_acct_desc           ,
"
"														aj_reference1             ,
"
"														aj_reference2             ,
"
"														aj_fc_db_amt              ,
"
"														aj_fc_cr_amt              ,
"
"														aj_bc_db_amt              ,
"
"														aj_bc_cr_amt              ,
"
"														aj_db_ex_rate             ,
"
"														aj_cr_ex_rate             ,
"
"														aj_jrnl_date              ,
"
"														aj_jrnl_year              ,
"
"														aj_jrnl_period            ,
"
"														aj_store_id               ,
"
"														aj_store_name             ,
"
"														aj_cls_id                 ,
"
"														aj_cls_desc               ,
"
"														aj_sub_cls_id             ,
"
"														aj_sub_cls_desc           ,
"
"														aj_prod_id                ,
"
"														aj_prod_rev               ,
"
"														aj_prod_desc1             ,
"
"														aj_tc_id                  ,
"
"														aj_tc_desc                ,
"
"														aj_suplr_id               ,
"
"														aj_suplr_name             ,
"
"														aj_cust_id                ,
"
"														aj_cust_name              ,
"
"														aj_area_id                ,
"
"														aj_area_desc              ,
"
"														aj_terr_id                ,
"
"														aj_terr_desc              ,
"
"														aj_bank_id                ,
"
"														aj_bank_name              ,
"
"														aj_fa_grp_id              ,
"
"														aj_fa_grp_desc            ,
"
"														aj_fa_id                  ,
"
"														aj_fa_desc                ,
"
"														aj_dept_id                ,
"
"														aj_dept_desc              ,
"
"														aj_proj_id                ,
"
"														aj_proj_desc              ,
"
"														aj_res_grp_id             ,
"
"														aj_res_grp_desc           ,
"
"														aj_res_id                 ,
"
"														aj_res_desc               ,
"
"														aj_emp_id                 ,
"
"														aj_emp_name               ,
"
"														aj_trans_qty              ,
"
"														aj_unit_cost              ,
"
"														aj_unit_price             ,
"
"														aj_source_doc_mode        ,
"
"														aj_appl                   ,
"
"														aj_status                 ,
"
"														aj_jrnl_no                ,
"
"														aj_cre_by                 ,
"
"														aj_cre_date               ,
"
"														aj_upd_by                 ,
"
"														aj_upd_date               ,
"
"														aj_offset_doc_no          ,
"
"														aj_vou_type               ,
"
"														aj_vou_pfx                ,
"
"														aj_vou_no                 ,
"
"														aj_vou_line_no            ,
"
"														aj_ref_no                 ,
"
"														aj_ref_date,
"
"														aj_gl_lvl_prj
"
"														)
"
"												  VALUES(
"
"														p_bu                     ,
"
"														p_plnt                   ,
"
"														v_jrnl_trans_no           ,
"
"														v_jrnl_trans_seq_no       ,
"
"														v_crd_acct_plnt             ,
"
"														v_crd_lvl1                ,
"
"														v_crd_lvl2                ,
"
"														v_crd_lvl3                ,
"
"														v_crd_lvl4                ,
"
"														v_crd_acct                ,
"
"														func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"														'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"														'PRODUCTION '             ,
"
"														0              ,
"
"														ROUND((r_cons.ptmc_cons_qty * r_cons.ptmc_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"														0 ,
"
"														ROUND((r_cons.ptmc_cons_qty * r_cons.ptmc_unit_cost),func_find_appl_rnddigit(p_bu))             ,
"
"														1             ,
"
"														1             ,
"
"														p_doc_date              ,
"
"														func_find_year(p_bu,p_doc_date)              ,
"
"														func_find_period(p_bu,p_doc_date)            ,
"
"														r_cons.ptmc_store_id               ,
"
"														func_find_store_desc(p_bu,r_cons.ptmc_store_id,p_lang)             ,
"
"														func_find_product_class(p_bu,p_plnt,r_cons.ptmc_prod_id,r_cons.ptmc_prod_rev)                 ,
"
"														func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_cons.ptmc_prod_id,r_cons.ptmc_prod_rev) ,p_lang)               ,
"
"														func_find_product_subclass(p_bu,p_plnt,r_cons.ptmc_prod_id,r_cons.ptmc_prod_rev)             ,
"
"														func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_cons.ptmc_prod_id,r_cons.ptmc_prod_rev) ,p_lang)           ,
"
"														r_cons.ptmc_prod_id              ,
"
"														r_cons.ptmc_prod_rev               ,
"
"														func_find_prod_desc(p_bu,r_cons.ptmc_prod_id,r_cons.ptmc_prod_rev,p_lang)             ,
"
"														NULL                  ,
"
"														NULL                ,
"
"														NULL               ,
"
"														NULL             ,
"
"														NULL                ,
"
"														NULL              ,
"
"														NULL                ,
"
"														NULL              ,
"
"														NULL                ,
"
"														NULL              ,
"
"														NULL                ,
"
"														NULL              ,
"
"														NULL              ,
"
"														NULL            ,
"
"														NULL                  ,
"
"														NULL                ,
"
"														NULL                ,
"
"														NULL              ,
"
"														NULL                ,
"
"														NULL              ,
"
"														NULL             ,
"
"														NULL           ,
"
"														NULL                 ,
"
"														NULL               ,
"
"														NULL                 ,
"
"														NULL               ,
"
"														r_cons.ptmc_cons_qty             ,
"
"														r_cons.ptmc_unit_cost              ,
"
"														r_cons.ptmc_unit_cost            ,
"
"														NULL        ,
"
"														'SFM'                   ,
"
"														'N'                 ,
"
"														NULL                ,
"
"														p_user                 ,
"
"														SYSDATE               ,
"
"														NULL                 ,
"
"														NULL               ,
"
"														NULL          ,
"
"														'PCM'               ,
"
"														NULL                ,
"
"														p_trans_no                 ,
"
"														1            ,
"
"														NULL                 ,
"
"														NULL,
"
"														v_crd_prj_lvl
"
"														 );
"
"
"
"
"
"
"
"			END LOOP r_cons;
"
"
"
"			FOR r_mach_cost IN c_mach
"
"			LOOP
"
"
"
"				OPEN c_res_acct(r_mach_cost.ptru_res_id);
"
"				FETCH c_res_acct INTO r_res_acct;
"
"
"
"					IF c_res_acct%NOTFOUND OR
"
"						r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"						r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"						OPEN c_resgrp_acct(r_mach_cost.ptru_res_id);
"
"						FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"							IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"									   OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"									   OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"								raise_application_error(-20002,'APM');
"
"							ELSE
"
"
"
"								v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"								v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"								v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"								v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"								v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"								v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"								v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"							END IF;
"
"						CLOSE c_resgrp_acct;
"
"					ELSE
"
"
"
"								v_crd_acct := r_res_acct.mfgr_acct;
"
"								v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"								v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"								v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"								v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"								v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"								v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"					END IF;
"
"
"
"				CLOSE c_res_acct;
"
"
"
"
"
"
"
"					SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"					  INTO v_jrnl_trans_seq_no
"
"					  FROM appl_journals
"
"					 WHERE aj_bu = p_bu
"
"					   AND aj_plnt = p_plnt
"
"					   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"					INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"									 VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_crd_acct_plnt             ,
"
"											v_crd_lvl1                ,
"
"											v_crd_lvl2                ,
"
"											v_crd_lvl3                ,
"
"											v_crd_lvl4                ,
"
"											v_crd_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION '             ,
"
"											0              ,
"
"											ROUND(r_mach_cost.ext_rate,func_find_appl_rnddigit(p_bu))              ,
"
"											0 ,
"
"											ROUND(r_mach_cost.ext_rate,func_find_appl_rnddigit(p_bu))             ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL,
"
"											NULL            ,
"
"											NULL    ,
"
"											NULL           ,
"
"											NULL              ,
"
"											NULL           ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty             ,
"
"											(r_mach_cost.ext_rate/p_comp_qty)              ,
"
"											(r_mach_cost.ext_rate/p_comp_qty)           ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_crd_prj_lvl
"
"											 );
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
"
"
"			END LOOP c_mach;
"
"
"
"			FOR r_oh IN c_oh
"
"			LOOP
"
"
"
"
"
"				OPEN c_oh_acct(r_oh.ohbs_sub_elmnt);
"
"				FETCH c_oh_acct INTO r_oh_cost;
"
"					IF c_oh_acct%NOTFOUND OR r_oh_cost.moa_acct IS NULL THEN
"
"						RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"					ELSE
"
"						v_crd_acct := r_oh_cost.moa_acct;
"
"					END IF;
"
"				CLOSE c_oh_acct;
"
"
"
"
"
"					proc_find_cost_center(
"
"										p_bu    ,
"
"										p_plnt  ,
"
"										NULL,
"
"										v_crd_acct,
"
"										NULL ,
"
"										NULL ,
"
"										NULL ,
"
"										NULL ,
"
"										v_crd_lvl1,
"
"										v_crd_lvl2,
"
"										v_crd_lvl3,
"
"										v_crd_lvl4,
"
"										v_crd_lvl5,
"
"										v_crd_lvl6,
"
"										v_crd_prj_lvl,
"
"										v_crd_acct_plnt,
"
"										v_crd_cc_code,
"
"										v_crd_plnt_loc_id
"
"										);
"
"
"
"								IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL OR v_crd_lvl4 IS NULL
"
"								   OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL THEN
"
"								      raise_application_error(-20002,'APM');
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
"
"
"
"
"					SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"					  INTO v_jrnl_trans_seq_no
"
"					  FROM appl_journals
"
"					 WHERE aj_bu = p_bu
"
"					   AND aj_plnt = p_plnt
"
"					   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"				    INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"									 VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_crd_acct_plnt             ,
"
"											v_crd_lvl1                ,
"
"											v_crd_lvl2                ,
"
"											v_crd_lvl3                ,
"
"											v_crd_lvl4                ,
"
"											v_crd_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION '             ,
"
"											0              ,
"
"											ROUND((r_oh.ohbs_rate * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"											0 ,
"
"											ROUND((r_oh.ohbs_rate * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL,
"
"											NULL            ,
"
"											NULL    ,
"
"											NULL           ,
"
"											NULL              ,
"
"											NULL           ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty             ,
"
"											r_oh.ohbs_rate              ,
"
"											r_oh.ohbs_rate          ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_crd_prj_lvl
"
"											);
"
"
"
"			END LOOP c_oh;
"
"
"
"	END	proc_ins_oprn_comp_wh;
"
"
"
"	PROCEDURE proc_ins_opcinsp_jrnl(
"
"									p_bu			VARCHAR2,
"
"									p_plnt			VARCHAR2,
"
"									p_plnt_loc_id		VARCHAR2,
"
"									p_trans_no		VARCHAR2,
"
"									p_doc_date		DATE,
"
"									p_prod_id		VARCHAR2,
"
"									p_prod_rev		NUMBER,
"
"									p_prod_ord_no	VARCHAR2,
"
"									p_comp_qty		NUMBER,
"
"									p_tarsf_code	VARCHAR2,
"
"									p_user			VARCHAR2,
"
"									p_lang			NUMBER
"
"									)
"
"	IS
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = p_plnt
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c_prod_trans
"
"      IS
"
"    SELECT *
"
"      FROM prod_transfer
"
"     WHERE pt_bu = p_bu
"
"       AND pt_plnt = p_plnt
"
"       AND pt_trans_no = p_trans_no;
"
"
"
"
"
"    v_total_cost		NUMBER(17,5);
"
"    v_unit_cost			NUMBER(17,5);
"
"    v_oc_store			VARCHAR2(10);
"
"    v_insp_store		VARCHAR2(10);
"
"    v_dbt_acct			stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl		VARCHAR2(10);
"
"    v_dbt_lvl1			VARCHAR2(4);
"
"    v_dbt_lvl2			VARCHAR2(4);
"
"    v_dbt_lvl3			VARCHAR2(4);
"
"    v_dbt_lvl4			VARCHAR2(4);
"
"    v_dbt_acct_plnt		VARCHAR2(10);
"
"    v_crd_lvl1			VARCHAR2(4);
"
"    v_crd_lvl2			VARCHAR2(4);
"
"    v_crd_lvl3			VARCHAR2(4);
"
"    v_crd_lvl4			VARCHAR2(4);
"
"    v_crd_acct_plnt		VARCHAR2(10);
"
"    v_crd_acct			stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl		VARCHAR2(10);
"
"    v_jrnl_trans_no		VARCHAR2(15);
"
"    v_jrnl_trans_seq_no	NUMBER;
"
"    v_sf_code			VARCHAR2(50);
"
"    v_sys_ls_no			NUMBER(15);
"
"
"
"    r_store_acct		c_store_acct%ROWTYPE;
"
"    r_prod_trans		c_prod_trans%ROWTYPE;
"
"    v_crd_cc_code		VARCHAR2(200);
"
"    v_crd_plnt_loc_id		VARCHAR2(10);
"
"    v_dbt_lvl5			VARCHAR2(20);
"
"    v_dbt_lvl6			VARCHAR2(20);
"
"    v_crd_lvl5			VARCHAR2(20);
"
"    v_crd_lvl6			VARCHAR2(20);
"
"    v_dbt_cc_code		VARCHAR2(200);
"
"    v_dbt_plnt_loc_id		VARCHAR2(10);
"
"
"
"
"
"
"
"	BEGIN
"
"
"
"  		v_oc_store := func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'O');
"
"  		v_insp_store := func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'Q');
"
"
"
"  		OPEN c_store_acct(v_insp_store);
"
"  		FETCH c_store_acct INTO r_store_acct;
"
"  		IF c_store_acct%NOTFOUND or r_store_acct.store_gl_acct IS NULL THEN
"
"  		   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"
"
"  		ELSE
"
"  		  v_dbt_acct := r_store_acct.store_gl_acct;
"
"  		END IF;
"
"
"
"  		CLOSE c_store_acct;
"
"
"
"  		proc_find_cost_center(
"
"							  p_bu    ,
"
"							  p_plnt  ,
"
"							  NULL,
"
"							  v_dbt_acct,
"
"							  NULL ,
"
"							  NULL ,
"
"							  NULL ,
"
"							  NULL ,
"
"							  v_dbt_lvl1,
"
"							  v_dbt_lvl2,
"
"							  v_dbt_lvl3,
"
"							  v_dbt_lvl4,
"
"							  v_dbt_lvl5,
"
"							  v_dbt_lvl6,
"
"							  v_dbt_prj_lvl,
"
"							  v_dbt_acct_plnt,
"
"							  v_dbt_cc_code,
"
"							  v_dbt_plnt_loc_id
"
"							  );
"
"
"
"
"
"			IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"				OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"			   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"			END IF;
"
"
"
"
"
"			OPEN c_prod_trans;
"
"			FETCH c_prod_trans INTO r_prod_trans;
"
"			CLOSE c_prod_trans;
"
"
"
"			v_sf_code := p_tarsf_code;
"
"
"
"			IF r_prod_trans.pt_ser_no IS NOT NULL OR r_prod_trans.pt_lot_no IS NOT NULL THEN
"
"			   v_sys_ls_no := r_prod_trans.pt_sys_ls_no;
"
"			END IF;
"
"
"
"
"
"			v_unit_cost := func_find_sfg_unitcost(
"
"												  p_bu      ,
"
"												  p_prod_id ,
"
"												  p_prod_rev,
"
"												  v_oc_store,
"
"												  p_prod_ord_no,
"
"												  v_sf_code,
"
"												  v_sys_ls_no
"
"												  );
"
"
"
"
"
"			-- debit transaction
"
"
"
"			v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"					SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"					  INTO v_jrnl_trans_seq_no
"
"					  FROM appl_journals
"
"					 WHERE aj_bu = p_bu
"
"					   AND aj_plnt = p_plnt
"
"					   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"					INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"										VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_dbt_acct_plnt             ,
"
"											v_dbt_lvl1                ,
"
"											v_dbt_lvl2                ,
"
"											v_dbt_lvl3                ,
"
"											v_dbt_lvl4                ,
"
"											v_dbt_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION COMPLETION'             ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"											0              ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"											0              ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											v_insp_store               ,
"
"											func_find_store_desc(p_bu,v_insp_store,p_lang)             ,
"
"											func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"											func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"											func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"											func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"											p_prod_id               ,
"
"											p_prod_rev              ,
"
"											func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty              ,
"
"											v_unit_cost              ,
"
"											v_unit_cost          ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_dbt_prj_lvl
"
"											  );
"
"
"
"
"
"
"
"			-- credit transaction
"
"
"
"
"
"					OPEN c_store_acct(v_oc_store);
"
"					FETCH c_store_acct INTO r_store_acct;
"
"					IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"						RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"					ELSE
"
"					    v_crd_acct := r_store_acct.store_gl_acct;
"
"					END IF;
"
"					CLOSE c_store_acct;
"
"
"
"
"
"						proc_find_cost_center(
"
"											p_bu    ,
"
"											p_plnt  ,
"
"											NULL,
"
"											v_crd_acct,
"
"											NULL ,
"
"											NULL ,
"
"											NULL ,
"
"											NULL ,
"
"											v_crd_lvl1,
"
"											v_crd_lvl2,
"
"											v_crd_lvl3,
"
"											v_crd_lvl4,
"
"											v_crd_lvl5,
"
"											v_crd_lvl6,
"
"											v_crd_prj_lvl,
"
"											v_crd_acct_plnt,
"
"											v_crd_cc_code,
"
"											v_crd_plnt_loc_id
"
"											);
"
"
"
"
"
"			IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"				OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"			   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"			END IF;
"
"
"
"
"
"
"
"
"
"								SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"								  INTO v_jrnl_trans_seq_no
"
"								  FROM appl_journals
"
"								 WHERE aj_bu = p_bu
"
"								   AND aj_plnt = p_plnt
"
"								   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"				    INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"									VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_crd_acct_plnt             ,
"
"											v_crd_lvl1                ,
"
"											v_crd_lvl2                ,
"
"											v_crd_lvl3                ,
"
"											v_crd_lvl4                ,
"
"											v_crd_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION COMPLETION'             ,
"
"											0              ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"											0 ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											v_oc_store               ,
"
"											func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"											func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"											func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"											func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"											func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"											p_prod_id               ,
"
"											p_prod_rev              ,
"
"											func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty              ,
"
"											v_unit_cost              ,
"
"											v_unit_cost          ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_crd_prj_lvl
"
"										    );
"
"
"
"
"
"
"
"	END proc_ins_opcinsp_jrnl;
"
"
"
"	PROCEDURE proc_ins_opcrcpt_jrnl(
"
"									p_bu				VARCHAR2,
"
"									p_plnt				VARCHAR2,
"
"									p_plnt_loc_id			VARCHAR2,
"
"									p_trans_no			VARCHAR2,
"
"									p_doc_date			DATE,
"
"									p_prod_id			VARCHAR2,
"
"									p_prod_rev			NUMBER,
"
"									p_prod_ord_no		VARCHAR2,
"
"									p_comp_qty			NUMBER,
"
"									p_tarsf_code		VARCHAR2,
"
"									p_user				VARCHAR2,
"
"									p_lang				NUMBER
"
"									)
"
"	IS
"
"	CURSOR c_trans_proc
"
"	IS
"
"	SELECT *
"
"	  FROM prod_transfer_process
"
"	 WHERE ptp_bu = p_bu
"
"	   AND ptp_plnt = p_plnt
"
"	   AND ptp_trans_no = p_trans_no
"
"	 ORDER BY ptp_oprn_seq_no DESC;
"
"
"
"	CURSOR c_ord_rou(c_oprn_id 	VARCHAR2)
"
"	  IS
"
"	SELECT *
"
"	  FROM prod_order_routing
"
"	 WHERE pror_bu = p_bu
"
"	   AND pror_plnt = p_plnt
"
"	   AND pror_ord_no = p_prod_ord_no
"
"	   AND pror_oprn_id = c_oprn_id;
"
"
"
"	CURSOR c_store_acct(c_store_id VARCHAR2)
"
"	  IS
"
"	SELECT store_gl_acct
"
"	  FROM stores
"
"	 WHERE store_bu = p_bu
"
"	   AND store_id = c_store_id;
"
"
"
"	CURSOR c_prod_trans
"
"	  IS
"
"	SELECT *
"
"	  FROM prod_transfer
"
"	 WHERE pt_bu = p_bu
"
"	   AND pt_plnt = p_plnt
"
"	   AND pt_trans_no = p_trans_no;
"
"
"
"    v_oc_store		    	VARCHAR2(10);
"
"    v_rcpt_store		    VARCHAR2(10);
"
"    v_sf_code			    VARCHAR2(50);
"
"    v_sys_ls_no		        NUMBER(15);
"
"    v_unit_cost		        NUMBER(17,5);
"
"    v_dbt_acct		        stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl		    VARCHAR2(10);
"
"    v_dbt_lvl1		    	VARCHAR2(4);
"
"    v_dbt_lvl2		    	VARCHAR2(4);
"
"    v_dbt_lvl3		    	VARCHAR2(4);
"
"    v_dbt_lvl4		    	VARCHAR2(4);
"
"    v_dbt_acct_plnt	    	VARCHAR2(10);
"
"    v_crd_lvl1		    	VARCHAR2(4);
"
"    v_crd_lvl2		    	VARCHAR2(4);
"
"    v_crd_lvl3		    	VARCHAR2(4);
"
"    v_crd_lvl4		    	VARCHAR2(4);
"
"    v_crd_acct_plnt	    	VARCHAR2(10);
"
"    v_crd_acct		    	stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl		    VARCHAR2(10);
"
"    v_jrnl_trans_no	    	VARCHAR2(15);
"
"    v_jrnl_trans_seq_no		NUMBER;
"
"
"
"    r_trans_proc		c_trans_proc%ROWTYPE;
"
"    r_ord_rou			c_ord_rou%ROWTYPE;
"
"    r_store_acct		c_store_acct%ROWTYPE;
"
"    r_prod_trans		c_prod_trans%ROWTYPE;
"
"   v_crd_cc_code		VARCHAR2(200);
"
"    v_crd_plnt_loc_id		VARCHAR2(10);
"
"    v_dbt_cc_code		VARCHAR2(200);
"
"    v_dbt_plnt_loc_id		VARCHAR2(10);
"
"    v_crd_lvl5			VARCHAR2(20);
"
"    v_dbt_lvl5			VARCHAR2(20);
"
"    v_dbt_lvl6			VARCHAR2(20);
"
"    v_crd_lvl6			VARCHAR2(20);
"
"
"
"	BEGIN
"
"
"
"		v_oc_store := func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'O');
"
"
"
"  		OPEN c_trans_proc;
"
"  		FETCH c_trans_proc INTO r_trans_proc;
"
"  		CLOSE c_trans_proc;
"
"
"
"  		OPEN c_ord_rou(r_trans_proc.ptp_oprn_id);
"
"  		FETCH c_ord_rou INTO r_ord_rou;
"
"  		CLOSE c_ord_rou;
"
"
"
"  		v_rcpt_store := r_ord_rou.pror_rcp_store;
"
"
"
"  		OPEN c_prod_trans;
"
"  		FETCH c_prod_trans INTO r_prod_trans;
"
"
"
"			IF r_prod_trans.pt_ser_no IS NOT NULL OR r_prod_trans.pt_lot_no IS NOT NULL THEN
"
"				v_sys_ls_no := r_prod_trans.pt_sys_ls_no;
"
"			END IF;
"
"
"
"  		CLOSE c_prod_trans;
"
"
"
"  		v_sf_code := p_tarsf_code;
"
"
"
"  		v_unit_cost := func_find_sfg_unitcost(
"
"											p_bu      ,
"
"											p_prod_id ,
"
"											p_prod_rev,
"
"											v_oc_store,
"
"											p_prod_ord_no,
"
"											v_sf_code,
"
"											v_sys_ls_no
"
"											);
"
"
"
"
"
"		-- debit transaction
"
"
"
"		OPEN c_store_acct(v_rcpt_store);
"
"		FETCH c_store_acct INTO r_store_acct;
"
"		IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"		   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"		ELSE
"
"		   v_dbt_acct := r_store_acct.store_gl_acct;
"
"		END IF;
"
"		CLOSE c_store_acct;
"
"
"
"		proc_find_cost_center(
"
"							p_bu    ,
"
"							p_plnt  ,
"
"							NULL,
"
"							v_dbt_acct,
"
"							NULL ,
"
"							NULL ,
"
"							NULL ,
"
"							NULL ,
"
"							v_dbt_lvl1,
"
"							v_dbt_lvl2,
"
"							v_dbt_lvl3,
"
"							v_dbt_lvl4,
"
"							v_dbt_lvl5,
"
"							v_dbt_lvl6,
"
"							v_dbt_prj_lvl,
"
"							v_dbt_acct_plnt,
"
"							v_dbt_cc_code,
"
"							v_dbt_plnt_loc_id
"
"							);
"
"
"
"
"
"					IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"						OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"					   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"					END IF;
"
"
"
"
"
"				v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"					SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"					  INTO v_jrnl_trans_seq_no
"
"					  FROM appl_journals
"
"					 WHERE aj_bu = p_bu
"
"					   AND aj_plnt = p_plnt
"
"					   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"			INSERT INTO appl_journals(
"
"									aj_bu                     ,
"
"									aj_plnt                   ,
"
"									aj_jrnl_trns_no           ,
"
"									aj_jrnl_trns_seq_no       ,
"
"									aj_acctg_plnt             ,
"
"									aj_gl_lvl1                ,
"
"									aj_gl_lvl2                ,
"
"									aj_gl_lvl3                ,
"
"									aj_gl_lvl4                ,
"
"									aj_gl_acct                ,
"
"									aj_gl_acct_desc           ,
"
"									aj_reference1             ,
"
"									aj_reference2             ,
"
"									aj_fc_db_amt              ,
"
"									aj_fc_cr_amt              ,
"
"									aj_bc_db_amt              ,
"
"									aj_bc_cr_amt              ,
"
"									aj_db_ex_rate             ,
"
"									aj_cr_ex_rate             ,
"
"									aj_jrnl_date              ,
"
"									aj_jrnl_year              ,
"
"									aj_jrnl_period            ,
"
"									aj_store_id               ,
"
"									aj_store_name             ,
"
"									aj_cls_id                 ,
"
"									aj_cls_desc               ,
"
"									aj_sub_cls_id             ,
"
"									aj_sub_cls_desc           ,
"
"									aj_prod_id                ,
"
"									aj_prod_rev               ,
"
"									aj_prod_desc1             ,
"
"									aj_tc_id                  ,
"
"									aj_tc_desc                ,
"
"									aj_suplr_id               ,
"
"									aj_suplr_name             ,
"
"									aj_cust_id                ,
"
"									aj_cust_name              ,
"
"									aj_area_id                ,
"
"									aj_area_desc              ,
"
"									aj_terr_id                ,
"
"									aj_terr_desc              ,
"
"									aj_bank_id                ,
"
"									aj_bank_name              ,
"
"									aj_fa_grp_id              ,
"
"									aj_fa_grp_desc            ,
"
"									aj_fa_id                  ,
"
"									aj_fa_desc                ,
"
"									aj_dept_id                ,
"
"									aj_dept_desc              ,
"
"									aj_proj_id                ,
"
"									aj_proj_desc              ,
"
"									aj_res_grp_id             ,
"
"									aj_res_grp_desc           ,
"
"									aj_res_id                 ,
"
"									aj_res_desc               ,
"
"									aj_emp_id                 ,
"
"									aj_emp_name               ,
"
"									aj_trans_qty              ,
"
"									aj_unit_cost              ,
"
"									aj_unit_price             ,
"
"									aj_source_doc_mode        ,
"
"									aj_appl                   ,
"
"									aj_status                 ,
"
"									aj_jrnl_no                ,
"
"									aj_cre_by                 ,
"
"									aj_cre_date               ,
"
"									aj_upd_by                 ,
"
"									aj_upd_date               ,
"
"									aj_offset_doc_no          ,
"
"									aj_vou_type               ,
"
"									aj_vou_pfx                ,
"
"									aj_vou_no                 ,
"
"									aj_vou_line_no            ,
"
"									aj_ref_no                 ,
"
"									aj_ref_date,
"
"									aj_gl_lvl_prj
"
"									)
"
"							VALUES(
"
"									p_bu                     ,
"
"									p_plnt                   ,
"
"									v_jrnl_trans_no           ,
"
"									v_jrnl_trans_seq_no       ,
"
"									v_dbt_acct_plnt             ,
"
"									v_dbt_lvl1                ,
"
"									v_dbt_lvl2                ,
"
"									v_dbt_lvl3                ,
"
"									v_dbt_lvl4                ,
"
"									v_dbt_acct                ,
"
"									func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"									'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"									'PRODUCTION COMPLETION'             ,
"
"									ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"									0              ,
"
"									ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"									0              ,
"
"									1             ,
"
"									1             ,
"
"									p_doc_date              ,
"
"									func_find_year(p_bu,p_doc_date)              ,
"
"									func_find_period(p_bu,p_doc_date)            ,
"
"									v_rcpt_store               ,
"
"									func_find_store_desc(p_bu,v_rcpt_store,p_lang)             ,
"
"									func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"									func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"									func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"									func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"									p_prod_id               ,
"
"									p_prod_rev              ,
"
"									func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"									NULL                  ,
"
"									NULL                ,
"
"									NULL               ,
"
"									NULL             ,
"
"									NULL                ,
"
"									NULL              ,
"
"									NULL                ,
"
"									NULL              ,
"
"									NULL                ,
"
"									NULL              ,
"
"									NULL                ,
"
"									NULL              ,
"
"									NULL              ,
"
"									NULL            ,
"
"									NULL                  ,
"
"									NULL                ,
"
"									NULL                ,
"
"									NULL              ,
"
"									NULL                ,
"
"									NULL              ,
"
"									NULL             ,
"
"									NULL           ,
"
"									NULL                 ,
"
"									NULL               ,
"
"									NULL                 ,
"
"									NULL               ,
"
"									p_comp_qty              ,
"
"									v_unit_cost              ,
"
"									v_unit_cost          ,
"
"									NULL        ,
"
"									'SFM'                   ,
"
"									'N'                 ,
"
"									NULL                ,
"
"									p_user                 ,
"
"									SYSDATE               ,
"
"									NULL                 ,
"
"									NULL               ,
"
"									NULL          ,
"
"									'PCM'               ,
"
"									NULL                ,
"
"									p_trans_no                 ,
"
"									1            ,
"
"									NULL                 ,
"
"									NULL,
"
"									v_dbt_prj_lvl
"
"									);
"
"
"
"
"
"					-- credit transaction
"
"
"
"
"
"					OPEN c_store_acct(v_oc_store);
"
"					FETCH c_store_acct INTO r_store_acct;
"
"					IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"						RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"					ELSE
"
"					    v_crd_acct := r_store_acct.store_gl_acct;
"
"					END IF;
"
"					CLOSE c_store_acct;
"
"
"
"
"
"				proc_find_cost_center(
"
"									  p_bu    ,
"
"									  p_plnt  ,
"
"									  NULL,
"
"									  v_crd_acct,
"
"									  NULL ,
"
"									  NULL ,
"
"									  NULL ,
"
"									  NULL ,
"
"									  v_crd_lvl1,
"
"									  v_crd_lvl2,
"
"									  v_crd_lvl3,
"
"									  v_crd_lvl4,
"
"									  v_crd_lvl5,
"
"									  v_crd_lvl6,
"
"									  v_crd_prj_lvl,
"
"									  v_crd_acct_plnt,
"
"									  v_crd_cc_code,
"
"									  v_crd_plnt_loc_id
"
"									  );
"
"
"
"
"
"			IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"				OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"			   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"			END IF;
"
"
"
"
"
"
"
"
"
"								SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"								  INTO v_jrnl_trans_seq_no
"
"								  FROM appl_journals
"
"								 WHERE aj_bu = p_bu
"
"								   AND aj_plnt = p_plnt
"
"								   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"				    INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"										VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_crd_acct_plnt             ,
"
"											v_crd_lvl1                ,
"
"											v_crd_lvl2                ,
"
"											v_crd_lvl3                ,
"
"											v_crd_lvl4                ,
"
"											v_crd_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION COMPLETION'             ,
"
"											0              ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"											0 ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											v_oc_store               ,
"
"											func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"											func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"											func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"											func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"											func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"											p_prod_id               ,
"
"											p_prod_rev              ,
"
"											func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty              ,
"
"											v_unit_cost              ,
"
"											v_unit_cost          ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_crd_prj_lvl
"
"										    );
"
"
"
"
"
"	END proc_ins_opcrcpt_jrnl;
"
"
"
"	PROCEDURE proc_ins_insp_postinsp_jrnl(
"
"										  p_bu				VARCHAR2,
"
"										  p_plnt			VARCHAR2,
"
"										  p_plnt_loc_id			VARCHAR2,
"
"										  p_trans_no		VARCHAR2,
"
"										  p_doc_date		DATE,
"
"										  p_prod_id			VARCHAR2,
"
"										  p_prod_rev		NUMBER,
"
"										  p_prod_ord_no		VARCHAR2,
"
"										  p_comp_qty		NUMBER,
"
"										  p_tarsf_code		VARCHAR2,
"
"										  p_qc_pfx			VARCHAR2,
"
"										  p_qc_no			VARCHAR2,
"
"										  p_qc_rev			NUMBER,
"
"										  p_qc_line			NUMBER,
"
"										  p_user			VARCHAR2,
"
"										  p_lang			NUMBER
"
"										  )
"
"    IS
"
"	CURSOR c_tqm
"
"    IS
"
"	SELECT *
"
"      FROM tqm_lot_serial_nos
"
"     WHERE tqmls_bu = p_bu
"
"       AND tqmls_qc_pfx = p_qc_pfx
"
"       AND tqmls_qc_no = p_qc_no
"
"       AND tqmls_qc_rev = p_qc_rev
"
"       AND tqmls_qc_doc_seq_no = p_qc_line;
"
"
"
"	CURSOR c_store_acct(c_store_id	VARCHAR2)
"
"	  IS
"
"	SELECT store_gl_acct
"
"	  FROM stores
"
"	 WHERE store_bu = p_bu
"
"	   AND store_id = c_store_id;
"
"
"
"
"
"    v_insp_store		VARCHAR2(10);
"
"    v_post_insp_store	VARCHAR2(10);
"
"    v_sys_ls_no			NUMBER(15);
"
"    v_sf_code			VARCHAR2(50);
"
"    v_unit_cost			NUMBER(17,5);
"
"    v_dbt_acct			stores.store_gl_acct%TYPE;
"
"    v_dbt_lvl1			VARCHAR2(4);
"
"    v_dbt_lvl2			VARCHAR2(4);
"
"    v_dbt_lvl3			VARCHAR2(4);
"
"    v_dbt_lvl4			VARCHAR2(4);
"
"
"
"
"
"    v_dbt_prj_lvl		VARCHAR2(10);
"
"    v_dbt_acct_plnt		VARCHAR2(10);
"
"    v_crd_lvl1			VARCHAR2(4);
"
"    v_crd_lvl2			VARCHAR2(4);
"
"    v_crd_lvl3			VARCHAR2(4);
"
"    v_crd_lvl4			VARCHAR2(4);
"
"    v_crd_lvl5			VARCHAR2(20);
"
"    v_crd_lvl6			VARCHAR2(20);
"
"    v_dbt_lvl5			VARCHAR2(20);
"
"    v_dbt_lvl6			VARCHAR2(20);
"
"    v_dbt_cc_code		VARCHAR2(200);
"
"    v_crd_cc_code		VARCHAR2(200);
"
"    v_dbt_plnt_loc_id		VARCHAR2(10);
"
"    v_crd_plnt_loc_id		VARCHAR2(10);
"
"    v_crd_acct			stores.store_gl_acct%TYPE;
"
"    v_crd_acct_plnt		VARCHAR2(10);
"
"    v_crd_prj_lvl		VARCHAR2(10);
"
"    v_jrnl_trans_no		VARCHAR2(15);
"
"    v_jrnl_trans_seq_no	NUMBER;
"
"
"
"	r_tqm					c_tqm%ROWTYPE;
"
"    r_store_acct			c_store_acct%ROWTYPE;
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
"  BEGIN
"
"
"
"  	v_insp_store := func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'Q');
"
"  	v_post_insp_store := func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'P');
"
"
"
"  	v_sf_code := p_tarsf_code;
"
"
"
"  	OPEN c_tqm;
"
"  	FETCH c_tqm INTO r_tqm;
"
"  	CLOSE c_tqm;
"
"
"
"  	v_sys_ls_no := r_tqm.tqmls_sys_ls_no;
"
"
"
"  			v_unit_cost := func_find_sfg_unitcost(
"
"												  p_bu      ,
"
"												  p_prod_id ,
"
"												  p_prod_rev,
"
"												  v_insp_store,
"
"												  p_prod_ord_no,
"
"												  v_sf_code,
"
"												  v_sys_ls_no
"
"												  );
"
"
"
"
"
"	-- debit transaction
"
"
"
"	OPEN c_store_acct(v_post_insp_store);
"
"	FETCH c_store_acct INTO r_store_acct;
"
"	IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"	    RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"	ELSE
"
"	    v_dbt_acct := r_store_acct.store_gl_acct;
"
"	END IF;
"
"
"
"	CLOSE c_store_acct;
"
"
"
" 		proc_find_cost_center(
"
"							p_bu    ,
"
"							p_plnt  ,
"
"							NULL,
"
"							v_dbt_acct,
"
"							NULL ,
"
"							NULL ,
"
"							NULL ,
"
"							NULL ,
"
"							v_dbt_lvl1,
"
"							v_dbt_lvl2,
"
"							v_dbt_lvl3,
"
"							v_dbt_lvl4,
"
"							v_dbt_lvl5,
"
"							v_dbt_lvl6,
"
"							v_dbt_prj_lvl,
"
"							v_dbt_acct_plnt,
"
"							v_dbt_cc_code,
"
"							v_dbt_plnt_loc_id
"
"							);
"
"
"
"
"
"			IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"				OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"			   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"			END IF;
"
"
"
"
"
"			v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"			SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"			  INTO v_jrnl_trans_seq_no
"
"			  FROM appl_journals
"
"			 WHERE aj_bu = p_bu
"
"			   AND aj_plnt = p_plnt
"
"			   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"		INSERT INTO appl_journals(
"
"								aj_bu                     ,
"
"								aj_plnt                   ,
"
"								aj_jrnl_trns_no           ,
"
"								aj_jrnl_trns_seq_no       ,
"
"								aj_acctg_plnt             ,
"
"								aj_gl_lvl1                ,
"
"								aj_gl_lvl2                ,
"
"								aj_gl_lvl3                ,
"
"								aj_gl_lvl4                ,
"
"								aj_gl_acct                ,
"
"								aj_gl_acct_desc           ,
"
"								aj_reference1             ,
"
"								aj_reference2             ,
"
"								aj_fc_db_amt              ,
"
"								aj_fc_cr_amt              ,
"
"								aj_bc_db_amt              ,
"
"								aj_bc_cr_amt              ,
"
"								aj_db_ex_rate             ,
"
"								aj_cr_ex_rate             ,
"
"								aj_jrnl_date              ,
"
"								aj_jrnl_year              ,
"
"								aj_jrnl_period            ,
"
"								aj_store_id               ,
"
"								aj_store_name             ,
"
"								aj_cls_id                 ,
"
"								aj_cls_desc               ,
"
"								aj_sub_cls_id             ,
"
"								aj_sub_cls_desc           ,
"
"								aj_prod_id                ,
"
"								aj_prod_rev               ,
"
"								aj_prod_desc1             ,
"
"								aj_tc_id                  ,
"
"								aj_tc_desc                ,
"
"								aj_suplr_id               ,
"
"								aj_suplr_name             ,
"
"								aj_cust_id                ,
"
"								aj_cust_name              ,
"
"								aj_area_id                ,
"
"								aj_area_desc              ,
"
"								aj_terr_id                ,
"
"								aj_terr_desc              ,
"
"								aj_bank_id                ,
"
"								aj_bank_name              ,
"
"								aj_fa_grp_id              ,
"
"								aj_fa_grp_desc            ,
"
"								aj_fa_id                  ,
"
"								aj_fa_desc                ,
"
"								aj_dept_id                ,
"
"								aj_dept_desc              ,
"
"								aj_proj_id                ,
"
"								aj_proj_desc              ,
"
"								aj_res_grp_id             ,
"
"								aj_res_grp_desc           ,
"
"								aj_res_id                 ,
"
"								aj_res_desc               ,
"
"								aj_emp_id                 ,
"
"								aj_emp_name               ,
"
"								aj_trans_qty              ,
"
"								aj_unit_cost              ,
"
"								aj_unit_price             ,
"
"								aj_source_doc_mode        ,
"
"								aj_appl                   ,
"
"								aj_status                 ,
"
"								aj_jrnl_no                ,
"
"								aj_cre_by                 ,
"
"								aj_cre_date               ,
"
"								aj_upd_by                 ,
"
"								aj_upd_date               ,
"
"								aj_offset_doc_no          ,
"
"								aj_vou_type               ,
"
"								aj_vou_pfx                ,
"
"								aj_vou_no                 ,
"
"								aj_vou_line_no            ,
"
"								aj_ref_no                 ,
"
"								aj_ref_date,
"
"								aj_gl_lvl_prj
"
"								)
"
"						VALUES(
"
"								p_bu                     ,
"
"								p_plnt                   ,
"
"								v_jrnl_trans_no           ,
"
"								v_jrnl_trans_seq_no       ,
"
"								v_dbt_acct_plnt             ,
"
"								v_dbt_lvl1                ,
"
"								v_dbt_lvl2                ,
"
"								v_dbt_lvl3                ,
"
"								v_dbt_lvl4                ,
"
"								v_dbt_acct                ,
"
"								func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"								'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"								'PRODUCTION COMPLETION'             ,
"
"								ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"								0              ,
"
"								ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"								0              ,
"
"								1             ,
"
"								1             ,
"
"								p_doc_date              ,
"
"								func_find_year(p_bu,p_doc_date)              ,
"
"								func_find_period(p_bu,p_doc_date)            ,
"
"								v_post_insp_store               ,
"
"								func_find_store_desc(p_bu,v_post_insp_store,p_lang)             ,
"
"								func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"								func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"								func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"								func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"								p_prod_id               ,
"
"								p_prod_rev              ,
"
"								func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"								NULL                  ,
"
"								NULL                ,
"
"								NULL               ,
"
"								NULL             ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL              ,
"
"								NULL            ,
"
"								NULL                  ,
"
"								NULL                ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL                ,
"
"								NULL              ,
"
"								NULL             ,
"
"								NULL           ,
"
"								NULL                 ,
"
"								NULL               ,
"
"								NULL                 ,
"
"								NULL               ,
"
"								p_comp_qty              ,
"
"								v_unit_cost              ,
"
"								v_unit_cost          ,
"
"								NULL        ,
"
"								'SFM'                   ,
"
"								'N'                 ,
"
"								NULL                ,
"
"								p_user                 ,
"
"								SYSDATE               ,
"
"								NULL                 ,
"
"								NULL               ,
"
"								NULL          ,
"
"								'PCM'               ,
"
"								NULL                ,
"
"								p_trans_no                 ,
"
"								1            ,
"
"								NULL                 ,
"
"								NULL,
"
"								v_dbt_prj_lvl
"
"							      );
"
"
"
"
"
"
"
"					OPEN c_store_acct(v_insp_store);
"
"					FETCH c_store_acct INTO r_store_acct;
"
"						IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"							RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"						ELSE
"
"							v_crd_acct := r_store_acct.store_gl_acct;
"
"						END IF;
"
"					CLOSE c_store_acct;
"
"
"
"
"
"				proc_find_cost_center(
"
"									p_bu    ,
"
"									p_plnt  ,
"
"									NULL,
"
"									v_crd_acct,
"
"									NULL ,
"
"									NULL ,
"
"									NULL ,
"
"									NULL ,
"
"									v_crd_lvl1,
"
"									v_crd_lvl2,
"
"									v_crd_lvl3,
"
"									v_crd_lvl4,
"
"									v_crd_lvl5,
"
"									v_crd_lvl6,
"
"									v_crd_prj_lvl,
"
"									v_crd_acct_plnt,
"
"									v_crd_cc_code,
"
"									v_crd_plnt_loc_id
"
"									);
"
"
"
"
"
"			IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"				OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"			   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"			END IF;
"
"
"
"
"
"
"
"
"
"								SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"								  INTO v_jrnl_trans_seq_no
"
"								  FROM appl_journals
"
"								 WHERE aj_bu = p_bu
"
"								   AND aj_plnt = p_plnt
"
"								   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"					INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"									VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_crd_acct_plnt             ,
"
"											v_crd_lvl1                ,
"
"											v_crd_lvl2                ,
"
"											v_crd_lvl3                ,
"
"											v_crd_lvl4                ,
"
"											v_crd_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION COMPLETION'             ,
"
"											0              ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"											0 ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											v_insp_store               ,
"
"											func_find_store_desc(p_bu,v_insp_store,p_lang)             ,
"
"											func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"											func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"											func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"											func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"											p_prod_id               ,
"
"											p_prod_rev              ,
"
"											func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty              ,
"
"											v_unit_cost              ,
"
"											v_unit_cost          ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_crd_prj_lvl
"
"										    );
"
"
"
"	END proc_ins_insp_postinsp_jrnl;
"
"
"
"	PROCEDURE proc_ins_postinsp_rcpt_jrnl(
"
"										  p_bu			VARCHAR2,
"
"										  p_plnt		VARCHAR2,
"
"										  p_plnt_loc_id		VARCHAR2,
"
"										  p_trans_no		VARCHAR2,
"
"										  p_doc_date		DATE,
"
"										  p_prod_id		VARCHAR2,
"
"										  p_prod_rev		NUMBER,
"
"										  p_prod_ord_no		VARCHAR2,
"
"										  p_qc_pfx		VARCHAR2,
"
"										  p_qc_no		VARCHAR2,
"
"										  p_qc_rev		NUMBER,
"
"										  p_qc_line		NUMBER,
"
"										  p_comp_qty		NUMBER,
"
"										  p_tarsf_code		VARCHAR2,
"
"										  p_user		VARCHAR2,
"
"										  p_lang		NUMBER
"
"										  )
"
"	IS
"
"    CURSOR c_tqm
"
"    IS
"
"    SELECT *
"
"      FROM tqm_qc_process
"
"     WHERE tqp_bu = p_bu
"
"       AND tqp_qc_pfx = p_qc_pfx
"
"       AND tqp_qc_no = p_qc_no
"
"       AND tqp_qc_rev = p_qc_rev
"
"       AND tqp_seq_no = p_qc_line
"
"     ORDER BY tqp_proc_seq_no DESC;
"
"
"
"    CURSOR c_ord_rou(c_oprn_id VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM prod_order_routing
"
"     WHERE pror_bu = p_bu
"
"       AND pror_plnt = p_plnt
"
"       AND pror_ord_no = p_prod_ord_no
"
"       AND pror_oprn_id = c_oprn_id;
"
"
"
"    CURSOR c_tqm_ls
"
"    IS
"
"    SELECT *
"
"      FROM tqm_lot_serial_nos
"
"     WHERE tqmls_bu = p_bu
"
"       AND tqmls_qc_pfx = p_qc_pfx
"
"       AND tqmls_qc_no = p_qc_no
"
"       AND tqmls_qc_rev = p_qc_rev
"
"       AND tqmls_qc_doc_seq_no = p_qc_line;
"
"
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = c_store_id;
"
"
"
"
"
"    v_sf_code			VARCHAR2(10);
"
"    v_post_insp_store	VARCHAR2(10);
"
"    v_rcpt_store		VARCHAR2(10);
"
"    v_sys_ls_no			NUMBER(15);
"
"    v_unit_cost			NUMBER(17,5);
"
"    v_dbt_acct 			STORES.store_gl_acct%TYPE;
"
"    v_dbt_lvl1			VARCHAR2(4);
"
"    v_dbt_lvl2			VARCHAR2(4);
"
"    v_dbt_lvl3			VARCHAR2(4);
"
"    v_dbt_lvl4			VARCHAR2(4);
"
"    v_dbt_lvl5			VARCHAR2(20);
"
"    v_dbt_lvl6			VARCHAR2(20);
"
"    v_crd_lvl5			VARCHAR2(20);
"
"    v_crd_lvl6			VARCHAR2(20);
"
"    v_crd_cc_code		VARCHAR2(200);
"
"    v_dbt_cc_code		VARCHAR2(200);
"
"    v_crd_plnt_loc_id		VARCHAR2(10);
"
"    v_dbt_plnt_loc_id		VARCHAR2(10);
"
"
"
"    v_dbt_prj_lvl		VARCHAR2(10);
"
"    v_crd_acct			STORES.store_gl_acct%TYPE;
"
"    v_crd_lvl1			VARCHAR2(4);
"
"    v_crd_lvl2			VARCHAR2(4);
"
"    v_crd_lvl3			VARCHAR2(4);
"
"    v_crd_lvl4			VARCHAR2(4);
"
"    v_crd_prj_lvl		VARCHAR2(10);
"
"    v_dbt_acct_plnt		VARCHAR2(10);
"
"    v_crd_acct_plnt		VARCHAR2(10);
"
"    v_jrnl_trans_no		VARCHAR2(15);
"
"    v_jrnl_trans_seq_no	NUMBER;
"
"
"
"
"
"    r_tqm			c_tqm%ROWTYPE;
"
"    r_ord_rou		c_ord_rou%ROWTYPE;
"
"    r_tqm_ls		c_tqm_ls%ROWTYPE;
"
"    r_store_acct	c_store_acct%ROWTYPE;
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
"
"
"	BEGIN
"
"
"
"	v_post_insp_store := func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'P');
"
"
"
"  	OPEN c_tqm;
"
"  	FETCH c_tqm INTO r_tqm;
"
"  	CLOSE c_tqm;
"
"
"
"  	OPEN c_ord_rou(r_tqm.tqp_proc_id);
"
"  	FETCH c_ord_rou INTO r_ord_rou;
"
"  	CLOSE c_ord_rou;
"
"
"
"  	v_rcpt_store := r_ord_rou.pror_rcp_store;
"
"
"
"  	v_sf_code := p_tarsf_code;
"
"
"
"
"
"  	OPEN c_tqm_ls;
"
"  	FETCH c_tqm_ls INTO r_tqm_ls;
"
"  	CLOSE c_tqm_ls;
"
"
"
"  	v_sys_ls_no := r_tqm_ls.tqmls_sys_ls_no;
"
"
"
"  	v_unit_cost := func_find_sfg_unitcost(p_bu         ,
"
"										  p_prod_id    ,
"
"										  p_prod_rev   ,
"
"										  func_find_store_fr_type(p_bu,p_plnt,p_plnt_loc_id,'Q'),
"
"										  p_prod_ord_no    ,
"
"										  v_sf_code,
"
"										  v_sys_ls_no
"
"										  );
"
"
"
"
"
"
"
"
"
"  	OPEN c_store_acct(v_rcpt_store);
"
"  	FETCH c_store_acct INTO r_store_acct;
"
"  	IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"  		RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"  	ELSE
"
"  		v_dbt_acct := r_store_acct.store_gl_acct;
"
"  	END IF;
"
"  	CLOSE c_store_acct;
"
"
"
"
"
"		proc_find_cost_center(
"
"							p_bu    ,
"
"							p_plnt  ,
"
"							NULL,
"
"							v_dbt_acct,
"
"							NULL ,
"
"							NULL ,
"
"							NULL ,
"
"							NULL ,
"
"							v_dbt_lvl1,
"
"							v_dbt_lvl2,
"
"							v_dbt_lvl3,
"
"							v_dbt_lvl4,
"
"							v_dbt_lvl5,
"
"							v_dbt_lvl6,
"
"							v_dbt_prj_lvl,
"
"							v_dbt_acct_plnt,
"
"							v_dbt_cc_code,
"
"							v_dbt_plnt_loc_id
"
"							);
"
"
"
"
"
"			IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"				OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"			   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"			END IF;
"
"
"
"
"
"			v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"			SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"			  INTO v_jrnl_trans_seq_no
"
"			  FROM appl_journals
"
"			 WHERE aj_bu = p_bu
"
"			   AND aj_plnt = p_plnt
"
"			   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"					INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"									VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_dbt_acct_plnt             ,
"
"											v_dbt_lvl1                ,
"
"											v_dbt_lvl2                ,
"
"											v_dbt_lvl3                ,
"
"											v_dbt_lvl4                ,
"
"											v_dbt_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION COMPLETION'             ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"											0              ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"											0              ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											v_rcpt_store               ,
"
"											func_find_store_desc(p_bu,v_rcpt_store,p_lang)             ,
"
"											func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"											func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"											func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"											func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"											p_prod_id               ,
"
"											p_prod_rev              ,
"
"											func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty              ,
"
"											v_unit_cost              ,
"
"											v_unit_cost          ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_dbt_prj_lvl
"
"											);
"
"
"
"
"
"				OPEN c_store_acct(v_post_insp_store);
"
"				FETCH c_store_acct INTO r_store_acct;
"
"				IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"					RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"				ELSE
"
"					v_crd_acct := r_store_acct.store_gl_acct;
"
"
"
"				END IF;
"
"				CLOSE c_store_acct;
"
"
"
"
"
"
"
"
"
"				proc_find_cost_center(
"
"									p_bu    ,
"
"									p_plnt  ,
"
"									NULL,
"
"									v_crd_acct,
"
"									NULL ,
"
"									NULL ,
"
"									NULL ,
"
"									NULL ,
"
"									v_crd_lvl1,
"
"									v_crd_lvl2,
"
"									v_crd_lvl3,
"
"									v_crd_lvl4,
"
"									v_crd_lvl5,
"
"									v_crd_lvl6,
"
"									v_crd_prj_lvl,
"
"									v_crd_acct_plnt,
"
"									v_crd_cc_code,
"
"									v_crd_plnt_loc_id
"
"									);
"
"
"
"
"
"			IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"				OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"			   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"			END IF;
"
"
"
"
"
"
"
"
"
"								SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"								  INTO v_jrnl_trans_seq_no
"
"								  FROM appl_journals
"
"								 WHERE aj_bu = p_bu
"
"								   AND aj_plnt = p_plnt
"
"								   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"					INSERT INTO appl_journals(
"
"											aj_bu                     ,
"
"											aj_plnt                   ,
"
"											aj_jrnl_trns_no           ,
"
"											aj_jrnl_trns_seq_no       ,
"
"											aj_acctg_plnt             ,
"
"											aj_gl_lvl1                ,
"
"											aj_gl_lvl2                ,
"
"											aj_gl_lvl3                ,
"
"											aj_gl_lvl4                ,
"
"											aj_gl_acct                ,
"
"											aj_gl_acct_desc           ,
"
"											aj_reference1             ,
"
"											aj_reference2             ,
"
"											aj_fc_db_amt              ,
"
"											aj_fc_cr_amt              ,
"
"											aj_bc_db_amt              ,
"
"											aj_bc_cr_amt              ,
"
"											aj_db_ex_rate             ,
"
"											aj_cr_ex_rate             ,
"
"											aj_jrnl_date              ,
"
"											aj_jrnl_year              ,
"
"											aj_jrnl_period            ,
"
"											aj_store_id               ,
"
"											aj_store_name             ,
"
"											aj_cls_id                 ,
"
"											aj_cls_desc               ,
"
"											aj_sub_cls_id             ,
"
"											aj_sub_cls_desc           ,
"
"											aj_prod_id                ,
"
"											aj_prod_rev               ,
"
"											aj_prod_desc1             ,
"
"											aj_tc_id                  ,
"
"											aj_tc_desc                ,
"
"											aj_suplr_id               ,
"
"											aj_suplr_name             ,
"
"											aj_cust_id                ,
"
"											aj_cust_name              ,
"
"											aj_area_id                ,
"
"											aj_area_desc              ,
"
"											aj_terr_id                ,
"
"											aj_terr_desc              ,
"
"											aj_bank_id                ,
"
"											aj_bank_name              ,
"
"											aj_fa_grp_id              ,
"
"											aj_fa_grp_desc            ,
"
"											aj_fa_id                  ,
"
"											aj_fa_desc                ,
"
"											aj_dept_id                ,
"
"											aj_dept_desc              ,
"
"											aj_proj_id                ,
"
"											aj_proj_desc              ,
"
"											aj_res_grp_id             ,
"
"											aj_res_grp_desc           ,
"
"											aj_res_id                 ,
"
"											aj_res_desc               ,
"
"											aj_emp_id                 ,
"
"											aj_emp_name               ,
"
"											aj_trans_qty              ,
"
"											aj_unit_cost              ,
"
"											aj_unit_price             ,
"
"											aj_source_doc_mode        ,
"
"											aj_appl                   ,
"
"											aj_status                 ,
"
"											aj_jrnl_no                ,
"
"											aj_cre_by                 ,
"
"											aj_cre_date               ,
"
"											aj_upd_by                 ,
"
"											aj_upd_date               ,
"
"											aj_offset_doc_no          ,
"
"											aj_vou_type               ,
"
"											aj_vou_pfx                ,
"
"											aj_vou_no                 ,
"
"											aj_vou_line_no            ,
"
"											aj_ref_no                 ,
"
"											aj_ref_date,
"
"											aj_gl_lvl_prj
"
"											)
"
"									VALUES(
"
"											p_bu                     ,
"
"											p_plnt                   ,
"
"											v_jrnl_trans_no           ,
"
"											v_jrnl_trans_seq_no       ,
"
"											v_crd_acct_plnt             ,
"
"											v_crd_lvl1                ,
"
"											v_crd_lvl2                ,
"
"											v_crd_lvl3                ,
"
"											v_crd_lvl4                ,
"
"											v_crd_acct                ,
"
"											func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"											'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"											'PRODUCTION COMPLETION'             ,
"
"											0              ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"											0 ,
"
"											ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"											1             ,
"
"											1             ,
"
"											p_doc_date              ,
"
"											func_find_year(p_bu,p_doc_date)              ,
"
"											func_find_period(p_bu,p_doc_date)            ,
"
"											v_post_insp_store               ,
"
"											func_find_store_desc(p_bu,v_post_insp_store,p_lang)             ,
"
"											func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"											func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"											func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"											func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"											p_prod_id               ,
"
"											p_prod_rev              ,
"
"											func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL               ,
"
"											NULL             ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL              ,
"
"											NULL            ,
"
"											NULL                  ,
"
"											NULL                ,
"
"											NULL                ,
"
"										NULL              ,
"
"											NULL                ,
"
"											NULL              ,
"
"											NULL             ,
"
"											NULL           ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											p_comp_qty              ,
"
"											v_unit_cost              ,
"
"											v_unit_cost          ,
"
"											NULL        ,
"
"											'SFM'                   ,
"
"											'N'                 ,
"
"											NULL                ,
"
"											p_user                 ,
"
"											SYSDATE               ,
"
"											NULL                 ,
"
"											NULL               ,
"
"											NULL          ,
"
"											'PCM'               ,
"
"											NULL                ,
"
"											p_trans_no                 ,
"
"											1            ,
"
"											NULL                 ,
"
"											NULL,
"
"											v_crd_prj_lvl
"
"										    );
"
"
"
"	END proc_ins_postinsp_rcpt_jrnl;
"
"
"
"
"
"	PROCEDURE proc_post_journals(p_bu			VARCHAR2,
"
"								 p_plnt			VARCHAR2,
"
"								 p_trans_no		VARCHAR2,
"
"								 p_trans_date	DATE	,
"
"								 p_user			VARCHAR2
"
"								 )
"
"	IS
"
"	v_oprn_narr		VARCHAR2(4000);
"
"	BEGIN
"
"
"
"			SELECT var_oprn_narr
"
"			  INTO v_oprn_narr
"
"			  FROM(SELECT LISTAGG(ptp_oprn_id ||'-'||func_find_mfg_oper_desc(ptp_bu,ptp_plnt,ptp_oprn_id,1),',')
"
"				   WITHIN GROUP (ORDER BY ptp_oprn_id) var_oprn_narr
"
"			  FROM prod_transfer_process
"
"			 WHERE ptp_bu = p_bu
"
"			   AND ptp_plnt = p_plnt
"
"			   AND ptp_trans_no = p_trans_no
"
"			       );
"
"
"
"
"
"
"
"				proc_ins_gl_jrnl(
"
"								p_bu            ,
"
"								p_plnt          ,
"
"								p_trans_date   ,
"
"								func_find_year(p_bu,TRUNC(p_trans_date)),
"
"								func_find_period(p_bu,TRUNC(p_trans_date)),
"
"								NULL,
"
"								p_trans_no    ,
"
"								NULL      ,
"
"								'SFM'      ,
"
"								p_user     ,
"
"								1     ,
"
"								'PROCESS COMPLETION '||p_trans_no ||'#'||v_oprn_narr
"
"								);
"
"
"
"	END	proc_post_journals;
"
"
"
"END pkg_mfg_perpetual_journals;"
/
