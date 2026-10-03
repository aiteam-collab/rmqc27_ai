CREATE OR REPLACE
"PACKAGE BODY pack_prepare_payroll
"
"AS
"
"
"
"   FUNCTION func_find_pyrl_zone_days(p_bu                VARCHAR2,
"
"                            p_zone                VARCHAR2,
"
"                        p_clndr_id                VARCHAR2,
"
"                        p_start_date            DATE,
"
"                        p_end_date                DATE,
"
"                        p_type                VARCHAR2)
"
"   RETURN NUMBER
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT COUNT(*) zwchd_mon_days,
"
"          NVL(COUNT(*) - SUM(zwchd_woff_days), 0) zwchd_org_wrk_days,
"
"          NVL(SUM(zwchd_woff_days), 0) zwchd_woff_days,
"
"          NVL(SUM(zwchd_hoff_days), 0) zwchd_hoff_days,
"
"          NVL(SUM(zwchd_holi_days), 0) zwchd_holi_days,
"
"          NVL(SUM(zwchd_woff_holi_days), 0) zwchd_woff_holi_days
"
"     FROM (SELECT CASE WHEN (zwcln_workoff = 'Y' AND zwcln_holiday IN ('W', 'B')) THEN 1 ELSE 0 END zwchd_woff_days,
"
"              CASE WHEN (zwcln_workoff = 'Y' AND zwcln_holiday IN ('B')) THEN 1 ELSE 0 END zwchd_hoff_days,
"
"              CASE WHEN zwcln_holiday IN ('H', 'B') THEN 1 ELSE 0 END zwchd_holi_days,
"
"              CASE WHEN (zwcln_workoff = 'Y' AND zwcln_holiday IN ('W', 'H', 'B')) THEN 1 ELSE 0 END zwchd_woff_holi_days
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
"          AND zwchd_bu       = p_bu
"
"          AND zwchd_zone_id  = p_zone
"
"          AND (zwchd_clndr_id = p_clndr_id OR (p_clndr_id IS NULL AND zwchd_clndr_id IS NULL))
"
"          AND TRUNC(zwcln_date) BETWEEN p_start_date AND p_end_date
"
"          AND zwchd_status   = 'A');
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"      v_mon_days                NUMBER(7, 2) := 0;
"
"      v_woff_days                      NUMBER(7, 2) := 0;
"
"      v_holi_days                      NUMBER(7, 2) := 0;
"
"      v_hoff_days                      NUMBER(7, 2) := 0;
"
"      v_org_wrk_days                   NUMBER(7, 2) := 0;
"
"      v_woff_holi_days                 NUMBER(7, 2) := 0;
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
"        RETURN 0;
"
"     ELSE
"
"
"
"        IF p_type = 'M' THEN
"
"           RETURN NVL(cr1.zwchd_mon_days, 0);
"
"        ELSIF p_type = 'W' THEN
"
"           RETURN NVL(cr1.zwchd_woff_days, 0);
"
"        ELSIF p_type = 'H' THEN
"
"           RETURN NVL(cr1.zwchd_holi_days, 0);
"
"        ELSIF p_type = 'B' THEN
"
"           RETURN NVL(cr1.zwchd_hoff_days, 0);
"
"        ELSIF p_type = 'O' THEN
"
"           RETURN NVL(cr1.zwchd_org_wrk_days, 0);
"
"        ELSIF p_type = 'A' THEN
"
"           RETURN NVL(cr1.zwchd_woff_holi_days, 0);
"
"        ELSE
"
"           RETURN 0;
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
"   END func_find_pyrl_zone_days;
"
"
"
"   PROCEDURE proc_load_unit_grp(p_bu                VARCHAR2,
"
"                   p_doc_no            VARCHAR2,
"
"                   p_user                VARCHAR2,
"
"                   p_res        OUT        VARCHAR2)
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
"   cr0                    c0%ROWTYPE;
"
"
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pyrl_prep_hd
"
"    WHERE hpph_bu     = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status IN ('N');
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_clndr_id                VARCHAR2,
"
"            c_year                NUMBER,
"
"            c_period                NUMBER,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"       IS
"
"   SELECT empai_plnt,
"
"          bup_name1 empai_plnt_desc
"
"     FROM employees,
"
"          emp_active_infos,
"
"          bus_unit_plants
"
"    WHERE emp_bu        = empai_bu
"
"      AND emp_emp_id    = empai_emp_id
"
"      AND empai_bu      = bup_bu
"
"      AND empai_plnt    = bup_plant_id
"
"      AND emp_bu        = p_bu
"
"      AND (emp_clndr_id = c_clndr_id OR (c_clndr_id IS NULL AND emp_clndr_id IS NULL))
"
"      AND emp_pay_basis = 'S'
"
"      AND emp_status IN ('A', 'S')
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_start_date   <= TRUNC(c_end_date)
"
"      AND ((emp_start_date >= TRUNC(c_start_date)
"
"      AND   emp_last_proc_year IS NULL AND emp_last_proc_period IS NULL)
"
"       OR  (emp_start_date < TRUNC(c_start_date)
"
"      AND   emp_last_proc_year||TO_CHAR(emp_last_proc_period, '00') < c_year||TO_CHAR(c_period, '00')))
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM advance_payroll
"
"               WHERE advpyrl_bu     = emp_bu
"
"                 AND advpyrl_emp_id = emp_emp_id
"
"                 AND advpyrl_year   = c_year
"
"                 AND advpyrl_period = c_period
"
"                 AND advpyrl_status = 'P')
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM employee_leaves
"
"               WHERE empleave_bu     = emp_bu
"
"                 AND empleave_emp_id = emp_emp_id
"
"                 AND empleave_year   = c_year
"
"                 AND empleave_period = c_period
"
"                 AND empleave_prep_payroll = 'Y'
"
"                 AND empleave_status = 'P')
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM employee_leaves
"
"               WHERE empleave_bu     = emp_bu
"
"                 AND empleave_emp_id = emp_emp_id
"
"                 AND ((empleave_year = c_year AND empleave_period < c_period) OR  (empleave_year < c_year AND empleave_period > c_period))
"
"                 AND TRUNC(empleave_end_date) >= TRUNC(c_end_date)
"
"                 AND empleave_prep_payroll = 'P'
"
"                 AND empleave_status = 'P')
"
"      AND EXISTS (SELECT auba_plant
"
"                    FROM appl_user_plant_access
"
"                   WHERE auba_bu      = empai_bu
"
"                     AND auba_plant   = empai_plnt
"
"                     AND auba_user_id = p_user
"
"                     AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to))
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM hrm_pyrl_prep_hd,
"
"                     hrm_pyrl_prep_ln
"
"               WHERE hpph_bu        = hppl_bu
"
"                 AND hpph_doc_no    = hppl_doc_no
"
"                 AND hpph_bu        = p_bu
"
"                 AND hpph_doc_no    <> p_doc_no
"
"                 AND hppl_emp_id    = emp_emp_id
"
"                 AND hpph_year      = c_year
"
"                 AND hpph_period    = c_period
"
"                 AND (hpph_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"                 AND ((hpph_status IN ('P') AND hppl_prep_flag = 'Y') OR hpph_status IN ('R', 'N')))
"
"    GROUP BY empai_plnt,
"
"             bup_name1
"
"    ORDER BY empai_plnt;
"
"
"
"   CURSOR c3(c_clndr_id                VARCHAR2,
"
"            c_plnt                VARCHAR2,
"
"              c_year                NUMBER,
"
"            c_period                NUMBER,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"       IS
"
"   SELECT emp_group_id,
"
"          eg_group_desc emp_group_desc
"
"     FROM employees,
"
"          emp_active_infos,
"
"          bus_unit_plants,
"
"          emp_groups
"
"    WHERE emp_bu        = empai_bu
"
"      AND emp_emp_id    = empai_emp_id
"
"      AND empai_bu      = bup_bu
"
"      AND empai_plnt    = bup_plant_id
"
"      AND emp_bu        = eg_bu
"
"      AND emp_group_id  = eg_group_id
"
"      AND emp_bu        = p_bu
"
"      AND empai_plnt    = c_plnt
"
"      AND (emp_clndr_id = c_clndr_id OR (c_clndr_id IS NULL AND emp_clndr_id IS NULL))
"
"      AND emp_pay_basis = 'S'
"
"      AND emp_status   IN ('A', 'S')
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_start_date   <= TRUNC(c_end_date)
"
"      AND ((emp_start_date >= TRUNC(c_start_date)
"
"      AND   emp_last_proc_year IS NULL AND emp_last_proc_period IS NULL)
"
"       OR  (emp_start_date < TRUNC(c_start_date)
"
"      AND   emp_last_proc_year||TO_CHAR(emp_last_proc_period, '00') < c_year||TO_CHAR(c_period, '00')))
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM advance_payroll
"
"               WHERE advpyrl_bu     = emp_bu
"
"                 AND advpyrl_emp_id = emp_emp_id
"
"                 AND advpyrl_year   = c_year
"
"                 AND advpyrl_period = c_period
"
"                 AND advpyrl_status = 'P')
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM employee_leaves
"
"               WHERE empleave_bu     = emp_bu
"
"                 AND empleave_emp_id = emp_emp_id
"
"                 AND empleave_year   = c_year
"
"                 AND empleave_period = c_period
"
"                 AND empleave_prep_payroll = 'Y'
"
"                 AND empleave_status = 'P')
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM employee_leaves
"
"               WHERE empleave_bu     = emp_bu
"
"                 AND empleave_emp_id = emp_emp_id
"
"                 AND ((empleave_year = c_year AND empleave_period < c_period) OR  (empleave_year < c_year AND empleave_period > c_period))
"
"                 AND TRUNC(empleave_end_date) >= TRUNC(c_end_date)
"
"                 AND empleave_prep_payroll = 'P'
"
"                 AND empleave_status = 'P')
"
"      AND EXISTS (SELECT auba_plant
"
"                    FROM appl_user_plant_access
"
"                   WHERE auba_bu      = empai_bu
"
"                     AND auba_plant   = empai_plnt
"
"                     AND auba_user_id = p_user
"
"                     AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to))
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM hrm_pyrl_prep_hd,
"
"                     hrm_pyrl_prep_ln
"
"               WHERE hpph_bu        = hppl_bu
"
"                 AND hpph_doc_no    = hppl_doc_no
"
"                 AND hpph_bu        = p_bu
"
"                 AND hpph_doc_no    <> p_doc_no
"
"                 AND hppl_emp_id    = emp_emp_id
"
"                 AND hpph_year      = c_year
"
"                 AND hpph_period    = c_period
"
"                 AND (hpph_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"                 AND ((hpph_status IN ('P') AND hppl_prep_flag = 'Y') OR hpph_status IN ('R', 'N')))
"
"    GROUP BY emp_group_id,
"
"             eg_group_desc
"
"    ORDER BY emp_group_id;
"
"
"
"    v_unit_seq_no                NUMBER(5);
"
"    v_group_seq_no                NUMBER(5);
"
"    v_res                    VARCHAR2(1) := 'N';
"
"
"
"    v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 16-apr-2022 : Ajis
"
"    v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 16-apr-2022 : Ajis
"
"    v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 16-apr-2022 : Ajis
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
"              FROM hrm_pyrl_prep_unit
"
"             WHERE hppu_bu     = p_bu
"
"               AND hppu_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_pyrl_prep_group
"
"             WHERE hppg_bu     = p_bu
"
"               AND hppg_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_pyrl_prep_ln
"
"             WHERE hppl_bu     = p_bu
"
"               AND hppl_doc_no = p_doc_no;
"
"
"
"            v_res := 'N';
"
"            v_unit_seq_no := 1;
"
"
"
"            FOR cr2 IN c2(cr1.hpph_clndr_id, cr1.hpph_year, cr1.hpph_period, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"            LOOP
"
"
"
"               INSERT INTO hrm_pyrl_prep_unit(hppu_bu         ,
"
"                                     hppu_doc_no     ,
"
"                                     hppu_seq_no     ,
"
"                                     hppu_plnt         ,
"
"                                     hppu_plnt_desc     ,
"
"                                     hppu_sel_flag     ,
"
"                                     hppu_cre_by     ,
"
"                                     hppu_cre_date       ,
"
"                                              hppu_cre_ip_addr   ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                              hppu_cre_os_user   ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                              hppu_cre_emp_id    )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                  VALUES(p_bu         ,
"
"                                            p_doc_no         ,
"
"                                            v_unit_seq_no     ,
"
"                                            cr2.empai_plnt     ,
"
"                                     cr2.empai_plnt_desc,
"
"                                     'Y'         ,
"
"                                     p_user         ,
"
"                                     SYSDATE         ,
"
"                                              v_ip_addr          ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                              v_os_user          ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                              v_user_emp_id      );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"               v_group_seq_no := 1;
"
"
"
"               FOR cr3 IN c3(cr1.hpph_clndr_id, cr2.empai_plnt, cr1.hpph_year, cr1.hpph_period, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"               LOOP
"
"
"
"                  INSERT INTO hrm_pyrl_prep_group(hppg_bu        ,
"
"                          hppg_doc_no        ,
"
"                          hppg_seq_no        ,
"
"                          hppg_sub_seq_no   ,
"
"                          hppg_group        ,
"
"                          hppg_group_desc   ,
"
"                          hppg_sel_flag     ,
"
"                          hppg_cre_by        ,
"
"                          hppg_cre_date     ,
"
"                                                  hppg_cre_ip_addr  ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppg_cre_os_user  ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppg_cre_emp_id   )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                       VALUES(p_bu            ,
"
"                             p_doc_no        ,
"
"                             v_unit_seq_no        ,
"
"                             v_group_seq_no    ,
"
"                             cr3.emp_group_id  ,
"
"                             cr3.emp_group_desc,
"
"                             'Y'            ,
"
"                             p_user        ,
"
"                             SYSDATE        ,
"
"                                                  v_ip_addr         ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_os_user         ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_user_emp_id     );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"                  v_group_seq_no := v_group_seq_no + 1;
"
"
"
"               END LOOP c3;
"
"
"
"               v_unit_seq_no := v_unit_seq_no + 1;
"
"
"
"               v_res := 'Y';
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
"   END proc_load_unit_grp;
"
"
"
"   PROCEDURE proc_load_employees(p_bu                VARCHAR2,
"
"                    p_doc_no            VARCHAR2,
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
"     FROM hrm_pyrl_prep_hd
"
"    WHERE hpph_bu     = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status IN ('N');
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
"     FROM hrm_pyrl_prep_unit,
"
"          hrm_pyrl_prep_group
"
"    WHERE hppu_bu     = hppg_bu
"
"      AND hppu_doc_no = hppg_doc_no
"
"      AND hppu_seq_no = hppg_seq_no
"
"      AND hppg_bu     = p_bu
"
"      AND hppg_doc_no = p_doc_no
"
"      AND hppu_sel_flag = 'Y'
"
"      AND hppg_sel_flag = 'Y';
"
"
"
"   CURSOR c3(c_clndr_id                VARCHAR2,
"
"             c_plnt                VARCHAR2,
"
"             c_group_id                VARCHAR2,
"
"             c_year                NUMBER,
"
"            c_period                NUMBER,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
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
"      AND empai_plnt    = c_plnt
"
"      AND emp_group_id  = c_group_id
"
"      AND (emp_clndr_id = c_clndr_id OR (c_clndr_id IS NULL AND emp_clndr_id IS NULL))
"
"      AND emp_pay_basis = 'S'
"
"      AND emp_status   IN ('A', 'S')
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_start_date   <= TRUNC(c_end_date)
"
"      AND ((emp_start_date >= TRUNC(c_start_date) AND emp_last_proc_year IS NULL AND emp_last_proc_period IS NULL)
"
"       OR  (emp_start_date < TRUNC(c_start_date) AND emp_last_proc_year||TO_CHAR(emp_last_proc_period, '00') < c_year||TO_CHAR(c_period, '00')))
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM advance_payroll
"
"               WHERE advpyrl_bu     = emp_bu
"
"                 AND advpyrl_emp_id = emp_emp_id
"
"                 AND advpyrl_year   = c_year
"
"                 AND advpyrl_period = c_period
"
"                 AND advpyrl_status = 'P')
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM employee_leaves
"
"               WHERE empleave_bu     = emp_bu
"
"                 AND empleave_emp_id = emp_emp_id
"
"                 AND empleave_year   = c_year
"
"                 AND empleave_period = c_period
"
"                 AND empleave_prep_payroll = 'Y'
"
"                 AND empleave_status = 'P')
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM employee_leaves
"
"               WHERE empleave_bu     = emp_bu
"
"                 AND empleave_emp_id = emp_emp_id
"
"                 AND ((empleave_year = c_year AND empleave_period < c_period) OR  (empleave_year < c_year AND empleave_period > c_period))
"
"                 AND TRUNC(empleave_end_date) >= TRUNC(c_end_date)
"
"                 AND empleave_prep_payroll = 'P'
"
"                 AND empleave_status = 'P')
"
"      AND EXISTS (SELECT auba_plant
"
"                    FROM appl_user_plant_access
"
"                   WHERE auba_bu      = empai_bu
"
"                     AND auba_plant   = empai_plnt
"
"                     AND auba_user_id = p_user
"
"                     AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to))
"
"      AND NOT EXISTS (SELECT 1
"
"                FROM hrm_pyrl_prep_hd,
"
"                     hrm_pyrl_prep_ln
"
"               WHERE hpph_bu        = hppl_bu
"
"                 AND hpph_doc_no    = hppl_doc_no
"
"                 AND hpph_bu        = p_bu
"
"                 AND hpph_doc_no    <> p_doc_no
"
"                 AND hppl_emp_id    = emp_emp_id
"
"                 AND hpph_year      = c_year
"
"                 AND hpph_period    = c_period
"
"                 AND (hpph_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"                 AND ((hpph_status IN ('P') AND hppl_prep_flag = 'Y') OR hpph_status IN ('R', 'N')))
"
"    ORDER BY emp_emp_id;
"
"
"
"   CURSOR c4(c_emp_id                VARCHAR2,
"
"            c_year                NUMBER,
"
"            c_period                NUMBER)
"
"       IS
"
"   SELECT eph_emp_id
"
"     FROM emp_pyrl_hold
"
"    WHERE eph_bu     = p_bu
"
"      AND eph_emp_id = c_emp_id
"
"      AND eph_pyrl_year||TO_CHAR (eph_pyrl_period, '00') <= c_year||TO_CHAR (c_period, '00')
"
"      AND eph_status = 'H';
"
"
"
"      cr4                    c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_dept_id                VARCHAR2)
"
"       IS
"
"   SELECT dept_name1
"
"     FROM departments
"
"    WHERE dept_bu = p_bu
"
"      AND dept_id = c_dept_id;
"
"
"
"      cr5                    c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_plnt                VARCHAR2)
"
"       IS
"
"   SELECT bup_name1
"
"     FROM bus_unit_plants
"
"    WHERE bup_bu       = p_bu
"
"      AND bup_plant_id = c_plnt;
"
"
"
"      cr6                    c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_pos_id                VARCHAR2)
"
"       IS
"
"   SELECT hrpos_pos_name1
"
"     FROM hr_positions
"
"    WHERE hrpos_bu     = p_bu
"
"      AND hrpos_pos_id = c_pos_id;
"
"
"
"      cr7                    c7%ROWTYPE;
"
"
"
"   CURSOR c8(c_job_id                VARCHAR2)
"
"       IS
"
"   SELECT jtitle_title1
"
"     FROM job_titles
"
"    WHERE jtitle_bu     = p_bu
"
"      AND jtitle_job_id = c_job_id;
"
"
"
"      cr8                    c8%ROWTYPE;
"
"
"
"   CURSOR c9(c_group_id                VARCHAR2)
"
"       IS
"
"   SELECT eg_group_desc
"
"     FROM emp_groups
"
"    WHERE eg_bu       = p_bu
"
"      AND eg_group_id = c_group_id;
"
"
"
"      cr9                    c9%ROWTYPE;
"
"
"
"   CURSOR c10(c_cat_id                VARCHAR2)
"
"       IS
"
"   SELECT ecat_desc1
"
"     FROM emp_category
"
"    WHERE ecat_bu     = p_bu
"
"      AND ecat_cat_id = c_cat_id;
"
"
"
"      cr10                    c10%ROWTYPE;
"
"
"
"   CURSOR c11(c_zone                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM holiday_zones
"
"    WHERE hz_bu      = p_bu
"
"      AND hz_zone_id = c_zone;
"
"
"
"      cr11                    c11%ROWTYPE;
"
"
"
"   CURSOR c12(c_clndr_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM pyrl_clndr
"
"    WHERE pc_bu       = p_bu
"
"      AND pc_clndr_id = c_clndr_id;
"
"
"
"      cr12                    c12%ROWTYPE;
"
"
"
"
"
"      v_seq_no                    NUMBER(5);
"
"      v_zone                    VARCHAR2(10);
"
"      v_zone_desc                VARCHAR2(150);
"
"      v_dept_id                    VARCHAR2(10);
"
"      v_dept_desc                VARCHAR2(150);
"
"      v_plnt                    VARCHAR2(10);
"
"      v_plnt_desc                VARCHAR2(150);
"
"      v_pos_id                    VARCHAR2(10);
"
"      v_pos_desc                VARCHAR2(150);
"
"      v_job_id                    VARCHAR2(10);
"
"      v_job_desc                VARCHAR2(150);
"
"      v_grp_id                    VARCHAR2(10);
"
"      v_grp_desc                VARCHAR2(150);
"
"      v_cat_id                    VARCHAR2(10);
"
"      v_cat_desc                VARCHAR2(150);
"
"      v_clndr_id                VARCHAR2(10);
"
"      v_clndr_desc                VARCHAR2(150);
"
"      v_emp_status                VARCHAR2(100);
"
"      v_last_proc_year                NUMBER(6);
"
"      v_last_proc_period            NUMBER(2);
"
"      v_ref                    VARCHAR2(500);
"
"      v_prep_payroll                VARCHAR2(1) := 'Y';
"
"
"
"      v_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 16-apr-2022 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 16-apr-2022 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 16-apr-2022 : Ajis
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
"          FROM hrm_pyrl_prep_ln
"
"         WHERE hppl_bu     = p_bu
"
"               AND hppl_doc_no = p_doc_no;
"
"
"
"            v_seq_no := 1;
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
"               FOR cr3 IN c3(cr1.hpph_clndr_id, cr2.hppu_plnt, cr2.hppg_group, cr1.hpph_year, cr1.hpph_period, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"               LOOP
"
"
"
"                  v_dept_id  := cr3.empai_dept_id;
"
"                  v_plnt     := cr3.empai_plnt;
"
"                  v_pos_id   := cr3.empai_pos_id;
"
"                  v_job_id   := cr3.empai_job_id;
"
"                  v_grp_id   := cr3.emp_group_id;
"
"                  v_cat_id   := cr3.emp_cat_id;
"
"                  v_zone     := cr3.emp_zone;
"
"                  v_clndr_id := cr3.emp_clndr_id;
"
"
"
"                  IF v_dept_id IS NOT NULL THEN
"
"
"
"                     OPEN c5(v_dept_id);
"
"                     FETCH c5 INTO cr5;
"
"
"
"                        IF c5%FOUND THEN
"
"                           v_dept_desc := cr5.dept_name1;
"
"                        ELSE
"
"                           v_dept_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c5;
"
"
"
"          END IF;
"
"
"
"          IF v_plnt IS NOT NULL THEN
"
"
"
"                     OPEN c6(v_plnt);
"
"                     FETCH c6 INTO cr6;
"
"
"
"                        IF c6%FOUND THEN
"
"                           v_plnt_desc := cr6.bup_name1;
"
"                        ELSE
"
"                           v_plnt_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c6;
"
"
"
"          END IF;
"
"
"
"          IF v_pos_id IS NOT NULL THEN
"
"
"
"                     OPEN c7(v_pos_id);
"
"                     FETCH c7 INTO cr7;
"
"
"
"                        IF c7%FOUND THEN
"
"                           v_pos_desc := cr7.hrpos_pos_name1;
"
"                        ELSE
"
"                           v_pos_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c7;
"
"
"
"          END IF;
"
"
"
"          IF v_job_id IS NOT NULL THEN
"
"
"
"                     OPEN c8(v_job_id);
"
"                     FETCH c8 INTO cr8;
"
"
"
"                        IF c8%FOUND THEN
"
"                           v_job_desc := cr8.jtitle_title1;
"
"                        ELSE
"
"                           v_job_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c8;
"
"
"
"          END IF;
"
"
"
"          IF v_grp_id IS NOT NULL THEN
"
"
"
"                     OPEN c9(v_grp_id);
"
"                     FETCH c9 INTO cr9;
"
"
"
"                        IF c9%FOUND THEN
"
"                           v_grp_desc := cr9.eg_group_desc;
"
"                        ELSE
"
"                           v_grp_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c9;
"
"
"
"          END IF;
"
"
"
"          IF v_cat_id IS NOT NULL THEN
"
"
"
"                     OPEN c10(v_cat_id);
"
"                     FETCH c10 INTO cr10;
"
"
"
"                        IF c10%FOUND THEN
"
"                           v_cat_desc := cr10.ecat_desc1;
"
"                        ELSE
"
"                           v_cat_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c10;
"
"
"
"                  END IF;
"
"
"
"          IF v_zone IS NOT NULL THEN
"
"
"
"                     OPEN c11(v_zone);
"
"                     FETCH c11 INTO cr11;
"
"
"
"                        IF c11%FOUND THEN
"
"                           v_zone_desc := cr11.hz_desc1;
"
"                        ELSE
"
"                           v_zone_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c11;
"
"
"
"                  END IF;
"
"
"
"                  IF v_clndr_id IS NOT NULL THEN
"
"
"
"                     OPEN c12(v_clndr_id);
"
"                     FETCH c12 INTO cr12;
"
"
"
"                        IF c12%FOUND THEN
"
"                           v_clndr_desc := cr12.pc_clndr_name;
"
"                        ELSE
"
"                           v_clndr_desc := NULL;
"
"                        END IF;
"
"
"
"                     CLOSE c12;
"
"
"
"                  END IF;
"
"
"
"                  IF TRUNC(cr3.emp_start_date) < TRUNC(cr1.hpph_date_from) THEN
"
"             v_emp_status := 'A';
"
"          END IF;
"
"
"
"          IF TRUNC(cr3.emp_start_date) = TRUNC(cr1.hpph_date_from) THEN
"
"             v_emp_status := 'N';
"
"          END IF;
"
"
"
"          IF (TRUNC(cr3.emp_start_date) > TRUNC(cr1.hpph_date_from) AND TRUNC(cr3.emp_start_date) <= TRUNC(cr1.hpph_date_to)) THEN
"
"             v_emp_status := 'I';
"
"          END IF;
"
"
"
"          OPEN c4(cr3.emp_emp_id, cr1.hpph_year, cr1.hpph_period);
"
"          FETCH c4 INTO cr4;
"
"
"
"             IF c4%FOUND THEN
"
"                v_emp_status := 'H';
"
"             ELSE
"
"                v_emp_status := v_emp_status;
"
"             END IF;
"
"
"
"          CLOSE c4;
"
"
"
"          IF v_emp_status IN ('H') THEN
"
"             v_prep_payroll := 'N';
"
"          ELSE
"
"             v_prep_payroll := 'Y';
"
"          END IF;
"
"
"
"          IF cr3.emp_last_proc_year IS NOT NULL AND cr3.emp_last_proc_period IS NOT NULL THEN
"
"
"
"             IF cr1.hpph_period = 1 THEN
"
"                v_last_proc_year   := cr1.hpph_year - 101;
"
"                v_last_proc_period := 12;
"
"             ELSE
"
"                v_last_proc_year   := cr1.hpph_year;
"
"                v_last_proc_period := cr1.hpph_period - 1;
"
"             END IF;
"
"
"
"             IF (v_last_proc_year||TO_CHAR(v_last_proc_period, '00')) <> (cr3.emp_last_proc_year||TO_CHAR(cr3.emp_last_proc_period, '00')) THEN
"
"                v_ref := 'BETWEEN THIS YEAR/PERIOD '||cr3.emp_last_proc_year||'/'||cr3.emp_last_proc_period||' TO '||cr1.hpph_year||'/'||cr1.hpph_period|| ' PAYROLL ARE MISSING.';
"
"             ELSE
"
"                v_ref := NULL;
"
"             END IF;
"
"
"
"          ELSE
"
"             v_ref := NULL;
"
"          END IF;
"
"
"
"                  INSERT INTO hrm_pyrl_prep_ln (hppl_bu             ,
"
"                        hppl_doc_no         ,
"
"                        hppl_seq_no         ,
"
"                        hppl_emp_id         ,
"
"                        hppl_emp_name         ,
"
"                        hppl_emp_start_date       ,
"
"                        hppl_emp_end_date       ,
"
"                        hppl_pay_basis         ,
"
"                        hppl_clndr_id         ,
"
"                        hppl_clndr_desc         ,
"
"                        hppl_zone         ,
"
"                        hppl_zone_desc             ,
"
"                        hppl_dept_id         ,
"
"                        hppl_dept_desc         ,
"
"                        hppl_plnt         ,
"
"                        hppl_plnt_desc         ,
"
"                        hppl_pos_id         ,
"
"                        hppl_pos_desc         ,
"
"                        hppl_job_id         ,
"
"                        hppl_job_desc         ,
"
"                        hppl_grp_id         ,
"
"                        hppl_grp_desc         ,
"
"                        hppl_cat_id         ,
"
"                        hppl_cat_desc         ,
"
"                        hppl_emp_status         ,
"
"                        hppl_prep_flag         ,
"
"                        hppl_ref         ,
"
"                        hppl_cre_by         ,
"
"                        hppl_cre_date         ,
"
"                                                hppl_cre_ip_addr         ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                hppl_cre_os_user         ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                hppl_cre_emp_id          )        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                     VALUES(p_bu             ,        --hppl_bu
"
"                        p_doc_no         ,        --hppl_doc_no
"
"                        v_seq_no         ,        --hppl_seq_no
"
"                        cr3.emp_emp_id         ,        --hppl_emp_id
"
"                        (cr3.emp_first_name1||' '||cr3.emp_middle_name1||' '||cr3.emp_last_name1),    --hppl_emp_name
"
"                        TRUNC(cr3.emp_start_date),        --hppl_emp_start_date
"
"                        TRUNC(cr3.emp_end_date)     ,        --hppl_emp_end_date
"
"                        cr3.emp_pay_basis     ,        --hppl_pay_basis
"
"                        v_clndr_id          ,        --hppl_clndr_id
"
"                        v_clndr_desc         ,        --hppl_clndr_desc
"
"                        v_zone             ,        --hppl_zone
"
"                        v_zone_desc         ,        --hppl_zone_desc
"
"                        v_dept_id         ,        --hppl_dept_id
"
"                        v_dept_desc         ,        --hppl_dept_desc
"
"                        v_plnt             ,        --hppl_plnt
"
"                        v_plnt_desc         ,        --hppl_plnt_desc
"
"                        v_pos_id         ,        --hppl_pos_id
"
"                        v_pos_desc         ,        --hppl_pos_desc
"
"                        v_job_id         ,        --hppl_job_id
"
"                        v_job_desc         ,        --hppl_job_desc
"
"                        v_grp_id         ,        --hppl_grp_id
"
"                        v_grp_desc         ,        --hppl_grp_desc
"
"                        v_cat_id         ,        --hppl_cat_id
"
"                        v_cat_desc         ,        --hppl_cat_desc
"
"                        v_emp_status         ,        --hppl_emp_status
"
"                        v_prep_payroll         ,        --hppl_prep_flag
"
"                        v_ref             ,        --hppl_ref
"
"                        p_user             ,        --hppl_cre_by
"
"                        SYSDATE             ,        --hppl_cre_date
"
"                                                v_ip_addr                ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                v_os_user                ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                v_user_emp_id            );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"             /*   proc_load_emp_attd(p_bu,
"
"                                               cr1.hpph_date_from,
"
"                                               cr1.hpph_date_to,
"
"                                               cr1.hpph_year,
"
"                                               cr1.hpph_period,
"
"                                               cr3.emp_emp_id,
"
"                                               TRUNC(cr3.emp_start_date),
"
"                                               p_user,
"
"                                               v_plnt,
"
"                                              '1',
"
"                                              'S',
"
"                                              'N',
"
"                                              p_doc_no,
"
"                                              'N');  */--BHARATHI
"
"
"
"
"
"                  v_seq_no := v_seq_no + 1;
"
"
"
"                  v_res := 'Y';
"
"
"
"               END LOOP c3;
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
"   END proc_load_employees;
"
"
"
"   PROCEDURE proc_chk_pyrl_excep(p_bu                VARCHAR2,
"
"                       p_doc_no            VARCHAR2,
"
"                      p_user                VARCHAR2,
"
"                    p_res        OUT        VARCHAR2,
"
"                    p_emp_id            VARCHAR2    DEFAULT NULL)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pyrl_prep_hd
"
"    WHERE hpph_bu     = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status IN ('N', 'R');
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
"     FROM hrm_pyrl_prep_ln
"
"    WHERE hppl_bu         = p_bu
"
"      AND hppl_doc_no     = p_doc_no
"
"      AND (hppl_emp_id    = p_emp_id OR p_emp_id IS NULL)
"
"      AND hppl_prep_flag  = 'Y'
"
"      AND hppl_emp_status NOT IN ('H');
"
"
"
"   CURSOR c3(c_emp_id                 VARCHAR2,
"
"            c_year                NUMBER,
"
"            c_period                NUMBER)
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
"      AND epadj_start_year||TO_CHAR(epadj_start_period, '00') <= c_year||TO_CHAR(c_period, '00')
"
"      AND epadj_status IN ('N', 'D');
"
"
"
"   CURSOR c4(c_emp_id                 VARCHAR2,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
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
"      AND TRUNC(ephd_date) BETWEEN c_start_date AND c_end_date
"
"      AND ephd_status IN ('N');
"
"
"
"   CURSOR c5(c_emp_id                 VARCHAR2,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"       IS
"
"   SELECT *
"
"     FROM employee_leaves
"
"    WHERE empleave_bu     = p_bu
"
"      AND empleave_emp_id = c_emp_id
"
"      AND empleave_status = 'E'
"
"      AND ((TRUNC(empleave_start_date) BETWEEN c_start_date AND c_end_date)
"
"       OR  (NVL(TRUNC(empleave_return_date) - 1, TRUNC(empleave_end_date)) BETWEEN c_start_date AND c_end_date)
"
"       OR  (TRUNC(empleave_start_date) <= c_start_date) AND (NVL (TRUNC(empleave_return_date) - 1, TRUNC(empleave_end_date)) >= c_end_date));
"
"
"
"   CURSOR c6(c_emp_id                 VARCHAR2,
"
"            c_year                NUMBER,
"
"            c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM emp_ovrt_ln
"
"    WHERE eoln_bu     = p_bu
"
"      AND eoln_emp_id = c_emp_id
"
"      AND eoln_year||TO_CHAR(eoln_period, '00') <= c_year||TO_CHAR(c_period, '00')
"
"      AND eoln_status = 'N';
"
"
"
"   CURSOR c7(c_emp_id                  VARCHAR2,
"
"         c_year                NUMBER,
"
"            c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM emp_full_final_hd
"
"    WHERE effhd_bu     = p_bu
"
"      AND effhd_emp_id = c_emp_id
"
"      AND effhd_year||TO_CHAR(effhd_period, '00') <= c_year||TO_CHAR(c_period, '00')
"
"      AND effhd_status NOT IN ('L');
"
"
"
"      cr7                    c7%ROWTYPE;
"
"
"
"   CURSOR c8(c_emp_id             VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees
"
"    WHERE emp_bu     = p_bu
"
"      AND emp_emp_id = c_emp_id;
"
"
"
"      cr8                    c8%ROWTYPE;
"
"
"
"   CURSOR c9(c_emp_id                 VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_workday_calendar_zone
"
"    WHERE ewcz_bu     = p_bu
"
"      AND ewcz_emp_id = c_emp_id;
"
"
"
"      cr9                    c9%ROWTYPE;
"
"
"
"   CURSOR c10(c_zone_id                VARCHAR2,
"
"             c_year                NUMBER,
"
"             c_clndr_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM zone_workday_calendar_hd
"
"    WHERE zwchd_bu        = p_bu
"
"      AND zwchd_zone_id   = c_zone_id
"
"      AND zwchd_year      = c_year
"
"      AND (zwchd_clndr_id = c_clndr_id OR c_clndr_id IS NULL)
"
"      AND zwchd_status    = 'A';
"
"
"
"      cr10                    c10%ROWTYPE;
"
"
"
"   CURSOR c11(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_loans_request
"
"    WHERE elr_bu     = p_bu
"
"      AND elr_emp_id = c_emp_id
"
"      AND elr_status NOT IN ('J', 'C')
"
"      AND elr_pymnt_status IN ('P');
"
"
"
"   CURSOR c12(c_emp_id              VARCHAR2,
"
"          c_year                NUMBER,
"
"             c_period                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM emp_late_arrivals
"
"    WHERE ela_bu     = p_bu
"
"      AND ela_emp_id = c_emp_id
"
"      AND ela_year||TO_CHAR(ela_period, '00') <= c_year||TO_CHAR(c_period, '00')
"
"      AND ela_status IN ('N');
"
"
"
"   CURSOR c13
"
"       IS
"
"   SELECT COUNT(*) v_excep_cnt
"
"     FROM hrm_pyrl_prep_excep
"
"    WHERE hppe_bu     = p_bu
"
"      AND hppe_doc_no = p_doc_no;
"
"
"
"      cr13                    c13%ROWTYPE;
"
"
"
"   CURSOR c14(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_relieve
"
"    WHERE emprel_bu    = p_bu
"
"      AND emprel_emp_id = c_emp_id
"
"      AND emprel_status NOT IN ('C');
"
"
"
"      cr14                    c14%ROWTYPE;
"
"
"
"   CURSOR c15(c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM leave_request
"
"    WHERE lr_bu     = p_bu
"
"      AND lr_emp_id = c_emp_id
"
"      AND lr_type   = 'E'
"
"      AND (lr_status IN ('N', 'E')
"
"       OR (lr_status = 'P' AND lr_leave_doc_no IS NULL));
"
"
"
"      cr15                    c15%ROWTYPE;
"
"
"
"   CURSOR c16(c_emp_id                VARCHAR2,
"
"          c_start_date            DATE,
"
"             c_end_date            DATE)
"
"       IS
"
"   SELECT *
"
"     FROM emp_relieve
"
"    WHERE emprel_bu    = p_bu
"
"      AND emprel_emp_id = c_emp_id
"
"      AND TRUNC(emprel_relieve_date) BETWEEN c_start_date AND c_end_date
"
"      AND emprel_status NOT IN ('C');
"
"
"
"      cr16                    c16%ROWTYPE;
"
"
"
"      v_seq_no                    NUMBER(5);
"
"      v_excep_type                VARCHAR2(10);
"
"      v_excep_msg                VARCHAR2(4000);
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 16-apr-2022 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 16-apr-2022 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 16-apr-2022 : Ajis
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
"              FROM hrm_pyrl_prep_excep
"
"             WHERE hppe_bu     = p_bu
"
"               AND hppe_doc_no = p_doc_no;
"
"
"
"            v_seq_no := 1;
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"                 v_excep_msg := NULL;
"
"
"
"           FOR cr3 IN c3(cr2.hppl_emp_id, cr1.hpph_year, cr1.hpph_period)
"
"           LOOP
"
"
"
"          INSERT INTO hrm_pyrl_prep_excep(hppe_bu       ,
"
"                          hppe_doc_no         ,
"
"                          hppe_seq_no      ,
"
"                          hppe_emp_id       ,
"
"                          hppe_emp_name       ,
"
"                          hppe_sou_doc_type,
"
"                          hppe_sou_doc_no  ,
"
"                          hppe_excep       ,
"
"                          hppe_cre_by       ,
"
"                          hppe_cre_date    ,
"
"                                                  hppe_cre_ip_addr ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppe_cre_os_user ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppe_cre_emp_id  )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                       VALUES(p_bu               ,
"
"                          p_doc_no            ,
"
"                          v_seq_no       ,
"
"                          cr2.hppl_emp_id  ,
"
"                          cr2.hppl_emp_name,
"
"                          'ADJS'       ,
"
"                          cr3.epadj_adj_no ,
"
"                          'ADJUSTMENTS DOCUMENT NEED TO BE POSTED. CURRENT STATUS : '||DECODE(cr3.epadj_status, 'D', 'Entry Completed', 'N', 'NEW'),
"
"                          p_user       ,
"
"                          SYSDATE       ,
"
"                                                  v_ip_addr        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_os_user        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_user_emp_id    );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"         v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c3;
"
"
"
"          FOR cr4 IN c4(cr2.hppl_emp_id, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"          LOOP
"
"
"
"          INSERT INTO hrm_pyrl_prep_excep(hppe_bu       ,
"
"                          hppe_doc_no         ,
"
"                          hppe_seq_no      ,
"
"                          hppe_emp_id       ,
"
"                          hppe_emp_name       ,
"
"                          hppe_sou_doc_type,
"
"                          hppe_sou_doc_no  ,
"
"                          hppe_excep       ,
"
"                          hppe_cre_by       ,
"
"                          hppe_cre_date    ,
"
"                                                  hppe_cre_ip_addr ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppe_cre_os_user ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppe_cre_emp_id  )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                       VALUES(p_bu               ,
"
"                          p_doc_no            ,
"
"                          v_seq_no       ,
"
"                          cr2.hppl_emp_id  ,
"
"                          cr2.hppl_emp_name,
"
"                          'PROF'       ,
"
"                          cr4.ephd_doc_no  ,
"
"                          'EMPLOYEE PROFILES NEED TO BE APPROVED.',
"
"                          p_user       ,
"
"                          SYSDATE       ,
"
"                                                  v_ip_addr        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_os_user        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_user_emp_id    );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"
"
"             v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c4;
"
"
"
"          v_excep_msg := NULL;
"
"
"
"          FOR cr5 IN c5(cr2.hppl_emp_id, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"          LOOP
"
"
"
"         IF cr5.empleave_type = 'L' THEN
"
"            v_excep_type := 'LEAVE';
"
"            v_excep_msg  := 'EMPLOYEE LEAVES ENTRY NEED TO BE POSTED IN LEAVE REGISTER.';
"
"         ELSIF cr5.empleave_type = 'A' THEN
"
"            v_excep_type := 'LADJS';
"
"            v_excep_msg  := 'EMPLOYEE LEAVES ADJUSTMENT NEED TO BE POSTED IN LEAVE REGISTER.';
"
"         ELSIF cr5.empleave_type = 'E' THEN
"
"            v_excep_type := 'LECSH';
"
"            v_excep_msg  := 'EMPLOYEE LEAVES ENCASHMENT NEED TO BE POSTED IN LEAVE REGISTER.';
"
"         ELSE
"
"            v_excep_type := 'LEAVE';
"
"            v_excep_msg  := 'EMPLOYEE LEAVES NEED TO BE POSTED IN LEAVE REGISTER.';
"
"         END IF;
"
"
"
"         INSERT INTO hrm_pyrl_prep_excep(hppe_bu        ,
"
"                         hppe_doc_no          ,
"
"                         hppe_seq_no        ,
"
"                         hppe_emp_id        ,
"
"                         hppe_emp_name        ,
"
"                         hppe_sou_doc_type  ,
"
"                         hppe_sou_doc_no    ,
"
"                         hppe_excep        ,
"
"                         hppe_cre_by        ,
"
"                         hppe_cre_date      ,
"
"                                                 hppe_cre_ip_addr   ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_os_user   ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_emp_id    )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                      VALUES(p_bu                ,
"
"                         p_doc_no             ,
"
"                         v_seq_no        ,
"
"                         cr2.hppl_emp_id    ,
"
"                         cr2.hppl_emp_name  ,
"
"                         v_excep_type        ,
"
"                         cr5.empleave_doc_no,
"
"                         v_excep_msg        ,
"
"                         p_user                 ,
"
"                         SYSDATE        ,
"
"                                                 v_ip_addr          ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_os_user          ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_user_emp_id      );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"             v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c5;
"
"
"
"          FOR cr6 IN c6(cr2.hppl_emp_id, cr1.hpph_year, cr1.hpph_period)
"
"          LOOP
"
"
"
"          INSERT INTO hrm_pyrl_prep_excep(hppe_bu         ,
"
"                          hppe_doc_no           ,
"
"                          hppe_seq_no        ,
"
"                          hppe_emp_id         ,
"
"                          hppe_emp_name         ,
"
"                          hppe_sou_doc_type  ,
"
"                          hppe_sou_doc_no    ,
"
"                          hppe_excep         ,
"
"                          hppe_cre_by         ,
"
"                          hppe_cre_date      ,
"
"                                                  hppe_cre_ip_addr   ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppe_cre_os_user   ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppe_cre_emp_id    )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                       VALUES(p_bu                 ,
"
"                          p_doc_no              ,
"
"                          v_seq_no         ,
"
"                          cr2.hppl_emp_id    ,
"
"                          cr2.hppl_emp_name  ,
"
"                          'OVRT'         ,
"
"                          cr6.eoln_doc_no,
"
"                          'EMPLOYEE OVERTIME ADJUSTMENTS NEED TO BE POSTED.',
"
"                          p_user         ,
"
"                          SYSDATE         ,
"
"                                                  v_ip_addr          ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_os_user          ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_user_emp_id      );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"             v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c6;
"
"
"
"          FOR cr7 IN c7(cr2.hppl_emp_id, cr1.hpph_year, cr1.hpph_period)
"
"          LOOP
"
"
"
"         INSERT INTO hrm_pyrl_prep_excep(hppe_bu      ,
"
"                         hppe_doc_no        ,
"
"                         hppe_seq_no      ,
"
"                         hppe_emp_id      ,
"
"                         hppe_emp_name      ,
"
"                         hppe_sou_doc_type,
"
"                         hppe_sou_doc_no  ,
"
"                         hppe_excep      ,
"
"                         hppe_cre_by      ,
"
"                         hppe_cre_date    ,
"
"                                                 hppe_cre_ip_addr ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_os_user ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_emp_id  )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                      VALUES(p_bu              ,
"
"                         p_doc_no           ,
"
"                         v_seq_no      ,
"
"                         cr2.hppl_emp_id  ,
"
"                         cr2.hppl_emp_name,
"
"                         'TPYRL'      ,
"
"                         cr7.effhd_doc_no ,
"
"                         'EMPLOYEE BE ALREADY PREPARED IN FULL AND FINAL SETTLEMENT PAYROLL. YEAR/PERIOD : '||cr1.hpph_year||'/'||cr1.hpph_period,
"
"                         p_user            ,
"
"                         SYSDATE      ,
"
"                                                 v_ip_addr        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_os_user        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_user_emp_id    );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"             v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c7;
"
"
"
"          v_excep_msg := NULL;
"
"
"
"          OPEN c8(cr2.hppl_emp_id);
"
"          FETCH c8 INTO cr8;
"
"
"
"             IF c8%FOUND THEN
"
"
"
"                   IF cr8.emp_type = 'E' AND cr8.emp_prob_start_date IS NOT NULL AND cr8.emp_prob_end_date IS NOT NULL THEN
"
"
"
"                   IF cr8.emp_prob_period_status NOT IN ('C') AND TRUNC(cr8.emp_prob_end_date) < TRUNC(cr1.hpph_date_to) THEN
"
"                      v_excep_msg := 'Cannot Prepare payroll since work period is exceeds for Probation. Please complete the Probation.';
"
"                      END IF;
"
"
"
"                    END IF;
"
"
"
"                    IF cr8.emp_type = 'C' AND cr8.emp_date_from IS NOT NULL AND cr8.emp_date_to IS NOT NULL  THEN
"
"
"
"                       IF cr8.emp_cont_status NOT IN ('C') AND TRUNC(cr8.emp_date_to) < TRUNC(cr1.hpph_date_to) THEN
"
"                          v_excep_msg := 'Cannot Prepare payroll since work period is exceeds for Contract. Please extend the Contract.';
"
"                       END IF;
"
"
"
"                    END IF;
"
"
"
"                    IF cr8.emp_type = 'R' AND cr8.emp_appr_tri_start_date IS NOT NULL AND cr8.emp_appr_tri_end_date IS NOT NULL THEN
"
"
"
"                       IF cr8.emp_appr_tri_con_date IS NULL AND TRUNC(cr8.emp_appr_tri_end_date) < TRUNC(cr1.hpph_date_to) THEN
"
"                          v_excep_msg := 'Cannot Prepare payroll since Training period is exceeds for Training. Please confirm the Completion Date.';
"
"                       END IF;
"
"
"
"                    END IF;
"
"
"
"            IF v_excep_msg IS NOT NULL THEN
"
"
"
"               INSERT INTO hrm_pyrl_prep_excep(hppe_bu            ,
"
"                               hppe_doc_no      ,
"
"                               hppe_seq_no      ,
"
"                               hppe_emp_id    ,
"
"                               hppe_emp_name    ,
"
"                               hppe_sou_doc_type,
"
"                               hppe_sou_doc_no  ,
"
"                               hppe_excep    ,
"
"                               hppe_cre_by    ,
"
"                               hppe_cre_date    ,
"
"                                                       hppe_cre_ip_addr ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                       hppe_cre_os_user ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                       hppe_cre_emp_id  )                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                            VALUES(p_bu            ,
"
"                                 p_doc_no         ,
"
"                                 v_seq_no        ,
"
"                               cr2.hppl_emp_id  ,
"
"                               cr2.hppl_emp_name,
"
"                               'EMPP'            ,
"
"                               NULL            ,
"
"                               v_excep_msg      ,
"
"                               p_user            ,
"
"                               SYSDATE            ,
"
"                                                       v_ip_addr        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                       v_os_user        ,                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                       v_user_emp_id    );                --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"               v_seq_no := v_seq_no + 1;
"
"
"
"            END IF;
"
"
"
"            IF cr1.hpph_clndr_id IS NOT NULL THEN
"
"
"
"               IF cr8.emp_clndr_id IS NULL THEN
"
"
"
"                  INSERT INTO hrm_pyrl_prep_excep(hppe_bu           ,
"
"                                  hppe_doc_no          ,
"
"                                  hppe_seq_no          ,
"
"                                  hppe_emp_id           ,
"
"                                  hppe_emp_name        ,
"
"                                  hppe_sou_doc_type    ,
"
"                                  hppe_sou_doc_no      ,
"
"                                  hppe_excep           ,
"
"                                  hppe_cre_by           ,
"
"                                  hppe_cre_date        ,
"
"                                                          hppe_cre_ip_addr      ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          hppe_cre_os_user      ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          hppe_cre_emp_id       )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                               VALUES(p_bu                ,
"
"                                    p_doc_no             ,
"
"                                    v_seq_no        ,
"
"                                  cr2.hppl_emp_id      ,
"
"                                  cr2.hppl_emp_name    ,
"
"                                  'CLNDR'            ,
"
"                                  NULL                ,
"
"                                  'CALENDAR NOT DEFINED FOR EMPLOYEE.',
"
"                                  p_user            ,
"
"                                  SYSDATE            ,
"
"                                                          v_ip_addr             ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          v_os_user             ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          v_user_emp_id         );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"                  v_seq_no := v_seq_no + 1;
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
"            IF TRUNC(ADD_MONTHS(TRUNC(cr8.emp_dob), cr8.emp_retirement_age * 12)) BETWEEN TRUNC(cr1.hpph_date_from) AND TRUNC(cr1.hpph_date_to) THEN
"
"
"
"               OPEN c14(cr2.hppl_emp_id);
"
"               FETCH c14 INTO cr14;
"
"
"
"                  IF c14%NOTFOUND THEN
"
"
"
"                        INSERT INTO hrm_pyrl_prep_excep(hppe_bu               ,
"
"                                        hppe_doc_no              ,
"
"                                     hppe_seq_no              ,
"
"                                     hppe_emp_id           ,
"
"                                     hppe_emp_name            ,
"
"                                     hppe_sou_doc_type        ,
"
"                                     hppe_sou_doc_no          ,
"
"                                     hppe_excep               ,
"
"                                     hppe_cre_by           ,
"
"                                     hppe_cre_date            ,
"
"                                                             hppe_cre_ip_addr           ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                             hppe_cre_os_user           ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                             hppe_cre_emp_id            )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                              VALUES(p_bu                ,
"
"                                     p_doc_no                 ,
"
"                                     v_seq_no            ,
"
"                                     cr2.hppl_emp_id          ,
"
"                                     cr2.hppl_emp_name        ,
"
"                                     'ERETI'                    ,
"
"                                     NULL                ,
"
"                                     'EMPLOYEE IN RETIREMENT PERIOD. PLEASE MAKE RETIREMENT ENTRY.',
"
"                                     p_user                ,
"
"                                     SYSDATE                ,
"
"                                                             v_ip_addr                  ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                             v_os_user                  ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                             v_user_emp_id              );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"                     v_seq_no := v_seq_no + 1;
"
"
"
"                  END IF;
"
"
"
"               CLOSE c14;
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
"          CLOSE c8;
"
"
"
"          OPEN c9(cr2.hppl_emp_id);
"
"          FETCH c9 INTO cr9;
"
"
"
"         IF c9%NOTFOUND THEN
"
"
"
"            INSERT INTO hrm_pyrl_prep_excep(hppe_bu         ,
"
"                            hppe_doc_no      ,
"
"                            hppe_seq_no      ,
"
"                            hppe_emp_id         ,
"
"                            hppe_emp_name    ,
"
"                            hppe_sou_doc_type,
"
"                            hppe_sou_doc_no  ,
"
"                            hppe_excep         ,
"
"                            hppe_cre_by         ,
"
"                            hppe_cre_date    ,
"
"                                                    hppe_cre_ip_addr ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                    hppe_cre_os_user ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                    hppe_cre_emp_id  )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                         VALUES(p_bu         ,
"
"                            p_doc_no         ,
"
"                            v_seq_no         ,
"
"                            cr2.hppl_emp_id  ,
"
"                            cr2.hppl_emp_name,
"
"                            'EMPW'         ,
"
"                            NULL         ,
"
"                            'EMPLOYEE WORKDAY CALENDAR ZONE NOT DEFINED.',
"
"                            p_user         ,
"
"                            SYSDATE         ,
"
"                                                    v_ip_addr        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                    v_os_user        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                    v_user_emp_id    );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"            v_seq_no := v_seq_no + 1;
"
"
"
"         ELSE
"
"
"
"            OPEN c10(cr9.ewcz_zone, cr1.hpph_year, cr1.hpph_clndr_id);
"
"            FETCH c10 INTO cr10;
"
"
"
"               IF c10%NOTFOUND THEN
"
"
"
"                  INSERT INTO hrm_pyrl_prep_excep(hppe_bu       ,
"
"                                  hppe_doc_no      ,
"
"                                  hppe_seq_no      ,
"
"                                  hppe_emp_id       ,
"
"                                  hppe_emp_name    ,
"
"                                  hppe_sou_doc_type,
"
"                                  hppe_sou_doc_no  ,
"
"                                  hppe_excep       ,
"
"                                  hppe_cre_by       ,
"
"                                  hppe_cre_date    ,
"
"                                                          hppe_cre_ip_addr ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          hppe_cre_os_user ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          hppe_cre_emp_id  )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                               VALUES(p_bu                ,
"
"                                  p_doc_no         ,
"
"                                  v_seq_no       ,
"
"                                  cr2.hppl_emp_id  ,
"
"                                  cr2.hppl_emp_name,
"
"                                  'ZONE'       ,
"
"                                  cr9.ewcz_zone       ,
"
"                                  'WORKDAY CALENDAR ZONE NOT FOUND.',
"
"                                  p_user       ,
"
"                                  SYSDATE       ,
"
"                                                          v_ip_addr        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          v_os_user        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                          v_user_emp_id    );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"              v_seq_no := v_seq_no + 1;
"
"
"
"               END IF;
"
"
"
"            CLOSE c10;
"
"
"
"         END IF;
"
"
"
"          CLOSE c9;
"
"
"
"          FOR cr11 IN c11(cr2.hppl_emp_id)
"
"          LOOP
"
"
"
"             INSERT INTO hrm_pyrl_prep_excep(hppe_bu      ,
"
"                         hppe_doc_no        ,
"
"                         hppe_seq_no      ,
"
"                         hppe_emp_id      ,
"
"                         hppe_emp_name      ,
"
"                         hppe_sou_doc_type,
"
"                         hppe_sou_doc_no  ,
"
"                         hppe_excep      ,
"
"                         hppe_cre_by      ,
"
"                         hppe_cre_date    ,
"
"                                                 hppe_cre_ip_addr ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_os_user ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_emp_id  )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                      VALUES(p_bu              ,
"
"                             p_doc_no           ,
"
"                             v_seq_no      ,
"
"                             cr2.hppl_emp_id  ,
"
"                         cr2.hppl_emp_name,
"
"                         'LOANS'      ,
"
"                         cr11.elr_rqst_no ,
"
"                         'LOAN DOCUMENT WAITING FOR PLAN CREATION.',
"
"                         p_user             ,
"
"                         SYSDATE      ,
"
"                                                 v_ip_addr        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_os_user        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_user_emp_id    );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"             v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c11;
"
"
"
"          FOR cr12 IN c12(cr2.hppl_emp_id, cr1.hpph_year, cr1.hpph_period)
"
"          LOOP
"
"
"
"             INSERT INTO hrm_pyrl_prep_excep(hppe_bu      ,
"
"                         hppe_doc_no        ,
"
"                         hppe_seq_no      ,
"
"                         hppe_emp_id      ,
"
"                         hppe_emp_name      ,
"
"                         hppe_sou_doc_type,
"
"                         hppe_sou_doc_no  ,
"
"                         hppe_excep      ,
"
"                         hppe_cre_by      ,
"
"                         hppe_cre_date    ,
"
"                                                 hppe_cre_ip_addr ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_os_user ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_emp_id  )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                      VALUES(p_bu              ,
"
"                             p_doc_no           ,
"
"                             v_seq_no      ,
"
"                             cr2.hppl_emp_id  ,
"
"                         cr2.hppl_emp_name,
"
"                         'LATE'            ,
"
"                         cr12.ela_doc_no  ,
"
"                         'EMPLOYEE LATE ENTRY DOCUMENT NEED TO BE POSTED.',
"
"                         p_user             ,
"
"                         SYSDATE      ,
"
"                                                 v_ip_addr        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_os_user        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_user_emp_id    );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"             v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c12;
"
"
"
"          FOR cr15 IN c15(cr2.hppl_emp_id)
"
"          LOOP
"
"
"
"             INSERT INTO hrm_pyrl_prep_excep(hppe_bu      ,
"
"                         hppe_doc_no        ,
"
"                         hppe_seq_no      ,
"
"                         hppe_emp_id      ,
"
"                         hppe_emp_name      ,
"
"                         hppe_sou_doc_type,
"
"                         hppe_sou_doc_no  ,
"
"                         hppe_excep      ,
"
"                         hppe_cre_by      ,
"
"                         hppe_cre_date    ,
"
"                                                 hppe_cre_ip_addr ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_os_user ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_emp_id  )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                      VALUES(p_bu              ,
"
"                             p_doc_no           ,
"
"                             v_seq_no      ,
"
"                             cr2.hppl_emp_id  ,
"
"                         cr2.hppl_emp_name,
"
"                         'LECSH'        ,
"
"                         cr15.lr_req_no   ,
"
"                         'EMPLOYEE LEAVE ENCASHMENT DOCUMENT NEED TO BE POSTED/PENDING FOR PAYMENT.',
"
"                         p_user             ,
"
"                         SYSDATE      ,
"
"                                                 v_ip_addr        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_os_user        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_user_emp_id    );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"             v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c12;
"
"
"
"          FOR cr16 IN c16(cr2.hppl_emp_id, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"          LOOP
"
"
"
"             INSERT INTO hrm_pyrl_prep_excep(hppe_bu      ,
"
"                         hppe_doc_no        ,
"
"                         hppe_seq_no      ,
"
"                         hppe_emp_id      ,
"
"                         hppe_emp_name      ,
"
"                         hppe_sou_doc_type,
"
"                         hppe_sou_doc_no  ,
"
"                         hppe_excep      ,
"
"                         hppe_cre_by      ,
"
"                         hppe_cre_date    ,
"
"                                                 hppe_cre_ip_addr ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_os_user ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 hppe_cre_emp_id  )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                      VALUES(p_bu              ,
"
"                         p_doc_no           ,
"
"                         v_seq_no      ,
"
"                         cr2.hppl_emp_id  ,
"
"                         cr2.hppl_emp_name,
"
"                         'TPYRL'      ,
"
"                         cr16.emprel_doc_no,
"
"                         'EMPLOYEE RELIEVE REQUEST PENDING.',
"
"                         p_user            ,
"
"                         SYSDATE      ,
"
"                                                 v_ip_addr        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_os_user        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                 v_user_emp_id    );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"
"
"            v_seq_no := v_seq_no + 1;
"
"
"
"          END LOOP c16;
"
"
"
"            END LOOP c2;
"
"
"
"        OPEN c13;
"
"        FETCH c13 INTO cr13;
"
"
"
"           IF cr13.v_excep_cnt > 0 THEN
"
"          p_res := 'Y';
"
"           ELSE
"
"          p_res := 'N';
"
"            END IF;
"
"
"
"        CLOSE c13;
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
"   END proc_chk_pyrl_excep;
"
"
"
"   PROCEDURE proc_pyrl_type_prep(p_bu                VARCHAR2,
"
"                    p_doc_no            VARCHAR2,
"
"                    p_user                VARCHAR2,
"
"                    p_res        OUT        VARCHAR2,
"
"                    p_emp_id            VARCHAR2    DEFAULT  NULL)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pyrl_prep_hd
"
"    WHERE hpph_bu     = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status IN ('N');
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
"     FROM hrm_pyrl_prep_ln
"
"    WHERE hppl_bu      = p_bu
"
"      AND hppl_doc_no  = p_doc_no
"
"      AND (hppl_emp_id = p_emp_id OR p_emp_id IS NULL);
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT 1
"
"     FROM pyrl_inter_values,
"
"          pyrl_report_labels_ln
"
"    WHERE piv_bu       = prln_bu
"
"      AND piv_elmnt_id = prln_elmnt_id
"
"      AND piv_bu       = p_bu
"
"    UNION
"
"   SELECT 1
"
"     FROM pyrl_inter_logical_values,
"
"          pyrl_report_labels_ln
"
"    WHERE pilv_bu       = prln_bu
"
"      AND pilv_elmnt_id = prln_elmnt_id
"
"      AND pilv_bu       = p_bu;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id                    VARCHAR2,
"
"            c_year                NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu        = p_bu
"
"      AND htch_fin_year  = c_year
"
"      AND htch_emp_id    = c_emp_id
"
"      AND htch_hold_flag = 'N';
"
"
"
"      cr4                    c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_year                NUMBER,
"
"            c_period                NUMBER,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"       IS
"
"   SELECT ephd_emp_id,
"
"          MIN(LEAST(ephd_new_basic_eff_from, epln_allow_eff_from)) ephd_min_date
"
"     FROM (SELECT ephd_emp_id,
"
"                TRUNC(ephd_eff_date) ephd_eff_date,
"
"                  NVL(TRUNC(ephd_new_basic_eff_from), TRUNC(ephd_eff_date)) ephd_new_basic_eff_from,
"
"                  NVL(TRUNC(epln_allow_eff_from), TRUNC(ephd_eff_date)) epln_allow_eff_from
"
"             FROM (SELECT *
"
"                     FROM emp_profiles_hd,
"
"                          emp_profiles_ln
"
"                    WHERE ephd_bu     = epln_bu(+)
"
"                      AND ephd_doc_no = epln_doc_no(+)
"
"                      AND ephd_bu     = p_bu
"
"                      AND (TRUNC(ephd_eff_date) <> TRUNC(ephd_new_basic_eff_from) OR TRUNC(ephd_eff_date) <> TRUNC(epln_allow_eff_from)))
"
"            WHERE ephd_bu     = epln_bu
"
"              AND ephd_doc_no = epln_doc_no
"
"              AND (TRUNC(ephd_eff_date) <> TRUNC(ephd_new_basic_eff_from) OR TRUNC(ephd_eff_date) <> TRUNC(epln_allow_eff_from))
"
"              AND ephd_year   = c_year
"
"              AND ephd_period = c_period
"
"              AND ephd_status = 'A'
"
"              AND TRUNC(ephd_eff_date) BETWEEN c_start_date AND c_end_date
"
"              AND EXISTS (SELECT pact_action_id
"
"                            FROM profile_actions
"
"                           WHERE pact_bu          = ephd_bu
"
"                             AND pact_action_id   = ephd_action_id
"
"                             AND pact_action_type = 'O'))
"
"    GROUP BY ephd_emp_id
"
"    UNION
"
"   SELECT ephd_emp_id,
"
"      LEAST(TRUNC(ephd_eff_date), TRUNC(ephd_new_basic_eff_from))
"
"     FROM emp_profiles_hd
"
"    WHERE ephd_bu     = p_bu
"
"      AND ephd_year   = c_year
"
"      AND ephd_period = c_period
"
"      AND TRUNC(ephd_eff_date) <> TRUNC(ephd_new_basic_eff_from)
"
"      AND TRUNC(ephd_new_basic_eff_from) < TRUNC(ephd_eff_date)
"
"      AND TRUNC(ephd_eff_date) BETWEEN c_start_date AND c_end_date
"
"      AND ephd_status = 'A'
"
"      AND EXISTS (SELECT 1
"
"                    FROM profile_actions
"
"                   WHERE pact_bu          = ephd_bu
"
"                     AND pact_action_id   = ephd_action_id
"
"                     AND pact_action_type = 'O')
"
"      AND NOT EXISTS (SELECT 1
"
"                  FROM emp_profiles_ln
"
"                     WHERE epln_bu     = ephd_bu
"
"                       AND epln_doc_no = ephd_doc_no);
"
"
"
"   CURSOR c6(c_year                NUMBER,
"
"            c_period                NUMBER,
"
"            c_start_date            DATE,
"
"            c_end_date                DATE)
"
"       IS
"
"   SELECT *
"
"     FROM emp_profiles_hd a
"
"    WHERE a.ephd_bu     = p_bu
"
"      AND a.ephd_year   = c_year
"
"      AND a.ephd_period = c_period
"
"      AND a.ephd_status = 'A'
"
"      AND TRUNC(a.ephd_eff_date) <> c_start_date
"
"      AND EXISTS (SELECT 1
"
"                    FROM profile_actions
"
"                   WHERE pact_bu          = a.ephd_bu
"
"                     AND pact_action_id   = a.ephd_action_id
"
"                     AND pact_action_type = 'O')
"
"      AND NOT EXISTS (SELECT 1
"
"                        FROM employees
"
"                       WHERE emp_bu     = a.ephd_bu
"
"                         AND emp_emp_id = a.ephd_emp_id
"
"                         AND emp_last_proc_year   IS NULL
"
"                         AND emp_last_proc_period IS NULL)
"
"      AND NOT EXISTS (SELECT 1
"
"                  FROM emp_profiles_hd b
"
"                     WHERE b.ephd_bu     = a.ephd_bu
"
"                       AND b.ephd_emp_id = a.ephd_emp_id
"
"                  AND b.ephd_year   = a.ephd_year
"
"                  AND b.ephd_period = a.ephd_period
"
"                         AND b.ephd_status = 'A'
"
"                         AND EXISTS (SELECT 1
"
"                           FROM profile_actions
"
"                          WHERE pact_bu          = b.ephd_bu
"
"                            AND pact_action_id   = b.ephd_action_id
"
"                                        AND pact_action_type = 'N')
"
"                      HAVING COUNT(*) > 1)
"
"      AND NOT EXISTS (SELECT 1
"
"                 FROM arrear_employees
"
"                    WHERE are_bu     = a.ephd_bu
"
"                      AND are_emp_id = a.ephd_emp_id);
"
"
"
"      v_res                    VARCHAR2(1) := 'N';
"
"      v_prj_res                    VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 16-apr-2022 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 16-apr-2022 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 16-apr-2022 : Ajis
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
"            v_res := 'N';
"
"
"
"            DELETE
"
"              FROM payroll_employees
"
"             WHERE pe_bu     = p_bu
"
"               AND pe_year   = cr1.hpph_year
"
"               AND pe_period = cr1.hpph_period;
"
"
"
"            DELETE
"
"              FROM arrear_employees;
"
"
"
"            DELETE
"
"              FROM prorata_employees;
"
"
"
"            /* Insert Arrear Employees */
"
"
"
"            FOR cr5 IN c5(cr1.hpph_year, cr1.hpph_period, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"            LOOP
"
"
"
"               INSERT INTO arrear_employees(are_bu        ,
"
"                        are_emp_id        ,
"
"                        are_mindate        ,
"
"                        are_cre_by        ,
"
"                        are_cre_date    ,
"
"                                            are_cre_ip_addr     ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                            are_cre_os_user     ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                            are_cre_emp_id      )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                     VALUES(p_bu        ,        --are_bu
"
"                             cr5.ephd_emp_id    ,        --are_emp_id
"
"                             cr5.ephd_min_date    ,        --are_mindate
"
"                             p_user        ,        --are_cre_by
"
"                             SYSDATE        ,        --are_cre_date
"
"                                            v_ip_addr           ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                            v_os_user           ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                            v_user_emp_id       );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"            END LOOP c5;
"
"
"
"            /* Insert Prorata Employees */
"
"
"
"            FOR cr6 IN c6(cr1.hpph_year, cr1.hpph_period, TRUNC(cr1.hpph_date_from), TRUNC(cr1.hpph_date_to))
"
"            LOOP
"
"
"
"                INSERT INTO prorata_employees(pre_bu         ,
"
"                                          pre_emp_id         ,
"
"                                          pre_date         ,
"
"                                          pre_year         ,
"
"                                          pre_period         ,
"
"                                          pre_cre_by         ,
"
"                                          pre_cre_date     ,
"
"                                             pre_cre_ip_addr     ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                             pre_cre_os_user     ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                             pre_cre_emp_id      )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                      VALUES(p_bu         ,
"
"                                               cr6.ephd_emp_id     ,
"
"                                               TRUNC(cr6.ephd_date),
"
"                                               cr1.hpph_year     ,
"
"                                               cr1.hpph_period     ,
"
"                                               p_user         ,
"
"                                               SYSDATE         ,
"
"                                             v_ip_addr           ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                             v_os_user           ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                             v_user_emp_id       );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"            END LOOP c6;
"
"
"
"            INSERT INTO payroll_zone(pz_bu            ,
"
"                                 pz_pyrl_type        ,
"
"                                 pz_year            ,
"
"                                 pz_period            ,
"
"                                 pz_clndr_id        ,
"
"                                 pz_cre_by            ,
"
"                                 pz_cre_date        ,
"
"                                     pz_cre_ip_addr        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                     pz_cre_os_user        ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                     pz_cre_emp_id        )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                          VALUES(p_bu            ,
"
"                         'N'            ,
"
"                         cr1.hpph_year        ,
"
"                         cr1.hpph_period        ,
"
"                         cr1.hpph_clndr_id        ,
"
"                         p_user            ,
"
"                         SYSDATE            ,
"
"                                     v_ip_addr               ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                     v_os_user               ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                     v_user_emp_id           );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"           OPEN c4(cr2.hppl_emp_id, cr1.hpph_year);
"
"           FETCH c4 INTO cr4;
"
"
"
"              IF c4%FOUND THEN
"
"
"
"             DELETE emp_pyrl_adjustments
"
"              WHERE epadj_bu           = p_bu
"
"                AND epadj_emp_id       = cr2.hppl_emp_id
"
"                AND epadj_start_year   = cr1.hpph_year
"
"                AND epadj_start_period = cr1.hpph_period
"
"                AND epadj_elmnt_id     = 'TDS'
"
"                AND epadj_reference    = 'TDS DEDUCTION';
"
"
"
"              END IF;
"
"
"
"           CLOSE c4;
"
"
"
"           proc_calc_emp_ovrt_prep_pyrl(p_bu,
"
"                               cr1.hpph_year,
"
"                               cr1.hpph_period,
"
"                               p_user,
"
"                               1,
"
"                               cr2.hppl_emp_id,
"
"                               cr1.hpph_clndr_id);
"
"
"
"               DELETE payroll_prep_ln_det
"
"                WHERE pplnd_bu     = p_bu
"
"                  AND pplnd_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE payroll_prep_ln
"
"            WHERE ppln_bu     = p_bu
"
"              AND ppln_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE payroll_prep_hd
"
"                WHERE pphd_bu     = p_bu
"
"                  AND pphd_emp_id = cr2.hppl_emp_id;
"
"
"
"           DELETE pyrl_inter_values
"
"                WHERE piv_bu     = p_bu
"
"                  AND piv_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE pyrl_inter_logical_values
"
"                WHERE pilv_bu     = p_bu
"
"                  AND pilv_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE pyrl_leave_accrual_pandl_ln
"
"                WHERE papln_bu     = p_bu
"
"                  AND papln_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE pyrl_leave_accrual_pandl
"
"                WHERE pap_bu     = p_bu
"
"                  AND pap_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE retro_payroll_ln
"
"                WHERE rpln_bu     = p_bu
"
"                  AND rpln_emp_id = cr2.hppl_emp_id;
"
"
"
"
"
"           IF cr2.hppl_prep_flag = 'Y' AND cr2.hppl_emp_status NOT IN ('H') THEN
"
"
"
"                  proc_ins_pyrl_leave_details(p_bu,
"
"                                     cr2.hppl_emp_id,
"
"                                 TRUNC(cr1.hpph_date_from),
"
"                               TRUNC(cr1.hpph_date_to),
"
"                                          cr1.hpph_year,
"
"                                          cr1.hpph_period,
"
"                                          p_user);
"
"
"
"              proc_ins_payroll_leave_details(p_bu,
"
"                                    cr2.hppl_emp_id,
"
"                                             TRUNC(cr1.hpph_date_from),
"
"                             TRUNC(cr1.hpph_date_to),
"
"                             cr1.hpph_year,
"
"                             cr1.hpph_period,
"
"                                             p_user);
"
"
"
"                  proc_normal_payroll_prepare(p_bu,
"
"                                              TRUNC(cr1.hpph_date_from),
"
"                                              TRUNC(cr1.hpph_date_to),
"
"                                              cr1.hpph_year,
"
"                                              cr1.hpph_period,
"
"                                              cr2.hppl_emp_id,
"
"                                              TRUNC(cr2.hppl_emp_start_date),
"
"                                              p_user,
"
"                                              1,
"
"                                              cr2.hppl_pay_basis,
"
"                                              'N',
"
"                                              p_doc_no);
"
"
"
"                  OPEN c3;
"
"                  FETCH c3 INTO cr3;
"
"
"
"                     IF c3%FOUND THEN
"
"
"
"                        proc_ins_pf_esi_values(p_bu,
"
"                                               cr2.hppl_emp_id,
"
"                                               cr1.hpph_year,
"
"                                               cr1.hpph_period,
"
"                                               p_user);
"
"
"
"                    END IF;
"
"
"
"                  CLOSE c3;
"
"                  INSERT INTO payroll_employees(pe_bu        ,
"
"                                        pe_emp_id    ,
"
"                                        pe_group_id    ,
"
"                                        pe_year        ,
"
"                                        pe_period    ,
"
"                                        pe_pyrl_type    ,
"
"                                        pe_cre_by    ,
"
"                                        pe_cre_date    ,
"
"                        pe_cre_ip_addr  ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                        pe_cre_os_user  ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                        pe_cre_emp_id   )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                 VALUES(p_bu        ,            --pe_bu
"
"                                        cr2.hppl_emp_id    ,            --pe_emp_id
"
"                                        cr2.hppl_grp_id ,            --pe_group_id
"
"                                        cr1.hpph_year    ,            --pe_year
"
"                                        cr1.hpph_period    ,            --pe_period
"
"                                        'N'        ,            --pe_pyrl_type
"
"                                        p_user        ,            --pe_cre_by
"
"                                        SYSDATE        ,            --pe_cre_date
"
"                                                v_ip_addr       ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                v_os_user       ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                v_user_emp_id   );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"
"
"                  v_res := 'Y';
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
"            proc_upd_prj_dtls(p_bu,
"
"                          p_doc_no,
"
"                          p_user,
"
"                          v_prj_res);
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
"   END proc_pyrl_type_prep;
"
"
"
"   PROCEDURE proc_del_prep_pyrl(p_bu                VARCHAR2,
"
"                          p_doc_no            VARCHAR2,
"
"                          p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pyrl_prep_hd
"
"    WHERE hpph_bu     = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status IN ('N');
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
"     FROM hrm_pyrl_prep_ln
"
"    WHERE hppl_bu        = p_bu
"
"      AND hppl_doc_no    = p_doc_no;
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
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"               DELETE payroll_prep_ln_det
"
"                WHERE pplnd_bu     = p_bu
"
"                  AND pplnd_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE payroll_prep_ln
"
"            WHERE ppln_bu     = p_bu
"
"              AND ppln_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE payroll_prep_hd
"
"                WHERE pphd_bu     = p_bu
"
"                  AND pphd_emp_id = cr2.hppl_emp_id;
"
"
"
"           DELETE pyrl_inter_values
"
"                WHERE piv_bu     = p_bu
"
"                  AND piv_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE pyrl_inter_logical_values
"
"                WHERE pilv_bu     = p_bu
"
"                  AND pilv_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE pyrl_leave_accrual_pandl_ln
"
"                WHERE papln_bu     = p_bu
"
"                  AND papln_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE pyrl_leave_accrual_pandl
"
"                WHERE pap_bu     = p_bu
"
"                  AND pap_emp_id = cr2.hppl_emp_id;
"
"
"
"               DELETE retro_payroll_ln
"
"                WHERE rpln_bu     = p_bu
"
"                  AND rpln_emp_id = cr2.hppl_emp_id;
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
"   END proc_del_prep_pyrl;
"
"
"
"   PROCEDURE proc_process_pyrl(p_bu                VARCHAR2,
"
"                      p_doc_no                VARCHAR2,
"
"                      p_user                VARCHAR2,
"
"                      p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pyrl_prep_hd
"
"    WHERE hpph_bu = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status = 'R';
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
"     FROM hrm_pyrl_prep_hd,
"
"          hrm_pyrl_prep_ln
"
"    WHERE hpph_bu = hppl_bu
"
"      AND hpph_doc_no = hppl_doc_no
"
"      AND hpph_bu = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status = 'R'
"
"      AND hppl_prep_flag = 'Y';
"
"
"
"   CURSOR c3(c_emp_id        VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu     = p_bu
"
"      AND emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_emp_id = c_emp_id;
"
"
"
"      cr3            c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id        VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_prep_hd
"
"    WHERE pphd_bu = p_bu
"
"      AND pphd_batch_no = p_doc_no
"
"      AND pphd_emp_id = c_emp_id;
"
"
"
"      cr4            c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_emp_id        VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(DECODE(ppln_mode,'+',ppln_amount,0)),0) ppln_add_amount,
"
"          NVL(SUM(DECODE(ppln_mode,'-',ppln_amount,0)),0) ppln_ded_amount
"
"     FROM payroll_prep_hd,
"
"          payroll_prep_ln
"
"    WHERE pphd_bu = p_bu
"
"      AND pphd_batch_no = p_doc_no
"
"      AND pphd_year = ppln_year
"
"      AND pphd_period = ppln_period
"
"      AND pphd_emp_id = ppln_emp_id
"
"      AND pphd_batch_no = ppln_batch_no
"
"      AND pphd_emp_id = c_emp_id;
"
"
"
"      cr5            c5%ROWTYPE;
"
"
"
"   CURSOR c6
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pyrl_prep_unit
"
"    WHERE hppu_bu = p_bu
"
"      AND hppu_doc_no = p_doc_no
"
"      AND hppu_sel_flag = 'Y';
"
"
"
"   CURSOR c7(c_loc_id   VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM bus_unit_plants_loc_dtls
"
"    WHERE bupld_bu = p_bu
"
"      AND bupld_loc_id = c_loc_id;
"
"
"
"      cr7           c7%ROWTYPE;
"
"
"
"      v_unit_seq_no                NUMBER(5);
"
"      v_pyrl_seq_no                NUMBER(5);
"
"
"
"      v_doc_no                    VARCHAR2(10);
"
"      v_grade_id                VARCHAR2(10);
"
"      v_acct_cat_id                VARCHAR2(10);
"
"      v_loc_id                    VARCHAR2(10);
"
"
"
"      v_grade_desc                VARCHAR2(200);
"
"      v_loc_desc                VARCHAR2(200);
"
"      v_acct_cat_desc                VARCHAR2(200);
"
"
"
"      v_batch_no                VARCHAR2(15);
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 16-apr-2022 : Ajis
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;        --added 16-apr-2022 : Ajis
"
"      v_user_emp_id                VARCHAR2(50) := func_find_emp_id(p_bu,p_user);    --added 16-apr-2022 : Ajis
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
"            RAISE_APPLICATION_ERROR(-20072,'HRM'||' '||p_bu||' '||p_doc_no);
"
"         ELSE
"
"
"
"            SELECT NVL(MAX(TO_NUMBER(hpph_doc_no)),0) + 1
"
"              INTO v_doc_no
"
"              FROM hrm_payroll_process_hd
"
"             WHERE hpph_bu = p_bu;
"
"
"
"        INSERT INTO hrm_payroll_process_hd(hpph_bu          ,
"
"                           hpph_doc_no      ,
"
"                           hpph_doc_date      ,
"
"                           hpph_pyrl_type      ,
"
"                           hpph_clndr_id      ,
"
"                           hpph_year      ,
"
"                           hpph_period      ,
"
"                           hpph_start_date      ,
"
"                           hpph_end_date      ,
"
"                           hpph_proc_type      ,
"
"                           hpph_load_dtl_flag ,
"
"                           hpph_ref          ,
"
"                           hpph_status      ,
"
"                           hpph_cre_by      ,
"
"                           hpph_cre_date      ,
"
"                                               hpph_cre_ip_addr   ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                               hpph_cre_os_user   ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                               hpph_cre_emp_id    )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                        VALUES(p_bu          ,                      --hpph_bu
"
"                           v_doc_no          ,                      --hpph_doc_no
"
"                           SYSDATE          ,                      --hpph_doc_date
"
"                           'N'          ,                      --hpph_pyrl_type
"
"                           cr1.hpph_clndr_id  ,                      --hpph_clndr_id
"
"                           cr1.hpph_year      ,                      --hpph_year
"
"                           cr1.hpph_period      ,                      --hpph_period
"
"                           cr1.hpph_date_from ,                      --hpph_start_date
"
"                           cr1.hpph_date_to   ,                      --hpph_end_date
"
"                           'U'          ,                      --hpph_proc_type
"
"                           'Y'          ,                      --hpph_load_dtl_flag
"
"                           'PAYROLL PROCESS'  ,                      --hpph_ref
"
"                           'R'          ,                      --hpph_status
"
"                           p_user          ,                      --hpph_cre_by
"
"                           SYSDATE          ,                      --hpph_cre_date
"
"                                               v_ip_addr          ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                               v_os_user          ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                               v_user_emp_id      );            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"
"
"            FOR cr6 IN c6
"
"            LOOP
"
"
"
"               SELECT NVL(MAX(hppd_seq_no),0) + 1
"
"                 INTO v_unit_seq_no
"
"                 FROM hrm_payroll_process_dtl
"
"                WHERE hppd_bu = p_bu
"
"                  AND hppd_doc_no = v_doc_no;
"
"
"
"           INSERT INTO hrm_payroll_process_dtl(hppd_bu          ,
"
"                           hppd_doc_no          ,
"
"                           hppd_seq_no          ,
"
"                           hppd_uge_id          ,
"
"                           hppd_uge_desc      ,
"
"                           hppd_sel_flag      ,
"
"                           hppd_cre_by          ,
"
"                           hppd_cre_date      ,
"
"                                                   hppd_cre_ip_addr    ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                   hppd_cre_os_user      ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                   hppd_cre_emp_id    )        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                            VALUES(p_bu               ,                     --hppd_bu
"
"                               v_doc_no          ,                     --hppd_doc_no
"
"                               v_unit_seq_no      ,                     --hppd_seq_no
"
"                               cr6.hppu_plnt      ,                     --hppd_uge_id
"
"                               cr6.hppu_plnt_desc     ,                     --hppd_uge_desc
"
"                               'Y'              ,                     --hppd_sel_flag
"
"                               p_user          ,                     --hppd_cre_by
"
"                               SYSDATE          ,                     --hppd_cre_date
"
"                                                   v_ip_addr            ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                   v_os_user            ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                   v_user_emp_id        );        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"
"
"            END LOOP c6;
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"               SELECT NVL(MAX(hppl_seq_no),0) + 1
"
"                 INTO v_pyrl_seq_no
"
"                 FROM hrm_payroll_process_ln
"
"                WHERE hppl_bu = p_bu
"
"                  AND hppl_doc_no = v_doc_no;
"
"
"
"               OPEN c3(cr2.hppl_emp_id);
"
"               FETCH c3 INTO cr3;
"
"
"
"                  IF c3%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20821,'HRM');
"
"                  ELSE
"
"                     v_acct_cat_id   := cr3.emp_acct_cat_id;
"
"                     v_acct_cat_desc := func_find_acct_cat_desc(p_bu, cr3.emp_acct_cat_id, 1);
"
"                     v_grade_id      := cr3.empai_grade;
"
"                     v_grade_desc    := func_find_grade_desc(p_bu, cr3.empai_grade, 1);
"
"                     v_loc_id        := cr3.empai_loc_id;
"
"
"
"                     OPEN c7(cr3.empai_loc_id);
"
"                     FETCH c7 INTO cr7;
"
"                        IF c7%FOUND THEN
"
"                           v_loc_desc   := func_find_plnt_loc_desc(p_bu, cr3.empai_loc_id);
"
"                        ELSE
"
"                          -- v_loc_desc   := func_find_wrkloc_desc(p_bu, cr3.empai_loc_id, 1);
"
"                          NULL;  --Commented by oormi
"
"                        END IF;
"
"                     CLOSE c7;
"
"
"
"
"
"                  END IF;
"
"
"
"               CLOSE c3;
"
"
"
"               OPEN c4(cr2.hppl_emp_id);
"
"               FETCH c4 INTO cr4;
"
"
"
"                  IF c4%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20821,'HRM');
"
"                  END IF;
"
"
"
"               CLOSE c4;
"
"
"
"               OPEN c5(cr2.hppl_emp_id);
"
"               FETCH c5 INTO cr5;
"
"
"
"                  IF c5%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20821,'HRM');
"
"                  END IF;
"
"
"
"               CLOSE c5;
"
"
"
"               INSERT INTO hrm_payroll_process_ln(hppl_bu         ,
"
"                                              hppl_doc_no         ,
"
"                          hppl_seq_no         ,
"
"                          hppl_emp_id         ,
"
"                          hppl_emp_name         ,
"
"                          hppl_emp_start_date     ,
"
"                          hppl_dept_id         ,
"
"                          hppl_dept_desc     ,
"
"                          hppl_plnt         ,
"
"                          hppl_plnt_desc     ,
"
"                          hppl_pos_id         ,
"
"                          hppl_pos_desc         ,
"
"                          hppl_job_id         ,
"
"                          hppl_job_desc         ,
"
"                          hppl_grp_id         ,
"
"                          hppl_grp_desc         ,
"
"                          hppl_cat_id         ,
"
"                          hppl_cat_desc         ,
"
"                          hppl_acct_cat_id     ,
"
"                          hppl_acct_cat_desc     ,
"
"                          hppl_grade_id         ,
"
"                          hppl_grade_desc     ,
"
"                          hppl_loc_id         ,
"
"                          hppl_loc_desc         ,
"
"                          hppl_mon_days         ,
"
"                          hppl_workin_days     ,
"
"                          hppl_holidays         ,
"
"                          hppl_off         ,
"
"                          hppl_workoff_holiday     ,
"
"                          hppl_bustrip_days     ,
"
"                          hppl_late_hrs         ,
"
"                          hppl_tot_paid_days     ,
"
"                          hppl_paid_leave_days   ,
"
"                          hppl_unpaid_leave_days ,
"
"                          hppl_tot_add         ,
"
"                          hppl_tot_ded         ,
"
"                          hppl_net_sal         ,
"
"                          hppl_net_sal_rnd     ,
"
"                          hppl_emp_status     ,
"
"                          hppl_process_flag     ,
"
"                          hppl_cre_by         ,
"
"                          hppl_cre_date         ,
"
"                                                  hppl_cre_ip_addr       ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppl_cre_os_user       ,            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  hppl_cre_emp_id        )            --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                       VALUES(p_bu             ,                           --hppl_bu
"
"                          v_doc_no             ,                           --hppl_doc_no
"
"                          v_pyrl_seq_no         ,                           --hppl_seq_no
"
"                          cr2.hppl_emp_id     ,                           --hppl_emp_id
"
"                          cr2.hppl_emp_name     ,                           --hppl_emp_name
"
"                          cr2.hppl_emp_start_date,                           --hppl_emp_start_date
"
"                          cr2.hppl_dept_id     ,                           --hppl_dept_id
"
"                          cr2.hppl_dept_desc     ,                           --hppl_dept_desc
"
"                          cr2.hppl_plnt         ,                           --hppl_plnt
"
"                          cr2.hppl_plnt_desc     ,                           --hppl_plnt_desc
"
"                          cr2.hppl_pos_id     ,                           --hppl_pos_id
"
"                          cr2.hppl_pos_desc     ,                           --hppl_pos_desc
"
"                          cr2.hppl_job_id     ,                           --hppl_job_id
"
"                          cr2.hppl_job_desc     ,                           --hppl_job_desc
"
"                          cr2.hppl_grp_id     ,                           --hppl_grp_id
"
"                          cr2.hppl_grp_desc     ,                           --hppl_grp_desc
"
"                          cr2.hppl_cat_id     ,                           --hppl_cat_id
"
"                          cr2.hppl_cat_desc     ,                           --hppl_cat_desc
"
"                          v_acct_cat_id          ,                           --hppl_acct_cat_id
"
"                          v_acct_cat_desc     ,                           --hppl_acct_cat_desc
"
"                          v_grade_id         ,                           --hppl_grade_id
"
"                          v_grade_desc         ,                           --hppl_grade_desc
"
"                          v_loc_id         ,                           --hppl_loc_id
"
"                          v_loc_desc         ,                           --hppl_loc_desc
"
"                          cr4.pphd_mon_days     ,                           --hppl_mon_days
"
"                          cr4.pphd_workin_days     ,                           --hppl_workin_days
"
"                          cr4.pphd_holidays     ,                           --hppl_holidays
"
"                          cr4.pphd_off         ,                           --hppl_off
"
"                          cr4.pphd_workoff_holiday   ,                           --hppl_workoff_holiday
"
"                          cr4.pphd_bustrip_days     ,                           --hppl_bustrip_days
"
"                          cr4.pphd_bustrip_days  ,                           --hppl_late_hrs
"
"                          cr4.pphd_tot_paid_days ,                           --hppl_tot_paid_days
"
"                          cr4.pphd_paid_leave_days   ,                           --hppl_paid_leave_days
"
"                          cr4.pphd_unpaid_leave_days ,                           --hppl_unpaid_leave_days
"
"                          cr5.ppln_add_amount     ,                           --hppl_tot_add
"
"                          cr5.ppln_ded_amount     ,                           --hppl_tot_ded
"
"                          cr4.pphd_net_salary     ,                           --hppl_net_sal
"
"                          cr4.pphd_net_rounded     ,                           --hppl_net_sal_rnd
"
"                          'A'             ,                           --hppl_emp_status
"
"                          'Y'             ,                           --hppl_process_flag
"
"                          p_user         ,                           --hppl_cre_by
"
"                          SYSDATE         ,                           --hppl_cre_date
"
"                                                  v_ip_addr              ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_os_user              ,        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"                                                  v_user_emp_id          );        --- added :  Abdul Ajis .A / 16-Apr-2022
"
"
"
"
"
"            END LOOP c2;
"
"
"
"
"
"            proc_post_prepare_payroll(p_bu,
"
"                              v_doc_no,
"
"                              p_user,
"
"                              v_batch_no,
"
"                              p_doc_no);
"
"
"
"            IF v_batch_no IS NOT NULL THEN
"
"
"
"               UPDATE hrm_pyrl_prep_hd
"
"                  SET hpph_process_batch_no = v_batch_no,
"
"                      hpph_upd_by      = p_user,
"
"                      hpph_upd_date    = SYSDATE,
"
"                      hpph_upd_ip_addr = v_ip_addr,             ---added :  Abdul Ajis .A / 16-Apr-2022
"
"              hpph_upd_os_user = v_os_user,            ---added :  Abdul Ajis .A / 16-Apr-2022
"
"                      hpph_upd_emp_id  = v_user_emp_id            ---added :  Abdul Ajis .A / 16-Apr-2022
"
"                WHERE hpph_bu     = p_bu
"
"                  AND hpph_doc_no = p_doc_no;
"
"
"
"               UPDATE hrm_pyrl_prep_hd
"
"                  SET hpph_status      = 'P',
"
"                      hpph_upd_by      = p_user,
"
"                      hpph_upd_date    = SYSDATE,
"
"                      hpph_upd_ip_addr = v_ip_addr,             ---added :  Abdul Ajis .A / 16-Apr-2022
"
"              hpph_upd_os_user = v_os_user,            ---added :  Abdul Ajis .A / 16-Apr-2022
"
"                      hpph_upd_emp_id  = v_user_emp_id            ---added :  Abdul Ajis .A / 16-Apr-2022
"
"                WHERE hpph_bu     = p_bu
"
"                  AND hpph_doc_no = p_doc_no;
"
"
"
"            ELSE
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
"   END proc_process_pyrl;
"
"
"
"   PROCEDURE proc_upd_prj_dtls(p_bu                VARCHAR2,
"
"                      p_doc_no                VARCHAR2,
"
"                      p_user                VARCHAR2,
"
"                      p_res        OUT        VARCHAR2)
"
"   AS
"
"
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pyrl_prep_hd
"
"    WHERE hpph_bu     = p_bu
"
"      AND hpph_doc_no = p_doc_no
"
"      AND hpph_status IN ('N');
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
"     FROM payroll_prep_hd,
"
"           payroll_prep_ln,
"
"           payroll_elements_hd
"
"    WHERE pphd_bu       = ppln_bu
"
"      AND pphd_year     = ppln_year
"
"      AND pphd_period   = ppln_period
"
"      AND pphd_emp_id   = ppln_emp_id
"
"      AND pphd_batch_no = ppln_batch_no
"
"      AND ppln_bu     = pehd_bu
"
"      AND ppln_elmnt_id = pehd_elmnt_id
"
"      --AND pehd_type    IN ('B','FL','VL','CA3')
"
"      AND pphd_bu       = p_bu
"
"      AND pphd_batch_no = p_doc_no;
"
"
"
"   CURSOR c2(c_year            NUMBER,
"
"            c_period            NUMBER,
"
"            c_clndr_id            VARCHAR2)
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
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_emp_id            VARCHAR2,
"
"            c_start_date        DATE,
"
"            c_end_date            DATE,
"
"            c_mode            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM proj_emp_time_card
"
"    WHERE petc_bu     = p_bu
"
"      AND petc_emp_id = c_emp_id
"
"      AND TRUNC(petc_date) BETWEEN c_start_date AND c_end_date
"
"      AND c_mode IN ('+','-')
"
"      AND petc_proj_id IS NOT NULL
"
"      AND petc_status = 'A';
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id            VARCHAR2,
"
"            c_start_date        DATE,
"
"            c_end_date            DATE)
"
"       IS
"
"   SELECT petc_proj_id,
"
"         petc_plnt,
"
"         petc_wrkd_hrs,
"
"         ROUND((petc_wrkd_hrs / 8),2) petc_wrkd_days
"
"     FROM (
"
"   SELECT petc_proj_id,
"
"         petc_plnt,
"
"         CASE WHEN SUM(petc_wrkd_min) >= 60 THEN
"
"               SUM(petc_wrkd_hrs) + TRUNC(SUM(petc_wrkd_min)/60)
"
"          ELSE
"
"               SUM(petc_wrkd_hrs)
"
"          END ||'.'||
"
"          CASE WHEN SUM(petc_wrkd_min) >= 60 THEN
"
"               MOD(SUM(petc_wrkd_min),60)
"
"          ELSE
"
"               SUM(petc_wrkd_min)
"
"          END petc_wrkd_hrs
"
"     FROM proj_emp_time_card
"
"    WHERE petc_bu = p_bu
"
"      AND petc_emp_id = c_emp_id
"
"      AND petc_proj_id IS NOT NULL
"
"      AND TRUNC(petc_date) BETWEEN c_start_date AND c_end_date
"
"      AND petc_status = 'A'
"
"    GROUP BY petc_proj_id,
"
"             petc_plnt);
"
"
"
"   CURSOR c5(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER,
"
"            c_period            NUMBER,
"
"            c_mode            VARCHAR2,
"
"            c_elmnt_id            VARCHAR2,
"
"            c_seq_no            NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(pppd_wrkd_days), 0) pppd_wrkd_days
"
"     FROM payroll_prep_prj_dtls
"
"    WHERE pppd_bu     = p_bu
"
"      AND pppd_doc_no   = p_doc_no
"
"      AND pppd_emp_id   = c_emp_id
"
"      AND pppd_year     = c_year
"
"      AND pppd_period   = c_period
"
"      AND pppd_mode     = c_mode
"
"      AND pppd_elmnt_id = c_elmnt_id
"
"      AND pppd_seq_no   = c_seq_no;
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
"   SELECT pphd_emp_id
"
"     FROM payroll_prep_hd
"
"    WHERE pphd_bu       = p_bu
"
"      AND pphd_batch_no = p_doc_no;
"
"
"
"      cr6                c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT a.rowid r_id_hd,
"
"         b.rowid r_id_ln,
"
"         b.ppln_bu ppln_bu,
"
"         b.ppln_emp_id ppln_emp_id
"
"     FROM payroll_prep_hd a,
"
"           payroll_prep_ln b
"
"    WHERE pphd_bu       = ppln_bu
"
"      AND pphd_year     = ppln_year
"
"      AND pphd_period   = ppln_period
"
"      AND pphd_emp_id   = ppln_emp_id
"
"      AND pphd_batch_no = ppln_batch_no
"
"      AND pphd_bu       = p_bu
"
"      AND pphd_batch_no = p_doc_no
"
"      AND pphd_emp_id   = c_emp_id;
"
"
"
"      v_start_date            DATE;
"
"      v_end_date            DATE;
"
"
"
"      v_prep_seq_no            NUMBER;
"
"
"
"      v_sub_seq_no            NUMBER;
"
"      v_per_day_amt            NUMBER := 0;
"
"      v_proj_sal_amt            NUMBER := 0;
"
"      v_dept_per_day_amt        NUMBER := 0;
"
"      v_diff_amount            NUMBER := 0;
"
"      v_diff_days            NUMBER := 0;
"
"
"
"      v_clndr_id            VARCHAR2(10);
"
"      v_cre_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
"
"      v_ip_addr                VARCHAR2(20) := audit_info.get_ip_address;
"
"      v_os_user                VARCHAR2(50) := audit_info.get_os_user;
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
"            DELETE payroll_prep_prj_dtls
"
"             WHERE pppd_bu = p_bu
"
"               AND pppd_doc_no = p_doc_no;
"
"
"
"            FOR cr6 IN c6
"
"            LOOP
"
"
"
"               v_prep_seq_no := 1;
"
"
"
"               FOR cr7 IN c7(cr6.pphd_emp_id)
"
"           LOOP
"
"
"
"              UPDATE payroll_prep_ln
"
"                 SET ppln_prj_seq_no = v_prep_seq_no
"
"               WHERE ppln_bu     = cr7.ppln_bu
"
"                 AND ppln_emp_id = cr7.ppln_emp_id
"
"                 AND rowid       = cr7.r_id_ln;
"
"
"
"              v_prep_seq_no := v_prep_seq_no + 1;
"
"
"
"           END LOOP c7;
"
"
"
"            END LOOP c6;
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               SELECT emp_clndr_id
"
"                 INTO v_clndr_id
"
"                 FROM employees
"
"                WHERE emp_bu = p_bu
"
"                  AND emp_emp_id = cr1.pphd_emp_id;
"
"
"
"               OPEN c2(cr1.pphd_year, cr1.pphd_period, v_clndr_id);
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF c2%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20089, 'HRM'||'- Year : '||cr1.pphd_year||'/ Period : '||cr1.pphd_period);
"
"                  ELSE
"
"                     v_start_date := cr2.pcp_start_date;
"
"                 v_end_date   := cr2.pcp_end_date;
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"               OPEN c3(cr1.pphd_emp_id, v_start_date, v_end_date, cr1.ppln_mode);
"
"               FETCH c3 INTO cr3;
"
"
"
"                  IF c3%NOTFOUND THEN
"
"
"
"                     SELECT NVL(MAX(pppd_sub_seq_no),0) + 1
"
"                       INTO v_sub_seq_no
"
"                       FROM payroll_prep_prj_dtls
"
"                      WHERE pppd_bu = p_bu
"
"                        AND pppd_doc_no   = p_doc_no
"
"                        AND pppd_emp_id   = cr1.pphd_emp_id
"
"                        AND pppd_year     = cr1.pphd_year
"
"                        AND pppd_period   = cr1.pphd_period
"
"                        AND pppd_mode     = cr1.ppln_mode
"
"                        AND pppd_elmnt_id = cr1.ppln_elmnt_id
"
"                        AND pppd_seq_no   = cr1.ppln_prj_seq_no;
"
"
"
"                     INSERT INTO payroll_prep_prj_dtls(pppd_bu            ,
"
"                               pppd_doc_no        ,
"
"                               pppd_seq_no        ,
"
"                               pppd_sub_seq_no        ,
"
"                               pppd_pyrl_type        ,
"
"                               pppd_year        ,
"
"                               pppd_period        ,
"
"                               pppd_emp_id        ,
"
"                               pppd_elmnt_id        ,
"
"                               pppd_mode        ,
"
"                               pppd_type        ,
"
"                               pppd_prj_dept_id        ,
"
"                               pppd_prj_plnt_id        ,
"
"                               pppd_wrkd_hrs        ,
"
"                               pppd_wrkd_days        ,
"
"                               pppd_amount        ,
"
"                               pppd_cre_by        ,
"
"                               pppd_cre_emp_id        ,
"
"                               pppd_cre_ip_addr        ,
"
"                               pppd_cre_os_user        ,
"
"                               pppd_cre_date        )
"
"                                VALUES(p_bu            ,
"
"                                     p_doc_no            ,
"
"                                     cr1.ppln_prj_seq_no    ,
"
"                                     v_sub_seq_no        ,
"
"                                     'N'            ,
"
"                                     cr1.pphd_year        ,
"
"                                     cr1.pphd_period        ,
"
"                                     cr1.pphd_emp_id        ,
"
"                                     cr1.ppln_elmnt_id    ,
"
"                                     cr1.ppln_mode        ,
"
"                                     'D'            ,
"
"                                     cr1.pphd_dept_id        ,
"
"                                     cr1.pphd_plnt        ,
"
"                                     0            ,
"
"                                     0            ,
"
"                                     cr1.ppln_amount        ,
"
"                                     p_user            ,
"
"                                     v_cre_emp_id        ,
"
"                                     v_ip_addr        ,
"
"                                     v_os_user        ,
"
"                                     SYSDATE            );
"
"                  ELSE
"
"
"
"                     IF cr1.pehd_type IN ('B','FL','VL','CA3','RC3') AND cr1.ppln_mode = '+' THEN
"
"
"
"                        FOR cr4 IN c4(cr1.pphd_emp_id, v_start_date, v_end_date)
"
"                        LOOP
"
"
"
"                           SELECT NVL(MAX(pppd_sub_seq_no),0) + 1
"
"                             INTO v_sub_seq_no
"
"                             FROM payroll_prep_prj_dtls
"
"                            WHERE pppd_bu = p_bu
"
"                              AND pppd_doc_no   = p_doc_no
"
"                              AND pppd_emp_id   = cr1.pphd_emp_id
"
"                              AND pppd_year     = cr1.pphd_year
"
"                              AND pppd_period   = cr1.pphd_period
"
"                              AND pppd_mode     = cr1.ppln_mode
"
"                              AND pppd_elmnt_id = cr1.ppln_elmnt_id
"
"                              AND pppd_seq_no   = cr1.ppln_prj_seq_no;
"
"
"
"                           v_per_day_amt  := cr1.ppln_amount/((v_end_date - v_start_date) + 1);
"
"                           v_proj_sal_amt := (v_per_day_amt * cr4.petc_wrkd_days);
"
"
"
"                           INSERT INTO payroll_prep_prj_dtls(pppd_bu        ,
"
"                                     pppd_doc_no    ,
"
"                                     pppd_seq_no    ,
"
"                                     pppd_sub_seq_no    ,
"
"                                     pppd_pyrl_type    ,
"
"                                     pppd_year        ,
"
"                                     pppd_period    ,
"
"                                     pppd_emp_id    ,
"
"                                     pppd_elmnt_id    ,
"
"                                     pppd_mode        ,
"
"                                     pppd_type        ,
"
"                                     pppd_prj_dept_id    ,
"
"                                     pppd_prj_plnt_id    ,
"
"                                     pppd_wrkd_hrs    ,
"
"                                     pppd_wrkd_days    ,
"
"                                     pppd_amount    ,
"
"                                     pppd_cre_by    ,
"
"                                     pppd_cre_emp_id    ,
"
"                                     pppd_cre_ip_addr    ,
"
"                                     pppd_cre_os_user    ,
"
"                                     pppd_cre_date    )
"
"                                      VALUES(p_bu        ,
"
"                                           p_doc_no        ,
"
"                                           cr1.ppln_prj_seq_no,
"
"                                           v_sub_seq_no    ,
"
"                                           'N'        ,
"
"                                           cr1.pphd_year    ,
"
"                                           cr1.pphd_period    ,
"
"                                           cr1.pphd_emp_id    ,
"
"                                           cr1.ppln_elmnt_id    ,
"
"                                           cr1.ppln_mode    ,
"
"                                           'P'        ,
"
"                                           cr4.petc_proj_id    ,
"
"                                           cr4.petc_plnt    ,
"
"                                           cr4.petc_wrkd_hrs    ,
"
"                                           cr4.petc_wrkd_days    ,
"
"                                           v_proj_sal_amt    ,
"
"                                           p_user        ,
"
"                                           v_cre_emp_id    ,
"
"                                           v_ip_addr        ,
"
"                                           v_os_user        ,
"
"                                           SYSDATE        );
"
"
"
"                           v_per_day_amt  := 0;
"
"                           v_proj_sal_amt := 0;
"
"
"
"                        END LOOP c4;
"
"
"
"                        OPEN c5(cr1.pphd_emp_id, cr1.pphd_year, cr1.pphd_period, cr1.ppln_mode, cr1.ppln_elmnt_id, cr1.ppln_prj_seq_no);
"
"                        FETCH c5 INTO cr5;
"
"
"
"                           IF cr5.pppd_wrkd_days < ((v_end_date - v_start_date) + 1) THEN
"
"
"
"                              SELECT NVL(MAX(pppd_sub_seq_no),0) + 1
"
"                                INTO v_sub_seq_no
"
"                                FROM payroll_prep_prj_dtls
"
"                               WHERE pppd_bu = p_bu
"
"                                 AND pppd_doc_no   = p_doc_no
"
"                                 AND pppd_emp_id   = cr1.pphd_emp_id
"
"                                 AND pppd_year     = cr1.pphd_year
"
"                                 AND pppd_period   = cr1.pphd_period
"
"                                 AND pppd_mode     = cr1.ppln_mode
"
"                                 AND pppd_elmnt_id = cr1.ppln_elmnt_id
"
"                                 AND pppd_seq_no   = cr1.ppln_prj_seq_no;
"
"
"
"                              v_per_day_amt := cr1.ppln_amount/((v_end_date - v_start_date) + 1);
"
"                              v_diff_days   := ((v_end_date - v_start_date) + 1) - cr5.pppd_wrkd_days;
"
"                              v_diff_amount := (v_diff_days * v_per_day_amt);
"
"
"
"                              INSERT INTO payroll_prep_prj_dtls(pppd_bu            ,
"
"                                        pppd_doc_no        ,
"
"                                        pppd_seq_no        ,
"
"                                        pppd_sub_seq_no        ,
"
"                                        pppd_pyrl_type        ,
"
"                                        pppd_year        ,
"
"                                        pppd_period        ,
"
"                                        pppd_emp_id        ,
"
"                                        pppd_elmnt_id        ,
"
"                                        pppd_mode        ,
"
"                                        pppd_type        ,
"
"                                        pppd_prj_dept_id    ,
"
"                                        pppd_prj_plnt_id    ,
"
"                                        pppd_wrkd_hrs        ,
"
"                                        pppd_wrkd_days        ,
"
"                                        pppd_amount        ,
"
"                                        pppd_cre_by        ,
"
"                                        pppd_cre_emp_id        ,
"
"                                        pppd_cre_ip_addr    ,
"
"                                        pppd_cre_os_user    ,
"
"                                        pppd_cre_date        )
"
"                                         VALUES(p_bu            ,
"
"                                              p_doc_no        ,
"
"                                              cr1.ppln_prj_seq_no    ,
"
"                                              v_sub_seq_no        ,
"
"                                              'N'            ,
"
"                                              cr1.pphd_year        ,
"
"                                              cr1.pphd_period        ,
"
"                                              cr1.pphd_emp_id        ,
"
"                                              cr1.ppln_elmnt_id    ,
"
"                                              cr1.ppln_mode        ,
"
"                                              'D'            ,
"
"                                              cr1.pphd_dept_id    ,
"
"                                              cr1.pphd_plnt        ,
"
"                                              0            ,
"
"                                              v_diff_days        ,
"
"                                              v_diff_amount        ,
"
"                                              p_user            ,
"
"                                              v_cre_emp_id        ,
"
"                                              v_ip_addr        ,
"
"                                              v_os_user        ,
"
"                                              SYSDATE            );
"
"
"
"                  v_per_day_amt := 0;
"
"                  v_diff_days   := 0;
"
"                  v_diff_amount := 0;
"
"
"
"                           END IF;
"
"
"
"                           IF cr5.pppd_wrkd_days > ((v_end_date - v_start_date) + 1) THEN
"
"                              RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"                           END IF;
"
"
"
"                        CLOSE c5;
"
"
"
"                     ELSE
"
"
"
"                        SELECT NVL(MAX(pppd_sub_seq_no),0) + 1
"
"                          INTO v_sub_seq_no
"
"                          FROM payroll_prep_prj_dtls
"
"                         WHERE pppd_bu       = p_bu
"
"                           AND pppd_doc_no   = p_doc_no
"
"                           AND pppd_emp_id   = cr1.pphd_emp_id
"
"                           AND pppd_year     = cr1.pphd_year
"
"                           AND pppd_period   = cr1.pphd_period
"
"                           AND pppd_mode     = cr1.ppln_mode
"
"                           AND pppd_elmnt_id = cr1.ppln_elmnt_id
"
"                           AND pppd_seq_no   = cr1.ppln_prj_seq_no;
"
"
"
"                        INSERT INTO payroll_prep_prj_dtls(pppd_bu        ,
"
"                                  pppd_doc_no        ,
"
"                                  pppd_seq_no        ,
"
"                                  pppd_sub_seq_no    ,
"
"                                  pppd_pyrl_type    ,
"
"                                  pppd_year        ,
"
"                                  pppd_period        ,
"
"                                  pppd_emp_id        ,
"
"                                  pppd_elmnt_id        ,
"
"                                  pppd_mode        ,
"
"                                  pppd_type        ,
"
"                                  pppd_prj_dept_id    ,
"
"                                  pppd_prj_plnt_id    ,
"
"                                  pppd_wrkd_hrs        ,
"
"                                  pppd_wrkd_days    ,
"
"                                  pppd_amount        ,
"
"                                  pppd_cre_by        ,
"
"                                  pppd_cre_emp_id    ,
"
"                                  pppd_cre_ip_addr    ,
"
"                                  pppd_cre_os_user    ,
"
"                                  pppd_cre_date        )
"
"                                   VALUES(p_bu            ,
"
"                                        p_doc_no        ,
"
"                                        cr1.ppln_prj_seq_no    ,
"
"                                        v_sub_seq_no        ,
"
"                                        'N'            ,
"
"                                        cr1.pphd_year        ,
"
"                                        cr1.pphd_period    ,
"
"                                        cr1.pphd_emp_id    ,
"
"                                        cr1.ppln_elmnt_id    ,
"
"                                        cr1.ppln_mode        ,
"
"                                        'D'            ,
"
"                                        cr1.pphd_dept_id    ,
"
"                                        cr1.pphd_plnt        ,
"
"                                        0            ,
"
"                                        0            ,
"
"                                        cr1.ppln_amount    ,
"
"                                        p_user        ,
"
"                                        v_cre_emp_id        ,
"
"                                        v_ip_addr        ,
"
"                                        v_os_user        ,
"
"                                        SYSDATE        );
"
"
"
"                     END IF;
"
"
"
"                  END IF;
"
"
"
"               CLOSE c3;
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
"   END proc_upd_prj_dtls;
"
"
"
"END pack_prepare_payroll;"
/
