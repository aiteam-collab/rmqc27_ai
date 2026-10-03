CREATE OR REPLACE
"PACKAGE BODY        pack_wage_emp_pyrl_mil
"
"AS
"
"
"
"   PROCEDURE proc_prepare_emp_monthly_wage(p_bu                            VARCHAR2,
"
"                           p_doc_no                        VARCHAR2,
"
"                           p_seq_no                        NUMBER,
"
"                           p_emp_id                        VARCHAR2,
"
"                           p_user                        VARCHAR2,
"
"                           p_res              OUT            VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_wage_emp_pyrl_ctrl,
"
"          payroll_control
"
"    WHERE hwepc_bu = p_bu
"
"      AND hwepc_bu = payctrl_bu;
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
"     FROM per_pyrl_prep_hd
"
"    WHERE ppphd_bu     = p_bu
"
"      AND ppphd_doc_no = p_doc_no
"
"      AND ppphd_status = 'N';
"
"
"
"      cr1                        c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_clndr_id            VARCHAR2,
"
"            c_date                    DATE,
"
"            c_date_from        DATE,
"
"            c_plnt            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu        = empai_bu
"
"      AND emp_emp_id    = empai_emp_id
"
"      AND emp_bu        = p_bu
"
"      AND (emp_emp_id   = p_emp_id OR p_emp_id IS NULL)
"
"      AND emp_clndr_id  = c_clndr_id
"
"      AND emp_status    = 'A'
"
"      AND emp_type      = 'E'
"
"      AND emp_pay_basis = 'W'
"
"      AND (empai_plnt = c_plnt OR c_plnt IS NULL)
"
"      AND emp_sal_wage IN ('DW', 'MW')
"
"      AND TRUNC(emp_start_date) <= c_date
"
"      AND (TRUNC(emp_last_proc_date) < c_date_from OR emp_last_proc_date IS NULL)
"
"      AND emp_include_payroll = 'Y'
"
"    ORDER BY emp_emp_id;
"
"
"
"   CURSOR c4(c_emp_id                VARCHAR2,
"
"             c_year                    NUMBER,
"
"             c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM wage_employees
"
"    WHERE wage_emp_bu     = p_bu
"
"      AND wage_emp_id     = c_emp_id
"
"      AND wage_emp_year   = c_year
"
"      AND wage_emp_period = c_period;
"
"
"
"      cr4                        c4%ROWTYPE;
"
"
"
"   CURSOR c6(c_emp_id                VARCHAR2,
"
"             c_date_from            DATE,
"
"             c_date_to                DATE)
"
"       IS
"
"   SELECT *
"
"     FROM emp_pyrl_allowances,
"
"          payroll_elements_hd
"
"    WHERE epa_bu       = pehd_bu
"
"      AND epa_elmnt_id = pehd_elmnt_id
"
"      AND epa_bu       = p_bu
"
"      AND epa_emp_id   = c_emp_id
"
"      AND epa_start_date <= c_date_to
"
"      AND ((epa_end_date IS NULL)
"
"       OR (epa_end_date > c_date_from));
"
"
"
"   CURSOR c7(c_emp_id                VARCHAR2,
"
"             c_year                    NUMBER,
"
"             c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM emp_pyrl_adjustments,
"
"          payroll_elements_hd
"
"    WHERE epadj_bu            = pehd_bu
"
"      AND epadj_elmnt_id      = pehd_elmnt_id
"
"      AND epadj_bu            = p_bu
"
"      AND epadj_emp_id        = c_emp_id
"
"      AND epadj_start_year ||TO_CHAR(epadj_start_period, '00') <= c_year||TO_CHAR(c_period, '00')
"
"      AND ((epadj_is_definite = 'Y' AND epadj_rmng_period > 0)
"
"       OR  (epadj_is_definite = 'N'))
"
"      AND epadj_process_flag  = 'Y'
"
"      AND epadj_status        = 'P';
"
"
"
"   CURSOR c11(c_zone_id                VARCHAR2,
"
"             c_clndr_id        VARCHAR2,
"
"              c_start_date            DATE,
"
"              c_end_date            DATE)
"
"       IS
"
"   SELECT COUNT(*) v_wo_days
"
"     FROM zone_workday_calendar_hd,
"
"          zone_workday_calendar_ln
"
"    WHERE zwchd_bu       = zwcln_bu
"
"      AND zwchd_zone_id  = zwcln_zone_id
"
"      AND zwchd_clndr_no = zwcln_clndr_no
"
"      AND zwchd_bu       = p_bu
"
"      AND zwchd_zone_id  = c_zone_id
"
"      AND zwchd_clndr_id = c_clndr_id
"
"      AND zwcln_workoff  = 'Y'
"
"      AND zwchd_status   = 'A'
"
"      AND TRUNC(zwcln_date) BETWEEN TRUNC(c_start_date) AND TRUNC(c_end_date);
"
"
"
"      cr11                        c11%ROWTYPE;
"
"
"
"   CURSOR c17(c_seq_no                NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(DECODE(pppln_mode, '+', pppln_amount, '-', pppln_amount * -1)), 0) pppln_amount,
"
"          NVL(SUM(DECODE(pppln_mode, '+', pppln_amount, 0)), 0) pppln_add_amount,
"
"          NVL(SUM(DECODE(pppln_mode, '-', pppln_amount, 0)), 0) pppln_ded_amount
"
"     FROM per_pyrl_prep_ln
"
"    WHERE pppln_bu     = p_bu
"
"      AND pppln_doc_no = p_doc_no
"
"      AND pppln_seq_no = c_seq_no;
"
"
"
"      cr17                        c17%ROWTYPE;
"
"/*
"
"   CURSOR c18(c_clndr_id        VARCHAR2,
"
"             c_cat_id            VARCHAR2,
"
"             c_year            NUMBER,
"
"             c_period            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM spn_mon_wrkd_days
"
"    WHERE smwd_bu     = p_bu
"
"      AND smwd_clndr_id = c_clndr_id
"
"      AND smwd_year     = c_year
"
"      AND smwd_period     = c_period
"
"      AND smwd_cat_id    = c_cat_id
"
"      AND smwd_status    = 'A';
"
"
"
"      cr18                c18%ROWTYPE;
"
"*/
"
"   CURSOR c19(c_cat    VARCHAR)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_wage_emp_cat_wrk_hrs
"
"    WHERE hrwcwh_bu        = p_bu
"
"      AND hrwcwh_cat_id        = c_cat;
"
"
"
"      cr19        c19%ROWTYPE;
"
"
"
"   CURSOR c20(c_cat_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_wage_emp_cat_wrk_days
"
"    WHERE hrwcwd_bu = p_bu
"
"      AND hrwcwd_cat_id = c_cat_id;
"
"
"
"      cr20                    c20%ROWTYPE;
"
"
"
"      v_pyrl_calc_elmnt                VARCHAR2(10);
"
"      v_esi_calc_type                VARCHAR2(1);
"
"      v_esi_calc_elmnt                VARCHAR2(10);
"
"      v_pf_calc_type                VARCHAR2(1);
"
"      v_pf_calc_elmnt                VARCHAR2(10);
"
"      v_incent_elmnt                VARCHAR2(10);
"
"      v_ot_elmnt            VARCHAR2(10);
"
"
"
"      v_emp_seq_no                    NUMBER(5);
"
"      v_emp_sub_seq_no                NUMBER(5);
"
"
"
"      v_pyrl_doc_no                    VARCHAR2(15);
"
"      v_pyrl_elmnt_id                VARCHAR2(10);
"
"      v_pf_doc_no                    VARCHAR2(15);
"
"      v_pf_elmnt_id                    VARCHAR2(10);
"
"      v_esi_doc_no                    VARCHAR2(15);
"
"      v_esi_elmnt_id                VARCHAR2(10);
"
"
"
"      v_spn_wrkd_days            NUMBER(5, 2) := 0;
"
"      v_wrk_days                    NUMBER(5, 2) := 0;
"
"      v_ot_days                NUMBER(5, 2) := 0;
"
"      v_wrk_hrs               NUMBER(5,2) := 0;
"
"
"
"      v_wage_amt                    NUMBER(15, 3) := 0;
"
"      v_ot_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_plnt_desc                    VARCHAR2(150);
"
"      v_dept_desc                    VARCHAR2(150);
"
"      v_acct_cat_desc                VARCHAR2(150);
"
"      v_opt_flag                    VARCHAR2(1) := 'N';
"
"      v_ret_val                        NUMBER(15, 3) := 0;
"
"      v_act_ret_val                    NUMBER(15, 3) := 0;
"
"      v_res                        VARCHAR2(1) := 'N';
"
"      v_can_res                VARCHAR2(1) := 'N';
"
"      v_temp_date_from                DATE;
"
"      v_temp_date_to                DATE;
"
"      v_act_days                    NUMBER(5, 2) := 0;
"
"      v_temp_days                    NUMBER(5, 2) := 0;
"
"
"
"      v_temp_pf_amt                    NUMBER(15, 3) := 0;
"
"      v_temp_esi_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_inc_unit_rate                NUMBER(8, 3) := 0;
"
"      v_inc_amount                    NUMBER(15, 3) := 0;
"
"
"
"      v_wo_days                        NUMBER(5, 2) := 0;
"
"
"
"      v_wrk_day_calc_basis        VARCHAR2(2) := 'PD';
"
"      v_spn_flag            VARCHAR2(1) := 'N';
"
"
"
"      v_spec_days            NUMBER(5) := 0;
"
"
"
"
"
"      v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 29-jan-2020 : Ajis
"
"      v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 29-jan-2020 : Ajis
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
"            RAISE_APPLICATION_ERROR(-20985, 'HRM'||'~'||p_bu);
"
"         ELSE
"
"            v_pyrl_calc_elmnt    := cr0.hwepc_pyrl_calc_elmnt;
"
"            v_esi_calc_type      := cr0.hwepc_esi_calc_type;
"
"            v_esi_calc_elmnt     := cr0.hwepc_esi_calc_elmnt;
"
"            v_pf_calc_type       := cr0.hwepc_pf_calc_type;
"
"            v_pf_calc_elmnt      := cr0.hwepc_pf_calc_elmnt;
"
"            v_incent_elmnt       := cr0.hwepc_inc_calc_elmnt;
"
"            v_ot_elmnt         := cr0.payctrl_overtime_elmnt;
"
"            v_wrk_day_calc_basis := cr0.hwepc_wrk_day_calc_basis;
"
"            v_spec_days         := cr0.hwepc_wrk_days;
"
"            v_spn_flag         := cr0.hwepc_spn_flag;
"
"         END IF;
"
"
"
"      CLOSE c0;
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
"            DELETE
"
"              FROM per_pyrl_prep_emp
"
"             WHERE pppe_bu      = p_bu
"
"               AND pppe_doc_no  = p_doc_no
"
"               AND (pppe_seq_no = p_seq_no OR p_seq_no IS NULL);
"
"
"
"            DELETE
"
"              FROM per_pyrl_prep_ln
"
"             WHERE pppln_bu      = p_bu
"
"               AND pppln_doc_no  = p_doc_no
"
"               AND (pppln_seq_no = p_seq_no OR p_seq_no IS NULL);
"
"
"
"            IF v_wrk_day_calc_basis = 'PD' THEN
"
"               v_act_days := (TRUNC(cr1.ppphd_date_to) - TRUNC(cr1.ppphd_date_from)) + 1;
"
"            ELSIF v_wrk_day_calc_basis = 'SD' THEN
"
"               v_act_days := v_spec_days;
"
"            END IF;
"
"
"
"            FOR cr2 IN c2(cr1.ppphd_clndr_id, TRUNC(cr1.ppphd_date_to), TRUNC(cr1.ppphd_date_from),cr1.ppphd_plnt)
"
"            LOOP
"
"
"
"               v_res := 'Y';
"
"
"
"               OPEN c11(cr2.emp_zone, cr2.emp_clndr_id, TRUNC(cr1.ppphd_date_from), TRUNC(cr1.ppphd_date_to));
"
"           FETCH c11 INTO cr11;
"
"
"
"         IF c11%NOTFOUND THEN
"
"            v_wo_days := 0;
"
"         ELSE
"
"            v_wo_days := cr11.v_wo_days;
"
"         END IF;
"
"
"
"               CLOSE c11;
"
"
"
"               /* Category wise worked days based on control */
"
"
"
"           IF v_wrk_day_calc_basis IN ('CD') AND cr1.ppphd_calc_source = 'B' THEN
"
"
"
"         OPEN c20(cr2.emp_cat_id);
"
"         FETCH c20 INTO cr20;
"
"
"
"            IF c20%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20066, 'HRM'||p_bu||'~'||cr2.emp_cat_id);
"
"            ELSE
"
"               IF cr20.hrwcwd_cat_mon_flag = 'Y' THEN
"
"                  v_act_days := (TRUNC(cr1.ppphd_date_to) - TRUNC(cr1.ppphd_date_from)) + 1;
"
"                       ELSE
"
"                  v_act_days := cr20.hrwcwd_wrk_days;
"
"               END IF;
"
"
"
"               IF cr20.hrwcwd_ded_woff = 'Y' THEN
"
"              v_act_days := v_act_days - v_wo_days;
"
"               ELSE
"
"              v_act_days := v_act_days;
"
"               END IF;
"
"
"
"            END IF;
"
"
"
"         CLOSE c20;
"
"
"
"           ELSE
"
"         v_act_days := v_act_days;
"
"           END IF;
"
"
"
"              /* End of Category wise worked days */
"
"
"
"               v_wrk_hrs  := 0;
"
"               v_wrk_days := 0;
"
"
"
"           IF v_spn_flag = 'N' THEN
"
"
"
"                  IF cr2.emp_sal_wage IN ('MW') THEN
"
"
"
"                     IF  cr0.hwepc_wage_calc_basis IN ('WD') THEN
"
"
"
"                        OPEN c4(cr2.emp_emp_id, cr1.ppphd_year, cr1.ppphd_period);
"
"                        FETCH c4 INTO cr4;
"
"
"
"                          IF c4%FOUND THEN
"
"                             v_wrk_days := NVL(cr4.wage_no_of_days, 0);
"
"
"
"                             IF p_bu = 'MSL' THEN
"
"                                v_wage_amt := NVL(cr4.wage_no_of_days, 0) * (NVL(cr2.empai_per_day_wage, 0)/(v_act_days - v_wo_days));
"
"                             ELSE
"
"                                v_wage_amt := NVL(cr4.wage_no_of_days, 0) * (NVL(cr2.empai_per_day_wage, 0)/(v_act_days));
"
"                             END IF;
"
"                             --RAISE_APPLICATION_ERROR(-20000,v_wage_amt);
"
"                          ELSE
"
"                             v_wrk_days := 0;
"
"                             v_wage_amt := 0;
"
"                          END IF;
"
"
"
"                       CLOSE c4;
"
"
"
"                   END IF;
"
"
"
"                   IF cr0.hwepc_wage_calc_basis IN ('WH') THEN
"
"
"
"                       OPEN c4(cr2.emp_emp_id, cr1.ppphd_year, cr1.ppphd_period);
"
"                       FETCH c4 INTO cr4;
"
"
"
"                       IF c4%FOUND THEN
"
"                          v_wrk_hrs := NVL(cr4.wage_wrkd_hrs, 0);
"
"
"
"                  IF p_bu = 'MSL' THEN
"
"                 v_wage_amt := NVL(cr4.wage_wrkd_hrs, 0) * (NVL(cr2.empai_per_day_wage, 0)/(v_act_days - v_wo_days))/(cr2.emp_wrkg_hr);
"
"                  ELSE
"
"                 v_wage_amt := NVL(cr4.wage_wrkd_hrs, 0) * (NVL(cr2.empai_per_day_wage, 0)/v_act_days)/(cr2.emp_wrkg_hr);
"
"                  END IF;
"
"
"
"                       ELSE
"
"                         v_wrk_hrs := 0;
"
"                         v_wage_amt := 0;
"
"                       END IF;
"
"
"
"                      CLOSE c4;
"
"
"
"                   END IF;
"
"
"
"                   IF cr0.hwepc_wage_calc_basis IN ('CW') THEN
"
"
"
"                       OPEN c19(cr2.emp_cat_id);
"
"                       FETCH c19 INTO cr19;
"
"
"
"                         IF c19%FOUND THEN
"
"
"
"                           IF cr19.hrwcwh_calc_type IN ('WD') THEN
"
"
"
"                             OPEN c4(cr2.emp_emp_id, cr1.ppphd_year, cr1.ppphd_period);
"
"                             FETCH c4 INTO cr4;
"
"
"
"                             IF c4%FOUND THEN
"
"                                v_wrk_days := NVL(cr4.wage_no_of_days, 0);
"
"
"
"                IF p_bu = 'MSL' THEN
"
"                   v_wage_amt := NVL(cr4.wage_no_of_days, 0) * (NVL(cr2.empai_per_day_wage, 0)/(v_act_days - v_wo_days));
"
"                ELSE
"
"                   v_wage_amt := NVL(cr4.wage_no_of_days, 0) * (NVL(cr2.empai_per_day_wage, 0)/v_act_days);
"
"                END IF;
"
"
"
"                             ELSE
"
"                               v_wrk_days := 0;
"
"                               v_wage_amt := 0;
"
"                             END IF;
"
"
"
"                             CLOSE c4;
"
"
"
"                           END IF;
"
"
"
"                           IF  cr19.hrwcwh_calc_type IN ('WH') THEN
"
"
"
"                             OPEN c4(cr2.emp_emp_id, cr1.ppphd_year, cr1.ppphd_period);
"
"                             FETCH c4 INTO cr4;
"
"
"
"                             IF c4%FOUND THEN
"
"                                v_wrk_hrs := NVL(cr4.wage_wrkd_hrs, 0);
"
"
"
"                IF p_bu = 'MSL' THEN
"
"                   v_wage_amt := NVL(cr4.wage_wrkd_hrs, 0) * (NVL(cr2.empai_per_day_wage, 0)/(v_act_days - v_wo_days))/(cr2.emp_wrkg_hr);
"
"                ELSE
"
"                   v_wage_amt := NVL(cr4.wage_wrkd_hrs, 0) * (NVL(cr2.empai_per_day_wage, 0)/v_act_days)/(cr2.emp_wrkg_hr);
"
"                END IF;
"
"
"
"                             ELSE
"
"                               v_wrk_hrs := 0;
"
"                               v_wage_amt := 0;
"
"                             END IF;
"
"
"
"                             CLOSE c4;
"
"
"
"                           END IF;
"
"
"
"                         ELSE
"
"                           RAISE_APPLICATION_ERROR(-20988,'HRM'||'~'||cr2.emp_emp_id||'~'||cr2.emp_cat_id);
"
"                         END IF;
"
"
"
"                       CLOSE c19;
"
"
"
"                  END IF;
"
"
"
"                  ELSIF cr2.emp_sal_wage IN ('DW') THEN
"
"
"
"                     OPEN c4(cr2.emp_emp_id, cr1.ppphd_year, cr1.ppphd_period);
"
"                     FETCH c4 INTO cr4;
"
"
"
"                        IF c4%FOUND THEN
"
"                           v_wrk_days := NVL(cr4.wage_no_of_days, 0);
"
"                           v_wage_amt := NVL(cr4.wage_no_of_days, 0) * NVL(cr2.empai_per_day_wage, 0);
"
"                        ELSE
"
"                           v_wrk_days := 0;
"
"                           v_wage_amt := 0;
"
"                        END IF;
"
"
"
"                     CLOSE c4;
"
"
"
"                  ELSE
"
"                     RAISE_APPLICATION_ERROR(-20999, 'HRM');
"
"                  END IF;
"
"
"
"               ELSE
"
"                 /*
"
"                  OPEN c18(cr2.emp_clndr_id, cr2.emp_cat_id, cr1.ppphd_year, cr1.ppphd_period);
"
"                  FETCH c18 INTO cr18;
"
"
"
"                     IF c18%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||cr2.emp_clndr_id||'~'||cr2.emp_cat_id||'~'||cr1.ppphd_year||'~'||cr1.ppphd_period);
"
"                     ELSE
"
"                        v_spn_wrkd_days := cr18.smwd_wrkd_days;
"
"                     END IF;
"
"
"
"                  CLOSE c18;
"
"                  */
"
"                  OPEN c4(cr2.emp_emp_id, cr1.ppphd_year, cr1.ppphd_period);
"
"                  FETCH c4 INTO cr4;
"
"
"
"                     IF c4%NOTFOUND THEN
"
"                        v_wrk_days := 0;
"
"                        v_ot_days  := 0;
"
"                        v_wage_amt := 0;
"
"                     ELSE
"
"
"
"            IF NVL(cr4.wage_no_of_days, 0) >= v_spn_wrkd_days THEN
"
"                           v_wrk_days := v_spn_wrkd_days;
"
"                           v_ot_days  := NVL(cr4.wage_no_of_days, 0) - v_spn_wrkd_days;
"
"                        ELSE
"
"                           v_wrk_days := NVL(cr4.wage_no_of_days, 0);
"
"                           v_ot_days  := 0;
"
"                        END IF;
"
"
"
"                        IF cr2.emp_sal_wage IN ('MW') THEN
"
"                           v_wage_amt := v_wrk_days * (NVL(cr2.empai_per_day_wage, 0)/v_act_days);
"
"                           v_ot_amt   := v_ot_days * (NVL(cr2.empai_per_day_wage, 0)/v_act_days);
"
"                        ELSIF cr2.emp_sal_wage IN ('DW') THEN
"
"                           v_wage_amt := v_wrk_days * NVL(cr2.empai_per_day_wage, 0);
"
"                           v_ot_amt   := v_ot_days * NVL(cr2.empai_per_day_wage, 0);
"
"                        ELSE
"
"                           RAISE_APPLICATION_ERROR(-20999, 'HRM');
"
"                        END IF;
"
"                        raise_application_error(-20000,v_wage_amt);
"
"                     END IF;
"
"
"
"                  CLOSE c4;
"
"
"
"               END IF;
"
"
"
"               DELETE pyrl_inter_values
"
"                WHERE piv_bu     = p_bu
"
"                  AND piv_year   = cr1.ppphd_year
"
"                  AND piv_period = cr1.ppphd_period
"
"                  AND piv_emp_id = cr2.emp_emp_id;
"
"
"
"               SELECT NVL(MAX(pppe_seq_no), 0) + 1
"
"                 INTO v_emp_seq_no
"
"                 FROM per_pyrl_prep_emp
"
"                WHERE pppe_bu     = p_bu
"
"                  AND pppe_doc_no = p_doc_no;
"
"
"
"               IF cr2.empai_plnt IS NOT NULL THEN
"
"                  v_plnt_desc := func_find_plnt_desc(p_bu, cr2.empai_plnt, 1);
"
"               END IF;
"
"
"
"               IF cr2.empai_dept_id IS NOT NULL THEN
"
"                  v_dept_desc := func_find_dept_desc(p_bu, cr2.empai_dept_id, 1);
"
"               END IF;
"
"
"
"               IF cr2.emp_acct_cat_id IS NOT NULL THEN
"
"                  v_acct_cat_desc := func_find_acct_cat_desc(p_bu, cr2.emp_acct_cat_id, 1);
"
"               END IF;
"
"          /*
"
"           IF cr2.empai_per_day_wage > 0 THEN
"
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||cr2.emp_emp_id||'~'||cr2.empai_per_day_wage);
"
"           END IF;
"
"           */
"
"               INSERT INTO per_pyrl_prep_emp(pppe_bu            ,
"
"                         pppe_doc_no        ,
"
"                         pppe_seq_no        ,
"
"                         pppe_emp_id         ,
"
"                         pppe_emp_name      ,
"
"                         pppe_plnt          ,
"
"                         pppe_plnt_desc     ,
"
"                         pppe_dept_id        ,
"
"                         pppe_dept_desc     ,
"
"                         pppe_acct_cat_id   ,
"
"                         pppe_acct_cat_desc ,
"
"                         pppe_workin_days   ,
"
"                         pppe_workin_hrs    ,
"
"                         pppe_per_day_wage  ,
"
"                         pppe_net_round_off ,
"
"                         pppe_net_rounded   ,
"
"                         pppe_net_salary    ,
"
"                         pppe_cre_by        ,
"
"                         pppe_cre_ip_addr   ,        --added 29-jan-2020 : Ajis
"
"                         pppe_cre_os_user   ,        --added 29-jan-2020 : Ajis
"
"                         pppe_cre_date        )
"
"                      VALUES(p_bu            ,                --pppe_bu
"
"                         p_doc_no            ,                --pppe_doc_no
"
"                         v_emp_seq_no        ,                --pppe_seq_no
"
"                         cr2.emp_emp_id        ,                --pppe_emp_id
"
"                         cr2.emp_first_name1,                --pppe_emp_name
"
"                         cr2.empai_plnt        ,                --pppe_plnt
"
"                         v_plnt_desc        ,                --pppe_plnt_desc
"
"                         cr2.empai_dept_id  ,                --pppe_dept_id
"
"                         v_dept_desc        ,                --pppe_dept_desc
"
"                         cr2.emp_acct_cat_id,                --pppe_acct_cat_id
"
"                         v_acct_cat_desc    ,                --pppe_acct_cat_desc
"
"                         v_wrk_days            ,                --pppe_workin_days
"
"                         v_wrk_hrs        ,        --pppe_workin_hrs
"
"                         cr2.empai_per_day_wage,              --pppe_per_day_wage
"
"                         0                 ,                --pppe_net_round_off
"
"                         0                ,                --pppe_net_rounded
"
"                         0                ,                --pppe_net_salary
"
"                         p_user            ,                --pppe_cre_by
"
"                         v_ip_addr        ,              --pppe_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                         v_os_user        ,              --pppe_cre_os_user        --added 29-jan-2020 : Ajis
"
"                         SYSDATE          );               --pppe_cre_date
"
"
"
"           IF v_ot_days > 0 THEN
"
"
"
"                   SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"                       INTO v_emp_sub_seq_no
"
"            FROM per_pyrl_prep_ln
"
"           WHERE pppln_bu     = p_bu
"
"             AND pppln_doc_no = p_doc_no
"
"             AND pppln_seq_no = v_emp_seq_no;
"
"
"
"                  INSERT INTO per_pyrl_prep_ln(pppln_bu             ,
"
"                           pppln_doc_no             ,
"
"                           pppln_seq_no             ,
"
"                           pppln_sub_seq_no       ,
"
"                           pppln_elmnt_id         ,
"
"                           pppln_mode             ,
"
"                           pppln_amount             ,
"
"                           pppln_actual_amt       ,
"
"                           pppln_adj_no             ,
"
"                           pppln_reference        ,
"
"                           pppln_cre_by             ,
"
"                           pppln_cre_ip_addr    ,
"
"                           pppln_cre_os_user    ,
"
"                           pppln_cre_date         )
"
"                    VALUES(p_bu                 ,
"
"                           p_doc_no             ,
"
"                           v_emp_seq_no             ,
"
"                           v_emp_sub_seq_no       ,
"
"                           v_ot_elmnt        ,
"
"                           '+'                     ,
"
"                           v_ot_amt             ,
"
"                           0                  ,
"
"                           NULL                    ,
"
"                           'OVERTIME AMOUNT FOR '||v_ot_days||' DAYS.',
"
"                           p_user                 ,
"
"                           v_ip_addr        ,
"
"                           v_os_user        ,
"
"                           SYSDATE                 );
"
"
"
"           END IF;
"
"
"
"               /* Start to Insert Employee Allowances Details */
"
"
"
"               FOR cr6 IN c6(cr2.emp_emp_id, TRUNC(cr1.ppphd_date_from), TRUNC(cr1.ppphd_date_to))
"
"               LOOP
"
"
"
"                  IF cr6.pehd_type IN ('FL','B') THEN
"
"
"
"                     IF TRUNC(cr6.epa_start_date) > TRUNC(cr1.ppphd_date_from) THEN
"
"                        v_temp_date_from := TRUNC(cr6.epa_start_date);
"
"                     ELSE
"
"                        v_temp_date_from := TRUNC(cr1.ppphd_date_from);
"
"                     END IF;
"
"
"
"                     IF TRUNC(cr6.epa_end_date) > TRUNC(cr1.ppphd_date_to) THEN
"
"                        v_temp_date_to := TRUNC(cr1.ppphd_date_to);
"
"                     ELSE
"
"                        v_temp_date_to := TRUNC(cr6.epa_end_date);
"
"                     END IF;
"
"                    --raise_application_error(-20010,cr2.emp_emp_id||'-'||v_act_days);
"
"                     v_temp_days := (v_temp_date_to - v_temp_date_from) + 1;
"
"                     --v_act_ret_val := NVL((cr6.epa_per_amt/v_act_days) * v_temp_days, 0);
"
"                     v_act_ret_val := NVL((cr6.epa_per_amt/v_act_days) * v_wrk_days, 0);
"
"
"
"                      SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"                          INTO v_emp_sub_seq_no
"
"               FROM per_pyrl_prep_ln
"
"              WHERE pppln_bu     = p_bu
"
"                AND pppln_doc_no = p_doc_no
"
"                AND pppln_seq_no = v_emp_seq_no;
"
"
"
"                     INSERT INTO per_pyrl_prep_ln(pppln_bu             ,
"
"                          pppln_doc_no             ,
"
"                          pppln_seq_no             ,
"
"                          pppln_sub_seq_no       ,
"
"                          pppln_elmnt_id         ,
"
"                          pppln_mode             ,
"
"                          pppln_amount             ,
"
"                          pppln_actual_amt       ,
"
"                          pppln_adj_no             ,
"
"                          pppln_reference        ,
"
"                          pppln_cre_by             ,
"
"                          pppln_cre_ip_addr    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_os_user    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_date         )
"
"                       VALUES(p_bu                 ,
"
"                          p_doc_no             ,
"
"                          v_emp_seq_no             ,
"
"                          v_emp_sub_seq_no       ,
"
"                          cr6.pehd_elmnt_id      ,
"
"                          '+'                 ,
"
"                           cr6.epa_per_amt    * v_wrk_days         ,
"
"                          cr6.epa_per_amt    ,
"
"                          NULL                ,
"
"                          cr6.pehd_desc1|| ' FOR '||v_wrk_days||' DAY(S) '||v_act_days||'~'||v_temp_days||'~'||cr6.epa_per_amt,
"
"                          p_user             ,
"
"                          v_ip_addr        ,         --pppln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                          v_os_user        ,         --pppln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                          SYSDATE             );
"
"
"
"                  END IF;
"
"
"
"               END LOOP c6;
"
"
"
"               /* End to Insert Employee Allowances Details */
"
"
"
"               /* Start to Insert Employee Adjustment details */
"
"
"
"               FOR cr7 IN c7(cr2.emp_emp_id, cr1.ppphd_year, cr1.ppphd_period)
"
"               LOOP
"
"
"
"                  IF cr7.pehd_type IN ('FA') THEN
"
"
"
"             SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"               INTO v_emp_sub_seq_no
"
"               FROM per_pyrl_prep_ln
"
"              WHERE pppln_bu     = p_bu
"
"                AND pppln_doc_no = p_doc_no
"
"                AND pppln_seq_no = v_emp_seq_no;
"
"
"
"                     INSERT INTO per_pyrl_prep_ln(pppln_bu             ,
"
"                          pppln_doc_no             ,
"
"                          pppln_seq_no             ,
"
"                          pppln_sub_seq_no       ,
"
"                          pppln_elmnt_id         ,
"
"                          pppln_mode             ,
"
"                          pppln_amount             ,
"
"                          pppln_actual_amt       ,
"
"                          pppln_adj_no             ,
"
"                          pppln_reference        ,
"
"                          pppln_cre_by             ,
"
"                          pppln_cre_ip_addr    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_os_user    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_date         )
"
"                       VALUES(p_bu                 ,
"
"                          p_doc_no             ,
"
"                          v_emp_seq_no             ,
"
"                          v_emp_sub_seq_no       ,
"
"                          cr7.pehd_elmnt_id      ,
"
"                          cr7.epadj_mode         ,
"
"                          cr7.epadj_per_amt      ,
"
"                          0              ,
"
"                          cr7.epadj_adj_no       ,
"
"                          cr7.pehd_desc1|| ' FOR '||v_wrk_days||' DAY(S)',
"
"                          p_user             ,
"
"                          v_ip_addr        ,         --pppln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                          v_os_user        ,         --pppln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                          SYSDATE             );
"
"
"
"                  END IF;
"
"
"
"                  IF cr7.pehd_type IN ('VA', '3RD', 'TDE', 'CA') AND cr7.pehd_acct_type NOT IN ('L') THEN
"
"
"
"                     proc_calc_pay_elements_wage(p_bu,
"
"                         'N',
"
"                         TRUNC(cr1.ppphd_date_from),
"
"                         TRUNC(cr1.ppphd_date_to),
"
"                         cr7.pehd_elmnt_id,
"
"                         v_opt_flag,
"
"                         cr2.emp_emp_id,
"
"                         cr7.epadj_mode,
"
"                         v_ret_val,
"
"                         v_act_ret_val,
"
"                         cr2.emp_pay_basis);
"
"
"
"             SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"               INTO v_emp_sub_seq_no
"
"               FROM per_pyrl_prep_ln
"
"              WHERE pppln_bu     = p_bu
"
"                AND pppln_doc_no = p_doc_no
"
"                AND pppln_seq_no = v_emp_seq_no;
"
"
"
"                     INSERT INTO per_pyrl_prep_ln(pppln_bu             ,
"
"                          pppln_doc_no             ,
"
"                          pppln_seq_no             ,
"
"                          pppln_sub_seq_no       ,
"
"                          pppln_elmnt_id         ,
"
"                          pppln_mode             ,
"
"                          pppln_amount           ,
"
"                          pppln_actual_amt       ,
"
"                          pppln_adj_no             ,
"
"                          pppln_reference        ,
"
"                          pppln_cre_by            ,
"
"                          pppln_cre_ip_addr    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_os_user    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_date         )
"
"                       VALUES(p_bu                 ,
"
"                          p_doc_no             ,
"
"                          v_emp_seq_no             ,
"
"                          v_emp_sub_seq_no       ,
"
"                          cr7.pehd_elmnt_id      ,
"
"                          cr7.epadj_mode         ,
"
"                          v_ret_val             ,
"
"                          v_act_ret_val         ,
"
"                          cr7.epadj_adj_no       ,
"
"                          cr7.pehd_desc1|| ' FOR '||v_wrk_days||' DAY(S)',
"
"                          p_user             ,
"
"                          v_ip_addr        ,         --pppln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                          v_os_user        ,         --pppln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                          SYSDATE             );
"
"
"
"                END IF;
"
"
"
"                /* Start to insert PF Details Monthly */
"
"
"
"               /*
"
"               IF cr7.pehd_type IN ('CA', 'CA3') AND cr2.emp_pf_elgbl_flag = 'Y' AND cr7.pehd_acct_type IN ('L') THEN
"
"
"
"                      proc_calc_pay_elements_wage(p_bu,
"
"                         'N',
"
"                         TRUNC(cr1.ppphd_date_from),
"
"                         TRUNC(cr1.ppphd_date_to),
"
"                         cr7.pehd_elmnt_id,
"
"                         v_opt_flag,
"
"                         cr2.emp_emp_id,
"
"                         cr7.epadj_mode,
"
"                         v_ret_val,
"
"                         v_act_ret_val,
"
"                         cr2.emp_pay_basis,
"
"                         cr7.epadj_adj_no);
"
"
"
"             SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"               INTO v_emp_sub_seq_no
"
"               FROM per_pyrl_prep_ln
"
"              WHERE pppln_bu     = p_bu
"
"            AND pppln_doc_no = p_doc_no
"
"            AND pppln_seq_no = v_emp_seq_no;
"
"
"
"             INSERT INTO per_pyrl_prep_ln(pppln_bu             ,
"
"                          pppln_doc_no             ,
"
"                          pppln_seq_no             ,
"
"                          pppln_sub_seq_no       ,
"
"                          pppln_elmnt_id         ,
"
"                          pppln_mode             ,
"
"                          pppln_amount             ,
"
"                          pppln_actual_amt       ,
"
"                          pppln_adj_no             ,
"
"                          pppln_reference        ,
"
"                          pppln_cre_by             ,
"
"                          pppln_cre_ip_addr    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_os_user    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_date         )
"
"                       VALUES(p_bu                 ,
"
"                          p_doc_no             ,
"
"                          v_emp_seq_no             ,
"
"                          v_emp_sub_seq_no       ,
"
"                          cr7.pehd_elmnt_id      ,
"
"                          cr7.epadj_mode         ,
"
"                          ROUND(v_ret_val)      ,
"
"                          v_act_ret_val         ,
"
"                          cr7.epadj_adj_no       ,
"
"                          cr7.pehd_desc1|| ' FOR '||v_wrk_days||' DAY(S)',
"
"                          p_user             ,
"
"                          v_ip_addr        ,         --pppln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                          v_os_user        ,         --pppln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                          SYSDATE             );
"
"
"
"             IF cr7.pehd_type IN ('CA3') THEN
"
"
"
"            SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"              INTO v_emp_sub_seq_no
"
"              FROM per_pyrl_prep_ln
"
"             WHERE pppln_bu     = p_bu
"
"               AND pppln_doc_no = p_doc_no
"
"               AND pppln_seq_no = v_emp_seq_no;
"
"
"
"            INSERT INTO per_pyrl_prep_ln(pppln_bu           ,
"
"                             pppln_doc_no        ,
"
"                             pppln_seq_no        ,
"
"                             pppln_sub_seq_no   ,
"
"                             pppln_elmnt_id     ,
"
"                             pppln_mode         ,
"
"                             pppln_amount        ,
"
"                             pppln_actual_amt   ,
"
"                             pppln_adj_no        ,
"
"                             pppln_reference    ,
"
"                             pppln_cre_by        ,
"
"                             pppln_cre_ip_addr    ,        --added 29-jan-2020 : Ajis
"
"                             pppln_cre_os_user    ,        --added 29-jan-2020 : Ajis
"
"                             pppln_cre_date     )
"
"                          VALUES(p_bu            ,
"
"                             p_doc_no           ,
"
"                             v_emp_seq_no        ,
"
"                             v_emp_sub_seq_no   ,
"
"                             cr7.pehd_elmnt_id  ,
"
"                             DECODE(cr7.epadj_mode, '+', '-', '-', '+'),
"
"                             ROUND(v_ret_val)    ,
"
"                             v_act_ret_val        ,
"
"                             cr7.epadj_adj_no   ,
"
"                             cr7.pehd_desc1|| ' FOR '||v_wrk_days||' DAY(S)',
"
"                             p_user                ,
"
"                             v_ip_addr        ,         --pppln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                             v_os_user        ,         --pppln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                             SYSDATE            );
"
"
"
"             END IF;
"
"
"
"          END IF;
"
"                 */----bala
"
"          /* End to insert PF Details Monthly */
"
"
"
"          /* Start to insert ESI Details Monthly */
"
"               /*
"
"          IF cr7.pehd_type IN ('RCA', 'RC3')  AND cr2.emp_esi_elgbl_flag = 'Y' AND cr7.pehd_acct_type IN ('L') THEN
"
"
"
"             proc_calc_pay_elements_wage(p_bu,
"
"                         'N',
"
"                         TRUNC(cr1.ppphd_date_from),
"
"                         TRUNC(cr1.ppphd_date_to),
"
"                         cr7.pehd_elmnt_id,
"
"                         v_opt_flag,
"
"                         cr2.emp_emp_id,
"
"                         cr7.epadj_mode,
"
"                         v_ret_val,
"
"                         v_act_ret_val,
"
"                         cr2.emp_pay_basis,
"
"                         cr7.epadj_adj_no);
"
"
"
"
"
"                         raise_application_error(-20999,'HRM'||'~'||v_act_ret_val);
"
"
"
"             SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"               INTO v_emp_sub_seq_no
"
"               FROM per_pyrl_prep_ln
"
"              WHERE pppln_bu     = p_bu
"
"            AND pppln_doc_no = p_doc_no
"
"            AND pppln_seq_no = v_emp_seq_no;
"
"
"
"             INSERT INTO per_pyrl_prep_ln(pppln_bu             ,
"
"                          pppln_doc_no             ,
"
"                          pppln_seq_no             ,
"
"                          pppln_sub_seq_no       ,
"
"                          pppln_elmnt_id         ,
"
"                          pppln_mode             ,
"
"                          pppln_amount             ,
"
"                          pppln_actual_amt       ,
"
"                          pppln_adj_no             ,
"
"                          pppln_reference        ,
"
"                          pppln_cre_by             ,
"
"                          pppln_cre_ip_addr    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_os_user    ,        --added 29-jan-2020 : Ajis
"
"                          pppln_cre_date         )
"
"                       VALUES(p_bu                 ,
"
"                          p_doc_no             ,
"
"                          v_emp_seq_no             ,
"
"                          v_emp_sub_seq_no       ,
"
"                          cr7.pehd_elmnt_id      ,
"
"                          cr7.epadj_mode         ,
"
"                          CEIL(v_ret_val)       ,
"
"                          v_act_ret_val         ,
"
"                          cr7.epadj_adj_no       ,
"
"                          cr7.pehd_desc1|| ' FOR '||v_wrk_days||' DAY(S)',
"
"                          p_user             ,
"
"                          v_ip_addr        ,         --pppln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                          v_os_user        ,         --pppln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                          SYSDATE             );
"
"
"
"             IF cr7.pehd_type IN ('RC3') THEN
"
"
"
"            SELECT NVL(MAX(pppln_sub_seq_no), 0) + 1
"
"              INTO v_emp_sub_seq_no
"
"              FROM per_pyrl_prep_ln
"
"             WHERE pppln_bu     = p_bu
"
"               AND pppln_doc_no = p_doc_no
"
"               AND pppln_seq_no = v_emp_seq_no;
"
"
"
"            INSERT INTO per_pyrl_prep_ln(pppln_bu           ,
"
"                             pppln_doc_no        ,
"
"                             pppln_seq_no        ,
"
"                             pppln_sub_seq_no   ,
"
"                             pppln_elmnt_id     ,
"
"                             pppln_mode         ,
"
"                             pppln_amount        ,
"
"                             pppln_actual_amt   ,
"
"                             pppln_adj_no        ,
"
"                             pppln_reference    ,
"
"                             pppln_cre_by        ,
"
"                             pppln_cre_ip_addr    ,        --added 29-jan-2020 : Ajis
"
"                             pppln_cre_os_user    ,        --added 29-jan-2020 : Ajis
"
"                             pppln_cre_date     )
"
"                          VALUES(p_bu            ,
"
"                             p_doc_no           ,
"
"                             v_emp_seq_no       ,
"
"                             v_emp_sub_seq_no   ,
"
"                             cr7.pehd_elmnt_id  ,
"
"                             DECODE(cr7.epadj_mode, '+', '-', '-', '+'),
"
"                             CEIL(v_ret_val)    ,
"
"                             v_act_ret_val      ,
"
"                             cr7.epadj_adj_no   ,
"
"                             cr7.pehd_desc1|| ' FOR '||v_wrk_days||' DAY(S)',
"
"                             p_user             ,
"
"                             v_ip_addr        ,         --pppln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                             v_os_user        ,         --pppln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                             SYSDATE            );
"
"
"
"             END IF;
"
"
"
"          END IF;
"
"               */---bala
"
"
"
"          /* End to insert ESI Details Monthly */
"
"
"
"               END LOOP c7;
"
"
"
"           /* Start to insert Professional Tax */
"
"
"
"           proc_calc_pt_tax(p_bu,
"
"                       cr2.emp_emp_id,
"
"                       cr1.ppphd_year,
"
"                       cr1.ppphd_period,
"
"                       p_user,
"
"                       NULL,
"
"                       'W',
"
"                p_doc_no);
"
"
"
"           /* Start to insert Labour Welfare Fund */
"
"
"
"
"
"           proc_ins_wage_payroll_pf_esi(p_bu,
"
"                                                            TRUNC(cr1.ppphd_date_from),
"
"                                                            TRUNC(cr1.ppphd_date_to),
"
"                                                            cr1.ppphd_year,
"
"                                                            cr1.ppphd_period,
"
"                                                            cr2.emp_emp_id,
"
"                                                             p_user,
"
"                                                             '1',
"
"                                                            p_doc_no,
"
"                                                           v_emp_seq_no);
"
"
"
"           proc_emp_lwf_calc (p_bu,
"
"                         cr2.emp_emp_id,
"
"                         cr1.ppphd_year,
"
"                         cr1.ppphd_period,
"
"                         p_user,
"
"                         NULL,
"
"                         'W',
"
"                  p_doc_no);
"
"           /*
"
"           IF v_spn_flag = 'Y' THEN
"
"
"
"              proc_calc_emp_canteen_dtls(p_bu,
"
"                         p_doc_no,
"
"                         cr2.emp_emp_id,
"
"                         v_emp_seq_no,
"
"                         NVL(cr4.wage_no_of_days, 0),
"
"                         p_user,
"
"                         v_can_res);
"
"
"
"           END IF;
"
"           */
"
"               OPEN c17(v_emp_seq_no);
"
"               FETCH c17 INTO cr17;
"
"               CLOSE c17;
"
"
"
"               UPDATE per_pyrl_prep_emp
"
"                  SET pppe_net_salary   = cr17.pppln_amount,
"
"                      pppe_add_amount   = cr17.pppln_add_amount,
"
"                      pppe_ded_amount   = cr17.pppln_ded_amount,
"
"                      pppe_upd_by       = p_user,
"
"                      pppe_upd_ip_addr  = v_ip_addr,            --added 29-jan-2020 : Ajis
"
"              pppe_upd_os_user  = v_os_user,            --added 29-jan-2020 : Ajis
"
"                      pppe_upd_date     = SYSDATE
"
"                WHERE pppe_bu     = p_bu
"
"                  AND pppe_doc_no = p_doc_no
"
"                  AND pppe_seq_no = v_emp_seq_no;
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
"   END proc_prepare_emp_monthly_wage;
"
"
"
"   PROCEDURE proc_process_emp_monthly_wage(p_bu                            VARCHAR2,
"
"                       p_doc_no                        VARCHAR2,
"
"                       p_user                        VARCHAR2,
"
"                       p_res            OUT            VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_wage_emp_pyrl_ctrl,
"
"          payroll_control
"
"    WHERE hwepc_bu = p_bu
"
"      AND hwepc_bu = payctrl_bu;
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
"     FROM per_pyrl_prep_hd
"
"    WHERE ppphd_bu     = p_bu
"
"      AND ppphd_doc_no = p_doc_no
"
"      AND ppphd_status = 'R';
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
"     FROM per_pyrl_prep_emp,
"
"          employees,
"
"          emp_active_infos
"
"    WHERE pppe_bu  = emp_bu
"
"      AND pppe_emp_id = emp_emp_id
"
"      AND emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_status    = 'A'
"
"      AND emp_type      = 'E'
"
"      AND emp_pay_basis = 'W'
"
"      AND pppe_bu     = p_bu
"
"      AND pppe_doc_no = p_doc_no
"
"    ORDER BY pppe_seq_no;
"
"
"
"   CURSOR c3(c_seq_no                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM per_pyrl_prep_ln,
"
"          payroll_elements_hd
"
"    WHERE pppln_bu       = pehd_bu
"
"      AND pppln_elmnt_id = pehd_elmnt_id
"
"      AND pppln_bu       = p_bu
"
"      AND pppln_doc_no   = p_doc_no
"
"      AND pppln_seq_no   = c_seq_no
"
"    ORDER BY pppln_sub_seq_no;
"
"
"
"
"
"      v_payroll_ref                    VARCHAR2(500);
"
"      v_payroll_no                    VARCHAR2(15);
"
"      v_batch_no                    VARCHAR2(30);
"
"      v_mon_days                    NUMBER(5);
"
"      v_paid_leave_days                 NUMBER(5);
"
"      v_unpaid_leave_days               NUMBER(5);
"
"      v_spn_flag            VARCHAR2(1) := 'N';
"
"      v_spn_res                VARCHAR2(1) := 'N';
"
"      v_res                        VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 29-jan-2020 : Ajis
"
"      v_os_user                VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 29-jan-2020 : Ajis
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
"            RAISE_APPLICATION_ERROR(-20985,'HRM'||p_bu);
"
"         END IF;
"
"
"
"      CLOSE c0;
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
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||p_doc_no);
"
"         ELSE
"
"
"
"            v_mon_days   := (TRUNC(cr1.ppphd_date_to) - TRUNC(cr1.ppphd_date_from)) + 1;
"
"            --v_batch_no    := func_find_hrm_next_id(p_bu, 'EMP_BATCH_NO');
"
"            v_batch_no    := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'PBN',p_user);
"
"            v_payroll_ref := 'PAYROLL JOURNAL POSTING FOR THE MONTH OF '||TO_CHAR(cr1.ppphd_date_to,'MON')||' '||cr1.ppphd_year;
"
"
"
"         IF cr0.payctrl_wage_jrnl_flag = 'Y' THEN
"
"
"
"        INSERT INTO pyrl_proc_batch_hd(ppbh_bu         ,
"
"                              ppbh_pfx          ,
"
"                              ppbh_batch_no   ,
"
"                              ppbh_jrnl_date  ,
"
"                              ppbh_year       ,
"
"                              ppbh_period     ,
"
"                              ppbh_ref        ,
"
"                              ppbh_status     ,
"
"                              ppbh_pyrl_type  ,
"
"                              ppbh_batch_proc_plnts,
"
"                              ppbh_cre_by     ,
"
"                              ppbh_cre_ip_addr,        --added 29-jan-2020 : Ajis
"
"                              ppbh_cre_os_user,        --added 29-jan-2020 : Ajis
"
"                              ppbh_cre_date   )
"
"                       VALUES(p_bu            ,        --ppbh_bu
"
"                              'PBN'          ,        --ppbh_pfx
"
"                              v_batch_no      ,        --ppbh_batch_no
"
"                              SYSDATE          ,           --ppbh_jrnl_date
"
"                              cr1.ppphd_year  ,        --ppbh_year
"
"                              cr1.ppphd_period,        --ppbh_period
"
"                              v_payroll_ref   ,        --ppbh_ref
"
"                              'N'             ,        --ppbh_status
"
"                              'P'          ,        --ppbh_pyrl_type
"
"                              cr1.ppphd_plnt  ,           --ppbh_batch_proc_plnts
"
"                              p_user          ,        --ppbh_cre_by
"
"                              v_ip_addr          ,     --ppbh_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                              v_os_user          ,        --ppbh_cre_os_user        --added 29-jan-2020 : Ajis
"
"                              SYSDATE         );    --ppbh_cre_date
"
"
"
"        END IF;
"
"
"
"    FOR cr2 IN c2
"
"    LOOP
"
"
"
"               SELECT NVL(MAX(TO_NUMBER(phhd_pyrl_no)), 0) + 1
"
"         INTO v_payroll_no
"
"         FROM payroll_hist_hd
"
"            WHERE phhd_bu = p_bu;
"
"
"
"           SELECT NVL(SUM(empleave_apprvd_days),0)
"
"             INTO v_paid_leave_days
"
"             FROM emp_leave_dtls_view
"
"            WHERE empleave_bu     = p_bu
"
"              AND empleave_year   = cr1.ppphd_year
"
"              AND empleave_period = cr1.ppphd_period
"
"              AND empleave_emp_id = cr2.pppe_emp_id
"
"              AND empleave_oper   = '-'
"
"              AND empleave_status = 'P'
"
"              AND empleave_type   = 'L'
"
"              AND empleave_leave_type = 'A';
"
"
"
"           SELECT NVL(SUM(empleave_apprvd_days),0)
"
"             INTO v_unpaid_leave_days
"
"             FROM emp_leave_dtls_view
"
"            WHERE empleave_bu     = p_bu
"
"              AND empleave_year   = cr1.ppphd_year
"
"              AND empleave_period = cr1.ppphd_period
"
"              AND empleave_emp_id = cr2.pppe_emp_id
"
"              AND empleave_oper   = '-'
"
"              AND empleave_status = 'P'
"
"              AND empleave_type   = 'L'
"
"              AND empleave_leave_type = 'P';
"
"
"
"               INSERT INTO payroll_hist_hd(phhd_bu             ,
"
"                           phhd_process_batch_no ,
"
"                           phhd_pyrl_no             ,
"
"                           phhd_plnt             ,
"
"                           phhd_pyrl_type         ,
"
"                           phhd_year             ,
"
"                           phhd_period             ,
"
"                           phhd_emp_id             ,
"
"                           phhd_emp_name         ,
"
"                           phhd_acct_cat_id         ,
"
"                           phhd_dept_id             ,
"
"                           phhd_emp_plnt         ,
"
"                           phhd_plnt_loc_id    ,
"
"                           phhd_mon_days         ,
"
"                           phhd_workin_days         ,
"
"                           phhd_tot_paid_days    ,
"
"                           phhd_paid_leave_days  ,
"
"                           phhd_unpaid_leave_days,
"
"                           phhd_posted             ,
"
"                           phhd_actual_net         ,
"
"                           phhd_net_payable         ,
"
"                           phhd_net_bfr_round    ,
"
"                           phhd_net_afr_round    ,
"
"                           phhd_inprog_amt         ,
"
"                           phhd_process_date     ,
"
"                           phhd_pay_in_progress  ,
"
"                           phhd_status             ,
"
"                           phhd_paid_amt         ,
"
"                           phhd_check_flag         ,
"
"                           phhd_type             ,
"
"                           phhd_hold_flag         ,
"
"                           phhd_date_from         ,
"
"                           phhd_date_to             ,
"
"                           phhd_subcntr_id         ,
"
"                           phhd_emp_type         ,
"
"                           phhd_esi_flag    ,
"
"                           phhd_pf_flag        ,
"
"                           phhd_cre_by             ,
"
"                           phhd_cre_ip_addr     ,          --added 29-jan-2020 : Ajis
"
"                           phhd_cre_os_user     ,          --added 29-jan-2020 : Ajis
"
"                           phhd_cre_date   ,
"
"                           phhd_job_id      ,
"
"                           phhd_pos_id      ,
"
"                           phhd_loc_id      ,
"
"                           phhd_grade_id    ,
"
"                           phhd_emp_group
"
"                           )
"
"                    VALUES(p_bu                 ,            --phhd_bu
"
"                           v_batch_no             ,            --phhd_process_batch_no
"
"                           v_payroll_no             ,            --phhd_pyrl_no
"
"                           cr2.pppe_plnt         ,            --phhd_plnt
"
"                           'N'                 ,            --phhd_pyrl_type
"
"                           cr1.ppphd_year         ,            --phhd_year
"
"                           cr1.ppphd_period         ,            --phhd_period
"
"                           cr2.pppe_emp_id         ,            --phhd_emp_id
"
"                           cr2.pppe_emp_name     ,            --phhd_emp_name
"
"                           cr2.pppe_acct_cat_id  ,            --phhd_acct_cat_id
"
"                           cr2.pppe_dept_id      ,            --phhd_dept_id
"
"                           cr2.pppe_plnt         ,            --phhd_emp_plnt
"
"                           cr2.emp_asgnd_plnt_loc ,          --phhd_plnt_loc_id
"
"                           v_mon_days             ,          --phhd_mon_days
"
"                           cr2.pppe_workin_days  ,            --pphd_workin_days
"
"                           cr2.pppe_workin_days  ,            --pphd_tot_paid_days
"
"                           v_paid_leave_days     ,            --phhd_paid_leave_days
"
"                                           v_unpaid_leave_days   ,            --phhd_unpaid_leave_days
"
"                           'N'                 ,            --phhd_posted
"
"                           cr2.pppe_net_salary   ,            --phhd_actual_net
"
"                           cr2.pppe_net_salary   ,            --phhd_net_payable
"
"                           0                 ,            --phhd_net_bfr_round
"
"                           0                 ,            --phhd_net_afr_round
"
"                           cr2.pppe_net_salary   ,            --phhd_inprog_amt
"
"                           TRUNC(cr1.ppphd_date_to),          --phhd_process_date
"
"                           0                 ,            --phhd_pay_in_progress
"
"                           'N'                 ,            --phhd_status
"
"                           0                 ,            --phhd_paid_amt
"
"                           'N'                 ,            --phhd_check_flag
"
"                           'B'                 ,            --phhd_type
"
"                           'N'                 ,            --phhd_hold_flag
"
"                           TRUNC(cr1.ppphd_date_from),        --phhd_date_from
"
"                           TRUNC(cr1.ppphd_date_to),          --phhd_date_to
"
"                           cr2.pppe_subcntr_id   ,            --phhd_subcntr_id
"
"                           DECODE(cr1.ppphd_doc_type, 'F', 'S', 'W'),    --phhd_emp_type
"
"                           cr2.emp_esi_elgbl_flag,        --phhd_esi_flag
"
"                           cr2.emp_pf_elgbl_flag,
"
"                           p_user             ,            --phhd_cre_by
"
"                           v_ip_addr         ,           --phhd_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                           v_os_user         ,            --phhd_cre_os_user        --added 29-jan-2020 : Ajis
"
"                           SYSDATE          ,              --phhd_cre_date,
"
"                           cr2.empai_job_id,
"
"                           cr2.empai_pos_id,
"
"                           cr2.empai_loc_id ,
"
"                           cr2.empai_grade,
"
"                           cr2.emp_group_id
"
"                           );
"
"
"
"               FOR cr3 IN c3(cr2.pppe_seq_no)
"
"               LOOP
"
"
"
"                  INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                          phln_process_batch_no    ,
"
"                          phln_pyrl_no           ,
"
"                          phln_plnt                   ,
"
"                          phln_elmnt_id            ,
"
"                          phln_amount           ,
"
"                          phln_mode                   ,
"
"                          phln_source           ,
"
"                          phln_elmnt_cat           ,
"
"                          phln_actual_amount       ,
"
"                          phln_reference           ,
"
"                          phln_cre_by           ,
"
"                          phln_cre_ip_addr        ,     --added 29-jan-2020 : Ajis
"
"                          phln_cre_os_user        ,     --added 29-jan-2020 : Ajis
"
"                          phln_cre_date            )
"
"                       VALUES(p_bu                   ,        --phln_bu
"
"                          v_batch_no               ,        --phln_process_batch_no
"
"                          v_payroll_no           ,        --phln_pyrl_no
"
"                          cr2.pppe_plnt            ,        --phln_plnt
"
"                          cr3.pppln_elmnt_id       ,        --phln_elmnt_id
"
"                          cr3.pppln_amount         ,        --phln_amount
"
"                          cr3.pppln_mode           ,        --phln_mode
"
"                          'MNL'                   ,        --phln_source
"
"                          'N'                   ,        --phln_elmnt_cat
"
"                          0                       ,        --phln_actual_amount
"
"                          cr3.pppln_reference      ,        --phln_reference
"
"                          p_user                   ,        --phln_cre_by
"
"                          v_ip_addr            ,     --phln_cre_ip_addr        --added 29-jan-2020 : Ajis
"
"                          v_os_user            ,     --phln_cre_os_user        --added 29-jan-2020 : Ajis
"
"                          SYSDATE                   );       --phln_cre_date
"
"
"
"                  IF cr3.pppln_adj_no IS NOT NULL THEN
"
"
"
"             /* FA  - Fixed Adjustment
"
"            VA  - Variable Adjustment
"
"            CA  - Conditional Adjustment
"
"            RCA - Recurring Conditional Adjustment
"
"            3RD - 3rd Party Adjustment
"
"            CA3 - Conditional Adjustment 3rd Party
"
"            RC3 - Recurring Conditional Adjustment 3rd Party
"
"            TDE - TDS Element
"
"            FL  - Fixed Allowance
"
"            VL  - Variable Allowance */
"
"
"
"                      IF cr3.pehd_type IN ('FA', 'VA', 'CA', 'RCA', '3RD', 'CA3', 'RC3', 'TDE') THEN
"
"
"
"                    UPDATE emp_pyrl_adjustments
"
"                   SET epadj_rmng_period      = (epadj_rmng_period - 1),
"
"                   epadj_last_proc_year   = cr1.ppphd_year,
"
"                   epadj_last_proc_period = cr1.ppphd_period,
"
"                   epadj_accm_amt         = (NVL(epadj_accm_amt, 0) + cr3.pppln_amount),
"
"                   epadj_upd_by           = p_user,
"
"                   epadj_upd_ip_addr      = v_ip_addr,        --added 29-jan-2020 : Ajis
"
"                   epadj_upd_os_user      = v_os_user,        --added 29-jan-2020 : Ajis
"
"                   epadj_upd_date         = SYSDATE
"
"             WHERE epadj_bu          = p_bu
"
"                   AND epadj_emp_id      = cr2.pppe_emp_id
"
"                   AND epadj_adj_no      = cr3.pppln_adj_no
"
"                   AND epadj_is_definite = 'Y';
"
"
"
"            UPDATE emp_pyrl_adjustments
"
"                   SET epadj_last_proc_year   = cr1.ppphd_year,
"
"                   epadj_last_proc_period = cr1.ppphd_period,
"
"                   epadj_accm_amt         = (NVL(epadj_accm_amt, 0) + cr3.pppln_amount),
"
"                   epadj_upd_by           = p_user,
"
"                   epadj_upd_ip_addr      = v_ip_addr,        --added 29-jan-2020 : Ajis
"
"                   epadj_upd_os_user      = v_os_user,        --added 29-jan-2020 : Ajis
"
"                   epadj_upd_date         = SYSDATE
"
"             WHERE epadj_bu          = p_bu
"
"                   AND epadj_emp_id      = cr2.pppe_emp_id
"
"                   AND epadj_adj_no      = cr3.pppln_adj_no
"
"                   AND epadj_is_definite = 'N';
"
"
"
"                    IF cr3.pppln_source = 'LOANS' AND cr3.pppln_sou_doc_no IS NOT NULL AND cr3.pppln_sou_doc_seq_no IS NOT NULL THEN  NULL;
"
"               /*        --Commented by oormi
"
"               UPDATE hrm_fortnight_loan_ded
"
"                  SET hfld_rmng_period      = (hfld_rmng_period - 1),
"
"                  hfld_last_proc_year   = cr1.ppphd_year,
"
"                  hfld_last_proc_period = cr1.ppphd_period,
"
"                  hfld_last_proc_type   = cr1.ppphd_cal_type,
"
"                  hfld_accm_amt         = (NVL(hfld_accm_amt, 0) + cr3.pppln_amount),
"
"                  hfld_upd_by           = p_user,
"
"                  hfld_upd_ip_addr      = v_ip_addr,        --added 29-jan-2020 : Ajis
"
"                  hfld_upd_os_user      = v_os_user,        --added 29-jan-2020 : Ajis
"
"                    hfld_upd_date         = SYSDATE
"
"                WHERE hfld_bu             = p_bu
"
"                  AND hfld_emp_id         = cr2.pppe_emp_id
"
"                  AND hfld_adj_no         = cr3.pppln_adj_no
"
"                  AND hfld_sou_doc_no     = cr3.pppln_sou_doc_no
"
"                  AND hfld_sou_doc_seq_no = cr3.pppln_sou_doc_seq_no;
"
"
"
"                   UPDATE hrm_fortnight_loan_hd
"
"                  SET hflh_paid_amt     = NVL(hflh_paid_amt, 0) + cr3.pppln_amount,
"
"                      hflh_status       = CASE WHEN (NVL(hflh_paid_amt, 0) + cr3.pppln_amount) >= hflh_tot_loan_amt THEN 'R' ELSE hflh_status END,
"
"                      hflh_upd_by       = p_user,
"
"                      hflh_upd_ip_addr  = v_ip_addr,        --added 29-jan-2020 : Ajis
"
"                  hflh_upd_os_user  = v_os_user,        --added 29-jan-2020 : Ajis
"
"                      hflh_upd_date     = SYSDATE
"
"                WHERE hflh_bu     = p_bu
"
"                  AND hflh_doc_no = cr3.pppln_sou_doc_no;
"
"
"
"                   UPDATE hrm_fortnight_loan_ln
"
"                  SET hfll_status       = 'R',
"
"                      hfll_upd_by       = p_user,
"
"                      hfll_upd_ip_addr  = v_ip_addr,        --added 29-jan-2020 : Ajis
"
"                  hfll_upd_os_user  = v_os_user,        --added 29-jan-2020 : Ajis
"
"                      hfll_upd_date     = SYSDATE
"
"                WHERE hfll_bu     = p_bu
"
"                  AND hfll_doc_no = cr3.pppln_sou_doc_no
"
"                  AND hfll_seq_no = cr3.pppln_sou_doc_seq_no;
"
"                  */
"
"                    END IF;
"
"
"
"                      END IF;    --cr4.pehd_type IN ('FA', 'VA', 'CA', 'RCA', '3RD', 'CA3', 'RC3', 'TDE')
"
"
"
"                END IF;    --cr4.ppln_adj_no IS NOT NULL
"
"
"
"                IF cr3.pehd_type IN ('FL', 'VL') THEN
"
"
"
"             UPDATE emp_pyrl_allowances
"
"                SET epa_last_proc_year   = cr1.ppphd_year,
"
"                   epa_last_proc_period = cr1.ppphd_period,
"
"                epa_upd_option       = 'C',
"
"                epa_upd_by           = p_user,
"
"                epa_upd_ip_addr       = v_ip_addr,            --added 29-jan-2020 : Ajis
"
"                epa_upd_os_user       = v_os_user,            --added 29-jan-2020 : Ajis
"
"                epa_upd_date          = SYSDATE
"
"              WHERE epa_bu       = p_bu
"
"            AND epa_elmnt_id = cr3.pppln_elmnt_id
"
"            AND epa_emp_id   = cr2.pppe_emp_id;
"
"
"
"          END IF;    --cr4.pehd_type IN ('FL', 'VL')
"
"
"
"               END LOOP c3;
"
"          /*
"
"           IF cr0.hwepc_spn_flag = 'Y' THEN
"
"
"
"                  proc_upd_spn_scheme_dtls(p_bu,
"
"                                    cr1.ppphd_clndr_id,
"
"                                    cr1.ppphd_year,
"
"                                    cr1.ppphd_period,
"
"                                    cr2.pppe_emp_id,
"
"                                    p_user,
"
"                                    v_spn_res);
"
"
"
"           END IF;
"
"           */
"
"               UPDATE per_pyrl_prep_emp
"
"                  SET pppe_pyrl_batch_no = v_batch_no,
"
"                      pppe_pyrl_no       = v_payroll_no,
"
"                      pppe_upd_by        = p_user,
"
"                      pppe_upd_ip_addr   = v_ip_addr,                --added 29-jan-2020 : Ajis
"
"              pppe_upd_os_user   = v_os_user,                --added 29-jan-2020 : Ajis
"
"                      pppe_upd_date      = SYSDATE
"
"                WHERE pppe_bu     = p_bu
"
"                  AND pppe_doc_no = p_doc_no
"
"                  AND pppe_seq_no = cr2.pppe_seq_no;
"
"              /*
"
"               UPDATE emp_daily_piece_rate_wage
"
"                  SET edprw_status       = 'P',
"
"                      edprw_upd_by       = p_user,
"
"                      edprw_upd_ip_addr  = v_ip_addr,                --added 29-jan-2020 : Ajis
"
"              edprw_upd_os_user  = v_os_user,                --added 29-jan-2020 : Ajis
"
"                      edprw_upd_date     = SYSDATE
"
"                WHERE edprw_bu     = p_bu
"
"                  AND edprw_emp_id = cr2.pppe_emp_id
"
"                  AND TRUNC(edprw_date) BETWEEN TRUNC(cr1.ppphd_date_from) AND TRUNC(cr1.ppphd_date_to)
"
"                  AND edprw_status IN ('N');
"
"
"
"               UPDATE emp_daily_piece_rate_adjust
"
"                  SET edpra_status        = 'P',
"
"                      edpra_upd_by        = p_user,
"
"                      edpra_upd_ip_addr  = v_ip_addr,                --added 29-jan-2020 : Ajis
"
"              edpra_upd_os_user  = v_os_user,                --added 29-jan-2020 : Ajis
"
"                      edpra_upd_date     = SYSDATE
"
"                WHERE edpra_bu     = p_bu
"
"                  AND edpra_emp_id = cr2.pppe_emp_id
"
"                  AND TRUNC(edpra_date) BETWEEN TRUNC(cr1.ppphd_date_from) AND TRUNC(cr1.ppphd_date_to)
"
"                  AND edpra_status IN ('N');
"
"
"
"               UPDATE emp_daily_piece_rate_incent
"
"                  SET edpri_status       = 'P',
"
"                      edpri_upd_by       = p_user,
"
"                      edpri_upd_ip_addr  = v_ip_addr,                --added 29-jan-2020 : Ajis
"
"              edpri_upd_os_user  = v_os_user,                --added 29-jan-2020 : Ajis
"
"                      edpri_upd_date = SYSDATE
"
"                WHERE edpri_bu     = p_bu
"
"                  AND edpri_emp_id = cr2.pppe_emp_id
"
"                  AND TRUNC(edpri_date) BETWEEN TRUNC(cr1.ppphd_date_from) AND TRUNC(cr1.ppphd_date_to)
"
"                  AND edpri_status IN ('N');
"
"               */
"
"               UPDATE employees
"
"                  SET emp_last_proc_year   = cr1.ppphd_year,
"
"                      emp_last_proc_period = cr1.ppphd_period,
"
"                      emp_last_proc_date   = TRUNC(cr1.ppphd_date_to),
"
"                      emp_upd_by           = p_user,
"
"                      emp_upd_ip_addr      = v_ip_addr,                --added 29-jan-2020 : Ajis
"
"              emp_upd_os_user      = v_os_user,                --added 29-jan-2020 : Ajis
"
"                      emp_upd_date         = SYSDATE
"
"                WHERE emp_bu     = p_bu
"
"                  AND emp_emp_id = cr2.pppe_emp_id;
"
"
"
"            END LOOP c2;
"
"
"
"            UPDATE per_pyrl_prep_hd
"
"               SET ppphd_status        = 'P',
"
"                   ppphd_pyrl_batch_no = v_batch_no,
"
"                   ppphd_upd_by        = p_user,
"
"                   ppphd_upd_ip_addr   = v_ip_addr,                --added 29-jan-2020 : Ajis
"
"           ppphd_upd_os_user   = v_os_user,                --added 29-jan-2020 : Ajis
"
"                   ppphd_upd_date      = SYSDATE
"
"             WHERE ppphd_bu     = p_bu
"
"               AND ppphd_doc_no = p_doc_no;
"
"
"
"            IF SQL%FOUND THEN
"
"               v_res := 'Y';
"
"            ELSE
"
"               v_res := 'N';
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
"      p_res := v_res;
"
"
"
"   END proc_process_emp_monthly_wage;
"
"
"
"END pack_wage_emp_pyrl_mil;"
/
