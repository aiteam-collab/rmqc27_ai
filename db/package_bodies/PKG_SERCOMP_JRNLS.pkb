CREATE OR REPLACE
"PACKAGE BODY        pkg_sercomp_jrnls
"
"  AS
"
"
"
"PROCEDURE proc_cre_labor_oprn_comp_jrnl
"
"(
"
" p_bu            VARCHAR2,
"
" p_plnt            VARCHAR2,
"
" p_trans_no        VARCHAR2,
"
" p_doc_date        DATE,
"
" p_prod_id        VARCHAR2,
"
" p_prod_rev        NUMBER,
"
" p_prod_ord_no        VARCHAR2,
"
" p_comp_qty        NUMBER,
"
" p_user            VARCHAR2,
"
" p_lang            NUMBER
"
" )
"
" IS
"
"
"
"  CURSOR c1
"
"    IS
"
"  SELECT ptmc_seq_no,ptmc_prod_id,ptmc_prod_rev,ptmc_store_id,
"
"       ptmc_cons_qty,ptmc_unit_cost,(ptmc_cons_qty * ptmc_unit_cost) ptmc_ext_cost
"
"    FROM prod_transfer_mat_cons
"
"   WHERE ptmc_bu = p_bu
"
"     AND ptmc_plnt = p_plnt
"
"     AND ptmc_trans_no = p_trans_no
"
"     AND ptmc_cons_qty > 0
"
"     AND ROUND((ptmc_cons_qty * ptmc_unit_cost),2) > 0
"
"     AND func_find_prod_cust_flag(p_bu,ptmc_prod_id,ptmc_prod_Rev) IN ('N')
"
"    ORDER BY ptmc_seq_no;
"
"
"
"
"
"   CURSOR c3(c_store_id VARCHAR2)
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
" CURSOR c4(c_mach_id VARCHAR2)
"
"   IS
"
" SELECT mfgr_acct       ,
"
"    mfgr_acct_plnt  ,
"
"    mfgr_prj_lvl    ,
"
"    mfgr_lvl1       ,
"
"    mfgr_lvl2       ,
"
"    mfgr_lvl3       ,
"
"    mfgr_lvl4
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
" CURSOR c5(c_mach_id VARCHAR2)
"
"   IS
"
"SELECT mfgrg_ac_lvl1,
"
"       mfgrg_ac_lvl2,
"
"       mfgrg_ac_lvl3,
"
"       mfgrg_ac_lvl4,
"
"       mfgrg_current_acct ,
"
"       mfgrg_ac_lvl_prj,
"
"       mfgrg_acct_plnt
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
"
"
"CURSOR c6
"
"  IS
"
"SELECT *
"
"  FROM prod_transfer_process,oh_basis_subelement
"
" WHERE ptp_bu  = ohbs_bu
"
"   AND ptp_plnt = ohbs_plnt
"
"   AND ptp_oprn_id = ohbs_oprn_id
"
"   AND ohbs_bu = p_bu
"
"   AND ohbs_plnt = p_plnt
"
"   AND ohbs_prod_id = p_prod_id
"
"   AND ohbs_prod_rev = p_prod_rev
"
"   AND ohbs_status = 'A'
"
"   AND ohbs_basis = 'A'
"
"   AND ptp_bu = p_bu
"
"   AND ptp_plnt = p_plnt
"
"   AND ptp_trans_no = p_trans_no;
"
"
"
" CURSOR c7(c_element_id VARCHAR2)
"
"   IS
"
" SELECT moa_acct
"
"   FROM mfg_oh_accts
"
"  WHERE moa_bu = p_bu
"
"    AND moa_cs_elmnt_id = c_element_id;
"
"
"
"
"
"
"
"   v_material_cost        NUMBER(17,5);
"
"   v_mach_cost            NUMBER(17,5);
"
"   v_oh_cost            NUMBER(17,5);
"
"   v_total_cost            NUMBER(17,5);
"
"   v_oc_store            VARCHAR2(10);
"
"   v_dbt_acct            stores.store_gl_acct%TYPE;
"
"   v_dbt_prj_lvl        VARCHAR2(10);
"
"   v_dbt_lvl1            VARCHAR2(4);
"
"   v_dbt_lvl2            VARCHAR2(4);
"
"   v_dbt_lvl3            VARCHAR2(4);
"
"   v_dbt_lvl4            VARCHAR2(4);
"
"   v_dbt_lvl5            VARCHAR2(4);
"
"   v_dbt_lvl6            VARCHAR2(4);
"
"   v_dbt_cc_code                VARCHAR2(50);
"
"   v_dbt_acct_plnt        VARCHAR2(10);
"
"   v_dbt_act                    VARCHAR2(10);
"
"   v_crd_lvl1            VARCHAR2(4);
"
"   v_crd_lvl2            VARCHAR2(4);
"
"   v_crd_lvl3            VARCHAR2(4);
"
"   v_crd_lvl4            VARCHAR2(4);
"
"   v_crd_lvl5            VARCHAR2(4);
"
"   v_crd_lvl6            VARCHAR2(4);
"
"   v_crd_cc_code                VARCHAR2(50);
"
"   v_crd_acct_plnt        VARCHAR2(10);
"
"   v_crd_act                    VARCHAR2(10);
"
"   v_crd_acct            stores.store_gl_acct%TYPE;
"
"   v_crd_prj_lvl        VARCHAR2(10);
"
"   v_jrnl_trans_no        VARCHAR2(15);
"
"   v_jrnl_trans_seq_no        NUMBER;
"
"   v_loc_id        VARCHAR2(10);
"
"
"
"   cr3                c3%ROWTYPE;
"
"   cr4                c4%ROWTYPE;
"
"   cr5                c5%ROWTYPE;
"
"   cr6                c6%ROWTYPE;
"
"   cr7                c7%ROWTYPE;
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
"      v_material_cost := 0;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"          v_material_cost := v_material_cost + ROUND(cr1.ptmc_ext_cost,func_find_appl_rnddigit(p_bu));
"
"      END LOOP;
"
"
"
"      v_mach_cost := 0;
"
"
"
"
"
"
"
"      v_oh_cost := 0;
"
"
"
"    OPEN c6;
"
"      FETCH c6 INTO cr6;
"
"        IF c6%NOTFOUND THEN
"
"            raise_application_error(-20523,'BUD');
"
"        END IF;
"
"      CLOSE c6;
"
"
"
"      FOR cr6 IN c6
"
"      LOOP
"
"          v_oh_cost := v_oh_cost + (cr6.ohbs_rate * p_comp_qty);
"
"
"
"      END LOOP;
"
"
"
"
"
"
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM' || v_material_cost ||'/'||v_mach_cost ||'/'||v_oh_cost);
"
"      v_total_cost := v_material_cost + v_mach_cost + v_oh_cost;
"
"
"
"      -- debit transaction
"
"
"
"    SELECT pt_loc_id
"
"      INTO v_loc_id
"
"      FROM prod_transfer
"
"     WHERE pt_bu    =    p_bu
"
"       AND pt_plnt    =    p_plnt
"
"       AND pt_trans_no    =    p_trans_no;
"
"
"
"      v_oc_store := func_find_store_fr_type(p_bu,p_plnt,v_loc_id, 'Q');
"
"
"
"      OPEN c3(v_oc_store);
"
"      FETCH c3 INTO cr3;
"
"      IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"         RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"    ELSE
"
"       v_dbt_acct := cr3.store_gl_acct;
"
"      END IF;
"
"
"
"      CLOSE c3;
"
"
"
"
"
"      proc_find_cost_center(
"
"                p_bu    ,
"
"                p_plnt  ,
"
"                NULL,
"
"                v_dbt_acct,
"
"                NULL ,
"
"                NULL ,
"
"                NULL ,
"
"                NULL ,
"
"                v_dbt_lvl1,
"
"                v_dbt_lvl2,
"
"                v_dbt_lvl3,
"
"                v_dbt_lvl4,
"
"                v_dbt_lvl5,
"
"                v_dbt_lvl6,
"
"                v_dbt_prj_lvl,
"
"                v_dbt_acct_plnt,
"
"                v_dbt_cc_code,
"
"                v_dbt_act
"
"                );
"
"
"
"
"
"    IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"    END IF;
"
"
"
"
"
"
"
"     v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"        SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"          INTO v_jrnl_trans_seq_no
"
"          FROM appl_journals
"
"         WHERE aj_bu = p_bu
"
"           AND aj_plnt = p_plnt
"
"           AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"        INSERT INTO appl_journals(
"
"                    aj_bu                     ,
"
"                    aj_plnt                   ,
"
"                    aj_jrnl_trns_no           ,
"
"                    aj_jrnl_trns_seq_no       ,
"
"                    aj_acctg_plnt             ,
"
"                    aj_gl_lvl1                ,
"
"                    aj_gl_lvl2                ,
"
"                    aj_gl_lvl3                ,
"
"                    aj_gl_lvl4                ,
"
"                    aj_gl_acct                ,
"
"                    aj_gl_acct_desc           ,
"
"                    aj_reference1             ,
"
"                    aj_reference2             ,
"
"                    aj_fc_db_amt              ,
"
"                    aj_fc_cr_amt              ,
"
"                    aj_bc_db_amt              ,
"
"                    aj_bc_cr_amt              ,
"
"                    aj_db_ex_rate             ,
"
"                    aj_cr_ex_rate             ,
"
"                    aj_jrnl_date              ,
"
"                    aj_jrnl_year              ,
"
"                    aj_jrnl_period            ,
"
"                    aj_store_id               ,
"
"                    aj_store_name             ,
"
"                    aj_cls_id                 ,
"
"                    aj_cls_desc               ,
"
"                    aj_sub_cls_id             ,
"
"                    aj_sub_cls_desc           ,
"
"                    aj_prod_id                ,
"
"                    aj_prod_rev               ,
"
"                    aj_prod_desc1             ,
"
"                    aj_tc_id                  ,
"
"                    aj_tc_desc                ,
"
"                    aj_suplr_id               ,
"
"                    aj_suplr_name             ,
"
"                    aj_cust_id                ,
"
"                    aj_cust_name              ,
"
"                    aj_area_id                ,
"
"                    aj_area_desc              ,
"
"                    aj_terr_id                ,
"
"                    aj_terr_desc              ,
"
"                    aj_bank_id                ,
"
"                    aj_bank_name              ,
"
"                    aj_fa_grp_id              ,
"
"                    aj_fa_grp_desc            ,
"
"                    aj_fa_id                  ,
"
"                    aj_fa_desc                ,
"
"                    aj_dept_id                ,
"
"                    aj_dept_desc              ,
"
"                    aj_proj_id                ,
"
"                    aj_proj_desc              ,
"
"                    aj_res_grp_id             ,
"
"                    aj_res_grp_desc           ,
"
"                    aj_res_id                 ,
"
"                    aj_res_desc               ,
"
"                    aj_emp_id                 ,
"
"                    aj_emp_name               ,
"
"                    aj_trans_qty              ,
"
"                    aj_unit_cost              ,
"
"                    aj_unit_price             ,
"
"                    aj_source_doc_mode        ,
"
"                    aj_appl                   ,
"
"                    aj_status                 ,
"
"                    aj_jrnl_no                ,
"
"                    aj_cre_by                 ,
"
"                    aj_cre_date               ,
"
"                    aj_upd_by                 ,
"
"                    aj_upd_date               ,
"
"                    aj_offset_doc_no          ,
"
"                    aj_vou_type               ,
"
"                    aj_vou_pfx                ,
"
"                    aj_vou_no                 ,
"
"                    aj_vou_line_no            ,
"
"                    aj_ref_no                 ,
"
"                    aj_ref_date,
"
"                    aj_gl_lvl_prj
"
"                    )
"
"                VALUES(
"
"                    p_bu                     ,
"
"                    p_plnt                   ,
"
"                    v_jrnl_trans_no           ,
"
"                    v_jrnl_trans_seq_no       ,
"
"                    v_dbt_acct_plnt             ,
"
"                    v_dbt_lvl1                ,
"
"                    v_dbt_lvl2                ,
"
"                    v_dbt_lvl3                ,
"
"                    v_dbt_lvl4                ,
"
"                    v_dbt_acct                ,
"
"                    func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                    'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                    'PRODUCTION COMPLETION'             ,
"
"                    ROUND(v_total_cost,func_find_appl_rnddigit(p_bu))              ,
"
"                    0              ,
"
"                    ROUND(v_total_cost,func_find_appl_rnddigit(p_bu)) ,
"
"                    0              ,
"
"                    1             ,
"
"                    1             ,
"
"                    p_doc_date              ,
"
"                    func_find_year(p_bu,p_doc_date)              ,
"
"                    func_find_period(p_bu,p_doc_date)            ,
"
"                    v_oc_store               ,
"
"                    func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"                    func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                    func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                    func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                    func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                    p_prod_id               ,
"
"                    p_prod_rev              ,
"
"                    func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                    NULL                  ,
"
"                    NULL                ,
"
"                    NULL               ,
"
"                    NULL             ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL              ,
"
"                    NULL            ,
"
"                    NULL                  ,
"
"                    NULL                ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL             ,
"
"                    NULL           ,
"
"                    NULL                 ,
"
"                    NULL               ,
"
"                    NULL                 ,
"
"                    NULL               ,
"
"                    p_comp_qty              ,
"
"                    v_total_cost/p_comp_qty              ,
"
"                    v_total_cost/p_comp_qty           ,
"
"                    NULL        ,
"
"                    'SFM'                   ,
"
"                    'N'                 ,
"
"                    NULL                ,
"
"                    p_user                 ,
"
"                    SYSDATE               ,
"
"                    NULL                 ,
"
"                    NULL               ,
"
"                    NULL          ,
"
"                    'PCM'               ,
"
"                    NULL                ,
"
"                    p_trans_no                 ,
"
"                    1            ,
"
"                    NULL                 ,
"
"                    NULL,
"
"                    v_dbt_prj_lvl
"
"                      );
"
"
"
"                -- credit transaction
"
"
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                    OPEN c3(cr1.ptmc_store_id);
"
"                    FETCH c3 INTO cr3;
"
"                    IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    ELSE
"
"                       v_crd_acct := cr3.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c3;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                p_bu    ,
"
"                                p_plnt  ,
"
"                                NULL,
"
"                                v_crd_acct,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                v_crd_lvl1,
"
"                                v_crd_lvl2,
"
"                                v_crd_lvl3,
"
"                                v_crd_lvl4,
"
"                                v_crd_lvl5,
"
"                                v_crd_lvl6,
"
"                                v_crd_prj_lvl,
"
"                                v_crd_acct_plnt,
"
"                                v_crd_cc_code,
"
"                                v_crd_act
"
"                                );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION '             ,
"
"                                            0              ,
"
"                                            ROUND((cr1.ptmc_cons_qty * cr1.ptmc_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((cr1.ptmc_cons_qty * cr1.ptmc_unit_cost),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            cr1.ptmc_store_id               ,
"
"                                            func_find_store_desc(p_bu,cr1.ptmc_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev) ,p_lang)           ,
"
"                                            cr1.ptmc_prod_id              ,
"
"                                            cr1.ptmc_prod_rev               ,
"
"                                            func_find_prod_desc(p_bu,cr1.ptmc_prod_id,cr1.ptmc_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            cr1.ptmc_cons_qty             ,
"
"                                            cr1.ptmc_unit_cost              ,
"
"                                            cr1.ptmc_unit_cost            ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'PCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                             );
"
"
"
"
"
"
"
"                END LOOP;
"
"
"
"
"
"
"
"
"
"                FOR cr6 IN c6
"
"                LOOP
"
"
"
"
"
"                        OPEN c7(cr6.ohbs_sub_elmnt);
"
"                        FETCH c7 INTO cr7;
"
"                        IF c7%NOTFOUND OR cr7.moa_acct IS NULL THEN
"
"                            RAISE_APPLICATION_ERROR(-20008,'APM');
"
"                        ELSE
"
"                            v_crd_acct := cr7.moa_acct;
"
"                        END IF;
"
"                        CLOSE c7;
"
"
"
"
"
"                        proc_find_cost_center(
"
"                                p_bu    ,
"
"                                p_plnt  ,
"
"                                NULL,
"
"                                v_crd_acct,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                v_crd_lvl1,
"
"                                v_crd_lvl2,
"
"                                v_crd_lvl3,
"
"                                v_crd_lvl4,
"
"                                v_crd_lvl5,
"
"                                v_crd_lvl6,
"
"                                v_crd_prj_lvl,
"
"                                v_crd_acct_plnt ,
"
"                                v_crd_cc_code,
"
"                                v_crd_act
"
"                                );
"
"
"
"                                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL OR v_crd_lvl4 IS NULL
"
"                                   OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL THEN
"
"                                      raise_application_error(-20002,'APM');
"
"
"
"                                   END IF;
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
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION '             ,
"
"                                            0              ,
"
"                                            ROUND((cr6.ohbs_rate * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((cr6.ohbs_rate * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            cr6.ohbs_rate              ,
"
"                                            cr6.ohbs_rate          ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'PCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                             );
"
"
"
"                END LOOP;
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
"
"
"
"
"
"
"  END proc_cre_labor_oprn_comp_jrnl;
"
"
"
"  PROCEDURE proc_cre_oprn_comp_jrnl(
"
"  p_bu            VARCHAR2,
"
"  p_plnt        VARCHAR2,
"
"  p_trans_no        VARCHAR2,
"
"  p_doc_date        DATE,
"
"  p_prod_id        VARCHAR2,
"
"  p_prod_rev        NUMBER,
"
"  p_prod_ord_no        VARCHAR2,
"
"  p_comp_qty        NUMBER,
"
"  p_user        VARCHAR2,
"
"  p_lang        NUMBER
"
"  ) IS
"
"
"
"  CURSOR c1
"
"    IS
"
"  SELECT ptmc_seq_no,ptmc_prod_id,ptmc_prod_rev,ptmc_store_id,
"
"       ptmc_cons_qty,ptmc_unit_cost,(ptmc_cons_qty * ptmc_unit_cost) ptmc_ext_cost
"
"    FROM prod_transfer_mat_cons
"
"   WHERE ptmc_bu         = p_bu
"
"     AND ptmc_plnt         = p_plnt
"
"     AND ptmc_trans_no         = p_trans_no
"
"     AND ROUND((ptmc_cons_qty * ptmc_unit_cost),2) > 0
"
"     AND func_find_prod_cust_flag(ptmc_bu,ptmc_prod_id,ptmc_prod_rev) IN ('N')
"
"     AND ptmc_cons_qty > 0
"
"    ORDER BY ptmc_seq_no;
"
"
"
"
"
"  CURSOR c2
"
"    IS
"
"
"
" SELECT ppco_bu,ppco_plnt,ppco_doc_no,ppco_seq_no,ppco_oper_id,(select mfgr_res_id
"
"   from mfg_resources
"
"   where mfgr_bu = ppco_bu
"
"   and mfgr_plnt = ppco_plnt
"
"   and mfgr_emp_id = ppco_oper_id
"
"   and rownum = 1) ppco_res_id,ppco_wrkd_hrs,ppco_hrly_rate FROM pcb_prod_comp_oper
"
"WHERE PPCO_DOC_NO = p_trans_no
"
"AND ppco_bu = p_bu
"
"AND ppco_plnt = p_plnt;
"
"
"
"CURSOR c_elmnt(c_res_id VARCHAR2)
"
"  IS
"
" SELECT mroh_sub_elmnt_id
"
"   FROM mfg_res_oh_rates
"
"  WHERE mroh_bu = p_bU
"
"    and MROH_PLNT = P_PLNT
"
"    AND MROH_RES_ID = C_RES_ID;
"
"
"
"
"
"  c_elmnt1	c_elmnt%rowtype;
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
"   CURSOR c3(c_store_id VARCHAR2)
"
"     IS
"
"   SELECT store_gl_acct
"
"     FROM stores
"
"    WHERE store_bu     = p_bu
"
"      AND store_plnt     = p_plnt
"
"      AND store_id     = c_store_id;
"
"
"
" CURSOR c4(c_mach_id VARCHAR2)
"
"   IS
"
" SELECT mfgr_acct       ,
"
"    mfgr_acct_plnt  ,
"
"    mfgr_prj_lvl    ,
"
"    mfgr_lvl1       ,
"
"    mfgr_lvl2       ,
"
"    mfgr_lvl3       ,
"
"    mfgr_lvl4
"
"   FROM mfg_resources
"
"  WHERE mfgr_bu     = p_bu
"
"    AND mfgr_plnt     = p_plnt
"
"    AND mfgr_res_id     = c_mach_id;
"
"
"
" CURSOR c5(c_mach_id VARCHAR2)
"
"   IS
"
"SELECT mfgrg_ac_lvl1,
"
"       mfgrg_ac_lvl2,
"
"       mfgrg_ac_lvl3,
"
"       mfgrg_ac_lvl4,
"
"       mfgrg_current_acct ,
"
"       mfgrg_ac_lvl_prj,
"
"       mfgrg_acct_plnt
"
"  FROM mfg_res_groups,mfg_resources
"
" WHERE mfgrg_bu     = mfgr_bu
"
"   AND mfgrg_plnt     = mfgr_plnt
"
"   AND mfgrg_grp_id     = mfgr_group_id
"
"   AND mfgr_bu         = p_bu
"
"   AND mfgr_plnt     = p_plnt
"
"   AND mfgr_res_id     = c_mach_id;
"
"
"
"CURSOR c6
"
"  IS
"
"SELECT *
"
"  FROM prod_transfer_process,
"
"       oh_basis_subelement
"
" WHERE ptp_bu          = ohbs_bu
"
"   AND ptp_plnt     = ohbs_plnt
"
"   AND ptp_oprn_id     = ohbs_oprn_id
"
"   AND ohbs_bu         = p_bu
"
"   AND ohbs_plnt     = p_plnt
"
"   AND ohbs_prod_id     = p_prod_id
"
"   AND ohbs_prod_rev     = p_prod_rev
"
"   AND ohbs_status     = 'A'
"
"   AND ohbs_basis     = 'A'
"
"   AND ptp_bu         = p_bu
"
"   AND ptp_plnt     = p_plnt
"
"   AND ptp_trans_no     = p_trans_no;
"
"
"
" CURSOR c7(c_element_id VARCHAR2)
"
"   IS
"
" SELECT moa_acct
"
"   FROM mfg_oh_accts
"
"  WHERE moa_bu         = p_bu
"
"    AND moa_cs_elmnt_id = c_element_id;
"
"
"
"  CURSOR c8
"
"  is
"
"  select ppcmu_mchn_id,SUM(ppcmu_wrkd_hrs)ppcmu_wrkd_hrs ,SUM((ppcmu_wrkd_hrs * ppcmu_hrly_rate)) total_rate
"
"    from pcb_prod_comp_mchn_usg
"
"   WHERE ppcmu_bu = p_bu
"
"     AND ppcmu_plnt = p_plnt
"
"     AND ppcmu_doc_no = p_trans_no
"
"     GROUP BY ppcmu_mchn_id;
"
"
"
"   v_material_cost        NUMBER(17,5);
"
"   v_mach_cost            NUMBER(17,5);
"
"   v_oh_cost            NUMBER(17,5);
"
"   v_total_cost            NUMBER(17,5);
"
"   v_oc_store            VARCHAR2(10);
"
"   v_dbt_acct            stores.store_gl_acct%TYPE;
"
"   v_dbt_prj_lvl        VARCHAR2(10);
"
"   v_dbt_lvl1            VARCHAR2(4);
"
"   v_dbt_lvl2            VARCHAR2(4);
"
"   v_dbt_lvl3            VARCHAR2(4);
"
"   v_dbt_lvl4            VARCHAR2(4);
"
"   v_dbt_lvl5            VARCHAR2(4);
"
"   v_dbt_lvl6            VARCHAR2(4);
"
"   v_dbt_cc_code                VARCHAR2(200);
"
"   v_dbt_act                    VARCHAR2(10);
"
"   v_dbt_acct_plnt        VARCHAR2(10);
"
"   v_crd_lvl1            VARCHAR2(4);
"
"   v_crd_lvl2            VARCHAR2(4);
"
"   v_crd_lvl3            VARCHAR2(4);
"
"   v_crd_lvl4            VARCHAR2(4);
"
"   v_crd_lvl5            VARCHAR2(4);
"
"   v_crd_lvl6            VARCHAR2(4);
"
"   v_crd_cc_code                VARCHAR2(200);
"
"   v_crd_act                    VARCHAR2(10);
"
"   v_crd_acct_plnt        VARCHAR2(10);
"
"   v_crd_acct            stores.store_gl_acct%TYPE;
"
"   v_crd_prj_lvl        VARCHAR2(10);
"
"   v_jrnl_trans_no        VARCHAR2(15);
"
"   v_jrnl_trans_seq_no        NUMBER;
"
"   v_loc_id            VARCHAR2(10);
"
"
"
"   cr3                c3%ROWTYPE;
"
"   cr4                c4%ROWTYPE;
"
"   cr5                c5%ROWTYPE;
"
"   cr6                c6%ROWTYPE;
"
"   cr7                c7%ROWTYPE;
"
"
"
" v_comp_pfx         VARCHAR2(10);
"
" v_elmnt_id varchar2(10);
"
"
"
"v_vou_type        VARCHAR2(10);
"
"v_sub_vou_type        VARCHAR2(10);
"
"  BEGIN
"
"
"
"      v_material_cost := 0;
"
"
"
"
"
"       SELECT pt_comp_pfx
"
"                             INTO v_comp_pfx
"
"                             FROM prod_transfer
"
"                            WHERE pt_bu = p_bu
"
"                              AND pt_plnt = p_plnt
"
"                              AND pt_trans_no = p_trans_no;
"
"
"
"                           SELECT apsta_vou_type,apsta_sub_type
"
"                  INTO v_vou_type,v_sub_vou_type
"
"                  FROM APPL_PFX_SUB_TYPES_ASSO
"
"                WHERE APSTA_PFX = v_comp_pfx
"
"            AND APSTA_BU  = p_bu;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"          v_material_cost := v_material_cost + ROUND(cr1.ptmc_ext_cost,func_find_appl_rnddigit(p_bu));
"
"      END LOOP;
"
"
"
"
"
"
"
"      v_mach_cost := 0;
"
"
"
"      FOR cr8 IN c8
"
"      LOOP
"
"        v_mach_cost := v_mach_cost + cr8.total_rate;
"
"      END LOOP;
"
"
"
"
"
"      v_oh_cost := 0;
"
"
"
"      /*OPEN c6;
"
"      FETCH c6 INTO cr6;
"
"        IF c6%NOTFOUND THEN
"
"            raise_application_error(-20523,'BUD');
"
"        END IF;
"
"      CLOSE c6;*/
"
"
"
"    /*  FOR cr6 IN c6
"
"      LOOP
"
"          v_oh_cost := v_oh_cost + (cr6.ohbs_rate * p_comp_qty);
"
"
"
"      END LOOP;*/
"
"
"
"      v_oh_cost := 0;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"           v_oh_cost := v_oh_cost + (cr2.ppco_hrly_rate * cr2.ppco_wrkd_hrs);
"
"      END LOOP;
"
"
"
"      v_total_cost := v_material_cost + v_mach_cost + v_oh_cost;
"
"
"
"    /*IF P_TRANS_NO ='PRCO-2526-00009' THEN
"
"
"
"    raise_application_error(-20999,'HRM' ||v_total_cost);
"
"    END IF;*/
"
"
"
"      --Debit transaction
"
"
"
"    SELECT pt_loc_id
"
"      INTO v_loc_id
"
"      FROM prod_transfer
"
"     WHERE pt_bu    =    p_bu
"
"       AND pt_plnt    =    p_plnt
"
"       AND pt_trans_no    =    p_trans_no;
"
"
"
"      v_oc_store := func_find_store_fr_type(p_bu,p_plnt, v_loc_id, 'Q');
"
"
"
"      OPEN c3(v_oc_store);
"
"      FETCH c3 INTO cr3;
"
"      IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"         RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"    ELSE
"
"       v_dbt_acct := cr3.store_gl_acct;
"
"      END IF;
"
"
"
"      CLOSE c3;
"
"
"
"
"
"      proc_find_cost_center (p_bu,
"
"                p_plnt,
"
"                NULL,
"
"                v_dbt_acct,
"
"                NULL,
"
"                NULL,
"
"                NULL,
"
"                NULL,
"
"                v_dbt_lvl1,
"
"                v_dbt_lvl2,
"
"                v_dbt_lvl3,
"
"                v_dbt_lvl4,
"
"                v_dbt_lvl5,
"
"                v_dbt_lvl6,
"
"                v_dbt_prj_lvl ,
"
"                v_dbt_acct_plnt,
"
"                v_dbt_cc_code,
"
"                v_loc_id
"
"                                 );
"
"
"
"
"
"
"
"    IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"    END IF;
"
"
"
"     v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"        SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"          INTO v_jrnl_trans_seq_no
"
"          FROM appl_journals
"
"         WHERE aj_bu         = p_bu
"
"           AND aj_plnt         = p_plnt
"
"           AND aj_jrnl_trns_no     = v_jrnl_trans_no;
"
"
"
"        INSERT INTO appl_journals(
"
"                    aj_bu                     ,
"
"                    aj_plnt                   ,
"
"                    aj_jrnl_trns_no           ,
"
"                    aj_jrnl_trns_seq_no       ,
"
"                    aj_acctg_plnt             ,
"
"                    aj_gl_lvl1                ,
"
"                    aj_gl_lvl2                ,
"
"                    aj_gl_lvl3                ,
"
"                    aj_gl_lvl4                ,
"
"                    aj_gl_acct                ,
"
"                    aj_gl_acct_desc           ,
"
"                    aj_reference1             ,
"
"                    aj_reference2             ,
"
"                    aj_fc_db_amt              ,
"
"                    aj_fc_cr_amt              ,
"
"                    aj_bc_db_amt              ,
"
"                    aj_bc_cr_amt              ,
"
"                    aj_db_ex_rate             ,
"
"                    aj_cr_ex_rate             ,
"
"                    aj_jrnl_date              ,
"
"                    aj_jrnl_year              ,
"
"                    aj_jrnl_period            ,
"
"                    aj_store_id               ,
"
"                    aj_store_name             ,
"
"                    aj_cls_id                 ,
"
"                    aj_cls_desc               ,
"
"                    aj_sub_cls_id             ,
"
"                    aj_sub_cls_desc           ,
"
"                    aj_prod_id                ,
"
"                    aj_prod_rev               ,
"
"                    aj_prod_desc1             ,
"
"                    aj_tc_id                  ,
"
"                    aj_tc_desc                ,
"
"                    aj_suplr_id               ,
"
"                    aj_suplr_name             ,
"
"                    aj_cust_id                ,
"
"                    aj_cust_name              ,
"
"                    aj_area_id                ,
"
"                    aj_area_desc              ,
"
"                    aj_terr_id                ,
"
"                    aj_terr_desc              ,
"
"                    aj_bank_id                ,
"
"                    aj_bank_name              ,
"
"                    aj_fa_grp_id              ,
"
"                    aj_fa_grp_desc            ,
"
"                    aj_fa_id                  ,
"
"                    aj_fa_desc                ,
"
"                    aj_dept_id                ,
"
"                    aj_dept_desc              ,
"
"                    aj_proj_id                ,
"
"                    aj_proj_desc              ,
"
"                    aj_res_grp_id             ,
"
"                    aj_res_grp_desc           ,
"
"                    aj_res_id                 ,
"
"                    aj_res_desc               ,
"
"                    aj_emp_id                 ,
"
"                    aj_emp_name               ,
"
"                    aj_trans_qty              ,
"
"                    aj_unit_cost              ,
"
"                    aj_unit_price             ,
"
"                    aj_source_doc_mode        ,
"
"                    aj_appl                   ,
"
"                    aj_status                 ,
"
"                    aj_jrnl_no                ,
"
"                    aj_cre_by                 ,
"
"                    aj_cre_date               ,
"
"                    aj_upd_by                 ,
"
"                    aj_upd_date               ,
"
"                    aj_offset_doc_no          ,
"
"                    aj_vou_type               ,
"
"                    aj_vou_pfx                ,
"
"                    aj_vou_no                 ,
"
"                    aj_vou_line_no            ,
"
"                    aj_ref_no                 ,
"
"                    aj_ref_date,
"
"                    aj_gl_lvl_prj,
"
"                    aj_gl_lvl5,
"
"                    aj_gl_lvl6,
"
"                    aj_cc_code,
"
"                    aj_gl_plnt_loc_id,
"
"                    aj_sub_vou_type
"
"                    )
"
"                VALUES(
"
"                    p_bu                     ,
"
"                    p_plnt                   ,
"
"                    v_jrnl_trans_no           ,
"
"                    v_jrnl_trans_seq_no       ,
"
"                    v_dbt_acct_plnt             ,
"
"                    v_dbt_lvl1                ,
"
"                    v_dbt_lvl2                ,
"
"                    v_dbt_lvl3                ,
"
"                    v_dbt_lvl4                ,
"
"                    v_dbt_acct                ,
"
"                    func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                    'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                    'PRODUCTION COMPLETION'             ,
"
"                    ROUND(v_total_cost,func_find_appl_rnddigit(p_bu))              ,
"
"                    0              ,
"
"                    ROUND(v_total_cost,func_find_appl_rnddigit(p_bu)) ,
"
"                    0              ,
"
"                    1             ,
"
"                    1             ,
"
"                    p_doc_date              ,
"
"                    func_find_year(p_bu,p_doc_date)              ,
"
"                    func_find_period(p_bu,p_doc_date)            ,
"
"                    v_oc_store               ,
"
"                    func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"                    func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                    func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                    func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                    func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                    p_prod_id               ,
"
"                    p_prod_rev              ,
"
"                    func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                    NULL                  ,
"
"                    NULL                ,
"
"                    NULL               ,
"
"                    NULL             ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL              ,
"
"                    NULL            ,
"
"                    NULL                  ,
"
"                    NULL                ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL                ,
"
"                    NULL              ,
"
"                    NULL             ,
"
"                    NULL           ,
"
"                    NULL                 ,
"
"                    NULL               ,
"
"                    NULL                 ,
"
"                    NULL               ,
"
"                    p_comp_qty              ,
"
"                    v_total_cost/p_comp_qty              ,
"
"                    v_total_cost/p_comp_qty           ,
"
"                    NULL        ,
"
"                    'SFM'                   ,
"
"                    'N'                 ,
"
"                    NULL                ,
"
"                    p_user                 ,
"
"                    SYSDATE               ,
"
"                    NULL                 ,
"
"                    NULL               ,
"
"                    NULL          ,
"
"                    v_vou_type               ,
"
"                    NULL                ,
"
"                    p_trans_no                 ,
"
"                    1            ,
"
"                    NULL                 ,
"
"                    NULL,
"
"                    v_dbt_prj_lvl,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                    v_dbt_Cc_code,
"
"                    v_loc_id,
"
"                    v_sub_vou_type
"
"                      );
"
"
"
"                -- credit transaction
"
"
"
"                FOR cr1 IN c1
"
"                LOOP
"
"
"
"                    OPEN c3(cr1.ptmc_store_id);
"
"                    FETCH c3 INTO cr3;
"
"                    IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    ELSE
"
"                       v_crd_acct := cr3.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c3;
"
"
"
"                    proc_find_cost_center(
"
"                                p_bu    ,
"
"                                p_plnt  ,
"
"                                NULL,
"
"                                v_crd_acct,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                v_crd_lvl1,
"
"                                v_crd_lvl2,
"
"                                v_crd_lvl3,
"
"                                v_crd_lvl4,
"
"                                v_crd_lvl5,
"
"                                v_crd_lvl6,
"
"                                v_crd_prj_lvl,
"
"                                v_crd_acct_plnt,
"
"                                v_crd_cc_code,
"
"                                v_crd_act
"
"                                );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj,
"
"                                            aj_gl_lvl5,
"
"                                            aj_gl_lvl6,
"
"                                            aj_cc_code,
"
"                                            aj_gl_plnt_loc_id,
"
"                                            aj_sub_vou_type
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION '             ,
"
"                                            0              ,
"
"                                            ROUND((cr1.ptmc_cons_qty * cr1.ptmc_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((cr1.ptmc_cons_qty * cr1.ptmc_unit_cost),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            cr1.ptmc_store_id               ,
"
"                                            func_find_store_desc(p_bu,cr1.ptmc_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,cr1.ptmc_prod_id,cr1.ptmc_prod_rev) ,p_lang)           ,
"
"                                            cr1.ptmc_prod_id              ,
"
"                                            cr1.ptmc_prod_rev               ,
"
"                                            func_find_prod_desc(p_bu,cr1.ptmc_prod_id,cr1.ptmc_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            cr1.ptmc_cons_qty             ,
"
"                                            cr1.ptmc_unit_cost              ,
"
"                                            cr1.ptmc_unit_cost            ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            v_vou_type             ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl,
"
"                                            v_Crd_lvl5,
"
"                                            v_crd_lvl6,
"
"                                            v_crd_cc_code,
"
"                                            v_crd_act,
"
"                                            v_sub_vou_type
"
"                                             );
"
"
"
"
"
"
"
"                END LOOP;
"
"
"
"
"
"
"
"
"
"                FOR cr2 IN c2
"
"                LOOP
"
"
"
"                	OPEN c_elmnt(cr2.ppco_res_id);
"
"                	FETCH c_elmnt INTO c_elmnt1;
"
"                	IF c_elmnt%FOUND THEN
"
"                	   v_elmnt_id := c_elmnt1.mroh_sub_elmnt_id;
"
"                	END IF;
"
"
"
"                	CLOSE c_elmnt;
"
"
"
"
"
"                        OPEN c7(v_elmnt_id);
"
"                        FETCH c7 INTO cr7;
"
"                        IF c7%NOTFOUND OR cr7.moa_acct IS NULL THEN
"
"                            RAISE_APPLICATION_ERROR(-20008,'APM');
"
"                        ELSE
"
"                            v_crd_acct := cr7.moa_acct;
"
"                        END IF;
"
"                        CLOSE c7;
"
"
"
"
"
"                      proc_find_cost_center(
"
"                                p_bu    ,
"
"                                p_plnt  ,
"
"                                NULL,
"
"                                v_crd_acct,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                NULL ,
"
"                                v_crd_lvl1,
"
"                                v_crd_lvl2,
"
"                                v_crd_lvl3,
"
"                                v_crd_lvl4,
"
"                                v_crd_lvl5,
"
"                                v_crd_lvl6,
"
"                                v_crd_prj_lvl,
"
"                                v_crd_acct_plnt,
"
"                                v_crd_cc_code,
"
"                                v_crd_act
"
"                                );
"
"
"
"        IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL OR v_crd_lvl4 IS NULL
"
"           OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL THEN
"
"              raise_application_error(-20002,'APM');
"
"        END IF;
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_lvl5,
"
"                                            aj_gl_lvl6,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj,
"
"                                            aj_sub_vou_type,
"
"                                            aj_cc_code,
"
"                                            aj_gl_plnt_loc_id
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_lvl5,
"
"                                            v_crd_lvl6,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION '             ,
"
"                                            0              ,
"
"                                            ROUND((cr2.ppco_wrkd_hrs * cr2.ppco_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((cr2.ppco_wrkd_hrs * cr2.ppco_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            cr2.ppco_hrly_rate              ,
"
"                                            cr2.ppco_hrly_rate          ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            v_vou_type               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl,
"
"                                            v_sub_vou_type,
"
"                                            v_crd_cc_code,
"
"                                            v_crd_act
"
"                                             );
"
"
"
"                END LOOP;
"
"
"
"                   FOR cr8 IN c8
"
"                        LOOP
"
"                            OPEN c_elmnt(cr8.ppcmu_mchn_id);
"
"                            FETCH c_elmnt INTO c_elmnt1;
"
"                            IF c_elmnt%FOUND THEN
"
"                               v_elmnt_id := c_elmnt1.mroh_sub_elmnt_id;
"
"                            END IF;
"
"
"
"                            CLOSE c_elmnt;
"
"
"
"
"
"                                OPEN c7(v_elmnt_id);
"
"                                FETCH c7 INTO cr7;
"
"                                IF c7%NOTFOUND OR cr7.moa_acct IS NULL THEN
"
"                                    RAISE_APPLICATION_ERROR(-20008,'APM');
"
"                                ELSE
"
"                                    v_crd_acct := cr7.moa_acct;
"
"                                END IF;
"
"                                CLOSE c7;
"
"
"
"
"
"                              proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                                        v_crd_lvl5,
"
"                                        v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt,
"
"                                        v_crd_cc_code,
"
"                                        v_crd_act
"
"                                        );
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL OR v_crd_lvl4 IS NULL
"
"                   OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL THEN
"
"                      raise_application_error(-20002,'APM');
"
"                END IF;
"
"
"
"                                        SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                          INTO v_jrnl_trans_seq_no
"
"                                          FROM appl_journals
"
"                                         WHERE aj_bu = p_bu
"
"                                           AND aj_plnt = p_plnt
"
"                                           AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                        INSERT INTO appl_journals(
"
"                                                    aj_bu                     ,
"
"                                                    aj_plnt                   ,
"
"                                                    aj_jrnl_trns_no           ,
"
"                                                    aj_jrnl_trns_seq_no       ,
"
"                                                    aj_acctg_plnt             ,
"
"                                                    aj_gl_lvl1                ,
"
"                                                    aj_gl_lvl2                ,
"
"                                                    aj_gl_lvl3                ,
"
"                                                    aj_gl_lvl4                ,
"
"                                                    aj_gl_lvl5,
"
"                                                    aj_gl_lvl6,
"
"                                                    aj_gl_acct                ,
"
"                                                    aj_gl_acct_desc           ,
"
"                                                    aj_reference1             ,
"
"                                                    aj_reference2             ,
"
"                                                    aj_fc_db_amt              ,
"
"                                                    aj_fc_cr_amt              ,
"
"                                                    aj_bc_db_amt              ,
"
"                                                    aj_bc_cr_amt              ,
"
"                                                    aj_db_ex_rate             ,
"
"                                                    aj_cr_ex_rate             ,
"
"                                                    aj_jrnl_date              ,
"
"                                                    aj_jrnl_year              ,
"
"                                                    aj_jrnl_period            ,
"
"                                                    aj_store_id               ,
"
"                                                    aj_store_name             ,
"
"                                                    aj_cls_id                 ,
"
"                                                    aj_cls_desc               ,
"
"                                                    aj_sub_cls_id             ,
"
"                                                    aj_sub_cls_desc           ,
"
"                                                    aj_prod_id                ,
"
"                                                    aj_prod_rev               ,
"
"                                                    aj_prod_desc1             ,
"
"                                                    aj_tc_id                  ,
"
"                                                    aj_tc_desc                ,
"
"                                                    aj_suplr_id               ,
"
"                                                    aj_suplr_name             ,
"
"                                                    aj_cust_id                ,
"
"                                                    aj_cust_name              ,
"
"                                                    aj_area_id                ,
"
"                                                    aj_area_desc              ,
"
"                                                    aj_terr_id                ,
"
"                                                    aj_terr_desc              ,
"
"                                                    aj_bank_id                ,
"
"                                                    aj_bank_name              ,
"
"                                                    aj_fa_grp_id              ,
"
"                                                    aj_fa_grp_desc            ,
"
"                                                    aj_fa_id                  ,
"
"                                                    aj_fa_desc                ,
"
"                                                    aj_dept_id                ,
"
"                                                    aj_dept_desc              ,
"
"                                                    aj_proj_id                ,
"
"                                                    aj_proj_desc              ,
"
"                                                    aj_res_grp_id             ,
"
"                                                    aj_res_grp_desc           ,
"
"                                                    aj_res_id                 ,
"
"                                                    aj_res_desc               ,
"
"                                                    aj_emp_id                 ,
"
"                                                    aj_emp_name               ,
"
"                                                    aj_trans_qty              ,
"
"                                                    aj_unit_cost              ,
"
"                                                    aj_unit_price             ,
"
"                                                    aj_source_doc_mode        ,
"
"                                                    aj_appl                   ,
"
"                                                    aj_status                 ,
"
"                                                    aj_jrnl_no                ,
"
"                                                    aj_cre_by                 ,
"
"                                                    aj_cre_date               ,
"
"                                                    aj_upd_by                 ,
"
"                                                    aj_upd_date               ,
"
"                                                    aj_offset_doc_no          ,
"
"                                                    aj_vou_type               ,
"
"                                                    aj_vou_pfx                ,
"
"                                                    aj_vou_no                 ,
"
"                                                    aj_vou_line_no            ,
"
"                                                    aj_ref_no                 ,
"
"                                                    aj_ref_date,
"
"                                                    aj_gl_lvl_prj,
"
"                                                    aj_sub_vou_type,
"
"                                                    aj_cc_code,
"
"                                                    aj_gl_plnt_loc_id
"
"                                                    )
"
"                                                VALUES(
"
"                                                    p_bu                     ,
"
"                                                    p_plnt                   ,
"
"                                                    v_jrnl_trans_no           ,
"
"                                                    v_jrnl_trans_seq_no       ,
"
"                                                    v_crd_acct_plnt             ,
"
"                                                    v_crd_lvl1                ,
"
"                                                    v_crd_lvl2                ,
"
"                                                    v_crd_lvl3                ,
"
"                                                    v_crd_lvl4                ,
"
"                                                    v_crd_lvl5,
"
"                                                    v_crd_lvl6,
"
"                                                    v_crd_acct                ,
"
"                                                    func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                    'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                    'PRODUCTION '             ,
"
"                                                    0              ,
"
"                                                    ROUND((cr8.total_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                                    0 ,
"
"                                                    ROUND((cr8.total_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                                    1             ,
"
"                                                    1             ,
"
"                                                    p_doc_date              ,
"
"                                                    func_find_year(p_bu,p_doc_date)              ,
"
"                                                    func_find_period(p_bu,p_doc_date)            ,
"
"                                                    NULL               ,
"
"                                                    NULL             ,
"
"                                                    NULL                ,
"
"                                                    NULL,
"
"                                                    NULL            ,
"
"                                                    NULL    ,
"
"                                                    NULL           ,
"
"                                                    NULL              ,
"
"                                                    NULL           ,
"
"                                                    NULL                  ,
"
"                                                    NULL                ,
"
"                                                    NULL               ,
"
"                                                    NULL             ,
"
"                                                    NULL                ,
"
"                                                    NULL              ,
"
"                                                    NULL                ,
"
"                                                    NULL              ,
"
"                                                    NULL                ,
"
"                                                    NULL              ,
"
"                                                    NULL                ,
"
"                                                    NULL              ,
"
"                                                    NULL              ,
"
"                                                    NULL            ,
"
"                                                    NULL                  ,
"
"                                                    NULL                ,
"
"                                                    NULL                ,
"
"                                                    NULL              ,
"
"                                                    NULL                ,
"
"                                                    NULL              ,
"
"                                                    NULL             ,
"
"                                                    NULL           ,
"
"                                                    NULL                 ,
"
"                                                    NULL               ,
"
"                                                    NULL                 ,
"
"                                                    NULL               ,
"
"                                                    p_comp_qty             ,
"
"                                                    cr8.total_rate/cr8.ppcmu_wrkd_hrs              ,
"
"                                                    cr8.total_rate/cr8.ppcmu_wrkd_hrs   ,
"
"                                                    NULL        ,
"
"                                                    'SFM'                   ,
"
"                                                    'N'                 ,
"
"                                                    NULL                ,
"
"                                                    p_user                 ,
"
"                                                    SYSDATE               ,
"
"                                                    NULL                 ,
"
"                                                    NULL               ,
"
"                                                    NULL          ,
"
"                                                    v_vou_type               ,
"
"                                                    NULL                ,
"
"                                                    p_trans_no                 ,
"
"                                                    1            ,
"
"                                                    NULL                 ,
"
"                                                    NULL,
"
"                                                    v_crd_prj_lvl,
"
"                                                    v_sub_vou_type,
"
"                                                    v_crd_cc_code,
"
"                                                    v_loc_id
"
"                                                     );
"
"
"
"                END LOOP;
"
"
"
"  END proc_cre_oprn_comp_jrnl;
"
"
"
"
"
"  PROCEDURE proc_cre_opc_insp_jrnl
"
"  (
"
"  p_bu            VARCHAR2,
"
"  p_plnt        VARCHAR2,
"
"  p_trans_no        VARCHAR2,
"
"  p_doc_date        DATE,
"
"  p_prod_id        VARCHAR2,
"
"  p_prod_rev        NUMBER,
"
"  p_prod_ord_no        VARCHAR2,
"
"  p_comp_qty        NUMBER,
"
"  p_tarsf_code        VARCHAR2,
"
"  p_user        VARCHAR2,
"
"  p_lang        NUMBER
"
"  )IS
"
"
"
"   CURSOR c1(c_store_id VARCHAR2)
"
"       IS
"
"     SELECT store_gl_acct
"
"       FROM stores
"
"      WHERE store_bu = p_bu
"
"        AND store_plnt = p_plnt
"
"      AND store_id = c_store_id;
"
"
"
"    CURSOR c2
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
"   CURSOR c3
"
"     IS
"
"   SELECT *
"
"     FROM prod_comp_srlnos
"
"    WHERE pcs_bu = p_bu
"
"      AND pcs_plnt = p_plnt
"
"      AND pcs_doc_no = p_trans_no;
"
"
"
"    CURSOR c4(c_store_id VARCHAR2 , c_sf_code VARCHAR2, c_sys_ls_no NUMBER)
"
"    IS
"
"    SELECT stsfg_unit_cost
"
"      FROM stock_trans_sfg
"
"     WHERE stsfg_bu = p_bu
"
"       AND stsfg_store_id = c_store_id
"
"       AND stsfg_prod_id = p_prod_id
"
"       AND stsfg_prod_rev = p_prod_rev
"
"       AND stsfg_ord_no = p_prod_ord_no
"
"       AND stsfg_vou_no = p_trans_no
"
"       AND stsfg_sf_code = c_sf_code
"
"       AND (stsfg_sys_ls_no = c_sys_ls_no OR c_sys_ls_no IS NULL);
"
"
"
"
"
"  cr4                           c4%ROWTYPE;
"
"  v_total_cost            NUMBER(17,5);
"
"  v_unit_cost            NUMBER(17,5);
"
"  v_oc_store            VARCHAR2(10);
"
"  v_insp_store            VARCHAR2(10);
"
"  v_dbt_acct            stores.store_gl_acct%TYPE;
"
"  v_dbt_prj_lvl            VARCHAR2(10);
"
"  v_dbt_lvl1            VARCHAR2(4);
"
"  v_dbt_lvl2            VARCHAR2(4);
"
"  v_dbt_lvl3            VARCHAR2(4);
"
"  v_dbt_lvl4            VARCHAR2(4);
"
"  v_dbt_lvl5            VARCHAR2(4);
"
"  v_dbt_lvl6            VARCHAR2(4);
"
"  v_dbt_cc_code            VARCHAR2(10);
"
"  v_dbt_act            VARCHAR2(10);
"
"  v_dbt_acct_plnt        VARCHAR2(10);
"
"  v_crd_lvl1            VARCHAR2(4);
"
"  v_crd_lvl2            VARCHAR2(4);
"
"  v_crd_lvl3            VARCHAR2(4);
"
"  v_crd_lvl4            VARCHAR2(4);
"
"  v_crd_lvl5            VARCHAR2(4);
"
"  v_crd_lvl6            VARCHAR2(4);
"
"  v_crd_cc_code            VARCHAR2(10);
"
"  v_crd_act            VARCHAR2(10);
"
"  v_crd_acct_plnt        VARCHAR2(10);
"
"  v_crd_acct            stores.store_gl_acct%TYPE;
"
"  v_crd_prj_lvl            VARCHAR2(10);
"
"  v_jrnl_trans_no        VARCHAR2(15);
"
"  v_jrnl_trans_seq_no        NUMBER;
"
"  v_sf_code            VARCHAR2(50);
"
"  v_sys_ls_no            NUMBER(15);
"
"  v_loc_id                VARCHAR2(10);
"
"
"
"  cr1                c1%ROWTYPE;
"
"  cr2                c2%ROWTYPE;
"
"  cr3                c3%ROWTYPE;
"
"
"
"
"
"  BEGIN
"
"        SELECT pt_loc_id
"
"        INTO v_loc_id
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
"          v_oc_store := func_find_store_fr_type(p_bu,p_plnt,v_loc_id, 'O');
"
"          v_insp_store := func_find_store_fr_type(p_bu,p_plnt, v_loc_id, 'Q');
"
"
"
"          OPEN c1(v_insp_store);
"
"          FETCH c1 INTO cr1;
"
"          IF c1%NOTFOUND or CR1.store_gl_acct IS NULL THEN
"
"             RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"
"
"          ELSE
"
"            v_dbt_acct := cr1.store_gl_acct;
"
"          END IF;
"
"
"
"          CLOSE c1;
"
"
"
"          proc_find_cost_center(
"
"                    p_bu    ,
"
"                    p_plnt  ,
"
"                    NULL,
"
"                    v_dbt_acct,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    v_dbt_lvl1,
"
"                    v_dbt_lvl2,
"
"                    v_dbt_lvl3,
"
"                    v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                    v_dbt_prj_lvl,
"
"                    v_dbt_acct_plnt,
"
"                    v_dbt_cc_code,
"
"                    v_dbt_act
"
"                    );
"
"
"
"
"
"            IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"            CLOSE c2;
"
"
"
"            v_sf_code := p_tarsf_code;
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_rev) IN('N','L') THEN
"
"            v_sys_ls_no := cr2.pt_sys_ls_no;
"
"            END IF;
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_rev) IN('S','O') THEN
"
"
"
"            IF cr2.pt_ser_no IS NOT NULL AND cr2.pt_ser_no LIKE 'DS%' THEN
"
"               v_sys_ls_no := cr2.pt_sys_ls_no;
"
"            ELSE
"
"               OPEN c3;
"
"               FETCH c3 INTO cr3;
"
"               IF c3%FOUND THEN
"
"                  v_sys_ls_no := cr3.pcs_sys_ls_no;
"
"               END IF;
"
"               CLOSE c3;
"
"            END IF;
"
"
"
"            END IF;
"
"
"
"
"
"            /*OPEN c4(v_oc_store,v_sf_code,v_sys_ls_no);
"
"            FETCH c4 INTO cr4;
"
"            v_unit_cost := cr4.stsfg_unit_cost;
"
"            CLOSE c4;*/
"
"
"
"            /*v_unit_cost := func_find_sfg_unitcost(
"
"                                p_bu      ,
"
"                                p_prod_id ,
"
"                                p_prod_rev,
"
"                                v_insp_store,
"
"                                p_prod_ord_no,
"
"                                v_sf_code,
"
"                                v_sys_ls_no
"
"                                );*/
"
"
"
"                     v_unit_cost := cr2.pt_unit_cost;
"
"
"
"
"
"            -- debit transaction
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                aj_bu                     ,
"
"                                aj_plnt                   ,
"
"                                aj_jrnl_trns_no           ,
"
"                                aj_jrnl_trns_seq_no       ,
"
"                                aj_acctg_plnt             ,
"
"                                aj_gl_lvl1                ,
"
"                                aj_gl_lvl2                ,
"
"                                aj_gl_lvl3                ,
"
"                                aj_gl_lvl4                ,
"
"                                aj_gl_acct                ,
"
"                                aj_gl_acct_desc           ,
"
"                                aj_reference1             ,
"
"                                aj_reference2             ,
"
"                                aj_fc_db_amt              ,
"
"                                aj_fc_cr_amt              ,
"
"                                aj_bc_db_amt              ,
"
"                                aj_bc_cr_amt              ,
"
"                                aj_db_ex_rate             ,
"
"                                aj_cr_ex_rate             ,
"
"                                aj_jrnl_date              ,
"
"                                aj_jrnl_year              ,
"
"                                aj_jrnl_period            ,
"
"                                aj_store_id               ,
"
"                                aj_store_name             ,
"
"                                aj_cls_id                 ,
"
"                                aj_cls_desc               ,
"
"                                aj_sub_cls_id             ,
"
"                                aj_sub_cls_desc           ,
"
"                                aj_prod_id                ,
"
"                                aj_prod_rev               ,
"
"                                aj_prod_desc1             ,
"
"                                aj_tc_id                  ,
"
"                                aj_tc_desc                ,
"
"                                aj_suplr_id               ,
"
"                                aj_suplr_name             ,
"
"                                aj_cust_id                ,
"
"                                aj_cust_name              ,
"
"                                aj_area_id                ,
"
"                                aj_area_desc              ,
"
"                                aj_terr_id                ,
"
"                                aj_terr_desc              ,
"
"                                aj_bank_id                ,
"
"                                aj_bank_name              ,
"
"                                aj_fa_grp_id              ,
"
"                                aj_fa_grp_desc            ,
"
"                                aj_fa_id                  ,
"
"                                aj_fa_desc                ,
"
"                                aj_dept_id                ,
"
"                                aj_dept_desc              ,
"
"                                aj_proj_id                ,
"
"                                aj_proj_desc              ,
"
"                                aj_res_grp_id             ,
"
"                                aj_res_grp_desc           ,
"
"                                aj_res_id                 ,
"
"                                aj_res_desc               ,
"
"                                aj_emp_id                 ,
"
"                                aj_emp_name               ,
"
"                                aj_trans_qty              ,
"
"                                aj_unit_cost              ,
"
"                                aj_unit_price             ,
"
"                                aj_source_doc_mode        ,
"
"                                aj_appl                   ,
"
"                                aj_status                 ,
"
"                                aj_jrnl_no                ,
"
"                                aj_cre_by                 ,
"
"                                aj_cre_date               ,
"
"                                aj_upd_by                 ,
"
"                                aj_upd_date               ,
"
"                                aj_offset_doc_no          ,
"
"                                aj_vou_type               ,
"
"                                aj_vou_pfx                ,
"
"                                aj_vou_no                 ,
"
"                                aj_vou_line_no            ,
"
"                                aj_ref_no                 ,
"
"                                aj_ref_date,
"
"                                aj_gl_lvl_prj
"
"                                )
"
"                            VALUES(
"
"                                p_bu                     ,
"
"                                p_plnt                   ,
"
"                                v_jrnl_trans_no           ,
"
"                                v_jrnl_trans_seq_no       ,
"
"                                v_dbt_acct_plnt             ,
"
"                                v_dbt_lvl1                ,
"
"                                v_dbt_lvl2                ,
"
"                                v_dbt_lvl3                ,
"
"                                v_dbt_lvl4                ,
"
"                                v_dbt_acct                ,
"
"                                func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                'PRODUCTION COMPLETION'             ,
"
"                                ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                0              ,
"
"                                ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                0              ,
"
"                                1             ,
"
"                                1             ,
"
"                                p_doc_date              ,
"
"                                func_find_year(p_bu,p_doc_date)              ,
"
"                                func_find_period(p_bu,p_doc_date)            ,
"
"                                v_insp_store               ,
"
"                                func_find_store_desc(p_bu,v_insp_store,p_lang)             ,
"
"                                func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                p_prod_id               ,
"
"                                p_prod_rev              ,
"
"                                func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL               ,
"
"                                NULL             ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL              ,
"
"                                NULL            ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL             ,
"
"                                NULL           ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                p_comp_qty              ,
"
"                                v_unit_cost              ,
"
"                                v_unit_cost          ,
"
"                                NULL        ,
"
"                                'SFM'                   ,
"
"                                'N'                 ,
"
"                                NULL                ,
"
"                                p_user                 ,
"
"                                SYSDATE               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL          ,
"
"                                'PCM'               ,
"
"                                NULL                ,
"
"                                p_trans_no                 ,
"
"                                1            ,
"
"                                NULL                 ,
"
"                                NULL,
"
"                                v_dbt_prj_lvl
"
"                                  );
"
"
"
"
"
"
"
"            -- credit transaction
"
"
"
"
"
"                    OPEN c1(v_oc_store);
"
"                    FETCH c1 INTO cr1;
"
"                    IF c1%NOTFOUND OR cr1.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                    ELSE
"
"                        v_crd_acct := cr1.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c1;
"
"
"
"
"
"                proc_find_cost_center(
"
"                        p_bu    ,
"
"                        p_plnt  ,
"
"                        NULL,
"
"                        v_crd_acct,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        v_crd_lvl1,
"
"                        v_crd_lvl2,
"
"                        v_crd_lvl3,
"
"                        v_crd_lvl4,
"
"                        v_crd_lvl5,
"
"                        v_crd_lvl6,
"
"                        v_crd_prj_lvl,
"
"                        v_crd_acct_plnt,
"
"                        v_crd_cc_code,
"
"                        v_crd_act
"
"                        );
"
"
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"                                            0 ,
"
"                                            ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            v_oc_store               ,
"
"                                            func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                            p_prod_id               ,
"
"                                            p_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty              ,
"
"                                            v_unit_cost              ,
"
"                                            v_unit_cost          ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'PCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                              );
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
"
"
"  END proc_cre_opc_insp_jrnl;
"
"
"
"  PROCEDURE proc_cre_opc_rcpt_jrnl(
"
"                  p_bu            VARCHAR2,
"
"                  p_plnt        VARCHAR2,
"
"                  p_trans_no        VARCHAR2,
"
"                  p_doc_date        DATE,
"
"                  p_prod_id        VARCHAR2,
"
"                  p_prod_rev        NUMBER,
"
"                  p_prod_ord_no        VARCHAR2,
"
"                  p_comp_qty        NUMBER,
"
"                  p_acpt_qty        NUMBER,
"
"                  p_rej_qty        NUMBER,
"
"                  p_tarsf_code        VARCHAR2,
"
"                  p_user        VARCHAR2,
"
"                  p_lang        NUMBER
"
"                  ) IS
"
"
"
"  CURSOR c1
"
"    IS
"
"  SELECT *
"
"    FROM prod_transfer_process
"
"   WHERE ptp_bu = p_bu
"
"     AND ptp_plnt = p_plnt
"
"     AND ptp_trans_no = p_trans_no
"
"   ORDER BY ptp_oprn_seq_no DESC;
"
"
"
"CURSOR c2(c_oprn_id     VARCHAR2)
"
"  IS
"
"SELECT *
"
"  FROM prod_order_routing
"
" WHERE pror_bu = p_bu
"
"   AND pror_plnt = p_plnt
"
"   AND pror_ord_no = p_prod_ord_no
"
"   AND pror_oprn_id = c_oprn_id;
"
"
"
"CURSOR c3(c_store_id VARCHAR2)
"
"  IS
"
"SELECT store_gl_acct
"
"  FROM stores
"
" WHERE store_bu = p_bu
"
"   AND store_id = c_store_id;
"
"
"
"CURSOR c4
"
"  IS
"
"SELECT *
"
"  FROM prod_transfer
"
" WHERE pt_bu = p_bu
"
"   AND pt_plnt = p_plnt
"
"   AND pt_trans_no = p_trans_no;
"
"
"
"CURSOR c5
"
"  IS
"
"SELECT *
"
"  FROM prod_comp_srlnos
"
" WHERE pcs_bu = p_bu
"
"   AND pcs_plnt = p_plnt
"
"   AND pcs_doc_no = p_trans_no;
"
"
"
"  v_oc_store        VARCHAR2(10);
"
"  v_rcpt_store        VARCHAR2(10);
"
"  v_sf_code        VARCHAR2(50);
"
"  v_rej_store        VARCHAR2(10);
"
"  v_sys_ls_no        NUMBER(15);
"
"  v_unit_cost        NUMBER(17,5);
"
"  v_dbt_acct        stores.store_gl_acct%TYPE;
"
"  v_dbt_prj_lvl        VARCHAR2(10);
"
"  v_dbt_lvl1        VARCHAR2(4);
"
"  v_dbt_lvl2        VARCHAR2(4);
"
"  v_dbt_lvl3        VARCHAR2(4);
"
"  v_dbt_lvl4        VARCHAR2(4);
"
"  v_dbt_lvl5        VARCHAR2(4);
"
"  v_dbt_lvl6        VARCHAR2(4);
"
"  v_dbt_cc_code        VARCHAR2(10);
"
"  v_dbt_act        VARCHAR2(10);
"
"  v_dbt_acct_plnt    VARCHAR2(10);
"
"  v_crd_lvl1        VARCHAR2(4);
"
"  v_crd_lvl2        VARCHAR2(4);
"
"  v_crd_lvl3        VARCHAR2(4);
"
"  v_crd_lvl4        VARCHAR2(4);
"
"  v_crd_lvl5        VARCHAR2(4);
"
"  v_crd_lvl6        VARCHAR2(4);
"
"  v_crd_cc_code       VARCHAR2(10);
"
"  v_crd_act        VARCHAR2(10);
"
"  v_crd_acct_plnt    VARCHAR2(10);
"
"  v_crd_acct        stores.store_gl_acct%TYPE;
"
"  v_crd_prj_lvl        VARCHAR2(10);
"
"  v_jrnl_trans_no    VARCHAR2(15);
"
"  v_jrnl_trans_seq_no    NUMBER;
"
"  cr1            c1%ROWTYPE;
"
"  cr2            c2%ROWTYPE;
"
"  cr3            c3%ROWTYPE;
"
"  cr4            c4%ROWTYPE;
"
"  cr5            c5%ROWTYPE;
"
"
"
"
"
"  BEGIN
"
"
"
"
"
"              --v_oc_store := func_find_store_fr_type(p_bu,p_plnt,'O');
"
"            --v_rej_store := func_find_store_fr_type (p_bu,p_plnt,'J');
"
"
"
"          OPEN c1;
"
"          FETCH c1 INTO cr1;
"
"          CLOSE c1;
"
"
"
"          OPEN c2(cr1.ptp_oprn_id);
"
"          FETCH c2 INTO cr2;
"
"          CLOSE c2;
"
"
"
"          IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_rev) IN('N','L') THEN
"
"          OPEN c4;
"
"          FETCH c4 INTO cr4;
"
"          IF c4%FOUND THEN
"
"              v_oc_store := func_find_store_fr_type(p_bu,p_plnt,cr4.pt_loc_id,'O');
"
"               v_rej_store := func_find_store_fr_type (p_bu,p_plnt,cr4.pt_loc_id, 'J');
"
"
"
"          END IF;
"
"          CLOSE c4;
"
"
"
"          v_sys_ls_no := cr4.pt_sys_ls_no;
"
"
"
"          END IF;
"
"
"
"          IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_rev) IN('S','O') THEN
"
"
"
"          OPEN c4;
"
"        FETCH c4 INTO cr4;
"
"        IF cr4.pt_ser_no IS NOT NULL AND cr4.pt_ser_no LIKE 'DS%' THEN
"
"
"
"            v_sys_ls_no := cr4.pt_sys_ls_no;
"
"
"
"        ELSE
"
"            OPEN c5;
"
"            FETCH c5 INTO cr5;
"
"            CLOSE c5;
"
"            v_sys_ls_no := cr5.pcs_sys_ls_no;
"
"        END IF;
"
"
"
"        CLOSE c4;
"
"
"
"        END IF;
"
"
"
"        --RAISE_APPLICATION_ERROR(-20999,'HRM' || v_sys_ls_no ||'/'||p_prod_id ||'/'||p_prod_rev ||'/'||v_oc_store ||'/'||p_prod_ord_no ||'/'||p_tarsf_code ||'/'||v_unit_cost);
"
"
"
"          v_rcpt_store := cr2.pror_rcp_store;
"
"
"
"          v_sf_code := p_tarsf_code;
"
"
"
"          /*SELECT stsfs_unit_cost
"
"            INTO v_unit_cost
"
"            FROM store_sf_stocks
"
"           WHERE stsfs_bu = p_bu
"
"             AND stsfs_prod_id = p_prod_id
"
"             AND stsfs_prod_rev = p_prod_rev
"
"             AND stsfs_store_id = (CASE WHEN cr4.pt_qc_req_flag = 'Y' THEN func_find_store_fr_type(p_bu,p_plnt,'Q') ELSE v_oc_store END)
"
"             AND stsfs_sf_code = v_sf_code
"
"             AND stsfs_sys_ls_no = v_sys_ls_no
"
"             AND stsfs_ord_no = p_prod_ord_no;*/
"
"
"
"
"
"          /*RAISE_APPLICATION_ERROR(-20999,'HRM' || p_bu ||'/'||p_prod_id ||'/'||p_prod_rev
"
"          ||CASE WHEN cr4.pt_qc_req_flag = 'Y' THEN func_find_store_fr_type(p_bu,p_plnt,'Q') ELSE v_oc_store END ||'/'||
"
"          p_prod_ord_no ||'/'||v_sf_code ||'/'|| v_sys_ls_no);*/
"
"
"
"
"
"
"
"          v_unit_cost := func_find_sfg_unitcost(
"
"                            p_bu      ,
"
"                            p_prod_id ,
"
"                            p_prod_rev,
"
"                            v_oc_store,
"
"                            p_prod_ord_no,
"
"                            v_sf_code,
"
"                            v_sys_ls_no
"
"                            );
"
"
"
"
"
"        -- debit transaction
"
"
"
"        v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"    IF p_acpt_qty > 0 THEN
"
"
"
"
"
"        OPEN c3(v_rcpt_store);
"
"        FETCH c3 INTO cr3;
"
"        IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"           RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"        ELSE
"
"           v_dbt_acct := cr3.store_gl_acct;
"
"        END IF;
"
"        CLOSE c3;
"
"
"
"        proc_find_cost_center(
"
"                    p_bu    ,
"
"                    p_plnt  ,
"
"                    NULL,
"
"                    v_dbt_acct,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    v_dbt_lvl1,
"
"                    v_dbt_lvl2,
"
"                    v_dbt_lvl3,
"
"                    v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                    v_dbt_prj_lvl,
"
"                    v_dbt_acct_plnt  ,
"
"                    v_dbt_cc_code,
"
"                    v_dbt_act
"
"                    );
"
"
"
"
"
"                    IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
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
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                aj_bu                     ,
"
"                                aj_plnt                   ,
"
"                                aj_jrnl_trns_no           ,
"
"                                aj_jrnl_trns_seq_no       ,
"
"                                aj_acctg_plnt             ,
"
"                                aj_gl_lvl1                ,
"
"                                aj_gl_lvl2                ,
"
"                                aj_gl_lvl3                ,
"
"                                aj_gl_lvl4                ,
"
"                                aj_gl_acct                ,
"
"                                aj_gl_acct_desc           ,
"
"                                aj_reference1             ,
"
"                                aj_reference2             ,
"
"                                aj_fc_db_amt              ,
"
"                                aj_fc_cr_amt              ,
"
"                                aj_bc_db_amt              ,
"
"                                aj_bc_cr_amt              ,
"
"                                aj_db_ex_rate             ,
"
"                                aj_cr_ex_rate             ,
"
"                                aj_jrnl_date              ,
"
"                                aj_jrnl_year              ,
"
"                                aj_jrnl_period            ,
"
"                                aj_store_id               ,
"
"                                aj_store_name             ,
"
"                                aj_cls_id                 ,
"
"                                aj_cls_desc               ,
"
"                                aj_sub_cls_id             ,
"
"                                aj_sub_cls_desc           ,
"
"                                aj_prod_id                ,
"
"                                aj_prod_rev               ,
"
"                                aj_prod_desc1             ,
"
"                                aj_tc_id                  ,
"
"                                aj_tc_desc                ,
"
"                                aj_suplr_id               ,
"
"                                aj_suplr_name             ,
"
"                                aj_cust_id                ,
"
"                                aj_cust_name              ,
"
"                                aj_area_id                ,
"
"                                aj_area_desc              ,
"
"                                aj_terr_id                ,
"
"                                aj_terr_desc              ,
"
"                                aj_bank_id                ,
"
"                                aj_bank_name              ,
"
"                                aj_fa_grp_id              ,
"
"                                aj_fa_grp_desc            ,
"
"                                aj_fa_id                  ,
"
"                                aj_fa_desc                ,
"
"                                aj_dept_id                ,
"
"                                aj_dept_desc              ,
"
"                                aj_proj_id                ,
"
"                                aj_proj_desc              ,
"
"                                aj_res_grp_id             ,
"
"                                aj_res_grp_desc           ,
"
"                                aj_res_id                 ,
"
"                                aj_res_desc               ,
"
"                                aj_emp_id                 ,
"
"                                aj_emp_name               ,
"
"                                aj_trans_qty              ,
"
"                                aj_unit_cost              ,
"
"                                aj_unit_price             ,
"
"                                aj_source_doc_mode        ,
"
"                                aj_appl                   ,
"
"                                aj_status                 ,
"
"                                aj_jrnl_no                ,
"
"                                aj_cre_by                 ,
"
"                                aj_cre_date               ,
"
"                                aj_upd_by                 ,
"
"                                aj_upd_date               ,
"
"                                aj_offset_doc_no          ,
"
"                                aj_vou_type               ,
"
"                                aj_vou_pfx                ,
"
"                                aj_vou_no                 ,
"
"                                aj_vou_line_no            ,
"
"                                aj_ref_no                 ,
"
"                                aj_ref_date,
"
"                                aj_gl_lvl_prj
"
"                                )
"
"                            VALUES(
"
"                                p_bu                     ,
"
"                                p_plnt                   ,
"
"                                v_jrnl_trans_no           ,
"
"                                v_jrnl_trans_seq_no       ,
"
"                                v_dbt_acct_plnt             ,
"
"                                v_dbt_lvl1                ,
"
"                                v_dbt_lvl2                ,
"
"                                v_dbt_lvl3                ,
"
"                                v_dbt_lvl4                ,
"
"                                v_dbt_acct                ,
"
"                                func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                'PRODUCTION COMPLETION'             ,
"
"                                ROUND((v_unit_cost * p_acpt_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                0              ,
"
"                                ROUND((v_unit_cost * p_acpt_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                0              ,
"
"                                1             ,
"
"                                1             ,
"
"                                p_doc_date              ,
"
"                                func_find_year(p_bu,p_doc_date)              ,
"
"                                func_find_period(p_bu,p_doc_date)            ,
"
"                                v_rcpt_store               ,
"
"                                func_find_store_desc(p_bu,v_rcpt_store,p_lang)             ,
"
"                                func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                p_prod_id               ,
"
"                                p_prod_rev              ,
"
"                                func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL               ,
"
"                                NULL             ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL              ,
"
"                                NULL            ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL             ,
"
"                                NULL           ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                p_acpt_qty              ,
"
"                                v_unit_cost              ,
"
"                                v_unit_cost          ,
"
"                                NULL        ,
"
"                                'SFM'                   ,
"
"                                'N'                 ,
"
"                                NULL                ,
"
"                                p_user                 ,
"
"                                SYSDATE               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL          ,
"
"                                'PCM'               ,
"
"                                NULL                ,
"
"                                p_trans_no                 ,
"
"                                1            ,
"
"                                NULL                 ,
"
"                                NULL,
"
"                                v_dbt_prj_lvl
"
"                                  );
"
"
"
"
"
"                    -- credit transaction
"
"
"
"
"
"                    OPEN c3(v_oc_store);
"
"                    FETCH c3 INTO cr3;
"
"                    IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                    ELSE
"
"                        v_crd_acct := cr3.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c3;
"
"
"
"
"
"                proc_find_cost_center(
"
"                        p_bu    ,
"
"                        p_plnt  ,
"
"                        NULL,
"
"                        v_crd_acct,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        v_crd_lvl1,
"
"                        v_crd_lvl2,
"
"                        v_crd_lvl3,
"
"                        v_crd_lvl4,
"
"                        v_crd_lvl5,
"
"                        v_crd_lvl6,
"
"                        v_crd_prj_lvl,
"
"                        v_crd_acct_plnt ,
"
"                        v_crd_cc_code,
"
"                        v_crd_act
"
"                        );
"
"
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((v_unit_cost * p_acpt_qty),func_find_appl_rnddigit(p_bu))             ,
"
"                                            0 ,
"
"                                            ROUND((v_unit_cost * p_acpt_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            v_oc_store               ,
"
"                                            func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                            p_prod_id               ,
"
"                                            p_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_acpt_qty              ,
"
"                                            v_unit_cost              ,
"
"                                            v_unit_cost          ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'PCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                              );
"
"
"
"                END IF;
"
"
"
"
"
"        -- debit transaction
"
"
"
"    IF p_rej_qty > 0 THEN
"
"
"
"
"
"        OPEN c3(v_rej_store);
"
"        FETCH c3 INTO cr3;
"
"        IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"           RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"        ELSE
"
"           v_dbt_acct := cr3.store_gl_acct;
"
"        END IF;
"
"        CLOSE c3;
"
"
"
"        proc_find_cost_center(
"
"                    p_bu    ,
"
"                    p_plnt  ,
"
"                    NULL,
"
"                    v_dbt_acct,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    v_dbt_lvl1,
"
"                    v_dbt_lvl2,
"
"                    v_dbt_lvl3,
"
"                    v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                    v_dbt_prj_lvl,
"
"                    v_dbt_acct_plnt ,
"
"                    v_dbt_cc_code,
"
"                    v_dbt_act
"
"                    );
"
"
"
"
"
"                    IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
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
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                aj_bu                     ,
"
"                                aj_plnt                   ,
"
"                                aj_jrnl_trns_no           ,
"
"                                aj_jrnl_trns_seq_no       ,
"
"                                aj_acctg_plnt             ,
"
"                                aj_gl_lvl1                ,
"
"                                aj_gl_lvl2                ,
"
"                                aj_gl_lvl3                ,
"
"                                aj_gl_lvl4                ,
"
"                                aj_gl_acct                ,
"
"                                aj_gl_acct_desc           ,
"
"                                aj_reference1             ,
"
"                                aj_reference2             ,
"
"                                aj_fc_db_amt              ,
"
"                                aj_fc_cr_amt              ,
"
"                                aj_bc_db_amt              ,
"
"                                aj_bc_cr_amt              ,
"
"                                aj_db_ex_rate             ,
"
"                                aj_cr_ex_rate             ,
"
"                                aj_jrnl_date              ,
"
"                                aj_jrnl_year              ,
"
"                                aj_jrnl_period            ,
"
"                                aj_store_id               ,
"
"                                aj_store_name             ,
"
"                                aj_cls_id                 ,
"
"                                aj_cls_desc               ,
"
"                                aj_sub_cls_id             ,
"
"                                aj_sub_cls_desc           ,
"
"                                aj_prod_id                ,
"
"                                aj_prod_rev               ,
"
"                                aj_prod_desc1             ,
"
"                                aj_tc_id                  ,
"
"                                aj_tc_desc                ,
"
"                                aj_suplr_id               ,
"
"                                aj_suplr_name             ,
"
"                                aj_cust_id                ,
"
"                                aj_cust_name              ,
"
"                                aj_area_id                ,
"
"                                aj_area_desc              ,
"
"                                aj_terr_id                ,
"
"                                aj_terr_desc              ,
"
"                                aj_bank_id                ,
"
"                                aj_bank_name              ,
"
"                                aj_fa_grp_id              ,
"
"                                aj_fa_grp_desc            ,
"
"                                aj_fa_id                  ,
"
"                                aj_fa_desc                ,
"
"                                aj_dept_id                ,
"
"                                aj_dept_desc              ,
"
"                                aj_proj_id                ,
"
"                                aj_proj_desc              ,
"
"                                aj_res_grp_id             ,
"
"                                aj_res_grp_desc           ,
"
"                                aj_res_id                 ,
"
"                                aj_res_desc               ,
"
"                                aj_emp_id                 ,
"
"                                aj_emp_name               ,
"
"                                aj_trans_qty              ,
"
"                                aj_unit_cost              ,
"
"                                aj_unit_price             ,
"
"                                aj_source_doc_mode        ,
"
"                                aj_appl                   ,
"
"                                aj_status                 ,
"
"                                aj_jrnl_no                ,
"
"                                aj_cre_by                 ,
"
"                                aj_cre_date               ,
"
"                                aj_upd_by                 ,
"
"                                aj_upd_date               ,
"
"                                aj_offset_doc_no          ,
"
"                                aj_vou_type               ,
"
"                                aj_vou_pfx                ,
"
"                                aj_vou_no                 ,
"
"                                aj_vou_line_no            ,
"
"                                aj_ref_no                 ,
"
"                                aj_ref_date,
"
"                                aj_gl_lvl_prj
"
"                                )
"
"                            VALUES(
"
"                                p_bu                     ,
"
"                                p_plnt                   ,
"
"                                v_jrnl_trans_no           ,
"
"                                v_jrnl_trans_seq_no       ,
"
"                                v_dbt_acct_plnt             ,
"
"                                v_dbt_lvl1                ,
"
"                                v_dbt_lvl2                ,
"
"                                v_dbt_lvl3                ,
"
"                                v_dbt_lvl4                ,
"
"                                v_dbt_acct                ,
"
"                                func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                'PRODUCTION COMPLETION'             ,
"
"                                ROUND((v_unit_cost * p_rej_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                0              ,
"
"                                ROUND((v_unit_cost * p_rej_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                0              ,
"
"                                1             ,
"
"                                1             ,
"
"                                p_doc_date              ,
"
"                                func_find_year(p_bu,p_doc_date)              ,
"
"                                func_find_period(p_bu,p_doc_date)            ,
"
"                                v_rej_store               ,
"
"                                func_find_store_desc(p_bu,v_rej_store,p_lang)             ,
"
"                                func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                p_prod_id               ,
"
"                                p_prod_rev              ,
"
"                                func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL               ,
"
"                                NULL             ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL              ,
"
"                                NULL            ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL             ,
"
"                                NULL           ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                p_rej_qty              ,
"
"                                v_unit_cost              ,
"
"                                v_unit_cost          ,
"
"                                NULL        ,
"
"                                'SFM'                   ,
"
"                                'N'                 ,
"
"                                NULL                ,
"
"                                p_user                 ,
"
"                                SYSDATE               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL          ,
"
"                                'PCM'               ,
"
"                                NULL                ,
"
"                                p_trans_no                 ,
"
"                                1            ,
"
"                                NULL                 ,
"
"                                NULL,
"
"                                v_dbt_prj_lvl
"
"                                  );
"
"
"
"
"
"                    -- credit transaction
"
"
"
"
"
"                    OPEN c3(v_oc_store);
"
"                    FETCH c3 INTO cr3;
"
"                    IF c3%NOTFOUND OR cr3.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                    ELSE
"
"                        v_crd_acct := cr3.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c3;
"
"
"
"
"
"                proc_find_cost_center(
"
"                        p_bu    ,
"
"                        p_plnt  ,
"
"                        NULL,
"
"                        v_crd_acct,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        v_crd_lvl1,
"
"                        v_crd_lvl2,
"
"                        v_crd_lvl3,
"
"                        v_crd_lvl4,
"
"                        v_crd_lvl5,
"
"                        v_crd_lvl6,
"
"                        v_crd_prj_lvl,
"
"                        v_crd_acct_plnt,
"
"                        v_crd_cc_code,
"
"                        v_crd_act
"
"                        );
"
"
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((v_unit_cost * p_rej_qty),func_find_appl_rnddigit(p_bu))             ,
"
"                                            0 ,
"
"                                            ROUND((v_unit_cost * p_rej_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            v_oc_store               ,
"
"                                            func_find_store_desc(p_bu,v_oc_store,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                            p_prod_id               ,
"
"                                            p_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_rej_qty              ,
"
"                                            v_unit_cost              ,
"
"                                            v_unit_cost          ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'PCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                              );
"
"
"
"                END IF;
"
"
"
"
"
"  END proc_cre_opc_rcpt_jrnl;
"
"
"
"
"
"  PROCEDURE proc_cre_insp_postinsp_jrnl(
"
"  p_bu            VARCHAR2,
"
"  p_plnt        VARCHAR2,
"
"  p_trans_no        VARCHAR2,
"
"  p_doc_date        DATE,
"
"  p_prod_id        VARCHAR2,
"
"  p_prod_rev        NUMBER,
"
"  p_prod_ord_no        VARCHAR2,
"
"  p_comp_qty        NUMBER,
"
"  p_tarsf_code        VARCHAR2,
"
"  p_qc_pfx        VARCHAR2,
"
"  p_qc_no        VARCHAR2,
"
"  p_qc_line        NUMBER,
"
"  p_user        VARCHAR2,
"
"  p_lang        NUMBER
"
"  ) IS
"
"
"
"  CURSOR c1
"
"    IS
"
"  SELECT *
"
"    FROM tqm_lot_serial_nos
"
"   WHERE tqmls_bu = p_bu
"
"     AND tqmls_qc_pfx = p_qc_pfx
"
"     AND tqmls_qc_no = p_qc_no
"
"     AND tqmls_qc_doc_seq_no = p_qc_line;
"
"
"
"CURSOR c2(c_store_id    VARCHAR2)
"
"  IS
"
"SELECT store_gl_acct
"
"  FROM stores
"
" WHERE store_bu = p_bu
"
"   AND store_id = c_store_id;
"
"
"
"
"
"  v_insp_store        VARCHAR2(10);
"
"  v_post_insp_store    VARCHAR2(10);
"
"  v_sys_ls_no        NUMBER(15);
"
"  v_sf_code        VARCHAR2(50);
"
"  v_unit_cost        NUMBER(17,5);
"
"  v_dbt_acct        stores.store_gl_acct%TYPE;
"
"  v_dbt_lvl1        VARCHAR2(4);
"
"  v_dbt_lvl2        VARCHAR2(4);
"
"  v_dbt_lvl3        VARCHAR2(4);
"
"  v_dbt_lvl4        VARCHAR2(4);
"
"  v_dbt_lvl5        VARCHAR2(4);
"
"  v_dbt_lvl6        VARCHAR2(4);
"
"  v_dbt_cc_code        VARCHAR2(10);
"
"  v_dbt_act        VARCHAR2(10);
"
"  v_dbt_prj_lvl        VARCHAR2(10);
"
"  v_dbt_acct_plnt    VARCHAR2(10);
"
"  v_crd_lvl1        VARCHAR2(4);
"
"  v_crd_lvl2        VARCHAR2(4);
"
"  v_crd_lvl3        VARCHAR2(4);
"
"  v_crd_lvl4        VARCHAR2(4);
"
"  v_crd_lvl5        VARCHAR2(4);
"
"  v_crd_lvl6        VARCHAR2(4);
"
"  v_crd_cc_code        VARCHAR2(10);
"
"  v_crd_act        VARCHAR2(10);
"
"  v_crd_acct        stores.store_gl_acct%TYPE;
"
"  v_crd_acct_plnt    VARCHAR2(10);
"
"  v_crd_prj_lvl        VARCHAR2(10);
"
"  v_jrnl_trans_no    VARCHAR2(15);
"
"  v_jrnl_trans_seq_no    NUMBER;
"
"  cr1            c1%ROWTYPE;
"
"  cr2            c2%ROWTYPE;
"
"  v_loc_id        VARCHAR2(10);
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
"    SELECT tqhd_plnt_loc_id
"
"      INTO v_loc_id
"
"      FROM tqm_qc_hd
"
"     WHERE tqhd_bu        =    p_bu
"
"       AND tqhd_qc_pfx    =    p_qc_pfx
"
"       AND tqhd_qc_no    =    p_qc_no;
"
"
"
"
"
"      v_insp_store := func_find_store_fr_type(p_bu,p_plnt,v_loc_id, 'Q');
"
"      v_post_insp_store := func_find_store_fr_type(p_bu,p_plnt,v_loc_id, 'P');
"
"
"
"      v_sf_code := p_tarsf_code;
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"      CLOSE c1;
"
"
"
"      v_sys_ls_no := cr1.tqmls_sys_ls_no;
"
"
"
"              v_unit_cost := func_find_sfg_unitcost(
"
"                            p_bu      ,
"
"                            p_prod_id ,
"
"                            p_prod_rev,
"
"                            v_insp_store,
"
"                            p_prod_ord_no,
"
"                            v_sf_code,
"
"                            v_sys_ls_no
"
"                                );
"
"
"
"
"
"    -- debit transaction
"
"
"
"    OPEN c2(v_post_insp_store);
"
"    FETCH c2 INTO cr2;
"
"    IF c2%NOTFOUND OR cr2.store_gl_acct IS NULL THEN
"
"        RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"    ELSE
"
"        v_dbt_acct := cr2.store_gl_acct;
"
"    END IF;
"
"
"
"    CLOSE c2;
"
"
"
"         proc_find_cost_center(
"
"                    p_bu    ,
"
"                    p_plnt  ,
"
"                    NULL,
"
"                    v_dbt_acct,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    v_dbt_lvl1,
"
"                    v_dbt_lvl2,
"
"                    v_dbt_lvl3,
"
"                    v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                    v_dbt_prj_lvl,
"
"                    v_dbt_acct_plnt  ,
"
"                    v_dbt_cc_code,
"
"                    v_dbt_act
"
"                    );
"
"
"
"
"
"        IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                aj_bu                     ,
"
"                                aj_plnt                   ,
"
"                                aj_jrnl_trns_no           ,
"
"                                aj_jrnl_trns_seq_no       ,
"
"                                aj_acctg_plnt             ,
"
"                                aj_gl_lvl1                ,
"
"                                aj_gl_lvl2                ,
"
"                                aj_gl_lvl3                ,
"
"                                aj_gl_lvl4                ,
"
"                                aj_gl_acct                ,
"
"                                aj_gl_acct_desc           ,
"
"                                aj_reference1             ,
"
"                                aj_reference2             ,
"
"                                aj_fc_db_amt              ,
"
"                                aj_fc_cr_amt              ,
"
"                                aj_bc_db_amt              ,
"
"                                aj_bc_cr_amt              ,
"
"                                aj_db_ex_rate             ,
"
"                                aj_cr_ex_rate             ,
"
"                                aj_jrnl_date              ,
"
"                                aj_jrnl_year              ,
"
"                                aj_jrnl_period            ,
"
"                                aj_store_id               ,
"
"                                aj_store_name             ,
"
"                                aj_cls_id                 ,
"
"                                aj_cls_desc               ,
"
"                                aj_sub_cls_id             ,
"
"                                aj_sub_cls_desc           ,
"
"                                aj_prod_id                ,
"
"                                aj_prod_rev               ,
"
"                                aj_prod_desc1             ,
"
"                                aj_tc_id                  ,
"
"                                aj_tc_desc                ,
"
"                                aj_suplr_id               ,
"
"                                aj_suplr_name             ,
"
"                                aj_cust_id                ,
"
"                                aj_cust_name              ,
"
"                                aj_area_id                ,
"
"                                aj_area_desc              ,
"
"                                aj_terr_id                ,
"
"                                aj_terr_desc              ,
"
"                                aj_bank_id                ,
"
"                                aj_bank_name              ,
"
"                                aj_fa_grp_id              ,
"
"                                aj_fa_grp_desc            ,
"
"                                aj_fa_id                  ,
"
"                                aj_fa_desc                ,
"
"                                aj_dept_id                ,
"
"                                aj_dept_desc              ,
"
"                                aj_proj_id                ,
"
"                                aj_proj_desc              ,
"
"                                aj_res_grp_id             ,
"
"                                aj_res_grp_desc           ,
"
"                                aj_res_id                 ,
"
"                                aj_res_desc               ,
"
"                                aj_emp_id                 ,
"
"                                aj_emp_name               ,
"
"                                aj_trans_qty              ,
"
"                                aj_unit_cost              ,
"
"                                aj_unit_price             ,
"
"                                aj_source_doc_mode        ,
"
"                                aj_appl                   ,
"
"                                aj_status                 ,
"
"                                aj_jrnl_no                ,
"
"                                aj_cre_by                 ,
"
"                                aj_cre_date               ,
"
"                                aj_upd_by                 ,
"
"                                aj_upd_date               ,
"
"                                aj_offset_doc_no          ,
"
"                                aj_vou_type               ,
"
"                                aj_vou_pfx                ,
"
"                                aj_vou_no                 ,
"
"                                aj_vou_line_no            ,
"
"                                aj_ref_no                 ,
"
"                                aj_ref_date,
"
"                                aj_gl_lvl_prj
"
"                                )
"
"                            VALUES(
"
"                                p_bu                     ,
"
"                                p_plnt                   ,
"
"                                v_jrnl_trans_no           ,
"
"                                v_jrnl_trans_seq_no       ,
"
"                                v_dbt_acct_plnt             ,
"
"                                v_dbt_lvl1                ,
"
"                                v_dbt_lvl2                ,
"
"                                v_dbt_lvl3                ,
"
"                                v_dbt_lvl4                ,
"
"                                v_dbt_acct                ,
"
"                                func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                'PRODUCTION COMPLETION'             ,
"
"                                ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                0              ,
"
"                                ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                0              ,
"
"                                1             ,
"
"                                1             ,
"
"                                p_doc_date              ,
"
"                                func_find_year(p_bu,p_doc_date)              ,
"
"                                func_find_period(p_bu,p_doc_date)            ,
"
"                                v_post_insp_store               ,
"
"                                func_find_store_desc(p_bu,v_post_insp_store,p_lang)             ,
"
"                                func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                p_prod_id               ,
"
"                                p_prod_rev              ,
"
"                                func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL               ,
"
"                                NULL             ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL              ,
"
"                                NULL            ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL             ,
"
"                                NULL           ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                p_comp_qty              ,
"
"                                v_unit_cost              ,
"
"                                v_unit_cost          ,
"
"                                NULL        ,
"
"                                'SFM'                   ,
"
"                                'N'                 ,
"
"                                NULL                ,
"
"                                p_user                 ,
"
"                                SYSDATE               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL          ,
"
"                                'PCM'               ,
"
"                                NULL                ,
"
"                                p_trans_no                 ,
"
"                                1            ,
"
"                                NULL                 ,
"
"                                NULL,
"
"                                v_dbt_prj_lvl
"
"                                  );
"
"
"
"
"
"
"
"                    OPEN c2(v_insp_store);
"
"                    FETCH c2 INTO cr2;
"
"                    IF c2%NOTFOUND OR cr2.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                    ELSE
"
"                        v_crd_acct := cr2.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c2;
"
"
"
"
"
"                proc_find_cost_center(
"
"                        p_bu    ,
"
"                        p_plnt  ,
"
"                        NULL,
"
"                        v_crd_acct,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        v_crd_lvl1,
"
"                        v_crd_lvl2,
"
"                        v_crd_lvl3,
"
"                        v_crd_lvl4,
"
"                        v_dbt_lvl5,
"
"                        v_dbt_lvl6,
"
"                        v_crd_prj_lvl,
"
"                        v_crd_acct_plnt,
"
"                        v_dbt_cc_code,
"
"                        v_dbt_act
"
"                        );
"
"
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"                                            0 ,
"
"                                            ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            v_insp_store               ,
"
"                                            func_find_store_desc(p_bu,v_insp_store,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                            p_prod_id               ,
"
"                                            p_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty              ,
"
"                                            v_unit_cost              ,
"
"                                            v_unit_cost          ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'PCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                              );
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
"
"
"
"
"  END proc_cre_insp_postinsp_jrnl;
"
"
"
"
"
"  PROCEDURE proc_cre_postinsp_rcpt_jrnl(
"
"  p_bu            VARCHAR2,
"
"  p_plnt        VARCHAR2,
"
"  p_trans_no        VARCHAR2,
"
"  p_doc_date        DATE,
"
"  p_prod_id        VARCHAR2,
"
"  p_prod_rev        NUMBER,
"
"  p_prod_ord_no        VARCHAR2,
"
"  p_qc_pfx        VARCHAR2,
"
"  p_qc_no        VARCHAR2,
"
"  p_qc_line        NUMBER,
"
"  p_comp_qty        NUMBER,
"
"  p_tarsf_code        VARCHAR2,
"
"  p_user        VARCHAR2,
"
"  p_lang        NUMBER
"
"  ) IS
"
"
"
"  CURSOR c1
"
"    IS
"
"  SELECT *
"
"    FROM tqm_qc_process
"
"   WHERE tqp_bu = p_bu
"
"     AND tqp_qc_pfx = p_qc_pfx
"
"     AND tqp_qc_no = p_qc_no
"
"     AND tqp_seq_no = p_qc_line
"
"  ORDER BY tqp_proc_seq_no DESC;
"
"
"
" CURSOR c2(c_oprn_id VARCHAR2)
"
"    IS
"
" SELECT *
"
"   FROM prod_order_routing
"
"  WHERE pror_bu = p_bu
"
"    AND pror_plnt = p_plnt
"
"    AND pror_ord_no = p_prod_ord_no
"
"    AND pror_oprn_id = c_oprn_id;
"
"
"
"    CURSOR c3
"
"    IS
"
"  SELECT *
"
"    FROM tqm_lot_serial_nos
"
"   WHERE tqmls_bu = p_bu
"
"     AND tqmls_qc_pfx = p_qc_pfx
"
"     AND tqmls_qc_no = p_qc_no
"
"     AND tqmls_qc_doc_seq_no = p_qc_line;
"
"
"
"   CURSOR c4(c_store_id VARCHAR2)
"
"     IS
"
"   SELECT store_gl_acct
"
"     FROM stores
"
"    WHERE store_bu = p_bu
"
"      AND store_id = c_store_id;
"
"
"
"
"
"  v_sf_code        VARCHAR2(10);
"
"  v_post_insp_store    VARCHAR2(10);
"
"  v_rcpt_store        VARCHAR2(10);
"
"  v_sys_ls_no        NUMBER(15);
"
"  v_unit_cost        NUMBER(17,5);
"
"  v_dbt_acct         STORES.store_gl_acct%TYPE;
"
"  v_dbt_lvl1        VARCHAR2(4);
"
"  v_dbt_lvl2        VARCHAR2(4);
"
"  v_dbt_lvl3        VARCHAR2(4);
"
"  v_dbt_lvl4        VARCHAR2(4);
"
"  v_dbt_lvl5        VARCHAR2(4);
"
"  v_dbt_lvl6        VARCHAR2(4);
"
"  v_dbt_cc_code        VARCHAR2(10);
"
"  v_dbt_act        VARCHAR2(10);
"
"  v_dbt_prj_lvl        VARCHAR2(10);
"
"  v_crd_acct        STORES.store_gl_acct%TYPE;
"
"  v_crd_lvl1        VARCHAR2(4);
"
"  v_crd_lvl2        VARCHAR2(4);
"
"  v_crd_lvl3        VARCHAR2(4);
"
"  v_crd_lvl4        VARCHAR2(4);
"
"  v_crd_lvl5        VARCHAR2(4);
"
"  v_crd_lvl6        VARCHAR2(4);
"
"  v_crd_cc_code        VARCHAR2(10);
"
"  v_crd_act        VARCHAR2(10);
"
"  v_crd_prj_lvl        VARCHAR2(10);
"
"  v_dbt_acct_plnt    VARCHAR2(10);
"
"  v_crd_acct_plnt    VARCHAR2(10);
"
"  v_jrnl_trans_no    VARCHAR2(15);
"
"  v_jrnl_trans_seq_no    NUMBER;
"
"  v_loc_id            VARCHAR2(10);
"
"
"
"
"
"  cr1            c1%ROWTYPE;
"
"  cr2            c2%ROWTYPE;
"
"  cr3            c3%ROWTYPE;
"
"  cr4            c4%ROWTYPE;
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
"  BEGIN
"
"
"
"  SELECT tqhd_plnt_loc_id
"
"    INTO v_loc_id
"
"    FROM tqm_qc_hd
"
"   WHERE tqhd_bu        =    p_bu
"
"     AND tqhd_qc_pfx    =    p_qc_pfx
"
"     AND tqhd_qc_no        =    p_qc_no;
"
"
"
"
"
"      v_post_insp_store := func_find_store_fr_type(p_bu,p_plnt,v_loc_id, 'P');
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"      CLOSE c1;
"
"
"
"      OPEN c2(cr1.tqp_proc_id);
"
"      FETCH c2 INTO cr2;
"
"      CLOSE c2;
"
"
"
"      v_rcpt_store := cr2.pror_rcp_store;
"
"
"
"      v_sf_code := p_tarsf_code;
"
"
"
"
"
"      OPEN c3;
"
"      FETCH c3 INTO cr3;
"
"      CLOSE c3;
"
"
"
"      v_sys_ls_no := cr3.tqmls_sys_ls_no;
"
"
"
"
"
"
"
"      v_unit_cost := func_find_sfg_unitcost(p_bu         ,
"
"                          p_prod_id    ,
"
"                          p_prod_rev   ,
"
"                          func_find_store_fr_type(p_bu,p_plnt,v_loc_id, 'Q'),
"
"                          p_prod_ord_no    ,
"
"                          v_sf_code,
"
"                          v_sys_ls_no
"
"                          );
"
"
"
"
"
"
"
"
"
"      OPEN c4(v_rcpt_store);
"
"      FETCH c4 INTO cr4;
"
"      IF c4%NOTFOUND OR cr4.store_gl_acct IS NULL THEN
"
"          RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"      ELSE
"
"          v_dbt_acct := cr4.store_gl_acct;
"
"      END IF;
"
"      CLOSE c4;
"
"
"
"
"
"        proc_find_cost_center(
"
"                    p_bu    ,
"
"                    p_plnt  ,
"
"                    NULL,
"
"                    v_dbt_acct,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    NULL ,
"
"                    v_dbt_lvl1,
"
"                    v_dbt_lvl2,
"
"                    v_dbt_lvl3,
"
"                    v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                    v_dbt_prj_lvl,
"
"                    v_dbt_acct_plnt  ,
"
"                    v_dbt_cc_code,
"
"                    v_dbt_act
"
"                    );
"
"
"
"
"
"        IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                aj_bu                     ,
"
"                                aj_plnt                   ,
"
"                                aj_jrnl_trns_no           ,
"
"                                aj_jrnl_trns_seq_no       ,
"
"                                aj_acctg_plnt             ,
"
"                                aj_gl_lvl1                ,
"
"                                aj_gl_lvl2                ,
"
"                                aj_gl_lvl3                ,
"
"                                aj_gl_lvl4                ,
"
"                                aj_gl_acct                ,
"
"                                aj_gl_acct_desc           ,
"
"                                aj_reference1             ,
"
"                                aj_reference2             ,
"
"                                aj_fc_db_amt              ,
"
"                                aj_fc_cr_amt              ,
"
"                                aj_bc_db_amt              ,
"
"                                aj_bc_cr_amt              ,
"
"                                aj_db_ex_rate             ,
"
"                                aj_cr_ex_rate             ,
"
"                                aj_jrnl_date              ,
"
"                                aj_jrnl_year              ,
"
"                                aj_jrnl_period            ,
"
"                                aj_store_id               ,
"
"                                aj_store_name             ,
"
"                                aj_cls_id                 ,
"
"                                aj_cls_desc               ,
"
"                                aj_sub_cls_id             ,
"
"                                aj_sub_cls_desc           ,
"
"                                aj_prod_id                ,
"
"                                aj_prod_rev               ,
"
"                                aj_prod_desc1             ,
"
"                                aj_tc_id                  ,
"
"                                aj_tc_desc                ,
"
"                                aj_suplr_id               ,
"
"                                aj_suplr_name             ,
"
"                                aj_cust_id                ,
"
"                                aj_cust_name              ,
"
"                                aj_area_id                ,
"
"                                aj_area_desc              ,
"
"                                aj_terr_id                ,
"
"                                aj_terr_desc              ,
"
"                                aj_bank_id                ,
"
"                                aj_bank_name              ,
"
"                                aj_fa_grp_id              ,
"
"                                aj_fa_grp_desc            ,
"
"                                aj_fa_id                  ,
"
"                                aj_fa_desc                ,
"
"                                aj_dept_id                ,
"
"                                aj_dept_desc              ,
"
"                                aj_proj_id                ,
"
"                                aj_proj_desc              ,
"
"                                aj_res_grp_id             ,
"
"                                aj_res_grp_desc           ,
"
"                                aj_res_id                 ,
"
"                                aj_res_desc               ,
"
"                                aj_emp_id                 ,
"
"                                aj_emp_name               ,
"
"                                aj_trans_qty              ,
"
"                                aj_unit_cost              ,
"
"                                aj_unit_price             ,
"
"                                aj_source_doc_mode        ,
"
"                                aj_appl                   ,
"
"                                aj_status                 ,
"
"                                aj_jrnl_no                ,
"
"                                aj_cre_by                 ,
"
"                                aj_cre_date               ,
"
"                                aj_upd_by                 ,
"
"                                aj_upd_date               ,
"
"                                aj_offset_doc_no          ,
"
"                                aj_vou_type               ,
"
"                                aj_vou_pfx                ,
"
"                                aj_vou_no                 ,
"
"                                aj_vou_line_no            ,
"
"                                aj_ref_no                 ,
"
"                                aj_ref_date,
"
"                                aj_gl_lvl_prj
"
"                                )
"
"                            VALUES(
"
"                                p_bu                     ,
"
"                                p_plnt                   ,
"
"                                v_jrnl_trans_no           ,
"
"                                v_jrnl_trans_seq_no       ,
"
"                                v_dbt_acct_plnt             ,
"
"                                v_dbt_lvl1                ,
"
"                                v_dbt_lvl2                ,
"
"                                v_dbt_lvl3                ,
"
"                                v_dbt_lvl4                ,
"
"                                v_dbt_acct                ,
"
"                                func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                'PRODUCTION COMPLETION'             ,
"
"                                ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                0              ,
"
"                                ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                0              ,
"
"                                1             ,
"
"                                1             ,
"
"                                p_doc_date              ,
"
"                                func_find_year(p_bu,p_doc_date)              ,
"
"                                func_find_period(p_bu,p_doc_date)            ,
"
"                                v_rcpt_store               ,
"
"                                func_find_store_desc(p_bu,v_rcpt_store,p_lang)             ,
"
"                                func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                p_prod_id               ,
"
"                                p_prod_rev              ,
"
"                                func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL               ,
"
"                                NULL             ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL              ,
"
"                                NULL            ,
"
"                                NULL                  ,
"
"                                NULL                ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL                ,
"
"                                NULL              ,
"
"                                NULL             ,
"
"                                NULL           ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                p_comp_qty              ,
"
"                                v_unit_cost              ,
"
"                                v_unit_cost          ,
"
"                                NULL        ,
"
"                                'SFM'                   ,
"
"                                'N'                 ,
"
"                                NULL                ,
"
"                                p_user                 ,
"
"                                SYSDATE               ,
"
"                                NULL                 ,
"
"                                NULL               ,
"
"                                NULL          ,
"
"                                'PCM'               ,
"
"                                NULL                ,
"
"                                p_trans_no                 ,
"
"                                1            ,
"
"                                NULL                 ,
"
"                                NULL,
"
"                                v_dbt_prj_lvl
"
"                                  );
"
"
"
"
"
"                OPEN c4(v_post_insp_store);
"
"                FETCH c4 INTO cr4;
"
"                IF c4%NOTFOUND OR cr4.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                    v_crd_acct := cr4.store_gl_acct;
"
"
"
"                END IF;
"
"                CLOSE c4;
"
"
"
"
"
"
"
"
"
"                proc_find_cost_center(
"
"                        p_bu    ,
"
"                        p_plnt  ,
"
"                        NULL,
"
"                        v_crd_acct,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        NULL ,
"
"                        v_crd_lvl1,
"
"                        v_crd_lvl2,
"
"                        v_crd_lvl3,
"
"                        v_crd_lvl4,
"
"                        v_dbt_lvl5,
"
"                        v_dbt_lvl6,
"
"                        v_dbt_prj_lvl,
"
"                        v_dbt_acct_plnt  ,
"
"                        v_dbt_cc_code,
"
"                        v_dbt_act
"
"                        );
"
"
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                        VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'PRODUCTION COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'PRODUCTION COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))             ,
"
"                                            0 ,
"
"                                            ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_doc_date              ,
"
"                                            func_find_year(p_bu,p_doc_date)              ,
"
"                                            func_find_period(p_bu,p_doc_date)            ,
"
"                                            v_post_insp_store               ,
"
"                                            func_find_store_desc(p_bu,v_post_insp_store,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                            p_prod_id               ,
"
"                                            p_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty              ,
"
"                                            v_unit_cost              ,
"
"                                            v_unit_cost          ,
"
"                                            NULL        ,
"
"                                            'SFM'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'PCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                              );
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
"  END proc_cre_postinsp_rcpt_jrnl;
"
"
"
"
"
" END pkg_sercomp_jrnls;"
/
