CREATE OR REPLACE
"PACKAGE BODY pack_emp_upd_dtl
"
"IS
"
"PROCEDURE proc_upd_emp_dtl(p_bu                VARCHAR2,
"
"               p_type            VARCHAR2,
"
"               p_emp_id            VARCHAR2,
"
"               p_user            VARCHAR2,
"
"               p_doc_no    OUT        VARCHAR2)
"
"IS
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM employees
"
" WHERE emp_bu        = p_bu
"
"   AND emp_emp_id    = p_emp_id;
"
"
"
"   cr1        c1%ROWTYPE;
"
"
"
"  v_emp_id         VARCHAR2(10)  := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr        VARCHAR2(20) := Audit_Info.GET_IP_ADDRESS;
"
"  v_os_user        VARCHAR2(50) := Audit_Info.GET_OS_USER;
"
"  v_cnt            NUMBER(5);
"
"  v_doc_no         VARCHAR(10);
"
"
"
"BEGIN
"
"  IF p_type = 'ED' THEN
"
"
"
"    OPEN c1;
"
"    FETCH c1 INTO cr1;
"
"      IF c1%FOUND THEN
"
"        DELETE
"
"          FROM edit_employees
"
"         WHERE ee_bu     = p_bu
"
"           AND ee_emp_id = p_emp_id
"
"           AND ee_status = 'N';
"
"
"
"        SELECT NVL(TO_NUMBER(MAX(ee_doc_no)),'1000000000') +1
"
"          INTO v_doc_no
"
"          FROM edit_employees
"
"         WHERE ee_bu = p_bu;
"
"
"
"        INSERT INTO edit_employees(ee_bu                                      ,
"
"                    ee_doc_no               ,
"
"                    ee_doc_date             ,
"
"                    ee_emp_salution            ,
"
"                    ee_emp_id               ,
"
"                    ee_emp_first_name       ,
"
"                    ee_emp_middle_name      ,
"
"                    ee_emp_last_name        ,
"
"                    ee_emp_gender           ,
"
"                    ee_emp_shift            ,
"
"                    ee_emp_clndr_id         ,
"
"                    ee_emp_zone             ,
"
"                    ee_emp_cat_id           ,
"
"                    ee_emp_acct_cat_id      ,
"
"                    ee_emp_group            ,
"
"                    ee_emp_notice           ,
"
"                    ee_emp_marital_status   ,
"
"                    ee_emp_dom              ,
"
"                    ee_emp_blood_grp        ,
"
"                    ee_emp_include_payroll  ,
"
"                    ee_emp_father_name      ,
"
"                    ee_emp_mother_name      ,
"
"                    ee_emp_spouse_name      ,
"
"                    ee_emp_birth_place      ,
"
"                    emp_pay_mode            ,
"
"                    emp_bank_acct_no        ,
"
"                    emp_bank_bnfry_name     ,
"
"                    emp_bank_name           ,
"
"                    ee_emp_bank_branch_desc ,
"
"                    emp_bank_ifsc_code      ,
"
"                    emp_pay_from_bank       ,
"
"                    ee_emp_dob              ,
"
"                    ee_emp_trv_adv_ac_type  ,
"
"                    ee_emp_trv_adv_acct_id  ,
"
"                    ee_emp_current_acct     ,
"
"                    ee_emp_aadhar_no        ,
"
"                    ee_emp_aadhar_name      ,
"
"                    emp_it_pan_no           ,
"
"                    ee_emp_email_id         ,
"
"                    ee_emp_mobile_no        ,
"
"                    ee_emp_altr_mobile_no   ,
"
"                    ee_emp_skill_part       ,
"
"                    ee_status               ,
"
"                    ee_emp_cre_by           ,
"
"                    ee_emp_cre_ip_addr      ,
"
"                    ee_emp_cre_os_user      ,
"
"                    ee_emp_cre_date               ,
"
"                    ee_emp_cre_emp_id             )
"
"                     VALUES(p_bu,
"
"                    v_doc_no,
"
"                    TRUNC(SYSDATE),
"
"                    Cr1.emp_salution,
"
"                    cr1.emp_emp_id,
"
"                    cr1.emp_first_name1,
"
"                    cr1.emp_middle_name1,
"
"                    cr1.emp_last_name1,
"
"                    cr1.emp_gender,
"
"                    cr1.emp_shift_id,
"
"                    cr1.emp_clndr_id,
"
"                    cr1.emp_zone,
"
"                    cr1.emp_cat_id,
"
"                    cr1.emp_acct_cat_id,
"
"                    cr1.emp_group_id,
"
"                    cr1.emp_notice_period,
"
"                    cr1.emp_marital_status,
"
"                    cr1.emp_dom,
"
"                    cr1.emp_blood_group,
"
"                    cr1.emp_include_payroll,
"
"                    cr1.emp_father_name,
"
"                    cr1.emp_mother_name,
"
"                    cr1.emp_spouse_name,
"
"                    cr1.emp_pob,
"
"                    cr1.emp_pay_mode,
"
"                    cr1.emp_bank_acct_no,
"
"                    cr1.emp_bank_bnfry_name,
"
"                    cr1.emp_bank_desc,
"
"                    cr1.emp_bank_branch_desc,
"
"                    cr1.emp_bank_ifsc_code ,
"
"                    cr1.emp_pay_from_bank_acct,
"
"                    cr1.emp_dob ,
"
"                    cr1.emp_trv_adv_ac_type ,
"
"                    cr1.emp_trv_adv_acct_id ,
"
"                    cr1.emp_current_acct ,
"
"                    cr1.emp_aadhar_no ,
"
"                    cr1.emp_aadhar_name ,
"
"                    cr1.emp_it_pan_no ,
"
"                    cr1.emp_off_email_id,
"
"                    cr1.emp_off_mobile_no,
"
"                    cr1.emp_alt_mobile_no,
"
"                    cr1.emp_skill_id,
"
"                    'N',
"
"                    p_user,
"
"                    v_ip_addr,
"
"                    v_os_user,
"
"                    SYSDATE,
"
"                    v_emp_id)  ;
"
"
"
"          p_doc_no := v_doc_no;
"
"      END IF;
"
"  END IF;
"
"
"
"  IF p_type = 'AD' THEN
"
"
"
"    OPEN c1;
"
"    FETCH c1 INTO cr1;
"
"      IF c1%FOUND THEN
"
"        DELETE
"
"          FROM emp_address_chng_rqst
"
"         WHERE eacr_bu     = p_bu
"
"           AND eacr_emp_id = p_emp_id
"
"           AND eacr_status = 'N';
"
"
"
"        SELECT NVL(MAX(TO_NUMBER(eacr_doc_no)),'1000000000') +1
"
"          INTO v_doc_no
"
"          FROM emp_address_chng_rqst
"
"         WHERE eacr_bu = p_bu;
"
"
"
"        INSERT INTO emp_address_chng_rqst(eacr_bu           ,
"
"                        eacr_doc_no       ,
"
"                        eacr_doc_date        ,
"
"                        eacr_emp_id       ,
"
"                        eacr_addres1      ,
"
"                        eacr_addres2      ,
"
"                        eacr_addres3      ,
"
"                        eacr_city         ,
"
"                        eacr_state        ,
"
"                        eacr_cntry        ,
"
"                        eacr_zip          ,
"
"                        eacr_tele1        ,
"
"                        eacr_comm_addres1 ,
"
"                        eacr_comm_addres2 ,
"
"                        eacr_comm_addres3 ,
"
"                        eacr_comm_city    ,
"
"                        eacr_comm_state   ,
"
"                        eacr_comm_cntry   ,
"
"                        eacr_comm_zip     ,
"
"                        eacr_comm_tele1   ,
"
"                        eacr_status       ,
"
"                        eacr_cre_by       ,
"
"                        eacr_cre_ip_addr  ,
"
"                        eacr_cre_os_user  ,
"
"                        eacr_cre_date     ,
"
"                        eacr_cre_emp_id   ,
"
"                        eacr_appr_by        ,
"
"                        eacr_appr_date    ,
"
"                        eacr_appr_emp_id  )
"
"                     VALUES(p_bu,                      --eempa_bu
"
"                        v_doc_no,                        --eempa_doc_no
"
"                        TRUNC(SYSDATE),                         --eempa_doc_date
"
"                        cr1.emp_emp_id,                  --eempa_emp_id
"
"                        cr1.emp_addres1,                 --eempa_addres1
"
"                        cr1.emp_addres2,                 --eempa_comm_addres2
"
"                        cr1.emp_addres3,                 --eempa_comm_addres3
"
"                        cr1.emp_city,                   --eempa_city
"
"                        cr1.emp_state,                  --eempa_state
"
"                        cr1.emp_cntry,                   --eempa_cntry
"
"                        cr1.emp_zip,                     --eempa_zip
"
"                        cr1.emp_tele1,                   --eempa_tele1
"
"                        cr1.emp_comm_addres1   ,         --eempa_comm_addres1,
"
"                        cr1.emp_comm_addres2  ,          --eempa_comm_addres2,
"
"                        cr1.emp_comm_addres3 ,           --eempa_comm_addres3,
"
"                        cr1.emp_comm_city ,             --eempa_comm_city,
"
"                        cr1.emp_comm_state ,            --eempa_comm_state,
"
"                        cr1.emp_comm_cntry,             --eempa_comm_cntry,
"
"                        cr1.emp_comm_zip,                    --eempa_comm_zip,
"
"                        cr1.emp_comm_tele1,               --eempa_comm_tele1,
"
"                        'N',                              --eempa_status
"
"                        p_user,                      --eempa_cre_by
"
"                        v_ip_addr,                      --eempa_cre_ip_addr
"
"                        v_os_user,                      --eempa_cre_os_user
"
"                        SYSDATE,                     --eempa_cre_date
"
"                        v_emp_id,                   --eempa_cre_emp_id
"
"                        NULL,                             --eempa_appr_by
"
"                        NULL,                             --eempa_appr_date
"
"                        NULL );                            --eempa_appr_emp_id
"
"
"
"        p_doc_no := v_doc_no;
"
"      END IF;
"
"  END IF;
"
"
"
"  IF p_type = 'DP' THEN
"
"
"
"     SELECT count(*)
"
"       INTO v_cnt
"
"       FROM emp_add_dpnt_rqst
"
"      WHERE eadr_bu       = p_bu
"
"        AND eadr_emp_id   = p_emp_id
"
"        AND eadr_status   = 'N';
"
"
"
"     IF v_cnt > 0 THEN
"
"        DELETE
"
"          FROM emp_add_dpnt_rqst
"
"         WHERE eadr_bu       = p_bu
"
"           AND eadr_emp_id   = p_emp_id
"
"           AND eadr_status   = 'N';
"
"     END IF;
"
"
"
"  END IF;
"
"
"
"  IF p_type = 'CON' THEN
"
"
"
"     SELECT count(*)
"
"       INTO v_cnt
"
"       FROM edit_emp_emer_cont_dtls
"
"      WHERE eeecd_bu       = p_bu
"
"        AND eeecd_emp_id   = p_emp_id
"
"        AND eeecd_status   = 'N';
"
"
"
"     IF v_cnt > 0 THEN
"
"        DELETE
"
"          FROM edit_emp_emer_cont_dtls
"
"         WHERE eeecd_bu       = p_bu
"
"           AND eeecd_emp_id   = p_emp_id
"
"           AND eeecd_status   = 'N';
"
"     END IF;
"
"
"
"  END IF;
"
"
"
"  IF p_type = 'QUA' THEN
"
"
"
"     SELECT count(*)
"
"       INTO v_cnt
"
"       FROM emp_add_edu_rqst
"
"      WHERE eaer_bu       = p_bu
"
"        AND eaer_emp_id   = p_emp_id
"
"        AND eaer_status   = 'N';
"
"
"
"     IF v_cnt > 0 THEN
"
"        DELETE
"
"          FROM emp_add_edu_rqst
"
"         WHERE eaer_bu       = p_bu
"
"           AND eaer_emp_id   = p_emp_id
"
"           AND eaer_status   = 'N';
"
"     END IF;
"
"
"
"  END IF;
"
"
"
"  IF p_type = 'SKL' THEN
"
"
"
"     SELECT count(*)
"
"       INTO v_cnt
"
"       FROM emp_add_skill_rqst
"
"      WHERE easr_bu       = p_bu
"
"        AND easr_emp_id   = p_emp_id
"
"        AND easr_status   = 'N';
"
"
"
"     IF v_cnt > 0 THEN
"
"        DELETE
"
"          FROM emp_add_skill_rqst
"
"         WHERE easr_bu       = p_bu
"
"           AND easr_emp_id   = p_emp_id
"
"           AND easr_status   = 'N';
"
"     END IF;
"
"
"
"  END IF;
"
"
"
"END proc_upd_emp_dtl;
"
"
"
"PROCEDURE proc_upd_emp_depent_dtl(p_bu            VARCHAR2,
"
"                  p_type        VARCHAR2,
"
"                  p_emp_id        VARCHAR2,
"
"                  p_user        VARCHAR2,
"
"                  p_doc_no    OUT    VARCHAR2)
"
"IS
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM emp_dependents
"
" WHERE empdepnt_bu    = p_bu
"
"   AND empdepnt_emp_id    = p_emp_id;
"
"
"
"   cr1            c1%ROWTYPE;
"
"   v_cnt                NUMBER(15);
"
"   v_seq_no        NUMBER(5);
"
"   v_emp_id             VARCHAR2(10)  := func_find_emp_id(p_bu,p_user);
"
"
"
"BEGIN
"
"   IF p_type = 'I' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_dpnt_rqst
"
"       WHERE eadr_bu       = p_bu
"
"         AND eadr_emp_id   = p_emp_id
"
"         AND eadr_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_dpnt_rqst
"
"      WHERE eadr_bu       = p_bu
"
"        AND eadr_emp_id   = p_emp_id
"
"        AND eadr_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eadr_doc_no)),'1000000000')+1
"
"       INTO p_doc_no
"
"       FROM emp_add_dpnt_rqst
"
"      WHERE eadr_bu = p_bu;
"
"
"
"   ELSIF p_type = 'U' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_dpnt_rqst
"
"       WHERE eadr_bu       = p_bu
"
"         AND eadr_emp_id   = p_emp_id
"
"         AND eadr_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_dpnt_rqst
"
"      WHERE eadr_bu       = p_bu
"
"        AND eadr_emp_id   = p_emp_id
"
"        AND eadr_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eadr_doc_no)),'1000000000')+1
"
"       INTO p_doc_no
"
"       FROM emp_add_dpnt_rqst
"
"      WHERE eadr_bu = p_bu;
"
"
"
"      v_seq_no  := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"      INSERT INTO emp_add_dpnt_rqst(eadr_bu             ,
"
"                    eadr_doc_no         ,
"
"                    eadr_doc_date       ,
"
"                    eadr_seq_no         ,
"
"                    eadr_emp_id         ,
"
"                    eadr_name           ,
"
"                    eadr_reltn_id       ,
"
"                    eadr_dob            ,
"
"                    eadr_gender         ,
"
"                    eadr_aadhar_no      ,
"
"                    eadr_email_id       ,
"
"                    eadr_contact_no     ,
"
"                    eadr_salary         ,
"
"                    eadr_med_flag       ,
"
"                    eadr_esi_cover_flag ,
"
"                    eadr_del_flag       ,
"
"                    eadr_status         ,
"
"                    eadr_type           ,
"
"                    eadr_cre_by         ,
"
"                    eadr_cre_date       ,
"
"                    eadr_cre_ip_addr    ,
"
"                    eadr_cre_os_user    ,
"
"                    eadr_cre_emp_id  )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    TRUNC(SYSDATE),
"
"                    v_seq_no,
"
"                    p_emp_id,
"
"                    cr1.empdepnt_name,
"
"                    cr1.empdepnt_reltn_id,
"
"                    cr1.empdepnt_dob,
"
"                    cr1.empdepnt_gender,
"
"                    cr1.empdepnt_aadhar_no,
"
"                    cr1.empdepnt_email_id,
"
"                    cr1.empdepnt_contact_no,
"
"                    cr1.empdepnt_salary,
"
"                    cr1.empdepnt_med_flag,
"
"                    cr1.empdepnt_esi_cover_flag,
"
"                    'N',
"
"                    'N',
"
"                    'U',
"
"                    p_user,
"
"                    SYSDATE,
"
"                    v_ip_addr,
"
"                    v_os_user,
"
"                    v_emp_id
"
"                    );
"
"          v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   ELSIF p_type = 'D' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_dpnt_rqst
"
"       WHERE eadr_bu       = p_bu
"
"         AND eadr_emp_id   = p_emp_id
"
"         AND eadr_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_dpnt_rqst
"
"      WHERE eadr_bu       = p_bu
"
"        AND eadr_emp_id   = p_emp_id
"
"        AND eadr_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eadr_doc_no)),'1000000000')+1
"
"       INTO p_doc_no
"
"       FROM emp_add_dpnt_rqst
"
"      WHERE eadr_bu = p_bu;
"
"
"
"      v_seq_no  := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"      INSERT INTO emp_add_dpnt_rqst(eadr_bu             ,
"
"                    eadr_doc_no         ,
"
"                    eadr_doc_date       ,
"
"                    eadr_seq_no         ,
"
"                    eadr_emp_id         ,
"
"                    eadr_name           ,
"
"                    eadr_reltn_id       ,
"
"                    eadr_dob            ,
"
"                    eadr_gender         ,
"
"                    eadr_aadhar_no      ,
"
"                    eadr_email_id       ,
"
"                    eadr_contact_no     ,
"
"                    eadr_salary         ,
"
"                    eadr_med_flag       ,
"
"                    eadr_esi_cover_flag ,
"
"                    eadr_del_flag       ,
"
"                    eadr_status         ,
"
"                    eadr_type           ,
"
"                    eadr_cre_by         ,
"
"                    eadr_cre_date       ,
"
"                    eadr_cre_ip_addr    ,
"
"                    eadr_cre_os_user    ,
"
"                    eadr_cre_emp_id  )
"
"                  VALUES(p_bu,
"
"                    p_doc_no,
"
"                    TRUNC(SYSDATE),
"
"                    v_seq_no,
"
"                    p_emp_id,
"
"                    cr1.empdepnt_name,
"
"                    cr1.empdepnt_reltn_id,
"
"                    cr1.empdepnt_dob,
"
"                    cr1.empdepnt_gender,
"
"                    cr1.empdepnt_aadhar_no,
"
"                    cr1.empdepnt_email_id,
"
"                    cr1.empdepnt_contact_no,
"
"                    cr1.empdepnt_salary,
"
"                    cr1.empdepnt_med_flag,
"
"                    cr1.empdepnt_esi_cover_flag,
"
"                    'Y',
"
"                    'N',
"
"                    'D',
"
"                    p_user,
"
"                    SYSDATE,
"
"                    v_ip_addr,
"
"                    v_os_user,
"
"                    v_emp_id
"
"                    );
"
"      v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   END IF;
"
"
"
"END proc_upd_emp_depent_dtl;
"
"
"
"PROCEDURE proc_upd_emp_con_dtl(p_bu        VARCHAR2,
"
"                   p_type        VARCHAR2,
"
"                   p_emp_id        VARCHAR2,
"
"                   p_user        VARCHAR2,
"
"                   p_doc_no      OUT    VARCHAR2)
"
"IS
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM emp_emer_cont_dtls
"
" WHERE eecd_bu        = p_bu
"
"   AND eecd_emp_id    = p_emp_id;
"
"
"
"   cr1            c1%ROWTYPE;
"
"   v_cnt            NUMBER(15);
"
"   v_seq_no        NUMBER(5);
"
"   v_emp_id             VARCHAR2(10)  := func_find_emp_id(p_bu,p_user);
"
"
"
"BEGIN
"
"   IF p_type = 'I' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM edit_emp_emer_cont_dtls
"
"       WHERE eeecd_bu       = p_bu
"
"         AND eeecd_emp_id   = p_emp_id
"
"         AND eeecd_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM edit_emp_emer_cont_dtls
"
"      WHERE eeecd_bu       = p_bu
"
"        AND eeecd_emp_id   = p_emp_id
"
"        AND eeecd_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eeecd_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM edit_emp_emer_cont_dtls
"
"       WHERE eeecd_bu     = p_bu;
"
"
"
"   ELSIF p_type = 'U' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM edit_emp_emer_cont_dtls
"
"       WHERE eeecd_bu       = p_bu
"
"         AND eeecd_emp_id   = p_emp_id
"
"         AND eeecd_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM edit_emp_emer_cont_dtls
"
"      WHERE eeecd_bu    = p_bu
"
"        AND eeecd_emp_id   = p_emp_id
"
"        AND eeecd_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eeecd_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM edit_emp_emer_cont_dtls
"
"       WHERE eeecd_bu     = p_bu;
"
"
"
"      v_seq_no := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"    INSERT INTO edit_emp_emer_cont_dtls(eeecd_bu            ,
"
"                    eeecd_doc_no              ,
"
"                    eeecd_seq_no        ,
"
"                    eeecd_doc_date          ,
"
"                    eeecd_emp_id        ,
"
"                    eeecd_cont_per_name ,
"
"                    eeecd_cont_reltn    ,
"
"                    eeecd_addres1       ,
"
"                    eeecd_city          ,
"
"                    eeecd_state         ,
"
"                    eeecd_cntry         ,
"
"                    eeecd_mobile_no     ,
"
"                    eeecd_tele               ,
"
"                    eeecd_mod_cont_per_name ,
"
"                    eeecd_status          ,
"
"                    eeecd_type                  ,
"
"                    eeecd_del_flag    ,
"
"                    eeecd_cre_by        ,
"
"                    eeecd_cre_ip_addr   ,
"
"                    eeecd_cre_os_user   ,
"
"                    eeecd_cre_date      ,
"
"                    eeecd_cre_emp_id    )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    v_seq_no,
"
"                    TRUNC(SYSDATE),
"
"                    p_emp_id,
"
"                    cr1.eecd_cont_per_name,
"
"                    cr1.eecd_cont_reltn,
"
"                    cr1.eecd_addres1,
"
"                    cr1.eecd_city,
"
"                    cr1.eecd_state,
"
"                    cr1.eecd_cntry,
"
"                    cr1.eecd_mobile_no,
"
"                    cr1.eecd_tele,
"
"                    cr1.eecd_cont_per_name,
"
"                    'N',
"
"                    'U',
"
"                    'N',
"
"                    p_user,
"
"                    v_ip_addr,
"
"                    v_os_user,
"
"                    SYSDATE,
"
"                    v_emp_id);
"
"      v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   ELSIF p_type = 'D' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM edit_emp_emer_cont_dtls
"
"       WHERE eeecd_bu       = p_bu
"
"         AND eeecd_emp_id   = p_emp_id
"
"         AND eeecd_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM edit_emp_emer_cont_dtls
"
"      WHERE eeecd_bu    = p_bu
"
"        AND eeecd_emp_id   = p_emp_id
"
"        AND eeecd_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eeecd_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM edit_emp_emer_cont_dtls
"
"       WHERE eeecd_bu     = p_bu;
"
"
"
"      v_seq_no := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"    INSERT INTO edit_emp_emer_cont_dtls(eeecd_bu            ,
"
"                    eeecd_doc_no           ,
"
"                    eeecd_seq_no                ,
"
"                    eeecd_doc_date          ,
"
"                    eeecd_emp_id        ,
"
"                    eeecd_cont_per_name ,
"
"                    eeecd_cont_reltn    ,
"
"                    eeecd_addres1       ,
"
"                    eeecd_city          ,
"
"                    eeecd_state         ,
"
"                    eeecd_cntry         ,
"
"                    eeecd_mobile_no     ,
"
"                    eeecd_tele               ,
"
"                    eeecd_mod_cont_per_name,
"
"                    eeecd_status          ,
"
"                    eeecd_type                  ,
"
"                    eeecd_del_flag          ,
"
"                    eeecd_cre_by        ,
"
"                    eeecd_cre_ip_addr   ,
"
"                    eeecd_cre_os_user   ,
"
"                    eeecd_cre_date      ,
"
"                    eeecd_cre_emp_id    )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    v_seq_no,
"
"                    TRUNC(SYSDATE),
"
"                    p_emp_id,
"
"                    cr1.eecd_cont_per_name,
"
"                    cr1.eecd_cont_reltn,
"
"                    cr1.eecd_addres1,
"
"                    cr1.eecd_city,
"
"                    cr1.eecd_state,
"
"                    cr1.eecd_cntry,
"
"                    cr1.eecd_mobile_no,
"
"                    cr1.eecd_tele,
"
"                    cr1.eecd_cont_per_name,
"
"                    'N',
"
"                    'D',
"
"                    'Y',
"
"                    p_user,
"
"                    v_ip_addr,
"
"                    v_os_user,
"
"                    SYSDATE,
"
"                    v_emp_id);
"
"      v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   END IF;
"
"
"
"END proc_upd_emp_con_dtl;
"
"
"
"PROCEDURE proc_upd_emp_qual_dtl(p_bu        VARCHAR2,
"
"                p_type        VARCHAR2,
"
"                p_emp_id    VARCHAR2,
"
"                p_user        VARCHAR2,
"
"                p_doc_no   OUT    VARCHAR2)
"
"IS
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM emp_edu_qulfn
"
" WHERE eeq_bu        = p_bu
"
"   AND eeq_emp_id    = p_emp_id;
"
"
"
"   cr1            c1%ROWTYPE;
"
"   v_cnt            NUMBER(15);
"
"   v_seq_no        NUMBER(5);
"
"   v_emp_id             VARCHAR2(10)  := func_find_emp_id(p_bu,p_user);
"
"
"
"BEGIN
"
"   IF p_type = 'I' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_edu_rqst
"
"       WHERE eaer_bu       = p_bu
"
"         AND eaer_emp_id   = p_emp_id
"
"         AND eaer_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_edu_rqst
"
"      WHERE eaer_bu    = p_bu
"
"        AND eaer_emp_id   = p_emp_id
"
"        AND eaer_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eaer_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM emp_add_edu_rqst
"
"       WHERE eaer_bu     = p_bu;
"
"
"
"   ELSIF p_type = 'U' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_edu_rqst
"
"       WHERE eaer_bu       = p_bu
"
"         AND eaer_emp_id   = p_emp_id
"
"         AND eaer_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_edu_rqst
"
"      WHERE eaer_bu    = p_bu
"
"        AND eaer_emp_id   = p_emp_id
"
"        AND eaer_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eaer_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM emp_add_edu_rqst
"
"       WHERE eaer_bu     = p_bu;
"
"
"
"      v_seq_no := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"    INSERT INTO emp_add_edu_rqst(eaer_bu                    ,
"
"                eaer_doc_no                  ,
"
"                eaer_doc_date              ,
"
"                eaer_seq_no                ,
"
"                eaer_emp_id                ,
"
"                eaer_edu_id                ,
"
"                eaer_bos_id                ,
"
"                eaer_institute             ,
"
"                eaer_year_of_pass          ,
"
"                eaer_grade                 ,
"
"                eaer_aggregate_pct         ,
"
"                eaer_tot_year                   ,
"
"                eaer_status                   ,
"
"                eaer_type                           ,
"
"                eaer_del_flag            ,
"
"                eaer_cre_by                ,
"
"                eaer_cre_ip_addr           ,
"
"                eaer_cre_os_user           ,
"
"                eaer_cre_date              ,
"
"                eaer_cre_emp_id       )
"
"              VALUES(p_bu,
"
"                 p_doc_no,
"
"                TRUNC(SYSDATE),
"
"                cr1.eeq_seq_no,
"
"                p_emp_id,
"
"                cr1.eeq_edu_id,
"
"                cr1.eeq_edu_bos_id,
"
"                cr1.eeq_institute,
"
"                cr1.eeq_year_of_pass,
"
"                cr1.eeq_grade,
"
"                cr1.eeq_aggregate_pct,
"
"                cr1.eeq_tot_years,
"
"                'N',
"
"                'U',
"
"                'N',
"
"                p_user,
"
"                v_ip_addr,
"
"                v_os_user,
"
"                SYSDATE,
"
"                v_emp_id);
"
"      v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   ELSIF p_type = 'D' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_edu_rqst
"
"       WHERE eaer_bu       = p_bu
"
"         AND eaer_emp_id   = p_emp_id
"
"         AND eaer_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_edu_rqst
"
"      WHERE eaer_bu    = p_bu
"
"        AND eaer_emp_id   = p_emp_id
"
"        AND eaer_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(eaer_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM emp_add_edu_rqst
"
"       WHERE eaer_bu     = p_bu;
"
"
"
"      v_seq_no := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"    INSERT INTO emp_add_edu_rqst(eaer_bu                    ,
"
"                eaer_doc_no                  ,
"
"                eaer_doc_date              ,
"
"                eaer_seq_no                ,
"
"                eaer_emp_id                ,
"
"                eaer_edu_id                ,
"
"                eaer_bos_id                ,
"
"                eaer_institute             ,
"
"                eaer_year_of_pass          ,
"
"                eaer_grade                 ,
"
"                eaer_aggregate_pct         ,
"
"                eaer_tot_year                   ,
"
"                eaer_status                   ,
"
"                eaer_del_flag                    ,
"
"                eaer_type                           ,
"
"                eaer_cre_by                ,
"
"                eaer_cre_ip_addr           ,
"
"                eaer_cre_os_user           ,
"
"                eaer_cre_date              ,
"
"                eaer_cre_emp_id       )
"
"             VALUES(p_bu,
"
"                p_doc_no,
"
"                TRUNC(SYSDATE),
"
"                cr1.eeq_seq_no,
"
"                p_emp_id,
"
"                cr1.eeq_edu_id,
"
"                cr1.eeq_edu_bos_id,
"
"                cr1.eeq_institute,
"
"                cr1.eeq_year_of_pass,
"
"                cr1.eeq_grade,
"
"                cr1.eeq_aggregate_pct,
"
"                cr1.eeq_tot_years,
"
"                'N',
"
"                'Y',
"
"                'D',
"
"                p_user,
"
"                v_ip_addr,
"
"                v_os_user,
"
"                SYSDATE,
"
"                v_emp_id);
"
"       v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   END IF;
"
"
"
"END proc_upd_emp_qual_dtl;
"
"
"
"PROCEDURE proc_upd_emp_skill_dtl(p_bu        VARCHAR2,
"
"                p_type        VARCHAR2,
"
"                p_emp_id    VARCHAR2,
"
"                p_user        VARCHAR2,
"
"                p_doc_no   OUT    VARCHAR2)
"
"IS
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM emp_skill_sets
"
" WHERE es_bu        = p_bu
"
"   AND es_emp_id    = p_emp_id;
"
"
"
"   cr1            c1%ROWTYPE;
"
"   v_cnt            NUMBER(15);
"
"   v_seq_no        NUMBER(5);
"
"   v_emp_id             VARCHAR2(10)  := func_find_emp_id(p_bu,p_user);
"
"
"
"BEGIN
"
"   IF p_type = 'I' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_skill_rqst
"
"       WHERE easr_bu       = p_bu
"
"         AND easr_emp_id   = p_emp_id
"
"         AND easr_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_skill_rqst
"
"      WHERE easr_bu    = p_bu
"
"        AND easr_emp_id   = p_emp_id
"
"        AND easr_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(easr_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM emp_add_skill_rqst
"
"       WHERE easr_bu     = p_bu;
"
"
"
"   ELSIF p_type = 'U' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_skill_rqst
"
"       WHERE easr_bu       = p_bu
"
"         AND easr_emp_id   = p_emp_id
"
"         AND easr_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_skill_rqst
"
"      WHERE easr_bu    = p_bu
"
"        AND easr_emp_id   = p_emp_id
"
"        AND easr_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(easr_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM emp_add_skill_rqst
"
"       WHERE easr_bu     = p_bu;
"
"
"
"      v_seq_no    := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"    INSERT INTO emp_add_skill_rqst(easr_bu          ,
"
"                easr_doc_no            ,
"
"                easr_seq_no            ,
"
"                easr_doc_date        ,
"
"                easr_emp_id       ,
"
"                easr_id                     ,
"
"                easr_desc                ,
"
"                easr_level          ,
"
"                easr_status          ,
"
"                easr_mod_skill_id ,
"
"                easr_type                ,
"
"                easr_del_flag        ,
"
"                easr_cre_by       ,
"
"                easr_cre_ip_addr  ,
"
"                easr_cre_os_user  ,
"
"                easr_cre_date     ,
"
"                easr_cre_emp_id   )
"
"             VALUES(p_bu,
"
"                p_doc_no,
"
"                v_seq_no        ,
"
"                TRUNC(SYSDATE),
"
"                p_emp_id,
"
"                cr1.es_id,
"
"                cr1.es_desc,
"
"                cr1.es_level,
"
"                'N',
"
"                cr1.es_id||'-'||cr1.es_level,
"
"                'U',
"
"                'N',
"
"                p_user,
"
"                v_ip_addr,
"
"                v_os_user,
"
"                SYSDATE,
"
"                v_emp_id);
"
"      v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   ELSIF p_type = 'D' THEN
"
"
"
"      SELECT count(*)
"
"        INTO v_cnt
"
"        FROM emp_add_skill_rqst
"
"       WHERE easr_bu       = p_bu
"
"         AND easr_emp_id   = p_emp_id
"
"         AND easr_status   = 'N';
"
"
"
"      IF v_cnt > 0 THEN
"
"     DELETE
"
"       FROM emp_add_skill_rqst
"
"      WHERE easr_bu    = p_bu
"
"        AND easr_emp_id   = p_emp_id
"
"        AND easr_status   = 'N';
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(easr_doc_no)),1000000000) + 1
"
"        INTO p_doc_no
"
"        FROM emp_add_skill_rqst
"
"       WHERE easr_bu     = p_bu;
"
"
"
"      v_seq_no    := 1;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"    INSERT INTO emp_add_skill_rqst(easr_bu          ,
"
"                easr_doc_no            ,
"
"                easr_seq_no          ,
"
"                easr_doc_date        ,
"
"                easr_emp_id       ,
"
"                easr_id                     ,
"
"                easr_desc                ,
"
"                easr_level          ,
"
"                easr_status          ,
"
"                easr_mod_skill_id ,
"
"                easr_type                ,
"
"                easr_del_flag     ,
"
"                easr_cre_by       ,
"
"                easr_cre_ip_addr  ,
"
"                easr_cre_os_user  ,
"
"                easr_cre_date     ,
"
"                easr_cre_emp_id   )
"
"             VALUES(p_bu,
"
"                p_doc_no,
"
"                v_seq_no         ,
"
"                TRUNC(SYSDATE),
"
"                p_emp_id,
"
"                cr1.es_id,
"
"                cr1.es_desc,
"
"                cr1.es_level,
"
"                'N',
"
"                cr1.es_id||'-'||cr1.es_level,
"
"                'D',
"
"                'Y',
"
"                p_user,
"
"                v_ip_addr,
"
"                v_os_user,
"
"                SYSDATE,
"
"                v_emp_id);
"
"      v_seq_no := v_seq_no +1;
"
"
"
"      END LOOP;
"
"
"
"   END IF;
"
"END proc_upd_emp_skill_dtl;
"
"
"
"PROCEDURE proc_upd_emp_emp_proj( p_bu                  VARCHAR2,
"
"                           p_type                VARCHAR2,
"
"                           p_emp_id                 VARCHAR2,
"
"                           p_user                VARCHAR2,
"
"                           p_doc_no    OUT       VARCHAR2)
"
"IS
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM emp_project_dtls
"
" WHERE epd_bu    = p_bu
"
"   AND epd_emp_id = p_emp_id;
"
"
"
"   cr1        c1%ROWTYPE;
"
"
"
"  v_emp_id         VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr        VARCHAR2(20) := Audit_Info.GET_IP_ADDRESS;
"
"  v_os_user        VARCHAR2(50) := Audit_Info.GET_OS_USER;
"
"  v_cnt            NUMBER(5);
"
"  v_doc_no         VARCHAR(10);
"
"
"
"BEGIN
"
"  IF p_type = 'EPCR' THEN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"      IF c1%FOUND THEN
"
"
"
"      DELETE
"
"        FROM emp_project_chng_rqst
"
"       WHERE epcr_bu     = p_bu
"
"             AND epcr_emp_id = cr1.epd_emp_id
"
"             AND epcr_status = 'N';
"
"
"
"          SELECT NVL(TO_NUMBER(MAX(epcr_doc_no)),1000000000) +1
"
"        INTO v_doc_no
"
"        FROM emp_project_chng_rqst
"
"           WHERE epcr_bu     = p_bu
"
"             AND epcr_emp_id = p_emp_id;
"
"
"
"            INSERT INTO emp_project_chng_rqst (
"
"                epcr_bu,
"
"                epcr_emp_id,
"
"                epcr_plnt,
"
"                epcr_proj_id,
"
"                epcr_cre_by,
"
"                epcr_cre_ip_addr,
"
"                epcr_cre_emp_id,
"
"                epcr_cre_os_user,
"
"                epcr_cre_date,
"
"                epcr_doc_no,
"
"                epcr_status,
"
"                epcr_appr_by,
"
"                epcr_appr_emp_id,
"
"                epcr_appr_date,
"
"                epcr_doc_date
"
"                )
"
"             VALUES(
"
"            p_bu,
"
"            cr1.epd_emp_id,
"
"            cr1.epd_plnt,
"
"            cr1.epd_proj_id,
"
"            p_user,
"
"            v_ip_addr,
"
"            v_emp_id,
"
"            v_os_user,
"
"            SYSDATE,
"
"            v_doc_no,
"
"            'N',
"
"            NULL,
"
"            NULL,
"
"            NULL,
"
"            SYSDATE
"
"            );
"
"
"
"        p_doc_no := v_doc_no;
"
"
"
"      END IF;
"
"      CLOSE c1;
"
"  END IF;
"
"
"
"
"
"END proc_upd_emp_emp_proj;
"
"
"
"END pack_emp_upd_dtl;
"
/
