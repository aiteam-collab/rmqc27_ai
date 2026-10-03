CREATE OR REPLACE
"PACKAGE BODY pack_emp_fnf_pyrl
"
"AS
"
"
"
"   FUNCTION func_find_applctrl_rndoff_dgts(p_bu            VARCHAR2)
"
"   RETURN NUMBER
"
"       IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM appl_control
"
"    WHERE applctrl_bu = p_bu;
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
"            RAISE_APPLICATION_ERROR(-20022, 'ADM'||'~'||p_bu);
"
"         ELSE
"
"
"
"            IF NVL(cr1.applctrl_rndoff_dgts, 0) BETWEEN 0 AND 3 THEN
"
"               RETURN NVL(cr1.applctrl_rndoff_dgts, 0);
"
"            ELSE
"
"               RETURN 0;
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
"   END func_find_applctrl_rndoff_dgts;
"
"
"
"   PROCEDURE proc_cre_emp_fnf_pyrl(p_bu                        VARCHAR2,
"
"                         p_doc_no                    VARCHAR2,
"
"                         p_quest_id                    VARCHAR2,
"
"                      p_user                    VARCHAR2,
"
"                      p_res        OUT            VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_relieve_fnf_pend_vw
"
"    WHERE erfpv_bu     = p_bu
"
"      AND erfpv_doc_no = p_doc_no;
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_active_info_dtl_view
"
"    WHERE eaidv_bu = p_bu
"
"      AND eaidv_emp_id = c_emp_id;
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
"   SELECT *
"
"     FROM hrm_fnf_quest_temp_quest
"
"    WHERE hfqtq_bu      = p_bu
"
"      AND hfqtq_temp_id = p_quest_id
"
"    ORDER BY hfqtq_print_seq;
"
"
"
"      v_rel_date_from                DATE;
"
"      v_rel_date_to                DATE;
"
"      v_emp_last_proc_year            NUMBER(6);
"
"      v_emp_last_proc_period            NUMBER(2);
"
"      v_chk_emp_year                NUMBER(6);
"
"      v_chk_emp_period                NUMBER(2);
"
"      v_doc_no                    VARCHAR2(15);
"
"      v_quest_seq_no                NUMBER(5);
"
"      v_noc_doc_no                VARCHAR2(15);
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 03-mar-2022 : Ajis
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
"        IF cr1.erfpv_emp_last_proc_year IS NOT NULL AND cr1.erfpv_emp_last_proc_period IS NOT NULL THEN
"
"
"
"                 IF LENGTH(cr1.erfpv_relieve_year) <= 4 THEN
"
"
"
"              IF cr1.erfpv_relieve_period = 1 THEN
"
"                    v_chk_emp_year   := cr1.erfpv_relieve_year - 1;
"
"                    v_chk_emp_period := 12;
"
"              ELSE
"
"                 v_chk_emp_year   := cr1.erfpv_relieve_year;
"
"                    v_chk_emp_period := cr1.erfpv_relieve_period - 1;
"
"              END IF;
"
"
"
"               ELSE
"
"
"
"              IF cr1.erfpv_relieve_period = 1 THEN
"
"                 v_chk_emp_year   := cr1.erfpv_relieve_year - 101;
"
"                    v_chk_emp_period := 12;
"
"              ELSE
"
"                 v_chk_emp_year   := cr1.erfpv_relieve_year;
"
"                    v_chk_emp_period := cr1.erfpv_relieve_period - 1;
"
"              END IF;
"
"
"
"           END IF;
"
"
"
"           v_emp_last_proc_year   := cr1.erfpv_emp_last_proc_year;
"
"           v_emp_last_proc_period := cr1.erfpv_emp_last_proc_period;
"
"
"
"            ELSE
"
"
"
"           v_chk_emp_year   := cr1.erfpv_relieve_year;
"
"              v_chk_emp_period := cr1.erfpv_relieve_period;
"
"
"
"              proc_find_pyrl_cal_year_period(p_bu,
"
"                                     TRUNC(cr1.erfpv_emp_start_date),
"
"                                     v_emp_last_proc_year,
"
"                                     v_emp_last_proc_period,
"
"                                     cr1.erfpv_emp_clndr_id);
"
"
"
"            END IF;
"
"
"
"           proc_find_pyrl_sdate_edate(p_bu,
"
"                              TRUNC(cr1.erfpv_relieve_date),
"
"                              v_rel_date_from,
"
"                              v_rel_date_to,
"
"                              cr1.erfpv_emp_clndr_id);
"
"
"
"            IF v_emp_last_proc_year||TO_CHAR(v_emp_last_proc_period, '00') < v_chk_emp_year||TO_CHAR(v_chk_emp_period, '00') THEN
"
"               RAISE_APPLICATION_ERROR(-20114, 'HRM'||' Emp. Last Proc. Year/Period : '||v_emp_last_proc_year||'/'||v_emp_last_proc_period||' Relieve Year/Period : '||v_chk_emp_year||'/'||v_chk_emp_period);
"
"            ELSIF v_emp_last_proc_year||TO_CHAR(v_emp_last_proc_period, '00') > v_chk_emp_year||TO_CHAR(v_chk_emp_period, '00') THEN
"
"               RAISE_APPLICATION_ERROR(-20003, 'HRM'||' Emp. Last Proc. Year/Period : '||v_emp_last_proc_year||'/'||v_emp_last_proc_period||' Relieve Year/Period : '||v_chk_emp_year||'/'||v_chk_emp_period);
"
"            ELSE
"
"
"
"               SELECT NVL(MAX(effhd_doc_no), 1000000000) + 1
"
"                 INTO v_doc_no
"
"                 FROM emp_full_final_hd
"
"                WHERE effhd_bu = p_bu;
"
"
"
"               INSERT INTO emp_full_final_hd(effhd_bu            ,
"
"                         effhd_doc_no        ,
"
"                         effhd_doc_date        ,
"
"                         effhd_emp_id        ,
"
"                         effhd_emp_name        ,
"
"                         effhd_emp_start_date    ,
"
"                         effhd_emp_relieve_date    ,
"
"                         effhd_emp_retire_date    ,
"
"                         effhd_emp_relieve_type    ,
"
"                         effhd_year            ,
"
"                         effhd_period        ,
"
"                         effhd_date_from        ,
"
"                         effhd_date_to        ,
"
"                         effhd_noc_req_flag        ,
"
"                         effhd_pay_notice        ,
"
"                         effhd_adjust_el        ,
"
"                         effhd_waive_off        ,
"
"                         effhd_pos_id        ,
"
"                         effhd_pos_desc        ,
"
"                         effhd_dept_id        ,
"
"                         effhd_dept_desc        ,
"
"                         effhd_plnt            ,
"
"                         effhd_plnt_desc        ,
"
"                         effhd_group_id        ,
"
"                         effhd_group_desc        ,
"
"                         effhd_acct_cat_id        ,
"
"                         effhd_acct_cat_desc    ,
"
"                         effhd_serv_yrs        ,
"
"                         effhd_graty_serv_yrs    ,
"
"                         effhd_sou_doc_no        ,
"
"                         effhd_fnf_quest_temp_id    ,
"
"                         effhd_status        ,
"
"                         effhd_cre_by        ,
"
"                         effhd_cre_ip_addr        ,            --added 23-jan-2020 : Ajis
"
"                         effhd_cre_os_user        ,            --added 23-jan-2020 : Ajis
"
"                         effhd_cre_date        ,            --added 23-jan-2020 : Ajis
"
"                         effhd_cre_emp_id        )            --added 03-mar-2022 : Ajis
"
"                      VALUES(p_bu            ,            --effhd_bu
"
"                               v_doc_no            ,            --effhd_doc_no
"
"                               TRUNC(SYSDATE)        ,            --effhd_doc_date
"
"                               cr1.erfpv_emp_id        ,            --effhd_emp_id
"
"                               cr1.erfpv_emp_name        ,            --effhd_emp_name
"
"                               TRUNC(cr1.erfpv_emp_start_date),            --effhd_emp_start_date
"
"                               TRUNC(cr1.erfpv_relieve_date),            --effhd_emp_relieve_date
"
"                               TRUNC(cr1.erfpv_retirement_date),            --effhd_emp_retire_date
"
"                               cr1.erfpv_relieve_type    ,            --effhd_emp_relieve_type
"
"                               cr1.erfpv_relieve_year    ,            --effhd_year
"
"                               cr1.erfpv_relieve_period    ,            --effhd_period
"
"                               v_rel_date_from        ,            --effhd_date_from
"
"                               v_rel_date_to        ,            --effhd_date_to
"
"                               cr1.erfpv_noc_req_flag    ,            --effhd_noc_req_flag
"
"                               cr1.erfpv_pay_notice    ,            --effhd_pay_notice
"
"                               cr1.erfpv_adjust_el    ,            --effhd_adjust_el
"
"                               cr1.erfpv_waive_off_notice    ,            --effhd_waive_off
"
"                               cr1.erfpv_emp_pos_id    ,            --effhd_pos_id
"
"                               cr1.erfpv_emp_pos_desc    ,            --effhd_pos_desc
"
"                               cr1.erfpv_emp_dept_id    ,            --effhd_dept_id
"
"                               cr1.erfpv_emp_dept_desc    ,            --effhd_dept_desc
"
"                               cr1.erfpv_emp_plnt        ,            --effhd_plnt
"
"                               cr1.erfpv_emp_plnt_desc    ,            --effhd_plnt_desc
"
"                               cr1.erfpv_emp_group_id    ,            --effhd_group_id
"
"                               cr1.erfpv_emp_group_desc    ,            --effhd_group_desc
"
"                               cr1.erfpv_emp_acct_cat_id    ,            --effhd_acct_cat_id
"
"                               cr1.erfpv_emp_acct_cat_desc,            --effhd_acct_cat_desc
"
"                               cr1.erfpv_emp_year_of_serv    ,            --effhd_serv_yrs
"
"                               cr1.erfpv_emp_year_of_serv    ,            --effhd_graty_serv_yrs
"
"                               cr1.erfpv_doc_no        ,            --effhd_sou_doc_no
"
"                               p_quest_id            ,            --effhd_fnf_quest_temp_id
"
"                               'N'            ,            --effhd_status
"
"                               p_user            ,            --effhd_cre_by
"
"                               v_ip_addr            ,            --effhd_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                         v_os_user            ,            --effhd_cre_os_user        --added 23-jan-2020 : Ajis
"
"                               SYSDATE            ,            --effhd_cre_date                --added 23-jan-2020 : Ajis
"
"                               v_user_emp_id              );            --effhd_cre_emp_id              --added 23-jan-2020 : Ajis
"
"
"
"               IF cr1.erfpv_noc_req_flag = 'Y' THEN
"
"
"
"                  SELECT NVL(MAX(TO_NUMBER(hernh_doc_no)), 1000000000) + 1
"
"                    INTO v_noc_doc_no
"
"                    FROM hrm_emp_relv_noc_hd
"
"                   WHERE hernh_bu = p_bu;
"
"
"
"                  INSERT INTO hrm_emp_relv_noc_hd(hernh_bu             ,
"
"                          hernh_doc_no             ,
"
"                          hernh_doc_date         ,
"
"                          hernh_emp_id             ,
"
"                          hernh_pos_id             ,
"
"                          hernh_dept_id             ,
"
"                          hernh_plnt             ,
"
"                          hernh_emp_doj             ,
"
"                          hernh_emp_dor             ,
"
"                          hernh_sou_doc_no         ,
"
"                          hernh_ctrl_person         ,
"
"                          hernh_status             ,
"
"                          hernh_cre_by             ,
"
"                          hernh_cre_ip_addr         ,            --added 23-jan-2020 : Ajis
"
"                          hernh_cre_os_user              ,            --added 23-jan-2020 : Ajis
"
"                          hernh_cre_date         ,            --added 23-jan-2020 : Ajis
"
"                          hernh_cre_emp_id         )            --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu                 ,            --hernh_bu
"
"                             v_noc_doc_no             ,            --hernh_doc_no
"
"                             TRUNC(SYSDATE)         ,            --hernh_doc_date
"
"                             cr1.erfpv_emp_id         ,            --hernh_emp_id
"
"                             cr1.erfpv_emp_pos_id          ,            --hernh_pos_id
"
"                             cr1.erfpv_emp_dept_id          ,            --hernh_dept_id
"
"                             cr1.erfpv_emp_plnt         ,            --hernh_plnt
"
"                             TRUNC(cr1.erfpv_emp_start_date),            --hernh_emp_doj
"
"                             TRUNC(cr1.erfpv_relieve_date)  ,            --hernh_emp_dor
"
"                             cr1.erfpv_doc_no         ,            --hernh_sou_doc_no
"
"                             NULL                 ,            --hernh_ctrl_person
"
"                             'N'                 ,            --hernh_status
"
"                             p_user             ,            --hernh_cre_by
"
"                             v_ip_addr             ,            --hernh_cre_ip_addr    --added 23-jan-2020 : Ajis
"
"                             v_os_user             ,            --hernh_cre_os_user    --added 23-jan-2020 : Ajis
"
"                             SYSDATE             ,            --hernh_cre_date    --added 23-jan-2020 : Ajis
"
"                             v_user_emp_id                  );            --hernh_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"               END IF;
"
"
"
"               IF p_quest_id IS NOT NULL THEN
"
"
"
"                  v_quest_seq_no := 1;
"
"
"
"                  FOR cr3 IN c3
"
"                  LOOP
"
"
"
"                     INSERT INTO emp_full_final_quest(effq_bu            ,
"
"                              effq_doc_no        ,
"
"                              effq_seq_no        ,
"
"                              effq_emp_id        ,
"
"                              effq_quest_desc        ,
"
"                              effq_quest_answer        ,
"
"                              effq_cre_by        ,
"
"                              effq_cre_ip_addr        ,        --added 23-jan-2020 : Ajis
"
"                              effq_cre_os_user        ,        --added 23-jan-2020 : Ajis
"
"                              effq_cre_date        ,               --added 23-jan-2020 : Ajis
"
"                              effq_cre_emp_id           )        --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu            ,        --effq_bu
"
"                                     v_doc_no            ,        --effq_doc_no
"
"                                     v_quest_seq_no        ,        --effq_seq_no
"
"                                     cr1.erfpv_emp_id        ,        --effq_emp_id
"
"                                     cr3.hfqtq_quest_desc    ,        --effq_quest_desc
"
"                                     NULL            ,        --effq_quest_answer
"
"                                     p_user            ,        --effq_cre_by
"
"                                     v_ip_addr            ,        --effq_cre_ip_addr          --added 23-jan-2020 : Ajis
"
"                              v_os_user            ,        --effq_cre_os_user          --added 23-jan-2020 : Ajis
"
"                                     SYSDATE            ,               --effq_cre_date              --added 23-jan-2020 : Ajis
"
"                                     v_user_emp_id             );        --effq_cre_emp_id          --added 03-mar-2022 : Ajis
"
"
"
"                     v_quest_seq_no := v_quest_seq_no + 1;
"
"
"
"                  END LOOP c3;
"
"
"
"               END IF;
"
"
"
"               UPDATE emp_relieve
"
"                  SET emprel_status         = 'I',
"
"                      emprel_upd_by         = p_user,
"
"                      emprel_upd_ip_addr  = v_ip_addr,                        --added 23-jan-2020 : Ajis
"
"                      emprel_upd_os_user  = v_os_user,                        --added 23-jan-2020 : Ajis
"
"                      emprel_upd_date     = SYSDATE,                        --added 23-jan-2020 : Ajis
"
"                      emprel_upd_emp_id   = v_user_emp_id                        --added 03-mar-2022 : Ajis
"
"                WHERE emprel_bu     = p_bu
"
"                  AND emprel_doc_no = p_doc_no
"
"                  AND emprel_status = 'A';
"
"
"
"               IF SQL%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20023, 'WFR'||'~'||p_bu||'~'||p_doc_no);
"
"               END IF;
"
"
"
"               UPDATE employees
"
"                  SET emp_status       = 'T',
"
"                      emp_end_date     = TRUNC(cr1.erfpv_relieve_date),
"
"                      emp_upd_by       = p_user,
"
"                      emp_upd_ip_addr  = audit_info.get_ip_address,                     --added 23-jan-2020 : Ajis
"
"                      emp_upd_os_user  = audit_info.get_os_user,                     --added 23-jan-2020 : Ajis
"
"                      emp_upd_date     = SYSDATE,                        --added 23-jan-2020 : Ajis
"
"                      emp_upd_emp_id   = v_user_emp_id                        --added 03-mar-2022 : Ajis
"
"                WHERE emp_bu     = p_bu
"
"                  AND emp_emp_id = cr1.erfpv_emp_id
"
"                  AND emp_status = 'A';
"
"
"
"               IF SQL%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20023, 'WFR'||'~'||p_bu||'~'||cr1.erfpv_emp_id);
"
"               END IF;
"
"
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
"      p_res := v_doc_no;
"
"
"
"   END proc_cre_emp_fnf_pyrl;
"
"
"
"   PROCEDURE proc_prep_fnf_pyrl_emp(p_bu                    VARCHAR2,
"
"                          p_doc_no                    VARCHAR2,
"
"                          p_user                    VARCHAR2,
"
"                          p_res            OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM payroll_control
"
"    WHERE payctrl_bu = p_bu;
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
"     FROM emp_full_final_hd
"
"    WHERE effhd_bu     = p_bu
"
"      AND effhd_doc_no = p_doc_no
"
"      AND effhd_status = 'N';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu       = empai_bu
"
"      AND emp_emp_id   = empai_emp_id
"
"      AND empai_bu     = p_bu
"
"      AND empai_emp_id = c_emp_id
"
"      AND emp_status   = 'T'
"
"      AND emp_end_date IS NOT NULL;
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_sal_type                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_elements_hd
"
"    WHERE pehd_bu     = p_bu
"
"      AND ((pehd_type = 'B'   AND c_sal_type = 'S')
"
"       OR  (pehd_type = 'PDW' AND c_sal_type = 'W'))
"
"      AND pehd_status = 'A';
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_zone_id                VARCHAR2,
"
"         c_start_date            DATE,
"
"         c_end_date                DATE,
"
"         c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT COUNT(*) zwchd_month_days,
"
"          NVL(COUNT(*) - SUM(zwchd_workoff_holiday), 0) zwchd_work_days,
"
"          NVL(SUM(zwchd_workoff_holiday), 0) zwchd_workoff_holiday,
"
"          NVL(SUM(zwchd_holiday_off), 0) zwchd_holiday_off,
"
"          NVL(SUM(zwchd_holiday), 0) zwchd_holiday,
"
"          NVL(SUM(zwchd_all_holiday), 0) zwchd_all_holiday
"
"     FROM (SELECT CASE WHEN (zwcln_workoff = 'Y' AND zwcln_holiday IN ('W', 'B')) THEN 1 ELSE 0 END zwchd_workoff_holiday,
"
"              CASE WHEN (zwcln_workoff = 'Y' AND zwcln_holiday IN ('B')) THEN 1 ELSE 0 END zwchd_holiday_off,
"
"              CASE WHEN zwcln_holiday IN ('H', 'B') THEN 1 ELSE 0 END zwchd_holiday,
"
"              CASE WHEN (zwcln_workoff = 'Y' AND zwcln_holiday IN ('W', 'H', 'B')) THEN 1 ELSE 0 END zwchd_all_holiday
"
"         FROM zone_workday_calendar_hd,
"
"              zone_workday_calendar_ln
"
"        WHERE zwchd_bu       = zwcln_bu
"
"          AND zwchd_zone_id  = zwcln_zone_id
"
"          AND zwchd_clndr_no = zwcln_clndr_no
"
"          AND (zwchd_clndr_id = c_clndr_id OR (zwchd_clndr_id IS NULL AND c_clndr_id IS NULL))
"
"          AND zwchd_bu       = p_bu
"
"          AND zwchd_zone_id  = c_zone_id
"
"          AND zwchd_status   = 'A'
"
"          AND TRUNC(zwcln_date) BETWEEN c_start_date AND c_end_date);
"
"
"
"      cr4                    c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_zone_id                VARCHAR2,
"
"         c_start_date            DATE,
"
"         c_end_date                DATE,
"
"         c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT COUNT(*) zwchd_month_days,
"
"          NVL(SUM(zwchd_workoff), 0) zwchd_workoff,
"
"          NVL(SUM(zwchd_holiday), 0) zwchd_holiday,
"
"          NVL(SUM(zwchd_off), 0) zwchd_off
"
"     FROM (SELECT CASE WHEN zwcln_holiday IN ('W', 'B') THEN 1 ELSE 0 END zwchd_workoff,
"
"              CASE WHEN zwcln_holiday IN ('H', 'B') THEN 1 ELSE 0 END zwchd_holiday,
"
"              CASE WHEN zwcln_workoff = 'Y' THEN 1 ELSE 0 END zwchd_off
"
"         FROM zone_workday_calendar_hd,
"
"              zone_workday_calendar_ln
"
"        WHERE zwchd_bu       = zwcln_bu
"
"          AND zwchd_zone_id  = zwcln_zone_id
"
"             AND zwchd_clndr_no = zwcln_clndr_no
"
"             AND (zwchd_clndr_id = c_clndr_id OR (zwchd_clndr_id IS NULL AND c_clndr_id IS NULL))
"
"            AND zwchd_bu       = p_bu
"
"            AND zwchd_zone_id  = c_zone_id
"
"          AND zwchd_status   = 'A'
"
"          AND TRUNC(zwcln_date) BETWEEN c_start_date AND c_end_date);
"
"
"
"      cr5                    c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_zone_id                VARCHAR2,
"
"         c_start_date            DATE,
"
"         c_end_date                DATE,
"
"         c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(zwchd_working), 0) zwchd_working,
"
"          NVL(SUM(zwchd_workoff_holiday), 0) zwchd_workoff_holiday,
"
"          NVL(SUM(zwchd_holiday_off), 0) zwchd_holiday_off,
"
"          NVL(SUM(zwchd_holiday), 0) zwchd_holiday,
"
"          NVL(SUM(zwchd_all_holiday), 0) zwchd_all_holiday
"
"     FROM (SELECT CASE WHEN zwcln_workoff = 'N' THEN 1 ELSE 0 END zwchd_working,
"
"              CASE WHEN zwcln_holiday IN ('W', 'B') THEN 1 ELSE 0 END zwchd_workoff_holiday,
"
"              CASE WHEN zwcln_holiday IN ('B') THEN 1 ELSE 0 END zwchd_holiday_off,
"
"              CASE WHEN zwcln_holiday IN ('H', 'B') THEN 1 ELSE 0 END zwchd_holiday,
"
"              CASE WHEN (zwcln_workoff = 'Y' AND zwcln_holiday IN ('W', 'H', 'B')) THEN 1 ELSE 0 END zwchd_all_holiday
"
"         FROM zone_workday_calendar_hd,
"
"              zone_workday_calendar_ln
"
"        WHERE zwchd_bu       = zwcln_bu
"
"          AND zwchd_zone_id  = zwcln_zone_id
"
"          AND zwchd_clndr_no = zwcln_clndr_no
"
"          AND (zwchd_clndr_id = c_clndr_id OR (zwchd_clndr_id IS NULL AND c_clndr_id IS NULL))
"
"          AND zwchd_bu       = p_bu
"
"          AND zwchd_zone_id  = c_zone_id
"
"          AND zwchd_status   = 'A'
"
"          AND TRUNC(zwcln_date) BETWEEN c_start_date AND c_end_date);
"
"
"
"      cr6                    c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_emp_id                VARCHAR2,
"
"            c_leave_type            VARCHAR2,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"
"
"       IS
"
"   SELECT NVL(SUM(lrd_days), 0) leave_days
"
"     FROM employee_leaves,
"
"          leave_request_dtl,
"
"          leaves
"
"    WHERE empleave_bu       = lrd_bu
"
"      AND empleave_doc_no   = lrd_req_no
"
"      AND empleave_bu       = leave_bu
"
"      AND empleave_leave_id = leave_leave_id
"
"      AND empleave_bu       = p_bu
"
"      AND empleave_emp_id   = c_emp_id
"
"      AND empleave_type     = 'L'
"
"      AND empleave_status   = 'P'
"
"      AND ((c_leave_type = 'PAID' AND leave_type IN ('A') AND empleave_prep_payroll = 'N')
"
"       OR  (c_leave_type = 'UNPAID' AND leave_type NOT IN ('A'))
"
"       OR  (c_leave_type = 'VACATION' AND leave_type IN ('A') AND empleave_prep_payroll = 'Y')
"
"       OR  (c_leave_type = 'ONVACATION' AND leave_type IN ('A') AND empleave_prep_payroll = 'P'))
"
"      AND TRUNC(lrd_date) BETWEEN TRUNC(empleave_start_date) AND NVL(TRUNC(empleave_return_date) - 1, TRUNC(empleave_end_date))
"
"      AND TRUNC(lrd_date) BETWEEN c_start_date AND c_end_date;
"
"
"
"      cr7                    c7%ROWTYPE;
"
"
"
"   CURSOR c8(c_emp_id                VARCHAR2,
"
"            c_date_from            DATE,
"
"            c_date_to                DATE)
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
"   CURSOR c9(c_emp_id                VARCHAR2,
"
"            c_elmnt_id                VARCHAR2,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"       IS
"
"   SELECT empleave_leave_id,
"
"          NVL(SUM(lrd_days), 0) leave_days
"
"     FROM employee_leaves,
"
"          leave_request_dtl,
"
"          leaves,
"
"          pyrl_allow_leave_option
"
"    WHERE empleave_bu       = lrd_bu
"
"      AND empleave_doc_no   = lrd_req_no
"
"      AND empleave_bu       = leave_bu
"
"      AND empleave_leave_id = leave_leave_id
"
"      AND leave_bu          = palo_bu
"
"      AND leave_leave_id    = palo_leave_id
"
"      AND empleave_bu       = p_bu
"
"      AND empleave_emp_id   = c_emp_id
"
"      AND palo_elmnt_id     = c_elmnt_id
"
"      AND empleave_type     = 'L'
"
"      AND empleave_status   = 'P'
"
"      AND leave_type        NOT IN ('A')
"
"      AND TRUNC(lrd_date) BETWEEN TRUNC(empleave_start_date) AND NVL(TRUNC(empleave_return_date) - 1, TRUNC(empleave_end_date))
"
"      AND TRUNC(lrd_date) BETWEEN c_start_date AND c_end_date
"
"    GROUP BY empleave_leave_id;
"
"
"
"      cr9                            c9%ROWTYPE;
"
"
"
"   CURSOR c10(c_emp_id                    VARCHAR2,
"
"             c_year                    NUMBER,
"
"             c_period                    NUMBER)
"
"       IS
"
"   SELECT pehd_elmnt_id,
"
"          pehd_desc1,
"
"          pehd_type,
"
"          pehd_acct_type,
"
"          epadj_mode,
"
"          (epadj_rmng_period * epadj_per_amt) epadj_per_amt,
"
"          epadj_adj_no,
"
"          epadj_doc_no,
"
"          epadj_source
"
"     FROM emp_pyrl_adjustments,
"
"          payroll_elements_hd
"
"    WHERE epadj_bu         = pehd_bu
"
"      AND epadj_elmnt_id    = pehd_elmnt_id
"
"      AND epadj_bu         = p_bu
"
"      AND epadj_emp_id         = c_emp_id
"
"      AND epadj_start_year ||TO_CHAR(epadj_start_period, '00') <> c_year||TO_CHAR(c_period, '00')
"
"      AND epadj_is_definite = 'Y'
"
"      AND epadj_rmng_period > 0
"
"      AND epadj_status         = 'P'
"
"    UNION ALL
"
"   SELECT pehd_elmnt_id,
"
"          pehd_desc1,
"
"          pehd_type,
"
"          pehd_acct_type,
"
"          epadj_mode,
"
"          (epadj_rmng_period * epadj_per_amt) epadj_per_amt,
"
"          epadj_adj_no,
"
"          epadj_doc_no,
"
"          epadj_source
"
"     FROM emp_pyrl_adjustments,
"
"          payroll_elements_hd
"
"    WHERE epadj_bu         = pehd_bu
"
"      AND epadj_elmnt_id    = pehd_elmnt_id
"
"      AND epadj_bu         = p_bu
"
"      AND epadj_emp_id         = c_emp_id
"
"      AND epadj_start_year ||TO_CHAR(epadj_start_period, '00') = c_year||TO_CHAR(c_period, '00')
"
"      AND epadj_is_definite = 'Y'
"
"      AND epadj_rmng_period > 0
"
"      AND epadj_status         = 'P'
"
"    UNION ALL
"
"   SELECT pehd_elmnt_id,
"
"          pehd_desc1,
"
"          pehd_type,
"
"          pehd_acct_type,
"
"          epadj_mode,
"
"          epadj_per_amt,
"
"          epadj_adj_no,
"
"          epadj_doc_no,
"
"          epadj_source
"
"     FROM emp_pyrl_adjustments,
"
"          payroll_elements_hd
"
"    WHERE epadj_bu         = pehd_bu
"
"      AND epadj_elmnt_id    = pehd_elmnt_id
"
"      AND epadj_bu         = p_bu
"
"      AND epadj_emp_id         = c_emp_id
"
"      AND epadj_start_year ||TO_CHAR(epadj_start_period, '00') <= c_year||TO_CHAR(c_period, '00')
"
"      AND epadj_is_definite = 'N'
"
"      AND epadj_status         = 'P';
"
"
"
"   CURSOR c11(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT leave_leave_id,
"
"          leave_type,
"
"          emplcb_cur_bal
"
"     FROM leaves,
"
"          emp_leave_cur_bal
"
"    WHERE leave_bu       = emplcb_bu
"
"      AND leave_leave_id = emplcb_leave_id
"
"      AND emplcb_bu      = p_bu
"
"      AND emplcb_emp_id  = c_emp_id
"
"      AND leave_type     = 'A';
"
"
"
"   CURSOR c12(c_emp_id                VARCHAR2,
"
"             c_start_date            DATE,
"
"             c_end_date            DATE)
"
"
"
"/*   -- Hided By : Abdul Ajis / tkt #
"
"       IS
"
"   SELECT leave_leave_id,
"
"          leave_type,
"
"          NVL(SUM(lrd_days), 0) lrd_days,
"
"          MIN(TRUNC(lrd_date)) lrd_date_from,
"
"          MAX(TRUNC(lrd_date)) lrd_date_to
"
"     FROM employee_leaves,
"
"          leave_request_dtl,
"
"          leaves
"
"    WHERE empleave_bu       = lrd_bu
"
"      AND empleave_doc_no   = lrd_req_no
"
"      AND empleave_bu       = leave_bu
"
"      AND empleave_leave_id = leave_leave_id
"
"      AND empleave_bu       = p_bu
"
"      AND empleave_emp_id   = c_emp_id
"
"      AND lrd_doc_type      = 'E'
"
"      AND empleave_type     = 'L'
"
"      AND empleave_status   = 'P'
"
"      AND TRUNC(lrd_date) BETWEEN TRUNC(empleave_start_date) AND NVL(TRUNC(empleave_return_date) - 1, TRUNC(empleave_end_date))
"
"      AND TRUNC(lrd_date) BETWEEN c_start_date AND c_end_date
"
"    GROUP BY leave_leave_id,
"
"             leave_type;
"
"*/
"
"       IS
"
"   SELECT leave_leave_id,
"
"          leave_type,
"
"          NVL(empleave_apprvd_days,0) lrd_days,
"
"          TRUNC(empleave_start_date) lrd_date_from,
"
"          TRUNC(empleave_end_date) lrd_date_to
"
"     FROM employee_leaves,
"
"          leaves
"
"    WHERE empleave_bu       = p_bu
"
"      AND empleave_emp_id   = c_emp_id
"
"      AND empleave_type     = 'L'
"
"      AND empleave_status   = 'P'
"
"      AND leave_bu          = empleave_bu
"
"      AND leave_leave_id    = empleave_leave_id
"
"      AND TRUNC(empleave_start_date) >= c_start_date
"
"      AND TRUNC(empleave_end_date) <= c_end_date;
"
"
"
"
"
"   CURSOR c13(c_emp_id                VARCHAR2,
"
"             c_leave_id            VARCHAR2,
"
"             c_leave_type            VARCHAR2,
"
"             c_start_date            DATE,
"
"             c_end_date            DATE)
"
"
"
"       IS
"
"   SELECT NVL(SUM(lrd_days), 0) lrd_days
"
"     FROM employee_leaves,
"
"          leave_request_dtl,
"
"          leaves
"
"    WHERE empleave_bu       = lrd_bu
"
"      AND empleave_doc_no   = lrd_req_no
"
"      AND empleave_bu       = leave_bu
"
"      AND empleave_leave_id = leave_leave_id
"
"      AND empleave_bu       = p_bu
"
"      AND empleave_emp_id   = c_emp_id
"
"      AND empleave_leave_id = c_leave_id
"
"      AND leave_type        = c_leave_type
"
"      AND lrd_doc_type      = 'E'
"
"      AND empleave_type     = 'L'
"
"      AND empleave_status   = 'P'
"
"      AND TRUNC(lrd_date) BETWEEN TRUNC(empleave_start_date) AND NVL(TRUNC(empleave_return_date) - 1, TRUNC(empleave_end_date))
"
"      AND TRUNC(lrd_date) BETWEEN c_start_date AND c_end_date;
"
"
"
"      cr13                    c13%ROWTYPE;
"
"
"
"   CURSOR c14(c_emp_id                VARCHAR2,
"
"             c_date                DATE)
"
"       IS
"
"   SELECT *
"
"     FROM deposits
"
"    WHERE depst_bu         = p_bu
"
"      AND depst_party_id   = c_emp_id
"
"      AND TRUNC(depst_last_int_accrued_date) = c_date
"
"      AND depst_party_type = 'E'
"
"      AND depst_doc_pfx    = 'ED'
"
"      AND depst_status     = 'P';
"
"
"
"   CURSOR c15
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_deposit_elmnt
"
"    WHERE hede_bu = p_bu;
"
"
"
"      cr15                    c15%ROWTYPE;
"
"
"
"   CURSOR c100
"
"       IS
"
"   SELECT NVL(SUM(DECODE(effln_mode, '+', effln_amount, '-', effln_amount * -1)), 0) effln_amount,
"
"          NVL(SUM(DECODE(effln_mode, '+', effln_amount, 0)), 0) effln_add_amount,
"
"          NVL(SUM(DECODE(effln_mode, '-', effln_amount, 0)), 0) effln_ded_amount
"
"     FROM emp_full_final_ln
"
"    WHERE effln_bu     = p_bu
"
"      AND effln_doc_no = p_doc_no;
"
"
"
"      cr100                    c100%ROWTYPE;
"
"
"
"      v_basic_elmnt                VARCHAR2(10);
"
"      v_basic_elmnt_desc            VARCHAR2(150);
"
"      v_ctrl_rnd_opt                VARCHAR2(1) := 'N';
"
"      v_ctrl_rnd_off                  NUMBER(2) := 0;
"
"      v_ctrl_wrk_calc                  VARCHAR2(5) := 'P';
"
"      v_ctrl_spec_days                NUMBER(5, 2) := 0;
"
"      v_act_days                NUMBER(5, 2) := 0;
"
"      v_start_date                DATE;
"
"      v_end_date                DATE;
"
"      v_emp_days                NUMBER(5, 2) := 0;
"
"      v_wrk_days                NUMBER(5, 2) := 0;
"
"      v_off_days                   NUMBER(5, 2) := 0;
"
"      v_work_off_days                NUMBER(5, 2) := 0;
"
"      v_holidays                   NUMBER(5, 2) := 0;
"
"      v_mon_days                   NUMBER(5, 2) := 0;
"
"      v_actual_basic                NUMBER(15, 3) := 0;
"
"      v_paid_leave_days                   NUMBER(5, 2) := 0;
"
"      v_unpaid_leave_days               NUMBER(5, 2) := 0;
"
"      v_tot_paid_days                   NUMBER(5, 2) := 0;
"
"      v_ln_seq_no                NUMBER(5);
"
"      v_temp_date_from                DATE;
"
"      v_temp_date_to                DATE;
"
"      v_temp_days                NUMBER(5, 2) := 0;
"
"      v_leave_ret_val                NUMBER(15, 3) := 0;
"
"      v_opt_flag                VARCHAR2(1) := 'N';
"
"      v_ret_val                    NUMBER(15, 3) := 0;
"
"      v_act_ret_val                NUMBER(15, 3) := 0;
"
"      v_leave_info_seq_no            NUMBER(5);
"
"      v_leave_det_seq_no            NUMBER(5);
"
"      v_net_salary                NUMBER(15, 3) := 0;
"
"      v_net_rnd_off                NUMBER(15, 3) := 0;
"
"      v_net_rnd                    NUMBER(15, 3) := 0;
"
"      v_emp_leave_availed            NUMBER(7, 2) := 0;
"
"      v_emp_serv_yrs                NUMBER(7, 2) := 0;
"
"      v_emp_grat_amt                NUMBER(15, 3) := 0;
"
"      v_deposit_elmnt_id            VARCHAR2(10);
"
"      v_rnd_off                    NUMBER(5) := 0;
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 03-mar-2022 : Ajis
"
"
"
"
"
"   BEGIN
"
"
"
"      v_rnd_off := NVL(func_find_applctrl_rndoff_dgts(p_bu), 0);
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
"            RAISE_APPLICATION_ERROR(-20985, 'HRM'||p_bu);
"
"         ELSE
"
"            v_ctrl_rnd_opt   := cr0.payctrl_rnd_off_option;
"
"            v_ctrl_rnd_off   := NVL(cr0.payctrl_prep_net_rnd_off, 0);
"
"            v_ctrl_wrk_calc  := cr0.payctrl_work_day_cal_basic;
"
"            v_ctrl_spec_days := NVL(cr0.payctrl_rate, 0);
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
"            v_res := 'N';
"
"
"
"            OPEN c2(cr1.effhd_emp_id);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20821, 'HRM'||p_bu||'~'||cr1.effhd_emp_id);
"
"               ELSE
"
"
"
"              OPEN c3(cr2.emp_pay_basis);
"
"              FETCH c3 INTO cr3;
"
"
"
"                 IF c3%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20050, 'HRM');
"
"                 ELSE
"
"                    v_basic_elmnt      := cr3.pehd_elmnt_id;
"
"                    v_basic_elmnt_desc := cr3.pehd_desc1;
"
"                 END IF;
"
"
"
"              CLOSE c3;
"
"
"
"              IF v_ctrl_wrk_calc = 'S' THEN
"
"                 v_act_days := v_ctrl_spec_days;
"
"              ELSE
"
"                 v_act_days := (TRUNC(cr1.effhd_date_to) - TRUNC(cr1.effhd_date_from)) + 1;
"
"              END IF;
"
"
"
"              DELETE
"
"                FROM emp_full_final_ln
"
"               WHERE effln_bu     = p_bu
"
"                 AND effln_doc_no = p_doc_no;
"
"
"
"              DELETE
"
"                FROM emp_full_final_leave_info
"
"               WHERE effli_bu     = p_bu
"
"                 AND effli_doc_no = p_doc_no;
"
"
"
"              DELETE
"
"                FROM emp_full_final_leave_det
"
"               WHERE effld_bu     = p_bu
"
"                 AND effld_doc_no = p_doc_no;
"
"
"
"              DELETE
"
"                FROM emp_full_final_encash_leave
"
"               WHERE effel_bu     = p_bu
"
"                 AND effel_doc_no = p_doc_no;
"
"
"
"              DELETE
"
"                FROM emp_full_final_bonus_det
"
"               WHERE effbd_bu     = p_bu
"
"                 AND effbd_doc_no = p_doc_no;
"
"
"
"              DELETE
"
"                FROM payroll_cal_off_det
"
"               WHERE pcod_bu     = p_bu
"
"                 AND pcod_year   = cr1.effhd_year
"
"                 AND pcod_period = cr1.effhd_period;
"
"
"
"                  DELETE
"
"                    FROM payroll_prep_zone
"
"                   WHERE ppzo_bu     = p_bu
"
"                     AND ppzo_year   = cr1.effhd_year
"
"                     AND ppzo_period = cr1.effhd_period
"
"                     AND ppzo_emp_id = cr1.effhd_emp_id;
"
"
"
"              OPEN c4(cr2.emp_zone, TRUNC(cr1.effhd_date_from), TRUNC(cr1.effhd_date_to), cr2.emp_clndr_id);
"
"              FETCH c4 INTO cr4;
"
"
"
"                 IF c4%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20552,'HRM'||p_bu||'~'||cr2.emp_zone||'~'||TRUNC(cr1.effhd_date_from)||'~'||TRUNC(cr1.effhd_date_to));
"
"                 ELSE
"
"
"
"                       INSERT INTO payroll_cal_off_det(pcod_bu             ,
"
"                                                       pcod_plnt         ,
"
"                                                       pcod_clndr_id         ,
"
"                                                       pcod_year         ,
"
"                                                       pcod_period         ,
"
"                                                       pcod_start_date         ,
"
"                                                       pcod_end_date         ,
"
"                                                       pcod_zone         ,
"
"                                                       pcod_month         ,
"
"                                                       pcod_working         ,
"
"                                                       pcod_all_holiday     ,
"
"                                                       pcod_off         ,
"
"                                                       pcod_holiday         ,
"
"                                                       pcod_off_holiday     ,
"
"                                                       pcod_cre_by         ,
"
"                                                       pcod_cre_ip_addr     ,        --added 23-jan-2020 : Ajis
"
"                                                       pcod_cre_os_user     ,        --added 23-jan-2020 : Ajis
"
"                                                       pcod_cre_date         ,              --added 23-jan-2020 : Ajis
"
"                                                       pcod_cre_emp_id          )              --added 03-mar-2022 : Ajis
"
"                                                VALUES(p_bu             ,        --pcod_bu
"
"                                                       NULL             ,        --pcod_plnt
"
"                                                       cr2.emp_clndr_id     ,        --pcod_clndr_id
"
"                                                       cr1.effhd_year         ,        --pcod_year
"
"                                                       cr1.effhd_period     ,        --pcod_period
"
"                                                       TRUNC(cr1.effhd_date_from),        --pcod_start_date
"
"                                                       TRUNC(cr1.effhd_date_to) ,        --pcod_end_date
"
"                                                       cr2.emp_zone          ,        --pcod_zone
"
"                                                       cr4.zwchd_month_days     ,        --pcod_month
"
"                                                       cr4.zwchd_work_days     ,        --pcod_working
"
"                                                       cr4.zwchd_all_holiday     ,        --pcod_all_holiday
"
"                                                       cr4.zwchd_holiday_off     ,        --pcod_off
"
"                                                       cr4.zwchd_holiday     ,        --pcod_holiday
"
"                                                       cr4.zwchd_workoff_holiday,        --pcod_off_holiday
"
"                                                       p_user             ,        --pcod_cre_by
"
"                                                       v_ip_addr         ,        --pcod_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                                                       v_os_user         ,        --pcod_cre_os_user        --added 23-jan-2020 : Ajis
"
"                                                       SYSDATE             ,              --pcod_cre_date             --added 23-jan-2020 : Ajis
"
"                                                       v_user_emp_id            );        --pood_cre_emp_id           --added 03-mar-2022 : Ajis
"
"                 END IF;
"
"
"
"              CLOSE c4;
"
"
"
"              IF TRUNC(cr1.effhd_emp_start_date) >= TRUNC(cr1.effhd_date_from) THEN
"
"                 v_start_date := TRUNC(cr1.effhd_emp_start_date);
"
"              ELSE
"
"                 v_start_date := TRUNC(cr1.effhd_date_from);
"
"              END IF;
"
"
"
"              v_end_date := TRUNC(cr1.effhd_emp_relieve_date);
"
"
"
"              v_emp_days := (v_end_date - v_start_date) + 1;
"
"              v_wrk_days := v_emp_days;
"
"
"
"              OPEN c5(cr2.emp_zone, v_start_date, v_end_date, cr2.emp_clndr_id);
"
"              FETCH c5 INTO cr5;
"
"
"
"                 IF c5%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20552,'HRM'||p_bu||'~'||cr1.effhd_emp_id||'~'||cr2.emp_zone||'~'||v_start_date||'~'||v_end_date);
"
"                 ELSE
"
"                    v_work_off_days := cr5.zwchd_workoff;
"
"                    v_holidays      := cr5.zwchd_holiday;
"
"                    v_off_days      := cr5.zwchd_off;
"
"                 END IF;
"
"
"
"              CLOSE c5;
"
"
"
"              v_mon_days     := (TRUNC(cr1.effhd_date_to) - TRUNC(cr1.effhd_date_from)) + 1;
"
"              v_actual_basic := CASE WHEN cr2.emp_pay_basis = 'S' THEN NVL(cr2.empai_basic_sal, 0) ELSE NVL(cr2.empai_per_day_wage, 0) END;
"
"
"
"              OPEN c6(cr2.emp_zone, v_start_date, v_end_date, cr2.emp_clndr_id);
"
"              FETCH c6 INTO cr6;
"
"
"
"                 IF c6%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20552,'HRM'||p_bu||'~'||cr1.effhd_emp_id||'~'||cr2.emp_zone||'~'||v_start_date||'~'||v_end_date);
"
"                 ELSE
"
"
"
"                INSERT INTO payroll_prep_zone(ppzo_bu             ,
"
"                                   ppzo_year             ,
"
"                                   ppzo_period         ,
"
"                                ppzo_emp_id         ,
"
"                                ppzo_group_id         ,
"
"                                ppzo_zone_id         ,
"
"                                ppzo_month_days         ,
"
"                                ppzo_off             ,
"
"                                ppzo_holiday         ,
"
"                                ppzo_off_holiday         ,
"
"                                ppzo_working         ,
"
"                                ppzo_all_holidays         ,
"
"                                ppzo_pyrl_type         ,
"
"                                ppzo_cre_by         ,
"
"                              ppzo_cre_ip_addr         ,        --added 23-jan-2020 : Ajis
"
"                              ppzo_cre_os_user       ,        --added 23-jan-2020 : Ajis
"
"                                ppzo_cre_date         ,        --added 23-jan-2020 : Ajis
"
"                                ppzo_cre_emp_id        )        --added 03-mar-2022 : Ajis
"
"                                    VALUES(p_bu             ,        --ppzo_bu
"
"                                   cr1.effhd_year         ,        --ppzo_year
"
"                                cr1.effhd_period         ,        --ppzo_period
"
"                                cr1.effhd_emp_id         ,        --ppzo_emp_id
"
"                                cr1.effhd_group_id     ,        --ppzo_group_id
"
"                                cr2.emp_zone              ,        --ppzo_zone_id
"
"                                v_wrk_days         ,        --ppzo_month_days
"
"                                cr6.zwchd_holiday_off  ,        --ppzo_off
"
"                              cr6.zwchd_holiday         ,        --ppzo_holiday
"
"                                cr6.zwchd_workoff_holiday,    --ppzo_off_holiday
"
"                                cr6.zwchd_working         ,        --ppzo_working
"
"                                cr6.zwchd_all_holiday  ,        --ppzo_all_holidays
"
"                                'T'             ,        --ppzo_pyrl_type
"
"                                p_user             ,        --ppzo_cre_by
"
"                                v_ip_addr             ,        --ppzo_cre_ip_addr          --added 23-jan-2020 : Ajis
"
"                              v_os_user             ,        --ppzo_cre_os_user          --added 23-jan-2020 : Ajis
"
"                                SYSDATE             ,          --ppzo_cre_date              --added 23-jan-2020 : Ajis
"
"                                v_user_emp_id          );        --ppzo_cre_emp_id          --added 03-mar-2022 : Ajis
"
"
"
"                 END IF;
"
"
"
"              CLOSE c6;
"
"
"
"              OPEN c7(cr1.effhd_emp_id, 'PAID', v_start_date, v_end_date);
"
"              FETCH c7 INTO cr7;
"
"
"
"                 IF c7%NOTFOUND THEN
"
"                    v_paid_leave_days := 0;
"
"                 ELSE
"
"                    v_paid_leave_days := NVL(cr7.leave_days, 0);
"
"                 END IF;
"
"
"
"              CLOSE c7;
"
"
"
"              OPEN c7(cr1.effhd_emp_id, 'UNPAID', v_start_date, v_end_date);
"
"              FETCH c7 INTO cr7;
"
"
"
"                 IF c7%NOTFOUND THEN
"
"                    v_unpaid_leave_days := 0;
"
"                 ELSE
"
"                    v_unpaid_leave_days := NVL(cr7.leave_days, 0);
"
"                 END IF;
"
"
"
"              CLOSE c7;
"
"
"
"              v_tot_paid_days := v_wrk_days - v_unpaid_leave_days;
"
"
"
"              /* Employee Year of service */
"
"
"
"              v_emp_serv_yrs := ROUND(MONTHS_BETWEEN(TRUNC(cr2.emp_end_date), TRUNC(cr2.emp_start_date))/12);
"
"
"
"
"
"          /* Start to Update Employee Gratuity Amount Formula : ((Basic Salary * 15)/26) * v_emp_serv_yrs */
"
"
"
"          IF v_emp_serv_yrs >= 5 AND cr2.emp_gratuity_elig_flag = 'Y' THEN
"
"
"
"             proc_calc_emp_gratuity(p_bu,
"
"                            p_doc_no,
"
"                            cr1.effhd_emp_id,
"
"                            v_actual_basic,
"
"                            v_emp_serv_yrs,
"
"                            TRUNC(cr1.effhd_date_from),
"
"                            TRUNC(cr1.effhd_date_to),
"
"                            cr2.emp_pay_basis,
"
"                            p_user,
"
"                               v_emp_grat_amt);
"
"          ELSE
"
"             v_emp_grat_amt := 0;
"
"          END IF;
"
"
"
"              UPDATE emp_full_final_hd
"
"                 SET effhd_serv_yrs       = v_emp_serv_yrs,
"
"             effhd_graty_serv_yrs = v_emp_serv_yrs,
"
"             effhd_graty_amt      = ROUND(v_emp_grat_amt, v_rnd_off),
"
"             effhd_upd_by          = p_user,
"
"             effhd_upd_ip_addr    = v_ip_addr,                --added 23-jan-2020 : Ajis
"
"             effhd_upd_os_user    = v_os_user,                 --added 23-jan-2020 : Ajis
"
"             effhd_upd_date          = SYSDATE,                --added 23-jan-2020 : Ajis
"
"             effhd_upd_emp_id     = v_user_emp_id                           --added 03-mar-2022 : Ajis
"
"           WHERE effhd_bu     = p_bu
"
"             AND effhd_doc_no = p_doc_no;
"
"
"
"              /* Start to Update Payroll Days details */
"
"
"
"              UPDATE emp_full_final_hd
"
"                 SET effhd_mon_days             = v_mon_days,
"
"                     effhd_off_days      = v_work_off_days,
"
"                     effhd_holidays          = v_holidays,
"
"                     effhd_workin_days       = (v_wrk_days - (v_work_off_days + v_holidays)),
"
"                     effhd_tot_paid_days     = v_tot_paid_days,
"
"                     effhd_paid_leave_days   = v_paid_leave_days,
"
"                     effhd_unpaid_leave_days = v_unpaid_leave_days,
"
"                     effhd_upd_by              = p_user,
"
"             effhd_upd_ip_addr         = v_ip_addr,                --added 23-jan-2020 : Ajis
"
"             effhd_upd_os_user         = v_os_user,                 --added 23-jan-2020 : Ajis
"
"                     effhd_upd_date             = SYSDATE,                --added 23-jan-2020 : Ajis
"
"             effhd_upd_emp_id        = v_user_emp_id                        --added 03-mar-2022 : Ajis
"
"               WHERE effhd_bu     = p_bu
"
"                 AND effhd_doc_no = p_doc_no;
"
"
"
"                  /* End to Update Payroll Days details */
"
"
"
"                  /* Start to Insert Basic Salary Details */
"
"
"
"                  SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                    INTO v_ln_seq_no
"
"                    FROM emp_full_final_ln
"
"                   WHERE effln_bu     = p_bu
"
"                     AND effln_doc_no = p_doc_no;
"
"
"
"
"
"                  INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                        effln_doc_no        ,
"
"                        effln_seq_no        ,
"
"                        effln_elmnt_id        ,
"
"                        effln_mode        ,
"
"                        effln_amount        ,
"
"                        effln_actual_amt    ,
"
"                        effln_adj_no        ,
"
"                        effln_sou_doc_no    ,
"
"                        effln_source        ,
"
"                        effln_sou_doc_seq_no    ,
"
"                        effln_reference        ,
"
"                        effln_cre_by        ,
"
"                        effln_cre_ip_addr    ,                    --added 23-jan-2020 : Ajis
"
"                        effln_cre_os_user    ,                    --added 23-jan-2020 : Ajis
"
"                        effln_cre_date        ,                    --added 23-jan-2020 : Ajis
"
"                        effln_cre_emp_id        )                    --added 03-mar-2022 : Ajis
"
"                     VALUES(p_bu            ,                    --effln_bu
"
"                         p_doc_no        ,                    --effln_doc_no
"
"                         v_ln_seq_no        ,                    --effln_seq_no
"
"                         v_basic_elmnt        ,                    --effln_elmnt_id
"
"                         '+'            ,                    --effln_mode
"
"                         ROUND((v_actual_basic/v_act_days) * (v_wrk_days) , v_rnd_off),
"
"                        ----old ROUND((v_actual_basic/v_act_days) * (v_wrk_days -v_work_off_days) , v_rnd_off),    --effln_amount
"
"                         v_actual_basic        ,                    --effln_actual_amt
"
"                         NULL            ,                    --effln_adj_no
"
"                         NULL            ,                    --effln_sou_doc_no
"
"                         NULL            ,                    --effln_source
"
"                         NULL            ,                    --effln_sou_doc_seq_no
"
"                         v_basic_elmnt_desc||' FOR '||v_wrk_days||' DAY(S).',        --effln_reference
"
"                         p_user            ,                    --effln_cre_by
"
"                         v_ip_addr        ,                    --effln_cre_ip_addr
"
"                        v_os_user        ,                    --effln_cre_os_user
"
"                         SYSDATE            ,                    --effln_cre_date
"
"                         v_user_emp_id           );                    --effln_cre_emp_id
"
"
"
"                  /* Basic Salary deduction for unpaid days */
"
"
"
"                  IF v_unpaid_leave_days > 0 THEN
"
"
"
"                     SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                       INTO v_ln_seq_no
"
"                       FROM emp_full_final_ln
"
"                      WHERE effln_bu     = p_bu
"
"                        AND effln_doc_no = p_doc_no;
"
"
"
"                     INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                           effln_doc_no        ,
"
"                           effln_seq_no        ,
"
"                           effln_elmnt_id    ,
"
"                           effln_mode        ,
"
"                           effln_amount        ,
"
"                           effln_actual_amt    ,
"
"                           effln_adj_no        ,
"
"                           effln_sou_doc_no    ,
"
"                           effln_source        ,
"
"                           effln_sou_doc_seq_no    ,
"
"                           effln_reference    ,
"
"                           effln_cre_by        ,
"
"                           effln_cre_ip_addr    ,                        --added 23-jan-2020 : Ajis
"
"                           effln_cre_os_user    ,                        --added 23-jan-2020 : Ajis
"
"                           effln_cre_date    ,                        --added 23-jan-2020 : Ajis
"
"                           effln_cre_emp_id     )                            --added 03-mar-2022 : Ajis
"
"                        VALUES(p_bu            ,                        --effln_bu
"
"                            p_doc_no        ,                        --effln_doc_no
"
"                            v_ln_seq_no        ,                        --effln_seq_no
"
"                            v_basic_elmnt    ,                        --effln_elmnt_id
"
"                            '-'            ,                        --effln_mode
"
"                            ROUND((v_actual_basic/v_act_days) * v_unpaid_leave_days, v_rnd_off),    --effln_amount
"
"                            v_actual_basic    ,                        --effln_actual_amt
"
"                            NULL            ,                        --effln_adj_no
"
"                            NULL            ,                        --effln_sou_doc_no
"
"                            NULL            ,                        --effln_source
"
"                            NULL            ,                        --effln_sou_doc_seq_no
"
"                            v_basic_elmnt_desc||' FOR '||v_unpaid_leave_days||' DAY(S).',    --effln_reference
"
"                            p_user        ,                        --effln_cre_by
"
"                            v_ip_addr        ,                        --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                           v_os_user        ,                        --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                            SYSDATE        ,                                --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                            v_user_emp_id        );                            --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                  END IF;
"
"
"
"                  /* End to Insert Basic Salary Details */
"
"
"
"                  FOR cr8 IN c8(cr1.effhd_emp_id, v_start_date, v_end_date)
"
"                  LOOP
"
"
"
"                     IF cr8.pehd_type IN ('FL') THEN
"
"
"
"                        IF TRUNC(cr8.epa_start_date) > TRUNC(v_start_date) THEN
"
"                           v_temp_date_from := TRUNC(cr8.epa_start_date);
"
"                        ELSE
"
"                           v_temp_date_from := TRUNC(v_start_date);
"
"                        END IF;
"
"
"
"                        IF NVL(TRUNC(cr8.epa_end_date), TRUNC(v_end_date)) > TRUNC(v_end_date) THEN
"
"                           v_temp_date_to := TRUNC(v_end_date);
"
"                        ELSE
"
"                           v_temp_date_to := NVL(TRUNC(cr8.epa_end_date), TRUNC(v_end_date));
"
"                        END IF;
"
"
"
"                        v_temp_days := (v_temp_date_to - v_temp_date_from) + 1;
"
"
"
"                        v_act_ret_val := NVL((cr8.epa_per_amt/v_act_days) * v_temp_days, 0);
"
"
"
"                        SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                          INTO v_ln_seq_no
"
"                          FROM emp_full_final_ln
"
"                         WHERE effln_bu     = p_bu
"
"                           AND effln_doc_no = p_doc_no;
"
"
"
"                        INSERT INTO emp_full_final_ln(effln_bu            ,
"
"                              effln_doc_no        ,
"
"                              effln_seq_no        ,
"
"                              effln_elmnt_id        ,
"
"                              effln_mode        ,
"
"                              effln_amount        ,
"
"                              effln_actual_amt        ,
"
"                              effln_adj_no        ,
"
"                              effln_sou_doc_no        ,
"
"                              effln_source        ,
"
"                              effln_sou_doc_seq_no    ,
"
"                              effln_reference        ,
"
"                              effln_cre_by        ,
"
"                              effln_cre_ip_addr        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_os_user        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_emp_id          )                --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu            ,                --effln_bu
"
"                               p_doc_no            ,                --effln_doc_no
"
"                               v_ln_seq_no        ,                --effln_seq_no
"
"                               cr8.pehd_elmnt_id        ,                --effln_elmnt_id
"
"                               '+'            ,                --effln_mode
"
"                               ROUND(v_act_ret_val, v_rnd_off),                --effln_amount
"
"                               cr8.epa_per_amt        ,                --effln_actual_amt
"
"                               NULL            ,                --effln_adj_no
"
"                               NULL            ,                --effln_sou_doc_no
"
"                               NULL            ,                --effln_source
"
"                               NULL            ,                --effln_sou_doc_seq_no
"
"                               cr8.pehd_desc1||' FOR '||v_temp_days||' DAY(S).',        --effln_reference
"
"                               p_user            ,                --effln_cre_by
"
"                               v_ip_addr                ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                              v_os_user            ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                               SYSDATE                ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                               v_user_emp_id             );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                OPEN c9(cr1.effhd_emp_id, cr8.pehd_elmnt_id, v_start_date, v_end_date);
"
"                FETCH c9 INTO cr9;
"
"
"
"                   IF c9%FOUND THEN
"
"
"
"                      IF cr9.leave_days > 0 THEN
"
"
"
"                         v_leave_ret_val := NVL((cr8.epa_per_amt/v_act_days) * cr9.leave_days, 0);
"
"
"
"                             SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                                 INTO v_ln_seq_no
"
"                                 FROM emp_full_final_ln
"
"                               WHERE effln_bu     = p_bu
"
"                                   AND effln_doc_no = p_doc_no;
"
"
"
"                             INSERT INTO emp_full_final_ln(effln_bu            ,
"
"                                         effln_doc_no        ,
"
"                                       effln_seq_no        ,
"
"                                       effln_elmnt_id        ,
"
"                                       effln_mode        ,
"
"                                       effln_amount        ,
"
"                                       effln_actual_amt        ,
"
"                                       effln_adj_no        ,
"
"                                       effln_sou_doc_no        ,
"
"                                       effln_source        ,
"
"                                       effln_sou_doc_seq_no    ,
"
"                                       effln_reference        ,
"
"                                       effln_cre_by        ,
"
"                                         effln_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                                         effln_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                                       effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                                       effln_cre_emp_id         )                --added 03-mar-2022 : Ajis
"
"                                VALUES(p_bu            ,                --effln_bu
"
"                                   p_doc_no            ,                --effln_doc_no
"
"                                   v_ln_seq_no        ,                --effln_seq_no
"
"                                   cr8.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                                   '-'            ,                --effln_mode
"
"                                   ROUND(v_leave_ret_val, v_rnd_off),            --effln_amount
"
"                                   0            ,                --effln_actual_amt
"
"                                   NULL            ,                --effln_adj_no
"
"                                   NULL            ,                --effln_sou_doc_no
"
"                                   NULL            ,                --effln_source
"
"                                   NULL            ,                --effln_sou_doc_seq_no
"
"                                   cr8.pehd_desc1||' FOR '||cr9.leave_days||' DAY(S).',    --effln_reference
"
"                                   p_user            ,                --effln_cre_by
"
"                                          v_ip_addr        ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                                         v_os_user        ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                        SYSDATE                ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                                        v_user_emp_id            );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                      END IF;
"
"
"
"                   END IF;
"
"
"
"                CLOSE c9;
"
"
"
"                     END IF;
"
"
"
"                     IF cr8.pehd_type IN ('VL', 'CL') THEN
"
"
"
"                proc_calc_pay_elements(p_bu,
"
"                           'N',
"
"                           TRUNC(cr1.effhd_date_from),
"
"                           TRUNC(cr1.effhd_date_to),
"
"                           cr8.pehd_elmnt_id,
"
"                           v_opt_flag,
"
"                           cr1.effhd_emp_id,
"
"                           '+',
"
"                           v_ret_val,
"
"                           v_act_ret_val,
"
"                                       cr2.emp_pay_basis);
"
"
"
"                        SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                          INTO v_ln_seq_no
"
"                          FROM emp_full_final_ln
"
"                         WHERE effln_bu     = p_bu
"
"                           AND effln_doc_no = p_doc_no;
"
"
"
"                        INSERT INTO emp_full_final_ln(effln_bu            ,
"
"                              effln_doc_no        ,
"
"                              effln_seq_no        ,
"
"                              effln_elmnt_id        ,
"
"                              effln_mode        ,
"
"                              effln_amount        ,
"
"                              effln_actual_amt        ,
"
"                              effln_adj_no        ,
"
"                              effln_sou_doc_no        ,
"
"                              effln_source        ,
"
"                              effln_sou_doc_seq_no    ,
"
"                              effln_reference        ,
"
"                              effln_cre_by        ,
"
"                              effln_cre_ip_addr        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_os_user        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_emp_id          )                --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu            ,                --effln_bu
"
"                               p_doc_no            ,                --effln_doc_no
"
"                               v_ln_seq_no        ,                --effln_seq_no
"
"                               cr8.pehd_elmnt_id        ,                --effln_elmnt_id
"
"                               '+'            ,                --effln_mode
"
"                               ROUND(v_ret_val, v_rnd_off),                --effln_amount
"
"                               v_act_ret_val        ,                --effln_actual_amt
"
"                               NULL            ,                --effln_adj_no
"
"                               NULL            ,                --effln_sou_doc_no
"
"                               NULL            ,                --effln_source
"
"                               NULL            ,                --effln_sou_doc_seq_no
"
"                               cr8.pehd_desc1||' FOR '||v_wrk_days||' DAY(S).',        --effln_reference
"
"                               p_user            ,                --effln_cre_by
"
"                               v_ip_addr            ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                              v_os_user            ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                               SYSDATE                ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                               v_user_emp_id             );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                OPEN c9(cr1.effhd_emp_id, cr8.pehd_elmnt_id, v_start_date, v_end_date);
"
"                FETCH c9 INTO cr9;
"
"
"
"                   IF c9%FOUND THEN
"
"
"
"                      IF cr9.leave_days > 0 THEN
"
"
"
"                         v_leave_ret_val := NVL((v_act_ret_val/v_tot_paid_days) * cr9.leave_days, 0);
"
"
"
"                             SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                                 INTO v_ln_seq_no
"
"                                 FROM emp_full_final_ln
"
"                               WHERE effln_bu     = p_bu
"
"                                   AND effln_doc_no = p_doc_no;
"
"
"
"                             INSERT INTO emp_full_final_ln(effln_bu            ,
"
"                                         effln_doc_no        ,
"
"                                       effln_seq_no        ,
"
"                                       effln_elmnt_id        ,
"
"                                       effln_mode        ,
"
"                                       effln_amount        ,
"
"                                       effln_actual_amt        ,
"
"                                       effln_adj_no        ,
"
"                                       effln_sou_doc_no        ,
"
"                                       effln_source        ,
"
"                                       effln_sou_doc_seq_no    ,
"
"                                       effln_reference        ,
"
"                                       effln_cre_by        ,
"
"                                         effln_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                                         effln_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                                       effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                                       effln_cre_emp_id         )                --added 03-mar-2022 : Ajis
"
"                                VALUES(p_bu            ,                --effln_bu
"
"                                   p_doc_no            ,                --effln_doc_no
"
"                                   v_ln_seq_no        ,                --effln_seq_no
"
"                                   cr8.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                                   '-'            ,                --effln_mode
"
"                                   ROUND(v_leave_ret_val, v_rnd_off),            --effln_amount
"
"                                   0            ,                --effln_actual_amt
"
"                                   NULL            ,                --effln_adj_no
"
"                                   NULL            ,                --effln_sou_doc_no
"
"                                   NULL            ,                --effln_source
"
"                                   NULL            ,                --effln_sou_doc_seq_no
"
"                                   cr8.pehd_desc1||' FOR '||cr9.leave_days||' DAY(S).',    --effln_reference
"
"                                   p_user            ,                --effln_cre_by
"
"                                          v_ip_addr        ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                                         v_os_user        ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                        SYSDATE                ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                                        v_user_emp_id            );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                      END IF;
"
"
"
"                   END IF;
"
"
"
"                CLOSE c9;
"
"
"
"                     END IF;
"
"
"
"                  END LOOP c8;
"
"
"
"                  /* End to Insert Employee Allowances Details */
"
"
"
"                  /* Start to Insert Employee Adjustment details */
"
"
"
"                  FOR cr10 IN c10(cr1.effhd_emp_id, cr1.effhd_year, cr1.effhd_period)
"
"                  LOOP
"
"
"
"                     IF cr10.pehd_type IN ('FA') THEN
"
"
"
"                        SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                          INTO v_ln_seq_no
"
"                          FROM emp_full_final_ln
"
"                         WHERE effln_bu     = p_bu
"
"                           AND effln_doc_no = p_doc_no;
"
"
"
"                        INSERT INTO emp_full_final_ln(effln_bu            ,
"
"                              effln_doc_no        ,
"
"                              effln_seq_no        ,
"
"                              effln_elmnt_id        ,
"
"                              effln_mode        ,
"
"                              effln_amount        ,
"
"                              effln_actual_amt        ,
"
"                              effln_adj_no        ,
"
"                              effln_sou_doc_no        ,
"
"                              effln_source        ,
"
"                              effln_sou_doc_seq_no    ,
"
"                              effln_reference        ,
"
"                              effln_cre_by        ,
"
"                              effln_cre_ip_addr        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_os_user        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_emp_id          )                --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu            ,                --effln_bu
"
"                               p_doc_no            ,                --effln_doc_no
"
"                               v_ln_seq_no        ,                --effln_seq_no
"
"                               cr10.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                               cr10.epadj_mode        ,                --effln_mode
"
"                               cr10.epadj_per_amt    ,                --effln_amount
"
"                               0                ,                --effln_actual_amt
"
"                               cr10.epadj_adj_no        ,                --effln_adj_no
"
"                               cr10.epadj_doc_no        ,                --effln_sou_doc_no
"
"                               cr10.epadj_source        ,                --effln_source
"
"                               NULL            ,                --effln_sou_doc_seq_no
"
"                               cr10.pehd_desc1        ,    --||' FOR '||v_wrk_days||' DAY(S).',        --effln_reference
"
"                               p_user            ,                --effln_cre_by
"
"                               v_ip_addr            ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                              v_os_user            ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                               SYSDATE                ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                               v_user_emp_id             );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                     END IF;
"
"
"
"                     IF cr10.pehd_type IN ('VA', '3RD', 'TDE', 'CA') AND cr10.pehd_acct_type NOT IN ('L') THEN
"
"
"
"                        proc_calc_pay_elements(p_bu,
"
"                                        'N',
"
"                                        TRUNC(cr1.effhd_date_from),
"
"                                        TRUNC(cr1.effhd_date_to),
"
"                                        --TRUNC(cr1.effhd_emp_relieve_date),
"
"                                        cr10.pehd_elmnt_id,
"
"                                        v_opt_flag,
"
"                                        cr1.effhd_emp_id,
"
"                                        cr10.epadj_mode,
"
"                                        v_ret_val,
"
"                                        v_act_ret_val,
"
"                                       cr2.emp_pay_basis);
"
"
"
"                        SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                          INTO v_ln_seq_no
"
"                          FROM emp_full_final_ln
"
"                         WHERE effln_bu     = p_bu
"
"                           AND effln_doc_no = p_doc_no;
"
"
"
"                        INSERT INTO emp_full_final_ln(effln_bu            ,
"
"                              effln_doc_no        ,
"
"                              effln_seq_no        ,
"
"                              effln_elmnt_id        ,
"
"                              effln_mode        ,
"
"                              effln_amount        ,
"
"                              effln_actual_amt        ,
"
"                              effln_adj_no        ,
"
"                              effln_sou_doc_no        ,
"
"                              effln_source        ,
"
"                              effln_sou_doc_seq_no    ,
"
"                              effln_reference        ,
"
"                              effln_cre_by        ,
"
"                              effln_cre_ip_addr        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_os_user        ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                              effln_cre_emp_id          )                --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu            ,                --effln_bu
"
"                               p_doc_no            ,                --effln_doc_no
"
"                               v_ln_seq_no        ,                --effln_seq_no
"
"                               cr10.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                               cr10.epadj_mode        ,                --effln_mode
"
"                               ROUND(v_ret_val, v_rnd_off),                --effln_amount
"
"                               v_act_ret_val        ,                --effln_actual_amt
"
"                               cr10.epadj_adj_no        ,                --effln_adj_no
"
"                               cr10.epadj_doc_no        ,                --effln_sou_doc_no
"
"                               cr10.epadj_source        ,                --effln_source
"
"                               NULL            ,                --effln_sou_doc_seq_no
"
"                               cr10.pehd_desc1||' FOR '||v_wrk_days||' DAY(S).',        --effln_reference
"
"                               p_user            ,                --effln_cre_by
"
"                               v_ip_addr            ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                              v_os_user            ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                               SYSDATE                ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                               v_user_emp_id             );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"             END IF;
"
"
"
"             /* Start to insert PF Details Monthly */
"
"
"
"             IF cr10.pehd_type IN ('CA', 'CA3') AND cr2.emp_pf_elgbl_flag = 'Y' AND cr10.pehd_acct_type IN ('L') THEN
"
"
"
"                        proc_calc_pay_elements(p_bu,
"
"                                        'N',
"
"                                        TRUNC(cr1.effhd_date_from),
"
"                                        TRUNC(cr1.effhd_date_to),
"
"                                        cr10.pehd_elmnt_id,
"
"                                        v_opt_flag,
"
"                                        cr1.effhd_emp_id,
"
"                                        cr10.epadj_mode,
"
"                                        v_ret_val,
"
"                                        v_act_ret_val,
"
"                                       cr2.emp_pay_basis,
"
"                                       cr10.epadj_adj_no);
"
"
"
"                IF v_ret_val > 0 THEN
"
"
"
"                           SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                             INTO v_ln_seq_no
"
"                             FROM emp_full_final_ln
"
"                            WHERE effln_bu     = p_bu
"
"                              AND effln_doc_no = p_doc_no;
"
"
"
"                           INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                                 effln_doc_no        ,
"
"                                 effln_seq_no        ,
"
"                                 effln_elmnt_id        ,
"
"                                 effln_mode        ,
"
"                                 effln_amount        ,
"
"                                 effln_actual_amt    ,
"
"                                 effln_adj_no        ,
"
"                                 effln_sou_doc_no    ,
"
"                                 effln_source        ,
"
"                                 effln_sou_doc_seq_no    ,
"
"                                 effln_reference    ,
"
"                                 effln_cre_by        ,
"
"                                   effln_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                                   effln_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                                 effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                                 effln_cre_emp_id       )                --added 03-mar-2022 : Ajis
"
"                              VALUES(p_bu            ,                --effln_bu
"
"                                  p_doc_no        ,                --effln_doc_no
"
"                                  v_ln_seq_no        ,                --effln_seq_no
"
"                                  cr10.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                                  cr10.epadj_mode    ,                --effln_mode
"
"                                  ROUND(v_ret_val)    ,                --effln_amount
"
"                                  ROUND(v_act_ret_val)    ,                --effln_actual_amt
"
"                                  cr10.epadj_adj_no    ,                --effln_adj_no
"
"                                  cr10.epadj_doc_no    ,                --effln_sou_doc_no
"
"                                  cr10.epadj_source    ,                --effln_source
"
"                                  NULL            ,                --effln_sou_doc_seq_no
"
"                                  cr10.pehd_desc1||' FOR '||v_wrk_days||' DAY(S).',    --effln_reference
"
"                                  p_user            ,                --effln_cre_by
"
"                                    v_ip_addr        ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                                   v_os_user        ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                  SYSDATE        ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                                  v_user_emp_id          );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"
"
"                   IF cr10.pehd_type IN ('CA3') THEN
"
"
"
"                              SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                                INTO v_ln_seq_no
"
"                                FROM emp_full_final_ln
"
"                               WHERE effln_bu     = p_bu
"
"                                 AND effln_doc_no = p_doc_no;
"
"
"
"                              INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                                    effln_doc_no    ,
"
"                                    effln_seq_no    ,
"
"                                    effln_elmnt_id    ,
"
"                                    effln_mode        ,
"
"                                    effln_amount    ,
"
"                                    effln_actual_amt    ,
"
"                                    effln_adj_no    ,
"
"                                    effln_sou_doc_no    ,
"
"                                    effln_source    ,
"
"                                    effln_sou_doc_seq_no,
"
"                                    effln_reference    ,
"
"                                    effln_cre_by    ,
"
"                                      effln_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                                      effln_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                                    effln_cre_date    ,                --added 23-jan-2020 : Ajis
"
"                                    effln_cre_emp_id    )                --added 03-mar-2022 : Ajis
"
"                                 VALUES(p_bu        ,                --effln_bu
"
"                                     p_doc_no        ,                --effln_doc_no
"
"                                     v_ln_seq_no        ,                --effln_seq_no
"
"                                     cr10.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                                     DECODE(cr10.epadj_mode, '+', '-', '-', '+'),    --effln_mode
"
"                                     ROUND(v_ret_val)    ,                --effln_amount
"
"                                     ROUND(v_act_ret_val),                --effln_actual_amt
"
"                                     cr10.epadj_adj_no    ,                --effln_adj_no
"
"                                     cr10.epadj_doc_no    ,                --effln_sou_doc_no
"
"                                     cr10.epadj_source    ,                --effln_source
"
"                                     NULL        ,                --effln_sou_doc_seq_no
"
"                                     cr10.pehd_desc1||' FOR '||v_wrk_days||' DAY(S).',    --effln_reference
"
"                                     p_user        ,                --effln_cre_by
"
"                                       v_ip_addr        ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                                      v_os_user        ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                     SYSDATE        ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                                     v_user_emp_id       );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                   END IF;
"
"
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             /* End to insert PF Details Monthly */
"
"
"
"             /* Start to insert ESI Details Monthly */
"
"
"
"             IF cr10.pehd_type IN ('RCA', 'RC3') AND cr2.emp_esi_elgbl_flag = 'Y' AND cr10.pehd_acct_type IN ('L') THEN
"
"
"
"                        proc_calc_pay_elements(p_bu,
"
"                                        'N',
"
"                                        TRUNC(cr1.effhd_date_from),
"
"                                        TRUNC(cr1.effhd_date_to),
"
"                                        cr10.pehd_elmnt_id,
"
"                                        v_opt_flag,
"
"                                        cr1.effhd_emp_id,
"
"                                        cr10.epadj_mode,
"
"                                        v_ret_val,
"
"                                        v_act_ret_val,
"
"                                       cr2.emp_pay_basis,
"
"                                       cr10.epadj_adj_no);
"
"
"
"            IF v_ret_val > 0 THEN
"
"
"
"                           SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                             INTO v_ln_seq_no
"
"                             FROM emp_full_final_ln
"
"                            WHERE effln_bu     = p_bu
"
"                              AND effln_doc_no = p_doc_no;
"
"
"
"                           INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                                 effln_doc_no        ,
"
"                                 effln_seq_no        ,
"
"                                 effln_elmnt_id        ,
"
"                                 effln_mode        ,
"
"                                 effln_amount        ,
"
"                                 effln_actual_amt    ,
"
"                                 effln_adj_no        ,
"
"                                 effln_sou_doc_no    ,
"
"                                 effln_source        ,
"
"                                 effln_sou_doc_seq_no    ,
"
"                                 effln_reference    ,
"
"                                 effln_cre_by        ,
"
"                                   effln_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                                   effln_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                                 effln_cre_date            ,                --added 23-jan-2020 : Ajis
"
"                                 effln_cre_emp_id       )                --added 03-mar-2022 : Ajis
"
"                              VALUES(p_bu            ,                --effln_bu
"
"                                  p_doc_no        ,                --effln_doc_no
"
"                                  v_ln_seq_no        ,                --effln_seq_no
"
"                                  cr10.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                                  cr10.epadj_mode    ,                --effln_mode
"
"                                  CEIL(v_ret_val)    ,                --effln_amount
"
"                                  CEIL(v_act_ret_val)    ,                --effln_actual_amt
"
"                                  cr10.epadj_adj_no    ,                --effln_adj_no
"
"                                  cr10.epadj_doc_no    ,                --effln_sou_doc_no
"
"                                  cr10.epadj_source    ,                --effln_source
"
"                                  NULL            ,                --effln_sou_doc_seq_no
"
"                                  cr10.pehd_desc1||' FOR '||v_wrk_days||' DAY(S).',    --effln_reference
"
"                                  p_user            ,                --effln_cre_by
"
"                                    v_ip_addr        ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                                   v_os_user        ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                  SYSDATE        ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                                  v_user_emp_id          );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                   IF cr10.pehd_type IN ('RC3') THEN
"
"
"
"                              SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                                INTO v_ln_seq_no
"
"                                FROM emp_full_final_ln
"
"                               WHERE effln_bu     = p_bu
"
"                                 AND effln_doc_no = p_doc_no;
"
"
"
"                              INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                                    effln_doc_no    ,
"
"                                    effln_seq_no    ,
"
"                                    effln_elmnt_id    ,
"
"                                    effln_mode        ,
"
"                                    effln_amount    ,
"
"                                    effln_actual_amt    ,
"
"                                    effln_adj_no    ,
"
"                                    effln_sou_doc_no    ,
"
"                                    effln_source    ,
"
"                                    effln_sou_doc_seq_no,
"
"                                    effln_reference    ,
"
"                                    effln_cre_by    ,
"
"                                      effln_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                                      effln_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                                    effln_cre_date    ,                --added 23-jan-2020 : Ajis
"
"                                    effln_cre_emp_id    )                --added 03-mar-2022 : Ajis
"
"                                 VALUES(p_bu        ,                --effln_bu
"
"                                     p_doc_no        ,                --effln_doc_no
"
"                                     v_ln_seq_no        ,                --effln_seq_no
"
"                                     cr10.pehd_elmnt_id    ,                --effln_elmnt_id
"
"                                     DECODE(cr10.epadj_mode, '+', '-', '-', '+'),    --effln_mode
"
"                                     CEIL(v_ret_val)    ,                --effln_amount
"
"                                     CEIL(v_act_ret_val)    ,                --effln_actual_amt
"
"                                     cr10.epadj_adj_no    ,                --effln_adj_no
"
"                                     cr10.epadj_doc_no    ,                --effln_sou_doc_no
"
"                                     cr10.epadj_source    ,                --effln_source
"
"                                     NULL        ,                --effln_sou_doc_seq_no
"
"                                     cr10.pehd_desc1||' FOR '||v_wrk_days||' DAY(S).',    --effln_reference
"
"                                     p_user        ,                --effln_cre_by
"
"                                       v_ip_addr        ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                                      v_os_user        ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                     SYSDATE        ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                                     v_user_emp_id       );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                   END IF;
"
"
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             /* End to insert ESI Details Monthly */
"
"
"
"                  END LOOP c10;
"
"
"
"                  /* End to Insert Employee Adjustment details */
"
"
"
"                  /* Start to Insert Employee Deposit Amount */
"
"
"
"                  FOR cr14 IN c14(cr1.effhd_emp_id, TRUNC(cr1.effhd_emp_relieve_date))
"
"                  LOOP
"
"
"
"             OPEN c15;
"
"             FETCH c15 INTO cr15;
"
"
"
"                IF c15%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20108, 'HRM'||'~'||p_bu);
"
"                ELSE
"
"
"
"                   IF cr15.hede_deposit_elmnt IS NULL THEN
"
"                      RAISE_APPLICATION_ERROR(-20109, 'HRM'||'~'||p_bu);
"
"                   ELSE
"
"                      v_deposit_elmnt_id := cr15.hede_deposit_elmnt;
"
"                   END IF;
"
"
"
"                END IF;
"
"
"
"             CLOSE c15;
"
"
"
"             SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"               INTO v_ln_seq_no
"
"               FROM emp_full_final_ln
"
"              WHERE effln_bu     = p_bu
"
"                AND effln_doc_no = p_doc_no;
"
"
"
"             INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                               effln_doc_no        ,
"
"                                 effln_seq_no        ,
"
"                                 effln_elmnt_id    ,
"
"                                 effln_mode        ,
"
"                                 effln_amount        ,
"
"                                 effln_actual_amt    ,
"
"                                 effln_adj_no        ,
"
"                                 effln_sou_doc_no    ,
"
"                                 effln_source        ,
"
"                                 effln_sou_doc_seq_no    ,
"
"                                 effln_reference    ,
"
"                                 effln_cre_by        ,
"
"                           effln_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                           effln_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                           effln_cre_date    ,                --added 23-jan-2020 : Ajis
"
"                           effln_cre_emp_id     )                --added 03-mar-2022 : Ajis
"
"                               VALUES(p_bu            ,                --effln_bu
"
"                               p_doc_no        ,                --effln_doc_no
"
"                                 v_ln_seq_no        ,                --effln_seq_no
"
"                                 v_deposit_elmnt_id    ,                --effln_elmnt_id
"
"                                 '+'            ,                --effln_mode
"
"                                 cr14.depst_cumm_amt    ,                --effln_amount
"
"                                 0            ,                --effln_actual_amt
"
"                                 NULL            ,                --effln_adj_no
"
"                                 cr14.depst_doc_no    ,                --effln_sou_doc_no
"
"                                 'DEP'        ,                --effln_source
"
"                                 NULL            ,                --effln_sou_doc_seq_no
"
"                                 'EMPLOYEE DEPOSIT AMOUNT CLAIM.',            --effln_reference
"
"                                 p_user        ,                --effln_cre_by
"
"                            v_ip_addr        ,                --effln_cre_ip_addr     --added 23-jan-2020 : Ajis
"
"                           v_os_user        ,                --effln_cre_os_user    --added 23-jan-2020 : Ajis
"
"                            SYSDATE        ,                    --effln_cre_date    --added 23-jan-2020 : Ajis
"
"                            v_user_emp_id        );                    --effln_cre_emp_id    --added 03-mar-2022 : Ajis
"
"
"
"                  END LOOP c14;
"
"
"
"                  /* End to Insert Employee Deposit Amount */
"
"
"
"                  /* Start to Insert Leave balance */
"
"
"
"                  FOR cr11 IN c11(cr1.effhd_emp_id)
"
"                  LOOP
"
"
"
"                     OPEN c13(cr1.effhd_emp_id, cr11.leave_leave_id, cr11.leave_type, v_start_date, v_end_date);
"
"                     FETCH c13 INTO cr13;
"
"
"
"                        IF c13%NOTFOUND THEN
"
"                           v_emp_leave_availed := 0;
"
"                        ELSE
"
"                           v_emp_leave_availed := NVL(cr13.lrd_days, 0);
"
"                        END IF;
"
"
"
"                     CLOSE c13;
"
"
"
"                     SELECT NVL(MAX(effli_seq_no), 0) + 1
"
"                       INTO v_leave_info_seq_no
"
"                       FROM emp_full_final_leave_info
"
"                      WHERE effli_bu     = p_bu
"
"                        AND effli_doc_no = p_doc_no;
"
"
"
"                     INSERT INTO emp_full_final_leave_info(effli_bu             ,
"
"                               effli_doc_no           ,
"
"                               effli_seq_no           ,
"
"                               effli_leave_id         ,
"
"                               effli_leave_cat        ,
"
"                               effli_leave_availed    ,
"
"                               effli_leave_bal        ,
"
"                               effli_cre_by           ,
"
"                               effli_cre_ip_addr    ,        --added 23-jan-2020 : Ajis
"
"                               effli_cre_os_user    ,        --added 23-jan-2020 : Ajis
"
"                               effli_cre_date         ,               --added 23-jan-2020 : Ajis
"
"                               effli_cre_emp_id     )               --added 03-mar-2022 : Ajis
"
"                            VALUES(p_bu              ,        --effli_bu
"
"                                   p_doc_no        ,        --effli_doc_no
"
"                                   v_leave_info_seq_no    ,        --effli_seq_no
"
"                                   cr11.leave_leave_id    ,        --effli_leave_id
"
"                                   cr11.leave_type    ,        --effli_leave_cat
"
"                                   v_emp_leave_availed    ,        --effli_leave_availed
"
"                                   cr11.emplcb_cur_bal    ,        --effli_leave_bal
"
"                                   p_user        ,        --effli_cre_by
"
"                               v_ip_addr        ,        --effli_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                               v_os_user        ,        --effli_cre_os_user        --added 23-jan-2020 : Ajis
"
"                                   SYSDATE        ,        --effli_cre_date                --added 23-jan-2020 : Ajis
"
"                                   v_user_emp_id        );              --effli_cre_emp_id              --added 03-mar-2022 : Ajis
"
"
"
"                  END LOOP c11;
"
"
"
"                  /* End to Insert Leave balance */
"
"
"
"                  /* Start to Insert Leave availed days */
"
"
"
"                  FOR cr12 IN c12(cr1.effhd_emp_id, v_start_date, v_end_date)
"
"                  LOOP
"
"
"
"                     SELECT NVL(MAX(effld_seq_no), 0) + 1
"
"                       INTO v_leave_det_seq_no
"
"                       FROM emp_full_final_leave_det
"
"                      WHERE effld_bu     = p_bu
"
"                        AND effld_doc_no = p_doc_no;
"
"
"
"                     INSERT INTO emp_full_final_leave_det(effld_bu        ,
"
"                              effld_doc_no        ,
"
"                              effld_seq_no        ,
"
"                              effld_leave_id    ,
"
"                              effld_leave_cat    ,
"
"                              effld_date_from    ,
"
"                              effld_date_to        ,
"
"                              effld_no_of_days    ,
"
"                              effld_cre_by        ,
"
"                              effld_cre_ip_addr    ,        --added 23-jan-2020 : Ajis
"
"                              effld_cre_os_user    ,        --added 23-jan-2020 : Ajis
"
"                              effld_cre_date    ,               --added 23-jan-2020 : Ajis
"
"                              effld_cre_emp_id      )               --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu            ,        --effld_bu
"
"                                 p_doc_no        ,        --effld_doc_no
"
"                                 v_leave_det_seq_no    ,        --effld_seq_no
"
"                                 cr12.leave_leave_id    ,        --effld_leave_id
"
"                                 cr12.leave_type    ,        --effld_leave_cat
"
"                                 cr12.lrd_date_from    ,        --effld_date_from
"
"                                 cr12.lrd_date_to    ,        --effld_date_to
"
"                                 NVL(cr12.lrd_days, 0) ,        --effld_no_of_days
"
"                                 p_user        ,        --effld_cre_by
"
"                              v_ip_addr        ,         --effld_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                              v_os_user        ,         --effld_cre_os_user        --added 23-jan-2020 : Ajis
"
"                                 SYSDATE        ,        --effld_cre_date                --added 23-jan-2020 : Ajis
"
"                                 v_user_emp_id         );              --effld_cre_emp_id              --added 03-mar-2022 : Ajis
"
"
"
"                  END LOOP c12;
"
"
"
"                  /* End to Insert Leave availed days */
"
"
"
"                  /* Start to calculate Leave Encashment */
"
"
"
"                  IF cr1.effhd_adjust_el = 'Y' THEN
"
"
"
"                     proc_calc_leave_encash(p_bu,
"
"                             p_doc_no,
"
"                               p_user);
"
"
"
"             ELSE
"
"
"
"                UPDATE emp_full_final_hd
"
"                 SET effhd_leave_encash_amt = 0,
"
"                        effhd_upd_by        = p_user,
"
"                effhd_upd_ip_addr      = v_ip_addr,                --added 23-jan-2020 : Ajis
"
"                effhd_upd_os_user      = v_os_user,                 --added 23-jan-2020 : Ajis
"
"                        effhd_upd_date       = SYSDATE,                --added 23-jan-2020 : Ajis
"
"                effhd_upd_emp_id       = v_user_emp_id                           --added 03-mar-2022 : Ajis
"
"              WHERE effhd_bu     = p_bu
"
"                    AND effhd_doc_no = p_doc_no;
"
"
"
"              END IF;
"
"
"
"              /* Start to calculate Bonus Amount */
"
"
"
"              IF cr1.effhd_bonus_year IS NOT NULL AND cr1.effhd_bonus_period IS NOT NULL THEN
"
"
"
"                 proc_calc_emp_bonus(p_bu,
"
"                            p_doc_no,
"
"                            cr1.effhd_emp_id,
"
"                            cr1.effhd_year,
"
"                            cr1.effhd_period,
"
"                            cr1.effhd_bonus_year,
"
"                            cr1.effhd_bonus_period,
"
"                        p_user);
"
"
"
"              ELSE
"
"
"
"                UPDATE emp_full_final_hd
"
"                 SET effhd_earned_bonus_amt = 0,
"
"                     effhd_bonus_pct        = 0,
"
"                     effhd_bonus_amt        = 0,
"
"                     effhd_exgratia_pct     = 0,
"
"                     effhd_exgratia_amt     = 0,
"
"                     effhd_bonus_tot_amt    = 0,
"
"                        effhd_upd_by        = p_user,
"
"                effhd_upd_ip_addr      = v_ip_addr,                --added 23-jan-2020 : Ajis
"
"                effhd_upd_os_user      = v_os_user,                 --added 23-jan-2020 : Ajis
"
"                        effhd_upd_date       = SYSDATE,                --added 23-jan-2020 : Ajis
"
"                effhd_upd_emp_id       = v_user_emp_id                      --added 03-mar-2022 : Ajis
"
"              WHERE effhd_bu     = p_bu
"
"                    AND effhd_doc_no = p_doc_no;
"
"
"
"                    DELETE
"
"                      FROM emp_full_final_bonus_det
"
"                     WHERE effbd_bu = p_bu
"
"                       AND effbd_doc_no = p_doc_no;
"
"
"
"              END IF;
"
"
"
"              /* Update Imprest cash */
"
"
"
"              proc_calc_imprest_cash(p_bu,
"
"                         p_doc_no,
"
"                         cr1.effhd_emp_id,
"
"                         cr1.effhd_year,
"
"                            p_user);
"
"
"
"             /* Calculate Professional Tax */
"
"
"
"              proc_calc_fnf_pt_tax(p_bu,
"
"                              p_doc_no,
"
"                                cr1.effhd_emp_id,
"
"                                cr1.effhd_year,
"
"                                cr1.effhd_period,
"
"                                p_user);
"
"
"
"             UPDATE emp_full_final_hd
"
"             SET effhd_tot_serv_amt = ((effhd_graty_amt + effhd_leave_encash_amt + effhd_vrs_amt + effhd_bonus_tot_amt) - (effhd_imprest_amt + effhd_emp_pay_amt)),
"
"                     effhd_upd_by         = p_user,
"
"             effhd_upd_ip_addr  = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"             effhd_upd_os_user  = v_os_user,            --added 23-jan-2020 : Ajis
"
"                     effhd_upd_date        = SYSDATE,                --added 23-jan-2020 : Ajis
"
"             effhd_upd_emp_id   = v_user_emp_id                          --added 03-mar-2022 : Ajis
"
"           WHERE effhd_bu     = p_bu
"
"                    AND effhd_doc_no = p_doc_no;
"
"
"
"                  OPEN c100;
"
"                  FETCH c100 INTO cr100;
"
"                  CLOSE c100;
"
"
"
"              v_net_salary := ROUND(NVL(cr100.effln_amount, 0), v_rnd_off);
"
"
"
"                  /* Change Net Salary round off according to Payroll Round off control */
"
"
"
"              IF v_ctrl_rnd_off > 0 THEN
"
"
"
"                 IF v_ctrl_rnd_opt = 'A' THEN
"
"
"
"                    IF MOD(v_net_salary, v_ctrl_rnd_off) > 0 THEN
"
"                       v_net_rnd := (v_net_salary - MOD(v_net_salary, v_ctrl_rnd_off)) + v_ctrl_rnd_off;
"
"                    ELSE
"
"                       v_net_rnd := v_net_salary;
"
"                    END IF;
"
"
"
"                    v_net_rnd_off := v_net_rnd - v_net_salary;
"
"
"
"                 END IF;
"
"
"
"                 IF v_ctrl_rnd_opt = 'B' THEN
"
"
"
"                    IF MOD(v_net_salary, v_ctrl_rnd_off) > 0 THEN
"
"                       v_net_rnd := (v_net_salary - MOD(v_net_salary, v_ctrl_rnd_off));
"
"                    ELSE
"
"                       v_net_rnd := v_net_salary;
"
"                    END IF;
"
"
"
"                    v_net_rnd_off := v_net_rnd - v_net_salary;
"
"
"
"                 END IF;
"
"
"
"                 IF v_ctrl_rnd_opt = 'C' THEN
"
"                    v_net_rnd     := v_net_salary;
"
"                    v_net_rnd_off := v_net_rnd - v_net_salary;
"
"                 END IF;
"
"
"
"                 IF v_ctrl_rnd_opt = 'D' THEN
"
"                    v_net_rnd     := ROUND (v_net_salary, v_ctrl_rnd_off);
"
"                    v_net_rnd_off := v_net_rnd - v_net_salary;
"
"                 END IF;
"
"
"
"              ELSE
"
"                 v_net_rnd     := v_net_salary;
"
"                 v_net_rnd_off := 0;
"
"              END IF;
"
"
"
"                  /* End of Net salary Round off */
"
"
"
"                  UPDATE emp_full_final_hd
"
"                     SET effhd_net_salary    = v_net_salary,
"
"                         effhd_net_round_off = v_net_rnd_off,
"
"                         effhd_net_rounded   = v_net_rnd,
"
"                           effhd_add_amount    = ROUND(cr100.effln_add_amount, v_rnd_off),
"
"                           effhd_ded_amount    = ROUND(cr100.effln_ded_amount, v_rnd_off),
"
"                           effhd_fnf_tot_amt   = (v_net_salary + effhd_tot_serv_amt),
"
"                     effhd_upd_by          = p_user,
"
"             effhd_upd_ip_addr   = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"             effhd_upd_os_user   = v_os_user,            --added 23-jan-2020 : Ajis
"
"                     effhd_upd_date         = SYSDATE,                --added 23-jan-2020 : Ajis
"
"             effhd_upd_emp_id    = v_user_emp_id                    --added 03-mar-2022 : Ajis
"
"                   WHERE effhd_bu     = p_bu
"
"                     AND effhd_doc_no = p_doc_no;
"
"
"
"                  v_res := 'Y';
"
"
"
"           END IF;
"
"
"
"            CLOSE c2;
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
"   END proc_prep_fnf_pyrl_emp;
"
"
"
"   PROCEDURE proc_calc_leave_encash(p_bu                    VARCHAR2,
"
"                       p_doc_no                    VARCHAR2,
"
"                       p_user                    VARCHAR2)
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
"     FROM employees,
"
"          emp_active_infos,
"
"          emp_full_final_hd
"
"    WHERE emp_bu       = empai_bu
"
"      AND emp_emp_id   = empai_emp_id
"
"      AND emp_bu       = effhd_bu
"
"      AND emp_emp_id   = effhd_emp_id
"
"      AND effhd_bu     = p_bu
"
"      AND effhd_doc_no = p_doc_no
"
"      AND effhd_status = 'N';
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM leaves,
"
"          emp_leave_cur_bal
"
"    WHERE leave_bu          = emplcb_bu
"
"      AND leave_leave_id    = emplcb_leave_id
"
"      AND emplcb_bu         = p_bu
"
"      AND emplcb_emp_id     = c_emp_id
"
"      AND leave_type        = 'A'
"
"      AND leave_encash_flag = 'Y'
"
"      AND emplcb_cur_bal    > 0;
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
"     FROM emp_leave_entlmnts
"
"    WHERE ele_bu     = p_bu
"
"      AND ele_leave_id  = c_leave_id
"
"      AND ele_bnfcry_id = c_emp_id
"
"      AND ele_status    = 'A';
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_zone_id                VARCHAR2,
"
"            c_start_date            DATE,
"
"              c_end_date                DATE,
"
"              c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT COUNT(*) v_wrkd_days
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
"      AND (zwchd_clndr_id = c_clndr_id OR (zwchd_clndr_id IS NULL AND c_clndr_id IS NULL))
"
"      AND zwchd_bu       = p_bu
"
"      AND zwchd_zone_id  = c_zone_id
"
"      AND zwcln_workoff  = 'N'
"
"      AND zwchd_status   = 'A'
"
"      AND TRUNC(zwcln_date) BETWEEN TRUNC(c_start_date) AND TRUNC(c_end_date);
"
"
"
"      cr4                    c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_zone_id                VARCHAR2,
"
"         c_start_date            DATE,
"
"         c_end_date                DATE,
"
"         c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT COUNT(*) zwchd_wrk_days
"
"     FROM zone_workday_calendar_hd,
"
"      zone_workday_calendar_ln
"
"    WHERE zwchd_bu       = zwcln_bu
"
"      AND zwchd_zone_id  = zwcln_zone_id
"
"      AND zwchd_clndr_no = zwcln_clndr_no
"
"      AND (zwchd_clndr_id = c_clndr_id OR (zwchd_clndr_id IS NULL AND c_clndr_id IS NULL))
"
"      AND zwchd_bu       = p_bu
"
"      AND zwchd_zone_id  = c_zone_id
"
"      AND zwchd_status   = 'A'
"
"      AND (zwcln_holiday IN ('H')
"
"       OR (zwcln_holiday IN ('N') AND zwcln_workoff IN ('N')))
"
"      AND TRUNC(zwcln_date) BETWEEN c_start_date AND c_end_date;
"
"
"
"      cr5                    c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_emp_id                VARCHAR2,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"
"
"       IS
"
"   SELECT NVL(SUM(lrd_days), 0) leave_days
"
"     FROM employee_leaves,
"
"          leave_request_dtl,
"
"          leaves
"
"    WHERE empleave_bu       = lrd_bu
"
"      AND empleave_doc_no   = lrd_req_no
"
"      AND empleave_bu       = leave_bu
"
"      AND empleave_leave_id = leave_leave_id
"
"      AND empleave_bu       = p_bu
"
"      AND empleave_emp_id   = c_emp_id
"
"      AND empleave_status   = 'P'
"
"      AND empleave_type     = 'L'
"
"      AND empleave_oper     = '-'
"
"      AND TRUNC(lrd_date) BETWEEN TRUNC(empleave_start_date) AND NVL(TRUNC(empleave_return_date) - 1, TRUNC(empleave_end_date))
"
"      AND TRUNC(lrd_date) BETWEEN c_start_date AND c_end_date;
"
"
"
"      cr6                    c6%ROWTYPE;
"
"
"
"   CURSOR c10
"
"       IS
"
"   SELECT NVL(SUM(effel_amount), 0) effel_amount
"
"     FROM emp_full_final_encash_leave
"
"    WHERE effel_bu     = p_bu
"
"      AND effel_doc_no = p_doc_no;
"
"
"
"      cr10                    c10%ROWTYPE;
"
"
"
"   CURSOR c11(c_sou_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_relieve_fnf_pend_vw
"
"    WHERE erfpv_bu     = p_bu
"
"      AND erfpv_doc_no = c_sou_doc_no;
"
"
"
"      cr11                    c11%ROWTYPE;
"
"
"
"      v_min_ecash_day                NUMBER(7, 2)  := 0;
"
"      v_encash_calc_elmnt            VARCHAR2(10);
"
"      v_encash_calc_ctrl_type            VARCHAR2(10);
"
"      v_encash_calc_ctrl_days            NUMBER(7, 2)  := 0;
"
"      v_opt_flag                VARCHAR2(1)   := 'N';
"
"      v_ret_val                    NUMBER(15, 3) := 0;
"
"      v_act_ret_val                NUMBER(15, 3) := 0;
"
"      v_pay_basis                VARCHAR2(1);
"
"      v_encash_calc_days            NUMBER(7, 2)  := 0;
"
"      v_start_date                DATE;
"
"      v_end_date                DATE;
"
"      v_encash_amt                NUMBER(15, 3) := 0;
"
"      v_tot_encash_amt                NUMBER(15, 3) := 0;
"
"      v_rnd_off                    NUMBER(5)     := 0;
"
"      v_seq_no                    NUMBER(5);
"
"      v_year_st_date                DATE;
"
"      v_year_end_date                DATE;
"
"      v_zone_wrk_days                NUMBER(7, 2)  := 0;
"
"      v_tot_leave_days                NUMBER(7, 2)  := 0;
"
"      v_tot_el_days                NUMBER(7, 2)  := 0;
"
"      v_nxt_year_el_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 03-mar-2022 : Ajis
"
"
"
"   BEGIN
"
"
"
"      v_rnd_off := NVL(func_find_applctrl_rndoff_dgts(p_bu), 0);
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
"            RAISE_APPLICATION_ERROR(-20058, 'HRM'||' BU : '||p_bu);
"
"         ELSE
"
"            v_encash_calc_ctrl_type := cr0.hlvc_encash_work_day_calc;
"
"            v_encash_calc_ctrl_days := NVL(cr0.hlvc_encash_spc_days, 0);
"
"            v_encash_calc_elmnt        := cr0.hlvc_leave_encash_calc_elmnt;
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
"            FOR cr2 IN c2(cr1.effhd_emp_id)
"
"            LOOP
"
"
"
"               OPEN c3(cr2.leave_leave_id, cr1.effhd_emp_id);
"
"               FETCH c3 INTO cr3;
"
"
"
"                  IF c3%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20873, 'HRM'||p_bu||'~'||cr2.leave_leave_id||'~'||cr1.effhd_emp_id);
"
"                  ELSE
"
"                     v_min_ecash_day := NVL(cr3.ele_min_days_el, 0);
"
"                  END IF;
"
"
"
"               CLOSE c3;
"
"
"
"               /* Start to find Next Year Leave Encash balance */
"
"
"
"               v_year_st_date  := TRUNC(cr1.effhd_emp_relieve_date, 'YYYY');
"
"               v_year_end_date := TRUNC(cr1.effhd_emp_relieve_date);
"
"
"
"               OPEN c5(cr1.emp_zone, v_year_st_date, v_year_end_date, cr1.emp_clndr_id);
"
"               FETCH c5 INTO cr5;
"
"
"
"                  IF c5%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20773, 'HRM'||p_bu||'~'||cr1.emp_zone||'~'||v_year_st_date||'~'||v_year_end_date);
"
"                  ELSE
"
"                     v_zone_wrk_days := NVL(cr5.zwchd_wrk_days, 0);
"
"                  END IF;
"
"
"
"               CLOSE c5;
"
"
"
"               OPEN c6(cr1.emp_emp_id, v_year_st_date, v_year_end_date);
"
"               FETCH c6 INTO cr6;
"
"
"
"                  IF c6%NOTFOUND THEN
"
"                     v_tot_leave_days := 0;
"
"                  ELSE
"
"                     v_tot_leave_days := NVL(cr6.leave_days, 0);
"
"                  END IF;
"
"
"
"               CLOSE c6;
"
"
"
"               v_tot_el_days := NVL(v_zone_wrk_days - v_tot_leave_days, 0)/20;
"
"
"
"               /* End to find Next Year Leave Encash balance */
"
"
"
"               proc_find_pyrl_sdate_edate(p_bu,
"
"                                TRUNC(cr1.effhd_emp_relieve_date),
"
"                                v_start_date,
"
"                                v_end_date,
"
"                                cr1.emp_clndr_id);
"
"
"
"               IF v_encash_calc_ctrl_type = 'P' THEN
"
"                  v_encash_calc_days := (v_end_date - v_start_date) + 1;
"
"               ELSIF v_encash_calc_ctrl_type = 'S' THEN
"
"
"
"                  IF (cr0.hlvc_encash_spc_days IS NULL OR cr0.hlvc_encash_spc_days = 0) THEN
"
"                 RAISE_APPLICATION_ERROR(-20037, 'HRM');
"
"              ELSE
"
"                 v_encash_calc_days := v_encash_calc_ctrl_days;
"
"                  END IF;
"
"
"
"               ELSIF v_encash_calc_ctrl_type = 'W' THEN
"
"
"
"                  OPEN c4(cr1.emp_zone, v_start_date, v_end_date, cr1.emp_clndr_id);
"
"                  FETCH c4 INTO cr4;
"
"
"
"                     IF c4%FOUND THEN
"
"                        v_encash_calc_days := NVL(cr4.v_wrkd_days, 0);
"
"                     ELSE
"
"                        v_encash_calc_days := 0;
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
"               IF v_encash_calc_days = 0 THEN
"
"                  RAISE_APPLICATION_ERROR(-20051, 'HRM');
"
"               END IF;
"
"
"
"           IF cr1.effhd_waive_off = 'N' THEN
"
"              NULL;
"
"           END IF;
"
"
"
"               /* Encash Amount calculate from Encash Element based on formula. */
"
"
"
"               IF v_encash_calc_elmnt IS NOT NULL THEN
"
"
"
"                  proc_calc_pay_elements (p_bu,
"
"                                      'N',
"
"                                      v_start_date,
"
"                                      v_end_date,
"
"                                      v_encash_calc_elmnt,
"
"                                      v_opt_flag,
"
"                                      cr1.effhd_emp_id,
"
"                                      '+',
"
"                                      v_ret_val,
"
"                                      v_act_ret_val,
"
"                                      cr1.emp_pay_basis);
"
"
"
"              v_encash_amt := NVL((v_ret_val/v_encash_calc_days) * NVL(cr2.emplcb_cur_bal, 0), 0);
"
"
"
"             END IF;
"
"
"
"               /* Encash Amount calculate from Basic Amount */
"
"
"
"               IF v_encash_calc_elmnt IS NULL THEN
"
"
"
"                  IF cr1.emp_pay_basis = 'S' THEN
"
"                 v_encash_amt := NVL((cr1.empai_basic_sal/v_encash_calc_days) * NVL(cr2.emplcb_cur_bal, 0), 0);
"
"              ELSE
"
"                 v_encash_amt := NVL((cr1.empai_per_day_wage/v_encash_calc_days) * NVL(cr2.emplcb_cur_bal, 0), 0);
"
"              END IF;
"
"
"
"               END IF;
"
"
"
"               IF cr1.emp_pay_basis = 'S' THEN
"
"                 v_nxt_year_el_amt := NVL((cr1.empai_basic_sal/v_encash_calc_days) * NVL(v_tot_el_days, 0), 0);
"
"           ELSE
"
"                 v_nxt_year_el_amt := NVL((cr1.empai_per_day_wage/v_encash_calc_days) * NVL(v_tot_el_days, 0), 0);
"
"           END IF;
"
"
"
"               IF NVL(cr2.emplcb_cur_bal, 0) >= v_min_ecash_day THEN
"
"
"
"                  SELECT NVL(MAX(effel_seq_no), 0) + 1
"
"                    INTO v_seq_no
"
"                    FROM emp_full_final_encash_leave
"
"                   WHERE effel_bu = p_bu
"
"                     AND effel_doc_no = p_doc_no;
"
"
"
"                  INSERT INTO emp_full_final_encash_leave(effel_bu            ,
"
"                                  effel_doc_no            ,
"
"                                  effel_seq_no            ,
"
"                                  effel_leave_id        ,
"
"                                  effel_curr_year_bal        ,
"
"                                  effel_next_year_bal        ,
"
"                                  effel_waive_off_days        ,
"
"                                  effel_total_bal        ,
"
"                                  effel_amount            ,
"
"                                  effel_cre_by            ,
"
"                              effel_cre_ip_addr        ,                    --added 23-jan-2020 : Ajis
"
"                              effel_cre_os_user         ,                    --added 23-jan-2020 : Ajis
"
"                                  effel_cre_date        ,                                   --added 23-jan-2020 : Ajis
"
"                                  effel_cre_emp_id        )                    --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu                ,                    --effel_bu
"
"                                  p_doc_no            ,                    --effel_doc_no
"
"                                  v_seq_no            ,                    --effel_seq_no
"
"                                  cr2.leave_leave_id        ,                    --effel_leave_id
"
"                                  NVL(cr2.emplcb_cur_bal, 0),                    --effel_curr_year_bal
"
"                                  v_tot_el_days            ,                    --effel_next_year_bal
"
"                                  0                ,                    --effel_waive_off_days
"
"                                  0                ,                        --effel_total_bal
"
"                                  ROUND(v_encash_amt, v_rnd_off),--ROUND(v_encash_amt + v_nxt_year_el_amt, v_rnd_off),     --effel_amount
"
"                                  p_user            ,                    --effel_cre_by
"
"                              v_ip_addr            ,                     --effel_cre_ip_addr
"
"                              v_os_user            ,                     --effel_cre_os_user
"
"                                  SYSDATE            ,                                   --effel_cre_date
"
"                                  v_user_emp_id             );                    --effel_cre_emp_id
"
"
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
"            OPEN c10;
"
"            FETCH c10 INTO cr10;
"
"
"
"               IF c10%FOUND THEN
"
"                  v_tot_encash_amt := cr10.effel_amount;
"
"               ELSE
"
"                  v_tot_encash_amt := 0;
"
"               END IF;
"
"
"
"            CLOSE c10;
"
"
"
"        UPDATE emp_full_final_hd
"
"           SET effhd_leave_encash_amt = ROUND(v_tot_encash_amt, v_rnd_off),
"
"               effhd_upd_by       = p_user,
"
"           effhd_upd_ip_addr      = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"           effhd_upd_os_user      = v_os_user,        --added 23-jan-2020 : Ajis
"
"               effhd_upd_date      = SYSDATE,
"
"               effhd_upd_emp_id       = v_user_emp_id    --added 03-mar-2022 : Ajis
"
"         WHERE effhd_bu     = p_bu
"
"           AND effhd_doc_no = p_doc_no;
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
"   END proc_calc_leave_encash;
"
"
"
"   PROCEDURE proc_calc_emp_bonus(p_bu                        VARCHAR2,
"
"                       p_doc_no                    VARCHAR2,
"
"                       p_emp_id                    VARCHAR2,
"
"                       p_year                        NUMBER,
"
"                       p_period                    NUMBER,
"
"                       p_bonus_year                    NUMBER,
"
"                       p_bonus_period                    NUMBER,
"
"                    p_user                        VARCHAR2)
"
"   IS
"
"   CURSOR c1(c_year                NUMBER,
"
"            c_period                NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(phln_amount), 0) phln_amount
"
"     FROM (SELECT NVL(SUM(DECODE(hfbce_act_ernd_flag, 'E',
"
"          DECODE(phln_mode, '+', phln_amount, phln_amount * -1),
"
"          DECODE(phln_mode, '+', phln_actual_amount, phln_actual_amount * -1))), 0) phln_amount
"
"         FROM payroll_hist_hd,
"
"              payroll_hist_ln,
"
"              hrm_fnf_bonus_calc_elmnt
"
"        WHERE phhd_bu       = phln_bu
"
"          AND phhd_pyrl_no  = phln_pyrl_no
"
"          AND phhd_process_batch_no = phln_process_batch_no
"
"          AND phln_bu       = hfbce_bu
"
"          AND phln_elmnt_id = hfbce_elmnt_id
"
"          AND phhd_bu       = p_bu
"
"          AND phhd_year     = c_year
"
"          AND phhd_period   = c_period
"
"          AND phhd_emp_id   = p_emp_id);
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
"   SELECT NVL(SUM(effbd_amount), 0) effbd_amount
"
"     FROM emp_full_final_bonus_det
"
"    WHERE effbd_bu = p_bu
"
"      AND effbd_doc_no = p_doc_no;
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"      v_bonus_from_year                NUMBER(6);
"
"      v_bonus_from_period            NUMBER(2);
"
"      v_bonus_to_year                NUMBER(6);
"
"      v_bonus_to_period                NUMBER(2);
"
"      v_seq_no                    NUMBER(5);
"
"      v_bonus_amt                NUMBER(15, 3) := 0;
"
"      v_tot_bonus_amt                NUMBER(15, 3) := 0;
"
"      v_rnd_off                    NUMBER(5) := 0;
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 03-mar-2022 : Ajis
"
"
"
"
"
"   BEGIN
"
"
"
"      v_rnd_off := NVL(func_find_applctrl_rndoff_dgts(p_bu), 0);
"
"
"
"      DELETE
"
"        FROM emp_full_final_bonus_det
"
"       WHERE effbd_bu = p_bu
"
"         AND effbd_doc_no = p_doc_no;
"
"
"
"      v_bonus_from_year   := p_bonus_year;
"
"      v_bonus_from_period := p_bonus_period;
"
"
"
"      IF p_period = 1 THEN
"
"
"
"         IF LENGTH(p_year) > 4 THEN
"
"            v_bonus_to_year   := p_year - 101;
"
"            v_bonus_to_period := 12;
"
"         ELSE
"
"            v_bonus_to_year   := p_year - 1;
"
"            v_bonus_to_period := 12;
"
"         END IF;
"
"
"
"      ELSE
"
"         v_bonus_to_year   := p_year;
"
"         v_bonus_to_period := p_period - 1;
"
"      END IF;
"
"
"
"      v_seq_no := 1;
"
"
"
"      WHILE v_bonus_from_year IS NOT NULL AND v_bonus_from_period IS NOT NULL
"
"      LOOP
"
"
"
"         OPEN c1(v_bonus_from_year, v_bonus_from_period);
"
"         FETCH c1 INTO cr1;
"
"
"
"            IF c1%FOUND THEN
"
"               v_bonus_amt := cr1.phln_amount;
"
"            ELSE
"
"               v_bonus_amt := 0;
"
"            END IF;
"
"
"
"         CLOSE c1;
"
"
"
"         INSERT INTO emp_full_final_bonus_det(effbd_bu         ,
"
"                          effbd_doc_no     ,
"
"                          effbd_seq_no     ,
"
"                          effbd_year     ,
"
"                          effbd_period     ,
"
"                          effbd_amount     ,
"
"                          effbd_cre_by     ,
"
"                          effbd_cre_ip_addr  ,        --added 23-jan-2020 : Ajis
"
"                          effbd_cre_os_user  ,        --added 23-jan-2020 : Ajis
"
"                          effbd_cre_date     ,
"
"                          effbd_cre_emp_id     )              --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu         ,        --effbd_bu
"
"                                 p_doc_no         ,        --effbd_doc_no
"
"                                 v_seq_no         ,        --effbd_seq_no
"
"                                 v_bonus_from_year     ,        --effbd_year
"
"                                 v_bonus_from_period,        --effbd_period
"
"                                 v_bonus_amt     ,        --effbd_amount
"
"                                 p_user         ,        --effbd_cre_by
"
"                          v_ip_addr         ,         --effbd_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                          v_os_user         ,         --effbd_cre_os_user        --added 23-jan-2020 : Ajis
"
"                                 SYSDATE         ,        --effbd_cre_date
"
"                                 v_user_emp_id      );             --effbd_cre_emp_id              --added 03-mar-2022 : Ajis
"
"
"
"         v_seq_no := v_seq_no + 1;
"
"
"
"         IF v_bonus_from_period > 11 THEN
"
"
"
"            IF LENGTH(v_bonus_from_year) > 4 THEN
"
"           v_bonus_from_period := 1;
"
"           v_bonus_from_year   := v_bonus_from_year + 101;
"
"        ELSE
"
"           v_bonus_from_period := 1;
"
"           v_bonus_from_year   := v_bonus_from_year + 1;
"
"        END IF;
"
"
"
"     ELSE
"
"        v_bonus_from_period := v_bonus_from_period + 1;
"
"        v_bonus_from_year   := v_bonus_from_year;
"
"         END IF;
"
"
"
"         EXIT WHEN (v_bonus_from_year||TO_CHAR(v_bonus_from_period, '00') > v_bonus_to_year||TO_CHAR(v_bonus_to_period, '00'));
"
"
"
"      END LOOP;
"
"
"
"      OPEN c2;
"
"      FETCH c2 INTO cr2;
"
"
"
"         IF c2%FOUND THEN
"
"            v_tot_bonus_amt := NVL(cr2.effbd_amount, 0);
"
"         ELSE
"
"            v_tot_bonus_amt := 0;
"
"         END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      UPDATE emp_full_final_hd
"
"     SET effhd_earned_bonus_amt = ROUND(v_tot_bonus_amt, v_rnd_off),
"
"         effhd_bonus_pct         = 0,
"
"         effhd_bonus_amt        = 0,
"
"         effhd_exgratia_pct     = 0,
"
"         effhd_exgratia_amt     = 0,
"
"         effhd_bonus_tot_amt    = 0,
"
"         effhd_upd_by         = p_user,
"
"         effhd_upd_ip_addr      = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"         effhd_upd_os_user      = v_os_user,        --added 23-jan-2020 : Ajis
"
"         effhd_upd_date        = SYSDATE,
"
"         effhd_upd_emp_id        = v_user_emp_id             --added 03-mar-2022 : Ajis
"
"       WHERE effhd_bu     = p_bu
"
"     AND effhd_doc_no = p_doc_no;
"
"
"
"   END proc_calc_emp_bonus;
"
"
"
"   PROCEDURE proc_calc_emp_gratuity(p_bu                VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_emp_id                VARCHAR2,
"
"                       p_basic_sal                NUMBER,
"
"                       p_serv_yrs                NUMBER,
"
"                       p_date_from                DATE,
"
"                       p_date_to                DATE,
"
"                       p_emp_pay_basis            VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_grat_amt        OUT        NUMBER)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM payroll_elements_hd,
"
"          hrm_fnf_gratuity_calc_elmnt,
"
"          emp_pyrl_allowances
"
"    WHERE pehd_bu        = hfgce_bu
"
"      AND pehd_elmnt_id  = hfgce_elmnt_id
"
"      AND hfgce_bu       = epa_bu
"
"      AND hfgce_elmnt_id = epa_elmnt_id
"
"      AND pehd_bu        = p_bu
"
"      AND epa_emp_id     = p_emp_id
"
"      AND pehd_type      IN ('FL', 'VL', 'CL');
"
"
"
"      v_allow_amt                NUMBER(15, 3) := 0;
"
"      v_opt_flag                VARCHAR2(1) := 'N';
"
"      v_ret_val                    NUMBER(15, 3) := 0;
"
"      v_act_ret_val                NUMBER(15, 3) := 0;
"
"      v_emp_grat_amt                NUMBER(15, 3) := 0;
"
"
"
"   BEGIN
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"         IF cr1.pehd_type IN ('FL') THEN
"
"            v_allow_amt := v_allow_amt + NVL(cr1.epa_per_amt, 0);
"
"         END IF;
"
"
"
"         IF cr1.pehd_type IN ('VL', 'CL') THEN
"
"
"
"        proc_calc_pay_elements(p_bu,
"
"                       'N',
"
"                       p_date_from,
"
"                       p_date_to,
"
"                       cr1.pehd_elmnt_id,
"
"                       v_opt_flag,
"
"                       p_emp_id,
"
"                       '+',
"
"                       v_ret_val,
"
"                       v_act_ret_val,
"
"                       p_emp_pay_basis);
"
"
"
"        v_allow_amt := v_allow_amt + NVL(v_act_ret_val, 0);
"
"
"
"         END IF;
"
"
"
"      END LOOP c1;
"
"
"
"      v_emp_grat_amt := NVL((((p_basic_sal + v_allow_amt)  * 15)/26) * p_serv_yrs, 0);
"
"
"
"      p_grat_amt := v_emp_grat_amt;
"
"
"
"   END proc_calc_emp_gratuity;
"
"
"
"   PROCEDURE proc_calc_fnf_pt_tax(p_bu                    VARCHAR2,
"
"                         p_doc_no                VARCHAR2,
"
"                           p_emp_id                VARCHAR2,
"
"                           p_year                NUMBER,
"
"                           p_period                NUMBER,
"
"                           p_user                VARCHAR2)
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
"          emp_active_infos,
"
"          hrm_emp_pt_elgbl
"
"    WHERE emp_bu         = empai_bu
"
"      AND emp_emp_id     = empai_emp_id
"
"      AND empai_bu       = hepe_bu
"
"      AND empai_emp_id   = hepe_emp_id
"
"      AND emp_bu         = p_bu
"
"      AND emp_emp_id     = p_emp_id
"
"      AND hepe_hold_flag = 'N';
"
"
"
"      cr0                    c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_zone_id                VARCHAR2,
"
"           c_gender                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_elements_hd,
"
"          hrm_pt_tax_slab_hd
"
"    WHERE hptsh_bu     = pehd_bu
"
"      AND hptsh_elmnt_id = pehd_elmnt_id
"
"      AND hptsh_bu       = p_bu
"
"      AND hptsh_zone_id  = c_zone_id
"
"      AND (hptsh_gender  IN ('B') OR hptsh_gender = c_gender)
"
"      AND TRUNC(SYSDATE) BETWEEN TRUNC(hptsh_eff_from) AND TRUNC(hptsh_eff_to)
"
"      AND hptsh_status   IN ('P', 'R');
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_period                NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(phln_amount), 0) phln_amount
"
"     FROM (SELECT NVL(SUM(DECODE(hpce_act_ernd_flag, 'E',
"
"                  DECODE(phln_mode, '+', phln_amount, phln_amount * -1),
"
"                  DECODE(phln_mode, '+', phln_actual_amount, phln_actual_amount * -1))), 0) phln_amount
"
"         FROM payroll_hist_hd,
"
"              payroll_hist_ln,
"
"              hrm_pt_calc_elmnt
"
"        WHERE phhd_bu       = phln_bu
"
"          AND phhd_pyrl_no  = phln_pyrl_no
"
"          AND phhd_process_batch_no = phln_process_batch_no
"
"          AND phln_bu       = hpce_bu
"
"          AND phln_elmnt_id = hpce_elmnt_id
"
"          AND phhd_bu       = p_bu
"
"          AND phhd_emp_id   = p_emp_id
"
"          AND phhd_year     = p_year
"
"          AND phhd_period   = c_period);
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_doc_no                VARCHAR2,
"
"         c_doc_rev_no            NUMBER,
"
"         c_pt_range                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pt_tax_slab_hd,
"
"          hrm_pt_tax_slab_ln
"
"    WHERE hptsh_bu         = hptsl_bu
"
"      AND hptsh_doc_no     = hptsl_doc_no
"
"      AND hptsh_doc_rev_no = hptsl_doc_rev_no
"
"      AND hptsh_bu       = p_bu
"
"      AND hptsh_doc_no     = c_doc_no
"
"      AND hptsh_doc_rev_no = c_doc_rev_no
"
"      AND TRUNC(SYSDATE) BETWEEN TRUNC(hptsh_eff_from) AND TRUNC(hptsh_eff_to)
"
"      AND c_pt_range BETWEEN hptsl_range_from AND hptsl_range_to
"
"      AND hptsh_status     IN ('P', 'R');
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT NVL(SUM(DECODE(hpce_act_ernd_flag, 'E',
"
"          DECODE(effln_mode, '+', effln_amount, effln_amount * -1),
"
"          DECODE(effln_mode, '+', effln_actual_amt, effln_actual_amt * -1))), 0) effln_amount
"
"     FROM emp_full_final_ln,
"
"      hrm_pt_calc_elmnt
"
"    WHERE effln_bu       = hpce_bu
"
"      AND effln_elmnt_id = hpce_elmnt_id
"
"      AND effln_bu       = p_bu
"
"      AND effln_doc_no   = p_doc_no;
"
"
"
"      cr4                    c4%ROWTYPE;
"
"
"
"   CURSOR c5
"
"       IS
"
"   SELECT TRUNC(TO_CHAR(pcp_end_date, 'MM')) pc_month
"
"     FROM payroll_cal_period
"
"    WHERE pcp_bu     = p_bu
"
"      AND pcp_year   = p_year
"
"      AND pcp_period = p_period;
"
"
"
"      cr5                    c5%ROWTYPE;
"
"
"
"      v_emp_zone                VARCHAR2(10);
"
"      v_emp_gender                VARCHAR2(1) := 'B';
"
"      v_emp_plnt                VARCHAR2(10);
"
"      v_emp_status                VARCHAR2(1) := 'A';
"
"      v_exempt_mon                NUMBER(5);
"
"      v_exempt_flag                VARCHAR2(1) := 'N';
"
"      v_period_from                NUMBER(2);
"
"      v_period_to                NUMBER(2);
"
"      v_freq_desc                VARCHAR2(100);
"
"      v_calc_pt_flag                VARCHAR2(1) := 'N';
"
"      v_hist_pyrl_amt                NUMBER(15, 3) := 0;
"
"      v_hist_pyrl_tot_amt            NUMBER(15, 3) := 0;
"
"      v_pt_tax_amt                NUMBER(15, 3) := 0;
"
"      v_fc_amt                    NUMBER(15, 3) := 0;
"
"      v_pyrl_type                VARCHAR2(1) := 'N';
"
"      v_ln_seq_no                NUMBER(5);
"
"      v_cur_pyrl_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 03-mar-2022 : Ajis
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
"         IF c0%FOUND THEN
"
"            v_calc_pt_flag := 'Y';
"
"            v_emp_zone     := cr0.emp_zone;
"
"            v_emp_gender   := cr0.emp_gender;
"
"            v_emp_plnt     := cr0.empai_plnt;
"
"            v_emp_status   := cr0.emp_status;
"
"         ELSE
"
"            v_calc_pt_flag := 'N';
"
"            v_emp_gender   := 'B';
"
"            v_emp_zone     := NULL;
"
"            v_emp_plnt     := NULL;
"
"            v_emp_status   := 'A';
"
"         END IF;
"
"
"
"      CLOSE c0;
"
"
"
"      IF v_calc_pt_flag = 'Y' THEN
"
"
"
"         OPEN c1(v_emp_zone, v_emp_gender);
"
"         FETCH c1 INTO cr1;
"
"
"
"            IF c1%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20388, 'TAX'||' ~ '||p_bu||' ~ '||v_emp_zone);
"
"            ELSE
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
"                     RAISE_APPLICATION_ERROR(-20774, 'HRM'||' ~ '||p_bu||' ~ '||p_year||' ~ '||p_period);
"
"                  ELSE
"
"                     v_exempt_mon := cr5.pc_month;
"
"                  END IF;
"
"
"
"               CLOSE c5;
"
"
"
"               IF ((v_exempt_mon = 1  AND cr1.hptsh_exempt_jan_flag = 'Y') OR
"
"                   (v_exempt_mon = 2  AND cr1.hptsh_exempt_feb_flag = 'Y') OR
"
"                   (v_exempt_mon = 3  AND cr1.hptsh_exempt_mar_flag = 'Y') OR
"
"                   (v_exempt_mon = 4  AND cr1.hptsh_exempt_apr_flag = 'Y') OR
"
"                   (v_exempt_mon = 5  AND cr1.hptsh_exempt_may_flag = 'Y') OR
"
"                   (v_exempt_mon = 6  AND cr1.hptsh_exempt_jun_flag = 'Y') OR
"
"                   (v_exempt_mon = 7  AND cr1.hptsh_exempt_jul_flag = 'Y') OR
"
"                   (v_exempt_mon = 8  AND cr1.hptsh_exempt_aug_flag = 'Y') OR
"
"                   (v_exempt_mon = 9  AND cr1.hptsh_exempt_sep_flag = 'Y') OR
"
"                   (v_exempt_mon = 10 AND cr1.hptsh_exempt_oct_flag = 'Y') OR
"
"                   (v_exempt_mon = 11 AND cr1.hptsh_exempt_nov_flag = 'Y') OR
"
"                   (v_exempt_mon = 12 AND cr1.hptsh_exempt_dec_flag = 'Y')) THEN
"
"                  v_exempt_flag := 'Y';
"
"               ELSE
"
"                  v_exempt_flag := 'N';
"
"               END IF;
"
"
"
"               DELETE
"
"                 FROM hrm_pt_calc_values
"
"                WHERE hpcv_bu     = p_bu
"
"                  AND hpcv_emp_id = p_emp_id
"
"                  AND hpcv_year   = p_year
"
"                  AND hpcv_period = p_period;
"
"
"
"               IF v_emp_status IN ('T', 'R') THEN
"
"                  v_pyrl_type := 'T';
"
"               ELSE
"
"                  v_pyrl_type := 'N';
"
"               END IF;
"
"
"
"               /* Period from and to assigned based on PT range frequency */
"
"
"
"               IF cr1.hptsh_freq = 'M' THEN
"
"                  v_period_from := p_period;
"
"                  v_period_to   := p_period;
"
"                  v_freq_desc   := 'MONTHLY';
"
"               END IF;
"
"
"
"               IF cr1.hptsh_freq = 'H' THEN
"
"
"
"              IF v_emp_status NOT IN ('T', 'R') THEN
"
"
"
"                 IF p_period = 6 THEN
"
"                v_period_from := 1;
"
"                v_period_to   := 6;
"
"                 END IF;
"
"
"
"                 IF p_period = 12 THEN
"
"                v_period_from := 7;
"
"                v_period_to   := 12;
"
"                 END IF;
"
"
"
"              ELSE
"
"
"
"                 IF p_period BETWEEN 1 AND 6 THEN
"
"                v_period_from := 1;
"
"                v_period_to   := p_period - 1;
"
"                 END IF;
"
"
"
"                 IF p_period BETWEEN 7 AND 12 THEN
"
"                v_period_from := 7;
"
"                v_period_to   := p_period - 1;
"
"                 END IF;
"
"
"
"              END IF;
"
"
"
"              v_freq_desc   := 'HALF YEARLY';
"
"
"
"               END IF;
"
"
"
"               IF cr1.hptsh_freq = 'Y' THEN
"
"
"
"              IF v_emp_status NOT IN ('T', 'R') THEN
"
"
"
"                 IF p_period = 12 THEN
"
"                v_period_from := 1;
"
"                v_period_to   := 12;
"
"                  END IF;
"
"
"
"              ELSE
"
"                 v_period_from := 1;
"
"             v_period_to   := p_period - 1;
"
"              END IF;
"
"
"
"                  v_freq_desc   := 'YEARLY';
"
"
"
"               END IF;
"
"
"
"           IF v_period_from IS NOT NULL AND v_period_to IS NOT NULL THEN
"
"
"
"                    /* Get Last six month earned salary */
"
"
"
"                  FOR i IN v_period_from..v_period_to
"
"                    LOOP
"
"
"
"                 OPEN c2(i);
"
"                 FETCH c2 INTO cr2;
"
"
"
"                    IF c2%NOTFOUND THEN
"
"                       v_hist_pyrl_amt := 0;
"
"                    ELSE
"
"                       v_hist_pyrl_amt := NVL(cr2.phln_amount, 0);
"
"                    END IF;
"
"
"
"                 CLOSE c2;
"
"
"
"                     INSERT INTO hrm_pt_calc_values(hpcv_bu        ,
"
"                                hpcv_emp_id     ,
"
"                                hpcv_year        ,
"
"                                hpcv_period     ,
"
"                                hpcv_brief      ,
"
"                                hpcv_amount     ,
"
"                                hpcv_cre_by     ,
"
"                            hpcv_cre_ip_addr,                    --added 23-jan-2020 : Ajis
"
"                            hpcv_cre_os_user,                    --added 23-jan-2020 : Ajis
"
"                                hpcv_cre_date   ,
"
"                                hpcv_cre_emp_id )                                   --added 03-mar-2022 : Ajis
"
"                             VALUES(p_bu        ,                    --hpcv_bu
"
"                                   p_emp_id        ,                    --hpcv_emp_id
"
"                                   p_year        ,                    --hpcv_year
"
"                                   p_period        ,                    --hpcv_period
"
"                                   'SALARY FOR THE YEAR/PERIOD : '||p_year||'/'||i,    --hpcv_brief
"
"                                   v_hist_pyrl_amt ,                    --hpcv_amount
"
"                                   p_user        ,                    --hpcv_cre_by
"
"                                   v_ip_addr        ,                     --hpcv_cre_ip_addr    --added 23-jan-2020 : Ajis
"
"                            v_os_user        ,                     --hpcv_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                   SYSDATE        ,                    --hpcv_cre_date
"
"                                   v_user_emp_id   );                                  --hpcv_cre_emp_id       --added 03-mar-2022 : Ajis
"
"
"
"                 v_hist_pyrl_tot_amt := v_hist_pyrl_tot_amt + v_hist_pyrl_amt;
"
"
"
"                  END LOOP i;
"
"
"
"               END IF;
"
"
"
"               OPEN c4;
"
"               FETCH c4 INTO cr4;
"
"
"
"                  IF c4%NOTFOUND THEN
"
"                     v_cur_pyrl_amt := 0;
"
"                  ELSE
"
"                     v_cur_pyrl_amt := cr4.effln_amount;
"
"                  END IF;
"
"
"
"               CLOSE c4;
"
"
"
"               INSERT INTO hrm_pt_calc_values(hpcv_bu          ,
"
"                          hpcv_emp_id     ,
"
"                          hpcv_year          ,
"
"                          hpcv_period     ,
"
"                          hpcv_brief      ,
"
"                          hpcv_amount     ,
"
"                          hpcv_cre_by     ,
"
"                          hpcv_cre_ip_addr,                        --added 23-jan-2020 : Ajis
"
"                          hpcv_cre_os_user,                        --added 23-jan-2020 : Ajis
"
"                          hpcv_cre_date   ,
"
"                          hpcv_cre_emp_id )                                         --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu          ,                        --hpcv_bu
"
"                             p_emp_id          ,                        --hpcv_emp_id
"
"                             p_year          ,                        --hpcv_year
"
"                             p_period          ,                        --hpcv_period
"
"                             'SALARY FOR THE YEAR/PERIOD : '||p_year||'/'||p_period,    --hpcv_brief
"
"                             v_cur_pyrl_amt  ,                        --hpcv_amount
"
"                             p_user          ,                        --hpcv_cre_by
"
"                             v_ip_addr          ,                     --hpcv_cre_ip_addr    --added 23-jan-2020 : Ajis
"
"                          v_os_user          ,                     --hpcv_cre_os_user    --added 23-jan-2020 : Ajis
"
"                             SYSDATE          ,                            --hpcv_cre_date
"
"                             v_user_emp_id   );                                        --hpcv_cre_emp_id       --added 03-mar-2022 : Ajis
"
"
"
"               v_hist_pyrl_tot_amt := v_hist_pyrl_tot_amt + v_cur_pyrl_amt;
"
"
"
"               INSERT INTO hrm_pt_calc_values(hpcv_bu          ,
"
"                          hpcv_emp_id     ,
"
"                          hpcv_year          ,
"
"                          hpcv_period     ,
"
"                          hpcv_brief      ,
"
"                          hpcv_amount     ,
"
"                          hpcv_cre_by     ,
"
"                          hpcv_cre_ip_addr,                        --added 23-jan-2020 : Ajis
"
"                          hpcv_cre_os_user,                        --added 23-jan-2020 : Ajis
"
"                          hpcv_cre_date   ,
"
"                          hpcv_cre_emp_id )                                         --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu          ,            --hpcv_bu
"
"                             p_emp_id          ,            --hpcv_emp_id
"
"                             p_year          ,            --hpcv_year
"
"                             p_period          ,            --hpcv_period
"
"                             v_freq_desc||' INCOME',        --hpcv_brief
"
"                             v_hist_pyrl_tot_amt,        --hpcv_amount
"
"                             p_user          ,            --hpcv_cre_by
"
"                             v_ip_addr          ,         --hpcv_cre_ip_addr    --added 23-jan-2020 : Ajis
"
"                          v_os_user          ,         --hpcv_cre_os_user    --added 23-jan-2020 : Ajis
"
"                             SYSDATE          ,                --hpcv_cre_date
"
"                             v_user_emp_id   );                --hpcv_cre_emp_id       --added 03-mar-2022 : Ajis
"
"
"
"           /* Start to Insert Professional Tax Amount */
"
"
"
"           IF v_hist_pyrl_tot_amt > 0 THEN
"
"
"
"              OPEN c3(cr1.hptsh_doc_no, cr1.hptsh_doc_rev_no, v_hist_pyrl_tot_amt);
"
"              FETCH c3 INTO cr3;
"
"
"
"                 IF c3%NOTFOUND THEN
"
"                RAISE_APPLICATION_ERROR(-20077, 'HRM'||' ~ '||p_bu||' ~ Amount : '||v_hist_pyrl_tot_amt);
"
"                 ELSE
"
"                v_pt_tax_amt := CASE WHEN v_exempt_flag = 'Y' THEN NVL(cr3.hptsl_exempt_amt, 0) ELSE NVL(cr3.hptsl_amt, 0) END;
"
"                 END IF;
"
"
"
"              CLOSE c3;
"
"
"
"                  INSERT INTO hrm_pt_calc_values(hpcv_bu     ,
"
"                             hpcv_emp_id     ,
"
"                             hpcv_year     ,
"
"                             hpcv_period     ,
"
"                             hpcv_brief      ,
"
"                             hpcv_amount     ,
"
"                             hpcv_cre_by     ,
"
"                             hpcv_cre_ip_addr,                        --added 23-jan-2020 : Ajis
"
"                             hpcv_cre_os_user,                        --added 23-jan-2020 : Ajis
"
"                             hpcv_cre_date   ,
"
"                             hpcv_cre_emp_id )                                              --added 03-mar-2022 : Ajis
"
"                          VALUES(p_bu             ,        --hpcv_bu
"
"                                p_emp_id     ,        --hpcv_emp_id
"
"                                p_year             ,        --hpcv_year
"
"                                p_period     ,        --hpcv_period
"
"                                'PROFESSIONAL TAX',        --hpcv_brief
"
"                                v_pt_tax_amt    ,        --hpcv_amount
"
"                                p_user             ,        --hpcv_cre_by
"
"                                v_ip_addr     ,         --hpcv_cre_ip_addr    --added 23-jan-2020 : Ajis
"
"                             v_os_user     ,         --hpcv_cre_os_user    --added 23-jan-2020 : Ajis
"
"                                SYSDATE     ,        --hpcv_cre_date
"
"                                v_user_emp_id   );             --hpcv_cre_emp_id       --added 03-mar-2022 : Ajis
"
"
"
"                  IF cr1.hptsh_elmnt_id IS NOT NULL AND v_pt_tax_amt > 0 THEN
"
"
"
"                     SELECT NVL(MAX(effln_seq_no), 0) + 1
"
"                       INTO v_ln_seq_no
"
"                       FROM emp_full_final_ln
"
"                      WHERE effln_bu     = p_bu
"
"                        AND effln_doc_no = p_doc_no;
"
"
"
"                     INSERT INTO emp_full_final_ln(effln_bu        ,
"
"                           effln_doc_no        ,
"
"                           effln_seq_no        ,
"
"                           effln_elmnt_id    ,
"
"                           effln_mode        ,
"
"                           effln_amount        ,
"
"                           effln_actual_amt    ,
"
"                           effln_adj_no        ,
"
"                           effln_sou_doc_no    ,
"
"                           effln_source        ,
"
"                           effln_sou_doc_seq_no    ,
"
"                           effln_reference    ,
"
"                           effln_cre_by        ,
"
"                           effln_cre_ip_addr    ,        --added 23-jan-2020 : Ajis
"
"                           effln_cre_os_user    ,        --added 23-jan-2020 : Ajis
"
"                           effln_cre_date    ,
"
"                           effln_cre_emp_id     )               --added 03-mar-2022 : Ajis
"
"                        VALUES(p_bu            ,        --effln_bu
"
"                            p_doc_no        ,        --effln_doc_no
"
"                            v_ln_seq_no        ,        --effln_seq_no
"
"                            cr1.hptsh_elmnt_id    ,        --effln_elmnt_id
"
"                            '-'            ,        --effln_mode
"
"                            v_pt_tax_amt        ,        --effln_amount
"
"                            0            ,        --effln_actual_amt
"
"                            NULL            ,        --effln_adj_no
"
"                            NULL            ,        --effln_sou_doc_no
"
"                            NULL            ,        --effln_source
"
"                            NULL            ,        --effln_sou_doc_seq_no
"
"                            cr1.pehd_desc1||' DEDUCTION.',    --effln_reference
"
"                            p_user        ,        --effln_cre_by
"
"                            v_ip_addr        ,         --effln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                           v_os_user        ,         --effln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                            SYSDATE        ,        --effln_cre_date
"
"                            v_user_emp_id        );              --effln_cre_emp_id              --added 03-mar-2022 : Ajis
"
"
"
"                  END IF;
"
"
"
"           END IF;
"
"
"
"            END IF;
"
"
"
"         CLOSE c1;
"
"
"
"      END IF;
"
"
"
"   END proc_calc_fnf_pt_tax;
"
"
"
"   PROCEDURE proc_chk_fnf_pyrl_excep(p_bu                    VARCHAR2,
"
"                     p_doc_no                    VARCHAR2,
"
"                     p_emp_id                    VARCHAR2,
"
"                     p_user                    VARCHAR2,
"
"                     p_res            OUT            VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT (emp_first_name1||' '||emp_middle_name1||' '||emp_last_name1) emp_name
"
"     FROM employees
"
"    WHERE emp_bu = p_bu
"
"      AND emp_emp_id = p_emp_id;
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
"     FROM emp_pyrl_adjustments
"
"    WHERE epadj_bu     = p_bu
"
"      AND epadj_emp_id = p_emp_id
"
"      AND epadj_status = 'N';
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM emp_profiles_hd
"
"    WHERE ephd_bu     = p_bu
"
"      AND ephd_emp_id = p_emp_id
"
"      AND ephd_status IN ('N');
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM employee_leaves
"
"    WHERE empleave_bu     = p_bu
"
"      AND empleave_emp_id = p_emp_id
"
"      AND empleave_type   = 'L'
"
"      AND empleave_status = 'E';
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM emp_ovrt_ln
"
"    WHERE eoln_bu     = p_bu
"
"      AND eoln_emp_id = p_emp_id
"
"      AND eoln_status = 'N';
"
"
"
"   CURSOR c5
"
"       IS
"
"   SELECT *
"
"     FROM payroll_prep_hd
"
"    WHERE pphd_bu     = p_bu
"
"      AND pphd_emp_id = p_emp_id;
"
"
"
"      cr5                    c5%ROWTYPE;
"
"
"
"   CURSOR c6
"
"       IS
"
"   SELECT *
"
"     FROM emp_workday_calendar_zone
"
"    WHERE ewcz_bu     = p_bu
"
"      AND ewcz_emp_id = p_emp_id;
"
"
"
"      cr6                    c6%ROWTYPE;
"
"
"
"   CURSOR c7
"
"       IS
"
"   SELECT *
"
"     FROM emp_loans_request
"
"    WHERE elr_bu     = p_bu
"
"      AND elr_emp_id = p_emp_id
"
"      AND elr_status NOT IN ('J', 'C')
"
"      AND elr_pymnt_status IN ('P');
"
"
"
"  /* CURSOR c8
"
"       IS
"
"   SELECT *
"
"     FROM small_value_assets_issue_vw
"
"    WHERE svaiv_bu        = p_bu
"
"      AND svaiv_iss_to    = p_emp_id
"
"      AND svaiv_ln_status IN ('I');*/
"
"
"
"   CURSOR c9
"
"       IS
"
"   SELECT *
"
"     FROM emp_full_final_hd
"
"    WHERE effhd_bu     = p_bu
"
"      AND effhd_doc_no = p_doc_no;
"
"
"
"      cr9                    c9%ROWTYPE;
"
"
"
"   CURSOR c10(c_date                DATE)
"
"       IS
"
"   SELECT *
"
"     FROM deposits
"
"    WHERE depst_bu         = p_bu
"
"      AND depst_party_id   = p_emp_id
"
"      AND (TRUNC(depst_last_int_accrued_date) <> c_date
"
"       OR depst_last_int_accrued_date IS NULL)
"
"      AND depst_party_type = 'E'
"
"      AND depst_doc_pfx    = 'ED'
"
"      AND depst_status     = 'P';
"
"
"
"   CURSOR c88
"
"       IS
"
"   SELECT COUNT(*) v_excep_cnt
"
"     FROM hrm_full_final_excep
"
"    WHERE hffe_bu     = p_bu
"
"      AND hffe_doc_no = p_doc_no;
"
"
"
"      cr88                    c88%ROWTYPE;
"
"
"
"      v_relieve_date                DATE;
"
"      v_excep_msg                VARCHAR2(4000);
"
"      v_emp_name                VARCHAR2(500);
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 03-mar-2022 : Ajis
"
"
"
"   BEGIN
"
"
"
"      DELETE
"
"        FROM hrm_full_final_excep
"
"       WHERE hffe_bu = p_bu
"
"         AND hffe_doc_no = p_doc_no;
"
"
"
"      v_excep_msg := NULL;
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
"            RAISE_APPLICATION_ERROR(-20821, 'HRM'||p_bu||'~'||p_emp_id);
"
"         ELSE
"
"            v_emp_name := cr0.emp_name;
"
"         END IF;
"
"
"
"      CLOSE c0;
"
"
"
"      OPEN c9;
"
"      FETCH c9 INTO cr9;
"
"
"
"         IF c9%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"            v_relieve_date := TRUNC(cr9.effhd_emp_relieve_date);
"
"         END IF;
"
"
"
"      CLOSE c9;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                               --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu            ,                --hffe_bu
"
"                          p_doc_no        ,                --hffe_doc_no
"
"                          p_emp_id        ,                --hffe_emp_id
"
"                          v_emp_name         ,                --hffe_emp_name
"
"                          'ADJS'        ,                --hffe_sou_doc_type
"
"                          cr1.epadj_adj_no    ,                --hffe_sou_doc_no
"
"                          'Adjustments document need to be Posted.',        --hffe_excep
"
"                          p_user            ,                --hffe_cre_by
"
"                      v_ip_addr        ,                 --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                 --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE            ,                --hffe_cre_date
"
"                                          v_user_emp_id         );                              --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c1;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                               --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu            ,                --hffe_bu
"
"                          p_doc_no        ,                --hffe_doc_no
"
"                          p_emp_id        ,                --hffe_emp_id
"
"                          v_emp_name        ,                --hffe_emp_name
"
"                          'PROF'        ,                --hffe_sou_doc_type
"
"                          cr2.ephd_doc_no    ,                --hffe_sou_doc_no
"
"                          'Employee Profiles need to be Approved.',        --hffe_excep
"
"                          p_user            ,                --hffe_cre_by
"
"                      v_ip_addr        ,                 --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                 --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE            ,                --hffe_cre_date
"
"                          v_user_emp_id         );                              --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c2;
"
"
"
"      FOR cr3 IN c3
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                    --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                    --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                                       --added 03-feb-2022 : Ajis
"
"                       VALUES(p_bu            ,                    --hffe_bu
"
"                          p_doc_no        ,                    --hffe_doc_no
"
"                          p_emp_id        ,                    --hffe_emp_id
"
"                          v_emp_name         ,                    --hffe_emp_name
"
"                          'LEAVE'        ,                    --hffe_sou_doc_type
"
"                          cr3.empleave_doc_no    ,                    --hffe_sou_doc_no
"
"                          'Employee Leaves need to be posted in Leave Register.',    --hffe_excep
"
"                          p_user            ,                    --hffe_cre_by
"
"                      v_ip_addr        ,                     --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                     --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                      SYSDATE            ,                    --hffe_cre_date
"
"                      v_user_emp_id         );                                      --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c3;
"
"
"
"      FOR cr4 IN c4
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                    --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                    --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                                       --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu            ,                    --hffe_bu
"
"                          p_doc_no        ,                    --hffe_doc_no
"
"                          p_emp_id        ,                    --hffe_emp_id
"
"                          v_emp_name         ,                    --hffe_emp_name
"
"                          'OVRT'        ,                    --hffe_sou_doc_type
"
"                          cr4.eoln_doc_no    ,                    --hffe_sou_doc_no
"
"                          'Employee Overtime Adjustments need to be posted.',        --hffe_excep
"
"                          p_user            ,                    --hffe_cre_by
"
"                      v_ip_addr        ,                     --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                     --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE            ,                    --hffe_cre_date
"
"                          v_user_emp_id         );                                      --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c4;
"
"
"
"      FOR cr5 IN c5
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                    --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                    --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                                       --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu            ,                    --hffe_bu
"
"                          p_doc_no        ,                    --hffe_doc_no
"
"                          p_emp_id        ,                    --hffe_emp_id
"
"                          v_emp_name         ,                    --hffe_emp_name
"
"                          'TPYRL'        ,                    --hffe_sou_doc_type
"
"                          NULL            ,                    --hffe_sou_doc_no
"
"                          'Employee be Already Prepared in Termination Payroll.',    --hffe_excep
"
"                          p_user            ,                    --hffe_cre_by
"
"                      v_ip_addr        ,                     --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                     --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE            ,                    --hffe_cre_date
"
"                          v_user_emp_id         );                                      --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c5;
"
"
"
"      OPEN c6;
"
"      FETCH c6 INTO cr6;
"
"
"
"         IF c6%NOTFOUND THEN
"
"
"
"            INSERT INTO hrm_full_final_excep(hffe_bu           ,
"
"                         hffe_doc_no    ,
"
"                         hffe_emp_id    ,
"
"                         hffe_emp_name       ,
"
"                         hffe_sou_doc_type    ,
"
"                         hffe_sou_doc_no      ,
"
"                         hffe_excep           ,
"
"                         hffe_cre_by    ,
"
"                         hffe_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                         hffe_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                             hffe_cre_date    ,
"
"                             hffe_cre_emp_id    )                               --added 03-mar-2022 : Ajis
"
"                      VALUES(p_bu           ,                --hffe_bu
"
"                            p_doc_no           ,                --hffe_doc_no
"
"                         p_emp_id           ,                --hffe_emp_id
"
"                         v_emp_name        ,                --hffe_emp_name
"
"                         'EMPW'           ,                --hffe_sou_doc_type
"
"                         NULL           ,                --hffe_sou_doc_no
"
"                         'Employee Workday Calendar Zone not defined.',    --hffe_excep
"
"                         p_user           ,                --hffe_cre_by
"
"                         v_ip_addr        ,                 --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                         v_os_user        ,                 --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                             SYSDATE            ,                --hffe_cre_date
"
"                             v_user_emp_id      );                              --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"      CLOSE c6;
"
"
"
"      FOR cr7 IN c7
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                               --added 03-mar-2022 : Ajis
"
"                   VALUES(p_bu            ,                --hffe_bu
"
"                          p_doc_no        ,                --hffe_doc_no
"
"                          p_emp_id        ,                --hffe_emp_id
"
"                          v_emp_name         ,                --hffe_emp_name
"
"                          'LOANS'        ,                --hffe_sou_doc_type
"
"                          NULL            ,                --hffe_sou_doc_no
"
"                          'Loan document waiting for Plan creation.',        --hffe_excep
"
"                          p_user            ,                --hffe_cre_by
"
"                      v_ip_addr        ,                 --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                 --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE            ,                --hffe_cre_date
"
"                          v_user_emp_id         );                              --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c7;
"
"
"
"    /*  FOR cr8 IN c8
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                               --added 03-mar-2022 : Ajis
"
"                   VALUES(p_bu            ,                --hffe_bu
"
"                          p_doc_no        ,                --hffe_doc_no
"
"                          p_emp_id        ,                --hffe_emp_id
"
"                          v_emp_name         ,                --hffe_emp_name
"
"                          'ASSET'        ,                --hffe_sou_doc_type
"
"                          cr8.svaiv_doc_no    ,                --hffe_sou_doc_no
"
"                          cr8.svaiv_asset_desc|| ' NEED TO BE RETURN.',        --hffe_excep
"
"                          p_user            ,                --hffe_cre_by
"
"                      v_ip_addr        ,                 --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                 --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE            ,                --hffe_cre_date
"
"                          v_user_emp_id         );                              --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c8;*/
"
"
"
"      FOR cr10 IN c10(v_relieve_date)
"
"      LOOP
"
"
"
"         INSERT INTO hrm_full_final_excep(hffe_bu        ,
"
"                          hffe_doc_no        ,
"
"                          hffe_emp_id        ,
"
"                          hffe_emp_name        ,
"
"                          hffe_sou_doc_type    ,
"
"                          hffe_sou_doc_no    ,
"
"                          hffe_excep        ,
"
"                          hffe_cre_by        ,
"
"                      hffe_cre_ip_addr    ,                    --added 23-jan-2020 : Ajis
"
"                      hffe_cre_os_user    ,                    --added 23-jan-2020 : Ajis
"
"                          hffe_cre_date        ,
"
"                          hffe_cre_emp_id       )                                       --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu            ,                    --hffe_bu
"
"                          p_doc_no        ,                    --hffe_doc_no
"
"                          p_emp_id        ,                    --hffe_emp_id
"
"                          v_emp_name         ,                    --hffe_emp_name
"
"                          'DEP'        ,                        --hffe_sou_doc_type
"
"                          cr10.depst_doc_no    ,                    --hffe_sou_doc_no
"
"                          'Deposit document need to be Recalculate the Interest.',    --hffe_excep
"
"                          p_user            ,                    --hffe_cre_by
"
"                      v_ip_addr        ,                     --hffe_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                      v_os_user        ,                     --hffe_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE            ,                        --hffe_cre_date
"
"                          v_user_emp_id         );                                      --hffe_cre_emp_id               --added 03-mar-2022 : Ajis
"
"
"
"      END LOOP c10;
"
"
"
"      OPEN c88;
"
"      FETCH c88 INTO cr88;
"
"
"
"         IF cr88.v_excep_cnt > 0 THEN
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
"      CLOSE c88;
"
"
"
"   END proc_chk_fnf_pyrl_excep;
"
"
"
"   PROCEDURE proc_calc_imprest_cash(p_bu                    VARCHAR2,
"
"                          p_doc_no                    VARCHAR2,
"
"                          p_emp_id                    VARCHAR2,
"
"                          p_year                    NUMBER,
"
"                       p_user                    VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT budscc_ac_plnt,
"
"          budscc_ac_lvl1,
"
"          budscc_ac_lvl2,
"
"          budscc_ac_lvl3,
"
"          budscc_ac_lvl4,
"
"          budscc_ac_lvl_prj,
"
"          spla_acct budscc_ac_lvl_acct
"
"     FROM suppliers,
"
"          bu_dflt_sc_cc,
"
"          suplr_plant_accts
"
"    WHERE suplr_bu      = budscc_bu
"
"      AND suplr_plant   = budscc_plnt
"
"      AND spla_bu    = suplr_bu
"
"      AND spla_suplr_id = suplr_suplr_id
"
"      AND suplr_bu    = p_bu
"
"      AND suplr_emp_id  = p_emp_id;
"
"
"
"   CURSOR c2(c_plnt                VARCHAR2,
"
"            c_lvl_1                VARCHAR2,
"
"            c_lvl_2                VARCHAR2,
"
"            c_lvl_3                VARCHAR2,
"
"            c_lvl_4                VARCHAR2,
"
"            c_lvl_prj                VARCHAR2,
"
"            c_acct                VARCHAR2)
"
"       IS
"
"   SELECT gacb_curr_bal
"
"     FROM gl_acct_curr_bal_vw
"
"    WHERE gacb_bu      = p_bu
"
"      AND gacb_year    = p_year
"
"      AND gacb_plant   = c_plnt
"
"      AND gacb_lvl1    = c_lvl_1
"
"      AND gacb_lvl2    = c_lvl_2
"
"      AND gacb_lvl3    = c_lvl_3
"
"      AND gacb_lvl4    = c_lvl_4
"
"      AND gacb_lvl_prj = c_lvl_prj
"
"      AND gacb_acct    = c_acct;
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"      v_imprest_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 03-mar-2022 : Ajis
"
"
"
"
"
"   BEGIN
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"         OPEN c2(cr1.budscc_ac_plnt,
"
"               cr1.budscc_ac_lvl1,
"
"               cr1.budscc_ac_lvl2,
"
"               cr1.budscc_ac_lvl3,
"
"               cr1.budscc_ac_lvl4,
"
"               cr1.budscc_ac_lvl_prj,
"
"               cr1.budscc_ac_lvl_acct);
"
"     FETCH c2 INTO cr2;
"
"
"
"        IF c2%FOUND THEN
"
"           v_imprest_amt := v_imprest_amt + NVL(cr2.gacb_curr_bal, 0);
"
"        END IF;
"
"
"
"     CLOSE c2;
"
"
"
"      END LOOP c1;
"
"
"
"      UPDATE emp_full_final_hd
"
"     SET effhd_imprest_amt = NVL(v_imprest_amt, 0),
"
"         effhd_upd_by      = p_user,
"
"         effhd_upd_ip_addr = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"         effhd_upd_os_user = v_os_user,        --added 23-jan-2020 : Ajis
"
"         effhd_upd_date    = SYSDATE,
"
"         effhd_upd_emp_id  = v_user_emp_id               --added 03-mar-2022 : Ajis
"
"       WHERE effhd_bu     = p_bu
"
"     AND effhd_doc_no = p_doc_no;
"
"
"
"   END proc_calc_imprest_cash;
"
"
"
"   PROCEDURE proc_post_fnf_pyrl(p_bu                        VARCHAR2,
"
"                   p_doc_no                    VARCHAR2,
"
"                   p_user                        VARCHAR2,
"
"                   p_res            OUT            VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM emp_full_final_hd
"
"    WHERE effhd_bu     = p_bu
"
"      AND effhd_doc_no = p_doc_no
"
"      AND effhd_status = 'R';
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
"     FROM payroll_control
"
"    WHERE payctrl_bu = p_bu;
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_type                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_elements_hd
"
"    WHERE pehd_bu      =  p_bu
"
"      AND pehd_serv_benft_type = c_type;
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_emp_id                VARCHAR2)
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
"      AND emp_emp_id = c_emp_id;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM emp_full_final_ln,
"
"          payroll_elements_hd
"
"    WHERE effln_bu       = pehd_bu
"
"      AND effln_elmnt_id = pehd_elmnt_id
"
"      AND effln_bu       = p_bu
"
"      AND effln_doc_no   = p_doc_no;
"
"
"
"   CURSOR c5(c_emp_id                VARCHAR2,
"
"         c_adj_no                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_pyrl_adjustments
"
"    WHERE epadj_bu     = p_bu
"
"      AND epadj_emp_id = c_emp_id
"
"      AND epadj_adj_no = c_adj_no;
"
"
"
"      cr5                    c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_doc_no                VARCHAR2)
"
"       IS
"
"   SELECT COUNT(*) v_loan_inst_cnt,
"
"          NVL(SUM(DECODE(eldp_ded_status, 'C', 1, 0)), 0) v_loan_comp_cnt
"
"     FROM emp_loans_ded_plan
"
"    WHERE eldp_bu       = p_bu
"
"      AND eldp_order_no = c_doc_no;
"
"
"
"      cr6                    c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_year                NUMBER,
"
"         c_period                NUMBER,
"
"         c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM pyrl_inter_values
"
"    WHERE piv_bu        = p_bu
"
"      AND piv_year      = c_year
"
"      AND piv_period    = c_period
"
"      AND piv_emp_id    = c_emp_id
"
"      AND piv_pyrl_type = 'T';
"
"
"
"   CURSOR c8(c_year                NUMBER,
"
"          c_period                NUMBER,
"
"          c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM pyrl_inter_logical_values
"
"    WHERE pilv_bu        = p_bu
"
"      AND pilv_year      = c_year
"
"      AND pilv_period    = c_period
"
"      AND pilv_emp_id    = c_emp_id
"
"      AND pilv_pyrl_type = 'T';
"
"
"
"   CURSOR c9
"
"       IS
"
"   SELECT *
"
"     FROM emp_full_final_leave_info
"
"    WHERE effli_bu     = p_bu
"
"      AND effli_doc_no = p_doc_no;
"
"
"
"   CURSOR c10
"
"       IS
"
"   SELECT *
"
"     FROM emp_full_final_leave_det
"
"    WHERE effld_bu     = p_bu
"
"      AND effld_doc_no = p_doc_no;
"
"
"
"   CURSOR c11
"
"       IS
"
"   SELECT NVL(SUM(effln_amount), 0) effln_pf_amount
"
"     FROM emp_full_final_ln,
"
"          payroll_elements_hd
"
"    WHERE effln_bu       = pehd_bu
"
"      AND effln_elmnt_id = pehd_elmnt_id
"
"      AND effln_bu       = p_bu
"
"      AND effln_doc_no   = p_doc_no
"
"      AND effln_mode     = '-'
"
"      AND pehd_type      IN ('CA', 'CA3')
"
"      AND pehd_acct_type IN ('L');
"
"
"
"      cr11                    c11%ROWTYPE;
"
"
"
"   CURSOR c12(c_pyrl_no                VARCHAR2,
"
"          c_proc_batch_no            VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(DECODE (phln_mode, '+', phln_amount, phln_amount * -1)), 0) phhd_net_amt
"
"     FROM payroll_hist_hd,
"
"          payroll_hist_ln
"
"    WHERE phhd_bu                  = phln_bu
"
"      AND phhd_pyrl_no             = phln_pyrl_no
"
"      AND phhd_process_batch_no = phln_process_batch_no
"
"      AND phhd_bu                  = p_bu
"
"      AND phhd_pyrl_no         = c_pyrl_no
"
"      AND phhd_process_batch_no = c_proc_batch_no;
"
"
"
"      cr12                    c12%ROWTYPE;
"
"
"
"   CURSOR c13(c_zone_id                VARCHAR2,
"
"              c_gender                VARCHAR2,
"
"            c_date                DATE)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_elements_hd,
"
"          hrm_pt_tax_slab_hd
"
"    WHERE hptsh_bu     = pehd_bu
"
"      AND hptsh_elmnt_id = pehd_elmnt_id
"
"      AND hptsh_bu       = p_bu
"
"      AND hptsh_zone_id  = c_zone_id
"
"      AND (hptsh_gender  IN ('B') OR hptsh_gender = c_gender)
"
"      AND TRUNC(c_date) BETWEEN TRUNC(hptsh_eff_from) AND TRUNC(hptsh_eff_to)
"
"      AND hptsh_status   IN ('P', 'R');
"
"
"
"      cr13                    c13%ROWTYPE;
"
"
"
"   CURSOR c14(c_year                NUMBER,
"
"             c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_cal_period
"
"    WHERE pcp_bu     = p_bu
"
"      AND pcp_year   = c_year
"
"      AND pcp_period = c_period;
"
"
"
"      cr14                    c14%ROWTYPE;
"
"
"
"      v_proc_batch_no                VARCHAR2(15);
"
"      v_proc_pyrl_no                VARCHAR2(15);
"
"      v_rnd_off                 NUMBER(5);
"
"      v_sal_rnd_ctrl_flag            PAYROLL_CONTROL.PAYCTRL_NET_SAL_ROUND_OFF_FLAG%TYPE;
"
"      v_sal_rnd_ctrl_amt            PAYROLL_CONTROL.PAYCTRL_NET_SAL_ROUND_OFF%TYPE;
"
"      v_min_sal_pct_flag            PAYROLL_CONTROL.PAYCTRL_MIN_NET_SAL_FLAG%TYPE;
"
"      v_min_sal_pct                PAYROLL_CONTROL.PAYCTRL_MIN_PCT%TYPE;
"
"      v_leave_accur_flag            PAYROLL_CONTROL.PAYCTRL_LEAVE_ACCRUAL%TYPE;
"
"      v_ticket_accur_flag             PAYROLL_CONTROL.PAYCTRL_TICKET_ACCRUAL%TYPE;
"
"      v_srvce_bnft_flag               PAYROLL_CONTROL.PAYCTRL_SRVICE_BENEFIT%TYPE;
"
"
"
"      v_fnf_amt                    NUMBER(15, 3) := 0;
"
"      v_net_salary                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_off                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_val                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_off_aft                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_off_bfr                NUMBER(15, 3) := 0;
"
"
"
"      v_gratuity_elmnt                VARCHAR2(10);
"
"      v_leave_encash_elmnt            VARCHAR2(10);
"
"      v_imprest_elmnt                VARCHAR2(10);
"
"      v_emp_pay_elmnt                VARCHAR2(10);
"
"      v_bonus_elmnt                VARCHAR2(10);
"
"      v_vrs_elmnt                VARCHAR2(10);
"
"
"
"      v_gratuity_elmnt_desc            VARCHAR2(200);
"
"      v_leave_encash_elmnt_desc            VARCHAR2(200);
"
"      v_imprest_elmnt_desc            VARCHAR2(200);
"
"      v_emp_pay_elmnt_desc            VARCHAR2(200);
"
"      v_bonus_elmnt_desc            VARCHAR2(200);
"
"      v_vrs_elmnt_desc                VARCHAR2(200);
"
"      v_serv_bnft_doc_no            VARCHAR2(15);
"
"      v_serv_bnft_seq_no            NUMBER(5);
"
"
"
"      v_emp_job_id                VARCHAR2(10);
"
"      v_emp_grade                VARCHAR2(10);
"
"      v_emp_loc_id                VARCHAR2(10);
"
"      v_emp_gender                VARCHAR2(1) := 'M';
"
"      v_emp_zone                VARCHAR2(10);
"
"      v_emp_clndr                VARCHAR2(10);
"
"      v_ect_trans_no                VARCHAR2(15);
"
"      v_serv_bnft_amt                NUMBER(15, 3) := 0;
"
"      v_allow_elmnt_id                VARCHAR2(10);
"
"      v_emp_status                VARCHAR2(1) := 'R';
"
"      v_pt_elmnt_id                VARCHAR2(10);
"
"
"
"      v_start_date                DATE;
"
"      v_end_date                DATE;
"
"
"
"      v_res                    VARCHAR2(1) := 'N';
"
"      v_prj_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"      v_user_emp_id                VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"            v_res := 'N';
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
"                  RAISE_APPLICATION_ERROR(-20985, 'HRM'||p_bu);
"
"               ELSE
"
"                  v_sal_rnd_ctrl_flag := cr1.payctrl_net_sal_round_off_flag;
"
"                  v_sal_rnd_ctrl_amt  := NVL(cr1.payctrl_net_sal_round_off, 0);
"
"                  v_min_sal_pct_flag  := cr1.payctrl_min_net_sal_flag;
"
"                  v_min_sal_pct          := NVL(cr1.payctrl_min_pct, 0);
"
"                  v_leave_accur_flag  := cr1.payctrl_leave_accrual;
"
"                  v_ticket_accur_flag := cr1.payctrl_ticket_accrual;
"
"                  v_srvce_bnft_flag   := cr1.payctrl_srvice_benefit;
"
"               END IF;
"
"
"
"            CLOSE c1;
"
"
"
"            /* Get the Gratuity element from the configuration */
"
"
"
"            IF cr0.effhd_graty_amt > 0 THEN
"
"
"
"               OPEN c2('G');
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF c2%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20100, 'HRM'||' ~ Gratuity (G)');
"
"                  ELSE
"
"                     v_gratuity_elmnt      := cr2.pehd_elmnt_id;
"
"                     v_gratuity_elmnt_desc := cr2.pehd_desc1;
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"            END IF;
"
"
"
"            /* Get the Leave Encash element from the configuration */
"
"
"
"            IF cr0.effhd_leave_encash_amt > 0 THEN
"
"
"
"               OPEN c2('L');
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF c2%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20101, 'HRM'||' ~ Leave Encash (L)');
"
"                  ELSE
"
"                     v_leave_encash_elmnt      := cr2.pehd_elmnt_id;
"
"                     v_leave_encash_elmnt_desc := cr2.pehd_desc1;
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"            END IF;
"
"
"
"            /* Get the Imprest Cash element from the configuration */
"
"
"
"            IF cr0.effhd_imprest_amt > 0 THEN
"
"
"
"               OPEN c2('I');
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF c2%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20102, 'HRM'||' ~ Imprest Cash (I)');
"
"                  ELSE
"
"                     v_imprest_elmnt      := cr2.pehd_elmnt_id;
"
"                     v_imprest_elmnt_desc := cr2.pehd_desc1;
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"            END IF;
"
"
"
"            /* Get the Employee Pay element from the configuration */
"
"
"
"            IF cr0.effhd_emp_pay_amt > 0 THEN
"
"
"
"               OPEN c2('E');
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF c2%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20103, 'HRM'||' ~ Employee Pay (E)');
"
"                  ELSE
"
"                     v_emp_pay_elmnt      := cr2.pehd_elmnt_id;
"
"                     v_emp_pay_elmnt_desc := cr2.pehd_desc1;
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"            END IF;
"
"
"
"            /* Get the Bonus element from the configuration */
"
"
"
"            IF cr0.effhd_bonus_tot_amt > 0 THEN
"
"
"
"               OPEN c2('B');
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF c2%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20104, 'HRM'||' ~ Bonus (B)');
"
"                  ELSE
"
"                     v_bonus_elmnt      := cr2.pehd_elmnt_id;
"
"                     v_bonus_elmnt_desc := cr2.pehd_desc1;
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"            END IF;
"
"
"
"            /* Get the VRS element from the configuration */
"
"
"
"            IF cr0.effhd_vrs_amt > 0 THEN
"
"
"
"               OPEN c2('VS');
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF c2%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20104, 'HRM'||' ~ VRS (VS)');
"
"                  ELSE
"
"                     v_vrs_elmnt      := cr2.pehd_elmnt_id;
"
"                     v_vrs_elmnt_desc := cr2.pehd_desc1;
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"            END IF;
"
"
"
"            OPEN c3(cr0.effhd_emp_id);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20821, 'HRM'||'~'||p_bu||'~'||cr0.effhd_emp_id);
"
"               ELSE
"
"                  v_emp_job_id := cr3.empai_job_id;
"
"                  v_emp_grade  := cr3.empai_grade;
"
"                  v_emp_loc_id := cr3.empai_loc_id;
"
"                  v_emp_gender := cr3.emp_gender;
"
"                  v_emp_zone   := cr3.emp_zone;
"
"                  v_emp_clndr  := cr3.emp_clndr_id;
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            v_serv_bnft_amt := NVL((cr0.effhd_graty_amt + cr0.effhd_leave_encash_amt + cr0.effhd_bonus_tot_amt + cr0.effhd_vrs_amt) - (cr0.effhd_imprest_amt + cr0.effhd_emp_pay_amt), 0);
"
"
"
"            --v_proc_batch_no := func_find_hrm_next_id(p_bu, 'EMP_BATCH_NO');
"
"
"
"            v_proc_batch_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'PBN',p_user);
"
"            v_rnd_off       := NVL(func_find_applctrl_rndoff_dgts(p_bu), 0);
"
"
"
"            /* To generate Serv. Benefits document */
"
"
"
"            IF cr0.effhd_serv_bnft_sep_flag = 'Y' THEN
"
"
"
"               SELECT NVL(MAX(TO_NUMBER(effsbh_doc_no)), 1000000000) + 1
"
"                 INTO v_serv_bnft_doc_no
"
"                 FROM emp_full_final_serv_bnft_hd
"
"                WHERE effsbh_bu = p_bu;
"
"
"
"               INSERT INTO emp_full_final_serv_bnft_hd( effsbh_bu        ,
"
"                            effsbh_doc_no        ,
"
"                            effsbh_doc_date        ,
"
"                            effsbh_emp_id        ,
"
"                            effsbh_emp_name        ,
"
"                            effsbh_pos_id        ,
"
"                            effsbh_pos_desc        ,
"
"                            effsbh_dept_id        ,
"
"                            effsbh_dept_desc    ,
"
"                            effsbh_plnt        ,
"
"                            effsbh_plnt_desc    ,
"
"                            effsbh_group_id        ,
"
"                            effsbh_group_desc    ,
"
"                            effsbh_acct_cat_id    ,
"
"                            effsbh_acct_cat_desc    ,
"
"                            effsbh_reference    ,
"
"                            effsbh_sou_fnf_doc_no    ,
"
"                            effsbh_status        ,
"
"                            effsbh_cre_by        ,
"
"                            effsbh_cre_ip_addr    ,
"
"                            effsbh_cre_os_user    ,
"
"                            effsbh_cre_emp_id    ,
"
"                            effsbh_cre_date        )
"
"                        VALUES( p_bu            ,        --effsbh_bu
"
"                            v_serv_bnft_doc_no    ,        --effsbh_doc_no
"
"                            TRUNC(SYSDATE)        ,        --effsbh_doc_date
"
"                            cr0.effhd_emp_id    ,        --effsbh_emp_id
"
"                            cr0.effhd_emp_name    ,        --effsbh_emp_name
"
"                            cr0.effhd_pos_id    ,        --effsbh_pos_id
"
"                            cr0.effhd_pos_desc    ,        --effsbh_pos_desc
"
"                            cr0.effhd_dept_id    ,        --effsbh_dept_id
"
"                            cr0.effhd_dept_desc    ,        --effsbh_dept_desc
"
"                            cr0.effhd_plnt        ,        --effsbh_plnt
"
"                            cr0.effhd_plnt_desc    ,        --effsbh_plnt_desc
"
"                            cr0.effhd_group_id    ,        --effsbh_group_id
"
"                            cr0.effhd_group_desc    ,        --effsbh_group_desc
"
"                            cr0.effhd_acct_cat_id    ,        --effsbh_acct_cat_id
"
"                            cr0.effhd_acct_cat_desc    ,        --effsbh_acct_cat_desc
"
"                            'SERVICE BENEFITS FROM FNF DOCUMENT.',    --effsbh_reference
"
"                            p_doc_no        ,        --effsbh_sou_fnf_doc_no
"
"                            'N'            ,        --effsbh_status
"
"                            p_user            ,        --effsbh_cre_by
"
"                            v_ip_addr        ,        --effsbh_cre_ip_addr
"
"                            v_os_user        ,        --effsbh_cre_os_user
"
"                            v_user_emp_id        ,        --effsbh_cre_emp_id
"
"                            SYSDATE            );        --effsbh_cre_date
"
"
"
"            END IF;
"
"
"
"            SELECT NVL(MAX(phhd_pyrl_no), 1000000000) + 1
"
"          INTO v_proc_pyrl_no
"
"          FROM payroll_hist_hd
"
"             WHERE phhd_bu = p_bu;
"
"
"
"        INSERT INTO payroll_hist_hd(phhd_bu                       ,
"
"                    phhd_plnt                ,
"
"                    phhd_pyrl_no                ,
"
"                    phhd_process_batch_no            ,
"
"                    phhd_process_date            ,
"
"                    phhd_pyrl_type                ,
"
"                    phhd_clndr_id             ,
"
"                    phhd_year                ,
"
"                    phhd_period                ,
"
"                    phhd_emp_id                ,
"
"                    phhd_emp_name                ,
"
"                    phhd_emp_plnt                ,
"
"                    phhd_dept_id                ,
"
"                    phhd_job_id                ,
"
"                    phhd_pos_id                ,
"
"                    phhd_grade_id                ,
"
"                    phhd_loc_id                ,
"
"                    phhd_emp_group                ,
"
"                    phhd_acct_cat_id            ,
"
"                    phhd_mon_days                ,
"
"                    phhd_workin_days            ,
"
"                    phhd_holidays                ,
"
"                    phhd_off                ,
"
"                    phhd_workoff_holiday            ,
"
"                    phhd_bustrip_days            ,
"
"                    phhd_late_hrs                ,
"
"                    phhd_tot_paid_days            ,
"
"                    phhd_paid_leave_days            ,
"
"                    phhd_unpaid_leave_days            ,
"
"                    phhd_mail_sent                ,
"
"                    phhd_no_mail_sent            ,
"
"                    phhd_cre_by                ,
"
"                    phhd_cre_ip_addr         ,            --added 23-jan-2020 : Ajis
"
"                    phhd_cre_os_user         ,            --added 23-jan-2020 : Ajis
"
"                    phhd_cre_date                ,
"
"                    phhd_cre_emp_id               ,                      --added 03-mar-2022 : Ajis
"
"                    phhd_plnt_loc_id        )
"
"                 VALUES(p_bu                    ,            --phhd_bu
"
"                    cr0.effhd_plnt                ,            --phhd_plnt
"
"                    v_proc_pyrl_no                ,            --phhd_pyrl_no
"
"                    v_proc_batch_no                   ,            --phhd_process_batch_no
"
"                    TRUNC(cr0.effhd_emp_relieve_date),            --phhd_process_date
"
"                    'T'                    ,            --phhd_pyrl_type
"
"                    v_emp_clndr             ,            --phhd_clndr_id
"
"                    cr0.effhd_year                ,            --phhd_year
"
"                    cr0.effhd_period            ,            --phhd_period
"
"                    cr0.effhd_emp_id            ,            --phhd_emp_id
"
"                    cr0.effhd_emp_name            ,            --phhd_emp_name
"
"                    cr0.effhd_plnt                ,            --phhd_emp_plnt
"
"                    cr0.effhd_dept_id            ,            --phhd_dept_id
"
"                    v_emp_job_id                  ,            --phhd_job_id
"
"                    cr0.effhd_pos_id            ,            --phhd_pos_id
"
"                    v_emp_grade                ,            --phhd_grade_id
"
"                    v_emp_loc_id                   ,            --phhd_loc_id
"
"                    cr0.effhd_group_id            ,              --phhd_emp_group
"
"                    cr0.effhd_acct_cat_id            ,            --phhd_acct_cat_id
"
"                    cr0.effhd_mon_days            ,            --phhd_mon_days
"
"                    cr0.effhd_workin_days            ,            --phhd_workin_days
"
"                    cr0.effhd_holidays            ,            --phhd_holidays
"
"                    cr0.effhd_off_days         ,            --phhd_off
"
"                    0                 ,            --phhd_workoff_holiday
"
"                    0                 ,            --phhd_bustrip_days
"
"                    0                      ,            --phhd_late_hrs
"
"                    cr0.effhd_tot_paid_days            ,            --phhd_tot_paid_days
"
"                    cr0.effhd_paid_leave_days        ,            --phhd_paid_leave_days
"
"                    cr0.effhd_unpaid_leave_days      ,            --phhd_unpaid_leave_days
"
"                    'N'                    ,            --phhd_mail_sent
"
"                    0                   ,            --phhd_no_mail_sent
"
"                    p_user                   ,            --phhd_cre_by
"
"                    v_ip_addr             ,             --phhd_cre_ip_addr    --added 23-jan-2020 : Ajis
"
"                    v_os_user             ,             --phhd_cre_os_user    --added 23-jan-2020 : Ajis
"
"                    SYSDATE                      ,            --phhd_cre_date
"
"                    v_user_emp_id               ,        --phhd_cre_emp_id       --added 03-mar-2022 : Ajis
"
"                    v_emp_loc_id        );             --phhd_plnt_loc_id
"
"
"
"         /* Insert Gratuity Amount */
"
"
"
"         IF cr0.effhd_graty_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'N' THEN
"
"
"
"            INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                        phln_plnt          ,
"
"                        phln_pyrl_no               ,
"
"                        phln_process_batch_no     ,
"
"                        phln_emp_plnt               ,
"
"                        phln_elmnt_id               ,
"
"                        phln_elmnt_cat               ,
"
"                        phln_adj_no                ,
"
"                        phln_amount          ,
"
"                        phln_actual_amount      ,
"
"                        phln_mode          ,
"
"                        phln_source          ,
"
"                        phln_doc_no          ,
"
"                        phln_reference               ,
"
"                        phln_cre_by          ,
"
"                    phln_cre_ip_addr      ,                --added 23-jan-2020 : Ajis
"
"                    phln_cre_os_user      ,                --added 23-jan-2020 : Ajis
"
"                        phln_cre_date               ,
"
"                        phln_cre_emp_id           )                             --added 03-mar-2022 : Ajis
"
"                     VALUES(p_bu                   ,                --phln_bu
"
"                        cr0.effhd_plnt               ,                --phln_plnt
"
"                        v_proc_pyrl_no               ,                --phln_pyrl_no
"
"                        v_proc_batch_no               ,                --phln_process_batch_no
"
"                        cr0.effhd_plnt               ,                --phln_emp_plnt
"
"                        v_gratuity_elmnt      ,                --phln_elmnt_id
"
"                        'N'              ,                --phln_elmnt_cat
"
"                        NULL                   ,                --phln_adj_no
"
"                        cr0.effhd_graty_amt      ,                --phln_amount
"
"                        0              ,                --phln_actual_amount
"
"                        '+'                   ,                --phln_mode
"
"                        NULL                   ,                --phln_source
"
"                        NULL                   ,                --phln_doc_no
"
"                        v_gratuity_elmnt||' - '||v_gratuity_elmnt_desc,        --phln_reference
"
"                        p_user                   ,                --phln_cre_by
"
"                    v_ip_addr          ,                 --phln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                    v_os_user          ,                 --phln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE                   ,                --phln_cre_date
"
"                          v_user_emp_id             );                            --phln_cre_emp_idr        --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"         IF cr0.effhd_graty_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'Y' THEN
"
"
"
"            SELECT NVL(MAX(effsbl_seq_no), 0) + 1
"
"              INTO v_serv_bnft_seq_no
"
"              FROM emp_full_final_serv_bnft_ln
"
"             WHERE effsbl_bu = p_bu
"
"               AND effsbl_doc_no = v_serv_bnft_doc_no;
"
"
"
"            INSERT INTO emp_full_final_serv_bnft_ln(effsbl_bu        ,
"
"                            effsbl_doc_no    ,
"
"                            effsbl_seq_no    ,
"
"                            effsbl_elmnt_id    ,
"
"                            effsbl_mode        ,
"
"                            effsbl_amount    ,
"
"                            effsbl_actual_amt    ,
"
"                            effsbl_reference    ,
"
"                            effsbl_cre_by    ,
"
"                            effsbl_cre_ip_addr    ,
"
"                            effsbl_cre_os_user    ,
"
"                            effsbl_cre_emp_id    ,
"
"                            effsbl_cre_date    )
"
"                         VALUES(p_bu        ,                --effsbl_bu
"
"                            v_serv_bnft_doc_no    ,                --effsbl_doc_no
"
"                            v_serv_bnft_seq_no    ,                --effsbl_seq_no
"
"                            v_gratuity_elmnt    ,                --effsbl_elmnt_id
"
"                            '+'            ,                --effsbl_mode
"
"                            cr0.effhd_graty_amt    ,                --effsbl_amount
"
"                            0            ,                --effsbl_actual_amt
"
"                            v_gratuity_elmnt||' - '||v_gratuity_elmnt_desc,    --effsbl_reference
"
"                            p_user        ,                --effsbl_cre_by
"
"                            v_ip_addr        ,                --effsbl_cre_ip_addr
"
"                            v_os_user        ,                --effsbl_cre_os_user
"
"                            v_user_emp_id    ,                --effsbl_cre_emp_id
"
"                            SYSDATE        );                --effsbl_cre_date
"
"
"
"         END IF;
"
"
"
"         /* Insert Leave Encash Amount */
"
"
"
"         IF cr0.effhd_leave_encash_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'N'  THEN
"
"
"
"            INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                        phln_plnt          ,
"
"                        phln_pyrl_no               ,
"
"                        phln_process_batch_no     ,
"
"                        phln_emp_plnt               ,
"
"                        phln_elmnt_id               ,
"
"                        phln_elmnt_cat               ,
"
"                        phln_adj_no                ,
"
"                        phln_amount          ,
"
"                        phln_actual_amount      ,
"
"                        phln_mode          ,
"
"                        phln_source          ,
"
"                        phln_doc_no          ,
"
"                        phln_reference               ,
"
"                        phln_cre_by          ,
"
"                    phln_cre_ip_addr      ,                --added 23-jan-2020 : Ajis
"
"                    phln_cre_os_user      ,                --added 23-jan-2020 : Ajis
"
"                    phln_cre_date               ,
"
"                    phln_cre_emp_id           )                             --added 03-mar-2022 : Ajis
"
"                     VALUES(p_bu                   ,                --phln_bu
"
"                        cr0.effhd_plnt               ,                --phln_plnt
"
"                        v_proc_pyrl_no               ,                --phln_pyrl_no
"
"                        v_proc_batch_no               ,                --phln_process_batch_no
"
"                        cr0.effhd_plnt               ,                --phln_emp_plnt
"
"                        v_leave_encash_elmnt      ,                --phln_elmnt_id
"
"                        'N'              ,                --phln_elmnt_cat
"
"                        NULL                   ,                --phln_adj_no
"
"                        cr0.effhd_leave_encash_amt,                --phln_amount
"
"                        0              ,                --phln_actual_amount
"
"                        '+'                   ,                --phln_mode
"
"                        NULL                   ,                --phln_source
"
"                        NULL                   ,                --phln_doc_no
"
"                        v_leave_encash_elmnt||' - '||v_leave_encash_elmnt_desc,    --phln_reference
"
"                        p_user                   ,                --phln_cre_by
"
"                    v_ip_addr          ,                 --phln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                    v_os_user          ,                 --phln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE                   ,                --phln_cre_date
"
"                          v_user_emp_id             );                            --phln_cre_emp_id           --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"         IF cr0.effhd_leave_encash_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'Y' THEN
"
"
"
"            SELECT NVL(MAX(effsbl_seq_no), 0) + 1
"
"              INTO v_serv_bnft_seq_no
"
"              FROM emp_full_final_serv_bnft_ln
"
"             WHERE effsbl_bu = p_bu
"
"               AND effsbl_doc_no = v_serv_bnft_doc_no;
"
"
"
"            INSERT INTO emp_full_final_serv_bnft_ln(effsbl_bu        ,
"
"                            effsbl_doc_no    ,
"
"                            effsbl_seq_no    ,
"
"                            effsbl_elmnt_id    ,
"
"                            effsbl_mode        ,
"
"                            effsbl_amount    ,
"
"                            effsbl_actual_amt    ,
"
"                            effsbl_reference    ,
"
"                            effsbl_cre_by    ,
"
"                            effsbl_cre_ip_addr    ,
"
"                            effsbl_cre_os_user    ,
"
"                            effsbl_cre_emp_id    ,
"
"                            effsbl_cre_date    )
"
"                         VALUES(p_bu        ,                --effsbl_bu
"
"                            v_serv_bnft_doc_no    ,                --effsbl_doc_no
"
"                            v_serv_bnft_seq_no    ,                --effsbl_seq_no
"
"                            v_leave_encash_elmnt,                --effsbl_elmnt_id
"
"                            '+'            ,                --effsbl_mode
"
"                            cr0.effhd_leave_encash_amt,                --effsbl_amount
"
"                            0            ,                --effsbl_actual_amt
"
"                            v_leave_encash_elmnt||' - '||v_leave_encash_elmnt_desc,    --effsbl_reference
"
"                            p_user        ,                --effsbl_cre_by
"
"                            v_ip_addr        ,                --effsbl_cre_ip_addr
"
"                            v_os_user        ,                --effsbl_cre_os_user
"
"                            v_user_emp_id    ,                --effsbl_cre_emp_id
"
"                            SYSDATE        );                --effsbl_cre_date
"
"
"
"         END IF;
"
"
"
"         /* Insert Impreset cash Amount */
"
"
"
"         IF cr0.effhd_imprest_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'N'  THEN
"
"
"
"            INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                        phln_plnt          ,
"
"                        phln_pyrl_no               ,
"
"                        phln_process_batch_no     ,
"
"                        phln_emp_plnt               ,
"
"                        phln_elmnt_id               ,
"
"                        phln_elmnt_cat               ,
"
"                        phln_adj_no                ,
"
"                        phln_amount          ,
"
"                        phln_actual_amount      ,
"
"                        phln_mode          ,
"
"                        phln_source          ,
"
"                        phln_doc_no          ,
"
"                        phln_reference               ,
"
"                        phln_cre_by          ,
"
"                    phln_cre_ip_addr      ,                --added 23-jan-2020 : Ajis
"
"                    phln_cre_os_user      ,                --added 23-jan-2020 : Ajis
"
"                        phln_cre_date               ,
"
"                        phln_cre_emp_id           )                             --added 03-mar-2022 : Ajis
"
"                     VALUES(p_bu                   ,                --phln_bu
"
"                        cr0.effhd_plnt               ,                --phln_plnt
"
"                        v_proc_pyrl_no               ,                --phln_pyrl_no
"
"                        v_proc_batch_no               ,                --phln_process_batch_no
"
"                        cr0.effhd_plnt               ,                --phln_emp_plnt
"
"                        v_imprest_elmnt            ,                --phln_elmnt_id
"
"                        'N'              ,                --phln_elmnt_cat
"
"                        NULL                   ,                --phln_adj_no
"
"                        cr0.effhd_imprest_amt      ,                --phln_amount
"
"                        0              ,                --phln_actual_amount
"
"                        '-'                   ,                --phln_mode
"
"                        NULL                   ,                --phln_source
"
"                        NULL                   ,                --phln_doc_no
"
"                        v_imprest_elmnt||' - '||v_imprest_elmnt_desc,        --phln_reference
"
"                        p_user                   ,                --phln_cre_by
"
"                    v_ip_addr          ,                 --phln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                    v_os_user          ,                 --phln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE                   ,                --phln_cre_date
"
"                          v_user_emp_id             );                            --phln_cre_emp_id           --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"         IF cr0.effhd_imprest_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'Y' THEN
"
"
"
"            SELECT NVL(MAX(effsbl_seq_no), 0) + 1
"
"              INTO v_serv_bnft_seq_no
"
"              FROM emp_full_final_serv_bnft_ln
"
"             WHERE effsbl_bu = p_bu
"
"               AND effsbl_doc_no = v_serv_bnft_doc_no;
"
"
"
"            INSERT INTO emp_full_final_serv_bnft_ln(effsbl_bu        ,
"
"                            effsbl_doc_no    ,
"
"                            effsbl_seq_no    ,
"
"                            effsbl_elmnt_id    ,
"
"                            effsbl_mode        ,
"
"                            effsbl_amount    ,
"
"                            effsbl_actual_amt    ,
"
"                            effsbl_reference    ,
"
"                            effsbl_cre_by    ,
"
"                            effsbl_cre_ip_addr    ,
"
"                            effsbl_cre_os_user    ,
"
"                            effsbl_cre_emp_id    ,
"
"                            effsbl_cre_date    )
"
"                         VALUES(p_bu        ,                --effsbl_bu
"
"                            v_serv_bnft_doc_no    ,                --effsbl_doc_no
"
"                            v_serv_bnft_seq_no    ,                --effsbl_seq_no
"
"                            v_imprest_elmnt    ,                --effsbl_elmnt_id
"
"                            '-'            ,                --effsbl_mode
"
"                            cr0.effhd_imprest_amt,                --effsbl_amount
"
"                            0            ,                --effsbl_actual_amt
"
"                            v_imprest_elmnt||' - '||v_imprest_elmnt_desc,    --effsbl_reference
"
"                            p_user        ,                --effsbl_cre_by
"
"                            v_ip_addr        ,                --effsbl_cre_ip_addr
"
"                            v_os_user        ,                --effsbl_cre_os_user
"
"                            v_user_emp_id    ,                --effsbl_cre_emp_id
"
"                            SYSDATE        );                --effsbl_cre_date
"
"
"
"         END IF;
"
"
"
"         /* Insert Employee Payabale Amount */
"
"
"
"         IF cr0.effhd_emp_pay_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'N'  THEN
"
"
"
"            INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                        phln_plnt          ,
"
"                        phln_pyrl_no               ,
"
"                        phln_process_batch_no     ,
"
"                        phln_emp_plnt               ,
"
"                        phln_elmnt_id               ,
"
"                        phln_elmnt_cat               ,
"
"                        phln_adj_no                ,
"
"                        phln_amount          ,
"
"                        phln_actual_amount      ,
"
"                        phln_mode          ,
"
"                        phln_source          ,
"
"                        phln_doc_no          ,
"
"                        phln_reference               ,
"
"                        phln_cre_by          ,
"
"                    phln_cre_ip_addr      ,                --added 23-jan-2020 : Ajis
"
"                    phln_cre_os_user      ,                --added 23-jan-2020 : Ajis
"
"                        phln_cre_date               ,
"
"                        phln_cre_emp_id           )                             --added 03-mar-2022 : Ajis
"
"                     VALUES(p_bu                   ,                --phln_bu
"
"                        cr0.effhd_plnt               ,                --phln_plnt
"
"                        v_proc_pyrl_no               ,                --phln_pyrl_no
"
"                        v_proc_batch_no               ,                --phln_process_batch_no
"
"                        cr0.effhd_plnt               ,                --phln_emp_plnt
"
"                        v_emp_pay_elmnt            ,                --phln_elmnt_id
"
"                        'N'              ,                --phln_elmnt_cat
"
"                        NULL                   ,                --phln_adj_no
"
"                        cr0.effhd_emp_pay_amt       ,                --phln_amount
"
"                        0              ,                --phln_actual_amount
"
"                        '-'                   ,                --phln_mode
"
"                        NULL                   ,                --phln_source
"
"                        NULL                   ,                --phln_doc_no
"
"                        v_emp_pay_elmnt||' - '||v_emp_pay_elmnt_desc,        --phln_reference
"
"                        p_user                   ,                --phln_cre_by
"
"                    v_ip_addr          ,                 --phln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                    v_os_user          ,                 --phln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE                   ,                --phln_cre_date
"
"                          v_user_emp_id             );                            --phln_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"         IF cr0.effhd_emp_pay_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'Y' THEN
"
"
"
"            SELECT NVL(MAX(effsbl_seq_no), 0) + 1
"
"              INTO v_serv_bnft_seq_no
"
"              FROM emp_full_final_serv_bnft_ln
"
"             WHERE effsbl_bu = p_bu
"
"               AND effsbl_doc_no = v_serv_bnft_doc_no;
"
"
"
"            INSERT INTO emp_full_final_serv_bnft_ln(effsbl_bu        ,
"
"                            effsbl_doc_no    ,
"
"                            effsbl_seq_no    ,
"
"                            effsbl_elmnt_id    ,
"
"                            effsbl_mode        ,
"
"                            effsbl_amount    ,
"
"                            effsbl_actual_amt    ,
"
"                            effsbl_reference    ,
"
"                            effsbl_cre_by    ,
"
"                            effsbl_cre_ip_addr    ,
"
"                            effsbl_cre_os_user    ,
"
"                            effsbl_cre_emp_id    ,
"
"                            effsbl_cre_date    )
"
"                         VALUES(p_bu        ,                --effsbl_bu
"
"                            v_serv_bnft_doc_no    ,                --effsbl_doc_no
"
"                            v_serv_bnft_seq_no    ,                --effsbl_seq_no
"
"                            v_emp_pay_elmnt    ,                --effsbl_elmnt_id
"
"                            '-'            ,                --effsbl_mode
"
"                            cr0.effhd_emp_pay_amt,                --effsbl_amount
"
"                            0            ,                --effsbl_actual_amt
"
"                            v_emp_pay_elmnt||' - '||v_emp_pay_elmnt_desc,    --effsbl_reference
"
"                            p_user        ,                --effsbl_cre_by
"
"                            v_ip_addr        ,                --effsbl_cre_ip_addr
"
"                            v_os_user        ,                --effsbl_cre_os_user
"
"                            v_user_emp_id    ,                --effsbl_cre_emp_id
"
"                            SYSDATE        );                --effsbl_cre_date
"
"
"
"         END IF;
"
"
"
"         /* Insert Bonus + Exgratia Amount */
"
"
"
"         IF cr0.effhd_bonus_tot_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'N'  THEN
"
"
"
"            INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                        phln_plnt          ,
"
"                        phln_pyrl_no               ,
"
"                        phln_process_batch_no     ,
"
"                        phln_emp_plnt               ,
"
"                        phln_elmnt_id               ,
"
"                        phln_elmnt_cat               ,
"
"                        phln_adj_no                ,
"
"                        phln_amount          ,
"
"                        phln_actual_amount      ,
"
"                        phln_mode          ,
"
"                        phln_source          ,
"
"                        phln_doc_no          ,
"
"                        phln_reference               ,
"
"                        phln_cre_by          ,
"
"                    phln_cre_ip_addr      ,                --added 23-jan-2020 : Ajis
"
"                    phln_cre_os_user      ,                --added 23-jan-2020 : Ajis
"
"                        phln_cre_date               ,
"
"                        phln_cre_emp_id           )                             --added 03-mar-2022 : Ajis
"
"                     VALUES(p_bu                   ,                --phln_bu
"
"                        cr0.effhd_plnt               ,                --phln_plnt
"
"                        v_proc_pyrl_no               ,                --phln_pyrl_no
"
"                        v_proc_batch_no               ,                --phln_process_batch_no
"
"                        cr0.effhd_plnt               ,                --phln_emp_plnt
"
"                        v_bonus_elmnt            ,                --phln_elmnt_id
"
"                        'N'              ,                --phln_elmnt_cat
"
"                        NULL                   ,                --phln_adj_no
"
"                        cr0.effhd_bonus_tot_amt      ,                --phln_amount
"
"                        0              ,                --phln_actual_amount
"
"                        '+'                   ,                --phln_mode
"
"                        NULL                   ,                --phln_source
"
"                        NULL                   ,                --phln_doc_no
"
"                        v_bonus_elmnt||' - '||v_bonus_elmnt_desc,        --phln_reference
"
"                        p_user                   ,                --phln_cre_by
"
"                    v_ip_addr          ,                 --phln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                    v_os_user          ,                 --phln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE                   ,                --phln_cre_date
"
"                          v_user_emp_id             );                            --phln_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"         IF cr0.effhd_bonus_tot_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'Y' THEN
"
"
"
"            SELECT NVL(MAX(effsbl_seq_no), 0) + 1
"
"              INTO v_serv_bnft_seq_no
"
"              FROM emp_full_final_serv_bnft_ln
"
"             WHERE effsbl_bu = p_bu
"
"               AND effsbl_doc_no = v_serv_bnft_doc_no;
"
"
"
"            INSERT INTO emp_full_final_serv_bnft_ln(effsbl_bu        ,
"
"                            effsbl_doc_no    ,
"
"                            effsbl_seq_no    ,
"
"                            effsbl_elmnt_id    ,
"
"                            effsbl_mode        ,
"
"                            effsbl_amount    ,
"
"                            effsbl_actual_amt    ,
"
"                            effsbl_reference    ,
"
"                            effsbl_cre_by    ,
"
"                            effsbl_cre_ip_addr    ,
"
"                            effsbl_cre_os_user    ,
"
"                            effsbl_cre_emp_id    ,
"
"                            effsbl_cre_date    )
"
"                         VALUES(p_bu        ,                --effsbl_bu
"
"                            v_serv_bnft_doc_no    ,                --effsbl_doc_no
"
"                            v_serv_bnft_seq_no    ,                --effsbl_seq_no
"
"                            v_bonus_elmnt    ,                --effsbl_elmnt_id
"
"                            '+'            ,                --effsbl_mode
"
"                            cr0.effhd_bonus_tot_amt,                --effsbl_amount
"
"                            0            ,                --effsbl_actual_amt
"
"                            v_bonus_elmnt||' - '||v_bonus_elmnt_desc,        --effsbl_reference
"
"                            p_user        ,                --effsbl_cre_by
"
"                            v_ip_addr        ,                --effsbl_cre_ip_addr
"
"                            v_os_user        ,                --effsbl_cre_os_user
"
"                            v_user_emp_id    ,                --effsbl_cre_emp_id
"
"                            SYSDATE        );                --effsbl_cre_date
"
"
"
"         END IF;
"
"
"
"         /* Insert Employee VRS Amount */
"
"
"
"         IF cr0.effhd_vrs_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'N'  THEN
"
"
"
"            INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                        phln_plnt          ,
"
"                        phln_pyrl_no               ,
"
"                        phln_process_batch_no     ,
"
"                        phln_emp_plnt               ,
"
"                        phln_elmnt_id               ,
"
"                        phln_elmnt_cat               ,
"
"                        phln_adj_no                ,
"
"                        phln_amount          ,
"
"                        phln_actual_amount      ,
"
"                        phln_mode          ,
"
"                        phln_source          ,
"
"                        phln_doc_no          ,
"
"                        phln_reference               ,
"
"                        phln_cre_by          ,
"
"                    phln_cre_ip_addr      ,                --added 23-jan-2020 : Ajis
"
"                    phln_cre_os_user      ,                --added 23-jan-2020 : Ajis
"
"                        phln_cre_date               ,
"
"                        phln_cre_emp_id           )                             --added 03-mar-2022 : Ajis
"
"                     VALUES(p_bu                   ,                --phln_bu
"
"                        cr0.effhd_plnt               ,                --phln_plnt
"
"                        v_proc_pyrl_no               ,                --phln_pyrl_no
"
"                        v_proc_batch_no               ,                --phln_process_batch_no
"
"                        cr0.effhd_plnt               ,                --phln_emp_plnt
"
"                        v_vrs_elmnt            ,                --phln_elmnt_id
"
"                        'N'              ,                --phln_elmnt_cat
"
"                        NULL                   ,                --phln_adj_no
"
"                        cr0.effhd_vrs_amt      ,                --phln_amount
"
"                        0              ,                --phln_actual_amount
"
"                        '+'                   ,                --phln_mode
"
"                        NULL                   ,                --phln_source
"
"                        NULL                   ,                --phln_doc_no
"
"                        v_vrs_elmnt||' - '||v_vrs_elmnt_desc,            --phln_reference
"
"                        p_user                   ,                --phln_cre_by
"
"                    v_ip_addr          ,                 --phln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                    v_os_user          ,                 --phln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE                   ,                --phln_cre_date
"
"                          v_user_emp_id             );                            --phln_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"         IF cr0.effhd_vrs_amt > 0 AND cr0.effhd_serv_bnft_sep_flag = 'Y' THEN
"
"
"
"            SELECT NVL(MAX(effsbl_seq_no), 0) + 1
"
"              INTO v_serv_bnft_seq_no
"
"              FROM emp_full_final_serv_bnft_ln
"
"             WHERE effsbl_bu = p_bu
"
"               AND effsbl_doc_no = v_serv_bnft_doc_no;
"
"
"
"            INSERT INTO emp_full_final_serv_bnft_ln(effsbl_bu        ,
"
"                            effsbl_doc_no    ,
"
"                            effsbl_seq_no    ,
"
"                            effsbl_elmnt_id    ,
"
"                            effsbl_mode        ,
"
"                            effsbl_amount    ,
"
"                            effsbl_actual_amt    ,
"
"                            effsbl_reference    ,
"
"                            effsbl_cre_by    ,
"
"                            effsbl_cre_ip_addr    ,
"
"                            effsbl_cre_os_user    ,
"
"                            effsbl_cre_emp_id    ,
"
"                            effsbl_cre_date    )
"
"                         VALUES(p_bu        ,                --effsbl_bu
"
"                            v_serv_bnft_doc_no    ,                --effsbl_doc_no
"
"                            v_serv_bnft_seq_no    ,                --effsbl_seq_no
"
"                            v_vrs_elmnt        ,                --effsbl_elmnt_id
"
"                            '+'            ,                --effsbl_mode
"
"                            cr0.effhd_vrs_amt    ,                --effsbl_amount
"
"                            0            ,                --effsbl_actual_amt
"
"                            v_vrs_elmnt||' - '||v_vrs_elmnt_desc,        --effsbl_reference
"
"                            p_user        ,                --effsbl_cre_by
"
"                            v_ip_addr        ,                --effsbl_cre_ip_addr
"
"                            v_os_user        ,                --effsbl_cre_os_user
"
"                            v_user_emp_id    ,                --effsbl_cre_emp_id
"
"                            SYSDATE        );                --effsbl_cre_date
"
"
"
"         END IF;
"
"
"
"            /* Find PT Tax Element and Tax deduction Type */
"
"
"
"            OPEN c13(v_emp_zone, v_emp_gender, TRUNC(cr0.effhd_date_to));
"
"            FETCH c13 INTO cr13;
"
"
"
"               IF c13%NOTFOUND THEN
"
"                  v_pt_elmnt_id := NULL;
"
"               ELSE
"
"                v_pt_elmnt_id := cr13.hptsh_elmnt_id;
"
"               END IF;
"
"
"
"            CLOSE c13;
"
"
"
"            /* Insert Payroll line details */
"
"
"
"            FOR cr4 IN c4
"
"            LOOP
"
"
"
"               INSERT INTO payroll_hist_ln(phln_bu             ,
"
"                       phln_plnt             ,
"
"                       phln_pyrl_no                 ,
"
"                       phln_process_batch_no     ,
"
"                       phln_emp_plnt         ,
"
"                       phln_elmnt_id         ,
"
"                       phln_elmnt_cat         ,
"
"                       phln_adj_no              ,
"
"                       phln_amount             ,
"
"                       phln_actual_amount         ,
"
"                       phln_mode             ,
"
"                       phln_source             ,
"
"                       phln_doc_no             ,
"
"                       phln_reference         ,
"
"                       phln_cre_by             ,
"
"                       phln_cre_ip_addr         ,            --added 23-jan-2020 : Ajis
"
"                       phln_cre_os_user         ,            --added 23-jan-2020 : Ajis
"
"                       phln_cre_date         ,
"
"                       phln_cre_emp_id           )                  --added 03-mar-2022 : Ajis
"
"                    VALUES(p_bu                      ,            --phln_bu
"
"                       cr0.effhd_plnt         ,            --phln_plnt
"
"                       v_proc_pyrl_no         ,            --phln_pyrl_no
"
"                       v_proc_batch_no         ,            --phln_process_batch_no
"
"                       cr0.effhd_plnt         ,            --phln_emp_plnt
"
"                       cr4.effln_elmnt_id         ,            --phln_elmnt_id
"
"                       'N'                   ,            --phln_elmnt_cat
"
"                       cr4.effln_adj_no         ,            --phln_adj_no
"
"                       cr4.effln_amount         ,            --ROUND(cr4.ppln_amount, v_ctrl_rnd_off),    --phln_amount
"
"                       cr4.effln_actual_amt      ,            --phln_actual_amount
"
"                       cr4.effln_mode         ,            --phln_mode
"
"                       cr4.effln_source         ,            --phln_source
"
"                       cr4.effln_sou_doc_no         ,            --phln_doc_no
"
"                       cr4.effln_reference         ,            --phln_reference
"
"                       p_user             ,            --phln_cre_by
"
"                       v_ip_addr             ,             --phln_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                       v_os_user             ,             --phln_cre_os_user        --added 23-jan-2020 : Ajis
"
"                       SYSDATE             ,            --phln_cre_date
"
"                       v_user_emp_id             );                 --phln_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"           IF cr4.effln_source = 'LOANS' AND cr4.effln_adj_no IS NOT NULL THEN
"
"
"
"          OPEN c5(cr0.effhd_emp_id, cr4.effln_adj_no);
"
"          FETCH c5 INTO cr5;
"
"
"
"             IF c5%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20026, 'HRM'||p_bu||'~'||cr0.effhd_emp_id||'~'||cr4.effln_adj_no);
"
"             ELSE
"
"
"
"            IF cr4.effln_mode = '-' THEN
"
"
"
"               INSERT INTO emp_loans_ded_details(eldd_bu        ,
"
"                                       eldd_plnt        ,
"
"                                     eldd_order_no    ,
"
"                                       eldd_ded_year    ,
"
"                                       eldd_ded_period    ,
"
"                                       eldd_ded_amt    ,
"
"                                       eldd_adj_no    ,
"
"                                       eldd_payroll_no    ,
"
"                                       eldd_cre_by    ,
"
"                                 eldd_cre_ip_addr   ,        --added 23-jan-2020 : Ajis
"
"                                 eldd_cre_os_user   ,        --added 23-jan-2020 : Ajis
"
"                                       eldd_cre_date    ,
"
"                                       eldd_cre_emp_id    )               --added 03-mar-2022 : Ajis
"
"                                  VALUES(p_bu        ,        --eldd_bu
"
"                                     NULL        ,        --eldd_plnt
"
"                                     cr5.epadj_doc_no    ,        --eldd_order_no
"
"                                     cr0.effhd_year    ,        --eldd_ded_year
"
"                                     cr0.effhd_period    ,        --eldd_ded_period
"
"                                     cr4.effln_amount    ,        --eldd_ded_amt
"
"                                     cr4.effln_adj_no    ,        --eldd_adj_no
"
"                                     v_proc_pyrl_no    ,        --eldd_payroll_no
"
"                                     p_user        ,        --eldd_cre_by
"
"                                     v_ip_addr        ,         --eldd_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                                 v_os_user        ,         --eldd_cre_os_user        --added 23-jan-2020 : Ajis
"
"                                     SYSDATE        ,        --eldd_cre_date
"
"                                     v_user_emp_id      );              --eldd_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"               SELECT NVL(MAX(TO_NUMBER(ect_trans_no)), 0) + 1
"
"                 INTO v_ect_trans_no
"
"                 FROM emp_ca_trans
"
"                WHERE ect_bu = p_bu;
"
"
"
"               INSERT INTO emp_ca_trans(ect_bu                 ,
"
"                            ect_trans_no             ,
"
"                            ect_trans_date             ,
"
"                            ect_year                 ,
"
"                            ect_period                 ,
"
"                            ect_emp_id                 ,
"
"                            ect_elmnt_id             ,
"
"                            ect_mode                     ,
"
"                            ect_ref1                     ,
"
"                            ect_ref2                     ,
"
"                            ect_pay_doc_no              ,
"
"                            ect_pyrl_doc_no             ,
"
"                            ect_doc_amt                      ,
"
"                            ect_bal_amt                     ,
"
"                            ect_source                 ,
"
"                            ect_status                 ,
"
"                            ect_check_flag             ,
"
"                            ect_proc_amt             ,
"
"                            ect_inprog_amt             ,
"
"                            ect_type                 ,
"
"                            ect_cre_by                 ,
"
"                            ect_cre_ip_addr        ,            --added 23-jan-2020 : Ajis
"
"                            ect_cre_os_user        ,            --added 23-jan-2020 : Ajis
"
"                            ect_cre_date             ,
"
"                            ect_cre_emp_id        ,            --added 03-mar-2022 : Ajis
"
"                            ect_process_batch_no         ,
"
"                            ect_pay_mode             ,
"
"                            ect_sou_vou_type             ,
"
"                            ect_sou_vou_pfx             ,
"
"                            ect_sou_vou_no             )
"
"                         VALUES(p_bu                  ,            --ect_bu
"
"                            v_ect_trans_no             ,            --ect_trans_no
"
"                            TRUNC(cr0.effhd_emp_relieve_date),            --ect_trans_date
"
"                            cr0.effhd_year             ,            --ect_year
"
"                            cr0.effhd_period             ,            --ect_period
"
"                            cr0.effhd_emp_id              ,            --ect_emp_id
"
"                            cr4.effln_elmnt_id             ,            --ect_elmnt_id
"
"                            'L'                          ,            --ect_mode
"
"                            'SYSTEM GENERATE - EMPLOYEE LOAN PAYABLES',        --ect_ref1
"
"                            'SYSTEM GENERATE - EMPLOYEE LOAN PAYABLES',        --ect_ref2
"
"                            NULL                 ,            --ect_pay_doc_no
"
"                            NULL                 ,            --ect_pyrl_doc_no
"
"                            cr4.effln_amount             ,            --ect_doc_amt
"
"                            cr4.effln_amount             ,            --ect_bal_amt
"
"                            'S'                          ,            --ect_source
"
"                            'P'                          ,            --ect_status
"
"                            'N'                          ,            --ect_check_flag
"
"                            0                     ,            --ect_proc_amt
"
"                            cr4.effln_amount             ,            --ect_inprog_amt
"
"                            'B'                          ,            --ect_type
"
"                            p_user                 ,            --ect_cre_by
"
"                            v_ip_addr            ,             --ect_cre_ip_addr    --added 23-jan-2020 : Ajis
"
"                            v_os_user            ,             --ect_cre_os_user    --added 23-jan-2020 : Ajis
"
"                            SYSDATE                  ,            --ect_cre_date
"
"                            v_user_emp_id               ,                       --ect_cre_emp_id        --added 03-mar-2022 : Ajis
"
"                            NULL                 ,            --ect_process_batch_no
"
"                            'P'                          ,            --ect_pay_mode
"
"                            'PYM'                 ,            --ect_sou_vou_type
"
"                            NULL                 ,            --ect_sou_vou_pfx
"
"                            v_proc_pyrl_no             );            --ect_sou_vou_no
"
"
"
"               UPDATE emp_loans_ded_plan
"
"                  SET eldp_ded_status   = 'C',
"
"                  eldp_upd_by       = p_user,
"
"                  eldp_upd_ip_addr  = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"                  eldp_upd_os_user  = v_os_user,        --added 23-jan-2020 : Ajis
"
"                  eldp_upd_date     = SYSDATE,
"
"                  eldp_upd_emp_id   = v_user_emp_id             --added 03-mar-2022 : Ajis
"
"                WHERE eldp_bu         = p_bu
"
"                  AND eldp_adj_no     = cr4.effln_adj_no
"
"                  AND eldp_order_no   = cr5.epadj_doc_no
"
"                  AND eldp_ded_status = 'I';
"
"
"
"               IF SQL%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20834, 'HRM'||p_bu||'~'||cr5.epadj_doc_no||'~'||cr4.effln_adj_no);
"
"               END IF;
"
"
"
"               UPDATE emp_loans_request
"
"                  SET elr_rtnd_amt        = elr_rtnd_amt + cr4.effln_amount,
"
"                     elr_upd_by       = p_user,
"
"                     elr_upd_ip_addr  = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"                  elr_upd_os_user  = v_os_user,            --added 23-jan-2020 : Ajis
"
"                  elr_upd_date     = SYSDATE,
"
"                  elr_upd_emp_id   = v_user_emp_id              --added 03-mar-2022 : Ajis
"
"                WHERE elr_bu       = p_bu
"
"                  AND elr_rqst_no  = cr5.epadj_doc_no;
"
"
"
"               IF SQL%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20834, 'HRM'||p_bu||'~'||cr5.epadj_doc_no);
"
"               END IF;
"
"
"
"               OPEN c6(cr5.epadj_doc_no);
"
"               FETCH c6 INTO cr6;
"
"
"
"                  IF c6%FOUND THEN
"
"
"
"                 IF cr6.v_loan_inst_cnt = cr6.v_loan_comp_cnt THEN
"
"
"
"                    UPDATE emp_loans_request
"
"                       SET elr_status       = 'R',
"
"                       elr_upd_by       = p_user,
"
"                            elr_upd_ip_addr  = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"                         elr_upd_os_user  = v_os_user,            --added 23-jan-2020 : Ajis
"
"                       elr_upd_date     = SYSDATE,
"
"                       elr_upd_emp_id   = v_user_emp_id            --added 03-mar-2022 : Ajis
"
"                     WHERE elr_bu       = p_bu
"
"                       AND elr_rqst_no  = cr5.epadj_doc_no;
"
"
"
"                 END IF;
"
"
"
"                   END IF;
"
"
"
"               CLOSE c6;
"
"
"
"            END IF;        --cr4.effln_mode = '-'
"
"
"
"             END IF;        --c5%NOTFOUND
"
"
"
"          CLOSE c5;
"
"
"
"           END IF;            --cr4.effln_source = 'LOANS'
"
"
"
"           IF cr4.effln_adj_no IS NOT NULL THEN
"
"
"
"          /*     FA  - Fixed Adjustment
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
"              IF cr4.pehd_type IN ('FA', 'VA', 'CA', 'RCA', '3RD', 'CA3', 'RC3', 'TDE') THEN
"
"
"
"             UPDATE emp_pyrl_adjustments
"
"            SET epadj_rmng_period      = 0,
"
"                epadj_last_proc_year   = cr0.effhd_year,
"
"                epadj_last_proc_period = cr0.effhd_period,
"
"                epadj_accm_amt         = (NVL(epadj_accm_amt, 0) + cr4.effln_amount),
"
"                epadj_upd_by       = p_user,
"
"                epadj_upd_ip_addr      = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"                epadj_upd_os_user      = v_os_user,            --added 23-jan-2020 : Ajis
"
"                epadj_upd_date       = SYSDATE,
"
"                epadj_upd_emp_id       = v_user_emp_id        --added 03-mar-2022 : Ajis
"
"              WHERE epadj_bu          = p_bu
"
"            AND epadj_emp_id      = cr0.effhd_emp_id
"
"            AND epadj_adj_no      = cr4.effln_adj_no
"
"            AND epadj_is_definite = 'Y';
"
"
"
"             UPDATE emp_pyrl_adjustments
"
"            SET epadj_last_proc_year   = cr0.effhd_year,
"
"                epadj_last_proc_period = cr0.effhd_period,
"
"                epadj_accm_amt         = (NVL(epadj_accm_amt, 0) + cr4.effln_amount),
"
"                epadj_upd_by       = p_user,
"
"                epadj_upd_ip_addr      = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"                epadj_upd_os_user      = v_os_user,            --added 23-jan-2020 : Ajis
"
"                epadj_upd_date       = SYSDATE,
"
"                epadj_upd_emp_id        = v_user_emp_id        --added 03-mar-2022 : Ajis
"
"              WHERE epadj_bu          = p_bu
"
"            AND epadj_emp_id      = cr0.effhd_emp_id
"
"            AND epadj_adj_no      = cr4.effln_adj_no
"
"            AND epadj_is_definite = 'N';
"
"
"
"          END IF;    --cr4.pehd_type IN ('FA', 'VA', 'CA', 'RCA', '3RD', 'CA3', 'RC3', 'TDE')
"
"
"
"           END IF;        --cr4.effln_adj_no IS NOT NULL
"
"
"
"           IF cr4.pehd_type IN ('FL', 'VL') THEN
"
"
"
"          UPDATE emp_pyrl_allowances
"
"             SET epa_last_proc_year   = cr0.effhd_year,
"
"             epa_last_proc_period = cr0.effhd_period,
"
"             epa_upd_option       = 'C',
"
"             epa_upd_by          = p_user,
"
"             epa_upd_ip_addr      = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"             epa_upd_os_user      = v_os_user,            --added 23-jan-2020 : Ajis
"
"             epa_upd_date          = SYSDATE,
"
"             epa_upd_emp_id       = v_user_emp_id                --added 03-mar-2022 : Ajis
"
"           WHERE epa_bu       = p_bu
"
"              AND epa_elmnt_id = cr4.effln_elmnt_id
"
"             AND epa_emp_id   = cr0.effhd_emp_id;
"
"
"
"           END IF;        --cr4.pehd_type IN ('FL', 'VL')
"
"
"
"           /* Update PT Tax Last Proc. Year/Period */
"
"
"
"           IF v_pt_elmnt_id = cr4.effln_elmnt_id AND cr4.effln_source IS NULL AND cr4.effln_adj_no IS NULL AND cr4.effln_mode = '-' THEN
"
"
"
"          UPDATE hrm_emp_pt_elgbl
"
"             SET hepe_last_proc_year   = cr0.effhd_year,
"
"             hepe_last_proc_period = cr0.effhd_period,
"
"             hepe_last_proc_amt    = hepe_last_proc_amt + cr4.effln_amount,
"
"             hepe_upd_by             = p_user,
"
"             hepe_upd_ip_addr      = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"             hepe_upd_os_user      = v_os_user,            --added 23-jan-2020 : Ajis
"
"             hepe_upd_date         = SYSDATE,
"
"             hepe_upd_emp_id       = v_user_emp_id                --added 03-mar-2022 : Ajis
"
"           WHERE hepe_bu     = p_bu
"
"             AND hepe_emp_id = cr0.effhd_emp_id;
"
"
"
"           END IF;
"
"
"
"            END LOOP c4;
"
"
"
"            /* Make history for Payroll Intermediate Values */
"
"
"
"            FOR cr7 IN c7(cr0.effhd_year, cr0.effhd_period, cr0.effhd_emp_id)
"
"            LOOP
"
"
"
"               INSERT INTO pyrl_hist_inter_values(phiv_bu              ,
"
"                          phiv_pyrl_no              ,
"
"                          phiv_emp_id              ,
"
"                          phiv_elmnt_id          ,
"
"                          phiv_seq_no              ,
"
"                          phiv_line_value        ,
"
"                          phiv_cre_by              ,
"
"                          phiv_cre_ip_addr    ,        --added 23-jan-2020 : Ajis
"
"                          phiv_cre_os_user    ,        --added 23-jan-2020 : Ajis
"
"                          phiv_cre_date          ,
"
"                          phiv_cre_emp_id       )               --added 23-jan-2020 : Ajis
"
"                       VALUES(p_bu                  ,        --phiv_bu
"
"                          v_proc_pyrl_no         ,        --phiv_pyrl_no
"
"                          cr7.piv_emp_id        ,        --phiv_emp_id
"
"                          cr7.piv_elmnt_id      ,        --phiv_elmnt_id
"
"                          cr7.piv_seq_no        ,        --phiv_seq_no
"
"                          cr7.piv_line_value    ,        --phiv_line_value
"
"                          p_user              ,        --phiv_cre_by
"
"                          v_ip_addr        ,         --phiv_cre_ip_addr       --added 23-jan-2020 : Ajis
"
"                          v_os_user        ,         --phiv_cre_os_user       --added 23-jan-2020 : Ajis
"
"                          SYSDATE              ,        --phiv_cre_date
"
"                          v_user_emp_id        );         --phiv_cre_emp_id          --added 03-mar-2022 : Ajis
"
"
"
"            END LOOP c7;
"
"
"
"        /* Make history for Payroll Intermediate Logical Values */
"
"
"
"        FOR cr8 IN c8(cr0.effhd_year, cr0.effhd_period, cr0.effhd_emp_id)
"
"        LOOP
"
"
"
"           INSERT INTO pyrl_hist_inter_logical_values(philv_bu           ,
"
"                              phliv_pyrl_no        ,
"
"                              philv_emp_id           ,
"
"                              philv_elmnt_id       ,
"
"                              philv_line_value     ,
"
"                              philv_cre_by           ,
"
"                              philv_cre_ip_addr    ,    --added 23-jan-2020 : Ajis
"
"                              philv_cre_os_user    ,    --added 23-jan-2020 : Ajis
"
"                              philv_cre_date       ,
"
"                              philv_cre_emp_id     )        --added 03-mar-2022 : Ajis
"
"                           VALUES(p_bu               ,    --philv_bu
"
"                              v_proc_pyrl_no       ,    --phliv_pyrl_no
"
"                              cr8.pilv_emp_id      ,    --philv_emp_id
"
"                              cr8.pilv_elmnt_id    ,    --philv_elmnt_id
"
"                              cr8.pilv_line_value  ,    --philv_line_value
"
"                              p_user           ,    --philv_cre_by
"
"                              v_ip_addr           ,     --philv_cre_ip_addr      --added 23-jan-2020 : Ajis
"
"                              v_os_user            ,     --philv_cre_os_user      --added 23-jan-2020 : Ajis
"
"                              SYSDATE           ,        --philv_cre_date
"
"                              v_user_emp_id        );       --philv_cre_emp_idr      --added 03-mar-2022 : Ajis
"
"
"
"        END LOOP c8;
"
"
"
"            /* Make history for Leave Information */
"
"
"
"            FOR cr9 IN c9
"
"            LOOP
"
"
"
"               INSERT INTO payroll_hist_leave_info(phli_bu          ,
"
"                           phli_year          ,
"
"                           phli_period          ,
"
"                           phli_emp_id          ,
"
"                           phli_group_id      ,
"
"                           phli_leave_id      ,
"
"                           phli_leave_cat      ,
"
"                           phli_leave_availed      ,
"
"                           phli_leave_bal      ,
"
"                           phli_cre_by          ,
"
"                           phli_cre_ip_addr      ,        --added 23-jan-2020 : Ajis
"
"                           phli_cre_os_user       ,        --added 23-jan-2020 : Ajis
"
"                           phli_cre_date      ,
"
"                           phli_cre_emp_id        )             --added 03-mar-2022 : Ajis
"
"                        VALUES(p_bu              ,        --phli_bu
"
"                           cr0.effhd_year      ,        --phli_year
"
"                           cr0.effhd_period      ,        --phli_period
"
"                           cr0.effhd_emp_id      ,        --phli_emp_id
"
"                           cr0.effhd_group_id      ,        --phli_group_id
"
"                           cr9.effli_leave_id      ,        --phli_leave_id
"
"                           cr9.effli_leave_cat      ,        --phli_leave_cat
"
"                           cr9.effli_leave_availed,        --phli_leave_availed
"
"                           cr9.effli_leave_bal      ,        --phli_leave_bal
"
"                           p_user          ,        --phli_cre_by
"
"                           v_ip_addr          ,         --phli_cre_ip_addr           --added 23-jan-2020 : Ajis
"
"                           v_os_user          ,         --phli_cre_os_user           --added 23-jan-2020 : Ajis
"
"                           SYSDATE          ,        --phli_cre_date
"
"                           v_user_emp_id          );            --phli_cre_emp_id           --added 03-mar-2022 : Ajis
"
"
"
"            END LOOP c9;
"
"
"
"            /* Make history for Leave Details */
"
"
"
"            FOR cr10 IN c10
"
"            LOOP
"
"
"
"               INSERT INTO payroll_hist_leave_det(phld_bu              ,
"
"                          phld_emp_id              ,
"
"                          phld_year              ,
"
"                          phld_period              ,
"
"                          phld_leave_id              ,
"
"                          phld_start_date         ,
"
"                          phld_end_date              ,
"
"                          phld_no_of_days         ,
"
"                          phld_cre_by              ,
"
"                          phld_cre_ip_addr    ,        --added 23-jan-2020 : Ajis
"
"                          phld_cre_os_user    ,        --added 23-jan-2020 : Ajis
"
"                          phld_cre_date              ,
"
"                          phld_cre_emp_id       )        --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu                  ,        --phld_bu
"
"                          cr0.effhd_emp_id       ,        --phld_emp_id
"
"                          cr0.effhd_year          ,        --phld_year
"
"                          cr0.effhd_period        ,        --phld_period
"
"                          cr10.effld_leave_id      ,        --phld_leave_id
"
"                          cr10.effld_date_from    ,        --phld_start_date
"
"                          cr10.effld_date_to      ,        --phld_end_date
"
"                          cr10.effld_no_of_days    ,        --phld_no_of_days
"
"                          p_user              ,        --phld_cre_by
"
"                          v_ip_addr        ,         --phld_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                          v_os_user        ,         --phld_cre_os_user        --added 23-jan-2020 : Ajis
"
"                          SYSDATE              ,        --phld_cre_date
"
"                          v_user_emp_id        );         --phld_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"            END LOOP c10;
"
"
"
"            /* Insert details for PF Admin Transaction */
"
"
"
"            OPEN c11;
"
"            FETCH c11 INTO cr11;
"
"
"
"               IF c11%FOUND THEN
"
"
"
"                  IF cr11.effln_pf_amount > 0 THEN
"
"
"
"              INSERT INTO pf_adm_emp_trans(paet_bu            ,
"
"                           paet_emp_id              ,
"
"                           paet_trans_date           ,
"
"                           paet_year              ,
"
"                           paet_period           ,
"
"                           paet_trans_type       ,
"
"                           paet_trans_mode       ,
"
"                           paet_trans_amt        ,
"
"                           paet_cre_by           ,
"
"                           paet_cre_ip_addr       ,        --added 23-jan-2020 : Ajis
"
"                           paet_cre_os_user       ,        --added 23-jan-2020 : Ajis
"
"                           paet_cre_date         ,
"
"                           paet_cre_emp_id         )            --added 03-mar-2022 : Ajis
"
"                        VALUES(p_bu                  ,        --paet_bu
"
"                           cr0.effhd_emp_id       ,        --paet_emp_id
"
"                           TRUNC(cr0.effhd_emp_relieve_date),    --paet_trans_date
"
"                           cr0.effhd_year         ,        --paet_year
"
"                           cr0.effhd_period       ,        --paet_period
"
"                           'P'                   ,        --paet_trans_type
"
"                           'A'                  ,        --paet_trans_mode
"
"                           cr11.effln_pf_amount       ,        --paet_trans_amt
"
"                           p_user           ,        --paet_cre_by
"
"                           v_ip_addr           ,         --paet_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                           v_os_user           ,         --paet_cre_os_user        --added 23-jan-2020 : Ajis
"
"                           SYSDATE           ,        --paet_cre_date
"
"                           v_user_emp_id           );        --paet_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"          END IF;        --cr11.effln_pf_amount > 0
"
"
"
"           END IF;            --c11%FOUND
"
"
"
"            CLOSE c11;
"
"
"
"            /* Insert PF/ESI values for valid employees */
"
"
"
"        proc_ins_pf_esi_values(p_bu,
"
"                   cr0.effhd_emp_id,
"
"                   cr0.effhd_year,
"
"                   cr0.effhd_period,
"
"                       p_user);
"
"
"
"        /* Start to Insert TDS Declaration and Computation */
"
"
"
"        pack_emp_tds_hist.proc_insert_emp_tds_hist(p_bu,
"
"                                   cr0.effhd_emp_id,
"
"                                        cr0.effhd_year,
"
"                                      cr0.effhd_period,
"
"                                      p_user);
"
"
"
"        OPEN c12(v_proc_pyrl_no, v_proc_batch_no);
"
"        FETCH c12 INTO cr12;
"
"
"
"           IF c12%NOTFOUND THEN
"
"          v_net_salary := 0;
"
"           ELSE
"
"          v_net_salary := cr12.phhd_net_amt;
"
"           END IF;
"
"
"
"        CLOSE c12;
"
"
"
"        OPEN c14(cr0.effhd_year, cr0.effhd_period);
"
"        FETCH c14 INTO cr14;
"
"
"
"           IF c14%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20999,'HRM'||' '||p_bu||' '||cr0.effhd_year||' '||cr0.effhd_period);
"
"           ELSE
"
"              v_start_date := TRUNC(cr14.pcp_start_date);
"
"              v_end_date   := TRUNC(cr14.pcp_end_date);
"
"           END IF;
"
"
"
"        CLOSE c14;
"
"
"
"            /* Change Net Salary round off according to Payroll Round off control */
"
"
"
"            IF v_sal_rnd_ctrl_flag = 'N' THEN
"
"               v_sal_rnd_off := v_net_salary;
"
"            ELSE
"
"               v_sal_rnd_off := ROUND(v_net_salary/v_sal_rnd_ctrl_amt, 0) * v_sal_rnd_ctrl_amt;
"
"            END IF;
"
"
"
"            v_sal_rnd_val := v_sal_rnd_off - v_net_salary;
"
"
"
"            IF v_sal_rnd_val > 0 THEN
"
"               v_sal_rnd_off_aft := v_sal_rnd_val;
"
"               v_sal_rnd_off_bfr := 0;
"
"            END IF;
"
"
"
"            IF v_sal_rnd_val < 0 THEN
"
"               v_sal_rnd_off_aft := 0;
"
"               v_sal_rnd_off_bfr := v_sal_rnd_val;
"
"            END IF;
"
"
"
"            IF v_sal_rnd_val = 0 THEN
"
"               v_sal_rnd_off_aft := 0;
"
"               v_sal_rnd_off_bfr := 0;
"
"            END IF;
"
"
"
"         UPDATE payroll_hist_hd
"
"            SET phhd_net_payable   = v_sal_rnd_off,
"
"                phhd_actual_net    = v_net_salary,
"
"                phhd_inprog_amt    = v_sal_rnd_off,
"
"                phhd_net_afr_round = v_sal_rnd_off_aft,
"
"                phhd_net_bfr_round = v_sal_rnd_off_bfr,
"
"                phhd_upd_by        = p_user,            --added 23-jan-2020 : Ajis
"
"           phhd_upd_ip_addr   = v_ip_addr,        --added 23-jan-2020 : Ajis
"
"           phhd_upd_os_user   = v_os_user,        --added 23-jan-2020 : Ajis
"
"           phhd_upd_date      = SYSDATE,        --added 23-jan-2020 : Ajis
"
"           phhd_upd_emp_id    = v_user_emp_id        --added 03-mar-2022 : Ajis
"
"          WHERE phhd_bu               = p_bu
"
"            AND phhd_pyrl_no          = v_proc_pyrl_no
"
"            AND phhd_process_batch_no = v_proc_batch_no;
"
"
"
"         proc_upd_pyrl_prj_dtls(p_bu,
"
"                        v_proc_batch_no,
"
"                        p_user,
"
"                        v_prj_res);
"
"
"
"         IF v_net_salary <> 0 THEN
"
"
"
"            INSERT INTO pyrl_proc_batch_hd(ppbh_bu           ,
"
"                          ppbh_batch_no       ,
"
"                          ppbh_clndr_id       ,
"
"                          ppbh_year           ,
"
"                          ppbh_period       ,
"
"                          ppbh_batch_proc_plnts,
"
"                          ppbh_ref           ,
"
"                          ppbh_status       ,
"
"                          ppbh_jrnl_date       ,
"
"                          ppbh_pyrl_type       ,
"
"                          ppbh_pfx,
"
"                          ppbh_cre_by       ,
"
"                          ppbh_cre_ip_addr     ,    --added 23-jan-2020 : Ajis
"
"                          ppbh_cre_os_user     ,    --added 23-jan-2020 : Ajis
"
"                          ppbh_cre_date       ,
"
"                          ppbh_cre_emp_id       )    --added 03-mar-2022 : Ajis
"
"                       VALUES(p_bu           ,    --ppbh_bu
"
"                          v_proc_batch_no       ,    --ppbh_batch_no
"
"                          v_emp_clndr       ,    --ppbh_clndr_id
"
"                          cr0.effhd_year       ,    --ppbh_year
"
"                          cr0.effhd_period     ,    --ppbh_period
"
"                          cr0.effhd_plnt       ,    --ppbh_batch_proc_plnts
"
"                          'RELIEVE/TERMINATI ON PAYROLL JOURNAL POSTING FOR THE MONTH OF '||TO_CHAR(cr0.effhd_emp_relieve_date, 'MON')||''''||cr0.effhd_year,  --ppbh_ref
"
"                          'N'           ,    --ppbh_status
"
"                          v_end_date       ,    --ppbh_jrnl_date
"
"                          'F'           ,    --ppbh_pyrl_type
"
"                          'PBN',
"
"                          p_user           ,    --ppbh_cre_by
"
"                          v_ip_addr           ,     --ppbh_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                          v_os_user           ,     --ppbh_cre_os_user        --added 23-jan-2020 : Ajis
"
"                              SYSDATE           ,    --ppbh_cre_date
"
"                              v_user_emp_id        );   --ppbh_cre_emp_id        --added 03-mar-2022 : Ajis
"
"
"
"         END IF;
"
"
"
"            /* Update Last Payroll Processed Year/Period and Changed status to Relieved in Employee Master */
"
"
"
"            IF cr0.effhd_emp_relieve_type = 'X' THEN
"
"               v_emp_status := 'E';
"
"            ELSE
"
"               v_emp_status := 'R';
"
"            END IF;
"
"
"
"            UPDATE employees
"
"           SET emp_status       = v_emp_status,
"
"               emp_end_date         = cr0.effhd_emp_relieve_date,
"
"           emp_last_proc_year   = cr0.effhd_year,
"
"           emp_last_proc_period = cr0.effhd_period,
"
"           emp_upd_by        = p_user,
"
"           emp_upd_ip_addr      = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"           emp_upd_os_user      = v_os_user,            --added 23-jan-2020 : Ajis
"
"           emp_upd_date            = SYSDATE,
"
"           emp_upd_emp_id       = v_user_emp_id            --added 03-mar-2022 : Ajis
"
"         WHERE emp_bu     = p_bu
"
"           AND emp_emp_id = cr0.effhd_emp_id;
"
"
"
"            DELETE pyrl_inter_values
"
"         WHERE piv_bu        = p_bu
"
"           AND piv_year      = cr0.effhd_year
"
"           AND piv_period    = cr0.effhd_period
"
"           AND piv_emp_id    = cr0.effhd_emp_id
"
"           AND piv_pyrl_type = 'T';
"
"
"
"        DELETE pyrl_inter_logical_values
"
"         WHERE pilv_bu        = p_bu
"
"           AND pilv_year      = cr0.effhd_year
"
"           AND pilv_period    = cr0.effhd_period
"
"           AND pilv_emp_id    = cr0.effhd_emp_id
"
"           AND pilv_pyrl_type = 'T';
"
"
"
"        UPDATE emp_relieve
"
"           SET emprel_status      = 'R',
"
"              emprel_upd_by      = p_user,
"
"           emprel_upd_ip_addr = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"           emprel_upd_os_user = v_os_user,                  --added 23-jan-2020 : Ajis
"
"           emprel_upd_date    = SYSDATE,
"
"           emprel_upd_emp_id  = v_user_emp_id            --added 03-mar-2022 : Ajis
"
"         WHERE emprel_bu       = p_bu
"
"           AND emprel_doc_no   = cr0.effhd_sou_doc_no
"
"               AND emprel_status   = 'I';
"
"
"
"        UPDATE emp_full_final_hd
"
"             SET effhd_status        = 'P',
"
"                 effhd_pyrl_batch_no = v_proc_batch_no,
"
"           effhd_pyrl_no       = v_proc_pyrl_no,
"
"           effhd_upd_by        = p_user,
"
"           effhd_upd_ip_addr   = v_ip_addr,            --added 23-jan-2020 : Ajis
"
"           effhd_upd_os_user   = v_os_user,               --added 23-jan-2020 : Ajis
"
"           effhd_upd_date      = SYSDATE,
"
"           effhd_upd_emp_id    = v_user_emp_id            --added 03-mar-2022 : Ajis
"
"         WHERE effhd_bu     = p_bu
"
"           AND effhd_doc_no = p_doc_no
"
"           AND effhd_status = 'R';
"
"
"
"        IF SQL%NOTFOUND THEN
"
"           RAISE_APPLICATION_ERROR(-20023, 'WFR');
"
"        END IF;
"
"
"
"            v_res := 'Y';
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
"   END proc_post_fnf_pyrl;
"
"
"
"   PROCEDURE proc_post_fnf_serv_bnft(p_bu                        VARCHAR2,
"
"                        p_doc_no                        VARCHAR2,
"
"                        p_user                        VARCHAR2,
"
"                        p_res            OUT            VARCHAR2)
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
"     FROM payroll_control
"
"    WHERE payctrl_bu = p_bu;
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
"     FROM emp_full_final_serv_bnft_hd
"
"    WHERE effsbh_bu     = p_bu
"
"      AND effsbh_doc_no = p_doc_no
"
"      AND effsbh_status = 'N';
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
"     FROM emp_full_final_serv_bnft_ln
"
"    WHERE effsbl_bu     = p_bu
"
"      AND effsbl_doc_no = p_doc_no;
"
"
"
"   CURSOR c3(c_emp_id                VARCHAR2)
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
"      AND emp_emp_id = c_emp_id;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_pyrl_no                VARCHAR2,
"
"          c_proc_batch_no            VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(DECODE (phln_mode, '+', phln_amount, phln_amount * -1)), 0) phhd_net_amt
"
"     FROM payroll_hist_hd,
"
"          payroll_hist_ln
"
"    WHERE phhd_bu                  = phln_bu
"
"      AND phhd_pyrl_no             = phln_pyrl_no
"
"      AND phhd_process_batch_no = phln_process_batch_no
"
"      AND phhd_bu                  = p_bu
"
"      AND phhd_pyrl_no         = c_pyrl_no
"
"      AND phhd_process_batch_no = c_proc_batch_no;
"
"
"
"      cr4                    c4%ROWTYPE;
"
"
"
"      v_proc_batch_no                VARCHAR2(15);
"
"      v_proc_pyrl_no                VARCHAR2(15);
"
"      v_rnd_off                 NUMBER(5);
"
"      v_sal_rnd_ctrl_flag            PAYROLL_CONTROL.PAYCTRL_NET_SAL_ROUND_OFF_FLAG%TYPE;
"
"      v_sal_rnd_ctrl_amt            PAYROLL_CONTROL.PAYCTRL_NET_SAL_ROUND_OFF%TYPE;
"
"      v_min_sal_pct_flag            PAYROLL_CONTROL.PAYCTRL_MIN_NET_SAL_FLAG%TYPE;
"
"      v_min_sal_pct                PAYROLL_CONTROL.PAYCTRL_MIN_PCT%TYPE;
"
"      v_leave_accur_flag            PAYROLL_CONTROL.PAYCTRL_LEAVE_ACCRUAL%TYPE;
"
"      v_ticket_accur_flag             PAYROLL_CONTROL.PAYCTRL_TICKET_ACCRUAL%TYPE;
"
"      v_srvce_bnft_flag               PAYROLL_CONTROL.PAYCTRL_SRVICE_BENEFIT%TYPE;
"
"
"
"      v_emp_job_id                VARCHAR2(10);
"
"      v_emp_grade                VARCHAR2(10);
"
"      v_emp_loc_id                VARCHAR2(10);
"
"      v_emp_gender                VARCHAR2(1) := 'M';
"
"      v_emp_zone                VARCHAR2(10);
"
"      v_emp_clndr                VARCHAR2(10);
"
"
"
"      v_net_salary                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_off                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_val                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_off_aft                NUMBER(15, 3) := 0;
"
"      v_sal_rnd_off_bfr                NUMBER(15, 3) := 0;
"
"
"
"      v_year                    NUMBER(7);
"
"      v_period                    NUMBER(2);
"
"
"
"      v_res                    VARCHAR2(1) := 'N';
"
"      v_prj_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_user_emp_id                VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"            v_res := 'N';
"
"
"
"            OPEN c0;
"
"            FETCH c0 INTO cr0;
"
"
"
"               IF c0%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20985, 'HRM'||p_bu);
"
"               ELSE
"
"                  v_sal_rnd_ctrl_flag := cr0.payctrl_net_sal_round_off_flag;
"
"                  v_sal_rnd_ctrl_amt  := NVL(cr0.payctrl_net_sal_round_off, 0);
"
"                  v_min_sal_pct_flag  := cr0.payctrl_min_net_sal_flag;
"
"                  v_min_sal_pct          := NVL(cr0.payctrl_min_pct, 0);
"
"                  v_leave_accur_flag  := cr0.payctrl_leave_accrual;
"
"                  v_ticket_accur_flag := cr0.payctrl_ticket_accrual;
"
"                  v_srvce_bnft_flag   := cr0.payctrl_srvice_benefit;
"
"               END IF;
"
"
"
"            CLOSE c0;
"
"
"
"            OPEN c3(cr1.effsbh_emp_id);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20821, 'HRM'||'~'||p_bu||'~'||cr1.effsbh_emp_id);
"
"               ELSE
"
"                  v_emp_job_id := cr3.empai_job_id;
"
"                  v_emp_grade  := cr3.empai_grade;
"
"                  v_emp_loc_id := cr3.empai_loc_id;
"
"                  v_emp_gender := cr3.emp_gender;
"
"                  v_emp_zone   := cr3.emp_zone;
"
"                  v_emp_clndr  := cr3.emp_clndr_id;
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            v_proc_batch_no := func_find_hrm_next_id(p_bu, 'EMP_BATCH_NO');
"
"
"
"            proc_find_pyrl_cal_year_period(p_bu,
"
"                           TRUNC(SYSDATE),
"
"                           v_year,
"
"                           v_period,
"
"                       v_emp_clndr);
"
"
"
"            SELECT NVL(MAX(phhd_pyrl_no), 1000000000) + 1
"
"          INTO v_proc_pyrl_no
"
"          FROM payroll_hist_hd
"
"             WHERE phhd_bu = p_bu;
"
"
"
"        INSERT INTO payroll_hist_hd(phhd_bu                       ,
"
"                    phhd_plnt                ,
"
"                    phhd_pyrl_no                ,
"
"                    phhd_process_batch_no            ,
"
"                    phhd_process_date            ,
"
"                    phhd_pyrl_type                ,
"
"                    phhd_clndr_id             ,
"
"                    phhd_year                ,
"
"                    phhd_period                ,
"
"                    phhd_emp_id                ,
"
"                    phhd_emp_name                ,
"
"                    phhd_emp_plnt                ,
"
"                    phhd_dept_id                ,
"
"                    phhd_job_id                ,
"
"                    phhd_pos_id                ,
"
"                    phhd_grade_id                ,
"
"                    phhd_loc_id                ,
"
"                    phhd_emp_group                ,
"
"                    phhd_acct_cat_id            ,
"
"                    phhd_mon_days                ,
"
"                    phhd_workin_days            ,
"
"                    phhd_holidays                ,
"
"                    phhd_off                ,
"
"                    phhd_workoff_holiday            ,
"
"                    phhd_bustrip_days            ,
"
"                    phhd_late_hrs                ,
"
"                    phhd_tot_paid_days            ,
"
"                    phhd_paid_leave_days            ,
"
"                    phhd_unpaid_leave_days            ,
"
"                    phhd_mail_sent                ,
"
"                    phhd_no_mail_sent            ,
"
"                    phhd_cre_by                ,
"
"                    phhd_cre_ip_addr         ,
"
"                    phhd_cre_os_user         ,
"
"                    phhd_cre_emp_id             ,
"
"                    phhd_cre_date                )
"
"                 VALUES(p_bu                    ,            --phhd_bu
"
"                    cr1.effsbh_plnt                ,            --phhd_plnt
"
"                    v_proc_pyrl_no                ,            --phhd_pyrl_no
"
"                    v_proc_batch_no                   ,            --phhd_process_batch_no
"
"                    TRUNC(SYSDATE)             ,            --phhd_process_date
"
"                    'T'                    ,            --phhd_pyrl_type
"
"                    v_emp_clndr             ,            --phhd_clndr_id
"
"                    v_year                    ,            --phhd_year
"
"                    v_period                 ,            --phhd_period
"
"                    cr1.effsbh_emp_id            ,            --phhd_emp_id
"
"                    cr1.effsbh_emp_name            ,            --phhd_emp_name
"
"                    cr1.effsbh_plnt                ,            --phhd_emp_plnt
"
"                    cr1.effsbh_dept_id            ,            --phhd_dept_id
"
"                    v_emp_job_id                  ,            --phhd_job_id
"
"                    cr1.effsbh_pos_id            ,            --phhd_pos_id
"
"                    v_emp_grade                ,            --phhd_grade_id
"
"                    v_emp_loc_id                   ,            --phhd_loc_id
"
"                    cr1.effsbh_group_id            ,              --phhd_emp_group
"
"                    cr1.effsbh_acct_cat_id            ,            --phhd_acct_cat_id
"
"                    0                    ,            --phhd_mon_days
"
"                    0                    ,            --phhd_workin_days
"
"                    0                    ,            --phhd_holidays
"
"                    0                 ,            --phhd_off
"
"                    0                 ,            --phhd_workoff_holiday
"
"                    0                 ,            --phhd_bustrip_days
"
"                    0                      ,            --phhd_late_hrs
"
"                    0                    ,            --phhd_tot_paid_days
"
"                    0                    ,            --phhd_paid_leave_days
"
"                    0                  ,            --phhd_unpaid_leave_days
"
"                    'N'                    ,            --phhd_mail_sent
"
"                    0                   ,            --phhd_no_mail_sent
"
"                    p_user                   ,            --phhd_cre_by
"
"                    v_ip_addr             ,             --phhd_cre_ip_addr
"
"                    v_os_user             ,             --phhd_cre_os_user
"
"                    v_user_emp_id             ,            --phhd_cre_emp_id
"
"                    SYSDATE                      );            --phhd_cre_date
"
"
"
"            /* Insert Payroll line details */
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"               INSERT INTO payroll_hist_ln(phln_bu             ,
"
"                       phln_plnt             ,
"
"                       phln_pyrl_no                 ,
"
"                       phln_process_batch_no     ,
"
"                       phln_emp_plnt         ,
"
"                       phln_elmnt_id         ,
"
"                       phln_elmnt_cat         ,
"
"                       phln_adj_no              ,
"
"                       phln_amount             ,
"
"                       phln_actual_amount         ,
"
"                       phln_mode             ,
"
"                       phln_source             ,
"
"                       phln_doc_no             ,
"
"                       phln_reference         ,
"
"                       phln_cre_by             ,
"
"                       phln_cre_ip_addr         ,
"
"                       phln_cre_os_user         ,
"
"                       phln_cre_emp_id         ,
"
"                       phln_cre_date         )
"
"                    VALUES(p_bu                      ,            --phln_bu
"
"                       cr1.effsbh_plnt         ,            --phln_plnt
"
"                       v_proc_pyrl_no         ,            --phln_pyrl_no
"
"                       v_proc_batch_no         ,            --phln_process_batch_no
"
"                       cr1.effsbh_plnt         ,            --phln_emp_plnt
"
"                       cr2.effsbl_elmnt_id         ,            --phln_elmnt_id
"
"                       'N'                   ,            --phln_elmnt_cat
"
"                       cr2.effsbl_adj_no         ,            --phln_adj_no
"
"                       cr2.effsbl_amount         ,            --ROUND(cr4.ppln_amount, v_ctrl_rnd_off),    --phln_amount
"
"                       cr2.effsbl_actual_amt     ,            --phln_actual_amount
"
"                       cr2.effsbl_mode         ,            --phln_mode
"
"                       cr2.effsbl_source         ,            --phln_source
"
"                       cr2.effsbl_sou_doc_no     ,            --phln_doc_no
"
"                       cr2.effsbl_reference         ,            --phln_reference
"
"                       p_user             ,            --phln_cre_by
"
"                       v_ip_addr             ,             --phln_cre_ip_addr
"
"                       v_os_user             ,             --phln_cre_os_user
"
"                       v_user_emp_id         ,            --phln_cre_emp_id
"
"                       SYSDATE             );            --phln_cre_date
"
"
"
"            END LOOP c2;
"
"
"
"        OPEN c4(v_proc_pyrl_no, v_proc_batch_no);
"
"        FETCH c4 INTO cr4;
"
"
"
"           IF c4%NOTFOUND THEN
"
"          v_net_salary := 0;
"
"           ELSE
"
"          v_net_salary := cr4.phhd_net_amt;
"
"           END IF;
"
"
"
"        CLOSE c4;
"
"
"
"            /* Change Net Salary round off according to Payroll Round off control */
"
"
"
"            IF v_sal_rnd_ctrl_flag = 'N' THEN
"
"               v_sal_rnd_off := v_net_salary;
"
"            ELSE
"
"               v_sal_rnd_off := ROUND(v_net_salary/v_sal_rnd_ctrl_amt, 0) * v_sal_rnd_ctrl_amt;
"
"            END IF;
"
"
"
"            v_sal_rnd_val := v_sal_rnd_off - v_net_salary;
"
"
"
"            IF v_sal_rnd_val > 0 THEN
"
"               v_sal_rnd_off_aft := v_sal_rnd_val;
"
"               v_sal_rnd_off_bfr := 0;
"
"            END IF;
"
"
"
"            IF v_sal_rnd_val < 0 THEN
"
"               v_sal_rnd_off_aft := 0;
"
"               v_sal_rnd_off_bfr := v_sal_rnd_val;
"
"            END IF;
"
"
"
"            IF v_sal_rnd_val = 0 THEN
"
"               v_sal_rnd_off_aft := 0;
"
"               v_sal_rnd_off_bfr := 0;
"
"            END IF;
"
"
"
"         UPDATE payroll_hist_hd
"
"            SET phhd_net_payable   = v_sal_rnd_off,
"
"                phhd_actual_net    = v_net_salary,
"
"                phhd_inprog_amt    = v_sal_rnd_off,
"
"                phhd_net_afr_round = v_sal_rnd_off_aft,
"
"                phhd_net_bfr_round = v_sal_rnd_off_bfr,
"
"                phhd_upd_by        = p_user,
"
"           phhd_upd_ip_addr   = v_ip_addr,
"
"           phhd_upd_os_user   = v_os_user,
"
"           phhd_upd_emp_id    = v_user_emp_id,
"
"           phhd_upd_date      = SYSDATE
"
"          WHERE phhd_bu               = p_bu
"
"            AND phhd_pyrl_no          = v_proc_pyrl_no
"
"            AND phhd_process_batch_no = v_proc_batch_no;
"
"
"
"         proc_upd_pyrl_prj_dtls(p_bu,
"
"                        v_proc_batch_no,
"
"                        p_user,
"
"                        v_prj_res);
"
"
"
"         IF v_net_salary <> 0 THEN
"
"
"
"            INSERT INTO pyrl_proc_batch_hd(ppbh_bu           ,
"
"                          ppbh_batch_no       ,
"
"                          ppbh_clndr_id       ,
"
"                          ppbh_year           ,
"
"                          ppbh_period       ,
"
"                          ppbh_batch_proc_plnts,
"
"                          ppbh_ref           ,
"
"                          ppbh_status       ,
"
"                          ppbh_jrnl_date       ,
"
"                          ppbh_pyrl_type       ,
"
"                          ppbh_pfx,
"
"                          ppbh_cre_by       ,
"
"                          ppbh_cre_ip_addr     ,
"
"                          ppbh_cre_os_user     ,
"
"                          ppbh_cre_emp_id      ,
"
"                          ppbh_cre_date       )
"
"                       VALUES(p_bu           ,            --ppbh_bu
"
"                          v_proc_batch_no       ,            --ppbh_batch_no
"
"                          v_emp_clndr       ,            --ppbh_clndr_id
"
"                          v_year              ,            --ppbh_year
"
"                          v_period            ,            --ppbh_period
"
"                          cr1.effsbh_plnt      ,            --ppbh_batch_proc_plnts
"
"                          'FNF SERVICE BENEFITS PAYROLL JOURNAL POSTING FOR THE MONTH OF '||TO_CHAR(SYSDATE, 'MON')||''''||v_year,  --ppbh_ref
"
"                          'N'           ,            --ppbh_status
"
"                          TRUNC(LAST_DAY(SYSDATE)),            --ppbh_jrnl_date
"
"                          'F'           ,            --ppbh_pyrl_type
"
"                          'PBN',
"
"                          p_user           ,            --ppbh_cre_by
"
"                          v_ip_addr           ,             --ppbh_cre_ip_addr
"
"                          v_os_user           ,             --ppbh_cre_os_user
"
"                          v_user_emp_id       ,            --ppbh_cre_emp_id
"
"                              SYSDATE           );            --ppbh_cre_date
"
"
"
"         END IF;
"
"
"
"        UPDATE emp_full_final_serv_bnft_hd
"
"             SET effsbh_status        = 'P',
"
"                 effsbh_pyrl_batch_no = v_proc_batch_no,
"
"           effsbh_pyrl_no       = v_proc_pyrl_no,
"
"           effsbh_upd_by        = p_user,
"
"           effsbh_upd_ip_addr   = v_ip_addr,
"
"           effsbh_upd_os_user   = v_os_user,
"
"           effsbh_upd_emp_id    = v_user_emp_id,
"
"           effsbh_upd_date     = SYSDATE
"
"         WHERE effsbh_bu     = p_bu
"
"           AND effsbh_doc_no = p_doc_no
"
"           AND effsbh_status = 'N';
"
"
"
"        IF SQL%NOTFOUND THEN
"
"           RAISE_APPLICATION_ERROR(-20023, 'WFR');
"
"        END IF;
"
"
"
"        v_res := 'Y';
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
"   END proc_post_fnf_serv_bnft;
"
"
"
"END;"
/
