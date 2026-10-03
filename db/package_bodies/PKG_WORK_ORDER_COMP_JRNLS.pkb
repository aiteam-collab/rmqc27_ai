CREATE OR REPLACE
"PACKAGE BODY pkg_work_order_comp_jrnls
"
" AS
"
"PROCEDURE  proc_cre_wo_comp_jrnl(p_bu			VARCHAR2,
"
"				 p_plnt			VARCHAR2,
"
"				 p_doc_no		VARCHAR2,
"
"				 p_doc_date		DATE,
"
"				 p_mach_id		VARCHAR2,
"
"				 p_user			VARCHAR2,
"
"				 p_lang			NUMBER
"
"				 )
"
"    IS
"
"CURSOR c0
"
"    IS
"
"SELECT trwmu_store_id,
"
"       trwmu_prod_id ,
"
"       trwmu_prod_rev ,
"
"       trwmu_cons_qty,
"
"       trwmu_unit_cost,
"
"       (trwmu_cons_qty * trwmu_unit_cost) mat_ext_cost
"
"  FROM tool_rep_wo_mtrl_usg
"
" WHERE trwmu_bu = p_bu
"
"   AND trwmu_plnt = p_plnt
"
"   AND trwmu_wo_no = p_doc_no
"
"   AND trwmu_cons_qty > 0
"
"ORDER BY trwmu_seq_no ;
"
"
"
"CURSOR c1
"
"    IS
"
"SELECT trwru_proc_id ,
"
"       trwru_res_id,
"
"       trwru_uom ,
"
"       trwru_qty ,
"
"       trwru_unit_rate,
"
"       trwru_qty * trwru_unit_rate  res_ext_cost
"
"  FROM tool_rep_wo_res_usg
"
" WHERE trwru_bu = p_bu
"
"   AND trwru_plnt = p_plnt
"
"   AND trwru_wo_no  = p_doc_no
"
"ORDER BY trwru_seq_no ;
"
"
"
" CURSOR c2(c_store_id VARCHAR2)
"
"     IS
"
"   SELECT store_gl_acct
"
"     FROM stores
"
"    WHERE store_bu = p_bu
"
"      AND store_plnt = p_plnt
"
"      AND store_id = c_store_id;
"
"
"
" CURSOR c3(c_mach_id VARCHAR2)
"
"   IS
"
" SELECT mfgr_acct       ,
"
"	mfgr_acct_plnt  ,
"
"	mfgr_prj_lvl    ,
"
"	mfgr_lvl1       ,
"
"	mfgr_lvl2       ,
"
"	mfgr_lvl3       ,
"
"	mfgr_lvl4,
"
"    mfgr_lvl5,
"
"    mfgr_lvl6,
"
"    mfgr_cc_code
"
"   FROM mfg_resources
"
"  WHERE mfgr_bu = p_bu
"
"    AND mfgr_plnt = p_plnt
"
"    AND mfgr_res_id = c_mach_id;
"
"
"
"CURSOR c4(c_mach_id VARCHAR2)
"
"    IS
"
"SELECT mfgrg_ac_lvl1,
"
"       mfgrg_ac_lvl2,
"
"       mfgrg_ac_lvl3,
"
"       mfgrg_ac_lvl4,
"
"       mfgrg_ac_lvl5,
"
"	   mfgrg_ac_lvl6,
"
"       mfgrg_current_acct ,
"
"       mfgrg_ac_lvl_prj,
"
"       mfgrg_acct_plnt,
"
"	   mfgrg_cc_code
"
"  FROM mfg_res_groups,mfg_resources
"
" WHERE mfgrg_bu = mfgr_bu
"
"   AND mfgrg_plnt = mfgr_plnt
"
"   AND mfgrg_grp_id = mfgr_group_id
"
"   AND mfgrg_bu = p_bu
"
"   AND mfgrg_plnt = p_plnt
"
"   AND mfgr_bu = p_bu
"
"   AND mfgr_plnt = p_plnt
"
"   AND mfgr_res_id = c_mach_id;
"
"
"
"   v_dbt_acct			stores.store_gl_acct%TYPE;
"
"   v_dbt_prj_lvl		VARCHAR2(10);
"
"   v_dbt_lvl1			VARCHAR2(4);
"
"   v_dbt_lvl2			VARCHAR2(4);
"
"   v_dbt_lvl3			VARCHAR2(4);
"
"   v_dbt_lvl4			VARCHAR2(4);
"
"   v_dbt_lvl5			VARCHAR2(4);
"
"   v_dbt_lvl6			VARCHAR2(4);
"
"   v_dbt_cc_code        VARCHAR2(100);
"
"   v_dbt_acct_plnt		VARCHAR2(10);
"
"   v_dbt_plnt_loc_id    VARCHAR2(10);
"
"   v_crd_lvl1			VARCHAR2(4);
"
"   v_crd_lvl2			VARCHAR2(4);
"
"   v_crd_lvl3			VARCHAR2(4);
"
"   v_crd_lvl4			VARCHAR2(4);
"
"   v_crd_lvl5			VARCHAR2(4);
"
"   v_crd_lvl6			VARCHAR2(4);
"
"   v_crd_acct_plnt		VARCHAR2(10);
"
"   v_crd_plnt_id        VARCHAR2(10);
"
"   v_crd_cc_code        VARCHAR2(100);
"
"   v_crd_acct			stores.store_gl_acct%TYPE;
"
"   v_crd_prj_lvl		VARCHAR2(10);
"
"   v_jrnl_trans_no		VARCHAR2(15);
"
"   v_jrnl_trans_seq_no  NUMBER;
"
"   v_material_cost		NUMBER(17,5);
"
"   v_mach_cost			NUMBER(17,5);
"
"   v_total_cost			NUMBER(17,5);
"
"
"
" cr2   c2%ROWTYPE;
"
" cr3   c3%ROWTYPE;
"
" cr4   c4%ROWTYPE;
"
"
"
" BEGIN
"
"
"
" v_material_cost := 0;
"
"
"
"   	FOR cr0 IN c0
"
"   	LOOP
"
"   		v_material_cost := v_material_cost + ROUND(cr0.mat_ext_cost,func_find_appl_rnddigit(p_bu));
"
"   	END LOOP;
"
"
"
"   	v_mach_cost := 0;
"
"
"
"   	FOR cr1 IN c1
"
"   	LOOP
"
"   		v_mach_cost := v_mach_cost + cr1.res_ext_cost;
"
"  	END LOOP c1;
"
"
"
"  	       v_total_cost := v_material_cost + v_mach_cost;
"
"
"
"   -- raise_application_error(-20999,v_total_cost);
"
"
"
"  	-- Debit Transaction --
"
"
"
"       OPEN c3(p_mach_id);
"
"       FETCH c3 INTO cr3;
"
"
"
"         IF c3%NOTFOUND  OR cr3.mfgr_acct IS NULL OR cr3.mfgr_acct_plnt IS NULL OR cr3.mfgr_prj_lvl IS NULL OR
"
"			    cr3.mfgr_lvl1 IS NULL OR cr3.mfgr_lvl2 IS NULL OR cr3.mfgr_lvl3 IS NULL OR cr3.mfgr_lvl4 IS NULL
"
"               OR cr3.mfgr_lvl5 IS NULL   OR cr3.mfgr_lvl6 IS NULL		THEN
"
"
"
"		OPEN c4(p_mach_id);
"
"		FETCH c4 INTO cr4;
"
"
"
"			IF c4%NOTFOUND OR cr4.mfgrg_ac_lvl1 IS NULL OR cr4.mfgrg_ac_lvl2 IS NULL OR cr4.mfgrg_ac_lvl3 IS NULL
"
"				       OR cr4.mfgrg_ac_lvl4 IS NULL OR cr4.mfgrg_ac_lvl5 IS NULL OR cr4.mfgrg_ac_lvl6 IS NULL
"
"					   OR cr4.mfgrg_current_acct IS NULL OR cr4.mfgrg_ac_lvl_prj IS NULL OR cr4.mfgrg_acct_plnt IS NULL THEN
"
"				RAISE_APPLICATION_ERROR(-20002,'APM'||'/'||p_mach_id);
"
"			 ELSE
"
"				v_dbt_acct      := cr4.mfgrg_current_acct;
"
"				v_dbt_acct_plnt := cr4.mfgrg_acct_plnt;
"
"				v_dbt_lvl1 	:= cr4.mfgrg_ac_lvl1;
"
"				v_dbt_lvl2 	:= cr4.mfgrg_ac_lvl2;
"
"				v_dbt_lvl3	:= cr4.mfgrg_ac_lvl3;
"
"				v_dbt_lvl4 	:= cr4.mfgrg_ac_lvl4;
"
"				v_dbt_lvl5 	:= cr4.mfgrg_ac_lvl5;
"
"				v_dbt_lvl6 	:= cr4.mfgrg_ac_lvl6;
"
"				v_dbt_prj_lvl   := cr4.mfgrg_ac_lvl_prj;
"
"				v_dbt_cc_code := cr4.mfgrg_cc_code;
"
"				v_dbt_plnt_loc_id := func_find_dflt_plnt_loc(p_bu, cr4.mfgrg_acct_plnt);
"
"			END IF;
"
"			CLOSE c4;
"
"
"
"	      ELSE
"
"			v_dbt_acct 	:= cr3.mfgr_acct;
"
"			v_dbt_acct_plnt := cr3.mfgr_acct_plnt;
"
"			v_dbt_lvl1 	:= cr3.mfgr_lvl1;
"
"			v_dbt_lvl2 	:= cr3.mfgr_lvl2;
"
"			v_dbt_lvl3 	:= cr3.mfgr_lvl3;
"
"			v_dbt_lvl4 	:= cr3.mfgr_lvl4;
"
"            v_dbt_lvl5 	:= cr3.mfgr_lvl5;
"
"            v_dbt_lvl6 	:= cr3.mfgr_lvl6;
"
"			v_dbt_prj_lvl   := cr3.mfgr_prj_lvl;
"
"			v_dbt_cc_code  := cr3.mfgr_cc_code;
"
"			v_dbt_plnt_loc_id := func_find_dflt_plnt_loc(p_bu, cr3.mfgr_acct_plnt);
"
"         END IF;
"
"
"
"       CLOSE c3;
"
"
"
"      	 	v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"       		SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"       		  INTO v_jrnl_trans_seq_no
"
"       		  FROM appl_journals
"
"       		 WHERE aj_bu           = p_bu
"
"       		   AND aj_plnt         = p_plnt
"
"       		   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"       		INSERT INTO appl_journals(
"
"       					aj_bu                     ,
"
"       					aj_plnt                   ,
"
"       					aj_jrnl_trns_no           ,
"
"       					aj_jrnl_trns_seq_no       ,
"
"       					aj_acctg_plnt             ,
"
"       					aj_gl_lvl1                ,
"
"       					aj_gl_lvl2                ,
"
"       					aj_gl_lvl3                ,
"
"       					aj_gl_lvl4                ,
"
"                        aj_gl_lvl5                ,
"
"                        aj_gl_lvl6                ,
"
"       					aj_gl_acct                ,
"
"       					aj_gl_acct_desc           ,
"
"                        aj_cc_code                ,
"
"       					aj_reference1             ,
"
"       					aj_reference2             ,
"
"       					aj_fc_db_amt              ,
"
"       					aj_fc_cr_amt              ,
"
"       					aj_bc_db_amt              ,
"
"       					aj_bc_cr_amt              ,
"
"       					aj_db_ex_rate             ,
"
"       					aj_cr_ex_rate             ,
"
"       					aj_jrnl_date              ,
"
"       					aj_jrnl_year              ,
"
"       					aj_jrnl_period            ,
"
"       					aj_store_id               ,
"
"       					aj_store_name             ,
"
"       					aj_cls_id                 ,
"
"       					aj_cls_desc               ,
"
"       					aj_sub_cls_id             ,
"
"       					aj_sub_cls_desc           ,
"
"       					aj_prod_id                ,
"
"       					aj_prod_rev               ,
"
"       					aj_prod_desc1             ,
"
"       					aj_tc_id                  ,
"
"       					aj_tc_desc                ,
"
"       					aj_suplr_id               ,
"
"       					aj_suplr_name             ,
"
"       					aj_cust_id                ,
"
"       					aj_cust_name              ,
"
"       					aj_area_id                ,
"
"       					aj_area_desc              ,
"
"       					aj_terr_id                ,
"
"       					aj_terr_desc              ,
"
"       					aj_bank_id                ,
"
"       					aj_bank_name              ,
"
"       					aj_fa_grp_id              ,
"
"       					aj_fa_grp_desc            ,
"
"       					aj_fa_id                  ,
"
"       					aj_fa_desc                ,
"
"       					aj_dept_id                ,
"
"       					aj_dept_desc              ,
"
"       					aj_proj_id                ,
"
"       					aj_proj_desc              ,
"
"       					aj_res_grp_id             ,
"
"       					aj_res_grp_desc           ,
"
"       					aj_res_id                 ,
"
"       					aj_res_desc               ,
"
"       					aj_emp_id                 ,
"
"       					aj_emp_name               ,
"
"       					aj_trans_qty              ,
"
"       					aj_unit_cost              ,
"
"       					aj_unit_price             ,
"
"       					aj_source_doc_mode        ,
"
"       					aj_appl                   ,
"
"       					aj_status                 ,
"
"       					aj_jrnl_no                ,
"
"       					aj_cre_by                 ,
"
"       					aj_cre_date               ,
"
"       					aj_upd_by                 ,
"
"       					aj_upd_date               ,
"
"       					aj_offset_doc_no          ,
"
"       					aj_vou_type               ,
"
"       					aj_vou_pfx                ,
"
"       					aj_vou_no                 ,
"
"       					aj_vou_line_no            ,
"
"       					aj_ref_no                 ,
"
"       					aj_ref_date,
"
"       					aj_gl_lvl_prj,
"
"						aj_gl_plnt_loc_id,
"
"						aj_sub_vou_type
"
"       					)
"
"       				 VALUES(
"
"       					p_bu 	     ,
"
"       					p_plnt 	     ,
"
"       					v_jrnl_trans_no  ,
"
"       					v_jrnl_trans_seq_no  ,
"
"       					v_dbt_acct_plnt  ,
"
"       					v_dbt_lvl1    ,
"
"       					v_dbt_lvl2    ,
"
"       					v_dbt_lvl3    ,
"
"       					v_dbt_lvl4    ,
"
"                        v_dbt_lvl5    ,
"
"                        v_dbt_lvl6    ,
"
"       					v_dbt_acct    ,
"
"       					func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang) ,
"
"                        v_dbt_cc_code,
"
"       					'TOOL MAINT. WO( '||p_doc_no  ||')',
"
"       					'TOOL MAINT. WO' ,
"
"       					ROUND(v_total_cost,func_find_appl_rnddigit(p_bu)) ,
"
"       					0              ,
"
"       					ROUND(v_total_cost,func_find_appl_rnddigit(p_bu)) ,
"
"       					0              ,
"
"       					1              ,
"
"       					1              ,
"
"       					p_doc_date     ,
"
"       					func_find_year(p_bu,p_doc_date)              ,
"
"       					func_find_period(p_bu,p_doc_date)            ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					0              ,
"
"       					v_total_cost   ,
"
"       					v_total_cost   ,
"
"       					NULL           ,
"
"       					'SFM'          ,
"
"       					'N'            ,
"
"       					NULL           ,
"
"       					p_user         ,
"
"       					SYSDATE        ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					NULL           ,
"
"       					'PCM'          ,
"
"       					NULL           ,
"
"       					p_doc_no       ,
"
"       					1              ,
"
"       					NULL           ,
"
"       					NULL	       ,
"
"       					v_dbt_prj_lvl,
"
"						v_dbt_plnt_loc_id,
"
"						'PCM'
"
"				        );
"
"  	/*IF SQL%FOUND THEN
"
"       RAISE_APPLICATION_ERROR(-20999,'SUCCESS');
"
"    ELSE
"
"      RAISE_APPLICATION_ERROR(-20999,'UN-SUCCESS');
"
"    END IF;*/
"
"
"
"  	FOR cr0 IN c0
"
"	LOOP
"
"
"
"		OPEN c2(cr0.trwmu_store_id);
"
"		FETCH c2 INTO cr2;
"
"
"
"			IF c2%NOTFOUND OR cr2.store_gl_acct IS NULL THEN
"
"				RAISE_APPLICATION_ERROR(-20002,'APM'||'/'||cr0.trwmu_store_id);
"
"			ELSE
"
"			   v_crd_acct := cr2.store_gl_acct;
"
"			END IF;
"
"
"
"		CLOSE c2;
"
"
"
"		  proc_find_cost_center(p_bu    ,
"
"					p_plnt  ,
"
"					NULL,
"
"					v_crd_acct,
"
"					NULL ,
"
"					NULL ,
"
"					NULL ,
"
"					NULL ,
"
"					v_crd_lvl1,
"
"					v_crd_lvl2,
"
"					v_crd_lvl3,
"
"					v_crd_lvl4,
"
"					v_crd_lvl5,
"
"					v_crd_lvl6,
"
"					v_crd_prj_lvl,
"
"					v_crd_acct_plnt  ,
"
"					v_crd_cc_code,
"
"					v_crd_plnt_id
"
"					);
"
"
"
"
"
"		IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"		   RAISE_APPLICATION_ERROR(-20002,'APM'||'/'||cr0.trwmu_store_id);
"
"		END IF;
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
"	      INSERT INTO appl_journals(aj_bu                     ,
"
"					aj_plnt                   ,
"
"					aj_jrnl_trns_no           ,
"
"					aj_jrnl_trns_seq_no       ,
"
"					aj_acctg_plnt             ,
"
"					aj_gl_lvl1                ,
"
"					aj_gl_lvl2                ,
"
"					aj_gl_lvl3                ,
"
"					aj_gl_lvl4                ,
"
"                    aj_gl_lvl5                ,
"
"                    aj_gl_lvl6                ,
"
"					aj_gl_acct                ,
"
"					aj_gl_acct_desc           ,
"
"                    aj_cc_code                ,
"
"					aj_reference1             ,
"
"					aj_reference2             ,
"
"					aj_fc_db_amt              ,
"
"					aj_fc_cr_amt              ,
"
"					aj_bc_db_amt              ,
"
"					aj_bc_cr_amt              ,
"
"					aj_db_ex_rate             ,
"
"					aj_cr_ex_rate             ,
"
"					aj_jrnl_date              ,
"
"					aj_jrnl_year              ,
"
"					aj_jrnl_period            ,
"
"					aj_store_id               ,
"
"					aj_store_name             ,
"
"					aj_cls_id                 ,
"
"					aj_cls_desc               ,
"
"					aj_sub_cls_id             ,
"
"					aj_sub_cls_desc           ,
"
"					aj_prod_id                ,
"
"					aj_prod_rev               ,
"
"					aj_prod_desc1             ,
"
"					aj_tc_id                  ,
"
"					aj_tc_desc                ,
"
"					aj_suplr_id               ,
"
"					aj_suplr_name             ,
"
"					aj_cust_id                ,
"
"					aj_cust_name              ,
"
"					aj_area_id                ,
"
"					aj_area_desc              ,
"
"					aj_terr_id                ,
"
"					aj_terr_desc              ,
"
"					aj_bank_id                ,
"
"					aj_bank_name              ,
"
"					aj_fa_grp_id              ,
"
"					aj_fa_grp_desc            ,
"
"					aj_fa_id                  ,
"
"					aj_fa_desc                ,
"
"					aj_dept_id                ,
"
"					aj_dept_desc              ,
"
"					aj_proj_id                ,
"
"					aj_proj_desc              ,
"
"					aj_res_grp_id             ,
"
"					aj_res_grp_desc           ,
"
"					aj_res_id                 ,
"
"					aj_res_desc               ,
"
"					aj_emp_id                 ,
"
"					aj_emp_name               ,
"
"					aj_trans_qty              ,
"
"					aj_unit_cost              ,
"
"					aj_unit_price             ,
"
"					aj_source_doc_mode        ,
"
"					aj_appl                   ,
"
"					aj_status                 ,
"
"					aj_jrnl_no                ,
"
"					aj_cre_by                 ,
"
"					aj_cre_date               ,
"
"					aj_upd_by                 ,
"
"					aj_upd_date               ,
"
"					aj_offset_doc_no          ,
"
"					aj_vou_type               ,
"
"					aj_vou_pfx                ,
"
"					aj_vou_no                 ,
"
"					aj_vou_line_no            ,
"
"					aj_ref_no                 ,
"
"					aj_ref_date		  ,
"
"					aj_gl_lvl_prj,
"
"					aj_gl_plnt_loc_id,
"
"					aj_sub_vou_type
"
"					)
"
"				 VALUES(
"
"					p_bu                     ,
"
"					p_plnt                   ,
"
"					v_jrnl_trans_no          ,
"
"					v_jrnl_trans_seq_no      ,
"
"					v_crd_acct_plnt          ,
"
"					v_crd_lvl1               ,
"
"					v_crd_lvl2               ,
"
"					v_crd_lvl3               ,
"
"					v_crd_lvl4               ,
"
"                    v_crd_lvl5               ,
"
"                    v_crd_lvl6               ,
"
"					v_crd_acct               ,
"
"					func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                    v_crd_cc_code,
"
"					'TOOL MAINT. WO('||p_doc_no||')'           ,
"
"					'TOOL MAINT. WO '             ,
"
"					0              ,
"
"					ROUND(cr0.mat_ext_cost,func_find_appl_rnddigit(p_bu))  ,
"
"					0 	       ,
"
"					ROUND(cr0.mat_ext_cost,func_find_appl_rnddigit(p_bu)) ,
"
"					1              ,
"
"					1              ,
"
"					p_doc_date     ,
"
"					func_find_year(p_bu,p_doc_date)   ,
"
"					func_find_period(p_bu,p_doc_date) ,
"
"					cr0.trwmu_store_id                ,
"
"					func_find_store_desc(p_bu,cr0.trwmu_store_id,p_lang)             ,
"
"					func_find_product_class(p_bu,p_plnt,cr0.trwmu_prod_id,cr0.trwmu_prod_rev)                 ,
"
"					func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,cr0.trwmu_prod_id,cr0.trwmu_prod_rev),p_lang)               ,
"
"					func_find_product_subclass(p_bu,p_plnt,cr0.trwmu_prod_id,cr0.trwmu_prod_rev)             ,
"
"					func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,cr0.trwmu_prod_id,cr0.trwmu_prod_rev),p_lang)           ,
"
"					cr0.trwmu_prod_id  ,
"
"					cr0.trwmu_prod_rev ,
"
"					func_find_prod_desc(p_bu,cr0.trwmu_prod_id,cr0.trwmu_prod_rev,p_lang) ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					cr0.trwmu_cons_qty    ,
"
"					cr0.trwmu_unit_cost   ,
"
"					cr0.trwmu_unit_cost   ,
"
"					NULL             ,
"
"					'SFM'            ,
"
"					'N'              ,
"
"					NULL             ,
"
"					p_user           ,
"
"					SYSDATE          ,
"
"					NULL             ,
"
"					NULL             ,
"
"					NULL             ,
"
"					'PCM'            ,
"
"					NULL             ,
"
"					p_doc_no         ,
"
"					1                ,
"
"					NULL             ,
"
"					NULL		 ,
"
"					v_crd_prj_lvl,
"
"					v_crd_plnt_id,
"
"					'PCM'
"
"					);
"
"
"
"    END LOOP c0;
"
"
"
"	FOR cr1 IN c1
"
"	LOOP
"
"		OPEN c3(cr1.trwru_res_id);
"
"		FETCH c3 INTO cr3;
"
"
"
"			IF c3%NOTFOUND OR cr3.mfgr_acct IS NULL OR cr3.mfgr_acct_plnt IS NULL OR cr3.mfgr_prj_lvl IS NULL OR
"
"					  cr3.mfgr_lvl1 IS NULL OR cr3.mfgr_lvl2 IS NULL OR cr3.mfgr_lvl3 IS NULL OR cr3.mfgr_lvl4 IS NULL
"
"					  OR cr3.mfgr_lvl5 IS NULL OR cr3.mfgr_lvl6 IS NULL THEN
"
"
"
"				OPEN c4(cr1.trwru_res_id);
"
"				FETCH c4 INTO cr4;
"
"
"
"					IF c4%NOTFOUND OR cr4.mfgrg_ac_lvl1 IS NULL OR cr4.mfgrg_ac_lvl2 IS NULL OR cr4.mfgrg_ac_lvl3 IS NULL
"
"						       OR cr4.mfgrg_ac_lvl4 IS NULL OR cr4.mfgrg_ac_lvl5 IS NULL OR cr4.mfgrg_ac_lvl6 IS NULL
"
"							   OR cr4.mfgrg_current_acct IS NULL OR cr4.mfgrg_ac_lvl_prj IS NULL OR cr4.mfgrg_acct_plnt IS NULL THEN
"
"
"
"						RAISE_APPLICATION_ERROR(-20002,'APM');
"
"					ELSE
"
"
"
"						v_crd_acct 	:= cr4.mfgrg_current_acct;
"
"						v_crd_acct_plnt := cr4.mfgrg_acct_plnt;
"
"						v_crd_lvl1 	:= cr4.mfgrg_ac_lvl1;
"
"						v_crd_lvl2 	:= cr4.mfgrg_ac_lvl2;
"
"						v_crd_lvl3 	:= cr4.mfgrg_ac_lvl3;
"
"						v_crd_lvl4 	:= cr4.mfgrg_ac_lvl4;
"
"						v_crd_lvl5 	:= cr4.mfgrg_ac_lvl5;
"
"						v_crd_lvl6 	:= cr4.mfgrg_ac_lvl6;
"
"						v_crd_cc_code := cr4.mfgrg_cc_code;
"
"						v_crd_prj_lvl   := cr4.mfgrg_ac_lvl_prj;
"
"						v_crd_plnt_id := func_find_dflt_plnt_loc(p_bu, cr4.mfgrg_acct_plnt);
"
"
"
"					END IF;
"
"				CLOSE c4;
"
"			ELSE
"
"					v_crd_acct 	:= cr3.mfgr_acct;
"
"					v_crd_acct_plnt := cr3.mfgr_acct_plnt;
"
"					v_crd_lvl1 	:= cr3.mfgr_lvl1;
"
"					v_crd_lvl2 	:= cr3.mfgr_lvl2;
"
"					v_crd_lvl3 	:= cr3.mfgr_lvl3;
"
"					v_crd_lvl4 	:= cr3.mfgr_lvl4;
"
"                    v_crd_lvl5 	:= cr3.mfgr_lvl5;
"
"                    v_crd_lvl6 	:= cr3.mfgr_lvl6;
"
"                    v_crd_cc_code := cr3.mfgr_cc_code;
"
"					v_crd_prj_lvl 	:= cr3.mfgr_prj_lvl;
"
"					v_crd_plnt_id := func_find_dflt_plnt_loc(p_bu, cr3.mfgr_acct_plnt);
"
"
"
"			END IF;
"
"			CLOSE c3;
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
"			INSERT INTO appl_journals(
"
"						aj_bu                     ,
"
"						aj_plnt                   ,
"
"						aj_jrnl_trns_no           ,
"
"						aj_jrnl_trns_seq_no       ,
"
"						aj_acctg_plnt             ,
"
"						aj_gl_lvl1                ,
"
"						aj_gl_lvl2                ,
"
"						aj_gl_lvl3                ,
"
"						aj_gl_lvl4                ,
"
"                        aj_gl_lvl5                ,
"
"                        aj_gl_lvl6                ,
"
"						aj_gl_acct                ,
"
"						aj_gl_acct_desc           ,
"
"                        aj_cc_code            ,
"
"						aj_reference1             ,
"
"						aj_reference2             ,
"
"						aj_fc_db_amt              ,
"
"						aj_fc_cr_amt              ,
"
"						aj_bc_db_amt              ,
"
"						aj_bc_cr_amt              ,
"
"						aj_db_ex_rate             ,
"
"						aj_cr_ex_rate             ,
"
"						aj_jrnl_date              ,
"
"						aj_jrnl_year              ,
"
"						aj_jrnl_period            ,
"
"						aj_store_id               ,
"
"						aj_store_name             ,
"
"						aj_cls_id                 ,
"
"						aj_cls_desc               ,
"
"						aj_sub_cls_id             ,
"
"						aj_sub_cls_desc           ,
"
"						aj_prod_id                ,
"
"						aj_prod_rev               ,
"
"						aj_prod_desc1             ,
"
"						aj_tc_id                  ,
"
"						aj_tc_desc                ,
"
"						aj_suplr_id               ,
"
"						aj_suplr_name             ,
"
"						aj_cust_id                ,
"
"						aj_cust_name              ,
"
"						aj_area_id                ,
"
"						aj_area_desc              ,
"
"						aj_terr_id                ,
"
"						aj_terr_desc              ,
"
"						aj_bank_id                ,
"
"						aj_bank_name              ,
"
"						aj_fa_grp_id              ,
"
"						aj_fa_grp_desc            ,
"
"						aj_fa_id                  ,
"
"						aj_fa_desc                ,
"
"						aj_dept_id                ,
"
"						aj_dept_desc              ,
"
"						aj_proj_id                ,
"
"						aj_proj_desc              ,
"
"						aj_res_grp_id             ,
"
"						aj_res_grp_desc           ,
"
"						aj_res_id                 ,
"
"						aj_res_desc               ,
"
"						aj_emp_id                 ,
"
"						aj_emp_name               ,
"
"						aj_trans_qty              ,
"
"						aj_unit_cost              ,
"
"						aj_unit_price             ,
"
"						aj_source_doc_mode        ,
"
"						aj_appl                   ,
"
"						aj_status                 ,
"
"						aj_jrnl_no                ,
"
"						aj_cre_by                 ,
"
"						aj_cre_date               ,
"
"						aj_upd_by                 ,
"
"						aj_upd_date               ,
"
"						aj_offset_doc_no          ,
"
"						aj_vou_type               ,
"
"						aj_vou_pfx                ,
"
"						aj_vou_no                 ,
"
"						aj_vou_line_no            ,
"
"						aj_ref_no                 ,
"
"						aj_ref_date		  ,
"
"						aj_gl_lvl_prj,
"
"						aj_gl_plnt_loc_id,
"
"						aj_sub_vou_type
"
"						)
"
"					VALUES(
"
"						p_bu                      ,
"
"						p_plnt                    ,
"
"						v_jrnl_trans_no           ,
"
"						v_jrnl_trans_seq_no       ,
"
"						v_crd_acct_plnt           ,
"
"						v_crd_lvl1                ,
"
"						v_crd_lvl2                ,
"
"						v_crd_lvl3                ,
"
"						v_crd_lvl4                ,
"
"                        v_crd_lvl5                ,
"
"                        v_crd_lvl6                ,
"
"						v_crd_acct                ,
"
"						func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)  ,
"
"						v_crd_cc_code  ,
"
"						'TOOL MAINT. WO ('||p_doc_no  ||')' ,
"
"						'TOOL MAINT. WO',
"
"						0               ,
"
"						ROUND(cr1.res_ext_cost,func_find_appl_rnddigit(p_bu)) ,
"
"						0 	        ,
"
"						ROUND(cr1.res_ext_cost,func_find_appl_rnddigit(p_bu)) ,
"
"						1               ,
"
"						1               ,
"
"						p_doc_date      ,
"
"						func_find_year(p_bu,p_doc_date)              ,
"
"						func_find_period(p_bu,p_doc_date)            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL		,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						NULL            ,
"
"						0               ,
"
"						cr1.res_ext_cost ,
"
"						cr1.res_ext_cost ,
"
"						NULL             ,
"
"						'SFM'            ,
"
"						'N'              ,
"
"						NULL             ,
"
"						p_user           ,
"
"						SYSDATE          ,
"
"						NULL             ,
"
"						NULL             ,
"
"						NULL             ,
"
"						'PCM'            ,
"
"						NULL             ,
"
"						p_doc_no         ,
"
"						1                ,
"
"						NULL             ,
"
"						NULL		 ,
"
"						v_crd_prj_lvl,
"
"						v_crd_plnt_id,
"
"						'PCM'
"
"						 );
"
"
"
"
"
"	END LOOP;
"
"
"
"END proc_cre_wo_comp_jrnl;
"
"
"
" END pkg_work_order_comp_jrnls;"
/
