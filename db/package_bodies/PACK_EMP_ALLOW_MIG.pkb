CREATE OR REPLACE
"PACKAGE BODY        pack_emp_allow_mig
"
"AS
"
"
"
"   PROCEDURE proc_upload_emp_allow_mig(p_bu                VARCHAR2,
"
"                                       p_doc_no                VARCHAR2,
"
"                          p_dir                VARCHAR2,
"
"                          p_file_name            VARCHAR2,
"
"                           p_user                VARCHAR2,
"
"                       p_res             OUT        VARCHAR2)
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
"    WHERE table_name = 'TEMP_EMP_ALLOW_MIG_LN';
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
"   SELECT COUNT(*) v_cnt
"
"     FROM emp_allow_mig_ln
"
"    WHERE eamln_bu     = p_bu
"
"      AND eamln_doc_no = p_doc_no;
"
"
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_result                VARCHAR2(1) := 'N';
"
"      v_exp_flag            VARCHAR2(1) := 'N';
"
"      v_status                VARCHAR2(1) := 'N';
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
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_EMP_ALLOW_MIG_LN';
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
"        FROM emp_allow_mig_ln
"
"       WHERE eamln_bu     = p_bu
"
"         AND eamln_doc_no = p_doc_no;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE temp_emp_allow_mig_ln(teamln_emp_id        VARCHAR2(500),
"
"                                    teamln_elmnt_id        VARCHAR2(500),
"
"                                    teamln_amount        VARCHAR2(500))
"
"                 ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                              DEFAULT DIRECTORY '||p_dir||'
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
"                                  (teamln_emp_id        CHAR(255),
"
"                                   teamln_elmnt_id        CHAR(255),
"
"                                   teamln_amount        CHAR(255)))
"
"                           LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE 'INSERT INTO emp_allow_mig_ln ( eamln_bu,
"
"                            eamln_doc_no,
"
"                            eamln_seq_no,
"
"                            eamln_emp_id,
"
"                            eamln_emp_doj,
"
"                            eamln_elmnt_id,
"
"                            eamln_elmnt_type,
"
"                            eamln_eff_from,
"
"                            eamln_eff_to,
"
"                            eamln_amount,
"
"                            eamln_excep_flag,
"
"                            eamln_ref,
"
"                            eamln_cre_by,
"
"                            eamln_cre_date) (SELECT '|| CHR(39) || p_bu     || CHR(39) ||','
"
"                                         || CHR(39) || p_doc_no || CHR(39) ||',
"
"                                         ROWNUM          ,
"
"                                         teamln_emp_id      ,
"
"                                         NULL          ,
"
"                                         teamln_elmnt_id      ,
"
"                                         ''O''              ,
"
"                                         NULL          ,
"
"                                         NULL          ,
"
"                                         teamln_amount      ,'
"
"                                         || CHR(39) || v_exp_flag || CHR(39) ||',
"
"                                         NULL          ,'
"
"                                         || CHR(39) || p_user || CHR(39) ||',
"
"                                         SYSDATE
"
"                                        FROM temp_emp_allow_mig_ln)';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE temp_emp_allow_mig_ln';
"
"
"
"      UPDATE emp_allow_mig_ln
"
"         SET eamln_emp_id   = TRIM(eamln_emp_id),
"
"            eamln_elmnt_id = TRIM(eamln_elmnt_id),
"
"            eamln_amount   = TRIM(eamln_amount)
"
"       WHERE eamln_bu     = p_bu
"
"         AND eamln_doc_no = p_doc_no;
"
"
"
"      UPDATE emp_allow_mig_ln
"
"         SET eamln_emp_id   = UPPER(eamln_emp_id),
"
"           eamln_elmnt_id = UPPER(eamln_elmnt_id),
"
"           eamln_amount   = UPPER(eamln_amount)
"
"       WHERE eamln_bu     = p_bu
"
"         AND eamln_doc_no = p_doc_no;
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
"   END proc_upload_emp_allow_mig;
"
"
"
"   PROCEDURE proc_emp_allow_mig_excep(p_bu                VARCHAR2,
"
"                         p_doc_no                VARCHAR2,
"
"                         p_user                VARCHAR2,
"
"                         p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_allow_mig_hd
"
"    WHERE eamhd_bu     = p_bu
"
"      AND eamhd_doc_no = p_doc_no
"
"      AND eamhd_status IN ('N');
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
"     FROM emp_allow_mig_ln
"
"    WHERE eamln_bu = p_bu
"
"      AND eamln_doc_no = p_doc_no;
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
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id            VARCHAR2,
"
"             c_elmnt_id            VARCHAR2)
"
"       IS
"
"   SELECT eamln_emp_id,
"
"          eamln_elmnt_id,
"
"          COUNT(*) eamln_cnt
"
"     FROM emp_allow_mig_ln
"
"    WHERE eamln_bu       = p_bu
"
"      AND eamln_doc_no   = p_doc_no
"
"      AND eamln_emp_id   = c_emp_id
"
"      AND eamln_elmnt_id = c_elmnt_id
"
"    GROUP BY eamln_emp_id,
"
"             eamln_elmnt_id
"
"   HAVING COUNT(*) > 1;
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
"     FROM payroll_elements_hd
"
"    WHERE pehd_bu       = p_bu
"
"      AND pehd_elmnt_id = c_elmnt_id
"
"      AND pehd_type     IN ('FL', 'VL', 'CL')
"
"      AND pehd_status   = 'A';
"
"
"
"      cr5                c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_emp_id            VARCHAR2,
"
"             c_elmnt_id            VARCHAR2)
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
"      cr6                c6%ROWTYPE;
"
"
"
"      v_excep                VARCHAR2(4000);
"
"      v_elmnt_type            VARCHAR2(3) := 'O';
"
"      v_date_from            DATE;
"
"      v_date_to                DATE;
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
"            RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"            UPDATE emp_allow_mig_ln
"
"               SET eamln_excep_flag = 'N',
"
"                   eamln_ref        = NULL,
"
"                   eamln_upd_by        = p_user,
"
"                   eamln_upd_date   = SYSDATE
"
"             WHERE eamln_bu = p_bu
"
"               AND eamln_doc_no = p_doc_no;
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
"           v_excep := NULL;
"
"           v_elmnt_type := 'O';
"
"
"
"           IF cr2.eamln_emp_id IS NULL THEN
"
"              v_excep := v_excep||' EMPLOYEE SHOULD NOT BE NULL.';
"
"           END IF;
"
"
"
"           IF cr2.eamln_emp_id IS NOT NULL THEN
"
"
"
"              OPEN c3(cr2.eamln_emp_id);
"
"              FETCH c3 INTO cr3;
"
"
"
"                 IF c3%NOTFOUND THEN
"
"                    v_excep := v_excep||' EMPLOYEE NOT FOUND.';
"
"                 ELSE
"
"
"
"                IF TRUNC(cr3.emp_start_date) <= TRUNC(cr1.eamhd_eff_from) THEN
"
"                   v_date_from := TRUNC(cr1.eamhd_eff_from);
"
"                ELSE
"
"                   v_date_from := TRUNC(cr3.emp_start_date);
"
"                END IF;
"
"
"
"                IF cr3.emp_end_date IS NOT NULL THEN
"
"
"
"                   IF TRUNC(cr3.emp_end_date) >= TRUNC(cr1.eamhd_eff_to) THEN
"
"                      v_date_to := TRUNC(cr1.eamhd_eff_to);
"
"                   ELSE
"
"                      v_date_to := TRUNC(cr3.emp_end_date);
"
"                   END IF;
"
"                ELSE
"
"                   v_date_to := TRUNC(cr1.eamhd_eff_to);
"
"                END IF;
"
"
"
"                UPDATE emp_allow_mig_ln
"
"                   SET eamln_emp_doj  = TRUNC(cr3.emp_start_date),
"
"                   eamln_eff_from = v_date_from,
"
"                   eamln_eff_to   = v_date_to,
"
"                   eamln_upd_by   = p_user,
"
"                   eamln_upd_date = SYSDATE
"
"                 WHERE eamln_bu     = p_bu
"
"                   AND eamln_doc_no = p_doc_no
"
"                   AND eamln_seq_no = cr2.eamln_seq_no;
"
"
"
"                 END IF;
"
"
"
"              CLOSE c3;
"
"
"
"           END IF;
"
"
"
"           IF cr2.eamln_elmnt_id IS NULL THEN
"
"              v_excep := v_excep||' ELEMENT SHOULD NOT BE NULL.';
"
"           END IF;
"
"
"
"           IF cr2.eamln_elmnt_id IS NOT NULL THEN
"
"
"
"              OPEN c5(cr2.eamln_elmnt_id);
"
"              FETCH c5 INTO cr5;
"
"
"
"                 IF c5%NOTFOUND THEN
"
"                    v_excep := v_excep||' ELEMENT NOT FOUND.';
"
"                 ELSE
"
"
"
"                    v_elmnt_type := cr5.pehd_type;
"
"
"
"                UPDATE emp_allow_mig_ln
"
"                   SET eamln_elmnt_type = cr5.pehd_type,
"
"                   eamln_upd_by     = p_user,
"
"                   eamln_upd_date   = SYSDATE
"
"                 WHERE eamln_bu     = p_bu
"
"                   AND eamln_doc_no = p_doc_no
"
"                   AND eamln_seq_no = cr2.eamln_seq_no;
"
"
"
"                 END IF;
"
"
"
"              CLOSE c5;
"
"
"
"           END IF;
"
"
"
"           IF cr2.eamln_emp_id IS NOT NULL AND cr2.eamln_elmnt_id IS NOT NULL THEN
"
"
"
"              OPEN c4(cr2.eamln_emp_id, cr2.eamln_elmnt_id);
"
"              FETCH c4 INTO cr4;
"
"
"
"                 IF c4%FOUND THEN
"
"                    v_excep := v_excep||' SAME EMPLOYEE AND ELEMENT FOUND FOR '||cr4.eamln_cnt||' TIMES.';
"
"                 END IF;
"
"
"
"              CLOSE c4;
"
"
"
"              OPEN c6(cr2.eamln_emp_id, cr2.eamln_elmnt_id);
"
"              FETCH c6 INTO cr6;
"
"
"
"                 IF c6%FOUND THEN
"
"                    v_excep := v_excep||' ELEMENT ALREADY LINKED WITH EMPLOYEE.';
"
"                 END IF;
"
"
"
"              CLOSE c6;
"
"
"
"           END IF;
"
"
"
"           IF cr2.eamln_amount IS NULL THEN
"
"              v_excep := v_excep||' AMOUNT SHOULD NOT BE NULL.';
"
"           END IF;
"
"
"
"           IF cr2.eamln_amount IS NOT NULL THEN
"
"
"
"              IF cr2.eamln_amount < 0 THEN
"
"                 v_excep := v_excep||' AMOUNT SHOULD NOT BE NEGATIVE.';
"
"              END IF;
"
"
"
"              IF cr2.eamln_amount > 0 AND v_elmnt_type IN ('VL', 'CL') THEN
"
"             v_excep := v_excep||' AMOUNT SHOULD BE ZERO FOR VARIABLE/CONDITIONAL ALLOW.';
"
"              END IF;
"
"
"
"              IF cr2.eamln_amount = 0 AND v_elmnt_type IN ('FL') THEN
"
"             v_excep := v_excep||' AMOUNT SHOULD BE GREATER THAN ZERO FOR FIXED ALLOW.';
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"           IF v_excep IS NOT NULL THEN
"
"
"
"                  UPDATE emp_allow_mig_ln
"
"                     SET eamln_excep_flag = 'Y',
"
"                         eamln_ref        = v_excep,
"
"                         eamln_upd_by      = p_user,
"
"                         eamln_upd_date   = SYSDATE
"
"                   WHERE eamln_bu     = p_bu
"
"                     AND eamln_doc_no = p_doc_no
"
"                     AND eamln_seq_no = cr2.eamln_seq_no;
"
"
"
"              v_res := 'Y';
"
"
"
"           END IF;
"
"
"
"            END LOOP c2;
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
"   END proc_emp_allow_mig_excep;
"
"
"
"   PROCEDURE proc_post_emp_allow_mig(p_bu                VARCHAR2,
"
"                        p_doc_no                VARCHAR2,
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
"     FROM emp_allow_mig_hd
"
"    WHERE eamhd_bu     = p_bu
"
"      AND eamhd_doc_no = p_doc_no
"
"      AND eamhd_status IN ('N');
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
"   SELECT empai_emp_id,
"
"         empai_last_prof_no
"
"     FROM emp_allow_mig_ln,
"
"          employees,
"
"          emp_active_infos
"
"    WHERE eamln_bu     = emp_bu
"
"      AND eamln_emp_id = emp_emp_id
"
"      AND emp_bu       = empai_bu
"
"      AND emp_emp_id   = empai_emp_id
"
"      AND eamln_bu     = p_bu
"
"      AND eamln_doc_no = p_doc_no
"
"    GROUP BY empai_emp_id,
"
"             empai_last_prof_no;
"
"
"
"   CURSOR c3(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_allow_mig_ln,
"
"          employees,
"
"          emp_active_infos
"
"    WHERE eamln_bu     = emp_bu
"
"      AND eamln_emp_id = emp_emp_id
"
"      AND emp_bu       = empai_bu
"
"      AND emp_emp_id   = empai_emp_id
"
"      AND eamln_bu     = p_bu
"
"      AND eamln_doc_no = p_doc_no
"
"      AND eamln_emp_id = c_emp_id;
"
"
"
"   CURSOR c4(c_emp_id            VARCHAR2,
"
"            c_last_prof_no        VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_profiles_hd,
"
"          profile_actions
"
"    WHERE ephd_bu        = pact_bu
"
"      AND ephd_action_id   = pact_action_id
"
"      AND ephd_bu        = p_bu
"
"      AND ephd_emp_id      = c_emp_id
"
"      AND ephd_doc_no      = c_last_prof_no
"
"      AND ephd_status      = 'A';
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
"     FROM emp_pyrl_allowances
"
"    WHERE epa_bu     = p_bu
"
"      AND epa_emp_id = c_emp_id
"
"      AND epa_last_prof_no IS NOT NULL;
"
"
"
"      cr5                c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_emp_id            VARCHAR2,
"
"            c_prof_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_pyrl_allowances
"
"    WHERE epa_bu           = p_bu
"
"      AND epa_emp_id       = c_emp_id
"
"      AND epa_last_prof_no = c_prof_no
"
"      AND epa_elmnt_id NOT IN (SELECT epln_elmnt_id
"
"                     FROM emp_profiles_ln
"
"                      WHERE epln_bu       = epa_bu
"
"                        AND epln_doc_no = epa_last_prof_no);
"
"
"
"      v_prof_doc_no            VARCHAR2(15);
"
"      v_res                VARCHAR2(1) := 'N';
"
"      v_excep_res            VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
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
"            v_res := 'N';
"
"
"
"            proc_emp_allow_mig_excep(p_bu,
"
"                        p_doc_no,
"
"                        p_user,
"
"                        v_excep_res);
"
"
"
"        IF v_excep_res = 'N' THEN
"
"
"
"           FOR cr2 IN c2
"
"           LOOP
"
"
"
"              OPEN c4(cr2.empai_emp_id, cr2.empai_last_prof_no);
"
"              FETCH c4 INTO cr4;
"
"
"
"                 IF c4%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20069,'HRM'||'~'||cr2.empai_emp_id);
"
"                 ELSE
"
"
"
"                    IF cr4.pact_action_type = 'N' THEN
"
"
"
"                       OPEN c5(cr2.empai_emp_id);
"
"                       FETCH c5 INTO cr5;
"
"
"
"                          IF cr5.v_cnt = 0 THEN
"
"                             v_prof_doc_no := cr2.empai_last_prof_no;
"
"                          ELSE
"
"                             v_prof_doc_no := NULL;
"
"                          END IF;
"
"
"
"                       CLOSE c5;
"
"
"
"                    ELSE
"
"                       v_prof_doc_no := NULL;
"
"                    END IF;
"
"
"
"                 END IF;
"
"
"
"              CLOSE c4;
"
"
"
"              FOR cr3 IN c3(cr2.empai_emp_id)
"
"              LOOP
"
"
"
"                 INSERT INTO emp_pyrl_allowances(epa_bu                   ,
"
"                                 epa_plnt                 ,
"
"                                 epa_emp_id               ,
"
"                                 epa_elmnt_id             ,
"
"                                 epa_freq_id              ,
"
"                                 epa_start_date           ,
"
"                                 epa_end_date       ,
"
"                                 epa_per_amt              ,
"
"                                 epa_upd_option           ,
"
"                                 epa_last_prof_no         ,
"
"                                 epa_cre_by               ,
"
"                                 epa_cre_date             )
"
"                          VALUES(p_bu                  ,        --epa_bu
"
"                                 cr3.empai_plnt           ,        --epa_plnt
"
"                                   cr3.eamln_emp_id         ,        --epa_emp_id
"
"                                 cr3.eamln_elmnt_id       ,        --epa_elmnt_id
"
"                                 NULL              ,        --epa_freq_id
"
"                                 TRUNC(cr3.eamln_eff_from),        --epa_start_date
"
"                                 TRUNC(cr3.eamln_eff_to)  ,        --epa_end_date
"
"                                 cr3.eamln_amount         ,        --epa_per_amt
"
"                                 'C'           ,        --epa_upd_option
"
"                                 v_prof_doc_no           ,        --epa_last_prof_no
"
"                                 p_user               ,        --epa_cre_by
"
"                                   SYSDATE                  );        --epa_cre_date
"
"                 v_res := 'Y';
"
"
"
"              END LOOP c3;
"
"
"
"              FOR cr6 IN c6(cr2.empai_emp_id, cr2.empai_last_prof_no)
"
"              LOOP
"
"
"
"                 INSERT INTO emp_profiles_ln(epln_bu        ,
"
"                             epln_doc_no        ,
"
"                             epln_elmnt_id        ,
"
"                             epln_new_amt        ,
"
"                             epln_reference        ,
"
"                             epln_allow_eff_from    ,
"
"                             epln_cre_by        ,
"
"                             epln_cre_ip_addr    ,
"
"                             epln_cre_os_user    ,
"
"                             epln_cre_date        )
"
"                      VALUES(p_bu            ,
"
"                          cr6.epa_last_prof_no    ,
"
"                          cr6.epa_elmnt_id    ,
"
"                          cr6.epa_per_amt    ,
"
"                          func_find_emp_pyrl_elmnt_desc(p_bu, cr6.epa_elmnt_id, 1),
"
"                          cr6.epa_start_date    ,
"
"                          p_user            ,
"
"                          v_ip_addr        ,
"
"                          v_os_user        ,
"
"                          SYSDATE        );
"
"
"
"              END LOOP c6;
"
"
"
"           END LOOP c2;
"
"
"
"           UPDATE emp_allow_mig_hd
"
"              SET eamhd_status   = 'P',
"
"                  eamhd_upd_by   = p_user,
"
"                  eamhd_upd_date = SYSDATE
"
"            WHERE eamhd_bu     = p_bu
"
"              AND eamhd_doc_no = p_doc_no
"
"                 AND eamhd_status IN ('N');
"
"
"
"        END IF;
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
"   END proc_post_emp_allow_mig;
"
"
"
"END;"
/
