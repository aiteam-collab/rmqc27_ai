CREATE OR REPLACE
"PACKAGE BODY        pack_emp_inc_bulk_mig_grade
"
"AS
"
"
"
"   PROCEDURE proc_upload_emp_inc_ctc(p_bu                        VARCHAR2,
"
"                     p_doc_no                        VARCHAR2,
"
"                     p_dir_name                        VARCHAR2,
"
"                     p_file_name                    VARCHAR2,
"
"                     p_user                        VARCHAR2,
"
"                     p_res            OUT            VARCHAR2)
"
"   AS
"
"   CURSOR c1
"
"       IS
"
"   SELECT table_name
"
"     FROM user_tables
"
"    WHERE table_name = 'TEMP_HRM_EMP_INC_BULK_MIG_LN';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT COUNT(*) v_cnt
"
"     FROM hrm_emp_inc_bulk_mig_ln
"
"    WHERE heibml_bu     = p_bu
"
"      AND heibml_doc_no = p_doc_no;
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"      v_ip_addr                VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"      v_os_user             VARCHAR2(20) := Audit_Info.Get_Os_User;
"
"      v_emp_id                VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
"
"
"
"      v_exp_flag        VARCHAR2(1) := 'N';
"
"
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND THEN
"
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_HRM_EMP_INC_BULK_MIG_LN';
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      DELETE hrm_emp_inc_bulk_mig_ln
"
"       WHERE heibml_bu       = p_bu
"
"         AND heibml_doc_no = p_doc_no;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE temp_hrm_emp_inc_bulk_mig_ln(theibml_emp_id                VARCHAR2(500),
"
"                                   theibml_gross_sal            VARCHAR2(500))
"
"                                   ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                 DEFAULT DIRECTORY '||p_dir_name||'
"
"                                      ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                 SKIP 1
"
"                                 FIELDS TERMINATED BY ''|''
"
"                                 MISSING FIELD VALUES ARE NULL
"
"                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                 (theibml_emp_id            CHAR(255),
"
"                                  theibml_gross_sal         CHAR(255)))
"
"                                LOCATION ('||p_dir_name||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE 'INSERT INTO hrm_emp_inc_bulk_mig_ln(heibml_bu,
"
"                                     heibml_doc_no,
"
"                                           heibml_seq_no,
"
"                                     heibml_emp_id,
"
"                                     heibml_new_gross_sal,
"
"                                     heibml_old_basic_sal,
"
"                                     heibml_new_basic_sal,
"
"                                     heibml_excep_flag,
"
"                                     heibml_reference,
"
"                                     heibml_cre_by,
"
"                                     heibml_cre_emp_id,
"
"                                     heibml_cre_ip_addr,
"
"                                     heibml_cre_os_user,
"
"                                     heibml_cre_date)
"
"                                       (SELECT '|| CHR(39) || p_bu     || CHR(39) ||','               --heibml_bu
"
"                                     || CHR(39) || p_doc_no || CHR(39) ||',                --heibml_doc_no
"
"                                     ROWNUM           ,                                   --heibml_seq_no
"
"                                     theibml_emp_id       ,                               --heibml_emp_id
"
"                                     theibml_gross_sal      ,                   --heibml_new_gross_sal
"
"                                     0              ,                   --heibml_old_basic_sal
"
"                                     0              ,'                   --heibml_new_basic_sal
"
"                                     || CHR(39) || v_exp_flag || CHR(39) ||',              --heibml_excep_flag
"
"                                     NULL           ,'                                   --heibml_reference
"
"                                     || CHR(39) || p_user || CHR(39) ||','                 --heibml_cre_by
"
"                                     || CHR(39) || v_emp_id || CHR(39) ||','               --heibml_cre_emp_id
"
"                                     || CHR(39) || v_ip_addr|| CHR(39) ||','               --heibml_cre_ip_addr
"
"                                     || CHR(39) || v_os_user|| CHR(39) ||',                --heibml_cre_os_user
"
"                                     SYSDATE                           --heibml_cre_date
"
"                                FROM temp_hrm_emp_inc_bulk_mig_ln)';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE temp_hrm_emp_inc_bulk_mig_ln';
"
"
"
"      OPEN c2;
"
"      FETCH c2 INTO cr2;
"
"
"
"         IF cr2.v_cnt = 0 THEN
"
"            v_res := 'N';
"
"         ELSE
"
"            v_res := 'Y';
"
"         END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_upload_emp_inc_ctc;
"
"
"
"   PROCEDURE proc_chk_exp_emp_inc_ctc(p_bu                        VARCHAR2,
"
"                      p_doc_no                        VARCHAR2,
"
"                      p_user                        VARCHAR2,
"
"                      p_res            OUT            VARCHAR2)
"
"   AS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_inc_bulk_mig_hd
"
"    WHERE heibmh_bu = p_bu
"
"      AND heibmh_doc_no = p_doc_no;
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_inc_bulk_mig_ln
"
"    WHERE heibml_bu = p_bu
"
"      AND heibml_doc_no = p_doc_no;
"
"
"
"   CURSOR c3(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu = p_bu
"
"      AND emp_emp_id = c_emp_id
"
"      AND emp_bu = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status = 'A';
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c5(c_emp_id                VARCHAR2,
"
"             c_year                    NUMBER,
"
"             c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM emp_profiles_hd
"
"    WHERE ephd_bu     = p_bu
"
"      AND ephd_emp_id = c_emp_id
"
"      AND ephd_year   = c_year
"
"      AND ephd_period = c_period
"
"      AND ephd_status NOT IN ('C');
"
"
"
"      cr5                        c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT phhd_proc_year
"
"     FROM (SELECT MAX(phhd_year||TO_CHAR(phhd_period, '00')) phhd_proc_year
"
"             FROM payroll_hist_hd
"
"            WHERE phhd_bu     = p_bu
"
"              AND phhd_emp_id = c_emp_id
"
"              AND phhd_pyrl_type = 'N')
"
"    WHERE phhd_proc_year IS NOT NULL;
"
"
"
"      cr6                        c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_clndr_id                VARCHAR2,
"
"             c_year                    NUMBER,
"
"             c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_cal_year,
"
"          payroll_cal_period
"
"    WHERE pcy_bu     = pcp_bu
"
"      AND pcy_year   = pcp_year
"
"      AND pcp_bu     = p_bu
"
"      AND pcp_year   = c_year
"
"      AND pcp_period = c_period
"
"      AND pcy_status IN ('O', 'U');
"
"
"
"      cr7                        c7%ROWTYPE;
"
"
"
"   CURSOR c8(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT ephd_last_prof_date
"
"     FROM (SELECT MAX(ephd_eff_date) ephd_last_prof_date
"
"             FROM emp_profiles_hd
"
"            WHERE ephd_bu     = p_bu
"
"              AND ephd_emp_id = c_emp_id
"
"              AND ephd_status = 'A')
"
"    WHERE ephd_last_prof_date IS NOT NULL;
"
"
"
"      cr8                        c8%ROWTYPE;
"
"
"
"   CURSOR c9
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_inc_bulk_mig_ln
"
"    WHERE heibml_bu = p_bu
"
"      AND heibml_doc_no = p_doc_no
"
"      AND heibml_excep_flag = 'Y';
"
"
"
"      cr9                c9%ROWTYPE;
"
"
"
"   CURSOR c10(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT empai_grade,
"
"      emp_cat_id,
"
"      empai_basic_sal
"
"     FROM employees,
"
"           emp_active_infos
"
"    WHERE emp_bu = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu = p_bu
"
"      AND emp_emp_id = c_emp_id;
"
"
"
"   CURSOR c11(c_cat_id            VARCHAR2,
"
"             c_grade_id        VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM grades_hd,
"
"          grades_ln
"
"    WHERE grdhd_bu     = grdln_bu
"
"      AND grdhd_doc_no = grdln_doc_no
"
"      AND grdhd_bu = p_bu
"
"      AND grdhd_category = c_cat_id
"
"      AND grdln_grade_id = c_grade_id
"
"      AND grdhd_type   = 'C'
"
"      AND grdhd_status = 'A';
"
"
"
"      cr11                c11%ROWTYPE;
"
"
"
"   CURSOR c12(c_cat_id            VARCHAR2,
"
"             c_grade_id        VARCHAR2)
"
"       IS
"
"   SELECT gbd_elmnt_id,
"
"      gbd_ctc_pct,
"
"      grdln_basic_pct
"
"     FROM grades_hd,
"
"          grades_ln,
"
"          grade_benefit_dtls
"
"    WHERE grdhd_bu     = grdln_bu
"
"      AND grdhd_doc_no = grdln_doc_no
"
"      AND grdln_bu = gbd_bu(+)
"
"      AND grdln_doc_no = gbd_doc_no(+)
"
"      AND grdln_seq_no = gbd_seq_no(+)
"
"      AND grdhd_bu = p_bu
"
"      AND grdhd_category = c_cat_id
"
"      AND grdln_grade_id = c_grade_id
"
"      AND grdhd_type   = 'C'
"
"      AND grdhd_status = 'A';
"
"
"
"   CURSOR c13(c_emp_id            VARCHAR2,
"
"             c_elmnt_id        VARCHAR2)
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
"      cr13                c13%ROWTYPE;
"
"
"
"   CURSOR c14
"
"       IS
"
"   SELECT *
"
"     FROM emp_profile_control
"
"    WHERE epc_bu = p_bu;
"
"
"
"      cr14                c14%ROWTYPE;
"
"
"
"   CURSOR c15(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT heibml_emp_id,
"
"         COUNT(*)
"
"     FROM hrm_emp_inc_bulk_mig_ln
"
"    WHERE heibml_bu = p_bu
"
"      AND heibml_doc_no = p_doc_no
"
"      AND heibml_emp_id = c_emp_id
"
"    GROUP BY heibml_emp_id
"
"   HAVING COUNT(*) > 1;
"
"
"
"      cr15                c15%ROWTYPE;
"
"
"
"      v_ip_addr                    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"      v_os_user                 VARCHAR2(20) := Audit_Info.Get_Os_User;
"
"      v_emp_id                    VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
"
"
"
"      v_clndr_id            VARCHAR2(10);
"
"      v_excep                VARCHAR2(4000);
"
"
"
"      v_last_year            NUMBER(7);
"
"      v_last_period            NUMBER(3);
"
"
"
"      v_emp_last_proc_year        NUMBER(7);
"
"      v_emp_last_proc_period          NUMBER(3);
"
"
"
"      v_start_date            DATE;
"
"      v_end_date            DATE;
"
"      v_max_prof_date              DATE;
"
"
"
"      v_old_basic_amt            NUMBER(15, 3) := 0;
"
"      v_new_basic_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_old_elmnt_amt            NUMBER(15, 3) := 0;
"
"      v_new_elmnt_amt              NUMBER(15, 3) := 0;
"
"
"
"      v_sub_seq_no            NUMBER(5) := 1;
"
"
"
"      v_res                VARCHAR2(1) := 'N';
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20999, 'HRM');
"
"         ELSE
"
"
"
"            v_excep := NULL;
"
"
"
"            UPDATE hrm_emp_inc_bulk_mig_ln
"
"               SET heibml_excep_flag = 'N',
"
"                   heibml_reference  = NULL,
"
"                   heibml_upd_by     = p_user,
"
"                   heibml_upd_ip_addr = v_ip_addr,
"
"                   heibml_upd_os_user = v_os_user,
"
"                   heibml_upd_emp_id  = v_emp_id,
"
"                   heibml_upd_date    = SYSDATE
"
"             WHERE heibml_bu = p_bu
"
"               AND heibml_doc_no = p_doc_no;
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"               v_excep := NULL;
"
"
"
"               OPEN c3(cr2.heibml_emp_id);
"
"               FETCH c3 INTO cr3;
"
"
"
"                  IF c3%NOTFOUND THEN
"
"                     v_excep := v_excep||' EMPLOYEE NOT FOUND. ';
"
"                  ELSE
"
"                     v_emp_last_proc_year   := cr3.emp_last_proc_year;
"
"                     v_emp_last_proc_period := cr3.emp_last_proc_period;
"
"                  END IF;
"
"
"
"               CLOSE c3;
"
"
"
"               OPEN c15(cr2.heibml_emp_id);
"
"               FETCH c15 INTO cr15;
"
"
"
"                  IF c15%FOUND THEN
"
"                     v_excep := v_excep||' DUPLICATE EMPLOYEES FOUND. ';
"
"                  END IF;
"
"
"
"               CLOSE c15;
"
"
"
"               OPEN c5(cr2.heibml_emp_id, cr1.heibmh_year, cr1.heibmh_period);
"
"               FETCH c5 INTO cr5;
"
"
"
"                  IF c5%FOUND THEN
"
"                     v_excep := v_excep||' PROFILE ALREADY EXISTS FOR THIS YEAR PERIOD. ';
"
"                  END IF;
"
"
"
"               CLOSE c5;
"
"
"
"               OPEN c6(cr2.heibml_emp_id);
"
"               FETCH c6 INTO cr6;
"
"
"
"                  IF c6%NOTFOUND THEN
"
"                     v_excep := v_excep||' LAST PROCESSES YEAR/PERIOD NOT FOUND. ';
"
"                  ELSE
"
"
"
"                     IF cr6.phhd_proc_year <> (v_emp_last_proc_year||TO_CHAR(v_emp_last_proc_period, '00')) THEN
"
"                        v_excep := v_excep ||' LAST PROC. PAYROLL YEAR/PERIOD DOES NOT MATCH WITH EMP. LAST PROC. YEAR/PERIOD.';
"
"                     END IF;
"
"
"
"                     IF v_emp_last_proc_period = 12 THEN
"
"                        v_last_period := 1;
"
"                        v_last_year   := v_emp_last_proc_year + 101;
"
"                     ELSE
"
"                        v_last_period := v_emp_last_proc_period + 1;
"
"                        v_last_year   := v_emp_last_proc_year;
"
"                     END IF;
"
"
"
"                     OPEN c7(v_clndr_id, v_last_year, v_last_period);
"
"                     FETCH c7 INTO cr7;
"
"
"
"                        IF c7%NOTFOUND THEN
"
"                           v_excep := v_excep||' PAYROLL CALENDAR NOT FOUND. Year :'||v_last_year||' Period: '||v_last_period||'. ';
"
"                        ELSE
"
"                           v_start_date := TRUNC(cr7.pcp_start_date);
"
"                           v_end_date   := TRUNC(cr7.pcp_end_date);
"
"                        END IF;
"
"
"
"                     CLOSE c7;
"
"
"
"                  END IF;
"
"
"
"               CLOSE c6;
"
"
"
"               OPEN c8(cr2.heibml_emp_id);
"
"               FETCH c8 INTO cr8;
"
"
"
"                  IF c8%NOTFOUND THEN
"
"                     v_excep := v_excep ||' EMPLOYEE PROFILE DETAILS NOT FOUND.';
"
"                  ELSE
"
"                     v_max_prof_date := TRUNC(cr8.ephd_last_prof_date);
"
"                  END IF;
"
"
"
"               CLOSE c8;
"
"
"
"               IF v_excep IS NOT NULL THEN
"
"
"
"          UPDATE hrm_emp_inc_bulk_mig_ln
"
"             SET heibml_excep_flag = 'Y',
"
"             heibml_reference  = v_excep,
"
"             heibml_upd_by     = p_user,
"
"             heibml_upd_ip_addr = v_ip_addr,
"
"             heibml_upd_os_user = v_os_user,
"
"             heibml_upd_emp_id  = v_emp_id,
"
"             heibml_upd_date    = SYSDATE
"
"           WHERE heibml_bu = p_bu
"
"             AND heibml_doc_no = p_doc_no
"
"             AND heibml_seq_no = cr2.heibml_seq_no;
"
"
"
"               END IF;
"
"
"
"            END LOOP c2;
"
"
"
"            OPEN c9;
"
"            FETCH c9 INTO cr9;
"
"
"
"               IF c9%FOUND THEN
"
"                  v_res := 'Y';
"
"               ELSE
"
"
"
"                  OPEN c14;
"
"                  FETCH c14 INTO cr14;
"
"
"
"                     IF c14%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20007,'HRM'||'~'||p_bu);
"
"                     END IF;
"
"
"
"                  CLOSE c14;
"
"
"
"                  DELETE hrm_emp_inc_bulk_mig_dtl
"
"                   WHERE heibmd_bu = p_bu
"
"                     AND heibmd_doc_no = p_doc_no;
"
"
"
"                  IF cr14.epc_sal_sou = 'B' THEN
"
"
"
"                  FOR cr2 IN c2
"
"                  LOOP
"
"
"
"                     FOR cr10 IN c10(cr2.heibml_emp_id)
"
"                     LOOP
"
"
"
"                        OPEN c11(cr10.emp_cat_id, cr10.empai_grade);
"
"                        FETCH c11 INTO cr11;
"
"
"
"                           IF c11%NOTFOUND THEN
"
"                              RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||cr10.emp_cat_id||'~'||cr10.empai_grade);
"
"                           ELSE
"
"
"
"                              IF cr2.heibml_new_gross_sal > 0 THEN
"
"                                 v_new_basic_amt := ROUND((cr2.heibml_new_gross_sal * cr11.grdln_basic_pct)/100, 2);
"
"                              ELSE
"
"                                 v_new_basic_amt := 0;
"
"                              END IF;
"
"
"
"                              UPDATE hrm_emp_inc_bulk_mig_ln
"
"                                 SET heibml_old_basic_sal = cr10.empai_basic_sal,
"
"                     heibml_new_basic_sal = v_new_basic_amt,
"
"                     heibml_upd_by     = p_user,
"
"                     heibml_upd_ip_addr = v_ip_addr,
"
"                     heibml_upd_os_user = v_os_user,
"
"                     heibml_upd_emp_id  = v_emp_id,
"
"                     heibml_upd_date    = SYSDATE
"
"                   WHERE heibml_bu = p_bu
"
"                     AND heibml_doc_no = p_doc_no
"
"                     AND heibml_seq_no = cr2.heibml_seq_no;
"
"
"
"                           END IF;
"
"
"
"                        CLOSE c11;
"
"
"
"                        v_sub_seq_no := 1;
"
"
"
"                        FOR cr12 IN c12(cr10.emp_cat_id, cr10.empai_grade)
"
"                        LOOP
"
"
"
"                           OPEN c13(cr2.heibml_emp_id ,cr12.gbd_elmnt_id);
"
"                           FETCH c13 INTO cr13;
"
"
"
"                              IF c13%NOTFOUND THEN
"
"                                 v_old_elmnt_amt := 0;
"
"                              ELSE
"
"                                 v_old_elmnt_amt := cr13.epa_per_amt;
"
"                              END IF;
"
"
"
"                           CLOSE c13;
"
"
"
"                           v_new_elmnt_amt := ROUND((cr2.heibml_new_gross_sal * cr12.gbd_ctc_pct)/100, 2);
"
"
"
"                           INSERT INTO hrm_emp_inc_bulk_mig_dtl(heibmd_bu      ,
"
"                                    heibmd_doc_no     ,
"
"                                    heibmd_seq_no     ,
"
"                                    heibmd_sub_seq_no ,
"
"                                    heibmd_elmnt_id   ,
"
"                                    heibmd_old_amount ,
"
"                                    heibmd_new_amount ,
"
"                                    heibmd_cre_by     ,
"
"                                    heibmd_cre_emp_id ,
"
"                                    heibmd_cre_ip_addr,
"
"                                    heibmd_cre_os_user,
"
"                                    heibmd_cre_date   )
"
"                             VALUES(p_bu          ,                         --heibmd_bu
"
"                                    p_doc_no      ,                         --heibmd_doc_no
"
"                                    cr2.heibml_seq_no ,                         --heibmd_seq_no
"
"                                    v_sub_seq_no      ,                         --heibmd_sub_seq_no
"
"                                    cr12.gbd_elmnt_id ,                         --heibmd_elmnt_id
"
"                                    v_old_elmnt_amt   ,                         --heibmd_old_amount
"
"                                    v_new_elmnt_amt   ,                         --heibmd_new_amount
"
"                                    p_user               ,                         --heibmd_cre_by
"
"                                    v_emp_id      ,                         --heibmd_cre_emp_id
"
"                                    v_ip_addr      ,                         --heibmd_cre_ip_addr
"
"                                    v_os_user      ,                         --heibmd_cre_os_user
"
"                                    SYSDATE               );                         --heibmd_cre_date
"
"
"
"                           v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"                        END LOOP c12;
"
"
"
"                     END LOOP c10;
"
"
"
"                  END LOOP c2;
"
"
"
"                  END IF;        --CLOSE OF epc_sal_sou = 'B'
"
"
"
"                  IF cr14.epc_sal_sou IN ('M', 'C') THEN
"
"
"
"                     FOR cr2 IN c2
"
"                     LOOP
"
"
"
"                        proc_calc_bulk_inc_ctc(p_bu,
"
"                           p_doc_no,
"
"                           cr2.heibml_emp_id,
"
"                           cr14.epc_sal_sou,
"
"                           cr14.epc_ctc_calc_elmnt_id,
"
"                           cr2.heibml_new_gross_sal,
"
"                            cr2.heibml_seq_no,
"
"                           p_user,
"
"                           p_res);
"
"
"
"                     END LOOP c2;
"
"
"
"                  END IF;
"
"
"
"                  v_res := 'N';
"
"
"
"               END IF;
"
"
"
"            CLOSE c9;
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_chk_exp_emp_inc_ctc;
"
"
"
"   PROCEDURE proc_post_emp_inc_ctc(p_bu                            VARCHAR2,
"
"                   p_doc_no                        VARCHAR2,
"
"                   p_user                        VARCHAR2,
"
"                   p_res            OUT            VARCHAR2)
"
"   AS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_inc_bulk_mig_hd
"
"    WHERE heibmh_bu     = p_bu
"
"      AND heibmh_doc_no = p_doc_no;
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT pact_action_id,
"
"          pact_action_desc1
"
"     FROM profile_actions
"
"    WHERE pact_bu          = p_bu
"
"      AND pact_action_type = 'O';
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_inc_bulk_mig_ln
"
"    WHERE heibml_bu     = p_bu
"
"      AND heibml_doc_no = p_doc_no
"
"    ORDER BY heibml_seq_no;
"
"
"
"   CURSOR c4(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu     = p_bu
"
"      AND emp_emp_id = c_emp_id
"
"      AND emp_status = 'A';
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_doc_no            VARCHAR2)
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
"      cr5                c5%ROWTYPE;
"
"
"
"   CURSOR c6
"
"       IS
"
"   SELECT *
"
"     FROM emp_profile_control
"
"    WHERE epc_bu = p_bu;
"
"
"
"      cr6                c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_seq_no            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_inc_bulk_mig_dtl,
"
"          payroll_elements_hd
"
"    WHERE heibmd_bu       = pehd_bu
"
"      AND heibmd_elmnt_id = pehd_elmnt_id
"
"      AND heibmd_bu       = p_bu
"
"      AND heibmd_doc_no   = p_doc_no
"
"      AND heibmd_seq_no   = c_seq_no
"
"    ORDER BY heibmd_sub_seq_no;
"
"
"
"   CURSOR c8(c_emp_id            VARCHAR2,
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
"      cr8                c8%ROWTYPE;
"
"
"
"      v_batch_no            VARCHAR2(30);
"
"      v_profile_no            VARCHAR2(30);
"
"      v_profile_action            VARCHAR2(10);
"
"      v_profile_action_desc        VARCHAR2(100);
"
"
"
"      v_year                NUMBER(7);
"
"      v_period                NUMBER(5);
"
"
"
"      v_cur_emp_plnt            VARCHAR2(10);
"
"      v_cur_pos_id            VARCHAR2(10);
"
"      v_cur_pos_desc            VARCHAR2(100);
"
"      v_cur_dept_id                VARCHAR2(10);
"
"      v_cur_dept_desc            VARCHAR2(100);
"
"      v_cur_job_id                 VARCHAR2(10);
"
"      v_cur_job_title            VARCHAR2(100);
"
"      v_cur_loc_id                 VARCHAR2(10);
"
"      v_cur_loc_desc               VARCHAR2(100);
"
"      v_cur_basic_sal            NUMBER(15, 3) := 0;
"
"      v_cur_per_day_wage        NUMBER(15, 3) := 0;
"
"      v_cur_grade_id            VARCHAR2(10);
"
"      v_cur_allow_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_next_incr_date            DATE;
"
"      v_emp_plnt            VARCHAR2(10);
"
"
"
"      v_ip_addr                VARCHAR2(50) := Audit_Info.Get_Ip_Address;
"
"      v_os_user                VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"      v_user_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"           OPEN c2;
"
"           FETCH c2 INTO cr2;
"
"
"
"                 IF c2%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20550, 'CRM'||' ~ Entity : '||p_bu);
"
"                 ELSE
"
"                  v_profile_action      := cr2.pact_action_id;
"
"                  v_profile_action_desc := cr2.pact_action_desc1;
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            --v_batch_no := func_find_hrm_next_id (p_bu, 'EMP_PROF_BATCH_NO');
"
"
"
"            v_batch_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'EPB',p_user);
"
"
"
"            INSERT INTO emp_prof_batch(epb_bu              ,
"
"                       epb_pfx           ,
"
"                       epb_batch_no        ,
"
"                       epb_batch_date      ,
"
"                       epb_action_id       ,
"
"                       epb_action_type     ,
"
"                       epb_ref             ,
"
"                       epb_status          ,
"
"                       epb_chk_flag        ,
"
"                       epb_cre_by          ,
"
"                       epb_cre_emp_id   ,
"
"                       epb_cre_ip_addr  ,
"
"                       epb_cre_os_user  ,
"
"                       epb_cre_date        )
"
"                    VALUES(p_bu            ,                --epb_bu
"
"                       'EPB'               ,            --epb_pfx
"
"                       v_batch_no          ,                --epb_batch_no
"
"                       TRUNC(SYSDATE)      ,                --epb_batch_date
"
"                       v_profile_action    ,                --epb_action_id
"
"                       'N'            ,                --epb_action_type
"
"                       v_profile_action_desc||' PROFILE BATCH.',    --epb_ref
"
"                       'N'            ,                --epb_status
"
"                       'N'            ,                --epb_chk_flag
"
"                       p_user            ,                --epb_cre_by
"
"                       v_user_emp_id    ,                --epb_cre_emp_id
"
"                       v_ip_addr    ,                --epb_cre_ip_addr
"
"                       v_os_user    ,                --epb_cre_os_user
"
"                       SYSDATE             );                --epb_cre_date
"
"
"
"            proc_find_pyrl_cal_year_period(p_bu,
"
"                           TRUNC(cr1.heibmh_date_from),
"
"                           v_year,
"
"                           v_period);
"
"
"
"            FOR cr3 IN c3
"
"            LOOP
"
"
"
"               OPEN c4(cr3.heibml_emp_id);
"
"               FETCH c4 INTO cr4;
"
"
"
"                  IF c4%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20820,'HRM'||' ~ Entity : '||p_bu||' ~ Employee : '||cr3.heibml_emp_id);
"
"              END IF;
"
"
"
"               CLOSE c4;
"
"
"
"              OPEN c5(cr4.empai_last_prof_no);
"
"              FETCH c5 INTO cr5;
"
"
"
"                 IF c5%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20069,'HRM'||' ~ Entity : '||p_bu||' ~ Profile No. : '||cr4.empai_last_prof_no);
"
"          ELSE
"
"                    v_cur_emp_plnt     := NVL(cr5.ephd_new_plnt,         cr5.ephd_cur_plnt);
"
"                    v_cur_pos_id       := NVL(cr5.ephd_new_pos_id,       cr5.ephd_cur_pos_id);
"
"                 v_cur_pos_desc     := NVL(cr5.ephd_new_pos_name,     cr5.ephd_cur_pos_name);
"
"                 v_cur_dept_id      := NVL(cr5.ephd_new_dept_id,      cr5.ephd_cur_dept_id);
"
"                 v_cur_dept_desc    := NVL(cr5.ephd_new_dept_name,    cr5.ephd_cur_dept_name);
"
"                 v_cur_job_id       := NVL(cr5.ephd_new_job_id,       cr5.ephd_cur_job_id);
"
"                 v_cur_job_title    := NVL(cr5.ephd_new_job_title,    cr5.ephd_cur_job_title);
"
"                 v_cur_loc_id       := NVL(cr5.ephd_new_loc_id,       cr5.ephd_cur_loc_id);
"
"                 v_cur_loc_desc     := NVL(cr5.ephd_new_loc_name,     cr5.ephd_cur_loc_name);
"
"                 v_cur_basic_sal    := NVL(cr5.ephd_new_basic_sal,    cr5.ephd_cur_basic_sal);
"
"                 v_cur_per_day_wage := NVL(cr5.ephd_new_per_day_wage, cr5.ephd_cur_per_day_wage);
"
"                 v_cur_grade_id     := NVL(cr5.ephd_new_grade_id,     cr5.ephd_cur_grade_id);
"
"                 END IF;
"
"
"
"              CLOSE c5;
"
"
"
"               OPEN c6;
"
"               FETCH c6 INTO cr6;
"
"
"
"                  IF c6%FOUND THEN
"
"
"
"                     IF cr6.epc_increment_mode = 'A' THEN
"
"                          v_next_incr_date := ADD_MONTHS(TRUNC(cr1.heibmh_date_from), 12) - 1;
"
"                     END IF;
"
"
"
"                  END IF;
"
"
"
"               CLOSE c6;
"
"
"
"               --v_profile_no := func_find_hrm_next_id (p_bu, 'EMP_PROFILE');
"
"
"
"               v_profile_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'EP',p_user);
"
"
"
"               v_emp_plnt := func_find_plnt_for_dept(p_bu, v_cur_dept_id, p_user);
"
"
"
"              INSERT INTO emp_profiles_hd(ephd_bu                ,
"
"                           ephd_pfx          ,
"
"                           ephd_doc_no            ,
"
"                           ephd_prof_batch_no     ,
"
"                           ephd_emp_id              ,
"
"                           ephd_emp_type      ,
"
"                           ephd_action_id         ,
"
"                           ephd_date                 ,
"
"                           ephd_eff_date          ,
"
"                           ephd_year                 ,
"
"                           ephd_period              ,
"
"                           ephd_cur_plnt      ,
"
"                           ephd_cur_dept_id      ,
"
"                           ephd_cur_dept_name      ,
"
"                           ephd_cur_job_id      ,
"
"                           ephd_cur_job_title      ,
"
"                           ephd_cur_pos_id      ,
"
"                           ephd_cur_pos_name      ,
"
"                           ephd_cur_loc_id      ,
"
"                           ephd_cur_loc_name      ,
"
"                           ephd_cur_grade_id      ,
"
"                           ephd_cur_basic_sal      ,
"
"                           ephd_cur_per_day_wage  ,
"
"                           ephd_new_plnt      ,
"
"                           ephd_new_pos_id           ,
"
"                           ephd_new_pos_name      ,
"
"                           ephd_new_dept_id          ,
"
"                           ephd_new_dept_name      ,
"
"                           ephd_new_job_id           ,
"
"                           ephd_new_job_title      ,
"
"                           ephd_new_loc_id           ,
"
"                           ephd_new_loc_name         ,
"
"                           ephd_new_grade_id         ,
"
"                           ephd_new_basic_sal      ,
"
"                           ephd_new_per_day_wage  ,
"
"                           ephd_new_basic_eff_from,
"
"                           ephd_next_increment_due,
"
"                           ephd_appraisal_method  ,
"
"                           ephd_status            ,
"
"                           ephd_ref               ,
"
"                           ephd_cre_by              ,
"
"                           ephd_cre_ip_addr      ,
"
"                       ephd_cre_os_user      ,
"
"                           ephd_cre_date          )
"
"                    VALUES(p_bu                  ,                        --ephd_bu
"
"                           'EP'              ,                  --ephd_pfx
"
"                           v_profile_no              ,                        --ephd_doc_no
"
"                           v_batch_no           ,                        --ephd_prof_batch_no
"
"                           cr3.heibml_emp_id      ,                        --ephd_emp_id
"
"                           DECODE(cr4.emp_type, 'E', 'F',  cr4.emp_type),            --ephd_emp_type
"
"                           v_profile_action       ,                        --ephd_action_id
"
"                           TRUNC(SYSDATE)         ,                        --ephd_date
"
"                           TRUNC(cr1.heibmh_date_from),                        --ephd_eff_date
"
"                           v_year              ,                        --ephd_year
"
"                           v_period                 ,                        --ephd_period
"
"                           v_cur_emp_plnt      ,                        --ephd_cur_plnt
"
"                           v_cur_dept_id      ,                        --ephd_cur_dept_id
"
"                           v_cur_dept_desc      ,                        --ephd_cur_dept_name
"
"                           v_cur_job_id          ,                        --ephd_cur_job_id
"
"                           v_cur_job_title      ,                        --ephd_cur_job_title
"
"                           v_cur_pos_id          ,                        --ephd_cur_pos_id
"
"                           v_cur_pos_desc      ,                        --ephd_cur_pos_name
"
"                           v_cur_loc_id          ,                        --ephd_cur_loc_id
"
"                           v_cur_loc_desc      ,                        --ephd_cur_loc_name
"
"                           v_cur_grade_id      ,                        --ephd_cur_grade_id
"
"                           v_cur_basic_sal      ,                        --ephd_cur_basic_sal
"
"                           v_cur_per_day_wage      ,                        --ephd_cur_per_day_wage
"
"                           v_emp_plnt          ,                        --ephd_new_plnt
"
"                           v_cur_pos_id         ,                           --ephd_new_pos_id
"
"                           v_cur_pos_desc       ,                        --ephd_new_pos_name
"
"                           v_cur_dept_id      ,                           --ephd_new_dept_id
"
"                           v_cur_dept_desc      ,                        --ephd_new_dept_name
"
"                           v_cur_job_id           ,                           --ephd_new_job_id
"
"                           v_cur_job_title      ,                        --ephd_new_job_title
"
"                           v_cur_loc_id               ,                           --ephd_new_loc_id
"
"                           v_cur_loc_desc         ,                           --ephd_new_loc_name
"
"                           v_cur_grade_id         ,                           --ephd_new_grade_id
"
"                           DECODE(cr4.emp_pay_basis, 'S', cr3.heibml_new_basic_sal, 0),        --ephd_new_basic_sal
"
"                           DECODE(cr4.emp_pay_basis, 'W', cr3.heibml_new_basic_sal, 0),        --ephd_new_per_day_wage
"
"                           TRUNC(cr1.heibmh_date_from),                        --ephd_new_basic_eff_from
"
"                           v_next_incr_date      ,                        --ephd_next_increment_due
"
"                           'MBO'          ,                         --ephd_appraisal_method
"
"                           'E'                     ,                        --ephd_status
"
"                           v_profile_action_desc||' PROFILE.',                    --ephd_ref
"
"                           p_user               ,                        --ephd_cre_by
"
"                           v_ip_addr           ,                        --ephd_cre_ip_addr
"
"                       v_os_user          ,                        --ephd_cre_os_user
"
"                           SYSDATE               );                        --ephd_cre_date
"
"
"
"               FOR cr7 IN c7(cr3.heibml_seq_no)
"
"               LOOP
"
"
"
"               OPEN c8(cr3.heibml_emp_id, cr7.heibmd_elmnt_id);
"
"               FETCH c8 INTO cr8;
"
"
"
"                  IF c8%NOTFOUND THEN
"
"                     v_cur_allow_amt := NULL;
"
"                  ELSE
"
"                     v_cur_allow_amt := NVL(cr8.epa_per_amt, 0);
"
"                  END IF;
"
"
"
"               CLOSE c8;
"
"
"
"              INSERT INTO emp_profiles_ln(epln_bu             ,
"
"                          epln_doc_no         ,
"
"                          epln_plnt                ,
"
"                          epln_elmnt_id         ,
"
"                          epln_allow_eff_from    ,
"
"                          epln_cur_amt         ,
"
"                          epln_new_amt         ,
"
"                          epln_end_allowance     ,
"
"                          epln_reference         ,
"
"                          epln_cre_by         ,
"
"                          epln_cre_ip_addr         ,        --added 15-feb-2020 : Ajis
"
"                          epln_cre_os_user         ,        --added 15-feb-2020 : Ajis
"
"                          epln_cre_date         )
"
"                       VALUES(p_bu               ,        --epln_bu
"
"                              v_profile_no           ,        --epln_doc_no
"
"                           v_emp_plnt        ,        --epln_plnt
"
"                           cr7.heibmd_elmnt_id    ,        --epln_elmnt_id
"
"                           TRUNC(cr1.heibmh_date_from),     --epln_allow_eff_from
"
"                           v_cur_allow_amt        ,        --epln_cur_amt
"
"                           cr7.heibmd_new_amount    ,        --epln_new_amt
"
"                           'N'            ,        --epln_end_allowance
"
"                           cr7.pehd_desc1        ,        --epln_reference
"
"                           p_user            ,        --epln_cre_by
"
"                           v_ip_addr            ,        --epln_cre_ip_addr        --added 15-feb-2020 : Ajis
"
"                          v_os_user            ,        --epln_cre_os_user        --added 15-feb-2020 : Ajis
"
"                           SYSDATE            );        --epln_cre_date
"
"
"
"               END LOOP c7;
"
"
"
"               UPDATE emp_profiles_hd
"
"                  SET ephd_status       = 'N',
"
"                      ephd_upd_by       = p_user,
"
"                      ephd_upd_emp_id   = v_user_emp_id,
"
"                      ephd_upd_ip_addr  = v_ip_addr,                --added 15-feb-2020 : Ajis
"
"              ephd_upd_os_user  = v_os_user,                --added 15-feb-2020 : Ajis
"
"                      ephd_upd_date     = SYSDATE
"
"                WHERE ephd_bu     = p_bu
"
"                  AND ephd_doc_no = v_profile_no
"
"                  AND ephd_status = 'E';
"
"
"
"               UPDATE emp_profiles_hd
"
"                  SET ephd_status       = 'A',
"
"                      ephd_upd_by       = p_user,
"
"                      ephd_upd_emp_id   = v_user_emp_id,
"
"                      ephd_upd_ip_addr  = v_ip_addr,
"
"              ephd_upd_os_user  = v_os_user,
"
"                      ephd_upd_date     = SYSDATE
"
"                WHERE ephd_bu     = p_bu
"
"                  AND ephd_doc_no = v_profile_no
"
"                  AND ephd_status = 'N';
"
"
"
"               UPDATE hrm_emp_inc_bulk_mig_ln
"
"                  SET --heibml_cur_prof_no = cr4.empai_last_prof_no,
"
"                      --heibml_new_prof_no = v_profile_no,
"
"                      heibml_upd_by      = p_user,
"
"                      heibml_upd_emp_id   = v_user_emp_id,
"
"                      heibml_upd_ip_addr = v_ip_addr,
"
"              heibml_upd_os_user = v_os_user,
"
"                      heibml_upd_date    = SYSDATE
"
"                WHERE heibml_bu     = p_bu
"
"                  AND heibml_doc_no = p_doc_no
"
"                  AND heibml_seq_no = cr3.heibml_seq_no;
"
"
"
"            END LOOP c3;
"
"
"
"            UPDATE hrm_emp_inc_bulk_mig_hd
"
"               SET heibmh_status       = 'P',
"
"                   heibmh_upd_by       = p_user,
"
"                   heibmh_upd_emp_id   = v_user_emp_id,
"
"                   heibmh_upd_ip_addr  = v_ip_addr,
"
"              heibmh_upd_os_user  = v_os_user,
"
"                   heibmh_upd_date     = SYSDATE
"
"             WHERE heibmh_bu     = p_bu
"
"               AND heibmh_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"   END proc_post_emp_inc_ctc;
"
"
"
"   PROCEDURE proc_calc_bulk_inc_ctc(p_bu                        VARCHAR2,
"
"                         p_doc_no                        VARCHAR2,
"
"                       p_emp_id                        VARCHAR2,
"
"                       p_sal_type                        VARCHAR2,
"
"                       p_calc_elmnt_id                    VARCHAR2,
"
"                       p_gross_amt                        NUMBER,
"
"                       p_seq_no                        NUMBER,
"
"                       p_user                        VARCHAR2,
"
"                       p_res            OUT            VARCHAR2)
"
"   AS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM ctc_brkup_elmnt,
"
"          payroll_elements_hd
"
"    WHERE cbe_bu       = pehd_bu
"
"      AND cbe_elmnt_id = pehd_elmnt_id
"
"      AND pehd_bu      = p_bu
"
"      AND pehd_type    = 'B';
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM ctc_brkup_elmnt,
"
"          payroll_elements_hd
"
"    WHERE cbe_bu       = pehd_bu
"
"      AND cbe_elmnt_id = pehd_elmnt_id
"
"      AND pehd_bu      = p_bu
"
"    ORDER BY cbe_seq_no;
"
"
"
"   CURSOR c3(c_elmnt_id        VARCHAR2)
"
"       IS
"
"   SELECT pefhd_doc_no
"
"     FROM payroll_elements_formula_hd,
"
"          payroll_elements_ln
"
"    WHERE peln_bu = pefhd_bu
"
"      AND peln_doc_no = pefhd_doc_no
"
"      AND pefhd_bu = p_bu
"
"      AND pefhd_elmnt_id = c_elmnt_id;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4
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
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu = p_bu
"
"      AND emp_emp_id = p_emp_id
"
"      AND emp_status = 'A';
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_elmnt_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_pyrl_allowances
"
"    WHERE epa_bu       = p_bu
"
"      AND epa_emp_id   = p_emp_id
"
"      AND epa_elmnt_id = c_elmnt_id;
"
"
"
"      cr5                c5%ROWTYPE;
"
"
"
"      v_basic_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_old_elmnt_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_calc_elmnt_value        NUMBER(15, 3) := 0;
"
"      v_actual_value            NUMBER(15, 3) := 0;
"
"      v_sub_seq_no            NUMBER(5) := 1;
"
"
"
"      v_ctc_doc_no            VARCHAR2(15);
"
"      v_optional            VARCHAR2(1) := 'N';
"
"      v_ip_addr                VARCHAR2(50) := Audit_Info.Get_Ip_Address;
"
"      v_os_user                VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"      v_user_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20056,'HRM'||p_bu);
"
"         ELSE
"
"
"
"            OPEN c3(p_calc_elmnt_id);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20057,'HRM'||p_bu);
"
"               ELSE
"
"                  v_ctc_doc_no := cr3.pefhd_doc_no;
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            UPDATE payroll_elements_ln
"
"               SET peln_oper1_value  = p_gross_amt,
"
"                      peln_upd_by       = p_user,
"
"                      peln_upd_emp_id   = v_user_emp_id,
"
"                  peln_upd_ip_addr  = v_ip_addr,
"
"                  peln_upd_os_user  = v_os_user,
"
"                  peln_upd_date     = SYSDATE
"
"             WHERE peln_bu     = p_bu
"
"               AND peln_seq_no = 1
"
"               AND peln_doc_no = v_ctc_doc_no;
"
"
"
"            IF SQL%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"            END IF;
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"         proc_calc_pay_elements (p_bu,
"
"                                 'N',
"
"                                 TRUNC(SYSDATE),
"
"                                 TRUNC(SYSDATE),
"
"                                 cr2.cbe_sou_elmnt_id,
"
"                                 v_optional,
"
"                                 p_emp_id,
"
"                                 '+',
"
"                                 v_calc_elmnt_value,
"
"                                 v_actual_value,
"
"                                 'S',
"
"                                 NULL);
"
"
"
"         IF cr2.pehd_type = 'B' THEN
"
"
"
"            IF p_sal_type IN ('M') THEN
"
"               v_basic_amt := ROUND(v_actual_value);
"
"            END IF;
"
"
"
"            IF p_sal_type IN ('C') THEN
"
"               v_basic_amt := ROUND(p_gross_amt);
"
"            END IF;
"
"
"
"            OPEN c4;
"
"            FETCH c4 INTO cr4;
"
"
"
"               IF c4%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'~'||p_emp_id);
"
"               END IF;
"
"
"
"            CLOSE c4;
"
"
"
"        UPDATE hrm_emp_inc_bulk_mig_ln
"
"           SET heibml_old_basic_sal = cr4.empai_basic_sal,
"
"               heibml_new_basic_sal = v_basic_amt,
"
"           heibml_upd_by      = p_user,
"
"           heibml_upd_ip_addr = v_ip_addr,
"
"           heibml_upd_os_user = v_os_user,
"
"           heibml_upd_emp_id  = v_user_emp_id,
"
"           heibml_upd_date    = SYSDATE
"
"         WHERE heibml_bu = p_bu
"
"           AND heibml_doc_no = p_doc_no
"
"           AND heibml_seq_no = p_seq_no;
"
"
"
"         ELSE
"
"
"
"        OPEN c5(cr2.cbe_elmnt_id);
"
"        FETCH c5 INTO cr5;
"
"
"
"           IF c5%NOTFOUND THEN
"
"              v_old_elmnt_amt := 0;
"
"           ELSE
"
"              v_old_elmnt_amt := cr5.epa_per_amt;
"
"           END IF;
"
"
"
"        CLOSE c5;
"
"
"
"        INSERT INTO hrm_emp_inc_bulk_mig_dtl(heibmd_bu       ,
"
"                         heibmd_doc_no     ,
"
"                         heibmd_seq_no     ,
"
"                         heibmd_sub_seq_no ,
"
"                         heibmd_elmnt_id   ,
"
"                         heibmd_old_amount ,
"
"                         heibmd_new_amount ,
"
"                         heibmd_cre_by     ,
"
"                         heibmd_cre_emp_id ,
"
"                         heibmd_cre_ip_addr,
"
"                         heibmd_cre_os_user,
"
"                         heibmd_cre_date   )
"
"                      VALUES(p_bu           ,                         --heibmd_bu
"
"                         p_doc_no       ,                         --heibmd_doc_no
"
"                         p_seq_no       ,                         --heibmd_seq_no
"
"                         v_sub_seq_no       ,                         --heibmd_sub_seq_no
"
"                         cr2.cbe_elmnt_id  ,                         --heibmd_elmnt_id
"
"                         v_old_elmnt_amt   ,                         --heibmd_old_amount
"
"                         ROUND(v_actual_value),                              --heibmd_new_amount
"
"                         p_user                ,                         --heibmd_cre_by
"
"                         v_user_emp_id       ,                         --heibmd_cre_emp_id
"
"                         v_ip_addr       ,                         --heibmd_cre_ip_addr
"
"                         v_os_user       ,                         --heibmd_cre_os_user
"
"                         SYSDATE       );                         --heibmd_cre_date
"
"
"
"        v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"         END IF;
"
"
"
"      END LOOP c2;
"
"
"
"   END proc_calc_bulk_inc_ctc;
"
"
"
"END pack_emp_inc_bulk_mig_grade;"
/
