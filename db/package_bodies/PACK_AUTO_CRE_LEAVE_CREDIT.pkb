CREATE OR REPLACE
"PACKAGE BODY        pack_auto_cre_leave_credit
"
"AS
"
"
"
"   PROCEDURE proc_upd_ftc_emp_doj(p_bu                    VARCHAR2,
"
"                      p_emp_id                VARCHAR2,
"
"                      p_emp_doj                DATE,
"
"                      p_prob_eff_from            DATE,
"
"                      p_prob_eff_to                DATE,
"
"                      p_cat_id                VARCHAR2            DEFAULT NULL,
"
"                      p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT leavepfx_pfx_id
"
"     FROM leave_prefixes
"
"    WHERE leavepfx_bu   = p_bu
"
"      AND leavepfx_oper = '+';
"
"
"
"      cr1                        c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM leaves
"
"    WHERE leave_bu              = p_bu
"
"      AND leave_type            = 'A'
"
"      AND leave_auto_credit    = 'Y'
"
"      AND leave_ft_credit_opt  = 'A'
"
"      AND leave_ft_credit_freq = 'S'
"
"      AND (leave_credit_days    > 0 OR leave_credit_cat_mode = 'C')
"
"      AND EXISTS (SELECT 1
"
"                  FROM emp_leave_entlmnts
"
"                 WHERE ele_bu        = leave_bu
"
"                   AND ele_leave_id  = leave_leave_id
"
"                   AND ele_bnfcry_id = p_emp_id
"
"                   AND ele_last_accrued_date IS NULL);
"
"
"
"   CURSOR c3(c_leave_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM leave_credit_cat_mode
"
"    WHERE lccm_bu     = p_bu
"
"      AND lccm_cat_id = p_cat_id
"
"      AND lccm_leave  = c_leave_id;
"
"
"
"      cr3                        c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_start_date                DATE)
"
"       IS
"
"   SELECT pcp_year,
"
"          pcp_period
"
"     FROM payroll_cal_year,
"
"          payroll_cal_period
"
"    WHERE pcy_bu   = pcp_bu
"
"      AND pcy_year = pcp_year
"
"      AND pcp_bu   = p_bu
"
"      AND TRUNC(c_start_date) BETWEEN TRUNC(pcp_start_date) AND TRUNC(pcp_end_date);
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"   CURSOR c5
"
"       IS
"
"   SELECT LENGTH(MAX(pcp_year)) pcp_year_len
"
"     FROM payroll_cal_year,
"
"          payroll_cal_period
"
"    WHERE pcy_bu   = pcp_bu
"
"      AND pcy_year = pcp_year
"
"      AND pcp_bu   = p_bu;
"
"
"
"      cr5                c5%ROWTYPE;
"
"
"
"
"
"      v_leave_pfx                    VARCHAR2(10);
"
"      v_leave_priority                    NUMBER(5);
"
"      v_year                        NUMBER(7);
"
"      v_period                        NUMBER(2);
"
"      v_leave_doc_no                    VARCHAR2(30);
"
"      v_emp_doj_date                    NUMBER(2);
"
"      v_leave_crdt_date                    NUMBER(2);
"
"      v_act_crdt_days                    NUMBER(7, 3) := 0;
"
"      v_crdt_date                    DATE;
"
"      v_credit_days                    NUMBER(7, 3) := 0;
"
"      v_prob_credit_days                NUMBER(7, 3) := 0;
"
"
"
"      v_ctrl_prob_crdt_days                NUMBER(7, 2) := 0;
"
"      v_ctrl_crdt_days                    NUMBER(7, 2) := 0;
"
"
"
"      v_ip_addr                        VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                        VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id                    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
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
"            RAISE_APPLICATION_ERROR(-20945, 'HRM');
"
"         ELSE
"
"            v_leave_pfx := cr1.leavepfx_pfx_id;
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
"      IF  cr2.leave_credit_cat_mode = 'U' THEN
"
"          v_crdt_date        := cr2.leave_credit_date;
"
"          v_credit_days      := cr2.leave_credit_days;
"
"          v_prob_credit_days := cr2.leave_prob_credit_days;
"
"      ELSE
"
"
"
"         OPEN c3(cr2.leave_leave_id);
"
"         FETCH c3 INTO cr3;
"
"
"
"            IF c3%NOTFOUND THEN
"
"               --RAISE_APPLICATION_ERROR(-20193,'HRM'||p_emp_id||'~'||p_cat_id);
"
"               v_crdt_date  := NULL;
"
"               v_credit_days := 0;
"
"               v_prob_credit_days := 0;
"
"            ELSE
"
"               v_crdt_date        := cr3.lccm_credit_date;
"
"               v_credit_days      := cr3.lccm_credit_days;
"
"               v_prob_credit_days := cr3.lccm_prob_credit_days;
"
"            END IF;
"
"
"
"         CLOSE c3;
"
"
"
"      END IF;
"
"
"
"         OPEN c4(TRUNC(p_emp_doj));
"
"         FETCH c4 INTO cr4;
"
"
"
"            IF c4%NOTFOUND THEN
"
"
"
"               OPEN c5;
"
"               FETCH c5 INTO cr5;
"
"
"
"                  IF c5%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20951,'HRM'||'~'||p_bu);
"
"                  ELSE
"
"
"
"                     IF cr5.pcp_year_len >= 6 THEN
"
"
"
"                        v_year   := CASE WHEN TO_CHAR(p_emp_doj, 'MM') < 4 THEN
"
"                              TO_CHAR(p_emp_doj, 'RRRR') - 1||TO_CHAR(p_emp_doj, 'RR')
"
"                         ELSE
"
"                              TO_CHAR(p_emp_doj, 'RRRR')||(TO_CHAR(p_emp_doj, 'RR') + 1)
"
"                         END;
"
"
"
"                        v_period := CASE WHEN TO_CHAR(p_emp_doj, 'MM') >= 4 THEN
"
"                         (TO_NUMBER(TO_CHAR(p_emp_doj, 'MM')) - 3)
"
"                         ELSE
"
"                             (9 + TO_NUMBER(TO_CHAR(p_emp_doj, 'MM')))
"
"                         END;
"
"                 ELSE
"
"                    v_year   := TO_CHAR(p_emp_doj, 'RRRR');
"
"                    v_period := TO_NUMBER(TO_CHAR(p_emp_doj, 'MM'));
"
"                 END IF;
"
"
"
"                  END IF;
"
"
"
"               CLOSE c5;
"
"
"
"            ELSE
"
"               v_year   := cr4.pcp_year;
"
"               v_period := cr4.pcp_period;
"
"            END IF;
"
"
"
"         CLOSE c4;
"
"
"
"      /*
"
"      proc_find_pyrl_cal_year_period(p_bu,
"
"                          TRUNC(p_emp_doj),
"
"                          v_year,
"
"                          v_period);*/
"
"
"
"    IF v_crdt_date IS NOT NULL AND v_credit_days > 0  AND v_prob_credit_days > 0 THEN
"
"
"
"     v_leave_crdt_date := NVL(TO_CHAR(v_crdt_date, 'DD'), TO_CHAR(p_emp_doj, 'DD'));
"
"     v_emp_doj_date    := TO_CHAR(p_emp_doj, 'DD');
"
"
"
"     /* Check Employee in Probation Period */
"
"
"
"     /*
"
"     IF cr2.leave_per_credit_opt = 'A' AND cr2.leave_credit_basis = 'Y' THEN
"
"        v_ctrl_prob_crdt_days :=
"
"     ELSE
"
"     END IF;*/
"
"
"
"     IF p_prob_eff_from IS NOT NULL AND p_prob_eff_to IS NOT NULL THEN
"
"
"
"        IF TRUNC(p_emp_doj) BETWEEN p_prob_eff_from AND p_prob_eff_to THEN
"
"
"
"           IF v_emp_doj_date > v_leave_crdt_date THEN
"
"              v_act_crdt_days := NVL(NVL(v_prob_credit_days, 0)/2, 0);
"
"           ELSE
"
"              v_act_crdt_days := NVL(NVL(v_prob_credit_days, 0), 0);
"
"           END IF;
"
"
"
"        ELSE
"
"
"
"           IF v_emp_doj_date > v_leave_crdt_date THEN
"
"              v_act_crdt_days := NVL(NVL(v_credit_days, 0)/2, 0);
"
"           ELSE
"
"              v_act_crdt_days := NVL(NVL(v_credit_days, 0), 0);
"
"           END IF;
"
"
"
"        END IF;
"
"
"
"     ELSE
"
"
"
"        IF v_emp_doj_date > v_leave_crdt_date THEN
"
"           v_act_crdt_days := NVL(NVL(v_credit_days, 0)/2, 0);
"
"        ELSE
"
"           v_act_crdt_days := NVL(NVL(v_credit_days, 0), 0);
"
"        END IF;
"
"
"
"     END IF;
"
"
"
"         UPDATE emp_leave_cur_bal
"
"            SET emplcb_cur_bal     = v_act_crdt_days,
"
"                emplcb_upd_by      = p_user,
"
"                emplcb_upd_ip_addr = v_ip_addr,
"
"                emplcb_upd_os_user = v_os_user,
"
"                emplcb_upd_date    = SYSDATE
"
"          WHERE emplcb_bu       = p_bu
"
"            AND emplcb_emp_id   = p_emp_id
"
"            AND emplcb_leave_id = cr2.leave_leave_id;
"
"
"
"         IF SQL%FOUND THEN
"
"
"
"         --v_leave_doc_no := func_find_hrm_next_id(p_bu, 'EMP_LEAVE');
"
"
"
"         v_leave_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'LE',p_user);
"
"
"
"            INSERT INTO employee_leaves(empleave_bu        ,
"
"                        empleave_plnt        ,
"
"                        empleave_pfx        ,
"
"                        empleave_doc_no        ,
"
"                        empleave_extn_flag    ,
"
"                        empleave_type        ,
"
"                        empleave_emp_id        ,
"
"                        empleave_leave_id    ,
"
"                        empleave_pfx_id        ,
"
"                        empleave_oper        ,
"
"                        empleave_year        ,
"
"                        empleave_period        ,
"
"                        empleave_applied_days    ,
"
"                        empleave_apprvd_days    ,
"
"                        empleave_start_date    ,
"
"                        empleave_end_date    ,
"
"                        empleave_prep_payroll    ,
"
"                        empleave_status        ,
"
"                        empleave_coff        ,
"
"                        empleave_is_late    ,
"
"                        empleave_is_ltc        ,
"
"                        empleave_req_date    ,
"
"                        empleave_briefdesc    ,
"
"                        empleave_chk_flag    ,
"
"                        empleave_jrnl_flag    ,
"
"                        empleave_encash_amt    ,
"
"                        empleave_layoff        ,
"
"                        empleave_adj_source    ,
"
"                        empleave_adj_year    ,
"
"                        empleave_adj_period    ,
"
"                        empleave_cre_by        ,
"
"                        empleave_cre_ip_addr    ,
"
"                    empleave_cre_os_user    ,
"
"                    empleave_cre_emp_id    ,
"
"                        empleave_cre_date    )
"
"                 VALUES(p_bu            ,            --empleave_bu,
"
"                        NULL            ,            --empleave_plnt,
"
"                        'LE'        ,        --empleave_pfx
"
"                        v_leave_doc_no        ,            --empleave_doc_no,
"
"                        'N'            ,            --empleave_extn_flag,
"
"                        'A'            ,            --empleave_type,
"
"                        p_emp_id        ,            --empleave_emp_id,
"
"                        cr2.leave_leave_id    ,            --empleave_leave_id,
"
"                        v_leave_pfx        ,            --empleave_pfx_id,
"
"                        '+'            ,            --empleave_oper,
"
"                        v_year            ,            --empleave_year,
"
"                        v_period        ,            --empleave_period,
"
"                        NULL            ,            --empleave_applied_days,
"
"                        v_act_crdt_days        ,            --empleave_apprvd_days,
"
"                        TRUNC(p_emp_doj)    ,            --empleave_start_date,
"
"                        (TRUNC(p_emp_doj) + v_act_crdt_days),        --empleave_end_date,
"
"                        'N'            ,            --empleave_prep_payroll,
"
"                        'P'            ,            --empleave_status,
"
"                        'N'            ,            --empleave_coff,
"
"                        'N'            ,            --empleave_is_late,
"
"                        'N'            ,            --empleave_is_ltc,
"
"                        TRUNC(p_emp_doj)    ,            --empleave_req_date,
"
"                        cr2.leave_leave_id||'-'||cr2.leave_desc1||' AUTO LEAVE BALANCE CREDIT FROM EMPLOYEE START.',    --empleave_briefdesc,
"
"                        'N'            ,            --empleave_chk_flag,
"
"                        'N'            ,            --empleave_jrnl_flag,
"
"                        0            ,            --empleave_encash_amt,
"
"                        'N'            ,            --empleave_layoff
"
"                        'FTC'            ,            --empleave_adj_source
"
"                        v_year            ,            --empleave_adj_year
"
"                        v_period        ,            --empleave_adj_period
"
"                        p_user            ,            --empleave_cre_by,
"
"                        v_ip_addr        ,            --empleave_cre_ip_addr
"
"                    v_os_user        ,            --empleave_cre_os_user
"
"                    v_cre_emp_id        ,            --empleave_cre_emp_id
"
"                        SYSDATE            );            --empleave_cre_date
"
"
"
"        UPDATE emp_leave_entlmnts
"
"           SET ele_last_accrued_date = TRUNC(p_emp_doj),
"
"               ele_upd_by      = p_user,
"
"               ele_upd_ip_addr = v_ip_addr,
"
"           ele_upd_os_user = v_os_user,
"
"               ele_upd_date  = SYSDATE
"
"         WHERE ele_bu        = p_bu
"
"           AND ele_bnfcry_id = p_emp_id
"
"           AND ele_leave_id  = cr2.leave_leave_id;
"
"
"
"         END IF;
"
"
"
"      END IF;
"
"
"
"      END LOOP c2;
"
"
"
"   END proc_upd_ftc_emp_doj;
"
"
"
"   PROCEDURE proc_upd_ftc_emp_prob_comp(p_bu                    VARCHAR2,
"
"                         p_emp_id                VARCHAR2,
"
"                     p_user                    VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT leavepfx_pfx_id
"
"     FROM leave_prefixes
"
"    WHERE leavepfx_bu   = p_bu
"
"      AND leavepfx_oper = '+';
"
"
"
"      cr1                        c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM leaves
"
"    WHERE leave_bu              = p_bu
"
"      AND leave_type            = 'A'
"
"      AND leave_auto_credit    = 'Y'
"
"      AND leave_ft_credit_opt  = 'A'
"
"      AND leave_ft_credit_freq = 'P'
"
"      AND (leave_credit_days    > 0 OR leave_credit_cat_mode = 'C')
"
"      AND EXISTS (SELECT 1
"
"                  FROM emp_leave_entlmnts
"
"                 WHERE ele_bu        = leave_bu
"
"                   AND ele_leave_id  = leave_leave_id
"
"                   AND ele_bnfcry_id = p_emp_id
"
"                   AND ele_last_accrued_date IS NULL);
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM employees
"
"    WHERE emp_bu     = p_bu
"
"      AND emp_emp_id = p_emp_id;
"
"
"
"      cr3                        c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_leave_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          leave_credit_cat_mode
"
"    WHERE emp_bu = lccm_bu
"
"      AND emp_cat_id = lccm_cat_id
"
"      AND emp_bu = p_bu
"
"      AND emp_emp_id = p_emp_id
"
"      AND lccm_leave = c_leave_id;
"
"
"
"      cr4                        c4%ROWTYPE;
"
"
"
"      v_leave_pfx                    VARCHAR2(10);
"
"      v_leave_priority                    NUMBER(5);
"
"      v_year                        NUMBER(7);
"
"      v_period                        NUMBER(2);
"
"      v_leave_doc_no                    VARCHAR2(30);
"
"      v_credit_days                    NUMBER(7, 3) := 0;
"
"      v_act_crdt_days                    NUMBER(7, 3) := 0;
"
"      v_credit_date                    DATE;
"
"      v_emp_prob_end_date                DATE;
"
"      v_prob_comp_date                    NUMBER(2);
"
"      v_leave_crdt_date                    NUMBER(2);
"
"      v_emp_clndr_id                    VARCHAR2(10);
"
"
"
"      v_ip_addr                        VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                        VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id                    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
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
"            RAISE_APPLICATION_ERROR(-20945, 'HRM');
"
"         ELSE
"
"            v_leave_pfx := cr1.leavepfx_pfx_id;
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      OPEN c3;
"
"      FETCH c3 INTO cr3;
"
"
"
"         IF c3%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20821, 'HRM'||p_emp_id);
"
"         ELSE
"
"
"
"            IF cr3.emp_prob_end_date IS NULL THEN
"
"               RAISE_APPLICATION_ERROR(-20081, 'HRM'||p_emp_id);
"
"            END IF;
"
"
"
"            v_emp_prob_end_date := TRUNC(cr3.emp_prob_end_date);
"
"            v_emp_clndr_id := cr3.emp_clndr_id;
"
"
"
"         END IF;
"
"
"
"      CLOSE c3;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"         IF cr2.leave_credit_cat_mode = 'U' THEN
"
"
"
"            v_credit_days := cr2.leave_credit_days;
"
"            v_credit_date := cr2.leave_credit_date;
"
"
"
"         ELSE
"
"
"
"            OPEN c4(cr2.leave_leave_id);
"
"            FETCH c4 INTO cr4;
"
"
"
"               IF c4%NOTFOUND THEN
"
"                  --RAISE_APPLICATION_ERROR(-20193, 'HRM'||cr2.leave_leave_id||'~'||p_emp_id);
"
"                  v_credit_days := 0;
"
"                  v_credit_date := null;
"
"               ELSE
"
"                  v_credit_days := cr4.lccm_credit_days;
"
"                  v_credit_date := cr4.lccm_credit_date;
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
"      proc_find_pyrl_cal_year_period(p_bu,
"
"                          TRUNC(v_emp_prob_end_date),
"
"                          v_year,
"
"                          v_period,
"
"                          v_emp_clndr_id);
"
"
"
"     IF v_credit_days > 0 AND v_credit_date IS NOT NULL THEN
"
"
"
"     v_leave_crdt_date := NVL(TO_CHAR(v_credit_date, 'DD'), TO_CHAR(v_emp_prob_end_date, 'DD'));
"
"     v_prob_comp_date  := TO_CHAR(v_emp_prob_end_date, 'DD');
"
"
"
"     IF v_prob_comp_date > v_leave_crdt_date THEN
"
"        v_act_crdt_days := NVL(NVL(v_credit_days, 0), 0)/2;
"
"     ELSE
"
"        v_act_crdt_days := NVL(NVL(v_credit_days, 0), 0);
"
"     END IF;
"
"
"
"         UPDATE emp_leave_cur_bal
"
"            SET emplcb_cur_bal     = v_act_crdt_days,
"
"                emplcb_upd_by      = p_user,
"
"                emplcb_upd_ip_addr = v_ip_addr,
"
"                emplcb_upd_os_user = v_os_user,
"
"                emplcb_upd_date    = SYSDATE
"
"          WHERE emplcb_bu       = p_bu
"
"            AND emplcb_emp_id   = p_emp_id
"
"            AND emplcb_leave_id = cr2.leave_leave_id;
"
"
"
"         IF SQL%FOUND THEN
"
"
"
"         --v_leave_doc_no := func_find_hrm_next_id(p_bu, 'EMP_LEAVE');
"
"
"
"         v_leave_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'LE',p_user);
"
"
"
"            INSERT INTO employee_leaves(empleave_bu        ,
"
"                        empleave_plnt        ,
"
"                        empleave_pfx        ,
"
"                        empleave_doc_no        ,
"
"                        empleave_extn_flag    ,
"
"                        empleave_type        ,
"
"                        empleave_emp_id        ,
"
"                        empleave_leave_id    ,
"
"                        empleave_pfx_id        ,
"
"                        empleave_oper        ,
"
"                        empleave_year        ,
"
"                        empleave_period        ,
"
"                        empleave_applied_days    ,
"
"                        empleave_apprvd_days    ,
"
"                        empleave_start_date    ,
"
"                        empleave_end_date    ,
"
"                        empleave_prep_payroll    ,
"
"                        empleave_status        ,
"
"                        empleave_coff        ,
"
"                        empleave_is_late    ,
"
"                        empleave_is_ltc        ,
"
"                        empleave_req_date    ,
"
"                        empleave_briefdesc    ,
"
"                        empleave_chk_flag    ,
"
"                        empleave_jrnl_flag    ,
"
"                        empleave_encash_amt    ,
"
"                        empleave_layoff        ,
"
"                        empleave_adj_source    ,
"
"                        empleave_adj_year    ,
"
"                        empleave_adj_period    ,
"
"                        empleave_cre_by        ,
"
"                        empleave_cre_ip_addr    ,
"
"                        empleave_cre_os_user    ,
"
"                        empleave_cre_emp_id    ,
"
"                        empleave_cre_date    )
"
"                 VALUES(p_bu            ,                --empleave_bu,
"
"                        NULL            ,                --empleave_plnt,
"
"                        'LE'        ,         --empleave_pfx
"
"                        v_leave_doc_no        ,                --empleave_doc_no,
"
"                        'N'            ,                --empleave_extn_flag,
"
"                        'A'            ,                --empleave_type,
"
"                        p_emp_id        ,                --empleave_emp_id,
"
"                        cr2.leave_leave_id    ,                --empleave_leave_id,
"
"                        v_leave_pfx        ,                --empleave_pfx_id,
"
"                        '+'            ,                --empleave_oper,
"
"                        v_year            ,                --empleave_year,
"
"                        v_period        ,                --empleave_period,
"
"                        NULL            ,                --empleave_applied_days,
"
"                        v_credit_days        ,                --empleave_apprvd_days,
"
"                        TRUNC(v_emp_prob_end_date),                --empleave_start_date,
"
"                        (TRUNC(v_emp_prob_end_date) + v_credit_days),        --empleave_end_date,
"
"                        'N'            ,                --empleave_prep_payroll,
"
"                        'P'            ,                --empleave_status,
"
"                        'N'            ,                --empleave_coff,
"
"                        'N'            ,                --empleave_is_late,
"
"                        'N'            ,                --empleave_is_ltc,
"
"                        TRUNC(v_emp_prob_end_date),                --empleave_req_date,
"
"                        cr2.leave_leave_id||'-'||cr2.leave_desc1||' AUTO LEAVE BALANCE CREDIT FROM EMPLOYEE PROBATION COMPLETION.',    --empleave_briefdesc,
"
"                        'N'            ,                --empleave_chk_flag,
"
"                        'N'            ,                --empleave_jrnl_flag,
"
"                        0            ,                --empleave_encash_amt,
"
"                        'N'            ,                --empleave_layoff
"
"                        'FTC'            ,                --empleave_adj_source
"
"                        v_year            ,                --empleave_adj_year
"
"                        v_period        ,                --empleave_adj_period
"
"                        p_user            ,                --empleave_cre_by,
"
"                    v_ip_addr        ,                --empleave_cre_ip_addr
"
"                    v_os_user        ,                --empleave_cre_os_user
"
"                    v_cre_emp_id        ,                --empleave_cre_emp_id
"
"                        SYSDATE            );                --empleave_cre_date
"
"
"
"        UPDATE emp_leave_entlmnts
"
"           SET ele_last_accrued_date = TRUNC(v_emp_prob_end_date),
"
"               ele_upd_by      = p_user,
"
"               ele_upd_ip_addr = v_ip_addr,
"
"           ele_upd_os_user = v_os_user,
"
"               ele_upd_date    = SYSDATE
"
"         WHERE ele_bu        = p_bu
"
"           AND ele_bnfcry_id = p_emp_id
"
"           AND ele_leave_id  = cr2.leave_leave_id;
"
"
"
"         END IF;
"
"
"
"      END IF;
"
"
"
"      END LOOP c2;
"
"
"
"      UPDATE employees
"
"         SET emp_prob_period_status = 'C',
"
"             emp_upd_by      = p_user,
"
"         emp_upd_ip_addr = v_ip_addr,
"
"           emp_upd_os_user = v_os_user,
"
"             emp_upd_date    = SYSDATE
"
"       WHERE emp_bu     = p_bu
"
"         AND emp_emp_id = p_emp_id;
"
"
"
"   END proc_upd_ftc_emp_prob_comp;
"
"
"
"   PROCEDURE proc_upd_ftc_emp_year_comp(p_bu                    VARCHAR2,
"
"                         p_emp_id                VARCHAR2,
"
"                         p_year                    NUMBER,
"
"                         p_period                NUMBER,
"
"                     p_user                    VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT leavepfx_pfx_id
"
"     FROM leave_prefixes
"
"    WHERE leavepfx_bu   = p_bu
"
"      AND leavepfx_oper = '+';
"
"
"
"      cr1                        c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT leave_leave_id,
"
"      leave_desc1,
"
"      leave_credit_freq,
"
"          leave_credit_date,
"
"          leave_credit_days,
"
"          leave_credit_cat_mode,
"
"      'FC' leave_credit_type
"
"     FROM leaves
"
"    WHERE leave_bu              = p_bu
"
"      AND leave_type            = 'A'
"
"      AND leave_auto_credit    = 'Y'
"
"      AND leave_ft_credit_opt  = 'A'
"
"      AND leave_ft_credit_freq = 'Y'
"
"      AND (leave_credit_days   > 0 OR leave_credit_cat_mode = 'C')
"
"      AND EXISTS (SELECT 1
"
"                  FROM emp_leave_entlmnts
"
"                 WHERE ele_bu        = leave_bu
"
"                   AND ele_leave_id  = leave_leave_id
"
"                   AND ele_bnfcry_id = p_emp_id
"
"                   AND ele_last_accrued_date IS NULL)
"
"    UNION ALL
"
"   SELECT leave_leave_id,
"
"      leave_desc1,
"
"      leave_credit_freq,
"
"          leave_credit_date,
"
"          leave_credit_days,
"
"          leave_credit_cat_mode,
"
"      'PC' leave_credit_type
"
"     FROM leaves
"
"    WHERE leave_bu              = p_bu
"
"      AND leave_type            = 'A'
"
"      AND leave_auto_credit    = 'Y'
"
"      AND leave_ft_credit_opt  = 'A'
"
"      AND leave_ft_credit_freq = 'Y'
"
"      AND leave_per_credit_opt = 'A'
"
"      AND leave_credit_basis   = 'Y'
"
"      AND (leave_credit_days   > 0 OR leave_credit_cat_mode = 'C')
"
"      AND EXISTS (SELECT 1
"
"                  FROM emp_leave_entlmnts
"
"                 WHERE ele_bu        = leave_bu
"
"                   AND ele_leave_id  = leave_leave_id
"
"                   AND ele_bnfcry_id = p_emp_id
"
"                   AND ele_last_accrued_date IS NOT NULL)
"
"    UNION ALL
"
"   SELECT leave_leave_id,
"
"      leave_desc1,
"
"      leave_credit_freq,
"
"          leave_credit_date,
"
"          leave_credit_days,
"
"          leave_credit_cat_mode,
"
"          (CASE WHEN (SELECT ele_last_accrued_date
"
"                FROM emp_leave_entlmnts
"
"               WHERE ele_bu        = leave_bu
"
"                 AND ele_leave_id  = leave_leave_id
"
"                 AND ele_bnfcry_id = p_emp_id) IS NULL THEN 'FC' ELSE 'PC' END) leave_credit_type
"
"     FROM leaves
"
"    WHERE leave_bu              = p_bu
"
"      AND leave_type            = 'A'
"
"      AND leave_auto_credit    = 'Y'
"
"      --AND leave_ft_credit_opt  = 'M'
"
"      AND leave_ft_credit_freq NOT IN ('Y')
"
"      AND leave_per_credit_opt = 'A'
"
"      AND leave_credit_basis   = 'Y'
"
"      AND (leave_credit_days   > 0 OR leave_credit_cat_mode = 'C')
"
"      AND EXISTS (SELECT 1
"
"                  FROM emp_leave_entlmnts
"
"                 WHERE ele_bu        = leave_bu
"
"                   AND ele_leave_id  = leave_leave_id
"
"                   AND ele_bnfcry_id = p_emp_id);
"
"
"
"   CURSOR c3(c_year                    NUMBER,
"
"            c_period                    NUMBER,
"
"            c_clndr_id                    VARCHAR2)
"
"       IS
"
"   SELECT TO_CHAR(pcp_end_date, 'MM') pcp_month,
"
"          pcp_end_date,
"
"          pcp_start_date
"
"     FROM payroll_cal_period
"
"    WHERE pcp_bu       = p_bu
"
"      AND pcp_year     = c_year
"
"      AND pcp_period   = c_period
"
"      AND pcp_clndr_id = c_clndr_id;
"
"
"
"      cr3                        c3%ROWTYPE;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM employees
"
"    WHERE emp_bu     = p_bu
"
"      AND emp_emp_id = p_emp_id;
"
"
"
"      cr4                        c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_leave_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          leave_credit_cat_mode
"
"    WHERE emp_bu = lccm_bu
"
"      AND emp_cat_id = lccm_cat_id
"
"      AND emp_bu = p_bu
"
"      AND emp_emp_id = p_emp_id
"
"      AND lccm_leave = c_leave_id;
"
"
"
"      cr5                        c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_leave_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_leave_entlmnts
"
"    WHERE ele_bu        = p_bu
"
"      AND ele_bnfcry_id = p_emp_id
"
"      AND ele_leave_id  = c_leave_id;
"
"
"
"      cr6                        c6%ROWTYPE;
"
"
"
"      v_leave_pfx                    VARCHAR2(10);
"
"      v_leave_priority                    NUMBER(5);
"
"      v_temp_year                    NUMBER(7);
"
"      v_leave_doc_no                    VARCHAR2(15);
"
"      v_emp_clndr_id                    VARCHAR2(10);
"
"      v_emp_start_date                    DATE;
"
"      v_per_start_date                    DATE;
"
"      v_per_end_date                    DATE;
"
"      v_credit_date                    DATE;
"
"      v_emp_start_mon                    VARCHAR2(2);
"
"      v_emp_start_day                    VARCHAR2(2);
"
"      v_leave_crdt_day                    VARCHAR2(2);
"
"      v_cal_mon                        VARCHAR2(2);
"
"      v_crdt_mon                    VARCHAR2(2);
"
"      v_credit_freq                    VARCHAR2(1);
"
"      v_credit_days                    NUMBER(7, 3) := 0;
"
"      v_act_crdt_days                    NUMBER(7, 3) := 0;
"
"      v_tot_crdt_mons                    NUMBER(7, 3) := 0;
"
"      v_per_mon_days                    NUMBER(7, 3) := 0;
"
"      v_last_accr_date                    DATE;
"
"      v_last_accr_year                    NUMBER(7);
"
"      v_last_accr_period                NUMBER(2);
"
"      v_year                        NUMBER(7);
"
"      v_period                        NUMBER(2);
"
"
"
"      v_ip_addr                        VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                        VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id                    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
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
"            RAISE_APPLICATION_ERROR(-20945, 'HRM');
"
"         ELSE
"
"            v_leave_pfx := cr1.leavepfx_pfx_id;
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      OPEN c4;
"
"      FETCH c4 INTO cr4;
"
"
"
"         IF c4%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20821, 'HRM'||p_emp_id);
"
"         ELSE
"
"            v_emp_start_date := TRUNC(cr4.emp_start_date);
"
"            v_emp_start_day  := TO_CHAR(cr4.emp_start_date, 'DD');
"
"            v_emp_clndr_id   := cr4.emp_clndr_id;
"
"         END IF;
"
"
"
"      CLOSE c4;
"
"
"
"      OPEN c3(p_year, p_period, v_emp_clndr_id);
"
"      FETCH c3 INTO cr3;
"
"
"
"         IF c3%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20774, 'HRM'||p_year||'~'||p_period);
"
"         ELSE
"
"            v_cal_mon := cr3.pcp_month;
"
"         END IF;
"
"
"
"      CLOSE c3;
"
"
"
"      v_year   := p_year;
"
"      v_period := p_period;
"
"
"
"      IF LENGTH(v_year) <= 4 THEN
"
"
"
"     IF v_period = 12 THEN
"
"        v_year   := v_year + 1;
"
"           v_period := 1;
"
"     ELSE
"
"        v_year   := v_year;
"
"           v_period := v_period + 1;
"
"     END IF;
"
"
"
"      ELSE
"
"
"
"     IF v_period = 12 THEN
"
"        v_year   := v_year + 101;
"
"           v_period := 1;
"
"     ELSE
"
"        v_year   := v_year;
"
"           v_period := v_period + 1;
"
"     END IF;
"
"
"
"      END IF;
"
"
"
"      OPEN c3(v_year, v_period, v_emp_clndr_id);
"
"      FETCH c3 INTO cr3;
"
"
"
"         IF c3%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20774, 'HRM'||v_year||'~'||v_period);
"
"         ELSE
"
"            v_per_end_date   := TRUNC(cr3.pcp_end_date);
"
"            v_per_start_date := TRUNC(cr3.pcp_start_date);
"
"         END IF;
"
"
"
"      CLOSE c3;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"         IF cr2.leave_credit_cat_mode = 'U' THEN
"
"            v_credit_date := cr2.leave_credit_date;
"
"        v_credit_freq := cr2.leave_credit_freq;
"
"        v_credit_days := cr2.leave_credit_days;
"
"
"
"         ELSIF cr2.leave_credit_cat_mode = 'C' THEN
"
"
"
"        OPEN c5(cr2.leave_leave_id);
"
"        FETCH c5 INTO cr5;
"
"
"
"           IF c5%NOTFOUND THEN
"
"              --RAISE_APPLICATION_ERROR(-20193,'HRM'||cr2.leave_leave_id||'~'||p_emp_id);
"
"              v_credit_date := NULL;
"
"              v_credit_days := 0;
"
"           ELSE
"
"              v_credit_date := cr5.lccm_credit_date;
"
"              v_credit_freq := cr5.lccm_credit_freq;
"
"              v_credit_days := cr5.lccm_credit_days;
"
"           END IF;
"
"
"
"        CLOSE c5;
"
"
"
"         END IF;
"
"
"
"     IF cr2.leave_credit_type = 'FC' THEN        --FC First Time Credit
"
"
"
"        IF v_credit_freq = 'P' THEN
"
"
"
"           v_crdt_mon := p_period;
"
"
"
"            proc_find_pyrl_cal_year_period(p_bu,
"
"                                TRUNC(v_emp_start_date),
"
"                                v_temp_year,
"
"                                v_emp_start_mon,
"
"                                v_emp_clndr_id);
"
"
"
"        END IF;
"
"
"
"        IF v_credit_freq = 'C' THEN
"
"           v_crdt_mon      := v_cal_mon;
"
"           v_emp_start_mon := TRUNC(TO_CHAR(v_emp_start_date, 'MM'));
"
"        END IF;
"
"
"
"     END IF;
"
"
"
"     IF cr2.leave_credit_type = 'PC' THEN        --FC Periodical Credit
"
"
"
"        IF v_credit_freq = 'P' THEN
"
"           v_crdt_mon      := p_period;
"
"           v_emp_start_mon := 1;
"
"        END IF;
"
"
"
"        IF v_credit_freq = 'C' THEN
"
"           v_crdt_mon      := v_cal_mon;
"
"           v_emp_start_mon := 1;
"
"        END IF;
"
"
"
"     END IF;
"
"
"
"     OPEN c6(cr2.leave_leave_id);
"
"     FETCH c6 INTO cr6;
"
"
"
"        IF c6%FOUND THEN
"
"           v_last_accr_date   := TRUNC(cr6.ele_last_accrued_date);
"
"           v_last_accr_year   := cr6.ele_last_proc_year;
"
"           v_last_accr_period := cr6.ele_last_proc_period;
"
"        ELSE
"
"           v_last_accr_date   := NULL;
"
"           v_last_accr_year   := NULL;
"
"           v_last_accr_period := NULL;
"
"        END IF;
"
"
"
"     CLOSE c6;
"
"
"
"     IF  v_credit_date IS NOT NULL AND v_credit_days > 0 THEN
"
"
"
"     IF v_crdt_mon = '12' THEN
"
"
"
"        v_tot_crdt_mons  := (12 - v_emp_start_mon) + 1;
"
"
"
"        v_leave_crdt_day := NVL(TO_CHAR(v_credit_date, 'DD'), TO_CHAR(v_emp_start_date, 'DD'));
"
"
"
"        v_per_mon_days   := NVL(v_credit_days, 0)/12;
"
"
"
"        IF cr2.leave_credit_type = 'FC' THEN        --FC First Time Credit
"
"
"
"           IF v_emp_start_day > v_leave_crdt_day THEN
"
"              v_act_crdt_days := (v_tot_crdt_mons * NVL(NVL(v_per_mon_days, 0), 0)) - NVL(NVL(v_per_mon_days, 0), 0)/2;
"
"           ELSE
"
"              v_act_crdt_days := v_tot_crdt_mons * NVL(NVL(v_per_mon_days, 0), 0);
"
"           END IF;
"
"
"
"        END IF;
"
"
"
"        IF cr2.leave_credit_type = 'PC' THEN        --FC Periodical Credit
"
"           v_act_crdt_days := v_tot_crdt_mons * NVL(NVL(v_per_mon_days, 0), 0);
"
"        END IF;
"
"
"
"        /* Carry Over days based on Leave Entitlement */
"
"
"
"        IF cr2.leave_credit_type = 'PC' THEN        --FC Periodical Credit
"
"
"
"           proc_upd_emp_max_carry_days(p_bu,
"
"                                  p_emp_id,
"
"                              cr2.leave_leave_id,
"
"                              v_year,
"
"                              v_period,
"
"                          p_user);
"
"
"
"        END IF;
"
"
"
"        /* Carry Over days based on Leave Entitlement */
"
"
"
"            UPDATE emp_leave_cur_bal
"
"               SET emplcb_cur_bal     = emplcb_cur_bal + v_act_crdt_days,
"
"                   emplcb_upd_by      = p_user,
"
"                   emplcb_upd_ip_addr = v_ip_addr,
"
"                   emplcb_upd_os_user = v_os_user,
"
"                   emplcb_upd_date    = SYSDATE
"
"             WHERE emplcb_bu       = p_bu
"
"               AND emplcb_emp_id   = p_emp_id
"
"               AND emplcb_leave_id = cr2.leave_leave_id;
"
"
"
"            IF SQL%FOUND THEN
"
"
"
"            --v_leave_doc_no := func_find_hrm_next_id(p_bu, 'EMP_LEAVE');
"
"
"
"            v_leave_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'LE',p_user);
"
"
"
"               INSERT INTO employee_leaves(empleave_bu            ,
"
"                           empleave_plnt        ,
"
"                           empleave_pfx        ,
"
"                           empleave_doc_no        ,
"
"                           empleave_extn_flag        ,
"
"                           empleave_type        ,
"
"                           empleave_emp_id        ,
"
"                           empleave_leave_id        ,
"
"                           empleave_pfx_id        ,
"
"                           empleave_oper        ,
"
"                           empleave_year        ,
"
"                           empleave_period        ,
"
"                           empleave_applied_days    ,
"
"                           empleave_apprvd_days        ,
"
"                           empleave_start_date        ,
"
"                           empleave_end_date        ,
"
"                           empleave_prep_payroll    ,
"
"                           empleave_status        ,
"
"                           empleave_coff        ,
"
"                           empleave_is_late        ,
"
"                           empleave_is_ltc        ,
"
"                           empleave_req_date        ,
"
"                           empleave_briefdesc        ,
"
"                           empleave_chk_flag        ,
"
"                           empleave_jrnl_flag        ,
"
"                           empleave_encash_amt        ,
"
"                           empleave_layoff        ,
"
"                           empleave_adj_source        ,
"
"                           empleave_adj_last_accr_date    ,
"
"                           empleave_adj_year        ,
"
"                           empleave_adj_period        ,
"
"                           empleave_cre_by        ,
"
"                           empleave_cre_ip_addr        ,
"
"                           empleave_cre_os_user        ,
"
"                           empleave_cre_emp_id        ,
"
"                           empleave_cre_date        )
"
"                    VALUES(p_bu                ,                --empleave_bu,
"
"                           NULL                ,                --empleave_plnt,
"
"                           'LE'            ,        --empleave_pfx
"
"                           v_leave_doc_no        ,                --empleave_doc_no,
"
"                           'N'                ,                --empleave_extn_flag,
"
"                           'A'                ,                --empleave_type,
"
"                           p_emp_id            ,                --empleave_emp_id,
"
"                           cr2.leave_leave_id        ,                --empleave_leave_id,
"
"                           v_leave_pfx            ,                --empleave_pfx_id,
"
"                           '+'                ,                --empleave_oper,
"
"                           v_year            ,                --empleave_year,
"
"                           v_period            ,                --empleave_period,
"
"                           NULL                ,                --empleave_applied_days,
"
"                           v_act_crdt_days        ,                --empleave_apprvd_days,
"
"                           TRUNC(v_per_start_date)    ,                --empleave_start_date,
"
"                           (TRUNC(v_per_start_date) + v_act_crdt_days),            --empleave_end_date,
"
"                           'N'                ,                --empleave_prep_payroll,
"
"                           'P'                ,                --empleave_status,
"
"                           'N'                ,                --empleave_coff,
"
"                           'N'                ,                --empleave_is_late,
"
"                           'N'                ,                --empleave_is_ltc,
"
"                           TRUNC(v_per_start_date)    ,                --empleave_req_date,
"
"                           cr2.leave_leave_id||'-'||cr2.leave_desc1||' YEARLY AUTO LEAVE BALANCE CREDIT.',    --empleave_briefdesc,
"
"                           'N'                ,                --empleave_chk_flag,
"
"                           'N'                ,                --empleave_jrnl_flag,
"
"                           0                ,                --empleave_encash_amt,
"
"                           'N'                ,                --empleave_layoff
"
"                           'YLC'            ,                --empleave_adj_source
"
"                           v_last_accr_date        ,                --empleave_adj_last_accr_date
"
"                           p_year            ,                --empleave_adj_year
"
"                           p_period            ,                --empleave_adj_period
"
"                           p_user            ,                --empleave_cre_by,
"
"                           v_ip_addr            ,                --empleave_cre_ip_addr
"
"                       v_os_user            ,                --empleave_cre_os_user
"
"                       v_cre_emp_id            ,                --empleave_cre_emp_id
"
"                           SYSDATE            );                --empleave_cre_date
"
"
"
"           UPDATE emp_leave_entlmnts
"
"              SET ele_last_accrued_date = TRUNC(v_per_end_date),
"
"                    ele_upd_by      = p_user,
"
"                  ele_upd_ip_addr = v_ip_addr,
"
"              ele_upd_os_user = v_os_user,
"
"                  ele_upd_date    = SYSDATE
"
"            WHERE ele_bu        = p_bu
"
"              AND ele_bnfcry_id = p_emp_id
"
"              AND ele_leave_id  = cr2.leave_leave_id;
"
"
"
"            END IF;
"
"
"
"         END IF;
"
"      END IF;
"
"
"
"    END LOOP c2;
"
"
"
"   END proc_upd_ftc_emp_year_comp;
"
"
"
"   PROCEDURE proc_upd_mon_crdt_emp(p_bu                    VARCHAR2,
"
"                           p_year                NUMBER,
"
"                           p_period                NUMBER,
"
"                           p_emp_id                VARCHAR2,
"
"                           p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT leavepfx_pfx_id
"
"     FROM leave_prefixes
"
"    WHERE leavepfx_bu   = p_bu
"
"      AND leavepfx_oper = '+';
"
"
"
"      cr1                        c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT leave_leave_id,
"
"      leave_desc1,
"
"      leave_credit_freq,
"
"          leave_credit_date,
"
"          leave_credit_days,
"
"          leave_prob_credit_days,
"
"          leave_credit_cat_mode
"
"     FROM leaves
"
"    WHERE leave_bu              = p_bu
"
"      AND leave_type            = 'A'
"
"      AND leave_auto_credit    = 'Y'
"
"      AND leave_per_credit_opt = 'A'
"
"      AND leave_credit_basis   = 'M'
"
"      AND (leave_credit_days    > 0 OR leave_credit_cat_mode = 'C')
"
"      AND leave_ft_credit_opt  = 'A'
"
"      AND leave_ft_credit_freq IN ('S', 'P')
"
"      AND EXISTS (SELECT 1
"
"                  FROM emp_leave_entlmnts
"
"                 WHERE ele_bu        = leave_bu
"
"                   AND ele_leave_id  = leave_leave_id
"
"                   AND ele_bnfcry_id = p_emp_id
"
"                   AND ele_last_accrued_date IS NOT NULL)
"
"    UNION ALL
"
"   SELECT leave_leave_id,
"
"      leave_desc1,
"
"      leave_credit_freq,
"
"          leave_credit_date,
"
"          leave_credit_days,
"
"          leave_prob_credit_days,
"
"          leave_credit_cat_mode
"
"     FROM leaves
"
"    WHERE leave_bu              = p_bu
"
"      AND leave_type            = 'A'
"
"      AND leave_auto_credit    = 'Y'
"
"      AND leave_per_credit_opt = 'A'
"
"      AND leave_credit_basis   = 'M'
"
"      AND (leave_credit_days    > 0 OR leave_credit_cat_mode = 'C')
"
"      AND leave_ft_credit_opt  = 'M'
"
"      AND leave_ft_credit_freq = 'N'
"
"      AND EXISTS (SELECT 1
"
"                  FROM emp_leave_entlmnts
"
"                 WHERE ele_bu        = leave_bu
"
"                   AND ele_leave_id  = leave_leave_id
"
"                   AND ele_bnfcry_id = p_emp_id);
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM employees
"
"    WHERE emp_bu     = p_bu
"
"      AND emp_emp_id = p_emp_id;
"
"
"
"      cr3                        c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_year                    NUMBER,
"
"            c_period                    NUMBER,
"
"            c_clndr_id                    VARCHAR2)
"
"       IS
"
"   SELECT pcp_start_date,
"
"          TO_CHAR(pcp_end_date, 'MM') pcp_month
"
"     FROM payroll_cal_period
"
"    WHERE pcp_bu       = p_bu
"
"      AND pcp_year     = c_year
"
"      AND pcp_period   = c_period
"
"      AND pcp_clndr_id = c_clndr_id;
"
"
"
"      cr4                        c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_leave_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          leave_credit_cat_mode
"
"    WHERE emp_bu     = lccm_bu
"
"      AND emp_cat_id = lccm_cat_id
"
"      AND emp_bu     = p_bu
"
"      AND emp_emp_id = p_emp_id
"
"      AND lccm_leave = c_leave_id;
"
"
"
"      cr5                        c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_leave_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_leave_entlmnts
"
"    WHERE ele_bu        = p_bu
"
"      AND ele_bnfcry_id = p_emp_id
"
"      AND ele_leave_id  = c_leave_id;
"
"
"
"      cr6                        c6%ROWTYPE;
"
"
"
"   CURSOR c7
"
"          IS
"
"      SELECT *
"
"        FROM leaves
"
"       WHERE leave_bu          = p_bu
"
"         AND leave_type        = 'A'
"
"         AND leave_auto_credit    = 'Y';
"
"
"
"         cr7                c7%ROWTYPE;
"
"
"
"      CURSOR c8(c_year   NUMBER,
"
"                c_period NUMBER)
"
"          IS
"
"     SELECT *
"
"        FROM payroll_prep_hd
"
"       WHERE pphd_bu     = p_bu
"
"         AND pphd_year   = (CASE WHEN c_period = 1 THEN c_year - 101 ELSE c_year END )
"
"         AND pphd_period = (CASE WHEN c_period = 1 THEN 12 ELSE c_period-1 END)
"
"         AND pphd_emp_id = p_emp_id;
"
"
"
"      cr8                c8%ROWTYPE;
"
"
"
"      v_leave_pfx                    VARCHAR2(10);
"
"      v_year                        NUMBER(7);
"
"      v_period                        NUMBER(2);
"
"      v_st_date                        DATE;
"
"      v_leave_doc_no                    VARCHAR2(15);
"
"      v_prob_credit_days                NUMBER(7, 3) := 0;
"
"      v_credit_days                    NUMBER(7, 3) := 0;
"
"      v_act_crdt_days                    NUMBER(7, 3) := 0;
"
"      v_credit_freq                    VARCHAR2(1);
"
"      v_emp_prob                    VARCHAR2(1);
"
"      v_cal_mon                        VARCHAR2(2);
"
"      v_crdt_mon                    VARCHAR2(2);
"
"      v_last_accr_date                    DATE;
"
"      v_last_accr_year                    NUMBER(7);
"
"      v_last_accr_period                NUMBER(2);
"
"      v_emp_clndr_id                    VARCHAR2(10);
"
"
"
"      v_ip_addr                        VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                        VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id                    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
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
"            RAISE_APPLICATION_ERROR(-20945, 'HRM');
"
"         ELSE
"
"            v_leave_pfx := cr1.leavepfx_pfx_id;
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      OPEN c3;
"
"      FETCH c3 INTO cr3;
"
"
"
"         IF c3%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20821, 'HRM'||p_emp_id);
"
"         ELSE
"
"
"
"            v_emp_clndr_id := cr3.emp_clndr_id;
"
"
"
"            IF cr3.emp_prob_period_status IN ('A', 'E') THEN --A - Probation E - Evaluation
"
"               v_emp_prob := 'Y';
"
"            ELSE
"
"               v_emp_prob := 'N';
"
"            END IF;
"
"
"
"         END IF;
"
"
"
"      CLOSE c3;
"
"
"
"      v_year   := p_year;
"
"      v_period := p_period;
"
"
"
"      IF LENGTH(v_year) <= 4 THEN
"
"
"
"     IF v_period = 12 THEN
"
"        v_year   := v_year + 1;
"
"        v_period := 1;
"
"     ELSE
"
"        v_year   := v_year;
"
"        v_period := v_period + 1;
"
"     END IF;
"
"
"
"      ELSE
"
"
"
"     IF v_period = 12 THEN
"
"        v_year   := v_year + 101;
"
"        v_period := 1;
"
"     ELSE
"
"        v_year   := v_year;
"
"        v_period := v_period + 1;
"
"     END IF;
"
"
"
"      END IF;
"
"
"
"     OPEN c4(v_year, v_period, v_emp_clndr_id);
"
"     FETCH c4 INTO cr4;
"
"
"
"     IF c4%NOTFOUND THEN
"
"        RAISE_APPLICATION_ERROR(-20242,'HRM'||v_year||'~'||v_period);
"
"     ELSE
"
"        v_cal_mon := cr4.pcp_month;
"
"        v_st_date := TRUNC(cr4.pcp_start_date);
"
"     END IF;
"
"
"
"      CLOSE c4;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"         IF cr2.leave_credit_cat_mode = 'U' THEN
"
"            v_prob_credit_days := cr2.leave_prob_credit_days;
"
"            v_credit_days      := cr2.leave_credit_days;
"
"            v_credit_freq      := cr2.leave_credit_freq;
"
"
"
"            OPEN c7;
"
"        FETCH c7 INTO cr7;
"
"
"
"           IF c7%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20002,'HRM'||'~'||p_bu);
"
"
"
"           ELSE
"
"
"
"              IF cr7.leave_crdt_type = 'S' THEN
"
"                 OPEN c8(v_year,v_period);
"
"                 FETCH c8 INTO cr8;
"
"
"
"                    IF c8%NOTFOUND THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'HRM '||v_year||'~'||v_period);
"
"
"
"                    ELSE
"
"                      v_act_crdt_days := CASE WHEN SUBSTR(ROUND(cr8.pphd_workin_days/cr7.leave_wrkd_days,1),-1) = '5'
"
"                                              THEN ROUND(cr8.pphd_workin_days/cr7.leave_wrkd_days,1)
"
"                                              ELSE ROUND(ROUND(cr8.pphd_workin_days/cr7.leave_wrkd_days,1)) END ;
"
"                    END IF;
"
"
"
"                CLOSE c8;
"
"
"
"             ELSE
"
"                v_act_crdt_days := v_credit_days;
"
"             END IF;
"
"
"
"           END IF;
"
"
"
"            CLOSE c7;
"
"         ELSE
"
"
"
"            OPEN c5(cr2.leave_leave_id);
"
"            FETCH c5 INTO cr5;
"
"
"
"               IF c5%NOTFOUND THEN
"
"                  --RAISE_APPLICATION_ERROR(-20193,'HRM'||cr2.leave_leave_id||'~'||p_emp_id);
"
"                  v_credit_days := 0;
"
"                  v_prob_credit_days := 0;
"
"
"
"               ELSE
"
"                  v_prob_credit_days := cr5.lccm_prob_credit_days;
"
"                  v_credit_days      := cr5.lccm_credit_days;
"
"                  v_credit_freq      := cr5.lccm_credit_freq;
"
"
"
"                   IF cr5.lccm_crdt_type = 'S' THEN
"
"                  OPEN c8(v_year,v_period);
"
"                  FETCH c8 INTO cr8;
"
"
"
"                 IF c8%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'HRM '||v_year||'~'||v_period);
"
"
"
"                 ELSE
"
"                    v_act_crdt_days := CASE WHEN SUBSTR(ROUND(cr8.pphd_workin_days/cr5.lccm_wrkd_days,1),-1) = '5'
"
"                                  THEN ROUND(cr8.pphd_workin_days/cr5.lccm_wrkd_days,1)
"
"                                ELSE ROUND(ROUND(cr8.pphd_workin_days/cr5.lccm_wrkd_days,1)) END ;
"
"                 END IF;
"
"
"
"                  CLOSE c8;
"
"
"
"              ELSE
"
"                  v_act_crdt_days := v_credit_days;
"
"              END IF;
"
"
"
"               END IF;
"
"
"
"            CLOSE c5;
"
"
"
"         END IF;
"
"
"
"     OPEN c6(cr2.leave_leave_id);
"
"     FETCH c6 INTO cr6;
"
"
"
"        IF c6%FOUND THEN
"
"           v_last_accr_date   := TRUNC(cr6.ele_last_accrued_date);
"
"           v_last_accr_year   := cr6.ele_last_proc_year;
"
"           v_last_accr_period := cr6.ele_last_proc_period;
"
"        ELSE
"
"           v_last_accr_date   := NULL;
"
"           v_last_accr_year   := NULL;
"
"           v_last_accr_period := NULL;
"
"        END IF;
"
"
"
"     CLOSE c6;
"
"
"
"     /* Carry Over days based on Leave Entitlement */
"
"
"
"     IF v_credit_freq = 'P' THEN
"
"        v_crdt_mon := p_period;
"
"     END IF;
"
"
"
"     IF v_credit_freq = 'C' THEN
"
"        v_crdt_mon := v_cal_mon;
"
"     END IF;
"
"/*
"
"     IF v_crdt_mon = 12 AND cr6.ele_carry_frwd_freq = 'Y' THEN
"
"
"
"        proc_upd_emp_max_carry_days(p_bu,
"
"                               p_emp_id,
"
"                           cr2.leave_leave_id,
"
"                           v_year,
"
"                           v_period,
"
"                       p_user);
"
"
"
"     ELSIF cr6.ele_carry_frwd_freq = 'M' THEN
"
"
"
"        proc_upd_emp_max_carry_days(p_bu,
"
"                               p_emp_id,
"
"                           cr2.leave_leave_id,
"
"                           v_year,
"
"                           v_period,
"
"                       p_user);
"
"    END IF;
"
"*/
"
"
"
"  IF  v_prob_credit_days > 0 AND  v_credit_days > 0  THEN
"
"
"
"    IF v_crdt_mon = 12 THEN
"
"
"
"        proc_upd_emp_max_carry_days(p_bu,
"
"                               p_emp_id,
"
"                           cr2.leave_leave_id,
"
"                           v_year,
"
"                           v_period,
"
"                       p_user);
"
"
"
"     END IF;
"
"
"
"
"
"
"
"     IF v_emp_prob = 'Y' THEN
"
"        v_act_crdt_days := v_prob_credit_days;
"
"     ELSE
"
"        v_act_crdt_days := v_act_crdt_days;
"
"     END IF;
"
"
"
"     --raise_application_error(-20000,v_act_crdt_days);
"
"     /* Carry Over days based on Leave Entitlement */
"
"
"
"         UPDATE emp_leave_cur_bal
"
"            SET emplcb_cur_bal     = emplcb_cur_bal + v_act_crdt_days,
"
"                emplcb_upd_by      = p_user,
"
"        emplcb_upd_ip_addr = v_ip_addr,
"
"                emplcb_upd_os_user = v_os_user,
"
"                emplcb_upd_date    = SYSDATE
"
"          WHERE emplcb_bu       = p_bu
"
"            AND emplcb_emp_id   = p_emp_id
"
"            AND emplcb_leave_id = cr2.leave_leave_id;
"
"
"
"         IF SQL%FOUND THEN
"
"
"
"         --v_leave_doc_no := func_find_hrm_next_id(p_bu, 'EMP_LEAVE');
"
"
"
"         v_leave_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'LE',p_user);
"
"
"
"            INSERT INTO employee_leaves(empleave_bu            ,
"
"                        empleave_plnt            ,
"
"                        empleave_pfx        ,
"
"                        empleave_doc_no            ,
"
"                        empleave_extn_flag        ,
"
"                        empleave_type            ,
"
"                        empleave_emp_id            ,
"
"                        empleave_leave_id        ,
"
"                        empleave_pfx_id            ,
"
"                        empleave_oper            ,
"
"                        empleave_year            ,
"
"                        empleave_period            ,
"
"                        empleave_applied_days        ,
"
"                        empleave_apprvd_days        ,
"
"                        empleave_start_date        ,
"
"                        empleave_end_date        ,
"
"                        empleave_prep_payroll        ,
"
"                        empleave_status            ,
"
"                        empleave_coff            ,
"
"                        empleave_is_late        ,
"
"                        empleave_is_ltc            ,
"
"                        empleave_req_date        ,
"
"                        empleave_briefdesc        ,
"
"                        empleave_chk_flag        ,
"
"                        empleave_jrnl_flag        ,
"
"                        empleave_encash_amt        ,
"
"                        empleave_layoff            ,
"
"                        empleave_adj_source        ,
"
"                        empleave_adj_last_accr_date    ,
"
"                        empleave_adj_last_proc_year    ,
"
"                        empleave_adj_last_proc_period    ,
"
"                        empleave_adj_year        ,
"
"                        empleave_adj_period        ,
"
"                        empleave_cre_by            ,
"
"                        empleave_cre_ip_addr        ,
"
"                    empleave_cre_os_user        ,
"
"                    empleave_cre_emp_id        ,
"
"                        empleave_cre_date        )
"
"                 VALUES(p_bu                ,                --empleave_bu,
"
"                        NULL                ,                --empleave_plnt,
"
"                        'LE'            ,         --empleave_pfx
"
"                        v_leave_doc_no            ,                --empleave_doc_no,
"
"                        'N'                ,                --empleave_extn_flag,
"
"                        'A'                ,                --empleave_type,
"
"                        p_emp_id            ,                --empleave_emp_id,
"
"                        cr2.leave_leave_id        ,                --empleave_leave_id,
"
"                        v_leave_pfx            ,                --empleave_pfx_id,
"
"                        '+'                ,                --empleave_oper,
"
"                        v_year                ,                --empleave_year,
"
"                        v_period            ,                --empleave_period,
"
"                        NULL                ,                --empleave_applied_days,
"
"                        v_act_crdt_days            ,                --empleave_apprvd_days,
"
"                        TRUNC(v_st_date)        ,                --empleave_start_date,
"
"                        (TRUNC(v_st_date) + v_act_crdt_days),                --empleave_end_date,
"
"                        'N'                ,                --empleave_prep_payroll,
"
"                        'P'                ,                --empleave_status,
"
"                        'N'                ,                --empleave_coff,
"
"                        'N'                ,                --empleave_is_late,
"
"                        'N'                ,                --empleave_is_ltc,
"
"                        TRUNC(v_st_date)        ,                --empleave_req_date,
"
"                        cr2.leave_leave_id||'-'||cr2.leave_desc1||' AUTO LEAVE BALANCE MONTHLY CREDIT.',    --empleave_briefdesc,
"
"                        'N'                ,                --empleave_chk_flag,
"
"                        'N'                ,                --empleave_jrnl_flag,
"
"                        0                ,                --empleave_encash_amt,
"
"                        'N'                ,                --empleave_layoff
"
"                        'MLC'                ,                --empleave_adj_source
"
"                        v_last_accr_date        ,                --empleave_adj_last_accr_date
"
"                    v_last_accr_year        ,                --empleave_adj_last_proc_year
"
"                        v_last_accr_period        ,                --empleave_adj_last_proc_period
"
"                        p_year                ,                --empleave_adj_year
"
"                        p_period            ,                --empleave_adj_period
"
"                        p_user                ,                --empleave_cre_by,
"
"                    v_ip_addr            ,                --empleave_cre_ip_addr
"
"                    v_os_user            ,                --empleave_cre_os_user
"
"                    v_cre_emp_id            ,                --empleave_cre_emp_id
"
"                        SYSDATE                );                --empleave_cre_date
"
"
"
"        UPDATE emp_leave_entlmnts
"
"           SET ele_last_accrued_date = TRUNC(v_st_date) - 1,
"
"               ele_last_proc_year    = v_year,
"
"           ele_last_proc_period  = v_period,
"
"               ele_upd_by           = p_user,
"
"               ele_upd_ip_addr      = v_ip_addr,
"
"           ele_upd_os_user      = v_os_user,
"
"               ele_upd_date       = SYSDATE
"
"         WHERE ele_bu        = p_bu
"
"           AND ele_bnfcry_id = p_emp_id
"
"           AND ele_leave_id  = cr2.leave_leave_id;
"
"
"
"         END IF;
"
"
"
"      END IF;
"
"
"
"      END LOOP c2;
"
"
"
"   END proc_upd_mon_crdt_emp;
"
"
"
"   PROCEDURE proc_upd_emp_max_carry_days(p_bu                    VARCHAR2,
"
"                        p_emp_id                VARCHAR2,
"
"                        p_leave_id                VARCHAR2,
"
"                        p_year                    NUMBER,
"
"                        p_period                NUMBER,
"
"                        p_user                    VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_leave_cntrl
"
"    WHERE hlvc_bu = p_bu;
"
"
"
"      cr0                        c0%ROWTYPE;
"
"
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_leave_entlmnts
"
"    WHERE ele_bu        = p_bu
"
"      AND ele_leave_id  = p_leave_id
"
"      AND ele_bnfcry_id = p_emp_id;
"
"
"
"      cr1                        c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM emp_leave_cur_bal
"
"    WHERE emplcb_bu       = p_bu
"
"      AND emplcb_emp_id   = p_emp_id
"
"      AND emplcb_leave_id = p_leave_id;
"
"
"
"      cr2                        c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_clndr_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_cal_period
"
"    WHERE pcp_bu       = p_bu
"
"      AND pcp_year     = p_year
"
"      AND pcp_period   = p_period
"
"      AND pcp_clndr_id = c_clndr_id;
"
"
"
"      cr3                        c3%ROWTYPE;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT emp_clndr_id
"
"     FROM employees
"
"    WHERE emp_bu     = p_bu
"
"      AND emp_emp_id = p_emp_id;
"
"
"
"      cr4                        c4%ROWTYPE;
"
"
"
"      v_leave_pfx                    VARCHAR2(10);
"
"      v_max_carry_days                    NUMBER(7, 2) := 0;
"
"      v_leave_cur_bal                    NUMBER(7, 2) := 0;
"
"      v_emp_carry_days                    NUMBER(7, 2) := 0;
"
"      v_start_date                    DATE;
"
"      v_end_date                    DATE;
"
"      v_leave_doc_no                    VARCHAR2(15);
"
"      v_last_accr_date                    DATE;
"
"      v_last_accr_year                    NUMBER(7);
"
"      v_last_accr_period                NUMBER(2);
"
"      v_emp_clndr_id                    VARCHAR2(10);
"
"
"
"      v_ip_addr                        VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                        VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id                    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"
"
"   BEGIN
"
"
"
"      OPEN c0;
"
"      FETCH c0 INTO cr0;
"
"
"
"         IF c0%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20058, 'HRM'||'~'||p_bu);
"
"         ELSE
"
"
"
"            IF cr0.hlvc_leave_cryod_prifx IS NULL THEN
"
"               RAISE_APPLICATION_ERROR(-20619, 'HRM'||'~'||p_bu);
"
"            ELSE
"
"               v_leave_pfx := cr0.hlvc_leave_cryod_prifx;
"
"            END IF;
"
"
"
"         END IF;
"
"
"
"      CLOSE c0;
"
"
"
"      OPEN c4;
"
"      FETCH c4 INTO cr4;
"
"
"
"         IF c4%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20821, 'HRM'||p_emp_id);
"
"         ELSE
"
"            v_emp_clndr_id := cr4.emp_clndr_id;
"
"         END IF;
"
"
"
"      CLOSE c4;
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
"            RAISE_APPLICATION_ERROR(-20873, 'HRM'||'~'||p_bu||'~'||p_emp_id||'~'||p_leave_id);
"
"         ELSE
"
"            v_max_carry_days   := NVL(cr1.ele_max_carry_days, 0);
"
"            v_last_accr_date   := TRUNC(cr1.ele_last_accrued_date);
"
"        v_last_accr_year   := cr1.ele_last_proc_year;
"
"        v_last_accr_period := cr1.ele_last_proc_period;
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      OPEN c2;
"
"      FETCH c2 INTO cr2;
"
"
"
"         IF c2%NOTFOUND THEN
"
"            v_leave_cur_bal := 0;
"
"         ELSE
"
"            v_leave_cur_bal := NVL(cr2.emplcb_cur_bal, 0);
"
"         END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      OPEN c3(v_emp_clndr_id);
"
"      FETCH c3 INTO cr3;
"
"
"
"         IF c3%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20242, 'HRM'||'~'||p_bu||'~'||p_year||'~'||p_period||'~'||v_emp_clndr_id);
"
"         ELSE
"
"            v_start_date := TRUNC(cr3.pcp_start_date);
"
"            v_end_date   := TRUNC(cr3.pcp_end_date);
"
"         END IF;
"
"
"
"      CLOSE c3;
"
"
"
"      IF v_leave_cur_bal > v_max_carry_days  THEN
"
"
"
"         UPDATE emp_leave_cur_bal
"
"            SET emplcb_cur_bal     = v_max_carry_days,
"
"                emplcb_upd_by      = p_user,
"
"                emplcb_upd_ip_addr = v_ip_addr,
"
"                emplcb_upd_os_user = v_os_user,
"
"                emplcb_upd_date    = SYSDATE
"
"          WHERE emplcb_bu       = p_bu
"
"            AND emplcb_emp_id   = p_emp_id
"
"            AND emplcb_leave_id = p_leave_id;
"
"
"
"         IF SQL%FOUND THEN
"
"
"
"         --v_leave_doc_no := func_find_hrm_next_id(p_bu, 'EMP_LEAVE');
"
"
"
"         v_leave_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'LE',p_user);
"
"
"
"            INSERT INTO employee_leaves(empleave_bu            ,
"
"                       empleave_plnt            ,
"
"                       empleave_pfx        ,
"
"                       empleave_doc_no            ,
"
"                       empleave_extn_flag        ,
"
"                       empleave_type            ,
"
"                       empleave_emp_id            ,
"
"                       empleave_leave_id        ,
"
"                       empleave_pfx_id            ,
"
"                       empleave_oper            ,
"
"                       empleave_year            ,
"
"                       empleave_period            ,
"
"                       empleave_applied_days        ,
"
"                       empleave_apprvd_days        ,
"
"                       empleave_start_date        ,
"
"                       empleave_end_date        ,
"
"                       empleave_prep_payroll        ,
"
"                       empleave_status            ,
"
"                       empleave_coff            ,
"
"                       empleave_is_late        ,
"
"                       empleave_is_ltc            ,
"
"                       empleave_req_date        ,
"
"                       empleave_briefdesc        ,
"
"                       empleave_chk_flag        ,
"
"                       empleave_jrnl_flag        ,
"
"                       empleave_encash_amt        ,
"
"                       empleave_layoff            ,
"
"                       empleave_adj_source        ,
"
"                       empleave_adj_last_accr_date    ,
"
"                       empleave_adj_last_proc_year    ,
"
"                       empleave_adj_last_proc_period    ,
"
"                        empleave_adj_year        ,
"
"                        empleave_adj_period        ,
"
"                       empleave_cre_by            ,
"
"                        empleave_cre_ip_addr        ,
"
"                    empleave_cre_os_user        ,
"
"                    empleave_cre_emp_id        ,
"
"                       empleave_cre_date        )
"
"                     VALUES(p_bu                ,                --empleave_bu,
"
"                       NULL                ,                --empleave_plnt,
"
"                       'LE'        ,                  --empleave_pfx
"
"                       v_leave_doc_no            ,                --empleave_doc_no,
"
"                       'N'                ,                --empleave_extn_flag,
"
"                       'A'                ,                --empleave_type,
"
"                       p_emp_id            ,                --empleave_emp_id,
"
"                       p_leave_id            ,                --empleave_leave_id,
"
"                       v_leave_pfx            ,                --empleave_pfx_id,
"
"                       '-'                ,                --empleave_oper,
"
"                       p_year                ,                --empleave_year,
"
"                       p_period            ,                --empleave_period,
"
"                       NULL                ,                --empleave_applied_days,
"
"                       (v_leave_cur_bal - v_max_carry_days),                --empleave_apprvd_days,
"
"                       TRUNC(v_start_date)        ,                --empleave_start_date,
"
"                       (TRUNC(v_start_date) + (v_leave_cur_bal - v_max_carry_days)),    --empleave_end_date,
"
"                       'N'                ,                --empleave_prep_payroll,
"
"                       'P'                ,                --empleave_status,
"
"                       'N'                ,                --empleave_coff,
"
"                       'N'                ,                --empleave_is_late,
"
"                       'N'                ,                --empleave_is_ltc,
"
"                       TRUNC(v_start_date)        ,                --empleave_req_date,
"
"                       p_leave_id||'-'||' CARRY OVER DEDUCTION.',            --empleave_briefdesc,
"
"                       'N'                ,                --empleave_chk_flag,
"
"                       'N'                ,                --empleave_jrnl_flag,
"
"                       0                ,                --empleave_encash_amt,
"
"                       'N'                ,                --empleave_layoff
"
"                       'MCD'                ,                --empleave_adj_source
"
"                       v_last_accr_date        ,                --empleave_adj_last_accr_date
"
"                    v_last_accr_year        ,                --empleave_adj_last_proc_year
"
"                       v_last_accr_period        ,                --empleave_adj_last_proc_period
"
"                        p_year                ,                --empleave_adj_year
"
"                        p_period            ,                --empleave_adj_period
"
"                       p_user                ,                --empleave_cre_by,
"
"                        v_ip_addr            ,                --empleave_cre_ip_addr
"
"                    v_os_user            ,                --empleave_cre_os_user
"
"                    v_cre_emp_id            ,                --empleave_cre_emp_id
"
"                       SYSDATE                );                --empleave_cre_date
"
"
"
"         END IF;
"
"
"
"      END IF;
"
"
"
"   END proc_upd_emp_max_carry_days;
"
"
"
"END pack_auto_cre_leave_credit;"
/
