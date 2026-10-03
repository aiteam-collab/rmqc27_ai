CREATE OR REPLACE
"PACKAGE BODY        pack_emp_increment_mig_range
"
"AS
"
"
"
"  PROCEDURE proc_upload_emp_incre_mig(p_bu                VARCHAR2,
"
"                          p_doc_no                VARCHAR2,
"
"                          p_dir                VARCHAR2,
"
"                          p_file_name                VARCHAR2,
"
"                          p_user                VARCHAR2,
"
"                          p_res             OUT        VARCHAR2)
"
"     IS
"
"     CURSOR c1
"
"         IS
"
"     SELECT table_name
"
"       FROM user_tables
"
"      WHERE table_name = 'TEMP_EMP_INC_MIG_LN';
"
"
"
"        cr1                c1%ROWTYPE;
"
"
"
"     CURSOR c2
"
"         IS
"
"     SELECT *
"
"       FROM hrm_emp_alu_inc_ln
"
"      WHERE heail_bu = p_bu
"
"        AND heail_doc_no = p_doc_no;
"
"
"
"        cr2              c2%ROWTYPE;
"
"
"
"        v_result                VARCHAR2(1) ;
"
"        v_exp_flag            VARCHAR2(1) := 'N';
"
"        v_status                VARCHAR2(1) := 'N';
"
"        v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"        v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"        v_cre_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"
"
"     BEGIN
"
"
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"
"
"           IF c1%FOUND THEN
"
"
"
"              EXECUTE IMMEDIATE 'DROP TABLE TEMP_EMP_INC_MIG_LN';
"
"
"
"           END IF;
"
"
"
"        CLOSE c1;
"
"
"
"        DELETE
"
"          FROM hrm_alu_range_elmnt
"
"         WHERE hare_bu     = p_bu
"
"           AND hare_doc_no = p_doc_no;
"
"
"
"        EXECUTE IMMEDIATE 'CREATE TABLE temp_emp_inc_mig_ln(termln_emp_id        VARCHAR2(500),
"
"                                      termln_eff_date        VARCHAR2(500),
"
"                                      termln_elmnt        VARCHAR2(500),
"
"                                      termln_amount        VARCHAR2(500))
"
"                   ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                          ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                     SKIP 1
"
"                                    FIELDS TERMINATED BY ''|''
"
"                                    MISSING FIELD VALUES ARE NULL
"
"                                    REJECT ROWS WITH ALL NULL FIELDS
"
"                                    (termln_emp_id        CHAR(255),
"
"                                     termln_eff_date        CHAR(255),
"
"                                     termln_elmnt            CHAR(255),
"
"                                     termln_amount        CHAR(255)))
"
"                             LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE 'INSERT INTO hrm_alu_range_elmnt(hare_bu,
"
"                              hare_doc_no,
"
"                              hare_seq_no,
"
"                              hare_emp_id,
"
"                              hare_elmnt_id,
"
"                              hare_sal_eff_date,
"
"                              hare_amount,
"
"                              hare_cre_by,
"
"                              hare_cre_ip_addr,
"
"                              hare_cre_os_user,
"
"                              hare_cre_emp_id,
"
"                              hare_cre_date) (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                             '|| CHR(39) || p_doc_no || CHR(39) ||',
"
"                                           ROWNUM          ,
"
"                                           termln_emp_id      ,
"
"                                           termln_elmnt  ,
"
"                                           termln_eff_date,
"
"                                           termln_amount ,
"
"                                           '|| CHR(39) || p_user || CHR(39) ||',
"
"                                           '|| CHR(39) || v_ip_addr || CHR(39) ||',
"
"                                           '|| CHR(39) || v_os_user || CHR(39) ||',
"
"                                           '|| CHR(39) || v_cre_emp_id || CHR(39) ||',
"
"                                           SYSDATE
"
"                                          FROM temp_emp_inc_mig_ln)';
"
"
"
"        EXECUTE IMMEDIATE 'DROP TABLE temp_emp_inc_mig_ln';
"
"
"
"        UPDATE hrm_alu_range_elmnt
"
"           SET hare_emp_id           = TRIM(hare_emp_id),
"
"                hare_elmnt_id          = TRIM(hare_elmnt_id),
"
"                hare_amount          = TRIM(hare_amount),
"
"                hare_sal_eff_date    = TRIM(hare_sal_eff_date)
"
"         WHERE hare_bu       = p_bu
"
"           AND hare_doc_no   = p_doc_no;
"
"
"
"        UPDATE hrm_alu_range_elmnt
"
"           SET hare_emp_id           = UPPER(hare_emp_id),
"
"               hare_elmnt_id         = UPPER(hare_elmnt_id),
"
"               hare_amount         = UPPER(hare_amount),
"
"               hare_sal_eff_date     = UPPER(hare_sal_eff_date)
"
"         WHERE hare_bu     = p_bu
"
"           AND hare_doc_no = p_doc_no;
"
"
"
"        IF SQL%NOTFOUND THEN
"
"              v_result := 'N';
"
"        ELSE
"
"          v_result := 'Y';
"
"        END IF;
"
"
"
"        p_res := v_result;
"
"
"
"   END proc_upload_emp_incre_mig;
"
"
"
" PROCEDURE proc_ins_range_elmnts(p_bu            VARCHAR2,
"
"                 p_doc_no        VARCHAR2,
"
"                 p_user            VARCHAR2,
"
"                 p_res        OUT    VARCHAR2)
"
" IS
"
"
"
" CURSOR c1
"
"     IS
"
" SELECT DISTINCT hare_emp_id
"
"   FROM hrm_alu_range_elmnt
"
"  WHERE hare_bu = p_bu
"
"    AND hare_doc_no = p_doc_no;
"
"
"
" CURSOR c2(c_emp_id    VARCHAR2)
"
"     IS
"
" SELECT *
"
"   FROM hrm_alu_range_elmnt
"
"  WHERE hare_bu     = p_bu
"
"    AND hare_doc_no = p_doc_no
"
"    AND hare_emp_id  = c_emp_id;
"
"
"
" CURSOR c3(c_elmnt_id        VARCHAR2)
"
"     IS
"
" SELECT *
"
"   FROM payroll_elements_hd
"
"  WHERE pehd_bu = p_bu
"
"    AND pehd_elmnt_id = c_elmnt_id
"
"    AND pehd_type = 'B'
"
"    AND pehd_status = 'A';
"
"
"
"    cr3            c3%ROWTYPE;
"
"
"
"CURSOR c4
"
"    IS
"
"SELECT *
"
"  FROM hrm_emp_alu_inc_ln
"
" WHERE heail_bu = p_bu
"
"   AND heail_doc_no = p_doc_no;
"
"
"
"
"
"    v_old_amount                NUMBER(15,3) := 0;
"
"    v_old_basic                    NUMBER(15,3) := 0;
"
"    v_old_gross                      NUMBER(15,3) := 0;
"
"    v_sub_seq_no            NUMBER(5);
"
"    v_seq_no                NUMBER(5);
"
"    v_res                VARCHAR2(1):= 'N';
"
"    v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"    v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"    v_cre_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"
"
" BEGIN
"
"
"
"    DELETE
"
"      FROM hrm_emp_alu_inc_ln
"
"     WHERE heail_bu     = p_bu
"
"       AND heail_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM hrm_emp_alu_inc_dtls
"
"     WHERE heaid_bu = p_bu
"
"       AND heaid_doc_no = p_doc_no;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"      SELECT NVL(MAX(heail_seq_no),0) +1
"
"    INTO v_seq_no
"
"        FROM hrm_emp_alu_inc_ln
"
"       WHERE heail_bu = p_bu
"
"     AND heail_doc_no = p_doc_no;
"
"
"
"      SELECT empai_basic_sal
"
"        INTO v_old_basic
"
"        FROM emp_active_infos
"
"       WHERE empai_bu  = p_bu
"
"         AND empai_emp_id  = cr1.hare_emp_id;
"
"
"
"      SELECT NVL(SUM(epa_per_amt),0)
"
"        INTO v_old_gross
"
"        FROM emp_pyrl_allowances
"
"       WHERE epa_bu    = p_bu
"
"         AND epa_emp_id = cr1.hare_emp_id
"
"         AND epa_elmnt_id <> 'CCA';
"
"
"
"      INSERT INTO hrm_emp_alu_inc_ln(heail_bu,
"
"                    heail_doc_no,
"
"                    heail_seq_no,
"
"                    heail_old_gross,
"
"                    heail_old_basic,
"
"                    heail_emp_id,
"
"                    heail_sal_eff_date,
"
"                    heail_new_gross,
"
"                    heail_new_basic,
"
"                    heail_cre_by,
"
"                    heail_cre_ip_addr,
"
"                    heail_cre_os_user,
"
"                    heail_cre_emp_id,
"
"                    heail_cre_date)
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    v_seq_no,
"
"                    v_old_gross + v_old_basic,
"
"                    v_old_basic,
"
"                    cr1.hare_emp_id,
"
"                    NULL,
"
"                    0,
"
"                    0,
"
"                    p_user,
"
"                    v_ip_addr,
"
"                    v_os_user,
"
"                    v_cre_emp_id,
"
"                    SYSDATE);
"
"
"
"   END LOOP c1;
"
"
"
"   FOR cr4 IN c4
"
"   LOOP
"
"
"
"      FOR cr2 IN c2(cr4.heail_emp_id)
"
"      LOOP
"
"
"
"         OPEN c3(cr2.hare_elmnt_id);
"
"     FETCH c3 INTO cr3;
"
"
"
"            IF c3%FOUND THEN
"
"
"
"               UPDATE hrm_emp_alu_inc_ln
"
"                  SET heail_sal_eff_date   = cr2.hare_sal_eff_date,
"
"                      heail_new_basic      = cr2.hare_amount
"
"                WHERE heail_bu       = p_bu
"
"                  AND heail_doc_no      = p_doc_no
"
"                  AND heail_seq_no     = cr4.heail_seq_no;
"
"
"
"            ELSE
"
"           SELECT NVL(MAX(heaid_sub_seq_no),0) +1
"
"             INTO v_sub_seq_no
"
"             FROM hrm_emp_alu_inc_dtls
"
"            WHERE heaid_bu = p_bu
"
"              AND heaid_doc_no = p_doc_no
"
"              AND heaid_seq_no = cr4.heail_seq_no;
"
"
"
"           SELECT NVL(SUM(epa_per_amt),0) epa_per_amt
"
"                 INTO v_old_amount
"
"         FROM emp_pyrl_allowances
"
"            WHERE epa_bu = p_bu
"
"          AND epa_emp_id = cr2.hare_emp_id
"
"          AND epa_elmnt_id = cr2.hare_elmnt_id;
"
"
"
"           INSERT INTO hrm_emp_alu_inc_dtls(heaid_bu,
"
"                         heaid_doc_no,
"
"                         heaid_seq_no,
"
"                         heaid_sub_seq_no,
"
"                         heaid_elmnt_id,
"
"                         heaid_old_allow,
"
"                         heaid_new_allow,
"
"                         heaid_cre_by,
"
"                         heaid_cre_ip_addr,
"
"                         heaid_cre_os_user,
"
"                         heaid_cre_emp_id,
"
"                         heaid_cre_date)
"
"                      VALUES(p_bu,
"
"                         p_doc_no,
"
"                         cr4.heail_seq_no,
"
"                         v_sub_seq_no,
"
"                         cr2.hare_elmnt_id,
"
"                         v_old_amount,
"
"                         cr2.hare_amount,
"
"                         p_user,
"
"                         v_ip_addr,
"
"                         v_os_user,
"
"                         v_cre_emp_id,
"
"                         SYSDATE);
"
"        END IF;
"
"
"
"         CLOSE c3;
"
"
"
"        v_res := 'Y';
"
"
"
"      END LOOP c2;
"
"
"
"   END LOOP c4;
"
"
"
"   p_res := v_res;
"
"
"
"  END proc_ins_range_elmnts;
"
"
"
"  PROCEDURE proc_emp_incre_mig_excep(p_bu                    VARCHAR2,
"
"                         p_doc_no                VARCHAR2,
"
"                         p_date_to                DATE,
"
"                         p_date_from                DATE,
"
"                         p_user                VARCHAR2,
"
"                         p_res        OUT        VARCHAR2)
"
"     IS
"
"     CURSOR c1
"
"         IS
"
"     SELECT *
"
"       FROM hrm_emp_alu_inc_hd
"
"      WHERE heaih_bu     = p_bu
"
"        AND heaih_doc_no = p_doc_no
"
"        AND heaih_status IN ('N');
"
"
"
"        cr1                c1%ROWTYPE;
"
"
"
"     CURSOR c2
"
"         IS
"
"     SELECT *
"
"       FROM hrm_emp_alu_inc_ln
"
"      WHERE heail_bu = p_bu
"
"        AND heail_doc_no = p_doc_no;
"
"
"
"     CURSOR c3(c_emp_id            VARCHAR2,
"
"              c_cat_id            VARCHAR2)
"
"         IS
"
"     SELECT *
"
"       FROM employees,
"
"            emp_active_infos
"
"      WHERE emp_bu     = empai_bu
"
"        AND emp_emp_id = empai_emp_id
"
"        AND emp_bu     = p_bu
"
"        AND emp_emp_id = c_emp_id
"
"        AND emp_cat_id = c_cat_id
"
"        AND emp_status = 'A';
"
"
"
"        cr3                c3%ROWTYPE;
"
"
"
"     CURSOR c4(c_emp_id            VARCHAR2,
"
"               c_year            NUMBER,
"
"               c_period            NUMBER)
"
"         IS
"
"     SELECT *
"
"       FROM emp_profiles_hd
"
"      WHERE ephd_bu     = p_bu
"
"        AND ephd_emp_id = c_emp_id
"
"        AND ephd_year   = c_year
"
"        AND ephd_period = c_period
"
"        AND ephd_status NOT IN ('C');
"
"
"
"        cr4                c4%ROWTYPE;
"
"
"
"     CURSOR c5(c_emp_id            VARCHAR2)
"
"         IS
"
"     SELECT heail_emp_id,
"
"            COUNT(*)
"
"       FROM hrm_emp_alu_inc_ln
"
"      WHERE heail_bu = p_bu
"
"        AND heail_doc_no = p_doc_no
"
"        AND heail_emp_id = c_emp_id
"
"     GROUP BY heail_emp_id
"
"     HAVING COUNT(*) > 1;
"
"
"
"        cr5            c5%ROWTYPE;
"
"
"
"     CURSOR c6(c_emp_id                VARCHAR2)
"
"         IS
"
"     SELECT phhd_proc_year
"
"       FROM (SELECT MAX(phhd_year||TO_CHAR(phhd_period, '00')) phhd_proc_year
"
"               FROM payroll_hist_hd
"
"              WHERE phhd_bu     = p_bu
"
"                AND phhd_emp_id = c_emp_id
"
"                AND phhd_pyrl_type = 'N')
"
"      WHERE phhd_proc_year IS NOT NULL;
"
"
"
"      cr6                        c6%ROWTYPE;
"
"
"
"     CURSOR c7(c_emp_id                VARCHAR2)
"
"         IS
"
"     SELECT ephd_last_prof_date
"
"       FROM (SELECT MAX(ephd_eff_date) ephd_last_prof_date
"
"               FROM emp_profiles_hd
"
"              WHERE ephd_bu     = p_bu
"
"                AND ephd_emp_id = c_emp_id
"
"                AND ephd_status = 'A')
"
"      WHERE ephd_last_prof_date IS NOT NULL;
"
"
"
"        cr7                c7%ROWTYPE;
"
"
"
"     CURSOR c8(c_emp_id            VARCHAR2)
"
"         IS
"
"     SELECT *
"
"       FROM employees,
"
"            emp_active_infos
"
"      WHERE emp_bu     = empai_bu
"
"        AND emp_emp_id = empai_emp_id
"
"        AND emp_bu     = p_bu
"
"        AND emp_emp_id = c_emp_id
"
"        AND emp_status = 'A';
"
"
"
"        cr8                c8%ROWTYPE;
"
"
"
"     CURSOR c9(c_year        NUMBER,
"
"               c_period            NUMBER,
"
"               c_clndr_id    VARCHAR2)
"
"         IS
"
"     SELECT *
"
"       FROM payroll_cal_year,
"
"            payroll_cal_period
"
"      WHERE pcy_bu       = pcp_bu
"
"        AND pcy_year     = pcp_year
"
"        AND pcy_clndr_id = pcp_clndr_id
"
"        AND pcp_bu       = p_bu
"
"        AND pcp_year     = c_year
"
"        AND pcp_period   = c_period
"
"        AND pcp_clndr_id = c_clndr_id
"
"        AND pcy_status IN ('O', 'U');
"
"
"
"        cr9                c9%ROWTYPE;
"
"
"
"     CURSOR c10(c_clndr_id    VARCHAR2,
"
"             c_date        DATE)
"
"         IS
"
"     SELECT *
"
"       FROM payroll_cal_year,
"
"               payroll_cal_period
"
"      WHERE pcy_bu       = pcp_bu
"
"        AND pcy_year     = pcp_year
"
"        AND pcy_clndr_id = pcp_clndr_id
"
"        AND pcp_bu       = p_bu
"
"        AND pcy_clndr_id = c_clndr_id
"
"        AND TRUNC(c_date) BETWEEN TRUNC(pcp_start_date) AND TRUNC(pcp_end_date)
"
"        AND pcy_status IN ('O', 'U');
"
"
"
"        cr10                    c10%ROWTYPE;
"
"
"
"     CURSOR c11(c_emp_id        VARCHAR2,
"
"                c_elmnt_id        VARCHAR2)
"
"         IS
"
"     SELECT *
"
"       FROM grades_hd,
"
"            grades_ln,
"
"            grade_benefit_dtls,
"
"            grades,
"
"            employees,
"
"            payroll_elements_hd
"
"      WHERE grdhd_bu       = grdln_bu
"
"        AND grdhd_doc_no   = grdln_doc_no
"
"        AND grdln_bu       = gbd_bu
"
"        AND grdln_doc_no   = gbd_doc_no
"
"        AND grdln_seq_no   = gbd_seq_no
"
"        AND grdln_bu       = grade_bu
"
"        AND grdln_grade_id = grade_grade_id
"
"        AND grdhd_bu       = emp_bu
"
"        AND grdhd_category = emp_cat_id
"
"        AND gbd_bu          = pehd_bu
"
"        AND gbd_elmnt_id   = pehd_elmnt_id
"
"        AND grdhd_status   = 'A'
"
"        AND emp_bu         = p_bu
"
"        AND emp_emp_id     = c_emp_id
"
"        AND (pehd_elmnt_id = c_elmnt_id OR c_elmnt_id IS NULL)
"
"        AND pehd_type IN ('FL','B')
"
"        AND TRUNC(SYSDATE) BETWEEN TRUNC(grdhd_eff_from) AND TRUNC(grdhd_eff_to);
"
"
"
"        cr11                c11%ROWTYPE;
"
"
"
"     CURSOR c12(c_seq_no    NUMBER)
"
"         IS
"
"     SELECT *
"
"       FROM hrm_emp_alu_inc_dtls
"
"      WHERE heaid_bu        = p_bu
"
"        AND heaid_doc_no     = p_doc_no
"
"        AND heaid_seq_no    = c_seq_no;
"
"
"
"     CURSOR c13(c_elmnt_id    VARCHAR2)
"
"         IS
"
"     SELECT *
"
"       FROM payroll_elements_hd
"
"      WHERE pehd_bu        = p_bu
"
"        AND pehd_elmnt_id    = c_elmnt_id
"
"        AND pehd_type         IN ('FL')
"
"        AND pehd_status     = 'A';
"
"
"
"        cr13                c13%ROWTYPE;
"
"
"
"        v_excep                VARCHAR2(4000);
"
"        v_line_excep            VARCHAR2(4000);
"
"        v_res                VARCHAR2(1) := 'N';
"
"        v_ip_addr            VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"        v_os_user            VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"        v_cre_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"        v_emp_last_proc_year        NUMBER(6);
"
"        v_emp_last_proc_period         NUMBER(2);
"
"        v_last_year            NUMBER(6);
"
"        v_last_period             NUMBER(2);
"
"        v_clndr_id            VARCHAR2(10);
"
"        v_start_date            DATE;
"
"    v_end_date            DATE;
"
"    v_max_prof_date            DATE;
"
"    v_prof_year            NUMBER(7);
"
"    v_prof_period            NUMBER(2);
"
"        v_ret_prof_date            DATE;
"
"
"
"     BEGIN
"
"
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"
"
"           IF c1%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'~'||p_doc_no);
"
"           ELSE
"
"
"
"              UPDATE hrm_emp_alu_inc_ln
"
"                 SET heail_ref             = NULL,
"
"                     heail_excep_flag    = 'N',
"
"                     heail_upd_by     = p_user,
"
"                     heail_upd_ip_addr     = v_ip_addr,
"
"                     heail_upd_os_user     = v_os_user,
"
"                     heail_upd_emp_id     = v_cre_emp_id,
"
"                     heail_upd_date   = SYSDATE
"
"               WHERE heail_bu = p_bu
"
"                 AND heail_doc_no = p_doc_no;
"
"
"
"             UPDATE hrm_emp_alu_inc_dtls
"
"        SET heaid_excep_flag      = 'N',
"
"            heaid_upd_by     = p_user,
"
"            heaid_upd_ip_addr     = v_ip_addr,
"
"            heaid_upd_os_user     = v_os_user,
"
"            heaid_upd_emp_id     = v_cre_emp_id,
"
"            heaid_upd_date       = SYSDATE
"
"          WHERE heaid_bu         = p_bu
"
"        AND heaid_doc_no     = p_doc_no;
"
"
"
"              v_res := 'N';
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"             v_excep                 := NULL;
"
"             v_emp_last_proc_year           := NULL;
"
"           v_emp_last_proc_period         := NULL;
"
"           v_last_year            := NULL;
"
"           v_last_period             := NULL;
"
"           v_clndr_id            := NULL;
"
"           v_start_date            := NULL;
"
"           v_end_date            := NULL;
"
"           v_max_prof_date            := NULL;
"
"           v_prof_year            := NULL;
"
"           v_prof_period            := NULL;
"
"               v_ret_prof_date            := NULL;
"
"
"
"             IF cr2.heail_emp_id IS NULL THEN
"
"                v_excep := v_excep||' EMPLOYEE SHOULD NOT BE NULL.';
"
"             END IF;
"
"
"
"             IF cr2.heail_emp_id IS NOT NULL THEN
"
"
"
"          OPEN c8(cr2.heail_emp_id);
"
"          FETCH c8 INTO cr8;
"
"
"
"            IF c8%NOTFOUND THEN
"
"               v_excep := v_excep||' EMPLOYEE NOT FOUND.';
"
"            END IF;
"
"
"
"          CLOSE c8;
"
"
"
"                OPEN c3(cr2.heail_emp_id,cr1.heaih_cat_id);
"
"                FETCH c3 INTO cr3;
"
"
"
"                   IF c3%NOTFOUND THEN
"
"                      v_excep := v_excep||' EMPLOYEE CATEGORY NOT FOUND.';
"
"                   ELSE
"
"
"
"                  IF cr3.emp_start_date BETWEEN p_date_from AND p_date_to THEN
"
"                     v_excep := v_excep||' NEW JOIN EMPLOYEE.';
"
"                  END IF;
"
"
"
"                  IF cr3.emp_include_payroll = 'N' THEN
"
"                 v_excep := v_excep ||' EMPLOYEE NOT INCLUDE IN PAYROLL.';
"
"                        END IF;
"
"
"
"                        IF cr3.emp_last_proc_year IS NULL OR cr3.emp_last_proc_period IS NULL THEN
"
"                     v_excep := v_excep ||' LAST PROC. PAYROLL YEAR/PERIOD SHOULD NOT BE NULL.';
"
"                  ELSE
"
"                     v_emp_last_proc_year   := cr3.emp_last_proc_year;
"
"                           v_emp_last_proc_period := cr3.emp_last_proc_period;
"
"                        END IF;
"
"
"
"                        v_clndr_id := cr3.emp_clndr_id;
"
"
"
"                   END IF;
"
"
"
"                CLOSE c3;
"
"
"
"             END IF;
"
"
"
"
"
"             OPEN c5(cr2.heail_emp_id);
"
"           FETCH c5 INTO cr5;
"
"
"
"          IF c5%FOUND THEN
"
"             v_excep := v_excep||' DUPLICATE EMPLOYEES FOUND. ';
"
"          END IF;
"
"
"
"               CLOSE c5;
"
"
"
"               OPEN c6(cr2.heail_emp_id);
"
"           FETCH c6 INTO cr6;
"
"
"
"         IF c6%NOTFOUND THEN
"
"            v_excep := v_excep||' LAST PROCESSES YEAR/PERIOD NOT FOUND. ';
"
"         ELSE
"
"
"
"            IF cr6.phhd_proc_year <> (v_emp_last_proc_year||TO_CHAR(v_emp_last_proc_period, '00')) THEN
"
"               v_excep := v_excep ||' LAST PROC. PAYROLL YEAR/PERIOD DOES NOT MATCH WITH EMP. LAST PROC. YEAR/PERIOD : '||cr6.phhd_proc_year||' - '||v_emp_last_proc_year||TO_CHAR(v_emp_last_proc_period, '00')||'. ';
"
"            END IF;
"
"
"
"            IF v_emp_last_proc_period = 12 THEN
"
"               v_last_period := 1;
"
"               v_last_year   := v_emp_last_proc_year + 101;
"
"            ELSE
"
"               v_last_period := v_emp_last_proc_period + 1;
"
"               v_last_year   := v_emp_last_proc_year;
"
"            END IF;
"
"
"
"                    OPEN c9(v_last_year, v_last_period, v_clndr_id);
"
"            FETCH c9 INTO cr9;
"
"
"
"               IF c9%NOTFOUND THEN
"
"                v_excep := v_excep ||' CALENDAR NOT FOUND. ';
"
"               ELSE
"
"              v_start_date := TRUNC(cr9.pcp_start_date);
"
"              v_end_date   := TRUNC(cr9.pcp_end_date);
"
"               END IF;
"
"
"
"                CLOSE c9;
"
"
"
"                OPEN c7(cr2.heail_emp_id);
"
"                FETCH c7 INTO cr7;
"
"
"
"              IF c7%NOTFOUND THEN
"
"                 v_excep := v_excep ||' EMPLOYEE PROFILE DETAILS NOT FOUND. ';
"
"              ELSE
"
"                 v_max_prof_date := TRUNC(cr7.ephd_last_prof_date);
"
"              END IF;
"
"
"
"                    CLOSE c7;
"
"
"
"                    OPEN c4(cr2.heail_emp_id,cr1.heaih_year,cr1.heaih_period);
"
"                FETCH c4 INTO cr4;
"
"
"
"              IF c4%FOUND THEN
"
"                 v_excep := v_excep||' PROFILE ALREADY EXISTS FOR THIS YEAR/PERIOD. PROFILE NO. : '||cr4.ephd_doc_no||'. ';
"
"              ELSE
"
"
"
"                 OPEN c10(v_clndr_id , v_max_prof_date);
"
"             FETCH c10 INTO cr10;
"
"
"
"                  IF c10%NOTFOUND THEN
"
"                 v_ret_prof_date := TRUNC(v_max_prof_date);
"
"                  ELSE
"
"                 v_ret_prof_date := TRUNC(cr10.pcp_end_date);
"
"                  END IF;
"
"
"
"                 CLOSE c10;
"
"
"
"                 IF TRUNC(cr1.heaih_eff_from) NOT BETWEEN v_start_date AND v_end_date THEN
"
"                v_excep := v_excep||' PROFILE EFF. DATE SHOULD BE IN THE NEXT PAYROLL DATE RANGE : '||TO_CHAR(v_start_date, 'DD.MM.RRRR')||' to '||TO_CHAR(v_end_date, 'DD.MM.RRRR')||'. ';
"
"                 END IF;
"
"
"
"                 IF TRUNC(cr2.heail_sal_eff_date) > TRUNC(cr1.heaih_eff_from) THEN
"
"                v_excep := v_excep||' SALARY EFF. DATE SHOULD BE LESS THAN OR EQUAL TO PROFILE EFF. DATE. ';
"
"                 END IF;
"
"
"
"                 IF TRUNC(cr2.heail_sal_eff_date) <= TRUNC(v_ret_prof_date) THEN
"
"                v_excep := v_excep||' SALARY EFF. DATE SHOULD BE GREATER THAN LAST PROF. DATE : '||TO_CHAR(v_ret_prof_date, 'DD.MM.RRRR')||'. ';
"
"                      END IF;
"
"
"
"              END IF;
"
"
"
"                CLOSE c4;
"
"
"
"         END IF;
"
"
"
"               CLOSE c6;
"
"
"
"            IF (cr2.heail_new_basic IS NOT NULL) OR (cr2.heail_new_basic > 0) THEN
"
"
"
"               IF cr2.heail_new_basic <= 0 THEN
"
"                  v_excep := v_excep||' BASIC AMOUNT SHOULD BE GREATER THAN 0. ';
"
"               ELSE
"
"
"
"             OPEN c11(cr2.heail_emp_id,NULL);
"
"             FETCH c11 INTO cr11;
"
"
"
"                IF c11%NOTFOUND THEN
"
"                  v_excep := v_excep||' SALARY DETAIL NOT FOUND.';
"
"                ELSE
"
"               IF cr2.heail_new_basic < cr11.grdln_min_salary AND cr2.heail_new_basic > cr11.grdln_max_salary THEN
"
"                  v_excep := v_excep||' AMOUNT SHOULD BETWEEN '||cr11.grdln_min_salary||' TO '||cr11.grdln_max_salary||'.';
"
"               END IF;
"
"                END IF;
"
"
"
"             CLOSE c11;
"
"
"
"                  END IF;
"
"
"
"               END IF;
"
"
"
"               FOR cr12 IN c12(cr2.heail_seq_no)
"
"               LOOP
"
"
"
"                  v_line_excep   := NULL;
"
"
"
"                  IF cr12.heaid_elmnt_id IS NOT NULL THEN
"
"
"
"                     OPEN c13(cr12.heaid_elmnt_id);
"
"                     FETCH c13 INTO cr13;
"
"
"
"                        IF c13%NOTFOUND THEN
"
"                           v_line_excep := v_line_excep||' ELEMENT NOT FOUND. ';
"
"                        ELSE
"
"
"
"                 IF (cr12.heaid_new_allow IS NOT NULL) OR (cr12.heaid_new_allow > 0 ) THEN
"
"
"
"                OPEN c11(cr2.heail_emp_id,cr12.heaid_elmnt_id);
"
"                FETCH c11 INTO cr11;
"
"
"
"                   IF c11%NOTFOUND THEN
"
"                      v_line_excep := v_line_excep||' SALARY DETAIL NOT FOUND.';
"
"                   ELSE
"
"                      IF cr12.heaid_new_allow < cr11.gbd_min_amt AND cr12.heaid_new_allow > cr11.gbd_max_amt THEN
"
"                     v_line_excep := v_line_excep||' AMOUNT SHOULD BETWEEN '||cr11.gbd_min_amt||' TO '||cr11.gbd_max_amt||'.';
"
"                      END IF;
"
"                   END IF;
"
"
"
"                CLOSE c11;
"
"
"
"                 END IF;
"
"
"
"                        END IF;
"
"
"
"                     CLOSE c13;
"
"
"
"                  END IF;
"
"
"
"                  IF cr12.heaid_new_allow <= 0 THEN
"
"             v_line_excep := v_line_excep||' ELEMENT AMOUNT SHOULD BE GREATER THAN 0. ';
"
"          END IF;
"
"
"
"          IF v_line_excep IS NOT NULL THEN
"
"
"
"             UPDATE hrm_emp_alu_inc_dtls
"
"                SET heaid_excep_flag      = 'Y',
"
"                    heaid_upd_by     = p_user,
"
"                      heaid_upd_ip_addr     = v_ip_addr,
"
"                           heaid_upd_os_user     = v_os_user,
"
"                       heaid_upd_emp_id     = v_cre_emp_id,
"
"                            heaid_upd_date       = SYSDATE
"
"                      WHERE heaid_bu         = p_bu
"
"                        AND heaid_doc_no     = p_doc_no
"
"                        AND heaid_seq_no     = cr2.heail_seq_no
"
"                        AND heaid_sub_seq_no     = cr12.heaid_sub_seq_no;
"
"
"
"                    UPDATE hrm_emp_alu_inc_ln
"
"               SET heail_ref             = v_line_excep,
"
"                   heail_excep_flag      = 'Y',
"
"                   heail_upd_by            = p_user,
"
"                   heail_upd_ip_addr     = v_ip_addr,
"
"                   heail_upd_os_user     = v_os_user,
"
"                   heail_upd_emp_id     = v_cre_emp_id,
"
"                   heail_upd_date        = SYSDATE
"
"             WHERE heail_bu     = p_bu
"
"               AND heail_doc_no = p_doc_no
"
"                       AND heail_seq_no = cr2.heail_seq_no;
"
"
"
"                    v_res := 'Y';
"
"
"
"                  END IF;
"
"
"
"               END LOOP c12;
"
"
"
"               IF v_excep IS NOT NULL THEN
"
"
"
"                    UPDATE hrm_emp_alu_inc_ln
"
"                       SET heail_ref             = v_excep||v_line_excep,
"
"                           heail_excep_flag        = 'Y',
"
"                           heail_upd_by            = p_user,
"
"                     heail_upd_ip_addr     = v_ip_addr,
"
"                          heail_upd_os_user     = v_os_user,
"
"                      heail_upd_emp_id     = v_cre_emp_id,
"
"                           heail_upd_date   = SYSDATE
"
"                     WHERE heail_bu     = p_bu
"
"                       AND heail_doc_no = p_doc_no
"
"                       AND heail_seq_no = cr2.heail_seq_no;
"
"
"
"                v_res := 'Y';
"
"
"
"             END IF;
"
"
"
"              END LOOP c2;
"
"
"
"           END IF;
"
"
"
"        CLOSE c1;
"
"
"
"        p_res := v_res;
"
"
"
"   END proc_emp_incre_mig_excep;
"
"
"
"   PROCEDURE proc_post_emp_incre_mig(p_bu        VARCHAR2,
"
"                    p_doc_no        VARCHAR2,
"
"                    p_date_from        DATE,
"
"                    p_user        VARCHAR2,
"
"                    p_res    OUT    VARCHAR2)
"
"
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_alu_inc_hd,
"
"           hrm_emp_alu_inc_ln
"
"    WHERE heaih_bu     = heail_bu
"
"      AND heaih_doc_no    = heail_doc_no
"
"      AND heaih_bu    = p_bu
"
"      AND heaih_doc_no     = p_doc_no;
"
"
"
"   CURSOR c2(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu = empai_bu
"
"      AND empai_emp_id = emp_emp_id
"
"      AND empai_bu = p_bu
"
"      AND emp_emp_id = c_emp_id;
"
"
"
"   cr2            c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_profiles_hd
"
"    WHERE ephd_bu     = p_bu
"
"      AND ephd_doc_no = c_doc_no
"
"      AND ephd_status = 'A';
"
"
"
"   cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_elmnt_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_elements_hd
"
"    WHERE pehd_bu       = p_bu
"
"      AND pehd_elmnt_id = c_elmnt_id
"
"      AND pehd_type     IN ('FL')
"
"      AND pehd_status   IN ('A');
"
"
"
"
"
"   cr4                    c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_emp_id            VARCHAR2,
"
"            c_elmnt_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_pyrl_allowances
"
"    WHERE epa_bu       = p_bu
"
"      AND epa_emp_id   = c_emp_id
"
"      AND epa_elmnt_id = c_elmnt_id;
"
"
"
"
"
"      cr5                   c5%rowtype;
"
"
"
"  CURSOR c6(c_action_id    VARCHAR2)
"
"      IS
"
"  SELECT *
"
"    FROM profile_actions
"
"   WHERE pact_bu = p_bu
"
"     AND pact_action_id = c_action_id;
"
"
"
"     cr6          c6%ROWTYPE;
"
"
"
"  CURSOR c7(c_seq_no    VARCHAR2)
"
"      IS
"
"  SELECT *
"
"    FROM hrm_emp_alu_inc_dtls
"
"   WHERE heaid_bu    = p_bu
"
"     AND heaid_doc_no     = p_doc_no
"
"     AND heaid_seq_no   = c_seq_no;
"
"
"
"
"
"   v_batch_no                VARCHAR2(30);
"
"   v_profile_no                VARCHAR2(30);
"
"   v_profile_action            VARCHAR2(10);
"
"   v_profile_action_desc        VARCHAR2(100);
"
"
"
"   v_year                NUMBER(7);
"
"   v_period                NUMBER(5);
"
"
"
"   v_cur_emp_plnt            VARCHAR2(10);
"
"   v_cur_pos_id                VARCHAR2(10);
"
"   v_cur_pos_desc            VARCHAR2(100);
"
"   v_cur_dept_id                VARCHAR2(10);
"
"   v_cur_dept_desc            VARCHAR2(100);
"
"   v_cur_job_id                 VARCHAR2(10);
"
"   v_cur_job_title            VARCHAR2(100);
"
"   v_cur_loc_id                 VARCHAR2(10);
"
"   v_cur_loc_desc               VARCHAR2(100);
"
"   v_cur_basic_sal            NUMBER(15, 3) := 0;
"
"   v_cur_per_day_wage            NUMBER(15, 3) := 0;
"
"   v_cur_grade_id            VARCHAR2(10);
"
"   v_cur_allow_amt            NUMBER(15, 3) := 0;
"
"
"
"   v_next_incr_date            DATE;
"
"   v_emp_plnt                VARCHAR2(10);
"
"   v_res             VARCHAR2(1):= 'N';
"
"
"
"    v_ip_addr            VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"    v_os_user            VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"    v_cre_emp_id        VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"
"
"BEGIN
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"      OPEN c2(cr1.heail_emp_id);
"
"      FETCH c2 INTO cr2;
"
"
"
"         IF c2%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20820,'HRM'||' ~ Entity : '||p_bu||' ~ Employee : '||cr1.heail_emp_id);
"
"         END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      OPEN c6(cr1.heaih_pro_action);
"
"      FETCH c6 INTO cr6;
"
"
"
"         IF c6%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20010,'HRM '||p_bu||'~ Profile Action Not Found');
"
"         ELSE
"
"            v_profile_action_desc := cr6.pact_action_desc1;
"
"         END IF;
"
"
"
"      CLOSE c6;
"
"
"
"
"
"      v_batch_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'EPB',p_user);
"
"
"
"      INSERT INTO emp_prof_batch(epb_bu                  ,
"
"                             epb_pfx            ,
"
"                                 epb_batch_no            ,
"
"                                 epb_batch_date          ,
"
"                                 epb_action_id           ,
"
"                                 epb_action_type         ,
"
"                                 epb_ref                 ,
"
"                                 epb_status              ,
"
"                     epb_chk_flag            ,
"
"                     epb_cre_by              ,
"
"                                 epb_cre_ip_addr         ,
"
"                                 epb_cre_os_user         ,
"
"                                 epb_cre_emp_id          ,
"
"                                 epb_cre_date            )
"
"                           VALUES(p_bu                    ,        --epb_bu
"
"                                  'EPB'            ,      --epb_pfx
"
"                                  v_batch_no              ,        --epb_batch_no
"
"                                  TRUNC(SYSDATE)          ,        --epb_batch_date
"
"                                  v_profile_action        ,        --epb_action_id
"
"                                  'N'                     ,        --epb_action_type
"
"                                  v_profile_action_desc||' PROFILE BATCH',        --epb_ref
"
"                                  'N'                     ,        --epb_status
"
"                                  'N'                     ,        --epb_chk_flag
"
"                                   p_user                  ,        --epb_cre_by
"
"                                   v_ip_addr               ,        --epb_cre_ip_addr
"
"                                   v_os_user               ,        --epb_cre_os_user
"
"                                   v_cre_emp_id            ,        --epb_cre_emp_id
"
"                                   SYSDATE                 );       --epb_cre_date
"
"
"
"           OPEN c3(cr2.empai_last_prof_no);
"
"           FETCH c3 INTO cr3;
"
"
"
"              IF c3%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20069,'HRM'||' ~ Entity : '||p_bu||' ~ Profile No. : '||cr2.empai_last_prof_no);
"
"              ELSE
"
"                 v_cur_emp_plnt     := NVL(cr3.ephd_new_plnt,         cr3.ephd_cur_plnt);
"
"                 v_cur_pos_id       := NVL(cr3.ephd_new_pos_id,       cr3.ephd_cur_pos_id);
"
"                 v_cur_pos_desc     := NVL(cr3.ephd_new_pos_name,     cr3.ephd_cur_pos_name);
"
"                 v_cur_dept_id      := NVL(cr3.ephd_new_dept_id,      cr3.ephd_cur_dept_id);
"
"                 v_cur_dept_desc    := NVL(cr3.ephd_new_dept_name,    cr3.ephd_cur_dept_name);
"
"                 v_cur_job_id       := NVL(cr3.ephd_new_job_id,       cr3.ephd_cur_job_id);
"
"                 v_cur_job_title    := NVL(cr3.ephd_new_job_title,    cr3.ephd_cur_job_title);
"
"                 v_cur_loc_id       := NVL(cr3.ephd_new_loc_id,       cr3.ephd_cur_loc_id);
"
"                 v_cur_loc_desc     := NVL(cr3.ephd_new_loc_name,     cr3.ephd_cur_loc_name);
"
"                 v_cur_basic_sal    := NVL(cr3.ephd_new_basic_sal,    cr3.ephd_cur_basic_sal);
"
"                 v_cur_per_day_wage := NVL(cr3.ephd_new_per_day_wage, cr3.ephd_cur_per_day_wage);
"
"                 v_cur_grade_id     := NVL(cr3.ephd_new_grade_id,     cr3.ephd_cur_grade_id);
"
"              END IF;
"
"
"
"           CLOSE c3;
"
"
"
"            --v_profile_no := func_find_hrm_next_id (p_bu, 'EMP_PROFILE');
"
"
"
"           v_profile_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'EP',p_user);
"
"
"
"            v_emp_plnt := func_find_plnt_for_dept(p_bu, v_cur_dept_id, p_user);
"
"
"
"           INSERT INTO emp_profiles_hd(ephd_bu                     ,
"
"                   ephd_pfx            ,
"
"                    ephd_doc_no                 ,
"
"                    ephd_prof_batch_no          ,
"
"                    ephd_emp_id             ,
"
"                    ephd_emp_type             ,
"
"                    ephd_action_id              ,
"
"                    ephd_date                ,
"
"                    ephd_eff_date               ,
"
"                    ephd_year                ,
"
"                    ephd_period             ,
"
"                    ephd_cur_plnt         ,
"
"                    ephd_cur_dept_id     ,
"
"                    ephd_cur_dept_name     ,
"
"                    ephd_cur_job_id         ,
"
"                    ephd_cur_job_title     ,
"
"                    ephd_cur_pos_id         ,
"
"                    ephd_cur_pos_name     ,
"
"                    ephd_cur_loc_id         ,
"
"                    ephd_cur_loc_name     ,
"
"                    ephd_cur_grade_id     ,
"
"                    ephd_cur_basic_sal     ,
"
"                    ephd_cur_per_day_wage     ,
"
"                    ephd_new_plnt         ,
"
"                    ephd_new_pos_id          ,
"
"                    ephd_new_pos_name     ,
"
"                    ephd_new_dept_id         ,
"
"                    ephd_new_dept_name     ,
"
"                    ephd_new_job_id          ,
"
"                    ephd_new_job_title     ,
"
"                    ephd_new_loc_id          ,
"
"                    ephd_new_loc_name        ,
"
"                    ephd_new_grade_id        ,
"
"                    ephd_new_basic_sal     ,
"
"                    ephd_new_per_day_wage     ,
"
"                    ephd_new_basic_eff_from     ,
"
"                    ephd_next_increment_due     ,
"
"                    ephd_appraisal_method    ,
"
"                    ephd_status                 ,
"
"                    ephd_ref                    ,
"
"                    ephd_cre_by             ,
"
"                    ephd_cre_ip_addr    ,
"
"                    ephd_cre_os_user    ,
"
"                    ephd_cre_emp_id        ,
"
"                    ephd_cre_date               )
"
"                              VALUES(p_bu                 ,                        --ephd_bu
"
"                                     'EP',                    --ephd_pfx
"
"                                     v_profile_no             ,                        --ephd_doc_no
"
"                    v_batch_no          ,                        --ephd_prof_batch_no
"
"                    cr1.heail_emp_id         ,                        --ephd_emp_id
"
"                    'F'             ,                        --ephd_emp_type
"
"                    cr1.heaih_pro_action            ,                        --ephd_action_id
"
"                    TRUNC(SYSDATE)              ,                        --ephd_date
"
"                    cr1.heaih_eff_from         ,                        --ephd_eff_date
"
"                    cr1.heaih_year                     ,                        --ephd_year
"
"                    cr1.heaih_period                   ,                        --ephd_period
"
"                    v_cur_emp_plnt         ,                        --ephd_cur_plnt
"
"                    v_cur_dept_id         ,                        --ephd_cur_dept_id
"
"                    v_cur_dept_desc         ,                        --ephd_cur_dept_name
"
"                    v_cur_job_id         ,                        --ephd_cur_job_id
"
"                    v_cur_job_title         ,                        --ephd_cur_job_title
"
"                    v_cur_pos_id         ,                        --ephd_cur_pos_id
"
"                    v_cur_pos_desc         ,                        --ephd_cur_pos_name
"
"                    v_cur_loc_id         ,                        --ephd_cur_loc_id
"
"                    v_cur_loc_desc         ,                        --ephd_cur_loc_name
"
"                    v_cur_grade_id         ,                        --ephd_cur_grade_id
"
"                    v_cur_basic_sal         ,                        --ephd_cur_basic_sal
"
"                    v_cur_per_day_wage     ,                        --ephd_cur_per_day_wage
"
"                    v_emp_plnt         ,                        --ephd_new_plnt
"
"                    v_cur_pos_id            ,                           --ephd_new_pos_id
"
"                    v_cur_pos_desc          ,                        --ephd_new_pos_name
"
"                    v_cur_dept_id             ,                           --ephd_new_dept_id
"
"                    v_cur_dept_desc         ,                        --ephd_new_dept_name
"
"                    v_cur_job_id          ,                           --ephd_new_job_id
"
"                    v_cur_job_title         ,                        --ephd_new_job_title
"
"                    v_cur_loc_id              ,                           --ephd_new_loc_id
"
"                    v_cur_loc_desc        ,                           --ephd_new_loc_name
"
"                    v_cur_grade_id        ,                           --ephd_new_grade_id
"
"                    cr1.heail_new_basic         ,                        --ephd_new_basic_sal
"
"                    0             ,                        --ephd_new_per_day_wage
"
"                    cr1.heail_sal_eff_date        ,                        --ephd_new_basic_eff_from
"
"                    cr1.heaih_nxt_inc_date     ,                        --ephd_next_increment_due
"
"                    'MBO'             ,                         --ephd_appraisal_method
"
"                    'E'                    ,                        --ephd_status
"
"                    v_profile_action_desc||' PROFILE.',                    --ephd_ref
"
"                    p_user              ,                        --ephd_cre_by
"
"                    v_ip_addr    ,                --ephd_cre_ip_addr
"
"                    v_os_user        ,            --ephd_cre_os_user
"
"                    v_cre_emp_id        ,            --ephd_cre_emp_id
"
"                    SYSDATE                  );                        --ephd_cre_date
"
"
"
"       FOR cr7 IN c7(cr1.heail_seq_no)
"
"       LOOP
"
"
"
"           OPEN c4(cr7.heaid_elmnt_id);
"
"           FETCH c4 INTO cr4;
"
"
"
"              IF c4%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20844, 'HRM'||cr7.heaid_elmnt_id);
"
"              ELSE
"
"
"
"                 OPEN c5(cr1.heail_emp_id, cr4.pehd_elmnt_id);
"
"                 FETCH c5 INTO cr5;
"
"
"
"                    IF c5%NOTFOUND THEN
"
"                       v_cur_allow_amt := NULL;
"
"                    ELSE
"
"                       v_cur_allow_amt := NVL(cr5.epa_per_amt, 0);
"
"                    END IF;
"
"
"
"                 CLOSE c5;
"
"
"
"                 INSERT INTO emp_profiles_ln(epln_bu           ,
"
"                         epln_doc_no              ,
"
"                         epln_plnt              ,
"
"                         epln_elmnt_id           ,
"
"                         epln_allow_eff_from       ,
"
"                         epln_cur_amt           ,
"
"                         epln_new_amt           ,
"
"                         epln_end_allowance        ,
"
"                         epln_reference           ,
"
"                         epln_cre_by              ,
"
"                         epln_cre_ip_addr        ,
"
"                         epln_cre_os_user        ,
"
"                         epln_cre_emp_id        ,
"
"                         epln_cre_date           )
"
"                      VALUES(p_bu              ,        --epln_bu
"
"                         v_profile_no           ,        --epln_doc_no
"
"                         v_emp_plnt           ,        --epln_plnt
"
"                         cr4.pehd_elmnt_id       ,        --epln_elmnt_id
"
"                         cr1.heail_sal_eff_date         ,         --epln_allow_eff_from
"
"                         v_cur_allow_amt       ,        --epln_cur_amt
"
"                         cr7.heaid_new_allow           ,        --epln_new_amt
"
"                         'N'               ,        --epln_end_allowance
"
"                         cr4.pehd_desc1           ,        --epln_reference
"
"                         p_user               ,        --epln_cre_by
"
"                         v_ip_addr        ,     --epln_cre_ip_addr
"
"                         v_os_user        ,    --epln_cre_os_user
"
"                         v_cre_emp_id    ,    --epln_cre_emp_id
"
"                         SYSDATE           );        --epln_cre_date
"
"
"
"              END IF;
"
"
"
"           CLOSE c4;
"
"
"
"       END LOOP c7;
"
"
"
"       UPDATE emp_profiles_hd
"
"          SET ephd_status   = 'N',
"
"             ephd_upd_by   = p_user,
"
"             ephd_upd_ip_addr = v_ip_addr,
"
"             ephd_upd_os_user = v_os_user,
"
"             ephd_upd_emp_id  = v_cre_emp_id,
"
"          ephd_upd_date = SYSDATE
"
"        WHERE ephd_bu     = p_bu
"
"          AND ephd_doc_no = v_profile_no
"
"          AND ephd_status = 'E';
"
"
"
"       UPDATE emp_profiles_hd
"
"          SET ephd_status   = 'A',
"
"              ephd_upd_by   = p_user,
"
"             ephd_upd_ip_addr = v_ip_addr,
"
"             ephd_upd_os_user = v_os_user,
"
"             ephd_upd_emp_id  = v_cre_emp_id,
"
"              ephd_upd_date = SYSDATE
"
"        WHERE ephd_bu     = p_bu
"
"          AND ephd_doc_no = v_profile_no
"
"          AND ephd_status = 'N';
"
"
"
"      v_res := 'Y';
"
"
"
"   END LOOP c1;
"
"
"
"   p_res := v_res;
"
"
"
"  END proc_post_emp_incre_mig;
"
"
"
"END pack_emp_increment_mig_range;"
/
