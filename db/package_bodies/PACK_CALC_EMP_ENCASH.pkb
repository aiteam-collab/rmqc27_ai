CREATE OR REPLACE
"PACKAGE BODY        pack_calc_emp_encash
"
"AS
"
"
"
"   PROCEDURE proc_load_unit_cat(p_bu                VARCHAR2,
"
"                   p_doc_no            VARCHAR2,
"
"                   p_user                VARCHAR2,
"
"                   p_res        OUT        VARCHAR2)
"
"   AS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_leave_encash_hd
"
"    WHERE heleh_bu = p_bu
"
"      AND heleh_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_clndr_id            VARCHAR2,
"
"            c_doc_type            VARCHAR2,
"
"            c_end_date            DATE)
"
"       IS
"
"   SELECT emp_asgnd_plnt
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
"      AND (emp_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND emp_start_date <= TRUNC(c_end_date)
"
"      AND c_doc_type = 'U'
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status = 'A'
"
"    GROUP BY emp_asgnd_plnt
"
"    UNION ALL
"
"   SELECT empai_dept_id
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
"      AND (emp_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND emp_start_date <= TRUNC(c_end_date)
"
"      AND c_doc_type = 'D'
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status = 'A'
"
"    GROUP BY empai_dept_id
"
"    UNION ALL
"
"   SELECT emp_cat_id
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
"      AND (emp_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND emp_start_date <= TRUNC(c_end_date)
"
"      AND c_doc_type = 'C'
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status = 'A'
"
"    GROUP BY emp_cat_id;
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"      v_seq_no                NUMBER(5) := 1;
"
"      v_ip_address            VARCHAR2(20) := audit_info.get_ip_address;
"
"      v_os_user                VARCHAR2(50) := audit_info.get_os_user;
"
"      v_cre_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
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
"      OPEN c0;
"
"      FETCH c0 INTO cr0;
"
"
"
"         IF c0%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"         ELSE
"
"
"
"            DELETE hrm_emp_leave_encash_dtls
"
"             WHERE heled_bu = p_bu
"
"               AND heled_doc_no = p_doc_no;
"
"
"
"            FOR cr1 IN c1(cr0.heleh_clndr_id, cr0.heleh_doc_type, cr0.heleh_end_date)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_emp_leave_encash_dtls(heled_bu        ,
"
"                             heled_doc_no    ,
"
"                             heled_seq_no    ,
"
"                             heled_type_id    ,
"
"                             heled_sel_flag    ,
"
"                             heled_cre_by    ,
"
"                             heled_cre_ip_addr    ,
"
"                             heled_cre_os_user    ,
"
"                             heled_cre_emp_id    ,
"
"                             heled_cre_date    )
"
"                          VALUES(p_bu        ,                     --heled_bu
"
"                                   p_doc_no        ,                     --heled_doc_no
"
"                                   v_seq_no        ,                     --heled_seq_no
"
"                                   cr1.emp_asgnd_plnt    ,                     --heled_type_id
"
"                                   'Y'        ,                     --heled_sel_flag
"
"                                   p_user        ,                     --heled_cre_by
"
"                                   v_ip_address    ,                     --heled_cre_ip_addr
"
"                                   v_os_user        ,                     --heled_cre_os_user
"
"                                   v_cre_emp_id    ,                     --heled_cre_emp_id
"
"                                   SYSDATE        );                     --heled_cre_date
"
"
"
"               v_seq_no := v_seq_no + 1;
"
"
"
"               v_res := 'Y';
"
"
"
"            END LOOP c1;
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
"      p_res := v_res;
"
"
"
"   END proc_load_unit_cat;
"
"
"
"   PROCEDURE proc_load_emp_dtls(p_bu                VARCHAR2,
"
"                   p_doc_no            VARCHAR2,
"
"                   p_user                VARCHAR2,
"
"                   p_res        OUT        VARCHAR2)
"
"   AS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_leave_encash_hd
"
"    WHERE heleh_bu = p_bu
"
"      AND heleh_doc_no = p_doc_no;
"
"
"
"      cr0                    c0%ROWTYPE;
"
"
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_leave_encash_dtls
"
"    WHERE heled_bu = p_bu
"
"      AND heled_doc_no = p_doc_no
"
"      AND heled_sel_flag = 'Y';
"
"
"
"   CURSOR c2(c_clndr_id                VARCHAR2,
"
"            c_doc_type                VARCHAR2,
"
"            c_type_id                VARCHAR2,
"
"            c_end_date                DATE)
"
"       IS
"
"   SELECT *
"
"     FROM (
"
"   SELECT emp_emp_id,
"
"          empai_pos_id,
"
"          empai_dept_id,
"
"          empai_plnt
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
"      AND (emp_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND emp_start_date <= TRUNC(c_end_date)
"
"      AND emp_asgnd_plnt = c_type_id
"
"      AND c_doc_type = 'U'
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status = 'A'
"
"    UNION ALL
"
"   SELECT emp_emp_id,
"
"          empai_pos_id,
"
"          empai_dept_id,
"
"          empai_plnt
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
"      AND (emp_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND emp_start_date <= TRUNC(c_end_date)
"
"      AND empai_dept_id = c_type_id
"
"      AND c_doc_type = 'D'
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status = 'A'
"
"    UNION ALL
"
"   SELECT emp_emp_id,
"
"          empai_pos_id,
"
"          empai_dept_id,
"
"          empai_plnt
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
"      AND (emp_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND emp_start_date <= TRUNC(c_end_date)
"
"      AND emp_cat_id = c_type_id
"
"      AND c_doc_type = 'C'
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status = 'A')
"
"    ORDER BY emp_emp_id;
"
"
"
"   CURSOR c3(c_leave_id                VARCHAR2,
"
"            c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_leave_cur_bal
"
"    WHERE emplcb_bu       = p_bu
"
"      AND emplcb_leave_id = c_leave_id
"
"      AND emplcb_emp_id   = c_emp_id
"
"      AND emplcb_cur_bal > 0;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"      v_seq_no                    NUMBER(5) := 1;
"
"
"
"      v_cur_bal                    NUMBER(7, 2) := 0;
"
"
"
"      v_ip_address                VARCHAR2(20) := audit_info.get_ip_address;
"
"      v_os_user                    VARCHAR2(50) := audit_info.get_os_user;
"
"      v_cre_emp_id                VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
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
"      OPEN c0;
"
"      FETCH c0 INTO cr0;
"
"
"
"         IF c0%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"         ELSE
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               FOR cr2 IN c2(cr0.heleh_clndr_id, cr0.heleh_doc_type, cr1.heled_type_id, cr0.heleh_end_date)
"
"               LOOP
"
"
"
"                  OPEN c3(cr0.heleh_leave_id, cr2.emp_emp_id);
"
"                  FETCH c3 INTO cr3;
"
"
"
"                     IF c3%NOTFOUND THEN
"
"                        v_cur_bal := 0;
"
"                     ELSE
"
"                        v_cur_bal := cr3.emplcb_cur_bal;
"
"                     END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"                  INSERT INTO hrm_emp_leave_encash_ln(helel_bu        ,
"
"                              helel_doc_no    ,
"
"                              helel_seq_no    ,
"
"                              helel_emp_id    ,
"
"                              helel_pos_id    ,
"
"                              helel_dept_id    ,
"
"                              helel_plnt    ,
"
"                              helel_cur_bal    ,
"
"                              helel_encash_days    ,
"
"                              helel_bal_days    ,
"
"                              helel_encash_amt    ,
"
"                              helel_sel_flag    ,
"
"                              helel_cre_by    ,
"
"                              helel_cre_ip_addr    ,
"
"                              helel_cre_os_user    ,
"
"                              helel_cre_emp_id    ,
"
"                              helel_cre_date    )
"
"                           VALUES(p_bu        ,                          --helel_bu
"
"                                     p_doc_no        ,                          --helel_doc_no
"
"                                     v_seq_no        ,                          --helel_seq_no
"
"                                     cr2.emp_emp_id    ,                          --helel_emp_id
"
"                                     cr2.empai_pos_id    ,                          --helel_pos_id
"
"                                     cr2.empai_dept_id    ,                          --helel_dept_id
"
"                                     cr2.empai_plnt    ,                          --helel_plnt
"
"                                     v_cur_bal        ,                          --helel_cur_bal
"
"                                     v_cur_bal        ,                          --helel_encash_days
"
"                                     0            ,                          --helel_bal_days
"
"                                     0            ,                          --helel_encash_amt
"
"                                     'Y'        ,                          --helel_sel_flag
"
"                                     p_user        ,                          --helel_cre_by
"
"                                     v_ip_address    ,                          --helel_cre_ip_addr
"
"                                     v_os_user        ,                          --helel_cre_os_user
"
"                                     v_cre_emp_id    ,                          --helel_cre_emp_id
"
"                                     SYSDATE        );                          --helel_cre_date
"
"
"
"                  v_seq_no := v_seq_no + 1;
"
"                  v_res := 'Y';
"
"
"
"               END LOOP c2;
"
"
"
"            END LOOP c1;
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
"      p_res := v_res;
"
"
"
"   END proc_load_emp_dtls;
"
"
"
"   PROCEDURE proc_upd_encash_amt(p_bu                VARCHAR2,
"
"                    p_doc_no            VARCHAR2,
"
"                    p_user                VARCHAR2,
"
"                    p_res        OUT        VARCHAR2)
"
"   AS
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
"      cr0                    c0%ROWTYPE;
"
"
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_leave_encash_hd
"
"    WHERE heleh_bu = p_bu
"
"      AND heleh_doc_no = p_doc_no;
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
"     FROM hrm_emp_leave_encash_ln,
"
"          employees
"
"    WHERE helel_bu       = p_bu
"
"      AND helel_doc_no   = p_doc_no
"
"      AND helel_bu     = emp_bu
"
"      AND helel_emp_id     = emp_emp_id
"
"      AND helel_sel_flag = 'Y';
"
"
"
"   CURSOR c3(c_start_date            DATE,
"
"               c_end_date                DATE,
"
"            c_zone_id                VARCHAR2,
"
"            c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT COUNT(*) v_wrkd_days
"
"     FROM zone_workday_calendar_hd,
"
"          zone_workday_calendar_ln
"
"    WHERE zwchd_bu        = zwcln_bu
"
"      AND zwchd_zone_id   = zwcln_zone_id
"
"      AND zwchd_clndr_no  = zwcln_clndr_no
"
"      AND zwchd_bu        = p_bu
"
"      AND zwchd_zone_id   = c_zone_id
"
"      AND (zwchd_clndr_id = c_clndr_id OR (zwchd_clndr_id IS NULL AND c_clndr_id IS NULL))
"
"      AND zwcln_workoff   = 'N'
"
"      AND zwchd_status    = 'A'
"
"      AND TRUNC(zwcln_date) BETWEEN TRUNC(c_start_date) AND TRUNC(c_end_date);
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"      v_encash_calc_ctrl_type             VARCHAR2(10);
"
"      v_encash_calc_elmnt            VARCHAR2(10);
"
"
"
"      v_encash_calc_days            NUMBER(7, 2) := 0;
"
"      v_encash_calc_ctrl_days             NUMBER(7, 2) := 0;
"
"
"
"      v_opt_flag                VARCHAR2(1)   := 'N';
"
"      v_ret_val                    NUMBER(15, 3) := 0;
"
"      v_act_ret_val                NUMBER(15, 3) := 0;
"
"      v_encash_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_ip_address                VARCHAR2(20) := audit_info.get_ip_address;
"
"      v_os_user                    VARCHAR2(50) := audit_info.get_os_user;
"
"      v_cre_emp_id                VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
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
"            RAISE_APPLICATION_ERROR(-20074,'HRM'||'~'||p_bu);
"
"         ELSE
"
"
"
"            v_encash_calc_ctrl_type := cr0.hlvc_encash_work_day_calc;
"
"            v_encash_calc_ctrl_days := NVL(cr0.hlvc_encash_spc_days, 0);
"
"            v_encash_calc_elmnt        := cr0.hlvc_leave_encash_calc_elmnt;
"
"
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"
"
"               IF c1%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"               ELSE
"
"
"
"                  FOR cr2 IN c2
"
"                  LOOP
"
"
"
"             IF v_encash_calc_ctrl_type = 'P' THEN
"
"                v_encash_calc_days := (cr1.heleh_end_date - cr1.heleh_start_date) + 1;
"
"             ELSIF v_encash_calc_ctrl_type = 'S' THEN
"
"
"
"                IF (cr0.hlvc_encash_spc_days IS NULL OR cr0.hlvc_encash_spc_days = 0) THEN
"
"                   RAISE_APPLICATION_ERROR(-20037, 'HRM');
"
"                ELSE
"
"                   v_encash_calc_days := v_encash_calc_ctrl_days;
"
"                END IF;
"
"
"
"             ELSIF v_encash_calc_ctrl_type = 'W' THEN
"
"
"
"                OPEN c3(cr1.heleh_start_date, cr1.heleh_end_date, cr2.emp_zone, cr2.emp_clndr_id);
"
"                FETCH c3 INTO cr3;
"
"
"
"                   IF c3%FOUND THEN
"
"                  v_encash_calc_days := NVL(cr3.v_wrkd_days, 0);
"
"                   ELSE
"
"                  v_encash_calc_days := 0;
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
"             IF v_encash_calc_days = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20051, 'HRM');
"
"             END IF;
"
"
"
"             IF v_encash_calc_elmnt IS NOT NULL THEN
"
"
"
"                proc_calc_pay_elements (p_bu,
"
"                            'N',
"
"                            TRUNC(cr1.heleh_start_date),
"
"                            TRUNC(cr1.heleh_end_date),
"
"                            v_encash_calc_elmnt,
"
"                            v_opt_flag,
"
"                            cr2.helel_emp_id,
"
"                            '+',
"
"                            v_ret_val,
"
"                            v_act_ret_val,
"
"                            cr2.emp_pay_basis);
"
"
"
"                v_encash_amt := NVL((v_ret_val/v_encash_calc_days) * cr2.helel_encash_days, 0);
"
"
"
"                     END IF;
"
"
"
"                     UPDATE hrm_emp_leave_encash_ln
"
"                        SET helel_encash_amt  = ROUND(v_encash_amt),
"
"                            helel_bal_days    = helel_cur_bal - helel_encash_days,
"
"                            helel_upd_by      = p_user,
"
"                            helel_upd_ip_addr = v_ip_address,
"
"                            helel_upd_os_user = v_os_user,
"
"                            helel_upd_emp_id  = v_cre_emp_id,
"
"                            helel_upd_date    = SYSDATE
"
"                      WHERE helel_bu = p_bu
"
"                        AND helel_doc_no = p_doc_no
"
"                        AND helel_seq_no = cr2.helel_seq_no;
"
"
"
"                  END LOOP c2;
"
"
"
"               END IF;
"
"
"
"            CLOSE c1;
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
"   END proc_upd_encash_amt;
"
"
"
"   PROCEDURE proc_process_leave_encash(p_bu                VARCHAR2,
"
"                            p_doc_no                VARCHAR2,
"
"                            p_user                VARCHAR2,
"
"                            p_pyrl_type            VARCHAR2,
"
"                            p_res        OUT        VARCHAR2)
"
"   AS
"
"     CURSOR c1
"
"           IS
"
"       SELECT *
"
"         FROM hrm_emp_leave_encash_hd,
"
"              hrm_emp_leave_encash_ln
"
"        WHERE heleh_bu    = helel_bu
"
"          AND heleh_doc_no  = helel_doc_no
"
"          AND heleh_bu    = p_bu
"
"          AND heleh_doc_no    = p_doc_no
"
"          AND helel_encash_amt > 0
"
"          AND helel_sel_flag  = 'Y';
"
"
"
"       cr1    c1%ROWTYPE;
"
"
"
"       CURSOR c2(c_emp_id        VARCHAR2)
"
"           IS
"
"       SELECT *
"
"         FROM employees,
"
"              emp_active_infos
"
"        WHERE empai_bu     = emp_bu
"
"          AND empai_emp_id = emp_emp_id
"
"          AND empai_bu     = p_bu
"
"          AND empai_emp_id = c_emp_id;
"
"
"
"       cr2                c2%ROWTYPE;
"
"
"
"       CURSOR c3
"
"           IS
"
"       SELECT *
"
"         FROM hrm_leave_cntrl
"
"        WHERE hlvc_bu = p_bu;
"
"
"
"       cr3                c3%ROWTYPE;
"
"
"
"      CURSOR c4
"
"          IS
"
"      SELECT *
"
"        FROM hrm_emp_leave_encash_hd
"
"       WHERE heleh_bu = p_bu
"
"         AND heleh_doc_no = p_doc_no
"
"         AND heleh_status = 'N';
"
"
"
"         cr4                c4%ROWTYPE;
"
"
"
"       v_plnt                    VARCHAR2 (10);
"
"       v_pyrl_no                 NUMBER (10);
"
"       v_dept_id                 VARCHAR2 (10);
"
"       v_job_id                  VARCHAR2 (10);
"
"       v_pos_id                  VARCHAR2 (10);
"
"       v_grade_id                VARCHAR2 (10);
"
"       v_loc_id                  VARCHAR2 (10);
"
"       v_group_id                VARCHAR2 (10);
"
"       v_acc_cat_id              VARCHAR2 (10);
"
"       v_net_sal                 NUMBER (15, 3);
"
"       v_round_off               NUMBER (15, 3);
"
"       v_round_diff              NUMBER (15, 3);
"
"       v_emp_name                VARCHAR2 (100);
"
"       v_proc_batch_no           VARCHAR2 (30);
"
"       v_plant_id                 VARCHAR2(100);
"
"       v_clndr_id                 VARCHAR2(10);
"
"       v_year                     NUMBER(6);
"
"       v_period                     NUMBER(2);
"
"       v_elmnt_id            VARCHAR2(10);
"
"       v_ip_addr                 VARCHAR2(20) := AUDIT_INFO.GET_IP_ADDRESS;
"
"       v_os_user                 VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"       v_cre_emp_id                        VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
"
"       v_result             VARCHAR2(1)  := 'N';
"
"       v_leave_pfx                VARCHAR2(10);
"
"       v_leave_doc_no            VARCHAR2(30);
"
"       v_pyrl_add_adj_no        VARCHAR2(15);
"
"       v_end_date            DATE;
"
"
"
"       v_pyrl_st_date            DATE;
"
"       v_pyrl_end_date            DATE;
"
"
"
"       BEGIN
"
"
"
"          OPEN c3;
"
"        FETCH c3 INTO cr3;
"
"
"
"           IF c3%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20001,'HRM'||'~'||p_bu||' LEAVE ENCASHMENT ELEMENT AND PREFIX NOT FOUND');
"
"           ELSE
"
"              v_elmnt_id  := cr3.hlvc_leave_encash_adj_elmnt;
"
"              v_leave_pfx := cr3.hlvc_leave_encash_prifx;
"
"           END IF;
"
"
"
"        CLOSE c3;
"
"
"
"        OPEN c4;
"
"        FETCH c4 INTO cr4;
"
"
"
"           IF c4%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20999, 'HRM');
"
"           ELSE
"
"              v_clndr_id := cr4.heleh_clndr_id;
"
"        v_year     := cr4.heleh_year;
"
"        v_period   := cr4.heleh_period;
"
"        v_pyrl_st_date  := cr4.heleh_start_date;
"
"        v_pyrl_end_date := cr4.heleh_end_date;
"
"           END IF;
"
"
"
"        CLOSE c4;
"
"
"
"      IF p_pyrl_type = 'P' THEN
"
"
"
"         FOR cr1 IN c1
"
"         LOOP
"
"
"
"        --v_leave_doc_no := func_find_hrm_next_id (p_bu, 'EMP_LEAVE');
"
"
"
"        v_leave_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'LE',p_user);
"
"        v_end_date     := TRUNC(cr1.heleh_start_date + ROUND(cr1.helel_encash_days))-1;
"
"
"
"        SELECT NVL(MAX(epadj_adj_no), 0) + 1
"
"          INTO v_pyrl_add_adj_no
"
"          FROM emp_pyrl_adjustments
"
"         WHERE epadj_bu = p_bu;
"
"
"
"        INSERT INTO employee_leaves (empleave_bu          ,
"
"                         empleave_pfx          ,
"
"                         empleave_doc_no              ,
"
"                         empleave_req_date              ,
"
"                         empleave_req_no              ,
"
"                         empleave_type              ,
"
"                         empleave_emp_id              ,
"
"                         empleave_leave_id              ,
"
"                         empleave_pfx_id              ,
"
"                         empleave_oper              ,
"
"                         empleave_year              ,
"
"                         empleave_period              ,
"
"                         empleave_applied_days        ,
"
"                         empleave_apprvd_days      ,
"
"                         empleave_start_date      ,
"
"                         empleave_end_date              ,
"
"                         empleave_encash_opt      ,
"
"                         empleave_encash_amt      ,
"
"                         empleave_encash_adj_no      ,
"
"                         empleave_briefdesc            ,
"
"                         empleave_status            ,
"
"                         empleave_cre_by              ,
"
"                         empleave_cre_date            ,
"
"                         empleave_cre_ip_addr      ,
"
"                         empleave_cre_os_user       ,
"
"                         empleave_cre_emp_id      )
"
"                     VALUES (p_bu                                      ,        --empleave_bu
"
"                             'LE'                                    ,        --empleave_pfx
"
"                         v_leave_doc_no                                  ,        --empleave_doc_no
"
"                         TRUNC(cr1.heleh_doc_date)                        ,        --empleave_req_date
"
"                         NULL                                          ,        --empleave_req_no
"
"                         'E'                                        ,        --empleave_type
"
"                         cr1.helel_emp_id                              ,        --empleave_emp_id
"
"                         cr1.heleh_leave_id                              ,        --empleave_leave_id
"
"                         v_leave_pfx                              ,        --empleave_pfx_id
"
"                         '-'                                  ,        --empleave_oper
"
"                         cr1.heleh_year                                  ,        --empleave_year
"
"                         cr1.heleh_period                                  ,        --empleave_period
"
"                         cr1.helel_encash_days                            ,        --empleave_applied_days
"
"                         cr1.helel_encash_days                            ,        --empleave_apprvd_days
"
"                         cr1.heleh_start_date                        ,        --empleave_start_date
"
"                         v_end_date                                 ,        --empleave_end_date
"
"                         p_pyrl_type                                  ,        --empleave_encash_opt
"
"                         cr1.helel_encash_amt                          ,        --empleave_encash_amt
"
"                         v_pyrl_add_adj_no                                    ,        --empleave_encash_adj_no
"
"                         cr1.heleh_ref                              ,        --empleave_briefdesc
"
"                         'P'                                ,        --empleave_status
"
"                         p_user                                      ,        --empleave_cre_by
"
"                         SYSDATE                                     ,        --empleave_cre_date
"
"                         v_ip_addr                                ,        --empleave_cre_ip_address
"
"                         v_os_user                                ,        --empleave_cre_os_user
"
"                         v_cre_emp_id                            );        --empleave_cre_emp_id
"
"
"
"        UPDATE emp_leave_cur_bal
"
"           SET emplcb_cur_bal     = NVL(emplcb_cur_bal, 0) - NVL(cr1.helel_encash_days, 0),
"
"               emplcb_taken       = emplcb_taken   + NVL(cr1.helel_encash_days, 0),
"
"               emplcb_upd_by         = p_user,
"
"               emplcb_upd_ip_addr = v_ip_addr,
"
"               emplcb_upd_os_user = v_os_user,
"
"               emplcb_upd_emp_id  = v_cre_emp_id,
"
"               emplcb_upd_date    = SYSDATE
"
"         WHERE emplcb_bu       = p_bu
"
"           AND emplcb_emp_id   = cr1.helel_emp_id
"
"                   AND emplcb_leave_id = cr1.heleh_leave_id;
"
"
"
"        INSERT INTO emp_pyrl_adjustments (epadj_bu             ,
"
"                          epadj_adj_no                 ,
"
"                          epadj_emp_id                 ,
"
"                          epadj_elmnt_id         ,
"
"                          epadj_is_definite         ,
"
"                          epadj_start_year         ,
"
"                          epadj_start_period         ,
"
"                          epadj_tot_period         ,
"
"                          epadj_rmng_period         ,
"
"                          epadj_tot_amt         ,
"
"                          epadj_accm_amt         ,
"
"                          epadj_per_amt         ,
"
"                          epadj_mode             ,
"
"                          epadj_source         ,
"
"                          epadj_doc_no         ,
"
"                          epadj_process_flag         ,
"
"                          epadj_status         ,
"
"                          epadj_upd_option         ,
"
"                          epadj_reference         ,
"
"                          epadj_cre_by         ,
"
"                          epadj_cre_ip_addr         ,
"
"                          epadj_cre_os_user         ,
"
"                          epadj_cre_emp_id         ,
"
"                          epadj_cre_date         )
"
"                         VALUES(p_bu                 ,                --epadj_bu
"
"                           v_pyrl_add_adj_no         ,                --epadj_adj_no
"
"                           cr1.helel_emp_id         ,                --epadj_emp_id
"
"                           v_elmnt_id,                --epadj_elmnt_id
"
"                           'Y'                 ,                --epadj_is_definite
"
"                           cr1.heleh_year                ,                --epadj_start_year
"
"                           cr1.heleh_period             ,                --epadj_start_period
"
"                           1                 ,                --epadj_tot_period
"
"                           1                 ,                --epadj_rmng_period
"
"                           cr1.helel_encash_amt      ,                --epadj_tot_amt
"
"                           0                 ,                --epadj_accm_amt
"
"                           cr1.helel_encash_amt      ,                --epadj_per_amt
"
"                           '+'                 ,                --epadj_mode
"
"                           'ENLEA'             ,                --epadj_source
"
"                           v_leave_doc_no         ,                --epadj_doc_no
"
"                           'Y'                 ,                --epadj_process_flag
"
"                           'P'                 ,                --epadj_status
"
"                           'C'                 ,                --epadj_upd_option
"
"                           'LEAVE ENCASHMENT PAID THROUGH PAYROLL ADJUSTMENT',    --epadj_reference
"
"                           p_user             ,                --epadj_cre_by
"
"                              v_ip_addr                             ,                    --epadj_cre_ip_address
"
"                           v_os_user                        ,                --epadj_cre_os_user
"
"                           v_cre_emp_id                        ,
"
"                           SYSDATE                             );--epadj_cre_date
"
"
"
"        UPDATE hrm_emp_leave_encash_ln
"
"           SET helel_pyrl_adj_no     = v_pyrl_add_adj_no,
"
"               helel_upd_by        = p_user,
"
"               helel_upd_ip_addr    = v_ip_addr,
"
"               helel_upd_os_user     = v_os_user,
"
"               helel_upd_emp_id        = v_cre_emp_id,
"
"               helel_upd_date        = SYSDATE
"
"         WHERE helel_bu            = p_bu
"
"           AND helel_doc_no        = p_doc_no
"
"           AND helel_emp_id        = cr1.helel_emp_id;
"
"
"
"        UPDATE hrm_emp_leave_encash_hd
"
"           SET heleh_pay_mode        = 'P',
"
"               heleh_status        = 'P',
"
"               heleh_upd_by        = p_user,
"
"               heleh_upd_ip_addr    = v_ip_addr,
"
"               heleh_upd_os_user    = v_os_user,
"
"               heleh_upd_emp_id        = v_cre_emp_id,
"
"               heleh_upd_date        = SYSDATE
"
"         WHERE heleh_bu            = p_bu
"
"           AND heleh_doc_no        = p_doc_no;
"
"
"
"        v_result := 'Y';
"
"        v_end_date := NULL;
"
"
"
"         END LOOP c1;
"
"
"
"         p_res := v_result;
"
"
"
"      END IF;
"
"
"
"          IF p_pyrl_type = 'E' THEN
"
"
"
"             SELECT NVL (MAX (phhd_pyrl_no), 0) + 1
"
"               INTO v_pyrl_no
"
"               FROM payroll_hist_hd
"
"              WHERE phhd_bu = p_bu;
"
"
"
"             SELECT LISTAGG(helel_plnt,',') WITHIN GROUP (order by helel_plnt)
"
"               INTO v_plant_id
"
"               FROM (
"
"                     SELECT DISTINCT helel_plnt
"
"                       FROM hrm_emp_leave_encash_ln
"
"                      WHERE helel_bu      = p_bu
"
"                        AND helel_doc_no = p_doc_no);
"
"
"
"             --v_proc_batch_no := func_find_hrm_next_id (p_bu, 'EMP_BATCH_NO');
"
"
"
"             v_proc_batch_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'PBN',p_user);
"
"
"
"             FOR cr1 IN c1
"
"             LOOP
"
"
"
"                --v_leave_doc_no := func_find_hrm_next_id (p_bu, 'EMP_LEAVE');
"
"
"
"                v_leave_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'LE',p_user);
"
"                v_end_date     := TRUNC(cr1.heleh_start_date + ROUND(cr1.helel_encash_days))-1;
"
"
"
"                OPEN c2 (cr1.helel_emp_id);
"
"                FETCH c2 INTO cr2;
"
"
"
"           IF c1%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20821,'HRM'||'~'||cr1.helel_emp_id);
"
"           ELSE
"
"              v_plnt        := cr2.empai_plnt;
"
"                    v_dept_id    := cr2.empai_dept_id;
"
"                    v_job_id        := cr2.empai_job_id;
"
"                    v_pos_id        := cr2.empai_pos_id;
"
"                    v_grade_id   := cr2.empai_grade;
"
"                    v_loc_id        := cr2.empai_loc_id;
"
"                    v_emp_name   := func_find_employee_desc (cr1.heleh_bu,cr2.empai_emp_id, '1');
"
"                    v_group_id   := cr2.emp_group_id;
"
"                    v_acc_cat_id := cr2.emp_acct_cat_id;
"
"           END IF;
"
"
"
"                CLOSE c2;
"
"
"
"                INSERT INTO employee_leaves (empleave_bu          ,
"
"                                 empleave_pfx          ,
"
"                         empleave_doc_no              ,
"
"                         empleave_req_date              ,
"
"                         empleave_req_no              ,
"
"                         empleave_type              ,
"
"                         empleave_emp_id              ,
"
"                         empleave_leave_id              ,
"
"                         empleave_pfx_id              ,
"
"                         empleave_oper              ,
"
"                         empleave_year              ,
"
"                         empleave_period              ,
"
"                         empleave_applied_days        ,
"
"                         empleave_apprvd_days      ,
"
"                         empleave_start_date      ,
"
"                         empleave_end_date              ,
"
"                         empleave_encash_opt      ,
"
"                         empleave_encash_amt      ,
"
"                         empleave_pyrl_no            ,
"
"                         empleave_pyrl_batch_no      ,
"
"                         empleave_briefdesc            ,
"
"                         empleave_status            ,
"
"                         empleave_cre_by              ,
"
"                         empleave_cre_date            ,
"
"                         empleave_cre_ip_addr      ,
"
"                         empleave_cre_os_user       ,
"
"                         empleave_cre_emp_id      )
"
"                     VALUES (p_bu                                      ,        --empleave_bu
"
"                             'LE'                                ,        --empleave_pfx
"
"                         v_leave_doc_no                                  ,        --empleave_doc_no
"
"                         TRUNC(cr1.heleh_doc_date)                        ,        --empleave_req_date
"
"                         NULL                                          ,        --empleave_req_no
"
"                         'E'                                        ,        --empleave_type
"
"                         cr1.helel_emp_id                              ,        --empleave_emp_id
"
"                         cr1.heleh_leave_id                              ,        --empleave_leave_id
"
"                         v_leave_pfx                              ,        --empleave_pfx_id
"
"                         '-'                                  ,        --empleave_oper
"
"                         cr1.heleh_year                                  ,        --empleave_year
"
"                         cr1.heleh_period                                  ,        --empleave_period
"
"                         cr1.helel_encash_days                            ,        --empleave_applied_days
"
"                         cr1.helel_encash_days                            ,        --empleave_apprvd_days
"
"                         cr1.heleh_start_date                    ,        --empleave_start_date
"
"                         v_end_date                             ,        --empleave_end_date
"
"                         p_pyrl_type                                      ,        --empleave_encash_opt
"
"                         cr1.helel_encash_amt                          ,        --empleave_encash_amt
"
"                         v_pyrl_no                                ,        --empleave_pyrl_no
"
"                         v_proc_batch_no                            ,        --empleave_pyrl_batch_no
"
"                         cr1.heleh_ref                              ,        --empleave_briefdesc
"
"                         'P'                                ,        --empleave_status
"
"                         p_user                                      ,        --empleave_cre_by
"
"                         SYSDATE                                     ,        --empleave_cre_date
"
"                         v_ip_addr                                ,        --empleave_cre_ip_address
"
"                         v_os_user                                ,        --empleave_cre_os_user
"
"                         v_cre_emp_id                            );        --empleave_cre_emp_id
"
"
"
"
"
"        UPDATE emp_leave_cur_bal
"
"           SET emplcb_cur_bal     = NVL(emplcb_cur_bal, 0) - NVL(cr1.helel_encash_days, 0),
"
"               emplcb_taken       = emplcb_taken   + NVL(cr1.helel_encash_days, 0),
"
"               emplcb_upd_by         = p_user,
"
"               emplcb_upd_ip_addr = v_ip_addr,
"
"               emplcb_upd_os_user = v_os_user,
"
"               emplcb_upd_emp_id  = v_cre_emp_id,
"
"               emplcb_upd_date    = SYSDATE
"
"         WHERE emplcb_bu       = p_bu
"
"           AND emplcb_emp_id   = cr1.helel_emp_id
"
"                   AND emplcb_leave_id = cr1.heleh_leave_id;
"
"
"
"                INSERT INTO payroll_hist_hd (phhd_bu,
"
"                                              phhd_plnt,
"
"                                              phhd_pyrl_no,
"
"                                              phhd_pyrl_type,
"
"                                              phhd_year,
"
"                                              phhd_period,
"
"                                              phhd_clndr_id,
"
"                                              phhd_emp_id,
"
"                                              phhd_dept_id,
"
"                                              phhd_job_id,
"
"                                              phhd_pos_id,
"
"                                              phhd_grade_id,
"
"                                              phhd_loc_id,
"
"                                              phhd_posted,
"
"                                              phhd_emp_name,
"
"                                              phhd_status,
"
"                                              phhd_net_payable,
"
"                                              phhd_pay_in_progress,
"
"                                              phhd_paid_amt,
"
"                                              phhd_inprog_amt,
"
"                                              phhd_check_flag,
"
"                                              phhd_type,
"
"                                              phhd_hold_flag,
"
"                                              phhd_process_batch_no,
"
"                                              phhd_emp_group,
"
"                                              phhd_acct_cat_id,
"
"                                              phhd_actual_net,
"
"                                              phhd_net_afr_round,
"
"                                              phhd_net_bfr_round,
"
"                                              phhd_emp_plnt,
"
"                                              phhd_mon_days,
"
"                                              phhd_workin_days,
"
"                                              phhd_holidays,
"
"                                              phhd_off,
"
"                                              phhd_workoff_holiday,
"
"                                              phhd_tot_paid_days,
"
"                                              phhd_process_date,
"
"                                              phhd_bustrip_days,
"
"                                              phhd_paid_leave_days,
"
"                                              phhd_unpaid_leave_days,
"
"                                              phhd_late_hrs,
"
"                                              phhd_cre_by,
"
"                                              phhd_cre_date,
"
"                                              phhd_cre_ip_addr,
"
"                                              phhd_cre_os_user,
"
"                             phhd_cre_emp_id)
"
"                       VALUES (p_bu,                                     --phhd_bu,
"
"                           v_plnt,                                        --phhd_plnt,
"
"                           v_pyrl_no,                                  --phhd_pyrl_no,
"
"                           'E',                                      --phhd_pyrl_type,
"
"                           v_year,                                        --phhd_year,
"
"                           v_period,                                    --phhd_period,
"
"                           v_clndr_id,                    --phhd_clndr_id,
"
"                           cr1.helel_emp_id,                             --phhd_emp_id,
"
"                           v_dept_id,                                  --phhd_dept_id,
"
"                           v_job_id,                                    --phhd_job_id,
"
"                           v_pos_id,                                    --phhd_pos_id,
"
"                           v_grade_id,                                --phhd_grade_id,
"
"                           v_loc_id,                                    --phhd_loc_id,
"
"                           'N',                                         --phhd_posted,
"
"                           v_emp_name,                                --phhd_emp_name,
"
"                           'N',                                         --phhd_status,
"
"                           cr1.helel_encash_amt,                    --phhd_net_payable,
"
"                           0,                                  --phhd_pay_in_progress,
"
"                           0,                                         --phhd_paid_amt,
"
"                           0,                                       --phhd_inprog_amt,
"
"                           'N',                                     --phhd_check_flag,
"
"                           'B',                                           --phhd_type,
"
"                           'N',                                      --phhd_hold_flag,
"
"                           v_proc_batch_no,                   --phhd_process_batch_no,
"
"                           v_group_id,                               --phhd_emp_group,
"
"                           v_acc_cat_id,                           --phhd_acct_cat_id,
"
"                           cr1.helel_encash_amt,                      --phhd_actual_net,
"
"                           0,                                  --phhd_net_afr_round,
"
"                           0,                                  --phhd_net_bfr_round,
"
"                           v_plnt,                                    --phhd_emp_plnt,
"
"                           0,                                         --phhd_mon_days,
"
"                           0,                                      --phhd_workin_days,
"
"                           0,                                         --phhd_holidays,
"
"                           0,                                              --phhd_off,
"
"                           0,                                  --phhd_workoff_holiday,
"
"                           0,                                    --phhd_tot_paid_days,
"
"                           SYSDATE,                               --phhd_process_date,
"
"                           0,                                     --phhd_bustrip_days,
"
"                           0,                                  --phhd_paid_leave_days,
"
"                           0,                                --phhd_unpaid_leave_days,
"
"                           0 ,                                         --phhd_late_hrs
"
"                           p_user,                --phhd_cre_by,
"
"                           SYSDATE,                --phhd_cre_date,
"
"                           v_ip_addr,                --phhd_cre_ip_address,
"
"                           v_os_user,            --phhd_cre_os_user,
"
"                           v_cre_emp_id);            --phhd_cre_emp_id.
"
"
"
"                IF cr1.helel_encash_amt > 0 THEN
"
"
"
"                   INSERT INTO payroll_hist_ln (phln_bu,
"
"                                                phln_plnt,
"
"                                                 phln_pyrl_no,
"
"                                                 phln_elmnt_id,
"
"                                                 phln_amount,
"
"                                                 phln_mode,
"
"                                                 phln_reference,
"
"                                                 phln_elmnt_cat,
"
"                                                 phln_actual_amount,
"
"                                                 phln_process_batch_no,
"
"                                                 phln_source,
"
"                                                 phln_emp_plnt,
"
"                                                 phln_cre_by,
"
"                                                 phln_cre_date,
"
"                                                 phln_cre_ip_addr,
"
"                                                 phln_cre_os_user,
"
"                                                 phln_cre_emp_id)
"
"                           VALUES (p_bu,
"
"                          v_plnt,
"
"                             v_pyrl_no,
"
"                             v_elmnt_id,
"
"                             cr1.helel_encash_amt,
"
"                             '+',
"
"                             'PAYROLL LEAVE ENCASHMENT SALARY.',
"
"                             'N',
"
"                             cr1.helel_encash_amt,
"
"                             v_proc_batch_no,
"
"                             'ENLEA',
"
"                             v_plnt,
"
"                             p_user,
"
"                             SYSDATE,
"
"                             v_ip_addr,
"
"                             v_os_user,
"
"                             v_cre_emp_id);
"
"                END IF;
"
"
"
"                UPDATE hrm_emp_leave_encash_ln
"
"                    SET helel_pyrl_no        = v_pyrl_no,
"
"                          helel_pyrl_batch_no       = v_proc_batch_no,
"
"                       helel_upd_by        = p_user,
"
"                       helel_upd_ip_addr    = v_ip_addr,
"
"                       helel_upd_os_user     = v_os_user,
"
"                       helel_upd_emp_id        = v_cre_emp_id,
"
"                       helel_upd_date        = SYSDATE
"
"                   WHERE helel_bu            = p_bu
"
"                   AND helel_doc_no        = p_doc_no
"
"                   AND helel_emp_id        = cr1.helel_emp_id;
"
"
"
"                 v_pyrl_no := v_pyrl_no + 1;
"
"                 v_end_date:= NULL;
"
"
"
"                 v_result := 'Y';
"
"
"
"             END LOOP c1;
"
"
"
"             INSERT INTO pyrl_proc_batch_hd (ppbh_bu,
"
"                                  ppbh_pfx,
"
"                                           ppbh_batch_no,
"
"                                           ppbh_jrnl_date,
"
"                                           ppbh_year,
"
"                                           ppbh_period,
"
"                                           ppbh_ref,
"
"                                           ppbh_status,
"
"                                           ppbh_clndr_id,
"
"                                           ppbh_pyrl_type,
"
"                                           ppbh_batch_proc_plnts,
"
"                                           ppbh_cre_by,
"
"                                           ppbh_cre_date,
"
"                                           ppbh_cre_ip_addr,
"
"                                           ppbh_cre_os_user,
"
"                                           ppbh_cre_emp_id)
"
"                        VALUES(p_bu,
"
"                               'PBN',
"
"                                  v_proc_batch_no,
"
"                               SYSDATE,
"
"                               v_year,
"
"                               v_period,
"
"                           'PAYROLL SALARY POSTING FOR THE MONTH OF '||TO_CHAR(v_pyrl_end_date,'MON-RRRR'),
"
"                               'N',
"
"                               v_clndr_id,
"
"                               'E',
"
"                               v_plant_id,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               v_ip_addr,
"
"                               v_os_user,
"
"                               v_cre_emp_id);
"
"
"
"             UPDATE hrm_emp_leave_encash_hd
"
"                SET heleh_status      = 'P',
"
"                    heleh_pay_mode    = 'E',
"
"                    heleh_upd_by      = p_user,
"
"                    heleh_upd_date    = SYSDATE,
"
"                    heleh_upd_ip_addr = v_ip_addr,
"
"                    heleh_upd_os_user = v_os_user,
"
"                    heleh_upd_emp_id  = v_cre_emp_id
"
"              WHERE heleh_bu       = p_bu
"
"                AND heleh_doc_no = p_doc_no;
"
"
"
"             p_res  := v_result;
"
"
"
"          END IF;
"
"
"
"       END;
"
"
"
"END pack_calc_emp_encash;"
/
