CREATE OR REPLACE
"PACKAGE BODY pack_gen_loan_plan
"
"AS
"
"
"
"   PROCEDURE proc_chk_loan_plan_excep(p_bu                VARCHAR2,
"
"                      p_rqst_no                VARCHAR2,
"
"                      p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_loans_request
"
"    WHERE emp_bu      = elr_bu
"
"      AND emp_emp_id  = elr_emp_id
"
"      AND elr_bu      = p_bu
"
"      AND elr_rqst_no = p_rqst_no
"
"      AND elr_status  = 'D'
"
"      AND elr_pymnt_status = 'P';
"
"
"
"      cr1                    c1%ROWTYPE;
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
"          IF TRUNC(cr1.elr_aprvd_date) < TRUNC(cr1.emp_start_date) THEN
"
"           RAISE_APPLICATION_ERROR(-20999, 'HRM'||'Loan Aprvd. Date : '||TO_CHAR(cr1.elr_aprvd_date,'DD.MM.RRRR')||' Emp. DOJ : '|| TO_CHAR(cr1.emp_start_date, 'DD.MM.RRRR'));
"
"          END IF;
"
"
"
"        IF cr1.emp_last_proc_year IS NOT NULL AND cr1.emp_last_proc_period IS NOT NULL THEN
"
"
"
"           IF cr1.elr_start_year||TO_CHAR(cr1.elr_start_period, '00') <= cr1.emp_last_proc_year||TO_CHAR(cr1.emp_last_proc_period, '00') THEN
"
"              RAISE_APPLICATION_ERROR(-20999, 'HRM'||'Loan Aprvd. Year/Period : '||cr1.elr_aprvd_year||'/'||cr1.elr_start_period||' Payroll Proc. Year/Period : '|| cr1.emp_last_proc_year||'/'||cr1.emp_last_proc_period);
"
"           END IF;
"
"
"
"        END IF;
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
"   END proc_chk_loan_plan_excep;
"
"
"
"
"
"
"
" PROCEDURE proc_gen_fbm_loan_plan(p_bu                VARCHAR2,
"
"                    p_rqst_no                VARCHAR2,
"
"                    p_user                VARCHAR2,
"
"                    p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_loans_request
"
"    WHERE emp_bu      = elr_bu
"
"      AND emp_emp_id  = elr_emp_id
"
"      AND elr_bu      = p_bu
"
"      AND elr_rqst_no = p_rqst_no
"
"      AND elr_status  = 'D'
"
"      AND elr_pymnt_status = 'P';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_year                NUMBER,
"
"             c_period                NUMBER,
"
"             c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT *
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
"      cr2                    c2%ROWTYPE;
"
"
"
"      v_loan_op_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_cl_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_tot_amt                NUMBER(15, 3) := 0;
"
"      v_loan_emi_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_tot_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_loan_tot_int_amt            NUMBER(15, 3) := 0;
"
"      v_loan_emi_int_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_year                    NUMBER(6);
"
"      v_period                    NUMBER(2);
"
"      v_seq_no                    NUMBER(5) := 1;
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_emp_id                                  VARCHAR2(50) := FUNC_FIND_EMP_ID(p_bu,p_user);   /* BHARATHI*/
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
"          proc_chk_loan_plan_excep(p_bu,
"
"                     p_rqst_no,
"
"                     p_user);
"
"
"
"            DELETE
"
"              FROM emp_loans_ded_plan
"
"         WHERE eldp_bu       = p_bu
"
"               AND eldp_order_no = p_rqst_no;
"
"
"
"           v_res := 'N';
"
"
"
"            v_year     := cr1.elr_start_year;
"
"            v_period   := cr1.elr_start_period;
"
"            v_loan_emi_amt     := CASE WHEN cr1.elr_inst_ded_type = 'A' THEN cr1.elt_inst_amt ELSE ROUND(cr1.elr_aprvd_amt/cr1.elr_rtn_inst) END;
"
"            v_loan_op_pri_amt  := cr1.elr_aprvd_amt;
"
"            v_loan_cl_pri_amt  := 0;
"
"            v_loan_emi_int_amt := ROUND(cr1.elr_int_amt/cr1.elr_rtn_inst);
"
"
"
"            FOR i IN 1..cr1.elr_rtn_inst
"
"            LOOP
"
"
"
"           OPEN c2(v_year, v_period, cr1.emp_clndr_id);
"
"           FETCH c2 INTO cr2;
"
"
"
"              IF c2%NOTFOUND THEN
"
"                 NULL;--RAISE_APPLICATION_ERROR(-20952, 'HRM'||'~'||p_bu||'~'||v_year||'~'||v_period);
"
"              END IF;
"
"
"
"           CLOSE c2;
"
"
"
"           /* To calculate EMI amount */
"
"
"
"              v_loan_tot_amt := v_loan_tot_amt + v_loan_emi_amt;
"
"
"
"              IF (v_loan_tot_amt <> cr1.elr_aprvd_amt) AND (i = cr1.elr_rtn_inst) THEN
"
"
"
"                 IF v_loan_tot_amt > cr1.elr_aprvd_amt THEN
"
"                  v_loan_emi_amt := v_loan_emi_amt - (v_loan_tot_amt - cr1.elr_aprvd_amt);
"
"                 ELSE
"
"                  v_loan_emi_amt := v_loan_emi_amt + (cr1.elr_aprvd_amt - v_loan_tot_amt);
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_loan_emi_amt := v_loan_emi_amt;
"
"              END IF;
"
"
"
"              /* End of calculate EMI amount */
"
"
"
"           /* To calculate Interest amount */
"
"
"
"              v_loan_tot_int_amt := v_loan_tot_int_amt + v_loan_emi_int_amt;
"
"
"
"              IF (v_loan_tot_int_amt <> cr1.elr_int_amt) AND (i = cr1.elr_rtn_inst) THEN
"
"
"
"                 IF v_loan_tot_int_amt > cr1.elr_int_amt THEN
"
"                  v_loan_emi_int_amt := v_loan_emi_int_amt - (v_loan_tot_int_amt - cr1.elr_int_amt);
"
"                 ELSE
"
"                  v_loan_emi_int_amt := v_loan_emi_int_amt + (cr1.elr_int_amt - v_loan_tot_int_amt);
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_loan_emi_int_amt := v_loan_emi_int_amt;
"
"              END IF;
"
"
"
"              /* End of calculate Interest amount */
"
"
"
"              v_loan_cl_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"              INSERT INTO emp_loans_ded_plan(eldp_bu            ,
"
"                          eldp_plnt            ,
"
"                          eldp_order_no        ,
"
"                          eldp_seq_no        ,
"
"                          eldp_ded_year        ,
"
"                          eldp_ded_period        ,
"
"                          eldp_ded_amt        ,
"
"                          eldp_prin_due_amt        ,
"
"                          eldp_int_due_amt        ,
"
"                          eldp_op_prin_amt        ,
"
"                          eldp_os_amt        ,
"
"                          eldp_cre_by        ,
"
"                          eldp_cre_date        ,
"
"                          eldp_cre_os_user        ,
"
"                          eldp_cre_ip_addr        ,
"
"                          eldp_cre_emp_id           )     /*bharathi*/
"
"                       VALUES(p_bu            ,                --eldp_bu
"
"                              NULL            ,                --eldp_plnt
"
"                              p_rqst_no            ,                --eldp_order_no
"
"                              v_seq_no            ,                --eldp_seq_no
"
"                              v_year            ,                --eldp_ded_year
"
"                              v_period            ,                --eldp_ded_period
"
"                              v_loan_emi_amt + v_loan_emi_int_amt,            --eldp_ded_amt
"
"                              v_loan_emi_amt        ,                --eldp_prin_due_amt
"
"                          v_loan_emi_int_amt    ,                --eldp_int_due_amt
"
"                          v_loan_op_pri_amt        ,                --eldp_op_prin_amt
"
"                          v_loan_cl_pri_amt        ,                --eldp_os_amt
"
"                              p_user            ,                --eldp_cre_by
"
"                              SYSDATE            ,                --eldp_cre_date
"
"                              v_os_user            ,                --eldp_cre_os_user
"
"                          v_ip_addr         ,                --eldp_cre_ip_addr
"
"                                          v_emp_id                  );                              --eldp_cre_emp_id
"
"           v_loan_op_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"           IF LENGTH(v_year) <= 4 THEN
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 1;
"
"                     v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           ELSE
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 101;
"
"                  v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"           v_seq_no := v_seq_no + 1;
"
"              v_res := 'Y';
"
"
"
"            END LOOP i;
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
"   END proc_gen_fbm_loan_plan;
"
"
"
"
"
"  PROCEDURE proc_gen_rbm_loan_plan(p_bu                VARCHAR2,
"
"                    p_rqst_no                VARCHAR2,
"
"                    p_user                VARCHAR2,
"
"                    p_int_amt        OUT        NUMBER,
"
"                    p_rtn_amt        OUT        NUMBER,
"
"                    p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_loans_request
"
"    WHERE emp_bu      = elr_bu
"
"      AND emp_emp_id  = elr_emp_id
"
"      AND elr_bu      = p_bu
"
"      AND elr_rqst_no = p_rqst_no
"
"      AND elr_status  = 'D'
"
"      AND elr_pymnt_status = 'P';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_year                NUMBER,
"
"             c_period                NUMBER,
"
"             c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT *
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
"      cr2                    c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT NVL(SUM(eldp_int_due_amt), 0) eldp_int_due_amt,
"
"          NVL(SUM(eldp_ded_amt), 0) eldp_ded_amt
"
"     FROM emp_loans_ded_plan
"
"    WHERE eldp_bu = p_bu
"
"      AND eldp_order_no = p_rqst_no;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_loan_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_bal_amt                NUMBER(15, 3) := 0;
"
"      v_loan_op_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_cl_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_emi_amt                NUMBER(15, 3) := 0;
"
"      v_loan_int_amt                NUMBER(15, 3) := 0;
"
"      v_loan_tot_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_year                    NUMBER(6);
"
"      v_period                    NUMBER(2);
"
"      v_seq_no                    NUMBER(5) := 1;
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_emp_id                                  VARCHAR2(50) := FUNC_FIND_EMP_ID(p_bu,p_user);
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
"          proc_chk_loan_plan_excep(p_bu,
"
"                     p_rqst_no,
"
"                     p_user);
"
"
"
"            DELETE
"
"              FROM emp_loans_ded_plan
"
"         WHERE eldp_bu       = p_bu
"
"               AND eldp_order_no = p_rqst_no;
"
"
"
"           v_res := 'N';
"
"
"
"           v_year   := cr1.elr_start_year;
"
"            v_period := cr1.elr_start_period;
"
"            v_loan_op_pri_amt := cr1.elr_aprvd_amt;
"
"            v_loan_cl_pri_amt := 0;
"
"
"
"            v_loan_emi_amt := ROUND((v_loan_op_pri_amt * cr1.elr_aprvd_int_pct/1200) * POWER((1 + cr1.elr_aprvd_int_pct/1200), cr1.elr_rtn_inst) / (POWER((1 + cr1.elr_aprvd_int_pct/1200), cr1.elr_rtn_inst) -1));--, 2);
"
"
"
"           FOR i IN 1..cr1.elr_rtn_inst
"
"            LOOP
"
"
"
"           OPEN c2(v_year, v_period, cr1.emp_clndr_id);
"
"           FETCH c2 INTO cr2;
"
"
"
"              IF c2%NOTFOUND THEN
"
"                 NULL;--RAISE_APPLICATION_ERROR(-20952, 'HRM'||'~'||p_bu||'~'||v_year||'~'||v_period);
"
"              END IF;
"
"
"
"           CLOSE c2;
"
"
"
"           v_loan_int_amt := ROUND(v_loan_op_pri_amt * (cr1.elr_aprvd_int_pct/1200));--, 2);
"
"
"
"           v_loan_cl_pri_amt := v_loan_op_pri_amt - (v_loan_emi_amt - v_loan_int_amt);
"
"
"
"           IF (i = cr1.elr_rtn_inst) THEN
"
"              v_loan_emi_amt    := v_loan_emi_amt + v_loan_cl_pri_amt;
"
"              v_loan_cl_pri_amt := 0;
"
"           ELSE
"
"              v_loan_emi_amt    := v_loan_emi_amt;
"
"              v_loan_cl_pri_amt := v_loan_cl_pri_amt;
"
"           END IF;
"
"
"
"              INSERT INTO emp_loans_ded_plan(eldp_bu            ,
"
"                          eldp_plnt            ,
"
"                          eldp_order_no        ,
"
"                          eldp_seq_no        ,
"
"                          eldp_ded_year        ,
"
"                          eldp_ded_period        ,
"
"                          eldp_ded_amt        ,
"
"                          eldp_prin_due_amt        ,
"
"                          eldp_int_due_amt        ,
"
"                          eldp_op_prin_amt        ,
"
"                          eldp_os_amt        ,
"
"                          eldp_cre_by        ,
"
"                          eldp_cre_date        ,
"
"                          eldp_cre_os_user        ,
"
"                          eldp_cre_ip_addr        ,
"
"                          eldp_cre_emp_id           )
"
"                       VALUES(p_bu            ,                --eldp_bu
"
"                              NULL            ,                --eldp_plnt
"
"                              p_rqst_no            ,                --eldp_order_no
"
"                              v_seq_no            ,                --eldp_seq_no
"
"                              v_year            ,                --eldp_ded_year
"
"                              v_period            ,                --eldp_ded_period
"
"                              ROUND(v_loan_emi_amt)    ,                --eldp_ded_amt
"
"                              v_loan_emi_amt - v_loan_int_amt,                --eldp_prin_due_amt
"
"                          v_loan_int_amt        ,                --eldp_int_due_amt
"
"                          v_loan_op_pri_amt        ,                --eldp_op_prin_amt
"
"                          v_loan_cl_pri_amt        ,                --eldp_os_amt
"
"                              p_user            ,                --eldp_cre_by
"
"                              SYSDATE            ,                --eldp_cre_date
"
"                              v_os_user            ,                --eldp_cre_os_user
"
"                          v_ip_addr         ,                --eldp_cre_ip_addr
"
"                          v_emp_id                  );                              --eldp_cre_emp_id
"
"
"
"           v_loan_op_pri_amt := v_loan_op_pri_amt - (v_loan_emi_amt - v_loan_int_amt);
"
"
"
"           IF LENGTH(v_year) <= 4 THEN
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 1;
"
"                     v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           ELSE
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 101;
"
"                  v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"              v_seq_no := v_seq_no + 1;
"
"              v_res := 'Y';
"
"
"
"           END LOOP i;
"
"
"
"           OPEN c3;
"
"           FETCH c3 INTO cr3;
"
"           CLOSE c3;
"
"
"
"           p_int_amt := NVL(cr3.eldp_int_due_amt, 0);
"
"           p_rtn_amt := NVL(cr3.eldp_ded_amt, 0);
"
"
"
"        END IF;
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
"   END proc_gen_rbm_loan_plan;
"
"
"
"
"
" PROCEDURE proc_gen_reschl_fbm_loan_plan(p_bu                    VARCHAR2,
"
"                           p_doc_no                VARCHAR2,
"
"                           p_user                VARCHAR2,
"
"                           p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_loan_reschl_rqst_hd
"
"    WHERE elrrh_bu     = p_bu
"
"      AND elrrh_doc_no = p_doc_no
"
"      AND elrrh_status = 'N';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_year                NUMBER,
"
"             c_period                NUMBER,
"
"             c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT *
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
"      cr2                    c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_rqst_no                VARCHAR2)
"
"       IS
"
"   SELECT eldv_clndr_id
"
"     FROM emp_loan_dtls_view
"
"    WHERE eldv_bu = p_bu
"
"      AND eldv_rqst_no = c_rqst_no;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"      v_loan_op_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_cl_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_tot_amt                NUMBER(15, 3) := 0;
"
"      v_loan_emi_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_tot_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_loan_tot_int_amt            NUMBER(15, 3) := 0;
"
"      v_loan_emi_int_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_emp_clndr_id                VARCHAR2(10);
"
"
"
"      v_year                    NUMBER(6);
"
"      v_period                    NUMBER(2);
"
"      v_seq_no                    NUMBER(5) := 1;
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_emp_id                                  VARCHAR2(50) := FUNC_FIND_EMP_ID(p_bu,p_user);   /*bharathi*/
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
"            DELETE
"
"              FROM emp_loan_reschl_rqst_new_dtls
"
"         WHERE elrrnd_bu     = p_bu
"
"               AND elrrnd_doc_no = p_doc_no;
"
"
"
"           v_res := 'N';
"
"
"
"            v_year     := cr1.elrrh_new_year;
"
"            v_period   := cr1.elrrh_new_period;
"
"            v_loan_emi_amt     := CASE WHEN cr1.elrrh_new_inst_ded_type = 'A' THEN cr1.elrrh_new_inst_amt ELSE ROUND(cr1.elrrh_new_loan_amt/cr1.elrrh_new_rtn_inst) END;
"
"            v_loan_op_pri_amt  := cr1.elrrh_new_loan_amt;
"
"            v_loan_cl_pri_amt  := 0;
"
"            v_loan_emi_int_amt := ROUND(cr1.elrrh_new_int_amt/cr1.elrrh_new_rtn_inst);
"
"
"
"            OPEN c3(cr1.elrrh_loan_doc_no);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||cr1.elrrh_loan_doc_no);
"
"               ELSE
"
"                  v_emp_clndr_id := cr3.eldv_clndr_id;
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            FOR i IN 1..cr1.elrrh_new_rtn_inst
"
"            LOOP
"
"
"
"           OPEN c2(v_year, v_period, v_emp_clndr_id);
"
"           FETCH c2 INTO cr2;
"
"
"
"              IF c2%NOTFOUND THEN
"
"                 NULL;
"
"              END IF;
"
"
"
"           CLOSE c2;
"
"
"
"           /* To calculate EMI amount */
"
"
"
"              v_loan_tot_amt := v_loan_tot_amt + v_loan_emi_amt;
"
"
"
"              IF (v_loan_tot_amt <> cr1.elrrh_new_loan_amt) AND (i = cr1.elrrh_new_rtn_inst) THEN
"
"
"
"                 IF v_loan_tot_amt > cr1.elrrh_new_loan_amt THEN
"
"                  v_loan_emi_amt := v_loan_emi_amt - (v_loan_tot_amt - cr1.elrrh_new_loan_amt);
"
"                 ELSE
"
"                  v_loan_emi_amt := v_loan_emi_amt + (cr1.elrrh_new_loan_amt - v_loan_tot_amt);
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_loan_emi_amt := v_loan_emi_amt;
"
"              END IF;
"
"
"
"              /* End of calculate EMI amount */
"
"
"
"           /* To calculate Interest amount */
"
"
"
"              v_loan_tot_int_amt := v_loan_tot_int_amt + v_loan_emi_int_amt;
"
"
"
"              IF (v_loan_tot_int_amt <> cr1.elrrh_new_int_amt) AND (i = cr1.elrrh_new_rtn_inst) THEN
"
"
"
"                 IF v_loan_tot_int_amt > cr1.elrrh_new_int_amt THEN
"
"                  v_loan_emi_int_amt := v_loan_emi_int_amt - (v_loan_tot_int_amt - cr1.elrrh_new_int_amt);
"
"                 ELSE
"
"                  v_loan_emi_int_amt := v_loan_emi_int_amt + (cr1.elrrh_new_int_amt - v_loan_tot_int_amt);
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_loan_emi_int_amt := v_loan_emi_int_amt;
"
"              END IF;
"
"
"
"              /* End of calculate Interest amount */
"
"
"
"              v_loan_cl_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"              INSERT INTO emp_loan_reschl_rqst_new_dtls(elrrnd_bu        ,
"
"                                 elrrnd_doc_no        ,
"
"                                 elrrnd_seq_no        ,
"
"                                 elrrnd_ded_year    ,
"
"                                 elrrnd_ded_period    ,
"
"                                 elrrnd_ded_amt        ,
"
"                                 elrrnd_prin_due_amt    ,
"
"                                 elrrnd_int_due_amt    ,
"
"                                 elrrnd_op_prin_amt    ,
"
"                                 elrrnd_os_amt        ,
"
"                                 elrrnd_cre_by        ,
"
"                                 elrrnd_cre_date    ,
"
"                                 elrrnd_cre_os_user    ,
"
"                                 elrrnd_cre_ip_addr    ,
"
"                                 elrrnd_cre_emp_id      )   /* bharathi*/
"
"                              VALUES(p_bu            ,                --elrrnd_bu
"
"                                 p_doc_no        ,                --elrrnd_order_no
"
"                                 v_seq_no        ,                --elrrnd_seq_no
"
"                                 v_year            ,                --elrrnd_ded_year
"
"                                 v_period        ,                --elrrnd_ded_period
"
"                                 v_loan_emi_amt + v_loan_emi_int_amt,            --elrrnd_ded_amt
"
"                                 v_loan_emi_amt        ,                --elrrnd_prin_due_amt
"
"                                 v_loan_emi_int_amt    ,                --elrrnd_int_due_amt
"
"                                 v_loan_op_pri_amt    ,                --elrrnd_op_prin_amt
"
"                                 v_loan_cl_pri_amt    ,                --elrrnd_os_amt
"
"                                 p_user            ,                --elrrnd_cre_by
"
"                                 SYSDATE        ,                --elrrnd_cre_date
"
"                                 v_os_user        ,                --elrrnd_cre_os_user
"
"                                 v_ip_addr         ,                --elrrnd_cre_ip_addr
"
"                                 v_emp_id               ) ;                              --elrrnd_cre_emp_id
"
"
"
"           v_loan_op_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"           IF LENGTH(v_year) <= 4 THEN
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 1;
"
"                     v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           ELSE
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 101;
"
"                  v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"           v_seq_no := v_seq_no + 1;
"
"              v_res := 'Y';
"
"
"
"            END LOOP i;
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
"   END proc_gen_reschl_fbm_loan_plan;
"
"
"
" /* For SKM */
"
"
"
"   PROCEDURE proc_gen_rbm_loan_plan_skm(p_bu                VARCHAR2,
"
"                        p_rqst_no            VARCHAR2,
"
"                        p_user                VARCHAR2,
"
"                        p_int_amt    OUT        NUMBER,
"
"                        p_rtn_amt    OUT        NUMBER,
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
"     FROM employees,
"
"          emp_loans_request
"
"    WHERE emp_bu      = elr_bu
"
"      AND emp_emp_id  = elr_emp_id
"
"      AND elr_bu      = p_bu
"
"      AND elr_rqst_no = p_rqst_no
"
"      AND elr_status  = 'D'
"
"      AND elr_pymnt_status = 'P';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_year                NUMBER,
"
"             c_period                NUMBER,
"
"             c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT *
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
"      cr2                    c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT NVL(SUM(eldp_int_due_amt), 0) eldp_int_due_amt,
"
"          NVL(SUM(eldp_ded_amt), 0) eldp_ded_amt
"
"     FROM emp_loans_ded_plan
"
"    WHERE eldp_bu = p_bu
"
"      AND eldp_order_no = p_rqst_no;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"      v_loan_op_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_cl_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_tot_amt                NUMBER(15, 3) := 0;
"
"      v_loan_emi_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_tot_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_loan_tot_int_amt            NUMBER(15, 3) := 0;
"
"      v_loan_emi_int_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_year                    NUMBER(6);
"
"      v_period                    NUMBER(2);
"
"      v_seq_no                    NUMBER(5) := 1;
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_emp_id                                  VARCHAR2(50) := FUNC_FIND_EMP_ID(p_bu,p_user);
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
"          proc_chk_loan_plan_excep(p_bu,
"
"                     p_rqst_no,
"
"                     p_user);
"
"
"
"            DELETE
"
"              FROM emp_loans_ded_plan
"
"         WHERE eldp_bu       = p_bu
"
"               AND eldp_order_no = p_rqst_no;
"
"
"
"           v_res := 'N';
"
"
"
"            v_year   := cr1.elr_start_year;
"
"            v_period := cr1.elr_start_period;
"
"            --v_loan_emi_amt     := ROUND(cr1.elr_aprvd_amt/cr1.elr_rtn_inst);
"
"            v_loan_emi_amt     := CASE WHEN cr1.elr_inst_ded_type = 'A' THEN cr1.elt_inst_amt ELSE ROUND(cr1.elr_aprvd_amt/cr1.elr_rtn_inst) END;
"
"            v_loan_op_pri_amt  := cr1.elr_aprvd_amt;
"
"            v_loan_cl_pri_amt  := 0;
"
"            v_loan_emi_int_amt := ROUND(cr1.elr_int_amt/cr1.elr_rtn_inst,2);
"
"
"
"            FOR i IN 1..cr1.elr_rtn_inst
"
"            LOOP
"
"
"
"           OPEN c2(v_year, v_period, cr1.emp_clndr_id);
"
"           FETCH c2 INTO cr2;
"
"
"
"              IF c2%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20952, 'HRM'||'~'||p_bu||'~'||v_year||'~'||v_period);
"
"              END IF;
"
"
"
"           CLOSE c2;
"
"
"
"           /* To calculate EMI amount */
"
"
"
"              v_loan_tot_amt := v_loan_tot_amt + v_loan_emi_amt;
"
"
"
"              IF (v_loan_tot_amt <> cr1.elr_aprvd_amt) AND (i = cr1.elr_rtn_inst) THEN
"
"
"
"                 IF v_loan_tot_amt > cr1.elr_aprvd_amt THEN
"
"                  v_loan_emi_amt := v_loan_emi_amt - (v_loan_tot_amt - cr1.elr_aprvd_amt);
"
"                 ELSE
"
"                  v_loan_emi_amt := v_loan_emi_amt + (cr1.elr_aprvd_amt - v_loan_tot_amt);
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_loan_emi_amt := v_loan_emi_amt;
"
"              END IF;
"
"
"
"              /* End of calculate EMI amount */
"
"
"
"              v_loan_cl_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"              /* To calculate Interest amount */
"
"
"
"              v_loan_tot_int_amt := v_loan_tot_int_amt + v_loan_emi_int_amt;
"
"
"
"              v_loan_emi_int_amt := ROUND((v_loan_op_pri_amt * (cr1.elr_aprvd_int_pct/1200)),2);
"
"
"
"              /* End of calculate Interest amount */
"
"
"
"              INSERT INTO emp_loans_ded_plan(eldp_bu            ,
"
"                          eldp_plnt            ,
"
"                          eldp_order_no        ,
"
"                          eldp_seq_no        ,
"
"                          eldp_ded_year        ,
"
"                          eldp_ded_period        ,
"
"                          eldp_ded_amt        ,
"
"                          eldp_prin_due_amt        ,
"
"                          eldp_int_due_amt        ,
"
"                          eldp_op_prin_amt        ,
"
"                          eldp_os_amt        ,
"
"                          eldp_cre_by        ,
"
"                          eldp_cre_date        ,
"
"                          eldp_cre_os_user        ,
"
"                          eldp_cre_ip_addr        ,
"
"                          eldp_cre_emp_id           )
"
"                       VALUES(p_bu            ,            --eldp_bu
"
"                              NULL            ,            --eldp_plnt
"
"                              p_rqst_no            ,            --eldp_order_no
"
"                              v_seq_no            ,            --eldp_seq_no
"
"                              v_year            ,            --eldp_ded_year
"
"                              v_period            ,            --eldp_ded_period
"
"                              v_loan_emi_amt + v_loan_emi_int_amt,        --eldp_ded_amt
"
"                              v_loan_emi_amt        ,            --eldp_prin_due_amt
"
"                          v_loan_emi_int_amt    ,            --eldp_int_due_amt
"
"                          v_loan_op_pri_amt        ,            --eldp_op_prin_amt
"
"                          v_loan_cl_pri_amt        ,            --eldp_os_amt
"
"                              p_user            ,            --eldp_cre_by
"
"                              SYSDATE            ,            --eldp_cre_date
"
"                              v_os_user            ,            --eldp_cre_os_user
"
"                          v_ip_addr         ,            --eldp_cre_ip_addr
"
"                          v_emp_id                  );                      --eldp_cre_emp_id
"
"
"
"           v_loan_op_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"           IF LENGTH(v_year) <= 4 THEN
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 1;
"
"                     v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           ELSE
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 101;
"
"                  v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"           v_seq_no := v_seq_no + 1;
"
"              v_res := 'Y';
"
"
"
"            END LOOP i;
"
"
"
"           OPEN c3;
"
"           FETCH c3 INTO cr3;
"
"           CLOSE c3;
"
"
"
"           p_int_amt := NVL(cr3.eldp_int_due_amt, 0);
"
"           p_rtn_amt := NVL(cr3.eldp_ded_amt, 0);
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
"   END proc_gen_rbm_loan_plan_skm;
"
"
"
" /* For Saudi Union */
"
"
"
"   PROCEDURE proc_fcm_gen_fbm_loan_plan(p_bu                VARCHAR2,
"
"                        p_rqst_no            VARCHAR2,
"
"                        p_user                VARCHAR2,
"
"                        p_instl        OUT        NUMBER,
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
"     FROM employees,
"
"          emp_loans_request,
"
"          loans
"
"    WHERE emp_bu      = elr_bu
"
"      AND emp_emp_id  = elr_emp_id
"
"      AND elr_bu      = loan_bu
"
"      AND elr_loan_id = loan_loan_id
"
"      AND elr_bu      = p_bu
"
"      AND elr_rqst_no = p_rqst_no
"
"      AND elr_status  = 'D'
"
"      AND elr_pymnt_status = 'P';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_year                NUMBER,
"
"             c_period                NUMBER,
"
"             c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT *
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
"      cr2                    c2%ROWTYPE;
"
"
"
"      v_loan_op_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_cl_pri_amt                NUMBER(15, 3) := 0;
"
"      v_loan_tot_amt                NUMBER(15, 3) := 0;
"
"      v_loan_emi_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_amt                NUMBER(15, 3) := 0;
"
"      v_loan_act_tot_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_loan_tot_int_amt            NUMBER(15, 3) := 0;
"
"      v_loan_emi_int_amt            NUMBER(15, 3) := 0;
"
"
"
"      v_rtn_instl                NUMBER(5, 2) := 0;
"
"
"
"      v_emp_cont_end_year            NUMBER(7);
"
"      v_emp_cont_end_period            NUMBER(2);
"
"
"
"      v_year                    NUMBER(6);
"
"      v_period                    NUMBER(2);
"
"      v_seq_no                    NUMBER(5) := 1;
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_emp_id                                  VARCHAR2(50) := FUNC_FIND_EMP_ID(p_bu,p_user);  /*bharathi*/
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
"          proc_chk_loan_plan_excep(p_bu,
"
"                     p_rqst_no,
"
"                     p_user);
"
"
"
"            DELETE
"
"              FROM emp_loans_ded_plan
"
"         WHERE eldp_bu       = p_bu
"
"               AND eldp_order_no = p_rqst_no;
"
"
"
"           v_res := 'N';
"
"
"
"            v_rtn_instl := CEIL(cr1.elr_aprvd_amt/((cr1.elr_aprvd_amt/100) * NVL(cr1.elr_wfm_instlmnt_pct, 0)));
"
"
"
"            v_year   := cr1.elr_start_year;
"
"            v_period := cr1.elr_start_period;
"
"            v_loan_emi_amt     := ROUND(cr1.elr_aprvd_amt/v_rtn_instl);
"
"            v_loan_op_pri_amt  := cr1.elr_aprvd_amt;
"
"            v_loan_cl_pri_amt  := 0;
"
"            v_loan_emi_int_amt := ROUND(cr1.elr_int_amt/v_rtn_instl);
"
"
"
"            proc_find_pyrl_cal_year_period(p_bu,
"
"                               TRUNC(cr1.emp_date_to),
"
"                               v_emp_cont_end_year,
"
"                               v_emp_cont_end_period,
"
"                               cr1.emp_clndr_id);
"
"
"
"            UPDATE emp_loans_request
"
"               SET elr_rtn_inst    = v_rtn_instl,
"
"                   elr_upd_by      = p_user,
"
"                   elr_upd_date    = SYSDATE,
"
"                   elr_upd_ip_addr = v_ip_addr,
"
"                   elr_upd_os_user = v_os_user
"
"             WHERE elr_bu = p_bu
"
"               AND elr_rqst_no = p_rqst_no;
"
"
"
"            FOR i IN 1..v_rtn_instl
"
"            LOOP
"
"
"
"           OPEN c2(v_year, v_period, cr1.emp_clndr_id);
"
"           FETCH c2 INTO cr2;
"
"
"
"              IF c2%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20952, 'HRM'||'~'||p_bu||'~'||v_year||'~'||v_period);
"
"              END IF;
"
"
"
"           CLOSE c2;
"
"
"
"           /* To calculate EMI amount */
"
"
"
"              v_loan_tot_amt := v_loan_tot_amt + v_loan_emi_amt;
"
"
"
"              IF (v_loan_tot_amt <> cr1.elr_aprvd_amt) AND (i = v_rtn_instl) THEN
"
"
"
"                 IF v_loan_tot_amt > cr1.elr_aprvd_amt THEN
"
"                  v_loan_emi_amt := v_loan_emi_amt - (v_loan_tot_amt - cr1.elr_aprvd_amt);
"
"                 ELSE
"
"                  v_loan_emi_amt := v_loan_emi_amt + (cr1.elr_aprvd_amt - v_loan_tot_amt);
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_loan_emi_amt := v_loan_emi_amt;
"
"              END IF;
"
"
"
"              /* End of calculate EMI amount */
"
"
"
"           /* To calculate Interest amount */
"
"
"
"              v_loan_tot_int_amt := v_loan_tot_int_amt + v_loan_emi_int_amt;
"
"
"
"              IF (v_loan_tot_int_amt <> cr1.elr_int_amt) AND (i = v_rtn_instl) THEN
"
"
"
"                 IF v_loan_tot_int_amt > cr1.elr_int_amt THEN
"
"                  v_loan_emi_int_amt := v_loan_emi_int_amt - (v_loan_tot_int_amt - cr1.elr_int_amt);
"
"                 ELSE
"
"                  v_loan_emi_int_amt := v_loan_emi_int_amt + (cr1.elr_int_amt - v_loan_tot_int_amt);
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_loan_emi_int_amt := v_loan_emi_int_amt;
"
"              END IF;
"
"
"
"              /* End of calculate Interest amount */
"
"
"
"              v_loan_cl_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"              INSERT INTO emp_loans_ded_plan(eldp_bu            ,
"
"                          eldp_plnt            ,
"
"                          eldp_order_no        ,
"
"                          eldp_seq_no        ,
"
"                          eldp_ded_year        ,
"
"                          eldp_ded_period        ,
"
"                          eldp_ded_amt        ,
"
"                          eldp_prin_due_amt        ,
"
"                          eldp_int_due_amt        ,
"
"                          eldp_op_prin_amt        ,
"
"                          eldp_os_amt        ,
"
"                          eldp_cre_by        ,
"
"                          eldp_cre_date        ,
"
"                          eldp_cre_os_user        ,
"
"                          eldp_cre_ip_addr        ,
"
"                          eldp_cre_emp_id           )   /*bharathi*/
"
"                       VALUES(p_bu            ,                --eldp_bu
"
"                              NULL            ,                --eldp_plnt
"
"                              p_rqst_no            ,                --eldp_order_no
"
"                              v_seq_no            ,                --eldp_seq_no
"
"                              v_year            ,                --eldp_ded_year
"
"                              v_period            ,                --eldp_ded_period
"
"                              v_loan_emi_amt + v_loan_emi_int_amt,            --eldp_ded_amt
"
"                              v_loan_emi_amt        ,                --eldp_prin_due_amt
"
"                          v_loan_emi_int_amt    ,                --eldp_int_due_amt
"
"                          v_loan_op_pri_amt        ,                --eldp_op_prin_amt
"
"                          v_loan_cl_pri_amt        ,                --eldp_os_amt
"
"                              p_user            ,                --eldp_cre_by
"
"                              SYSDATE            ,                --eldp_cre_date
"
"                              v_os_user            ,                --eldp_cre_os_user
"
"                          v_ip_addr         ,                --eldp_cre_ip_addr
"
"                          v_emp_id                  );                              --eldp_cre_emp_id
"
"
"
"           v_loan_op_pri_amt := v_loan_op_pri_amt - v_loan_emi_amt;
"
"
"
"           IF LENGTH(v_year) <= 4 THEN
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 1;
"
"                     v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           ELSE
"
"
"
"              IF v_period = 12 THEN
"
"                 v_year   := v_year + 101;
"
"                  v_period := 1;
"
"              ELSE
"
"                 v_year   := v_year;
"
"                  v_period := v_period + 1;
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"           IF v_year||TO_CHAR(v_period, '00') > v_emp_cont_end_year||TO_CHAR(v_emp_cont_end_period, '00') THEN
"
"              RAISE_APPLICATION_ERROR(-20078, 'HRM'||'Loan Installment Year/Period : '||v_year||'/'||v_period||' Employee End Year/Period : '||v_emp_cont_end_year||'/'||v_emp_cont_end_period);
"
"           END IF;
"
"
"
"           v_seq_no := v_seq_no + 1;
"
"              v_res := 'Y';
"
"
"
"            END LOOP i;
"
"
"
"            p_instl := v_rtn_instl;
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
"   END proc_fcm_gen_fbm_loan_plan;
"
"
"
"
"
"   PROCEDURE proc_post_loan_plan(p_bu                VARCHAR2,
"
"                 p_rqst_no            VARCHAR2,
"
"                 p_user                VARCHAR2,
"
"                 p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          loans,
"
"          emp_loans_request
"
"    WHERE emp_bu      = elr_bu
"
"      AND emp_emp_id  = elr_emp_id
"
"      AND elr_bu      = loan_bu
"
"      AND elr_loan_id = loan_loan_id
"
"      AND elr_bu      = p_bu
"
"      AND elr_rqst_no = p_rqst_no
"
"      AND elr_status  = 'D'
"
"      AND elr_pymnt_status = 'P';
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
"     FROM emp_loans_ded_plan
"
"    WHERE eldp_bu     = p_bu
"
"      AND eldp_order_no = p_rqst_no
"
"    ORDER BY eldp_seq_no ASC;
"
"
"
"      v_pyrl_int_adj_no                VARCHAR2(15);
"
"      v_pyrl_ded_adj_no                VARCHAR2(15);
"
"      v_result                    VARCHAR2(1) := 'N';
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_cre_emp_id                               VARCHAR2(50) := FUNC_FIND_EMP_ID(p_bu,p_user);
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
"          proc_chk_loan_plan_excep(p_bu,
"
"                     p_rqst_no,
"
"                     p_user);
"
"
"
"        v_result := 'N';
"
"
"
"        FOR cr2 IN c2
"
"        LOOP
"
"
"
"           SELECT NVL(MAX(epadj_adj_no), 0) + 1
"
"             INTO v_pyrl_ded_adj_no
"
"             FROM emp_pyrl_adjustments
"
"                WHERE epadj_bu = p_bu;
"
"
"
"               INSERT INTO emp_pyrl_adjustments (epadj_bu            ,
"
"                             epadj_adj_no            ,
"
"                         epadj_emp_id            ,
"
"                         epadj_elmnt_id            ,
"
"                         epadj_is_definite        ,
"
"                         epadj_start_year        ,
"
"                         epadj_start_period        ,
"
"                         epadj_tot_period        ,
"
"                         epadj_rmng_period        ,
"
"                         epadj_tot_amt            ,
"
"                         epadj_accm_amt            ,
"
"                         epadj_per_amt            ,
"
"                         epadj_mode            ,
"
"                         epadj_source            ,
"
"                         epadj_doc_no            ,
"
"                         epadj_process_flag        ,
"
"                         epadj_status            ,
"
"                         epadj_upd_option        ,
"
"                         epadj_reference        ,
"
"                         epadj_cre_by            ,
"
"                         epadj_cre_date            ,
"
"                         epadj_cre_os_user        ,
"
"                         epadj_cre_ip_addr        ,
"
"                         epadj_cre_emp_id           )     /*Bharathi*/
"
"                                  VALUES(p_bu                ,            --epadj_bu
"
"                                           v_pyrl_ded_adj_no        ,            --epadj_adj_no
"
"                                           cr1.elr_emp_id            ,            --epadj_emp_id
"
"                                           cr1.loan_elmnt_id        ,            --epadj_elmnt_id
"
"                                           'Y'                ,            --epadj_is_definite
"
"                                           cr2.eldp_ded_year        ,            --epadj_start_year
"
"                                           cr2.eldp_ded_period        ,            --epadj_start_period
"
"                                           1                ,            --epadj_tot_period
"
"                                           1                ,            --epadj_rmng_period
"
"                                           cr2.eldp_prin_due_amt        ,            --epadj_tot_amt
"
"                                           0                ,            --epadj_accm_amt
"
"                                           cr2.eldp_prin_due_amt        ,            --epadj_per_amt
"
"                                           '-'                ,            --epadj_mode
"
"                                           'LOANS'            ,            --epadj_source
"
"                                           p_rqst_no            ,            --epadj_doc_no
"
"                                           'Y'                ,            --epadj_process_flag
"
"                                           'P'                ,            --epadj_status
"
"                                           'C'                   ,            --epadj_upd_option
"
"                                           'LOAN PRINCIPAL DEDUCTION PLAN ENTRY',        --epadj_reference
"
"                                           p_user                ,            --epadj_cre_by
"
"                                     SYSDATE            ,            --epadj_cre_date
"
"                                     v_os_user                ,            --epadj_cre_os_user
"
"                             v_ip_addr              ,                   --epadj_cre_ip_addr
"
"                             v_cre_emp_id               );                    --epadj_cre_emp_id
"
"
"
"               UPDATE emp_loans_ded_plan
"
"                  SET eldp_adj_no      = v_pyrl_ded_adj_no,
"
"                      eldp_ded_status  = 'I',
"
"                      eldp_upd_by      = p_user,
"
"                      eldp_upd_date    = SYSDATE,
"
"                      eldp_upd_ip_addr = v_ip_addr,
"
"                      eldp_upd_os_user = v_os_user
"
"                WHERE eldp_bu       = p_bu
"
"                  AND eldp_order_no = p_rqst_no
"
"                  AND eldp_seq_no   = cr2.eldp_seq_no;
"
"
"
"           IF cr2.eldp_int_due_amt > 0 THEN
"
"
"
"              SELECT NVL(MAX(epadj_adj_no), 0) + 1
"
"                INTO v_pyrl_int_adj_no
"
"                FROM emp_pyrl_adjustments
"
"                   WHERE epadj_bu = p_bu;
"
"
"
"                  INSERT INTO emp_pyrl_adjustments(epadj_bu            ,
"
"                               epadj_adj_no            ,
"
"                           epadj_emp_id            ,
"
"                           epadj_elmnt_id        ,
"
"                           epadj_is_definite        ,
"
"                           epadj_start_year        ,
"
"                           epadj_start_period        ,
"
"                           epadj_tot_period        ,
"
"                           epadj_rmng_period        ,
"
"                           epadj_tot_amt        ,
"
"                           epadj_accm_amt        ,
"
"                           epadj_per_amt        ,
"
"                           epadj_mode            ,
"
"                           epadj_source            ,
"
"                           epadj_doc_no            ,
"
"                           epadj_process_flag        ,
"
"                           epadj_status            ,
"
"                           epadj_upd_option        ,
"
"                           epadj_reference        ,
"
"                           epadj_cre_by            ,
"
"                           epadj_cre_date        ,
"
"                           epadj_cre_os_user        ,
"
"                           epadj_cre_ip_addr        ,
"
"                                                   epadj_cre_emp_id         )     /*Bharathi*/
"
"                                    VALUES(p_bu                ,            --epadj_bu
"
"                                             v_pyrl_int_adj_no        ,            --epadj_adj_no
"
"                                             cr1.elr_emp_id        ,            --epadj_emp_id
"
"                                             cr1.loan_int_elmnt_id    ,            --epadj_elmnt_id
"
"                                             'Y'                ,            --epadj_is_definite
"
"                                             cr2.eldp_ded_year        ,            --epadj_start_year
"
"                                             cr2.eldp_ded_period        ,            --epadj_start_period
"
"                                             1                ,            --epadj_tot_period
"
"                                             1                ,            --epadj_rmng_period
"
"                                             cr2.eldp_int_due_amt        ,            --epadj_tot_amt
"
"                                             0                ,            --epadj_accm_amt
"
"                                             cr2.eldp_int_due_amt        ,            --epadj_per_amt
"
"                                             '-'                ,            --epadj_mode
"
"                                             'LOANI'            ,            --epadj_source
"
"                                             p_rqst_no            ,            --epadj_doc_no
"
"                                             'Y'                ,            --epadj_process_flag
"
"                                             'P'                ,            --epadj_status
"
"                                             'C'                   ,            --epadj_upd_option
"
"                                             'LOAN INTEREST DEDUCTION PLAN ENTRY',    --epadj_reference
"
"                                             p_user            ,            --epadj_cre_by
"
"                                       SYSDATE            ,            --epadj_cre_date
"
"                                       v_os_user                ,            --epadj_cre_os_user
"
"                               v_ip_addr              ,            --epadj_cre_ip_addr
"
"                               v_cre_emp_id             );                    --epadj_cre_emp_id
"
"
"
"
"
"                  UPDATE emp_loans_ded_plan
"
"                     SET eldp_int_adj_no  = v_pyrl_int_adj_no,
"
"                         eldp_upd_by      = p_user,
"
"                         eldp_upd_date    = SYSDATE,
"
"                         eldp_upd_ip_addr = v_ip_addr,
"
"                         eldp_upd_os_user = v_os_user
"
"                   WHERE eldp_bu       = p_bu
"
"                     AND eldp_order_no = p_rqst_no
"
"                     AND eldp_seq_no   = cr2.eldp_seq_no;
"
"
"
"               END IF;
"
"
"
"        END LOOP c2;
"
"
"
"            UPDATE emp_loans_request
"
"           SET elr_pymnt_status = 'C',
"
"               elr_status       = 'L',
"
"               elr_upd_by       = p_user,
"
"               elr_upd_date     = SYSDATE,
"
"               elr_upd_ip_addr  = v_ip_addr,
"
"                   elr_upd_os_user  = v_os_user
"
"         WHERE elr_bu      = p_bu
"
"           AND elr_rqst_no = p_rqst_no;
"
"
"
"        IF SQL%FOUND THEN
"
"           v_result := 'Y';
"
"        ELSE
"
"           RAISE_APPLICATION_ERROR(-20023, 'WFR');
"
"        END IF;
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
"      p_res := v_result;
"
"
"
"   END proc_post_loan_plan;
"
"
"
"    PROCEDURE proc_post_reschl_loan_plan(p_bu                VARCHAR2,
"
"                     p_doc_no            VARCHAR2,
"
"                     p_user                VARCHAR2,
"
"                     p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM loans,
"
"          employees,
"
"          emp_loans_request,
"
"          emp_loan_reschl_rqst_hd
"
"    WHERE emp_bu      = elr_bu
"
"      AND emp_emp_id  = elr_emp_id
"
"      AND elr_bu      = loan_bu
"
"      AND elr_loan_id = loan_loan_id
"
"      AND elrrh_bu    = elr_bu
"
"      AND elrrh_loan_doc_no = elr_rqst_no
"
"      AND elrrh_bu      = p_bu
"
"      AND elrrh_doc_no  = p_doc_no;
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
"     FROM emp_loan_reschl_rqst_new_dtls
"
"    WHERE elrrnd_bu     = p_bu
"
"      AND elrrnd_doc_no = p_doc_no
"
"    ORDER BY elrrnd_seq_no ASC;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM emp_loan_reschl_rqst_cur_dtls
"
"    WHERE elrrcd_bu     = p_bu
"
"      AND elrrcd_doc_no = p_doc_no
"
"    ORDER BY elrrcd_seq_no ASC;
"
"
"
"      v_pyrl_int_adj_no                VARCHAR2(15);
"
"      v_pyrl_ded_adj_no                VARCHAR2(15);
"
"      v_ded_plan_seq_no                NUMBER(5);
"
"      v_result                    VARCHAR2(1) := 'N';
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_emp_id                                  VARCHAR2(50) := FUNC_FIND_EMP_ID(p_bu,p_user);
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
"        v_result := 'N';
"
"
"
"        FOR cr2 IN c2
"
"        LOOP
"
"
"
"           SELECT NVL(MAX(epadj_adj_no), 0) + 1
"
"             INTO v_pyrl_ded_adj_no
"
"             FROM emp_pyrl_adjustments
"
"                WHERE epadj_bu = p_bu;
"
"
"
"               INSERT INTO emp_pyrl_adjustments (epadj_bu            ,
"
"                             epadj_adj_no            ,
"
"                         epadj_emp_id            ,
"
"                         epadj_elmnt_id            ,
"
"                         epadj_is_definite        ,
"
"                         epadj_start_year        ,
"
"                         epadj_start_period        ,
"
"                         epadj_tot_period        ,
"
"                         epadj_rmng_period        ,
"
"                         epadj_tot_amt            ,
"
"                         epadj_accm_amt            ,
"
"                         epadj_per_amt            ,
"
"                         epadj_mode            ,
"
"                         epadj_source            ,
"
"                         epadj_doc_no            ,
"
"                         epadj_process_flag        ,
"
"                         epadj_status            ,
"
"                         epadj_upd_option        ,
"
"                         epadj_reference        ,
"
"                         epadj_cre_by            ,
"
"                         epadj_cre_date            ,
"
"                         epadj_cre_os_user        ,
"
"                         epadj_cre_ip_addr        ,
"
"                         epadj_cre_emp_id           )
"
"                                  VALUES(p_bu                ,            --epadj_bu
"
"                                           v_pyrl_ded_adj_no        ,            --epadj_adj_no
"
"                                           cr1.elr_emp_id            ,            --epadj_emp_id
"
"                                           cr1.loan_elmnt_id        ,            --epadj_elmnt_id
"
"                                           'Y'                ,            --epadj_is_definite
"
"                                           cr2.elrrnd_ded_year        ,            --epadj_start_year
"
"                                           cr2.elrrnd_ded_period        ,            --epadj_start_period
"
"                                           1                ,            --epadj_tot_period
"
"                                           1                ,            --epadj_rmng_period
"
"                                           cr2.elrrnd_prin_due_amt    ,            --epadj_tot_amt
"
"                                           0                ,            --epadj_accm_amt
"
"                                           cr2.elrrnd_prin_due_amt    ,            --epadj_per_amt
"
"                                           '-'                ,            --epadj_mode
"
"                                           'LOANS'            ,            --epadj_source
"
"                                           cr1.elrrh_loan_doc_no        ,            --epadj_doc_no
"
"                                           'Y'                ,            --epadj_process_flag
"
"                                           'P'                ,            --epadj_status
"
"                                           'C'                   ,            --epadj_upd_option
"
"                                           'LOAN PRINCIPAL DEDUCTION RESCHEDULE PLAN ENTRY',        --epadj_reference
"
"                                           p_user                ,            --epadj_cre_by
"
"                                     SYSDATE            ,            --epadj_cre_date
"
"                                     v_os_user                ,            --epadj_cre_os_user
"
"                             v_ip_addr              ,            --epadj_cre_ip_addr
"
"                             v_emp_id                   );                  --epadj_cre_emp_id
"
"
"
"               UPDATE emp_loan_reschl_rqst_new_dtls
"
"                  SET elrrnd_adj_no    = v_pyrl_ded_adj_no,
"
"                      elrrnd_upd_by      = p_user,
"
"                      elrrnd_upd_date    = SYSDATE,
"
"                      elrrnd_upd_ip_addr = v_ip_addr,
"
"                      elrrnd_upd_os_user = v_os_user
"
"                WHERE elrrnd_bu     = p_bu
"
"                  AND elrrnd_doc_no = p_doc_no
"
"                  AND elrrnd_seq_no = cr2.elrrnd_seq_no;
"
"
"
"           IF cr2.elrrnd_int_due_amt > 0 THEN
"
"
"
"              SELECT NVL(MAX(epadj_adj_no), 0) + 1
"
"                INTO v_pyrl_int_adj_no
"
"                FROM emp_pyrl_adjustments
"
"                   WHERE epadj_bu = p_bu;
"
"
"
"                  INSERT INTO emp_pyrl_adjustments(epadj_bu            ,
"
"                               epadj_adj_no            ,
"
"                           epadj_emp_id            ,
"
"                           epadj_elmnt_id        ,
"
"                           epadj_is_definite        ,
"
"                           epadj_start_year        ,
"
"                           epadj_start_period        ,
"
"                           epadj_tot_period        ,
"
"                           epadj_rmng_period        ,
"
"                           epadj_tot_amt        ,
"
"                           epadj_accm_amt        ,
"
"                           epadj_per_amt        ,
"
"                           epadj_mode            ,
"
"                           epadj_source            ,
"
"                           epadj_doc_no            ,
"
"                           epadj_process_flag        ,
"
"                           epadj_status            ,
"
"                           epadj_upd_option        ,
"
"                           epadj_reference        ,
"
"                           epadj_cre_by            ,
"
"                           epadj_cre_date        ,
"
"                           epadj_cre_os_user        ,
"
"                           epadj_cre_ip_addr        ,
"
"                           epadj_cre_emp_id         )  /*bharathi*/
"
"                                    VALUES(p_bu                ,            --epadj_bu
"
"                                             v_pyrl_int_adj_no        ,            --epadj_adj_no
"
"                                             cr1.elr_emp_id        ,            --epadj_emp_id
"
"                                             cr1.loan_int_elmnt_id    ,            --epadj_elmnt_id
"
"                                             'Y'                ,            --epadj_is_definite
"
"                                             cr2.elrrnd_ded_year        ,            --epadj_start_year
"
"                                             cr2.elrrnd_ded_period    ,            --epadj_start_period
"
"                                             1                ,            --epadj_tot_period
"
"                                             1                ,            --epadj_rmng_period
"
"                                             cr2.elrrnd_int_due_amt   ,            --epadj_tot_amt
"
"                                             0                ,            --epadj_accm_amt
"
"                                             cr2.elrrnd_int_due_amt   ,            --epadj_per_amt
"
"                                             '-'                ,            --epadj_mode
"
"                                             'LOANI'            ,            --epadj_source
"
"                                             cr1.elrrh_loan_doc_no    ,            --epadj_doc_no
"
"                                             'Y'                ,            --epadj_process_flag
"
"                                             'P'                ,            --epadj_status
"
"                                             'C'                   ,            --epadj_upd_option
"
"                                             'LOAN INTEREST DEDUCTION RESCHEDULE PLAN ENTRY',    --epadj_reference
"
"                                             p_user            ,            --epadj_cre_by
"
"                                       SYSDATE            ,            --epadj_cre_date
"
"                                       v_os_user                ,            --epadj_cre_os_user
"
"                               v_ip_addr              ,            --epadj_cre_ip_addr
"
"                                                   v_emp_id                 );                  --epadj_cre_emp_id
"
"                  UPDATE emp_loan_reschl_rqst_new_dtls
"
"                     SET elrrnd_int_adj_no  = v_pyrl_int_adj_no,
"
"                         elrrnd_upd_by      = p_user,
"
"                         elrrnd_upd_date    = SYSDATE,
"
"                         elrrnd_upd_ip_addr = v_ip_addr,
"
"                         elrrnd_upd_os_user = v_os_user
"
"                   WHERE elrrnd_bu     = p_bu
"
"                     AND elrrnd_doc_no = p_doc_no
"
"                     AND elrrnd_seq_no = cr2.elrrnd_seq_no;
"
"
"
"               END IF;
"
"
"
"           SELECT NVL(MAX(eldp_seq_no), 0) + 1
"
"             INTO v_ded_plan_seq_no
"
"             FROM emp_loans_ded_plan
"
"            WHERE eldp_bu = p_bu
"
"              AND eldp_order_no = cr1.elrrh_loan_doc_no;
"
"
"
"           INSERT INTO emp_loans_ded_plan(eldp_bu             ,
"
"                          eldp_plnt             ,
"
"                          eldp_order_no         ,
"
"                          eldp_seq_no         ,
"
"                          eldp_ded_year         ,
"
"                          eldp_ded_period         ,
"
"                          eldp_ded_amt         ,
"
"                          eldp_prin_due_amt         ,
"
"                          eldp_int_due_amt         ,
"
"                          eldp_op_prin_amt         ,
"
"                          eldp_os_amt         ,
"
"                          eldp_adj_no         ,
"
"                          eldp_int_adj_no         ,
"
"                          eldp_ded_status         ,
"
"                          eldp_cre_by         ,
"
"                          eldp_cre_ip_addr         ,
"
"                          eldp_cre_os_user         ,
"
"                          eldp_cre_emp_id         ,
"
"                          eldp_cre_date         )
"
"                       VALUES(p_bu             ,                        --eldp_bu
"
"                                 NULL             ,                        --eldp_plnt
"
"                                 cr1.elrrh_loan_doc_no  ,                        --eldp_order_no
"
"                                 v_ded_plan_seq_no         ,                        --eldp_seq_no
"
"                                 cr2.elrrnd_ded_year    ,                        --eldp_ded_year
"
"                                 cr2.elrrnd_ded_period  ,                        --eldp_ded_period
"
"                                 (cr2.elrrnd_prin_due_amt + cr2.elrrnd_int_due_amt),        --eldp_ded_amt
"
"                                 cr2.elrrnd_prin_due_amt,                        --eldp_prin_due_amt
"
"                                 cr2.elrrnd_int_due_amt ,                        --eldp_int_due_amt
"
"                                 cr2.elrrnd_op_prin_amt ,                        --eldp_op_prin_amt
"
"                                 cr2.elrrnd_os_amt      ,                        --eldp_os_amt
"
"                                 v_pyrl_ded_adj_no      ,                        --eldp_adj_no
"
"                                 v_pyrl_int_adj_no      ,                        --eldp_int_adj_no
"
"                                 'I'             ,                        --eldp_ded_status
"
"                                 p_user             ,                        --eldp_cre_by
"
"                                 v_ip_addr             ,                        --eldp_cre_ip_addr
"
"                                 v_os_user             ,                        --eldp_cre_os_user
"
"                                 v_emp_id             ,                        --eldp_cre_emp_id  /*bharathi change null to v_emp_id  */
"
"                                 SYSDATE             );                        --eldp_cre_date
"
"
"
"        END LOOP c2;
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"           UPDATE emp_loans_ded_plan
"
"              SET eldp_ded_status = 'S',
"
"                  eldp_upd_by      = p_user,
"
"              eldp_upd_date    = SYSDATE,
"
"              eldp_upd_ip_addr = v_ip_addr,
"
"                      eldp_upd_os_user = v_os_user
"
"                WHERE eldp_bu       = p_bu
"
"                  AND eldp_order_no = cr1.elrrh_loan_doc_no
"
"                  AND eldp_adj_no   = cr3.elrrcd_adj_no;
"
"
"
"           UPDATE emp_pyrl_adjustments
"
"           SET epadj_status    = 'E',
"
"               epadj_narration = 'LOAN PRINCIPAL AMOUNT DEDUCTION RESCHEDULE BY '||p_user||'.',
"
"               epadj_upd_by    = p_user,
"
"               epadj_upd_date  = SYSDATE,
"
"               epadj_upd_ip_addr = v_ip_addr,
"
"                      epadj_upd_os_user = v_os_user
"
"         WHERE epadj_bu     = p_bu
"
"           AND epadj_emp_id = cr1.elrrh_emp_id
"
"           AND epadj_adj_no = cr3.elrrcd_adj_no;
"
"
"
"           IF cr3.elrrcd_int_adj_no IS NOT NULL THEN
"
"
"
"              UPDATE emp_pyrl_adjustments
"
"              SET epadj_status    = 'E',
"
"                  epadj_narration = 'LOAN INTEREST AMOUNT DEDUCTION RESCHEDULE '||p_user||'.',
"
"                  epadj_upd_by    = p_user,
"
"                  epadj_upd_date  = SYSDATE,
"
"                  epadj_upd_ip_addr = v_ip_addr,
"
"                         epadj_upd_os_user = v_os_user
"
"            WHERE epadj_bu     = p_bu
"
"              AND epadj_emp_id = cr1.elrrh_emp_id
"
"              AND epadj_adj_no = cr3.elrrcd_int_adj_no;
"
"
"
"               END IF;
"
"
"
"        END LOOP c3;
"
"
"
"        UPDATE emp_loans_request
"
"           SET elr_rtnd_amt    = elr_rtnd_amt + NVL(cr1.elrrh_pre_clsr_amt,0),
"
"               elr_upd_by      = p_user,
"
"               elr_upd_date    = SYSDATE,
"
"               elr_upd_ip_addr = v_ip_addr,
"
"                   elr_upd_os_user = v_os_user
"
"             WHERE elr_bu      = p_bu
"
"               AND elr_rqst_no = cr1.elr_rqst_no;
"
"
"
"            UPDATE emp_loan_reschl_rqst_hd
"
"           SET elrrh_status       = 'P',
"
"               elrrh_upd_by       = p_user,
"
"               elrrh_upd_date     = SYSDATE,
"
"               elrrh_upd_ip_addr  = v_ip_addr,
"
"                   elrrh_upd_os_user  = v_os_user
"
"         WHERE elrrh_bu     = p_bu
"
"           AND elrrh_doc_no = p_doc_no;
"
"
"
"        IF SQL%FOUND THEN
"
"           v_result := 'Y';
"
"        ELSE
"
"           RAISE_APPLICATION_ERROR(-20023, 'WFR');
"
"        END IF;
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
"      p_res := v_result;
"
"
"
"   END proc_post_reschl_loan_plan;
"
"
"
"END pack_gen_loan_plan;"
/
