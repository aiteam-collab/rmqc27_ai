CREATE OR REPLACE
"PACKAGE BODY        pack_validate_apex_loan
"
"AS
"
"
"
"   PROCEDURE proc_chk_emp_last_proc_pyrl(p_bu                VARCHAR2,
"
"                     p_rqst_no            VARCHAR2,
"
"                     p_emp_id            VARCHAR2,
"
"                     p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_loans_request
"
"    WHERE elr_bu      = p_bu
"
"      AND elr_rqst_no = p_rqst_no;
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
"      cr2                    c2%ROWTYPE;
"
"
"
"      v_year                NUMBER(6);
"
"      v_period                NUMBER(2);
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
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_rqst_no);
"
"         ELSE
"
"
"
"           IF cr1.elr_surety_emp_id = cr1.elr_surety_emp_id_2 THEN
"
"           RAISE_APPLICATION_ERROR(-20999, 'Surety Employee 1 and 2 should not be same.');
"
"        END IF;
"
"
"
"        IF cr1.elr_surety_emp_id IS NULL AND cr1.elr_surety_emp_id_2 IS NOT NULL THEN
"
"           RAISE_APPLICATION_ERROR(-20999, 'Surety Employee 1 should not be null.');
"
"        END IF;
"
"
"
"        IF cr1.elr_rqrd_date IS NOT NULL THEN
"
"
"
"           OPEN c2;
"
"           FETCH c2 INTO cr2;
"
"
"
"              IF c2%NOTFOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'EMP_ID', 'NF'));
"
"              ELSE
"
"
"
"              proc_find_pyrl_cal_year_period(p_bu,
"
"                                TRUNC(cr1.elr_rqrd_date),
"
"                                v_year,
"
"                                v_period,
"
"                                cr2.emp_clndr_id);
"
"
"
"             IF TRUNC(cr1.elr_rqrd_date) < TRUNC(cr2.emp_start_date) THEN
"
"            RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'RQRD_DT', 'GTE_ST')||' DOJ : '||TO_CHAR(cr2.emp_start_date, 'DD.MM.RRRR'));
"
"             END IF;
"
"
"
"             IF cr2.emp_last_proc_year IS NOT NULL AND cr2.emp_last_proc_period IS NOT NULL THEN
"
"
"
"                IF v_year||TO_CHAR(v_period, '00') <= cr2.emp_last_proc_year||TO_CHAR(cr2.emp_last_proc_period, '00') THEN
"
"                   RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'LOAN', 'CHECK'));
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"              END IF;
"
"
"
"           CLOSE c2;
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
"   END proc_chk_emp_last_proc_pyrl;
"
"
"
"   PROCEDURE proc_chk_loan_criteria(p_bu                VARCHAR2,
"
"                       p_rqst_no                VARCHAR2,
"
"                       p_emp_id                VARCHAR2,
"
"                       p_loan_id                VARCHAR2,
"
"                       p_rqst_amt                NUMBER,
"
"                       p_rqst_date                DATE,
"
"                       p_rqst_year                NUMBER,
"
"                    p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"        emp_active_infos
"
"    WHERE emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu     = p_bu
"
"      AND emp_emp_id = p_emp_id;
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
"     FROM loans,
"
"          loan_criterias
"
"    WHERE loan_bu        = loancr_bu
"
"      AND loan_loan_id   = loancr_loan_id
"
"      AND loancr_bu      = p_bu
"
"      AND loancr_loan_id = p_loan_id
"
"      AND loan_status    = 'A';
"
"
"
"      cr1                        c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_year                    NUMBER,
"
"             c_period                    NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(DECODE(phln_mode, '+', phln_amount, phln_amount * -1)), 0) ppln_net_amount
"
"     FROM payroll_hist_hd,
"
"      payroll_hist_ln
"
"    WHERE phhd_bu      = phln_bu
"
"      AND phhd_pyrl_no = phln_pyrl_no
"
"      AND phhd_process_batch_no = phln_process_batch_no
"
"      AND phhd_bu      = p_bu
"
"      AND phhd_year    = c_year
"
"      AND phhd_period  = c_period
"
"      AND phhd_emp_id  = p_emp_id;
"
"
"
"      cr2                          c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_year                    NUMBER,
"
"             c_period                    NUMBER)
"
"       IS
"
"   SELECT phhd_emp_id,
"
"          NVL(SUM(phln_amount), 0) ppln_gross_amount
"
"     FROM payroll_hist_hd,
"
"      payroll_hist_ln,
"
"      payroll_elements_hd
"
"    WHERE phhd_bu       = phln_bu
"
"      AND phhd_pyrl_no  = phln_pyrl_no
"
"      AND phhd_process_batch_no = phln_process_batch_no
"
"      AND phln_bu       = pehd_bu
"
"      AND phln_elmnt_id = pehd_elmnt_id
"
"      AND phhd_bu    = p_bu
"
"      AND phhd_year     = c_year
"
"      AND phhd_period   = c_period
"
"      AND phhd_emp_id   = p_emp_id
"
"      AND pehd_type     NOT IN ('CA3', 'RC3')
"
"      AND phln_mode     = '+'
"
"    GROUP BY phhd_emp_id;
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
"     FROM emp_loans_request
"
"    WHERE elr_bu      = p_bu
"
"      AND elr_emp_id  = p_emp_id
"
"      AND elr_loan_id = p_loan_id
"
"      AND elr_status  IN ('A', 'D');
"
"
"
"      cr4                        c4%ROWTYPE;
"
"
"
"   CURSOR c5
"
"       IS
"
"   SELECT *
"
"     FROM emp_loans_request
"
"    WHERE elr_bu        = p_bu
"
"      AND elr_emp_id    = p_emp_id
"
"      AND elr_loan_id   = p_loan_id
"
"      AND elr_rqst_year = p_rqst_year
"
"      AND elr_status  IN ('A', 'D');
"
"
"
"      cr5                        c5%ROWTYPE;
"
"
"
"   CURSOR c6
"
"       IS
"
"   SELECT *
"
"     FROM emp_loans_request
"
"    WHERE elr_bu      = p_bu
"
"      AND elr_emp_id  = p_emp_id
"
"      AND elr_loan_id = p_loan_id
"
"      AND elr_rqst_no <> p_rqst_no
"
"      AND elr_status  NOT IN ('C')
"
"      AND elr_rtnd_amt < elr_rtnbl_amt;
"
"
"
"      cr6                        c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_grade_id                    VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM loan_grade_amounts
"
"    WHERE lga_bu       = p_bu
"
"      AND lga_loan_id  = p_loan_id
"
"      AND lga_grade_id = c_grade_id
"
"      AND TRUNC(p_rqst_date) BETWEEN TRUNC(lga_eff_from) AND TRUNC(lga_eff_to);
"
"
"
"      cr7                        c7%ROWTYPE;
"
"
"
"   CURSOR c8
"
"       IS
"
"   SELECT *
"
"     FROM emp_loans_request
"
"    WHERE elr_bu      = p_bu
"
"      AND elr_emp_id  = p_emp_id
"
"      AND elr_status  NOT IN ('C')
"
"      AND elr_rqst_no <> p_rqst_no
"
"      AND elr_rtnd_amt < elr_rtnbl_amt
"
"      AND elr_loan_id IN (SELECT loane_xcld_loan_id
"
"                FROM loan_excludes
"
"               WHERE loane_bu = p_bu
"
"                 AND loane_loan_id = p_loan_id);
"
"
"
"      cr8                        c8%ROWTYPE;
"
"
"
"  /* CURSOR c9
"
"       IS
"
"   SELECT NVL(SUM(fmdln_days), 0) fmdln_days,
"
"        NVL(SUM(fmdln_mon), 0) fmdln_mon,
"
"      NVL(SUM(fmdln_yrs), 0) fmdln_yrs
"
"     FROM (SELECT (NVL(TRUNC(frdh_demob_date), TRUNC(SYSDATE)) - TRUNC(fmdln_cust_rct_date)) + 1 fmdln_days,
"
"          FLOOR(MONTHS_BETWEEN(NVL(TRUNC(frdh_demob_date), TRUNC(SYSDATE)), TRUNC(fmdln_cust_rct_date))) fmdln_mon,
"
"          FLOOR(MONTHS_BETWEEN(NVL(TRUNC(frdh_demob_date), TRUNC(SYSDATE)), TRUNC(fmdln_cust_rct_date))/12) fmdln_yrs
"
"         FROM fcm_lab_mob_demob_dtl_vw
"
"        WHERE frdh_bu = p_bu
"
"          AND fmdln_emp_id = p_emp_id);
"
"
"
"      cr9                        c9%ROWTYPE;*/
"
"
"
"   CURSOR c10(c_serv_mon                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM loan_service_amounts
"
"    WHERE lsa_bu      = p_bu
"
"      AND lsa_loan_id = p_loan_id
"
"      AND c_serv_mon BETWEEN lsa_min_months AND lsa_max_months;
"
"
"
"      cr10                        c10%ROWTYPE;
"
"
"
"      v_emp_start_date                    DATE;
"
"      v_emp_wfm_cont_type                VARCHAR2(1) := 'S';
"
"      v_emp_grade                    VARCHAR2(10);
"
"      v_emp_cat                        VARCHAR2(10);
"
"      v_comp_mon                    NUMBER(5, 2)  := 0;
"
"      v_comp_yrs                    NUMBER(5, 2)  := 0;
"
"      v_wfm_comp_mon                    NUMBER(5, 2)  := 0;
"
"      v_wfm_comp_yrs                    NUMBER(5, 2)  := 0;
"
"      v_basic_sal                    NUMBER(15, 3) := 0;
"
"      v_last_proc_year                    NUMBER(6);
"
"      v_last_proc_period                NUMBER(2);
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
"        RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'EMP_ID', 'NF'));
"
"         ELSE
"
"        v_emp_start_date    := TRUNC(cr0.emp_start_date);
"
"        v_basic_sal         := CASE WHEN cr0.emp_pay_basis = 'S' THEN cr0.empai_basic_sal ELSE cr0.empai_per_day_wage END;
"
"            v_last_proc_year    := cr0.emp_last_proc_year;
"
"            v_last_proc_period  := cr0.emp_last_proc_period;
"
"            v_emp_grade         := cr0.empai_grade;
"
"            v_emp_cat           := cr0.emp_cat_id;
"
"            v_emp_wfm_cont_type := cr0.emp_wfm_emp_cont_type;
"
"         END IF;
"
"
"
"      CLOSE c0;
"
"
"
"      v_comp_mon := FLOOR(MONTHS_BETWEEN(TRUNC(p_rqst_date), v_emp_start_date));
"
"      v_comp_yrs := FLOOR(MONTHS_BETWEEN(TRUNC(p_rqst_date), v_emp_start_date)/12);
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
"        RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'LOAN_CRITERIA', 'ND'));
"
"     ELSE
"
"
"
"        /* Minumum Service required */
"
"
"
"        IF cr1.loancr_min_serv_chk_flag = 'Y' THEN
"
"
"
"           IF cr1.loancr_min_serv_duration IS NULL OR cr1.loancr_min_serv_duration = 0 THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Min. Service Duration should be greater than Zero.');
"
"           END IF;
"
"
"
"           IF cr1.loancr_min_serv_type = 'P' THEN
"
"
"
"          IF v_comp_mon < NVL(cr1.loancr_min_serv_duration, 0) THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Employee Min. Service Month(s) Required. Actual Months : '||v_comp_mon||' Required Months : '||NVL(cr1.loancr_min_serv_duration, 0));
"
"          END IF;
"
"
"
"           END IF;
"
"
"
"           IF cr1.loancr_min_serv_type = 'Y' THEN
"
"
"
"          IF v_comp_yrs < NVL(cr1.loancr_min_serv_duration, 0) THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Employee Min. Service Year(s) Required. Actual Years : '||v_comp_mon||' Required Years : '||NVL(cr1.loancr_min_serv_duration, 0));
"
"          END IF;
"
"
"
"           END IF;
"
"
"
"           IF v_emp_wfm_cont_type = 'L' THEN
"
"
"
"              IF cr1.loancr_wfm_onsite_duration IS NULL OR cr1.loancr_wfm_onsite_duration = 0 THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Min. Onsite Service Duration should be greater than Zero.');
"
"              END IF;
"
"
"
"              /* OPEN c9;
"
"              FETCH c9 INTO cr9;
"
"
"
"             IF c9%FOUND THEN
"
"                 v_wfm_comp_mon := cr9.fmdln_mon;
"
"                v_wfm_comp_yrs := cr9.fmdln_yrs;
"
"             ELSE
"
"            v_wfm_comp_mon := 0;
"
"            v_wfm_comp_yrs := 0;
"
"             END IF;
"
"
"
"              CLOSE c9;*/
"
"
"
"              IF cr1.loancr_min_serv_type = 'P' THEN
"
"
"
"             IF v_wfm_comp_mon < NVL(cr1.loancr_min_serv_duration, 0) THEN
"
"            RAISE_APPLICATION_ERROR(-20999, 'Employee Min. Osite Service Month(s) Required. Actual Months : '||v_comp_mon||' Required Months : '||NVL(cr1.loancr_min_serv_duration, 0));
"
"             END IF;
"
"
"
"              END IF;
"
"
"
"              IF cr1.loancr_min_serv_type = 'Y' THEN
"
"
"
"             IF v_wfm_comp_yrs < NVL(cr1.loancr_min_serv_duration, 0) THEN
"
"            RAISE_APPLICATION_ERROR(-20999, 'Employee Min. Onsite Service Year(s) Required. Actual Years : '||v_comp_mon||' Required Years : '||NVL(cr1.loancr_min_serv_duration, 0));
"
"             END IF;
"
"
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"         END IF;
"
"
"
"         /* End of Minumum Service required */
"
"
"
"              /* Frequency Availability */
"
"
"
"        IF cr1.loancr_freq = 'E' THEN
"
"
"
"           OPEN c4;
"
"           FETCH c4 INTO cr4;
"
"
"
"              IF c4%FOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'LOAN_ONE_PER_EMPLOY', 'ALLOWED'));
"
"              END IF;
"
"
"
"           CLOSE c4;
"
"
"
"         END IF;
"
"
"
"        IF cr1.loancr_freq = 'Y' THEN
"
"
"
"           OPEN c5;
"
"           FETCH c5 INTO cr5;
"
"
"
"              IF c5%FOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'LOAN_ONE_PER_YEAR', 'ALLOWED'));
"
"              END IF;
"
"
"
"           CLOSE c5;
"
"
"
"        END IF;
"
"
"
"        IF cr1.loancr_freq = 'C' THEN
"
"
"
"           OPEN c6;
"
"           FETCH c6 INTO cr6;
"
"
"
"              IF c6%FOUND THEN
"
"                RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'LOAN_NOT_AVAIL', 'PREV_NC'));
"
"          END IF;
"
"
"
"           CLOSE c6;
"
"
"
"        END IF;
"
"
"
"        /* End of Frequency Availability */
"
"
"
"        /* Minimum Eligible Salary */
"
"
"
"        IF cr1.loancr_min_elgble_flag NOT IN ('A') AND v_emp_wfm_cont_type IN ('N') THEN
"
"
"
"           IF cr1.loancr_min_elgble_amt IS NULL OR cr1.loancr_min_elgble_amt = 0 THEN
"
"          RAISE_APPLICATION_ERROR(-20999, 'Minimum Eligible should be greater than Zero.');
"
"           END IF;
"
"
"
"        END IF;
"
"
"
"        IF cr1.loancr_min_elgble_flag = 'B' THEN
"
"
"
"           IF v_basic_sal < NVL(cr1.loancr_min_elgble_amt, 0) THEN
"
"          RAISE_APPLICATION_ERROR(-20999, 'Employee Basic Salary Required. Actual Basic : '||v_basic_sal||' Required Basic : '||NVL(cr1.loancr_min_elgble_amt, 0));
"
"           END IF;
"
"
"
"           IF v_emp_wfm_cont_type IN ('L', 'S') THEN
"
"
"
"          IF p_rqst_amt > (v_basic_sal * NVL(cr1.loancr_wfm_max_elgble_cnt, 0)) THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Loan Amount should be less than or equal to '||(v_basic_sal * NVL(cr1.loancr_wfm_max_elgble_cnt, 0))||'.');
"
"          END IF;
"
"
"
"           END IF;
"
"
"
"        END IF;
"
"
"
"        IF cr1.loancr_min_elgble_flag = 'N' THEN
"
"
"
"           IF v_last_proc_year IS NOT NULL AND v_last_proc_period IS NOT NULL THEN
"
"
"
"              OPEN c2(v_last_proc_year, v_last_proc_period);
"
"              FETCH c2 INTO cr2;
"
"              CLOSE c2;
"
"
"
"              IF cr2.ppln_net_amount < NVL(cr1.loancr_min_elgble_amt, 0) THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Employee Net Salary Required. Actual Net Salary : '||cr2.ppln_net_amount||' Required Net Salary : '||NVL(cr1.loancr_min_elgble_amt, 0));
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"         END IF;
"
"
"
"            IF cr1.loancr_min_elgble_flag = 'G' THEN
"
"
"
"           IF v_last_proc_year IS NOT NULL AND v_last_proc_period IS NOT NULL THEN
"
"
"
"              OPEN c3(v_last_proc_year, v_last_proc_period);
"
"              FETCH c3 INTO cr3;
"
"              CLOSE c3;
"
"
"
"              IF cr3.ppln_gross_amount < NVL(cr1.loancr_min_elgble_amt, 0) THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Employee Gross Salary Required. Actual Gross Salary : '||cr3.ppln_gross_amount||' Required Gross Salary : '||NVL(cr1.loancr_min_elgble_amt, 0));
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"         END IF;
"
"
"
"         /* End of Minimum Eligible Salary */
"
"
"
"        /* Based on Grade */
"
"
"
"        IF cr1.loancr_grade_check = 'Y' THEN
"
"
"
"           OPEN c7(v_emp_grade);
"
"           FETCH c7 INTO cr7;
"
"
"
"              IF c7%NOTFOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'LOAN_GRD_AMT_RANGE', 'NF'));
"
"              ELSE
"
"
"
"             IF p_rqst_amt NOT BETWEEN cr7.lga_min_amt AND cr7.lga_max_amt THEN
"
"                RAISE_APPLICATION_ERROR(-20999, 'Loan Amount should be between grade range. Min./Max. : '||cr7.lga_min_amt||'/'||cr7.lga_max_amt);
"
"             END IF;
"
"
"
"              END IF;
"
"
"
"           CLOSE c7;
"
"
"
"         END IF;
"
"
"
"         /* End of Based on Grade */
"
"
"
"        /* Based on Service Completed */
"
"
"
"        IF cr1.loancr_service_check = 'Y' THEN
"
"
"
"           OPEN c10(v_comp_mon);
"
"           FETCH c10 INTO cr10;
"
"
"
"              IF c10%NOTFOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20999, 'Loan Service months not defined.');
"
"              ELSE
"
"
"
"             IF p_rqst_amt > (v_basic_sal * NVL(cr10.lsa_multi_fact, 0)) THEN
"
"            RAISE_APPLICATION_ERROR(-20999, 'Loan Amount should be less than or equal to '||(v_basic_sal * NVL(cr10.lsa_multi_fact, 0))||'.');
"
"             END IF;
"
"
"
"              END IF;
"
"
"
"           CLOSE c10;
"
"
"
"         END IF;
"
"
"
"            /* End of Category on Grade */
"
"
"
"            /* Other Excluded Loan */
"
"
"
"        IF cr1.loancr_other_loan_chk_flag = 'Y' THEN
"
"
"
"           OPEN c8;
"
"           FETCH c8 INTO cr8;
"
"
"
"              IF c8%FOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20999, func_frm_apex_msg(p_bu, 'LOAN_NOT_AVAIL', 'YES'));
"
"              END IF;
"
"
"
"           CLOSE c8;
"
"
"
"            END IF;
"
"
"
"        /* End of Other Excluded Loan */
"
"
"
"     END IF;
"
"
"
"      CLOSE c1;
"
"
"
"   END proc_chk_loan_criteria;
"
"
"
"END;"
/
