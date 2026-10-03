CREATE OR REPLACE
"PACKAGE BODY pack_emp_wage_present_days
"
"AS
"
"   PROCEDURE proc_upload_emp_prsnt_days(p_bu                        VARCHAR2,
"
"                                        p_dir                        VARCHAR2,
"
"                                        p_file_name                    VARCHAR2,
"
"                                        p_user                        VARCHAR2,
"
"                                        p_res             OUT            VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT table_name
"
"     FROM user_tables
"
"    WHERE table_name = 'TEMP_EMP_WAGE_PRSNT_DAYS_MIG';
"
"
"
"      cr1            c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT COUNT(*) v_cnt
"
"     FROM wage_emp_prsnt_day_excep
"
"    WHERE wepde_bu = p_bu;
"
"
"
"      cr2            c2%ROWTYPE;
"
"
"
"      v_exp_flag            VARCHAR2(1)  := 'N';
"
"      v_result                VARCHAR2(1)  := 'N';
"
"      v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"
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
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_EMP_WAGE_PRSNT_DAYS_MIG';
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      DELETE wage_emp_prsnt_day_excep
"
"       WHERE wepde_bu = p_bu;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE temp_emp_wage_prsnt_days_mig(tewpdm_emp_id        VARCHAR2(500),
"
"                                           tewpdm_year            VARCHAR2(500),
"
"                                           tewpdm_period        VARCHAR2(500),
"
"                                           tewpdm_days          VARCHAR2(500),
"
"                                           tewpdm_hrs            VARCHAR2(500))
"
"                 ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                               DEFAULT DIRECTORY '||p_dir||'
"
"                        ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                   SKIP 1
"
"                                  FIELDS TERMINATED BY ''|''
"
"                                  MISSING FIELD VALUES ARE NULL
"
"                                  REJECT ROWS WITH ALL NULL FIELDS
"
"                                  (tewpdm_emp_id        CHAR(255),
"
"                                   tewpdm_year            CHAR(255),
"
"                                   tewpdm_period        CHAR(255),
"
"                                   tewpdm_days            CHAR(255),
"
"                                   tewpdm_hrs            CHAR(255)))
"
"                           LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE 'INSERT INTO wage_emp_prsnt_day_excep(wepde_bu            ,
"
"                                  wepde_seq_no        ,
"
"                                  wepde_emp_id        ,
"
"                                  wepde_year          ,
"
"                                  wepde_period        ,
"
"                                  wepde_prsnt_day     ,
"
"                                  wepde_wrkd_hrs      ,
"
"                                  wepde_excep         ,
"
"                                  wepde_excep_flag    ,
"
"                                  wepde_cre_by        ,
"
"                                  wepde_cre_ip_addr   ,
"
"                                  wepde_cre_os_user   ,
"
"                                  wepde_cre_date      ,
"
"                                  wepde_upd_by        ,
"
"                                  wepde_upd_ip_addr   ,
"
"                                  wepde_upd_os_user   ,
"
"                                  wepde_upd_date      ,
"
"                                  wepde_cre_emp_id    ,
"
"                                  wepde_upd_emp_id    )
"
"                                        (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                                ROWNUM          ,
"
"                                                tewpdm_emp_id      ,
"
"                                          NVL(tewpdm_year,0)      ,
"
"                                          NVL(tewpdm_period,0)      ,
"
"                                          NVL(tewpdm_days,0)        ,
"
"                                          NVL(tewpdm_hrs,0)      ,
"
"                                          NULL          ,
"
"                                          '|| CHR(39) || v_exp_flag || CHR(39) ||',
"
"                                          '|| CHR(39) || p_user || CHR(39) ||',
"
"                                          '|| CHR(39) || v_ip_addr || CHR(39) ||',
"
"                                      '|| CHR(39) || v_os_user || CHR(39) ||',
"
"                                                SYSDATE          ,
"
"                                                NULL          ,
"
"                                      NULL          ,
"
"                                      NULL          ,
"
"                                                NULL          ,
"
"                                                NULL          ,
"
"                                                NULL
"
"                                               FROM temp_emp_wage_prsnt_days_mig)';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE temp_emp_wage_prsnt_days_mig';
"
"
"
"      UPDATE wage_emp_prsnt_day_excep
"
"         SET wepde_emp_id    = UPPER(wepde_emp_id),
"
"             wepde_year      = UPPER(wepde_year),
"
"             wepde_period    = UPPER(wepde_period),
"
"             wepde_prsnt_day = UPPER(wepde_prsnt_day),
"
"             wepde_wrkd_hrs  = UPPER(wepde_wrkd_hrs)
"
"       WHERE wepde_bu = p_bu;
"
"
"
"      UPDATE wage_emp_prsnt_day_excep
"
"         SET wepde_emp_id    = TRIM(wepde_emp_id),
"
"             wepde_year      = TRIM(wepde_year),
"
"             wepde_period    = TRIM(wepde_period),
"
"             wepde_prsnt_day = TRIM(wepde_prsnt_day),
"
"             wepde_wrkd_hrs  = TRIM(wepde_wrkd_hrs)
"
"       WHERE wepde_bu = p_bu;
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
"            v_result := 'N';
"
"         ELSE
"
"            v_result := 'Y';
"
"         END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      p_res := v_result;
"
"
"
"   END proc_upload_emp_prsnt_days;
"
"
"
"   PROCEDURE proc_emp_prsnt_days_excep(p_bu                        VARCHAR2,
"
"                                       p_user                        VARCHAR2,
"
"                                       p_res            OUT            VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM wage_emp_prsnt_day_excep
"
"    WHERE wepde_bu = p_bu;
"
"
"
"   CURSOR c2(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees
"
"    WHERE emp_bu = p_bu
"
"      AND emp_emp_id = c_emp_id
"
"      AND emp_type     IN ('S', 'E')
"
"      AND emp_sal_wage IN ('MW', 'DW')
"
"      AND emp_pay_basis = 'W'
"
"      AND emp_status = 'A';
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_year            NUMBER,
"
"            c_period            NUMBER,
"
"            c_clndr_id        VARCHAR2)
"
"       IS
"
"   SELECT (pcp_end_date - pcp_start_date) + 1 pcp_days,
"
"          TRUNC(pcp_start_date) pcp_start_date,
"
"          TRUNC(pcp_end_date) pcp_end_date
"
"     FROM payroll_cal_period
"
"    WHERE pcp_bu = p_bu
"
"      AND (pcp_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND pcp_year = c_year
"
"      AND pcp_period = c_period;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER,
"
"            c_period            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM wage_employees
"
"    WHERE wage_emp_bu = p_bu
"
"      AND wage_emp_id = c_emp_id
"
"      AND wage_emp_year   = c_year
"
"      AND wage_emp_period = c_period;
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
"   SELECT COUNT(*) v_cnt
"
"     FROM wage_emp_prsnt_day_excep
"
"    WHERE wepde_bu = p_bu
"
"      AND wepde_emp_id = c_emp_id
"
"   HAVING COUNT(*) > 1;
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
"     FROM hrm_wage_emp_pyrl_ctrl
"
"    WHERE hwepc_bu = p_bu;
"
"
"
"      cr6                c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_cat_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_wage_emp_cat_wrk_hrs
"
"    WHERE hrwcwh_bu = p_bu
"
"      AND hrwcwh_cat_id = c_cat_id;
"
"
"
"      cr7                c7%ROWTYPE;
"
"
"
"   CURSOR c20
"
"       is
"
"   SELECT COUNT(*) v_excep_cnt
"
"     FROM wage_emp_prsnt_day_excep
"
"    WHERE wepde_bu = p_bu
"
"      AND wepde_excep_flag = 'Y';
"
"
"
"      cr20                c20%ROWTYPE;
"
"
"
"      v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_clndr_id           VARCHAR2(10);
"
"      v_emp_doj               DATE;
"
"      v_start_date           DATE;
"
"      v_end_date           DATE;
"
"      v_days               NUMBER(5);
"
"
"
"   BEGIN
"
"
"
"      UPDATE wage_emp_prsnt_day_excep
"
"         SET wepde_excep        = NULL,
"
"             wepde_upd_by       = p_user,            --added 23-jan-2020 : Ajis
"
"         wepde_upd_ip_addr  = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"         wepde_upd_os_user  = v_os_user,            --added 23-jan-2020 : Ajis
"
"         wepde_upd_date     = SYSDATE,            --added 23-jan-2020 : Ajis
"
"             wepde_excep_flag   = 'N'
"
"       WHERE wepde_bu = p_bu;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"         v_clndr_id   := NULL;
"
"         v_emp_doj    := NULL;
"
"         v_start_date := NULL;
"
"         v_end_date   := NULL;
"
"         v_days          := NULL;
"
"
"
"         IF cr1.wepde_emp_id IS NULL THEN
"
"
"
"            UPDATE wage_emp_prsnt_day_excep
"
"               SET wepde_excep        = wepde_excep||' '||'EMPLOYEE MUST BE ENTERED.',
"
"                   wepde_excep_flag   = 'Y',
"
"                   wepde_upd_by       = p_user,
"
"                wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"               wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                   wepde_upd_date     = SYSDATE
"
"             WHERE wepde_bu     = p_bu
"
"               AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"         END IF;
"
"
"
"         OPEN c2(cr1.wepde_emp_id);
"
"         FETCH c2 INTO cr2;
"
"
"
"            IF c2%NOTFOUND THEN
"
"
"
"               UPDATE wage_emp_prsnt_day_excep
"
"                  SET wepde_excep        = wepde_excep||' '||'EMPLOYEE NOT FOUND.',
"
"                      wepde_excep_flag   = 'Y',
"
"                      wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                      wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                      wepde_upd_date     = SYSDATE
"
"                WHERE wepde_bu     = p_bu
"
"                  AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"            ELSE
"
"                v_clndr_id := cr2.emp_clndr_id;
"
"                v_emp_doj  := TRUNC(cr2.emp_start_date);
"
"            END IF;
"
"
"
"         CLOSE c2;
"
"
"
"
"
"         IF cr1.wepde_prsnt_day IS NULL THEN
"
"
"
"            UPDATE wage_emp_prsnt_day_excep
"
"               SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD NOT BE NULL.',
"
"                   wepde_excep_flag   = 'Y',
"
"                   wepde_upd_by       = p_user,
"
"                wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"               wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                   wepde_upd_date     = SYSDATE
"
"             WHERE wepde_bu     = p_bu
"
"               AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"         END IF;
"
"
"
"         IF cr1.wepde_year IS NULL THEN
"
"
"
"            UPDATE wage_emp_prsnt_day_excep
"
"               SET wepde_excep        = wepde_excep||' '||'YEAR SHOULD NOT BE NULL.',
"
"                   wepde_excep_flag   = 'Y',
"
"                   wepde_upd_by       = p_user,
"
"                wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"               wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                   wepde_upd_date     = SYSDATE
"
"             WHERE wepde_bu     = p_bu
"
"               AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"         END IF;
"
"
"
"         IF cr1.wepde_period IS NULL THEN
"
"
"
"            UPDATE wage_emp_prsnt_day_excep
"
"               SET wepde_excep        = wepde_excep||' '||'PERIOD SHOULD NOT BE NULL.',
"
"                   wepde_excep_flag   = 'Y',
"
"                   wepde_upd_by       = p_user,
"
"                wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"               wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                   wepde_upd_date     = SYSDATE
"
"             WHERE wepde_bu     = p_bu
"
"               AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"         END IF;
"
"
"
"         IF cr1.wepde_year IS NOT NULL AND cr1.wepde_period IS NOT NULL THEN
"
"
"
"            OPEN c3(cr1.wepde_year, cr1.wepde_period, v_clndr_id);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'CALENDAR YEAR/PERIOD NOT FOUND.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                     wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                    wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               ELSE
"
"           IF v_emp_doj <= cr3.pcp_start_date THEN
"
"              v_start_date := cr3.pcp_start_date;
"
"           ELSE
"
"              v_start_date := v_emp_doj;
"
"           END IF;
"
"
"
"                 v_end_date := cr3.pcp_end_date;
"
"                 v_days := (cr3.pcp_end_date - cr3.pcp_start_date)+ 1;
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"         END IF;
"
"
"
"         IF cr1.wepde_year IS NOT NULL AND cr1.wepde_period IS NOT NULL AND cr1.wepde_emp_id IS NOT NULL THEN
"
"
"
"            OPEN c4(cr1.wepde_emp_id, cr1.wepde_year, cr1.wepde_period);
"
"            FETCH c4 INTO cr4;
"
"
"
"               IF c4%FOUND THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'ALREADY DETAILS FOUND FOR THIS EMPLOYEE.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                     wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"            CLOSE c4;
"
"
"
"         END IF;
"
"
"
"         OPEN c5(cr1.wepde_emp_id);
"
"         FETCH c5 INTO cr5;
"
"
"
"            IF c5%FOUND THEN
"
"
"
"               UPDATE wage_emp_prsnt_day_excep
"
"                  SET wepde_excep        = wepde_excep||' '||'DUPLICATE EMPLOYEE DETAILS FOUND.',
"
"                      wepde_excep_flag   = 'Y',
"
"                      wepde_upd_by       = p_user,
"
"                   wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                      wepde_upd_date     = SYSDATE
"
"                WHERE wepde_bu     = p_bu
"
"                  AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"            END IF;
"
"
"
"         CLOSE c5;
"
"
"
"         OPEN c6;
"
"         FETCH c6 INTO cr6;
"
"
"
"            IF c6%NOTFOUND THEN
"
"
"
"               UPDATE wage_emp_prsnt_day_excep
"
"                  SET wepde_excep        = wepde_excep||' '||'WAGE CONTROL NOT DEFINED.',
"
"                      wepde_excep_flag   = 'Y',
"
"                      wepde_upd_by       = p_user,
"
"                   wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                      wepde_upd_date     = SYSDATE
"
"                WHERE wepde_bu     = p_bu
"
"                  AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"            ELSE
"
"
"
"               IF cr6.hwepc_wage_calc_basis = 'WD' AND cr1.wepde_wrkd_hrs > 0 THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'WORKED HOURS SHOULD BE ZERO.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                     wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr1.wepde_prsnt_day > v_days AND cr6.hwepc_wage_calc_basis = 'WD' AND v_days IS NOT NULL THEN
"
"
"
"           UPDATE wage_emp_prsnt_day_excep
"
"              SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD BE BETWEEN 1 AND '||v_days||'.',
"
"              wepde_excep_flag   = 'Y',
"
"              wepde_upd_by       = p_user,
"
"              wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_date     = SYSDATE
"
"            WHERE wepde_bu     = p_bu
"
"              AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr1.wepde_prsnt_day > ((v_end_date - v_start_date) + 1) AND cr6.hwepc_wage_calc_basis = 'WD' AND v_start_date IS NOT NULL AND v_end_date IS NOT NULL THEN
"
"
"
"           UPDATE wage_emp_prsnt_day_excep
"
"              SET wepde_excep        = wepde_excep||' '||'NO. DAYS SHOULD BE BETWEEN 1 AND '||((v_end_date - v_start_date) + 1)||'.',
"
"              wepde_excep_flag   = 'Y',
"
"              wepde_upd_by       = p_user,
"
"              wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_date     = SYSDATE
"
"            WHERE wepde_bu     = p_bu
"
"              AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr6.hwepc_wage_calc_basis = 'WD' AND cr1.wepde_prsnt_day = 0 THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD NOT BE ZERO.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                     wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr6.hwepc_wage_calc_basis = 'WD' AND cr1.wepde_prsnt_day < 0 THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD NOT BE NEGATIVE.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                     wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr6.hwepc_wage_calc_basis = 'WH' AND cr1.wepde_prsnt_day > 0 THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD BE ZERO.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                     wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr1.wepde_wrkd_hrs < 0 AND cr6.hwepc_wage_calc_basis = 'WH' THEN
"
"
"
"           UPDATE wage_emp_prsnt_day_excep
"
"              SET wepde_excep        = wepde_excep||' '||'WORKED HOURS SHOULD NOT BE NEGATIVE.',
"
"              wepde_excep_flag   = 'Y',
"
"              wepde_upd_by       = p_user,
"
"                 wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                 wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_date     = SYSDATE
"
"            WHERE wepde_bu     = p_bu
"
"              AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr1.wepde_wrkd_hrs = 0 AND cr6.hwepc_wage_calc_basis = 'WH' THEN
"
"
"
"           UPDATE wage_emp_prsnt_day_excep
"
"              SET wepde_excep        = wepde_excep||' '||'WORKED HOURS SHOULD NOT BE 0.',
"
"              wepde_excep_flag   = 'Y',
"
"              wepde_upd_by       = p_user,
"
"              wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_date     = SYSDATE
"
"            WHERE wepde_bu     = p_bu
"
"              AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr6.hwepc_wage_calc_basis = 'CW' THEN
"
"
"
"                  OPEN c7(cr2.emp_cat_id);
"
"                  FETCH c7 INTO cr7;
"
"
"
"                     IF c7%NOTFOUND THEN
"
"
"
"                UPDATE wage_emp_prsnt_day_excep
"
"               SET wepde_excep        = wepde_excep||' '||'WAGE CONTROL NOT DEFINED FOR THIS CATEGORY EMPLOYEE.',
"
"                   wepde_excep_flag   = 'Y',
"
"                   wepde_upd_by       = p_user,
"
"                   wepde_upd_ip_addr  = v_ip_addr,
"
"                   wepde_upd_os_user  = v_os_user,
"
"                   wepde_upd_date     = SYSDATE
"
"             WHERE wepde_bu     = p_bu
"
"               AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"                     ELSE
"
"
"
"               IF cr1.wepde_prsnt_day > v_days AND cr6.hwepc_wage_calc_basis = 'WD' AND v_days IS NOT NULL THEN
"
"
"
"           UPDATE wage_emp_prsnt_day_excep
"
"              SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD BE BETWEEN 1 AND '||v_days||'.',
"
"              wepde_excep_flag   = 'Y',
"
"              wepde_upd_by       = p_user,
"
"              wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_date     = SYSDATE
"
"            WHERE wepde_bu     = p_bu
"
"              AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr1.wepde_prsnt_day > ((v_end_date - v_start_date) + 1) AND cr6.hwepc_wage_calc_basis = 'WD' AND v_start_date IS NOT NULL AND v_end_date IS NOT NULL THEN
"
"
"
"           UPDATE wage_emp_prsnt_day_excep
"
"              SET wepde_excep        = wepde_excep||' '||'NO. DAYS SHOULD BE BETWEEN 1 AND '||((v_end_date - v_start_date) + 1)||'.',
"
"              wepde_excep_flag   = 'Y',
"
"              wepde_upd_by       = p_user,
"
"              wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"              wepde_upd_date     = SYSDATE
"
"            WHERE wepde_bu     = p_bu
"
"              AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"
"
"               IF cr6.hwepc_wage_calc_basis = 'WD' AND cr1.wepde_prsnt_day = 0 THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD NOT BE ZERO.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                     wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"               IF cr6.hwepc_wage_calc_basis = 'WD' AND cr1.wepde_prsnt_day < 0 THEN
"
"
"
"                  UPDATE wage_emp_prsnt_day_excep
"
"                     SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD NOT BE NEGATIVE.',
"
"                         wepde_excep_flag   = 'Y',
"
"                         wepde_upd_by       = p_user,
"
"                      wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                     wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                         wepde_upd_date     = SYSDATE
"
"                   WHERE wepde_bu     = p_bu
"
"                     AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"               END IF;
"
"
"
"                IF cr7.hrwcwh_calc_type = 'WD' AND cr1.wepde_wrkd_hrs > 0 THEN
"
"
"
"               UPDATE wage_emp_prsnt_day_excep
"
"                  SET wepde_excep        = wepde_excep||' '||'WORKED HOURS SHOULD BE ZERO.',
"
"                  wepde_excep_flag   = 'Y',
"
"                  wepde_upd_by       = p_user,
"
"                  wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_date     = SYSDATE
"
"                WHERE wepde_bu     = p_bu
"
"                  AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"                END IF;
"
"
"
"            IF cr1.wepde_wrkd_hrs < 0 AND cr7.hrwcwh_calc_type = 'WH' THEN
"
"
"
"               UPDATE wage_emp_prsnt_day_excep
"
"                  SET wepde_excep        = wepde_excep||' '||'WORKED HOURS SHOULD NOT BE NEGATIVE.',
"
"                  wepde_excep_flag   = 'Y',
"
"                  wepde_upd_by       = p_user,
"
"                  wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_date     = SYSDATE
"
"                WHERE wepde_bu     = p_bu
"
"                  AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"                        END IF;
"
"
"
"                        IF cr1.wepde_wrkd_hrs = 0 AND cr7.hrwcwh_calc_type = 'WH' THEN
"
"
"
"               UPDATE wage_emp_prsnt_day_excep
"
"                  SET wepde_excep        = wepde_excep||' '||'WORKED HOURS SHOULD NOT BE 0.',
"
"                  wepde_excep_flag   = 'Y',
"
"                  wepde_upd_by       = p_user,
"
"                  wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_date     = SYSDATE
"
"                WHERE wepde_bu     = p_bu
"
"                  AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"                        END IF;
"
"
"
"                IF cr7.hrwcwh_calc_type = 'WH' AND cr1.wepde_prsnt_day > 0 THEN
"
"
"
"               UPDATE wage_emp_prsnt_day_excep
"
"                  SET wepde_excep        = wepde_excep||' '||'PRESENT DAYS SHOULD BE ZERO.',
"
"                   wepde_excep_flag   = 'Y',
"
"                   wepde_upd_by       = p_user,
"
"                   wepde_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                   wepde_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                  wepde_upd_date     = SYSDATE
"
"                WHERE wepde_bu     = p_bu
"
"                  AND wepde_seq_no = cr1.wepde_seq_no;
"
"
"
"                END IF;
"
"
"
"                     END IF;
"
"
"
"                  CLOSE c7;
"
"
"
"               END IF;
"
"
"
"            END IF;
"
"
"
"         CLOSE c6;
"
"
"
"      END LOOP c1;
"
"
"
"      OPEN c20;
"
"      FETCH c20 INTO cr20;
"
"
"
"         IF cr20.v_excep_cnt > 0 THEN
"
"            p_res := 'Y';
"
"         ELSE
"
"            p_res := 'N';
"
"         END IF;
"
"
"
"      CLOSE c20;
"
"
"
"   END proc_emp_prsnt_days_excep;
"
"
"
"   PROCEDURE proc_ins_emp_prsnt_days(p_bu                VARCHAR2,
"
"                        p_user                VARCHAR2,
"
"                        p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM wage_emp_prsnt_day_excep
"
"    WHERE wepde_bu = p_bu
"
"      AND wepde_excep_flag = 'Y';
"
"
"
"      cr1            c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM wage_emp_prsnt_day_excep
"
"    WHERE wepde_bu = p_bu
"
"      AND wepde_excep_flag = 'N';
"
"
"
"      v_res                VARCHAR2(1) := 'N';
"
"      v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
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
"            RAISE_APPLICATION_ERROR(-20999,'HRM');
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
"         INSERT INTO wage_employees(wage_emp_bu        ,
"
"                                    wage_emp_id        ,
"
"                                    wage_no_of_days    ,
"
"                                    wage_wrkd_hrs    ,
"
"                                    wage_emp_year    ,
"
"                                    wage_emp_period    ,
"
"                                    wage_emp_cre_by    ,
"
"                    wage_emp_cre_ip_addr,    --added 23-jan-2020 : Ajis
"
"                    wage_emp_cre_os_user,       --added 23-jan-2020 : Ajis
"
"                                    wage_emp_cre_date    ,
"
"                                    wage_mon_type    ,
"
"                                    wage_ot_hrs        )
"
"                 VALUES(p_bu        ,    --wage_emp_bu
"
"                    cr2.wepde_emp_id    ,    --wage_emp_id
"
"                    cr2.wepde_prsnt_day    ,    --wage_no_of_days
"
"                    cr2.wepde_wrkd_hrs    ,    --wage_no_of_days
"
"                    cr2.wepde_year    ,    --wage_emp_year
"
"                    cr2.wepde_period    ,    --wage_emp_period
"
"                    p_user        ,    --wage_emp_cre_by
"
"                    v_ip_addr        ,     --wage_emp_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                    v_os_user        ,     --wage_emp_cre_os_user        --added 23-jan-2020 : Ajis
"
"                    SYSDATE        ,    --wage_emp_cre_date
"
"                    'N'            ,    --wage_mon_type
"
"                    0            );    --wage_ot_hrs
"
"
"
"     v_res := 'Y';
"
"
"
"      END LOOP c2;
"
"
"
"      IF v_res = 'Y' THEN
"
"
"
"         DELETE wage_emp_prsnt_day_excep
"
"          WHERE wepde_bu = p_bu;
"
"
"
"      END IF;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_ins_emp_prsnt_days;
"
"
"
"END pack_emp_wage_present_days;"
/
