CREATE OR REPLACE
"PACKAGE BODY        pack_emp_increment_mig
"
"AS
"
"
"
"   PROCEDURE proc_upload_emp_incre_mig(p_bu                    VARCHAR2,
"
"                                       p_doc_no                VARCHAR2,
"
"                                    p_dir                   VARCHAR2,
"
"                                    p_file_name             VARCHAR2,
"
"                                    p_user                  VARCHAR2,
"
"                                      p_res             OUT   VARCHAR2)
"
"   IS
"
"
"
"   CURSOR c1
"
"       IS
"
"   SELECT table_name
"
"     FROM user_tables
"
"    WHERE table_name = 'TEMP_EMP_INCRE_MIG_LN';
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
"     FROM hrm_emp_alu_inc_ln
"
"    WHERE heail_bu = p_bu
"
"      AND heail_doc_no = p_doc_no;
"
"
"
"      cr2              c2%ROWTYPE;
"
"
"
"      v_result                VARCHAR2(1) ;
"
"      v_exp_flag              VARCHAR2(1) := 'N';
"
"      v_status                VARCHAR2(1) := 'N';
"
"      v_ip_addr               VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user               VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
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
"
"
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_EMP_INCRE_MIG_LN';
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
"      DELETE
"
"        FROM hrm_emp_alu_inc_ln
"
"       WHERE heail_bu     = p_bu
"
"         AND heail_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_emp_alu_inc_dtls
"
"       WHERE heaid_bu     = p_bu
"
"         AND heaid_doc_no = p_doc_no;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE temp_emp_incre_mig_ln(teimln_emp_id        VARCHAR2(500),
"
"                                                      teimln_eff_date        VARCHAR2(500),
"
"                                                    teimln_gross        VARCHAR2(500))
"
"                         ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                  DEFAULT DIRECTORY '||p_dir||'
"
"                                ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                               SKIP 1
"
"                                               FIELDS TERMINATED BY ''|''
"
"                                                MISSING FIELD VALUES ARE NULL
"
"                                                REJECT ROWS WITH ALL NULL FIELDS
"
"                                                  (teimln_emp_id        CHAR(255),
"
"                                                 teimln_eff_date              CHAR(255),
"
"                                                 teimln_gross            CHAR(255)))
"
"                                              LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE 'INSERT INTO hrm_emp_alu_inc_ln(heail_bu,
"
"                                            heail_doc_no,
"
"                                            heail_seq_no,
"
"                                            heail_emp_id,
"
"                                            heail_sal_eff_date,
"
"                                            heail_new_gross,
"
"                                            heail_cre_by,
"
"                                            heail_cre_ip_addr,
"
"                                            heail_cre_os_user,
"
"                                            heail_cre_emp_id,
"
"                                            heail_cre_date)
"
"                                            (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                                     '|| CHR(39) || p_doc_no || CHR(39) ||',
"
"                                                     ROWNUM          ,
"
"                                                     teimln_emp_id      ,
"
"                                                     teimln_eff_date   ,
"
"                                                     teimln_gross ,
"
"                                                     '|| CHR(39) || p_user || CHR(39) ||',
"
"                                                     '|| CHR(39) || v_ip_addr || CHR(39) ||',
"
"                                                     '|| CHR(39) || v_os_user || CHR(39) ||',
"
"                                                     '|| CHR(39) || v_cre_emp_id || CHR(39) ||',
"
"                                                     SYSDATE
"
"                                                   FROM temp_emp_incre_mig_ln)';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE temp_emp_incre_mig_ln';
"
"
"
"      UPDATE hrm_emp_alu_inc_ln
"
"         SET heail_emp_id   = TRIM(heail_emp_id),
"
"             heail_sal_eff_date = TRIM(heail_sal_eff_date),
"
"             heail_new_gross  = TRIM(heail_new_gross)
"
"       WHERE heail_bu       = p_bu
"
"         AND heail_doc_no   = p_doc_no;
"
"
"
"      UPDATE hrm_emp_alu_inc_ln
"
"         SET heail_emp_id   = UPPER(heail_emp_id),
"
"             heail_sal_eff_date = UPPER(heail_sal_eff_date),
"
"             heail_new_gross = UPPER(heail_new_gross)
"
"       WHERE heail_bu     = p_bu
"
"         AND heail_doc_no = p_doc_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"         v_result := 'N';
"
"      ELSE
"
"         v_result := 'Y';
"
"      END IF;
"
"
"
"      p_res := v_result;
"
"
"
"   END proc_upload_emp_incre_mig;
"
"
"
"   PROCEDURE proc_calc_salary(p_bu               VARCHAR2,
"
"                            p_doc_no           VARCHAR2,
"
"                              p_date_to                DATE,
"
"                              p_date_from               DATE,
"
"                              p_user              VARCHAR2,
"
"                              p_res          OUT     VARCHAR2)
"
"   IS
"
"
"
"   CURSOR c1
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
"    cr1                c1%ROWTYPE;
"
"
"
"    v_res              VARCHAR(1);
"
"
"
"   BEGIN
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND THEN
"
"       -- IF cr1.epc_sal_sou in ('M','C') THEN
"
"
"
"           proc_calc_emp_incre(p_bu,
"
"                               p_doc_no,
"
"                   p_date_to,
"
"                   p_date_from,
"
"                   p_user,
"
"                   v_res);
"
"
"
"           p_res := v_res;
"
"
"
"       -- END IF;
"
"        ELSE
"
"        RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"        END IF;
"
"
"
"      CLOSE c1;
"
"
"
"   END proc_calc_salary;
"
"
"
"   PROCEDURE proc_emp_incre_mig_excep(p_bu                    VARCHAR2,
"
"                                p_doc_no                VARCHAR2,
"
"                                p_date_to               DATE,
"
"                                p_date_from             DATE,
"
"                                p_user                  VARCHAR2,
"
"                                p_res        OUT        VARCHAR2)
"
"   IS
"
"
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_alu_inc_hd
"
"    WHERE heaih_bu     = p_bu
"
"      AND heaih_doc_no = p_doc_no
"
"      AND heaih_status IN ('N');
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
"     FROM hrm_emp_alu_inc_ln
"
"    WHERE heail_bu = p_bu
"
"      AND heail_doc_no = p_doc_no;
"
"
"
"   CURSOR c3(c_emp_id            VARCHAR2,
"
"             c_cat_id            VARCHAR2)
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
"      AND emp_cat_id = c_cat_id
"
"      AND emp_status = 'A';
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id            VARCHAR2,
"
"             c_year              NUMBER,
"
"             c_period            NUMBER)
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
"      cr4                c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT heail_emp_id,
"
"          COUNT(*)
"
"     FROM hrm_emp_alu_inc_ln
"
"    WHERE heail_bu = p_bu
"
"      AND heail_doc_no = p_doc_no
"
"      AND heail_emp_id = c_emp_id
"
"    GROUP BY heail_emp_id
"
"    HAVING COUNT(*) > 1;
"
"
"
"      cr5            c5%ROWTYPE;
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
"   CURSOR c7(c_emp_id                VARCHAR2)
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
"      cr7                c7%ROWTYPE;
"
"
"
"   CURSOR c8(c_emp_id            VARCHAR2)
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
"      cr8                c8%ROWTYPE;
"
"
"
"   CURSOR c9(c_year        NUMBER,
"
"             c_period            NUMBER,
"
"             c_clndr_id    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_cal_year,
"
"          payroll_cal_period
"
"    WHERE pcy_bu       = pcp_bu
"
"      AND pcy_year     = pcp_year
"
"      AND pcy_clndr_id = pcp_clndr_id
"
"      AND pcp_bu       = p_bu
"
"      AND pcp_year     = c_year
"
"      AND pcp_period   = c_period
"
"      AND pcp_clndr_id = c_clndr_id
"
"      AND pcy_status IN ('O', 'U');
"
"
"
"      cr9                c9%ROWTYPE;
"
"
"
"   CURSOR c10(c_clndr_id    VARCHAR2,
"
"              c_date        DATE)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_cal_year,
"
"          payroll_cal_period
"
"    WHERE pcy_bu       = pcp_bu
"
"      AND pcy_year     = pcp_year
"
"      AND pcy_clndr_id = pcp_clndr_id
"
"      AND pcp_bu       = p_bu
"
"      AND pcy_clndr_id = c_clndr_id
"
"      AND TRUNC(c_date) BETWEEN TRUNC(pcp_start_date) AND TRUNC(pcp_end_date)
"
"      AND pcy_status IN ('O', 'U');
"
"
"
"      cr10                    c10%ROWTYPE;
"
"
"
"      v_excep                        VARCHAR2(4000);
"
"      v_res                        VARCHAR2(1) := 'N';
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id                 VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"      v_emp_last_proc_year             NUMBER(6);
"
"      v_emp_last_proc_period            NUMBER(2);
"
"      v_last_year                    NUMBER(6);
"
"      v_last_period                  NUMBER(2);
"
"      v_clndr_id                    VARCHAR2(10);
"
"      v_start_date                  DATE;
"
"      v_end_date                    DATE;
"
"      v_max_prof_date               DATE;
"
"      v_prof_year                   NUMBER(7);
"
"      v_prof_period                 NUMBER(2);
"
"      v_ret_prof_date               DATE;
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
"            RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"            UPDATE hrm_emp_alu_inc_ln
"
"               SET heail_ref             = NULL,
"
"                   heail_excep_flag      = 'N',
"
"                   heail_upd_by            = p_user,
"
"                   heail_upd_ip_addr     = v_ip_addr,
"
"                   heail_upd_os_user     = v_os_user,
"
"                   heail_upd_emp_id     = v_cre_emp_id,
"
"                   heail_upd_date   = SYSDATE
"
"             WHERE heail_bu = p_bu
"
"               AND heail_doc_no = p_doc_no;
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"              v_excep                         := NULL;
"
"              v_emp_last_proc_year                := NULL;
"
"              v_emp_last_proc_period          := NULL;
"
"              v_last_year                    := NULL;
"
"              v_last_period                  := NULL;
"
"              v_clndr_id                    := NULL;
"
"              v_start_date                  := NULL;
"
"              v_end_date                   := NULL;
"
"              v_max_prof_date              := NULL;
"
"              v_prof_year                  := NULL;
"
"              v_prof_period                := NULL;
"
"              v_ret_prof_date              := NULL;
"
"
"
"              IF cr2.heail_emp_id IS NULL THEN
"
"                 v_excep := v_excep||' EMPLOYEE SHOULD NOT BE NULL.';
"
"              END IF;
"
"
"
"             IF cr2.heail_emp_id IS NOT NULL THEN
"
"
"
"              OPEN c8(cr2.heail_emp_id);
"
"              FETCH c8 INTO cr8;
"
"
"
"                IF c8%NOTFOUND THEN
"
"                   v_excep := v_excep||' EMPLOYEE NOT FOUND.';
"
"                END IF;
"
"
"
"              CLOSE c8;
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
"               IF cr3.emp_start_date BETWEEN p_date_from AND p_date_to THEN
"
"                  v_excep := v_excep||' NEW JOIN EMPLOYEE.';
"
"               END IF;
"
"
"
"               IF cr3.emp_include_payroll = 'N' THEN
"
"                  v_excep := v_excep ||' EMPLOYEE NOT INCLUDE IN PAYROLL.';
"
"               END IF;
"
"
"
"               IF cr3.emp_last_proc_year IS NULL OR cr3.emp_last_proc_period IS NULL THEN
"
"                  v_excep := v_excep ||' LAST PROC. PAYROLL YEAR/PERIOD SHOULD NOT BE NULL.';
"
"               ELSE
"
"                  v_emp_last_proc_year   := cr3.emp_last_proc_year;
"
"                  v_emp_last_proc_period := cr3.emp_last_proc_period;
"
"                  v_clndr_id             := cr3.emp_clndr_id;
"
"               END IF;
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
"             OPEN c5(cr2.heail_emp_id);
"
"             FETCH c5 INTO cr5;
"
"
"
"              IF c5%FOUND THEN
"
"                 v_excep := v_excep||' DUPLICATE EMPLOYEES FOUND. ';
"
"              END IF;
"
"
"
"             CLOSE c5;
"
"
"
"             IF cr2.heail_new_gross IS NULL THEN
"
"                   v_excep := v_excep||' GROSS AMOUNT SHOULD NOT BE NULL.';
"
"             END IF;
"
"
"
"             IF cr2.heail_new_gross IS NOT NULL THEN
"
"
"
"                IF cr2.heail_new_gross < 0 THEN
"
"                   v_excep := v_excep||' GROSS AMOUNT SHOULD NOT BE NEGATIVE.';
"
"                END IF;
"
"
"
"                IF cr2.heail_new_gross = 0 THEN
"
"                   v_excep := v_excep||' GROSS AMOUNT SHOULD BE GREATER THAN 0.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             OPEN c6(cr2.heail_emp_id);
"
"             FETCH c6 INTO cr6;
"
"
"
"             IF c6%NOTFOUND THEN
"
"                v_excep := v_excep||' LAST PROCESSES YEAR/PERIOD NOT FOUND. ';
"
"             ELSE
"
"
"
"                IF cr6.phhd_proc_year <> (v_emp_last_proc_year||TO_CHAR(v_emp_last_proc_period, '00')) THEN
"
"                   v_excep := v_excep ||' LAST PROC. PAYROLL YEAR/PERIOD DOES NOT MATCH WITH EMP. LAST PROC. YEAR/PERIOD.';
"
"                END IF;
"
"
"
"                IF v_emp_last_proc_period = 12 THEN
"
"                   v_last_period := 1;
"
"                   v_last_year   := v_emp_last_proc_year + 101;
"
"                ELSE
"
"                   v_last_period := v_emp_last_proc_period + 1;
"
"                   v_last_year   := v_emp_last_proc_year;
"
"                END IF;
"
"
"
"                OPEN c9(v_last_year, v_last_period, v_clndr_id);
"
"                FETCH c9 INTO cr9;
"
"
"
"                   IF c9%NOTFOUND THEN
"
"                   v_excep := v_excep ||' CALENDAR NOT FOUND. ';
"
"                   ELSE
"
"                   v_start_date := TRUNC(cr9.pcp_start_date);
"
"                   v_end_date   := TRUNC(cr9.pcp_end_date);
"
"                   END IF;
"
"
"
"                 CLOSE c9;
"
"
"
"                 OPEN c7(cr2.heail_emp_id);
"
"                 FETCH c7 INTO cr7;
"
"
"
"                    IF c7%NOTFOUND THEN
"
"                       v_excep := v_excep ||' EMPLOYEE PROFILE DETAILS NOT FOUND.';
"
"                       END IF;
"
"
"
"                  CLOSE c7;
"
"
"
"                  OPEN c4(cr2.heail_emp_id,cr1.heaih_year,cr1.heaih_period);
"
"                  FETCH c4 INTO cr4;
"
"
"
"                      IF c4%FOUND THEN
"
"                         v_excep := v_excep||' PROFILE ALREADY EXISTS FOR THIS YEAR/PERIOD. PROFILE NO. : '||cr4.ephd_doc_no||'. ';
"
"                      ELSE
"
"
"
"                         OPEN c10(v_clndr_id , v_max_prof_date);
"
"                     FETCH c10 INTO cr10;
"
"
"
"                        IF c10%NOTFOUND THEN
"
"                           v_ret_prof_date := TRUNC(v_max_prof_date);
"
"                        ELSE
"
"                           v_ret_prof_date := TRUNC(cr10.pcp_end_date);
"
"                        END IF;
"
"
"
"                     CLOSE c10;
"
"
"
"                     IF TRUNC(cr1.heaih_eff_from) NOT BETWEEN v_start_date AND v_end_date THEN
"
"                        v_excep := v_excep||' PROFILE EFF. DATE SHOULD BE IN THE NEXT PAYROLL DATE RANGE : '||TO_CHAR(v_start_date, 'DD.MM.RRRR')||' to '||TO_CHAR(v_end_date, 'DD.MM.RRRR')||'. ';
"
"                     END IF;
"
"
"
"                     IF TRUNC(cr2.heail_sal_eff_date) > TRUNC(cr1.heaih_eff_from) THEN
"
"                        v_excep := v_excep||' SALARY EFF. DATE SHOULD BE LESS THAN OR EQUAL TO PROFILE EFF. DATE. ';
"
"                     END IF;
"
"
"
"                     IF TRUNC(cr2.heail_sal_eff_date) <= TRUNC(v_ret_prof_date) THEN
"
"                        v_excep := v_excep||' SALARY EFF. DATE SHOULD BE GREATER THAN LAST PROF. DATE : '||TO_CHAR(v_ret_prof_date, 'DD.MM.RRRR')||'. ';
"
"                     END IF;
"
"
"
"                    END IF;
"
"
"
"                  CLOSE c4;
"
"
"
"                END IF;
"
"
"
"             CLOSE c6;
"
"
"
"             IF v_excep IS NOT NULL THEN
"
"
"
"                    UPDATE hrm_emp_alu_inc_ln
"
"                       SET heail_ref             = v_excep,
"
"                           heail_excep_flag        = 'Y',
"
"                           heail_upd_by            = p_user,
"
"                             heail_upd_ip_addr     = v_ip_addr,
"
"                           heail_upd_os_user     = v_os_user,
"
"                           heail_upd_emp_id     = v_cre_emp_id,
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
"                    v_res := 'Y';
"
"
"
"             END IF;
"
"
"
"            END LOOP c2;
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"       p_res := v_res;
"
"
"
"   END proc_emp_incre_mig_excep;
"
"
"
"
"
"   PROCEDURE proc_calc_emp_incre(p_bu            VARCHAR2,
"
"                             p_doc_no        VARCHAR2,
"
"                             p_date_to       DATE,
"
"                             p_date_from     DATE,
"
"                             p_user          VARCHAR,
"
"                                 p_res    OUT    VARCHAR)
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
"          hrm_emp_alu_inc_ln
"
"    WHERE heaih_bu = heail_bu
"
"      AND heaih_doc_no = heail_doc_no
"
"      AND heaih_bu = p_bu
"
"      AND heaih_doc_no = p_doc_no;
"
"
"
"   CURSOR c2(c_emp_id        VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(epa_per_amt),0) gross_amount
"
"     FROM emp_pyrl_allowances
"
"    WHERE epa_bu = p_bu
"
"      AND epa_emp_id = c_emp_id
"
"      AND ((epa_end_date IS NOT NULL AND
"
"            p_date_from BETWEEN epa_start_date AND epa_end_date AND
"
"            p_date_to BETWEEN epa_start_date AND epa_end_date) OR
"
"           (epa_end_date IS NULL AND p_date_from >= epa_start_date)
"
"          );
"
"
"
"      cr2        c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_emp_id        VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_active_infos
"
"    WHERE empai_bu = p_bu
"
"      AND empai_emp_id = c_emp_id;
"
"
"
"      cr3        c3%ROWTYPE;
"
"
"
"   CURSOR c4
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
"      cr4        c4%ROWTYPE;
"
"
"
"    v_old_gross         NUMBER(15,3) := 0;
"
"    v_old_basic         NUMBER(15,3) := 0;
"
"    v_res            VARCHAR2(10) := 'N';
"
"    v_basic          NUMBER(15, 3) := 0;
"
"    v_sal_source     VARCHAR2(1) := 'B';
"
"    v_grade_id          VARCHAR2(10);
"
"    v_new_gross         NUMBER(15,3) := 0;
"
"    v_new_basic         NUMBER(15,3) := 0;
"
"    v_basic_pct         NUMBER(15,3) := 0;
"
"
"
"    v_ip_addr           VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"    v_os_user           VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"    v_cre_emp_id        VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"
"
"   BEGIN
"
"
"
"     FOR cr1 IN c1
"
"     LOOP
"
"
"
"       OPEN c3(cr1.heail_emp_id);
"
"       FETCH c3 INTO cr3;
"
"
"
"          IF c3%FOUND THEN
"
"             v_old_basic := cr3.empai_basic_sal;
"
"             v_grade_id  := cr3.empai_grade;
"
"          END IF;
"
"
"
"       CLOSE c3;
"
"
"
"       OPEN c2(cr1.heail_emp_id);
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF c2%FOUND THEN
"
"             v_old_gross := cr2.gross_amount + NVL(v_old_basic,0);
"
"             v_new_gross := cr1.heail_new_gross;
"
"          END IF;
"
"
"
"       CLOSE c2;
"
"
"
"       OPEN c4;
"
"       FETCH c4 INTO cr4;
"
"
"
"         IF c4%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20005,'HRM ~ Applicaion Control Not Found');
"
"         ELSE
"
"            v_sal_source := cr4.epc_sal_sou;
"
"         END IF;
"
"
"
"       CLOSE c4;
"
"
"
"      --IF v_sal_source IN ('M','C') THEN
"
"
"
"           proc_load_emp_grade_ctc(p_bu,
"
"                               p_doc_no,
"
"                               cr1.heail_seq_no,
"
"                               cr1.heail_emp_id,
"
"                               v_grade_id,
"
"                               v_new_gross,
"
"                               p_user,
"
"                               v_basic_pct);
"
"     -- END IF;
"
"
"
"      IF v_sal_source IN ('M') THEN
"
"
"
"          proc_calc_ctc(p_bu,
"
"                       cr1.heail_emp_id,
"
"                       v_new_gross,
"
"                       p_user,
"
"                       v_basic);
"
"      END IF;
"
"
"
"      IF v_sal_source IN ('M') THEN
"
"         v_new_basic := NVL(v_basic, 0);
"
"      ELSIF v_sal_source IN ('C','B') THEN
"
"         v_new_basic := ROUND(((v_new_gross * NVL(v_basic_pct,0))/100),2);
"
"      END IF;
"
"
"
"      UPDATE hrm_emp_alu_inc_ln
"
"         SET heail_old_gross     = v_old_gross,
"
"             heail_old_basic     = v_old_basic,
"
"             heail_new_gross   = v_new_gross,
"
"             heail_new_basic   = v_new_basic,
"
"             heail_upd_by    = p_user,
"
"             heail_upd_ip_addr = v_ip_addr,
"
"             heail_upd_os_user = v_os_user,
"
"             heail_upd_emp_id  = v_cre_emp_id,
"
"             heail_upd_date    = SYSDATE
"
"       WHERE heail_bu = p_bu
"
"         AND heail_doc_no = p_doc_no
"
"         AND heail_seq_no = cr1.heail_seq_no;
"
"
"
"       v_res := 'Y';
"
"
"
"     END LOOP c1;
"
"
"
"     p_res := v_res;
"
"
"
"   END proc_calc_emp_incre;
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
"
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_alu_inc_hd
"
"    WHERE heaih_bu     = p_bu
"
"      AND heaih_doc_no = p_doc_no;
"
"
"
"      cr0            c0%ROWTYPE;
"
"
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_alu_inc_ln
"
"    WHERE heail_bu         = p_bu
"
"      AND heail_doc_no     = p_doc_no;
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
"  CURSOR c6(c_prof_id       VARCHAR2)
"
"      IS
"
"  SELECT *
"
"    FROM profile_actions
"
"   WHERE pact_bu = p_bu
"
"     AND pact_action_id = c_prof_id;
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
"     AND heaid_seq_no   = c_seq_no
"
"     AND heaid_new_allow > 0;
"
"
"
"  CURSOR c8(c_dept_id        VARCHAR2)
"
"      IS
"
"  SELECT dept_name1,
"
"         dept_id,
"
"         dept_plnt,
"
"         bup_name1,
"
"         dept_plnt_loc_id,
"
"         bupld_loc_name
"
"    FROM departments,
"
"         bus_unit_plants_loc_dtls,
"
"         bus_unit_plants
"
"   WHERE bup_bu          = dept_bu
"
"     AND bup_plant_id   = dept_plnt
"
"     AND bup_bu           = bupld_bu
"
"     AND bup_plant_id   = bupld_plnt
"
"     AND bupld_loc_id   = dept_plnt_loc_id
"
"     AND dept_bu        = p_bu
"
"     AND dept_id        = c_dept_id;
"
"
"
"   cr8             c8%ROWTYPE;
"
"
"
"
"
"   v_batch_no                    VARCHAR2(30);
"
"   v_profile_no                 VARCHAR2(30);
"
"   v_profile_action             VARCHAR2(10);
"
"   v_profile_action_desc        VARCHAR2(100);
"
"
"
"   v_year                    NUMBER(7);
"
"   v_period                 NUMBER(5);
"
"
"
"   v_pos_id               VARCHAR2(10);
"
"   v_pos_desc                  VARCHAR2(100);
"
"   v_dept_id                   VARCHAR2(10);
"
"   v_dept_desc                 VARCHAR2(100);
"
"   v_job_id                    VARCHAR2(10);
"
"   v_job_title                 VARCHAR2(100);
"
"   v_loc_id                    VARCHAR2(10);
"
"   v_loc_desc                  VARCHAR2(100);
"
"   v_plnt_id                   VARCHAR2(10);
"
"   v_plnt_desc                 VARCHAR2(100);
"
"
"
"   v_cur_emp_plnt           VARCHAR2(10);
"
"   v_cur_pos_id                 VARCHAR2(10);
"
"   v_cur_pos_desc               VARCHAR2(100);
"
"   v_cur_dept_id                VARCHAR2(10);
"
"   v_cur_dept_desc              VARCHAR2(100);
"
"   v_cur_job_id                 VARCHAR2(10);
"
"   v_cur_job_title              VARCHAR2(100);
"
"   v_cur_loc_id                 VARCHAR2(10);
"
"   v_cur_loc_desc               VARCHAR2(100);
"
"   v_cur_basic_sal              NUMBER(15, 3) := 0;
"
"   v_cur_per_day_wage           NUMBER(15, 3) := 0;
"
"   v_cur_grade_id               VARCHAR2(10);
"
"   v_cur_allow_amt              NUMBER(15, 3) := 0;
"
"   v_cur_mon_gross        NUMBER(15, 3) := 0;
"
"
"
"   v_next_incr_date             DATE;
"
"   v_emp_plnt                   VARCHAR2(10);
"
"   v_res                        VARCHAR2(1):= 'N';
"
"
"
"    v_ip_addr                   VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"    v_os_user                   VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"    v_cre_emp_id                VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"
"
"BEGIN
"
"
"
"   OPEN c0;
"
"   FETCH c0 INTO cr0;
"
"
"
"      IF c0%NOTFOUND THEN
"
"         RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"      ELSE
"
"
"
"         OPEN c6(cr0.heaih_pro_action);
"
"         FETCH c6 INTO cr6;
"
"
"
"            IF c6%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20010,'HRM '||p_bu||'~ Profile Action Not Found');
"
"            ELSE
"
"               v_profile_action_desc := cr6.pact_action_desc1;
"
"            END IF;
"
"
"
"         CLOSE c6;
"
"
"
"         --v_batch_no := func_find_hrm_next_id (p_bu, 'EMP_PROF_BATCH_NO');
"
"
"
"         v_batch_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'EPB',p_user);
"
"
"
"         INSERT INTO emp_prof_batch(epb_bu              ,
"
"                                  epb_pfx        ,
"
"                                  epb_batch_no        ,
"
"                                  epb_batch_date      ,
"
"                                  epb_action_id       ,
"
"                                  epb_action_type     ,
"
"                                  epb_ref             ,
"
"                                  epb_status          ,
"
"                                  epb_chk_flag        ,
"
"                                  epb_cre_by          ,
"
"                                  epb_cre_ip_addr     ,
"
"                                   epb_cre_os_user     ,
"
"                                  epb_cre_emp_id    ,
"
"                                  epb_cre_date        )
"
"                             VALUES(p_bu            ,                --epb_bu
"
"                                   'EPB'        ,        --epb_pfx
"
"                                   v_batch_no          ,                --epb_batch_no
"
"                                   TRUNC(SYSDATE)      ,                --epb_batch_date
"
"                                   cr0.heaih_pro_action    ,                --epb_action_id
"
"                                   'N'                ,                --epb_action_type
"
"                                   v_profile_action_desc||' PROFILE BATCH.',        --epb_ref
"
"                                   'N'                ,                --epb_status
"
"                                   'N'                ,                --epb_chk_flag
"
"                                   p_user            ,                --epb_cre_by
"
"                                   v_ip_addr        ,                --epb_cre_ip_addr
"
"                                   v_os_user        ,                --epb_cre_os_user
"
"                                   v_cre_emp_id    ,
"
"                                SYSDATE             );
"
"         FOR cr1 IN c1
"
"         LOOP
"
"
"
"          OPEN c2(cr1.heail_emp_id);
"
"           FETCH c2 INTO cr2;
"
"
"
"       IF c2%NOTFOUND THEN
"
"          RAISE_APPLICATION_ERROR(-20827,'HRM'||' ~ Entity : '||p_bu||' ~ Position : '||cr1.heail_emp_id);
"
"       END IF;
"
"
"
"          CLOSE c2;
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
"                 v_cur_mon_gross     := NVL(cr3.ephd_new_mon_gross, cr3.ephd_cur_mon_gross);
"
"              END IF;
"
"
"
"           CLOSE c3;
"
"
"
"           OPEN c8(v_cur_dept_id);
"
"           FETCH c8 INTO cr8;
"
"
"
"           IF c8%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20827,'HRM'||' ~ Entity : '||p_bu||' ~ Department : '||v_dept_id);
"
"           ELSE
"
"              v_dept_id     := cr8.dept_id;
"
"              v_dept_desc   := cr8.dept_name1;
"
"              v_plnt_id     := cr8.dept_plnt;
"
"              v_plnt_desc   := cr8.bup_name1;
"
"              v_loc_id      := cr8.dept_plnt_loc_id;
"
"              v_loc_desc    := cr8.bupld_loc_name;
"
"           END IF;
"
"
"
"           CLOSE c8;
"
"
"
"            v_next_incr_date := ADD_MONTHS(p_date_from,12);
"
"
"
"            --v_profile_no := func_find_hrm_next_id (p_bu, 'EMP_PROFILE');
"
"
"
"            v_profile_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'EP',p_user);
"
"
"
"           -- v_emp_plnt := func_find_plnt_for_dept(p_bu, v_cur_dept_id, p_user);
"
"
"
"            INSERT INTO emp_profiles_hd(ephd_bu                     ,
"
"                                ephd_pfx            ,
"
"                                ephd_doc_no                 ,
"
"                                ephd_prof_batch_no          ,
"
"                                ephd_emp_id             ,
"
"                                ephd_emp_type             ,
"
"                                ephd_action_id              ,
"
"                                ephd_date                ,
"
"                                ephd_eff_date               ,
"
"                                ephd_year                ,
"
"                                ephd_period             ,
"
"                                ephd_cur_plnt         ,
"
"                                ephd_cur_dept_id     ,
"
"                                ephd_cur_dept_name     ,
"
"                                ephd_cur_job_id         ,
"
"                                ephd_cur_job_title     ,
"
"                                ephd_cur_pos_id         ,
"
"                                ephd_cur_pos_name     ,
"
"                                ephd_cur_loc_id         ,
"
"                                ephd_cur_loc_name     ,
"
"                                ephd_cur_grade_id     ,
"
"                                ephd_cur_basic_sal     ,
"
"                                ephd_cur_per_day_wage     ,
"
"                                ephd_cur_mon_gross      ,
"
"                                ephd_new_plnt         ,
"
"                                ephd_new_pos_id          ,
"
"                                ephd_new_pos_name     ,
"
"                                ephd_new_dept_id         ,
"
"                                ephd_new_dept_name     ,
"
"                                ephd_new_job_id          ,
"
"                                ephd_new_job_title     ,
"
"                                ephd_new_loc_id          ,
"
"                                ephd_new_loc_name        ,
"
"                                ephd_new_grade_id        ,
"
"                                ephd_new_basic_sal     ,
"
"                                ephd_new_per_day_wage     ,
"
"                                ephd_new_mon_gross     ,
"
"                                ephd_new_basic_eff_from     ,
"
"                                ephd_next_increment_due     ,
"
"                                ephd_appraisal_method    ,
"
"                                ephd_status                 ,
"
"                                ephd_ref                    ,
"
"                                ephd_cre_by             ,
"
"                                ephd_cre_ip_addr    ,
"
"                                ephd_cre_os_user    ,
"
"                                ephd_cre_emp_id        ,
"
"                                ephd_cre_date               )
"
"                          VALUES(p_bu                 ,                        --ephd_bu
"
"                                 'EP'            ,            --ephd_pfx
"
"                                 v_profile_no             ,                        --ephd_doc_no
"
"                                 v_batch_no          ,                        --ephd_prof_batch_no
"
"                                 cr1.heail_emp_id         ,                        --ephd_emp_id
"
"                                 'F'                 ,                        --ephd_emp_type
"
"                                 cr0.heaih_pro_action            ,                        --ephd_action_id
"
"                                 TRUNC(SYSDATE)              ,                        --ephd_date
"
"                                 p_date_from         ,                        --ephd_eff_date
"
"                                 cr0.heaih_year                     ,                        --ephd_year
"
"                                 cr0.heaih_period                   ,                        --ephd_period
"
"                                 v_cur_emp_plnt         ,                        --ephd_cur_plnt
"
"                                 v_cur_dept_id         ,                        --ephd_cur_dept_id
"
"                                 v_cur_dept_desc         ,                        --ephd_cur_dept_name
"
"                                 v_cur_job_id         ,                        --ephd_cur_job_id
"
"                                 v_cur_job_title         ,                        --ephd_cur_job_title
"
"                                 v_cur_pos_id         ,                        --ephd_cur_pos_id
"
"                                 v_cur_pos_desc         ,                        --ephd_cur_pos_name
"
"                                 v_cur_loc_id         ,                        --ephd_cur_loc_id
"
"                                 v_cur_loc_desc         ,                        --ephd_cur_loc_name
"
"                                 v_cur_grade_id         ,                        --ephd_cur_grade_id
"
"                                 v_cur_basic_sal         ,                        --ephd_cur_basic_sal
"
"                                 v_cur_per_day_wage     ,                        --ephd_cur_per_day_wage
"
"                                 v_cur_mon_gross       ,            --ephd_cur_mon_gross
"
"                                 v_plnt_id         ,                            --ephd_new_plnt
"
"                                 v_cur_pos_id            ,                           --ephd_new_pos_id
"
"                                 v_cur_pos_desc          ,                        --ephd_new_pos_name
"
"                                 v_dept_id             ,                           --ephd_new_dept_id
"
"                                 v_dept_desc         ,                        --ephd_new_dept_name
"
"                                 v_cur_job_id          ,                           --ephd_new_job_id
"
"                                 v_cur_job_title         ,                        --ephd_new_job_title
"
"                                 v_loc_id              ,                           --ephd_new_loc_id
"
"                                 v_loc_desc        ,                           --ephd_new_loc_name
"
"                                 v_cur_grade_id        ,                           --ephd_new_grade_id
"
"                                 cr1.heail_new_basic         ,                        --ephd_new_basic_sal
"
"                                 0             ,                        --ephd_new_per_day_wage
"
"                                 cr1.heail_new_gross,            --ephd_new_mon_gross
"
"                                 p_date_from        ,                        --ephd_new_basic_eff_from
"
"                                 cr0.heaih_nxt_inc_date     ,                        --ephd_next_increment_due
"
"                                 'MBO'             ,                         --ephd_appraisal_method
"
"                                 'E'                    ,                        --ephd_status
"
"                                 v_profile_action_desc||' PROFILE.',                    --ephd_ref
"
"                                 p_user              ,                        --ephd_cre_by
"
"                                 v_ip_addr    ,                --ephd_cre_ip_addr
"
"                                 v_os_user        ,            --ephd_cre_os_user
"
"                                 v_cre_emp_id        ,            --ephd_cre_emp_id
"
"                                 SYSDATE                  );                        --ephd_cre_date
"
"
"
"           FOR cr7 IN c7(cr1.heail_seq_no)
"
"              LOOP
"
"
"
"             OPEN c4(cr7.heaid_elmnt_id);
"
"             FETCH c4 INTO cr4;
"
"
"
"                IF c4%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20844, 'HRM'||cr7.heaid_elmnt_id);
"
"                ELSE
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
"                                      epln_doc_no              ,
"
"                                      epln_plnt              ,
"
"                                      epln_elmnt_id           ,
"
"                                      epln_allow_eff_from       ,
"
"                                      epln_cur_amt           ,
"
"                                      epln_new_amt           ,
"
"                                      epln_end_allowance        ,
"
"                                      epln_reference           ,
"
"                                      epln_cre_by              ,
"
"                                      epln_cre_ip_addr        ,
"
"                                      epln_cre_os_user        ,
"
"                                      epln_cre_emp_id        ,
"
"                                      epln_cre_date           )
"
"                                  VALUES(p_bu              ,        --epln_bu
"
"                                         v_profile_no           ,        --epln_doc_no
"
"                                         v_emp_plnt           ,        --epln_plnt
"
"                                         cr4.pehd_elmnt_id       ,        --epln_elmnt_id
"
"                                          p_date_from         ,         --epln_allow_eff_from
"
"                                        v_cur_allow_amt           ,        --epln_cur_amt
"
"                                        cr7.heaid_new_allow           ,        --epln_new_amt
"
"                                        'N'               ,        --epln_end_allowance
"
"                                        cr4.pehd_desc1           ,        --epln_reference
"
"                                        p_user               ,        --epln_cre_by
"
"                                        v_ip_addr        ,     --epln_cre_ip_addr
"
"                                        v_os_user        ,    --epln_cre_os_user
"
"                                        v_cre_emp_id    ,    --epln_cre_emp_id
"
"                                        SYSDATE           );        --epln_cre_date
"
"
"
"                END IF;
"
"
"
"             CLOSE c4;
"
"
"
"           END LOOP c7;
"
"
"
"           UPDATE emp_profiles_hd
"
"              SET ephd_status   = 'N',
"
"                  ephd_upd_by   = p_user,
"
"                  ephd_upd_ip_addr = v_ip_addr,
"
"                  ephd_upd_os_user = v_os_user,
"
"                  ephd_upd_emp_id  = v_cre_emp_id,
"
"                  ephd_upd_date = SYSDATE
"
"            WHERE ephd_bu     = p_bu
"
"              AND ephd_doc_no = v_profile_no
"
"              AND ephd_status = 'E';
"
"
"
"           UPDATE emp_profiles_hd
"
"              SET ephd_status   = 'A',
"
"                  ephd_upd_by   = p_user,
"
"                  ephd_upd_ip_addr = v_ip_addr,
"
"                  ephd_upd_os_user = v_os_user,
"
"                  ephd_upd_emp_id  = v_cre_emp_id,
"
"                  ephd_upd_date = SYSDATE
"
"            WHERE ephd_bu     = p_bu
"
"              AND ephd_doc_no = v_profile_no
"
"              AND ephd_status = 'N';
"
"
"
"           v_res := 'Y';
"
"
"
"        END LOOP c1;
"
"
"
"        p_res := v_res;
"
"
"
"      END IF;
"
"
"
"   CLOSE c0;
"
"
"
"  END proc_post_emp_incre_mig;
"
"
"
"END pack_emp_increment_mig;"
/
