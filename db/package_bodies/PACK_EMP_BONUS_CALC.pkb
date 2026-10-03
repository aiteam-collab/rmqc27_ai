CREATE OR REPLACE
"PACKAGE BODY        pack_emp_bonus_calc
"
"AS
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
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_bonus_calc_hd
"
"    WHERE ebch_bu     = p_bu
"
"      AND ebch_doc_no = p_doc_no
"
"      AND ebch_status IN ('N');
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_date                DATE,
"
"            c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT empai_plnt
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
"      AND TRUNC(emp_start_date) <= c_date
"
"      AND emp_clndr_id = c_clndr_id
"
"      AND emp_status = 'A'
"
"      AND emp_att_bonus_elgbl_flag = 'Y' --Added
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
"    GROUP BY empai_plnt
"
"    ORDER BY empai_plnt;
"
"
"
"   CURSOR c3(c_plnt                VARCHAR2,
"
"              c_date                DATE,
"
"              c_cat_grp_type            VARCHAR2,
"
"              c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT emp_cat_grp_id
"
"     FROM (SELECT emp_cat_id emp_cat_grp_id
"
"         FROM employees,
"
"          emp_active_infos
"
"        WHERE emp_bu     = empai_bu
"
"          AND emp_emp_id = empai_emp_id
"
"          AND emp_bu     = p_bu
"
"          AND empai_plnt = c_plnt
"
"          AND TRUNC(emp_start_date) <= c_date
"
"          AND emp_clndr_id = c_clndr_id
"
"          AND emp_status = 'A'
"
"          AND emp_att_bonus_elgbl_flag = 'Y' --Added
"
"          AND c_cat_grp_type = 'C'
"
"        UNION ALL
"
"       SELECT emp_group_id emp_cat_grp_id
"
"         FROM employees,
"
"          emp_active_infos
"
"        WHERE emp_bu     = empai_bu
"
"          AND emp_emp_id = empai_emp_id
"
"          AND emp_bu     = p_bu
"
"          AND empai_plnt = c_plnt
"
"          AND emp_start_date <= c_date
"
"          AND emp_clndr_id = c_clndr_id
"
"          AND emp_status = 'A'
"
"          AND emp_att_bonus_elgbl_flag = 'Y' --Added
"
"          AND c_cat_grp_type = 'G')
"
"    GROUP BY emp_cat_grp_id
"
"    ORDER BY emp_cat_grp_id;
"
"
"
"    v_unit_seq_no                NUMBER(5);
"
"    v_group_seq_no                NUMBER(5);
"
"    v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"    v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"    v_res                    VARCHAR2(1) := 'N';
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
"              FROM emp_bonus_calc_unit
"
"             WHERE ebcu_bu     = p_bu
"
"               AND ebcu_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"              FROM emp_bonus_calc_grp_cat
"
"             WHERE ebcgc_bu     = p_bu
"
"               AND ebcgc_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"              FROM emp_bonus_calc_ln
"
"             WHERE ebcl_bu     = p_bu
"
"               AND ebcl_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"              FROM emp_bonus_calc_dtls
"
"             WHERE ebcd_bu     = p_bu
"
"               AND ebcd_doc_no = p_doc_no;
"
"
"
"            v_res := 'N';
"
"            v_unit_seq_no := 1;
"
"
"
"            FOR cr2 IN c2(TRUNC(cr1.ebch_eff_to), cr1.ebch_clndr_id)
"
"            LOOP
"
"
"
"               INSERT INTO emp_bonus_calc_unit(ebcu_bu         ,
"
"                                      ebcu_doc_no     ,
"
"                                      ebcu_seq_no     ,
"
"                                      ebcu_plnt     ,
"
"                                      ebcu_sel_flag     ,
"
"                                      ebcu_cre_by     ,
"
"                                      ebcu_cre_ip_addr  ,
"
"                           ebcu_cre_os_user  ,
"
"                                      ebcu_cre_date       )
"
"                                   VALUES(p_bu         ,        --ebcu_bu
"
"                                          p_doc_no         ,        --ebcu_doc_no
"
"                                             v_unit_seq_no     ,        --ebcu_seq_no
"
"                                             cr2.empai_plnt     ,        --ebcu_plnt
"
"                                      'Y'         ,        --ebcu_sel_flag
"
"                                      p_user         ,        --ebcu_cre_by
"
"                                      v_ip_addr     ,        --ebcu_cre_ip_addr
"
"                           v_os_user     ,        --ebcu_cre_os_user
"
"                                      SYSDATE         );        --ebcu_cre_date
"
"
"
"               v_group_seq_no := 1;
"
"
"
"               FOR cr3 IN c3(cr2.empai_plnt, TRUNC(cr1.ebch_eff_to), cr1.ebch_grp_cat_type, cr1.ebch_clndr_id)
"
"               LOOP
"
"
"
"                  INSERT INTO emp_bonus_calc_grp_cat(ebcgc_bu            ,
"
"                             ebcgc_doc_no    ,
"
"                               ebcgc_seq_no    ,
"
"                             ebcgc_sub_seq_no      ,
"
"                             ebcgc_grp_cat_id    ,
"
"                             ebcgc_sel_flag        ,
"
"                             ebcgc_cre_by    ,
"
"                             ebcgc_cre_ip_addr  ,
"
"                                 ebcgc_cre_os_user  ,
"
"                             ebcgc_cre_date        )
"
"                          VALUES(p_bu        ,        --ebcgc_bu
"
"                                p_doc_no            ,        --ebcgc_doc_no
"
"                                v_unit_seq_no      ,        --ebcgc_seq_no
"
"                                v_group_seq_no     ,        --ebcgc_sub_seq_no
"
"                                cr3.emp_cat_grp_id ,        --ebcgc_grp_cat_id
"
"                                'Y'            ,        --ebcgc_sel_flag
"
"                                p_user            ,        --ebcgc_cre_by
"
"                                               v_ip_addr         ,        --ebcgc_cre_ip_addr
"
"                                    v_os_user         ,        --ebcgc_cre_os_user
"
"                                SYSDATE            );        --ebcgc_cre_date
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
"     FROM emp_bonus_calc_hd
"
"    WHERE ebch_bu     = p_bu
"
"      AND ebch_doc_no = p_doc_no
"
"      AND ebch_status IN ('N');
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
"     FROM emp_bonus_calc_unit,
"
"          emp_bonus_calc_grp_cat
"
"    WHERE ebcu_bu        = ebcgc_bu
"
"      AND ebcu_doc_no    = ebcgc_doc_no
"
"      AND ebcu_seq_no    = ebcgc_seq_no
"
"      AND ebcgc_bu       = p_bu
"
"      AND ebcgc_doc_no   = p_doc_no
"
"      AND ebcu_sel_flag  = 'Y'
"
"      AND ebcgc_sel_flag = 'Y';
"
"
"
"   CURSOR c3(c_date                DATE,
"
"             c_plnt                VARCHAR2,
"
"            c_cat_grp_id            VARCHAR2,
"
"            c_cat_grp_type            VARCHAR2,
"
"            c_eff_from                DATE,
"
"            c_eff_to                DATE,
"
"            c_clndr_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu         = empai_bu
"
"      AND emp_emp_id     = empai_emp_id
"
"      AND emp_bu         = p_bu
"
"      AND empai_plnt     = c_plnt
"
"      AND emp_clndr_id   = c_clndr_id
"
"      AND emp_status = 'A'
"
"      AND emp_att_bonus_elgbl_flag = 'Y'
"
"      AND NVL((SELECT SUM(epa_per_amt)
"
"              FROM emp_pyrl_allowances
"
"              WHERE epa_bu = emp_bu
"
"                AND epa_emp_id = emp_emp_id
"
"                AND epa_elmnt_id IN ('BASIC','HRA')),0) <= 21000
"
"      AND ((emp_cat_id   = c_cat_grp_id AND c_cat_grp_type = 'C')
"
"       OR  (emp_group_id = c_cat_grp_id AND c_cat_grp_type = 'G'))
"
"     -- AND TRUNC(emp_start_date) <= c_date
"
"      AND (emp_start_date <= ADD_MONTHS(TRUNC(SYSDATE), -11)
"
"      OR emp_start_date BETWEEN TO_DATE('01-JAN-' || TO_CHAR(SYSDATE,'YYYY'),'DD-MON-YYYY')
"
"             AND TO_DATE('30-JUN-' || TO_CHAR(SYSDATE,'YYYY'),'DD-MON-YYYY'))
"
"      AND NOT EXISTS (SELECT 1
"
"                 FROM emp_bonus_calc_hd,
"
"                      emp_bonus_calc_ln
"
"                WHERE ebch_bu      = ebcl_bu
"
"                  AND ebch_doc_no  = ebcl_doc_no
"
"                  AND ebcl_bu      = emp_bu
"
"                  AND ebcl_emp_id  = emp_emp_id
"
"                  AND (TRUNC(ebch_eff_from) BETWEEN TRUNC(c_eff_from) AND TRUNC(c_eff_to)
"
"                     OR TRUNC(ebch_eff_to) BETWEEN TRUNC(c_eff_from) AND TRUNC(c_eff_to))
"
"                    AND ebcl_sel_flag = 'Y'
"
"                  AND ebch_status IN ('P'))
"
"    ORDER BY emp_emp_id;
"
"
"
"
"
"   CURSOR c4(c_emp_id       VARCHAR2)
"
"        IS
"
"    SELECT NVL(SUM(epa_per_amt),0) actual_salary
"
"        FROM emp_pyrl_allowances
"
"    WHERE epa_bu     = p_bu
"
"    AND epa_emp_id   = c_emp_id;
"
"
"
"    cr4                 c4%ROWTYPE;
"
"
"
"
"
"      v_emp_serv_yrs                NUMBER(15, 2)  := 0;
"
"      v_actual_basic                NUMBER(15, 3) := 0;
"
"      v_gross_salary                NUMBER(15,3) := 0;
"
"      v_seq_no                      NUMBER(5);
"
"      v_res                         VARCHAR2(1) := 'N';
"
"      v_ip_addr                     VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                     VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
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
"          FROM emp_bonus_calc_ln
"
"         WHERE ebcl_bu     = p_bu
"
"               AND ebcl_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"          FROM emp_bonus_calc_dtls
"
"         WHERE ebcd_bu     = p_bu
"
"               AND ebcd_doc_no = p_doc_no;
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
"               FOR cr3 IN c3(TRUNC(cr1.ebch_eff_to), cr2.ebcu_plnt, cr2.ebcgc_grp_cat_id, cr1.ebch_grp_cat_type, TRUNC(cr1.ebch_eff_from), TRUNC(cr1.ebch_eff_to), cr1.ebch_clndr_id)
"
"               LOOP
"
"                   OPEN c4(cr3.emp_emp_id);
"
"                    FETCH c4 INTO cr4;
"
"                     v_gross_salary := NVL(cr4.actual_salary,0);
"
"                   CLOSE c4;
"
"
"
"                  v_emp_serv_yrs := ROUND(MONTHS_BETWEEN(TRUNC(cr1.ebch_eff_to), TRUNC(cr3.emp_start_date))/12);
"
"                  v_actual_basic := CASE WHEN cr3.emp_pay_basis = 'S' THEN NVL(cr3.empai_basic_sal, 0) ELSE NVL(cr3.empai_per_day_wage, 0) END;
"
"
"
"                  INSERT INTO emp_bonus_calc_ln(ebcl_bu              ,
"
"                            ebcl_doc_no          ,
"
"                            ebcl_seq_no          ,
"
"                            ebcl_emp_id          ,
"
"                            ebcl_emp_exp_yrs    ,
"
"                            ebcl_emp_pos_id        ,
"
"                            ebcl_emp_dept_id    ,
"
"                            ebcl_emp_plnt        ,
"
"                            ebcl_emp_cat_id        ,
"
"                            ebcl_emp_grp_id        ,
"
"                            ebcl_cur_salary          ,
"
"                            ebcl_gross_salary    ,
"
"                            ebcl_total_salary    ,
"
"                            ebcl_inct_pct          ,
"
"                            ebcl_bonus_pct          ,
"
"                            ebcl_exgratia_pct    ,
"
"                            ebcl_inct_amt          ,
"
"                            ebcl_bonus_amt          ,
"
"                            ebcl_exgratia_amt      ,
"
"                            ebcl_total_bonus    ,
"
"                            ebcl_ceiling_limit    ,
"
"                            ebcl_reference          ,
"
"                            ebcl_sel_flag          ,
"
"                            ebcl_cre_by          ,
"
"                            ebcl_cre_ip_addr    ,
"
"                        ebcl_cre_os_user    ,
"
"                            ebcl_cre_date          )
"
"                         VALUES(p_bu              ,        --ebcl_bu
"
"                                  p_doc_no        ,        --ebcl_doc_no
"
"                                  v_seq_no        ,        --ebcl_seq_no
"
"                                  cr3.emp_emp_id          ,        --ebcl_emp_id
"
"                                  v_emp_serv_yrs        ,        --ebcl_emp_exp_yrs
"
"                                  cr3.empai_pos_id    ,        --ebcl_emp_pos_id
"
"                        cr3.empai_dept_id    ,        --ebcl_emp_dept_id
"
"                        cr3.empai_plnt        ,        --ebcl_emp_plnt
"
"                        cr3.emp_cat_id        ,        --ebcl_emp_cat_id
"
"                            cr3.emp_group_id    ,        --ebcl_emp_grp_id
"
"                                  v_actual_basic        ,        --ebcl_cur_salary
"
"                                  v_gross_salary        ,     --ebcl_gross_salary
"
"                                  0            ,        --ebcl_total_salary
"
"                                  0            ,        --ebcl_inct_pct
"
"                                  cr1.ebch_bonus_pct    ,        --ebcl_bonus_pct
"
"                                  cr1.ebch_exgratia_pct    ,        --ebcl_exgratia_pct
"
"                                  0            ,        --ebcl_inct_amt
"
"                                  0            ,        --ebcl_bonus_amt
"
"                                  0            ,        --ebcl_exgratia_amt
"
"                                  0            ,        --ebcl_total_bonus
"
"                                  0            ,        --ebcl_ceiling_limit
"
"                                  'BONUS FOR THE PERIOD. DATE FROM/TO : '||TO_CHAR(cr1.ebch_eff_from, 'DD.MM.RRRR')||'/'||TO_CHAR(cr1.ebch_eff_to, 'DD.MM.RRRR'),        --ebcl_reference
"
"                                  'Y'              ,        --ebcl_sel_flag
"
"                                  p_user             ,        --ebcl_cre_by
"
"                                  v_ip_addr        ,        --ebcl_cre_ip_addr
"
"                        v_os_user        ,        --ebcl_cre_os_user
"
"                                  SYSDATE              );        --ebcl_cre_date
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
"   PROCEDURE proc_prep_emp_bonus(p_bu                VARCHAR2,
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
"     FROM emp_bonus_calc_hd
"
"    WHERE ebch_bu     = p_bu
"
"      AND ebch_doc_no = p_doc_no
"
"      AND ebch_status IN ('N');
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_cat_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_bonus_calc_clng_hd
"
"    WHERE ebcch_bu     = p_bu
"
"      AND ebcch_cat_id = c_cat_id
"
"      AND TRUNC(SYSDATE) BETWEEN TRUNC(ebcch_eff_from) AND TRUNC(ebcch_eff_to)
"
"      AND ebcch_status IN ('P', 'R');
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_doc_no                VARCHAR2,
"
"            c_doc_rev_no            NUMBER,
"
"            c_serv_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM emp_bonus_calc_clng_ln
"
"    WHERE ebccl_bu       = p_bu
"
"      AND ebccl_doc_no     = c_doc_no
"
"      AND ebccl_doc_rev_no = c_doc_rev_no
"
"      AND c_serv_year BETWEEN ebccl_year_from AND ebccl_year_to;
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_doc_no                VARCHAR2,
"
"            c_doc_rev_no            NUMBER,
"
"            c_serv_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM emp_bonus_calc_incent_ln
"
"    WHERE ebcil_bu       = p_bu
"
"      AND ebcil_doc_no     = c_doc_no
"
"      AND ebcil_doc_rev_no = c_doc_rev_no
"
"      AND c_serv_year BETWEEN ebcil_year_from AND ebcil_year_to;
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
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos,
"
"          emp_bonus_calc_ln
"
"    WHERE emp_bu        = empai_bu
"
"      AND emp_emp_id    = empai_emp_id
"
"      AND emp_bu    = ebcl_bu
"
"      AND emp_emp_id    = ebcl_emp_id
"
"      AND ebcl_bu       = p_bu
"
"      AND ebcl_doc_no   = p_doc_no
"
"      AND ebcl_sel_flag = 'Y';
"
"
"
"   CURSOR c6(c_emp_id                VARCHAR2,
"
"            c_year                NUMBER,
"
"            c_period                NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(phln_amount), 0) phln_amount
"
"     FROM (SELECT NVL(SUM(DECODE(ebpce_act_ernd_flag, 'E',
"
"                  DECODE(phln_mode, '+', phln_amount, phln_amount * -1),
"
"                  DECODE(phln_mode, '+', phln_actual_amount, phln_actual_amount * -1))), 0) phln_amount
"
"      FROM payroll_hist_hd,
"
"           payroll_hist_ln,
"
"           emp_bonus_pyrl_calc_elmnt
"
"     WHERE phhd_bu        = phln_bu
"
"       AND phhd_pyrl_no   = phln_pyrl_no
"
"       AND phhd_process_batch_no = phln_process_batch_no
"
"       AND phln_bu        = ebpce_bu
"
"       AND phln_elmnt_id  = ebpce_elmnt_id
"
"       AND ebpce_bu       = p_bu
"
"       AND ebpce_doc_no   = p_doc_no
"
"       AND phhd_emp_id    = c_emp_id
"
"       AND phhd_year      = c_year
"
"       AND phhd_period    = c_period
"
"       AND phhd_pyrl_type = 'N');
"
"
"
"      cr6                    c6%ROWTYPE;
"
"
"
"      v_start_year                NUMBER(6);
"
"      v_start_period                NUMBER(2);
"
"      v_calc_year                NUMBER(6);
"
"      v_calc_period                NUMBER(2);
"
"      v_end_year                NUMBER(6);
"
"      v_end_period                NUMBER(2);
"
"      v_add_year                NUMBER(5);
"
"      v_slab_doc_no                VARCHAR2(15);
"
"      v_slab_doc_rev_no                NUMBER(5);
"
"      v_sub_seq_no                NUMBER(5);
"
"      v_per_amount                NUMBER(15, 3) := 0;
"
"      v_tot_amount                NUMBER(15, 3) := 0;
"
"      v_emp_serv_yrs                NUMBER(5, 2)  := 0;
"
"      v_actual_basic                NUMBER(15, 3) := 0;
"
"      v_ceiling_amt                NUMBER(15,3)  := 0;
"
"      v_incent_pct                NUMBER(5, 2)  := 0;
"
"      v_incent_amt                NUMBER(15, 3) := 0;
"
"      v_bonus_amt                NUMBER(15, 3) := 0;
"
"      v_exgrat_amt                NUMBER(15, 3) := 0;
"
"      v_res                     VARCHAR2(1) := 'N';
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
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
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||' ~ '||p_bu||' ~ '||p_doc_no);
"
"         ELSE
"
"
"
"            DELETE
"
"              FROM emp_bonus_calc_dtls
"
"             WHERE ebcd_bu     = p_bu
"
"               AND ebcd_doc_no = p_doc_no;
"
"
"
"            v_res := 'N';
"
"
"
"        FOR cr5 IN c5
"
"        LOOP
"
"
"
"               proc_find_pyrl_cal_year_period(p_bu,
"
"                                  TRUNC(cr1.ebch_eff_from),
"
"                                  v_start_year,
"
"                                  v_start_period,
"
"                                  cr5.emp_clndr_id);
"
"
"
"               proc_find_pyrl_cal_year_period(p_bu,
"
"                                  TRUNC(cr1.ebch_eff_to),
"
"                                  v_end_year,
"
"                                  v_end_period,
"
"                                  cr5.emp_clndr_id);
"
"
"
"               IF LENGTH(v_start_year) > 4 THEN
"
"              v_add_year := 101;
"
"           ELSE
"
"              v_add_year := 1;
"
"           END IF;
"
"
"
"           v_emp_serv_yrs := ROUND(MONTHS_BETWEEN(TRUNC(cr1.ebch_eff_to), TRUNC(cr5.emp_start_date))/12);
"
"               v_actual_basic := CASE WHEN cr5.emp_pay_basis = 'S' THEN NVL(cr5.empai_basic_sal, 0) ELSE NVL(cr5.empai_per_day_wage, 0) END;
"
"
"
"           /* While Loop is used to get processed salary details based on given date */
"
"
"
"           v_calc_year   := v_start_year;
"
"           v_calc_period := v_start_period;
"
"           v_tot_amount  := 0;
"
"           v_ceiling_amt := 0;
"
"           v_incent_pct  := 0;
"
"           v_bonus_amt   := 0;
"
"           v_exgrat_amt  := 0;
"
"           v_incent_amt  := 0;
"
"
"
"           WHILE v_calc_year||TO_CHAR(v_calc_period, '00') <= v_end_year||TO_CHAR(v_end_period, '00')
"
"           LOOP
"
"
"
"              OPEN c6(cr5.ebcl_emp_id, v_calc_year, v_calc_period);
"
"              FETCH c6 INTO cr6;
"
"
"
"                 IF c6%FOUND THEN
"
"                    v_per_amount := NVL(cr6.phln_amount, 0);
"
"                 ELSE
"
"                    v_per_amount := 0;
"
"                 END IF;
"
"
"
"              CLOSE c6;
"
"
"
"              v_tot_amount := v_tot_amount + v_per_amount;
"
"
"
"              SELECT NVL(MAX(ebcd_sub_seq_no), 0) + 1
"
"                INTO v_sub_seq_no
"
"                FROM emp_bonus_calc_dtls
"
"               WHERE ebcd_bu     = p_bu
"
"                 AND ebcd_doc_no = p_doc_no
"
"                 AND ebcd_seq_no = cr5.ebcl_seq_no;
"
"
"
"              INSERT INTO emp_bonus_calc_dtls(ebcd_bu      ,
"
"                          ebcd_doc_no      ,
"
"                          ebcd_seq_no      ,
"
"                          ebcd_sub_seq_no ,
"
"                          ebcd_year      ,
"
"                          ebcd_period      ,
"
"                          ebcd_amount      ,
"
"                          ebcd_cre_by      ,
"
"                          ebcd_cre_ip_addr,
"
"                          ebcd_cre_os_user,
"
"                          ebcd_cre_date      )
"
"                       VALUES(p_bu          ,        --ebcd_bu
"
"                             p_doc_no      ,        --ebcd_doc_no
"
"                             cr5.ebcl_seq_no ,        --ebcd_seq_no
"
"                             v_sub_seq_no      ,        --ebcd_sub_seq_no
"
"                             v_calc_year      ,        --ebcd_year
"
"                             v_calc_period   ,        --ebcd_period
"
"                             v_per_amount      ,        --ebcd_amount
"
"                             p_user      ,        --ebcd_cre_by
"
"                             v_ip_addr      ,        --ebcd_cre_ip_addr
"
"                          v_os_user      ,        --ebcd_cre_os_user
"
"                             SYSDATE      );        --ebcd_cre_date
"
"
"
"              IF v_calc_period = 12 THEN
"
"                 v_calc_year   := v_calc_year + v_add_year;
"
"                 v_calc_period := 1;
"
"              ELSE
"
"                 v_calc_year   := v_calc_year;
"
"                 v_calc_period := v_calc_period + 1;
"
"              END IF;
"
"
"
"               END LOOP;
"
"
"
"               /* End of While Loop is used to get processed salary details based on given date */
"
"
"
"         /*  IF v_emp_serv_yrs > 0 THEN
"
"
"
"                  OPEN c2(cr5.emp_cat_id);
"
"                  FETCH c2 INTO cr2;
"
"
"
"                     IF c2%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20110, 'HRM'||' ~ '||p_bu||' ~ '||SYSDATE||'~'||cr5.emp_cat_id);
"
"                        ELSE
"
"                      v_slab_doc_no     := cr2.ebcch_doc_no;
"
"                      v_slab_doc_rev_no := cr2.ebcch_doc_rev_no;
"
"                        END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"                  OPEN c3(v_slab_doc_no, v_slab_doc_rev_no, v_emp_serv_yrs);
"
"                  FETCH c3 INTO cr3;
"
"
"
"                     IF c3%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20111, 'HRM'||' ~ '||p_bu||' Doc. No./Rev. : '||v_slab_doc_no||'/'||v_slab_doc_rev_no||' Year : '||v_emp_serv_yrs);
"
"                     ELSE
"
"                        v_ceiling_amt := NVL(cr3.ebccl_clng_amt, 0);
"
"                     END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"                  OPEN c4(v_slab_doc_no, v_slab_doc_rev_no, v_emp_serv_yrs);
"
"                  FETCH c4 INTO cr4;
"
"
"
"                     IF c4%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20112, 'HRM'||' ~ '||p_bu||' Doc. No./Rev. : '||v_slab_doc_no||'/'||v_slab_doc_rev_no||' Year : '||v_emp_serv_yrs);
"
"                     ELSE
"
"                        v_incent_pct := NVL(cr4.ebcil_incent_pct, 0);
"
"                     END IF;
"
"
"
"                  CLOSE c4;
"
"
"
"               ELSE
"
"                  v_ceiling_amt := 0;
"
"                  v_incent_pct  := 0;
"
"               END IF;*/
"
"
"
"            /*   IF ((v_tot_amount/100) * NVL(cr1.ebch_bonus_pct, 0)) > v_ceiling_amt THEN
"
"                  v_bonus_amt := v_ceiling_amt;
"
"               ELSE
"
"                  v_bonus_amt := ((v_tot_amount/100) * NVL(cr1.ebch_bonus_pct, 0));
"
"               END IF;*/-----bharathi
"
"
"
"               IF cr1.ebch_bonus_pct > 0 THEN
"
"                    v_bonus_amt := ((v_tot_amount/100) * NVL(cr1.ebch_bonus_pct, 0));
"
"               ELSE
"
"                    v_bonus_amt := 0;
"
"               END IF;
"
"
"
"               IF cr1.ebch_exgratia_pct > 0 THEN
"
"                  v_exgrat_amt := ((v_tot_amount/100) * NVL(cr1.ebch_exgratia_pct, 0));
"
"               ELSE
"
"                  v_exgrat_amt := 0;
"
"               END IF;
"
"
"
"               IF cr1.ebch_incent_pct > 0 THEN
"
"               v_incent_amt := ((v_tot_amount/100) * NVL(cr1.ebch_incent_pct, 0));
"
"           ELSE
"
"               v_incent_amt := 0;
"
"               END IF;
"
"
"
"              /* IF v_bonus_amt > 0 THEN
"
"
"
"                  IF v_incent_pct > 0 THEN
"
"                     v_incent_amt := ((v_actual_basic/100) * v_incent_pct) * v_emp_serv_yrs;
"
"                  ELSE
"
"                     v_incent_amt := 0;
"
"                  END IF;
"
"
"
"               ELSE
"
"                  v_incent_amt := 0;
"
"               END IF;*/   ---bharathi
"
"
"
"               UPDATE emp_bonus_calc_ln
"
"                  SET ebcl_emp_exp_yrs   = v_emp_serv_yrs,
"
"                      ebcl_cur_salary    = v_actual_basic,
"
"                      ebcl_total_salary  = v_tot_amount,
"
"                      ebcl_ceiling_limit = v_ceiling_amt,
"
"                      ebcl_bonus_pct     = cr1.ebch_bonus_pct,
"
"                      ebcl_bonus_amt     = v_bonus_amt,
"
"                      ebcl_exgratia_pct  = cr1.ebch_exgratia_pct,
"
"                      ebcl_exgratia_amt  = v_exgrat_amt,
"
"                      ebcl_inct_pct      = v_incent_pct,
"
"                      ebcl_inct_amt      = v_incent_amt,
"
"                      ebcl_total_bonus   = ROUND(v_bonus_amt + v_exgrat_amt + v_incent_amt),
"
"                      ebcl_upd_by     = p_user,
"
"                      ebcl_upd_ip_addr   = v_ip_addr,
"
"              ebcl_upd_os_user   = v_os_user,
"
"                      ebcl_upd_date      = SYSDATE
"
"                WHERE ebcl_bu     = p_bu
"
"                  AND ebcl_doc_no = p_doc_no
"
"                  AND ebcl_seq_no = cr5.ebcl_seq_no;
"
"
"
"               v_res := 'Y';
"
"
"
"            END LOOP c5;
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
"   END proc_prep_emp_bonus;
"
"
"
"   PROCEDURE proc_post_emp_bonus(p_bu                VARCHAR2,
"
"                    p_doc_no            VARCHAR2,
"
"                    p_pymnt_type            VARCHAR2,
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
"     FROM emp_bonus_calc_hd
"
"    WHERE ebch_bu     = p_bu
"
"      AND ebch_doc_no = p_doc_no
"
"      AND ebch_status IN ('N');
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
"     FROM employees,
"
"          emp_bonus_calc_ln
"
"    WHERE ebcl_bu          = emp_bu
"
"      AND ebcl_emp_id      = emp_emp_id
"
"      AND ebcl_bu          = p_bu
"
"      AND ebcl_doc_no      = p_doc_no
"
"      AND ebcl_total_bonus > 0
"
"      AND ebcl_sel_flag    = 'Y';
"
"
"
"   CURSOR c3(c_year                NUMBER,
"
"           c_period                NUMBER,
"
"         c_proc_batch_no            VARCHAR2)
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
"      AND phhd_year                = c_year
"
"      AND phhd_period              = c_period
"
"      AND phhd_process_batch_no = c_proc_batch_no
"
"      AND phhd_pyrl_type        = 'B';
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_batch_no                VARCHAR2)
"
"       IS
"
"   SELECT phhd_emp_plnt
"
"     FROM payroll_hist_hd
"
"    WHERE phhd_bu = p_bu
"
"      AND phhd_process_batch_no = c_batch_no
"
"      AND phhd_pyrl_type        = 'B'
"
"    GROUP BY phhd_emp_plnt;
"
"
"
"      v_year                    NUMBER(7);
"
"      v_period                    NUMBER(2);
"
"      v_bonus_adj_no                VARCHAR2(15);
"
"      v_proc_pyrl_no                VARCHAR2(15);
"
"      v_proc_batch_no                VARCHAR2(30);
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
"      v_cre_emp_id            VARCHAR2(10) := func_find_emp_id(p_bu, p_user);
"
"      v_batch_plnt                VARCHAR2(400);
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
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||' ~ '||p_bu||' ~ '||p_doc_no);
"
"         ELSE
"
"
"
"             v_res := 'N';
"
"
"
"            /* Payment Type : Payroll */
"
"
"
"            IF p_pymnt_type = 'P' THEN
"
"
"
"           FOR cr2 IN c2
"
"           LOOP
"
"
"
"                  proc_find_pyrl_cal_year_period(p_bu,
"
"                                         TRUNC(cr1.ebch_eff_to),
"
"                                        v_year,
"
"                                     v_period,
"
"                                     cr2.emp_clndr_id);
"
"
"
"              SELECT NVL(MAX(epadj_adj_no), 0) + 1
"
"                INTO v_bonus_adj_no
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
"                           epadj_cre_ip_addr        ,
"
"                           epadj_cre_os_user        ,
"
"                           epadj_cre_emp_id        ,
"
"                           epadj_cre_date        )
"
"                                    VALUES(p_bu                ,        --epadj_bu
"
"                                             v_bonus_adj_no        ,        --epadj_adj_no
"
"                                             cr2.ebcl_emp_id        ,        --epadj_emp_id
"
"                                             cr1.ebch_elmnt_id        ,        --epadj_elmnt_id
"
"                                             'Y'                ,        --epadj_is_definite
"
"                                             v_year            ,        --epadj_start_year
"
"                                             v_period            ,        --epadj_start_period
"
"                                             1                ,        --epadj_tot_period
"
"                                             1                ,        --epadj_rmng_period
"
"                                             cr2.ebcl_total_bonus        ,        --epadj_tot_amt
"
"                                             0                ,        --epadj_accm_amt
"
"                                             cr2.ebcl_total_bonus        ,        --epadj_per_amt
"
"                                             '+'                ,        --epadj_mode
"
"                                             'MNL'            ,        --epadj_source
"
"                                             p_doc_no            ,        --epadj_doc_no
"
"                                             'Y'                ,        --epadj_process_flag
"
"                                             'P'                ,        --epadj_status
"
"                                             'C'                ,        --epadj_upd_option
"
"                                             cr2.ebcl_reference        ,        --epadj_reference
"
"                                             p_user            ,        --epadj_cre_by
"
"                           v_ip_addr            ,        --epadj_cre_ip_addr
"
"                           v_os_user            ,        --epadj_cre_os_user
"
"                           v_cre_emp_id            ,        --epadj_cre_emp_id
"
"                                       SYSDATE            );        --epadj_cre_date
"
"
"
"                  UPDATE emp_bonus_calc_ln
"
"                     SET ebcl_bonus_adj_no = v_bonus_adj_no,
"
"                         ebcl_upd_by       = p_user,
"
"                         ebcl_upd_ip_addr  = v_ip_addr,
"
"             ebcl_upd_os_user  = v_os_user,
"
"                         ebcl_upd_date     = SYSDATE
"
"                   WHERE ebcl_bu     = p_bu
"
"                     AND ebcl_doc_no = p_doc_no
"
"                     AND ebcl_seq_no = cr2.ebcl_seq_no;
"
"
"
"              v_res := 'Y';
"
"
"
"           END LOOP c2;
"
"
"
"            END IF;
"
"
"
"            /* Payment Type : Employee Payable */
"
"
"
"            IF p_pymnt_type = 'E' THEN
"
"
"
"           --v_proc_batch_no := func_find_hrm_next_id(p_bu, 'EMP_BATCH_NO');
"
"
"
"           v_proc_batch_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),'PBN',p_user);
"
"
"
"           FOR cr2 IN c2
"
"           LOOP
"
"
"
"                  proc_find_pyrl_cal_year_period(p_bu,
"
"                                         TRUNC(cr1.ebch_eff_from),
"
"                                        v_year,
"
"                                     v_period,
"
"                                     cr2.emp_clndr_id);
"
"
"
"                  SELECT NVL(MAX(phhd_pyrl_no), 1000000000) + 1
"
"            INTO v_proc_pyrl_no
"
"            FROM payroll_hist_hd
"
"                 WHERE phhd_bu = p_bu;
"
"
"
"                  INSERT INTO payroll_hist_hd(phhd_bu                   ,
"
"                          phhd_plnt                   ,
"
"                          phhd_pyrl_no         ,
"
"                          phhd_process_batch_no         ,
"
"                          phhd_process_date               ,
"
"                          phhd_pyrl_type               ,
"
"                          phhd_year                   ,
"
"                          phhd_period         ,
"
"                          phhd_emp_id         ,
"
"                          phhd_emp_name               ,
"
"                          phhd_emp_plnt               ,
"
"                          phhd_dept_id         ,
"
"                          phhd_job_id         ,
"
"                          phhd_pos_id         ,
"
"                          phhd_grade_id               ,
"
"                          phhd_loc_id         ,
"
"                          phhd_emp_group               ,
"
"                          phhd_acct_cat_id               ,
"
"                          phhd_net_payable               ,
"
"                          phhd_actual_net               ,
"
"                          phhd_net_afr_round     ,
"
"                          phhd_net_bfr_round     ,
"
"                          phhd_mon_days               ,
"
"                          phhd_workin_days               ,
"
"                          phhd_holidays               ,
"
"                          phhd_off                   ,
"
"                          phhd_workoff_holiday     ,
"
"                          phhd_bustrip_days               ,
"
"                          phhd_late_hrs               ,
"
"                          phhd_tot_paid_days     ,
"
"                          phhd_paid_leave_days     ,
"
"                          phhd_unpaid_leave_days       ,
"
"                          phhd_mail_sent               ,
"
"                          phhd_no_mail_sent               ,
"
"                          phhd_cre_by             ,
"
"                          phhd_cre_ip_addr         ,
"
"                          phhd_cre_os_user         ,
"
"                          phhd_cre_emp_id         ,
"
"                          phhd_cre_date             )
"
"                       VALUES(p_bu             ,                            --phhd_bu
"
"                          cr2.ebcl_emp_plnt               ,                            --phhd_plnt
"
"                          v_proc_pyrl_no               ,                            --phhd_pyrl_no
"
"                          v_proc_batch_no               ,                            --phhd_process_batch_no
"
"                          TRUNC(cr1.ebch_eff_to)       ,                            --phhd_process_date
"
"                          'B'             ,                            --phhd_pyrl_type
"
"                          v_year                    ,                            --phhd_year
"
"                          v_period                    ,                            --phhd_period
"
"                          cr2.ebcl_emp_id               ,                            --phhd_emp_id
"
"                          (cr2.emp_first_name1||' '||cr2.emp_middle_name1||' '||cr2.emp_last_name1),    --phhd_emp_name
"
"                          cr2.ebcl_emp_plnt               ,                            --phhd_emp_plnt
"
"                          cr2.ebcl_emp_dept_id          ,                            --phhd_dept_id
"
"                          NULL             ,                            --phhd_job_id
"
"                          cr2.ebcl_emp_pos_id     ,                            --phhd_pos_id
"
"                          NULL             ,                            --phhd_grade_id
"
"                          NULL             ,                            --phhd_loc_id
"
"                          cr2.ebcl_emp_grp_id     ,                            --phhd_emp_group
"
"                          cr2.ebcl_emp_cat_id        ,                            --phhd_acct_cat_id
"
"                          cr2.ebcl_total_bonus       ,                            --phhd_net_payable
"
"                          cr2.ebcl_total_bonus       ,                            --phhd_actual_net
"
"                          0                     ,                            --phhd_net_afr_round
"
"                          0                     ,                            --phhd_net_bfr_round
"
"                          0                 ,                            --phhd_mon_days
"
"                          0                 ,                            --phhd_workin_days
"
"                          0                 ,                            --phhd_holidays
"
"                          0                 ,                            --phhd_off
"
"                          0                     ,                            --phhd_workoff_holiday
"
"                          0                     ,                            --phhd_bustrip_days
"
"                          0                     ,                            --phhd_late_hrs
"
"                          0                     ,                            --phhd_tot_paid_days
"
"                          0                     ,                            --phhd_paid_leave_days
"
"                          0                 ,                            --phhd_unpaid_leave_days
"
"                          'N'             ,                            --phhd_mail_sent
"
"                          0                     ,                            --phhd_no_mail_sent
"
"                          p_user                 ,                            --phhd_cre_by
"
"                          v_ip_addr             ,                            --phhd_cre_ip_addr
"
"                          v_os_user             ,                            --phhd_cre_os_user
"
"                          v_cre_emp_id         ,                            --phhd_cre_emp_id
"
"                          SYSDATE                 );                            --phhd_cre_date
"
"
"
"          INSERT INTO payroll_hist_ln(phln_bu                  ,
"
"                          phln_plnt                  ,
"
"                          phln_pyrl_no              ,
"
"                          phln_process_batch_no       ,
"
"                          phln_emp_plnt              ,
"
"                          phln_elmnt_id              ,
"
"                          phln_elmnt_cat              ,
"
"                          phln_adj_no              ,
"
"                          phln_amount              ,
"
"                          phln_actual_amount          ,
"
"                          phln_mode                  ,
"
"                          phln_source              ,
"
"                          phln_doc_no              ,
"
"                          phln_reference              ,
"
"                          phln_cre_by              ,
"
"                          phln_cre_ip_addr         ,
"
"                          phln_cre_os_user          ,
"
"                          phln_cre_emp_id         ,
"
"                          phln_cre_date              )
"
"                       VALUES(p_bu                  ,            --phln_bu
"
"                          cr2.ebcl_emp_plnt              ,            --phln_plnt
"
"                          v_proc_pyrl_no              ,            --phln_pyrl_no
"
"                          v_proc_batch_no              ,            --phln_process_batch_no
"
"                          cr2.ebcl_emp_plnt              ,            --phln_emp_plnt
"
"                          cr1.ebch_elmnt_id           ,            --phln_elmnt_id
"
"                          'N'                  ,            --phln_elmnt_cat
"
"                          NULL                  ,            --phln_adj_no
"
"                          cr2.ebcl_total_bonus        ,            --phln_amount
"
"                          0                       ,            --phln_actual_amount
"
"                          '+'                  ,            --phln_mode
"
"                          'BON'                   ,            --phln_source
"
"                          p_doc_no                  ,            --phln_doc_no
"
"                          cr2.ebcl_reference          ,            --phln_reference
"
"                          p_user                  ,            --phln_cre_by
"
"                          v_ip_addr             ,            --phln_cre_ip_addr
"
"                          v_os_user             ,            --phln_cre_os_user
"
"                          v_cre_emp_id         ,            --phln_cre_emp_id
"
"                          SYSDATE                  );            --phln_cre_date
"
"
"
"                  UPDATE emp_bonus_calc_ln
"
"                     SET ebcl_pyrl_no       = v_proc_pyrl_no,
"
"                         ebcl_pyrl_batch_no = v_proc_batch_no,
"
"                         ebcl_upd_by        = p_user,
"
"                         ebcl_upd_ip_addr   = v_ip_addr,
"
"             ebcl_upd_os_user   = v_os_user,
"
"                         ebcl_upd_date      = SYSDATE
"
"                   WHERE ebcl_bu     = p_bu
"
"                     AND ebcl_doc_no = p_doc_no
"
"                     AND ebcl_seq_no = cr2.ebcl_seq_no;
"
"
"
"                  v_res := 'Y';
"
"
"
"           END LOOP c2;
"
"
"
"           proc_upd_pyrl_prj_dtls(p_bu,
"
"                             v_proc_batch_no,
"
"                             p_user,
"
"                      v_prj_res);
"
"
"
"               OPEN c3(v_year, v_period, v_proc_batch_no);
"
"               FETCH c3 INTO cr3;
"
"
"
"                  IF c3%FOUND THEN
"
"
"
"                     IF cr3.phhd_net_amt > 0 THEN
"
"
"
"                v_batch_plnt := NULL;
"
"
"
"                FOR cr4 IN c4(v_proc_batch_no)
"
"                LOOP
"
"                   v_batch_plnt := v_batch_plnt||', '|| cr4.phhd_emp_plnt;
"
"                END LOOP c4;
"
"
"
"                        INSERT INTO pyrl_proc_batch_hd(ppbh_bu            ,
"
"                                   ppbh_pfx        ,
"
"                                   ppbh_batch_no        ,
"
"                                   ppbh_clndr_id        ,
"
"                                   ppbh_year        ,
"
"                                   ppbh_period        ,
"
"                                   ppbh_batch_proc_plnts,
"
"                                   ppbh_ref            ,
"
"                                   ppbh_status        ,
"
"                                   ppbh_jrnl_date        ,
"
"                                   ppbh_pyrl_type        ,
"
"                                   ppbh_cre_by        ,
"
"                                   ppbh_cre_ip_addr     ,
"
"                               ppbh_cre_os_user     ,
"
"                               ppbh_cre_emp_id        ,
"
"                                   ppbh_cre_date        )
"
"                            VALUES(p_bu            ,                                            --ppbh_bu
"
"                                 'PBN'            ,                    --ppbh_pfx
"
"                                 v_proc_batch_no        ,                                            --ppbh_batch_no
"
"                                 cr1.ebch_clndr_id    ,                                            --ppbh_clndr_id
"
"                                 v_year            ,                                            --ppbh_year
"
"                                 v_period            ,                                            --ppbh_period
"
"                                 v_batch_plnt        ,                                            --ppbh_batch_proc_plnts
"
"                                 'BONUS PAYROLL JOURNAL POSTING FOR THE MONTH OF '||TO_CHAR(cr1.ebch_eff_from, 'MON')||' '||v_year,    --ppbh_ref
"
"                                 'N'            ,                                            --ppbh_status,
"
"                                 TRUNC(SYSDATE)        ,                                            --ppbh_jrnl_date,
"
"                                 'B'            ,                                            --ppbh_pyrl_type
"
"                                 p_user            ,                                            --ppbh_cre_by
"
"                                 v_ip_addr        ,                                            --ppbh_cre_ip_addr
"
"                                 v_os_user        ,                                            --ppbh_cre_os_user
"
"                                 v_cre_emp_id        ,                                            --ppbh_cre_emp_id
"
"                                 SYSDATE            );                                            --ppbh_cre_date
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
"            END IF;
"
"
"
"        UPDATE emp_bonus_calc_hd
"
"           SET ebch_status       = 'P',
"
"               ebch_payment_type = p_pymnt_type,
"
"              ebch_upd_by       = p_user,
"
"                   ebch_upd_ip_addr  = v_ip_addr,
"
"           ebch_upd_os_user  = v_os_user,
"
"               ebch_upd_date     = SYSDATE
"
"         WHERE ebch_bu     = p_bu
"
"           AND ebch_doc_no = p_doc_no;
"
"
"
"        p_res := v_res;
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
"   END proc_post_emp_bonus;
"
"
"
"   PROCEDURE proc_reverse_emp_bonus(p_bu                VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_bonus_calc_hd
"
"    WHERE ebch_bu     = p_bu
"
"      AND ebch_doc_no = p_doc_no
"
"      AND ebch_status IN ('P');
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
"     FROM emp_bonus_calc_ln
"
"    WHERE ebcl_bu       = p_bu
"
"      AND ebcl_doc_no   = p_doc_no
"
"      AND ebcl_total_bonus > 0
"
"      AND ebcl_sel_flag = 'Y'
"
"    ORDER BY ebcl_seq_no;
"
"
"
"   CURSOR c3(c_adj_no                VARCHAR2,
"
"            c_emp_id                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM emp_pyrl_adjustments
"
"    WHERE epadj_bu       = p_bu
"
"      AND epadj_adj_no   = c_adj_no
"
"      AND epadj_emp_id   = c_emp_id
"
"      AND epadj_mode     = '+'
"
"      AND epadj_accm_amt = 0
"
"      AND epadj_status   = 'P';
"
"
"
"      cr3                    c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_year                NUMBER,
"
"            c_period                NUMBER,
"
"            c_batch_no                VARCHAR2,
"
"            c_pyrl_no                VARCHAR2)
"
"       IS
"
"   SELECT 1
"
"     FROM bank_trans_hist_vw,
"
"          payroll_payment_voucher
"
"    WHERE btrans_bu           = ppv_bu
"
"      AND btrans_ord_no       = ppv_voucher_no
"
"      AND btrans_bu           = p_bu
"
"      AND btrans_trans_year   = c_year
"
"      AND btrans_trans_period = c_period
"
"      AND ppv_payroll_no      = c_pyrl_no
"
"      AND ppv_status          IN ('I', 'P')
"
"      AND ppv_voucher_pfx     = 'PPV'
"
"    UNION ALL
"
"   SELECT 1
"
"     FROM suplr_doc_hd_hist_vw1
"
"    WHERE suphd_bu          = p_bu
"
"      AND suphd_src_doc_no  = c_batch_no
"
"      AND suphd_status      = 'P'
"
"      AND suphd_sc_tot_amt  > 0
"
"      AND suphd_sc_proc_amt > 0;
"
"
"
"      cr4                    c4%ROWTYPE;
"
"
"
"      v_year                    NUMBER(7);
"
"      v_period                    NUMBER(2);
"
"
"
"      v_ip_addr                    VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user                    VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_res                    VARCHAR2(1)  := 'N';
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
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||' ~ '||p_bu||' ~ '||p_doc_no);
"
"         ELSE
"
"
"
"            /* Document Payment Type : Payroll */
"
"
"
"            IF cr1.ebch_payment_type = 'P' THEN
"
"
"
"               v_res := 'N';
"
"
"
"               FOR cr2 IN c2
"
"               LOOP
"
"
"
"                  IF cr2.ebcl_bonus_adj_no IS NULL THEN
"
"                     RAISE_APPLICATION_ERROR(-20026, 'HRM');
"
"                  ELSE
"
"
"
"                     OPEN c3(cr2.ebcl_bonus_adj_no, cr2.ebcl_emp_id);
"
"                     FETCH c3 INTO cr3;
"
"
"
"                        IF c3%NOTFOUND THEN
"
"                           RAISE_APPLICATION_ERROR(-20003, 'HRM'||' BU : '||p_bu||' Adj. No. : '||cr2.ebcl_bonus_adj_no||' ~ Emp : '||cr2.ebcl_emp_id);
"
"                        END IF;
"
"
"
"                     CLOSE c3;
"
"
"
"              UPDATE emp_pyrl_adjustments
"
"                 SET epadj_status      = 'E',
"
"                     epadj_narration   = 'BONUS ADJUSTMENT REVERSED. DOC. NO./LINE : '||p_doc_no||'/'||cr2.ebcl_seq_no,
"
"                     epadj_upd_by      = p_user,
"
"                     epadj_upd_ip_addr = v_ip_addr,
"
"                     epadj_upd_os_user = v_os_user,
"
"                     epadj_upd_date    = SYSDATE
"
"               WHERE epadj_bu     = p_bu
"
"                 AND epadj_emp_id = cr2.ebcl_emp_id
"
"                 AND epadj_adj_no = cr2.ebcl_bonus_adj_no;
"
"
"
"              IF SQL%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20023, 'WFR');
"
"              END IF;
"
"
"
"              v_res := 'Y';
"
"
"
"                  END IF;
"
"
"
"               END LOOP c2;
"
"
"
"            END IF;
"
"
"
"            /* Document Payment Type : Employee Payable */
"
"
"
"            IF cr1.ebch_payment_type = 'E' THEN
"
"
"
"               v_res := 'N';
"
"
"
"               FOR cr2 IN c2
"
"               LOOP
"
"
"
"                  proc_find_pyrl_cal_year_period(p_bu,
"
"                                       TRUNC(cr1.ebch_eff_from),
"
"                         v_year,
"
"                         v_period,
"
"                                     cr1.ebch_clndr_id);
"
"
"
"                  IF (cr2.ebcl_pyrl_no IS NULL OR cr2.ebcl_pyrl_batch_no IS NULL) THEN
"
"                     RAISE_APPLICATION_ERROR(-20999, 'HRM');
"
"                  ELSE
"
"
"
"                     OPEN c4(v_year, v_period, cr2.ebcl_pyrl_batch_no, cr2.ebcl_pyrl_no);
"
"                     FETCH c4 INTO cr4;
"
"
"
"                        IF c4%FOUND THEN
"
"                           RAISE_APPLICATION_ERROR(-20186, 'APM'||' BU : '||p_bu||' Batch No. : '||cr2.ebcl_pyrl_batch_no||' ~ Payroll No. : '||cr2.ebcl_pyrl_no);
"
"                        END IF;
"
"
"
"                     CLOSE c4;
"
"
"
"             UPDATE payroll_hist_ln
"
"                SET phln_jrnl_reverse_flag = 'Y'
"
"              WHERE phln_bu      = p_bu
"
"                AND phln_pyrl_no = cr2.ebcl_pyrl_no
"
"                AND phln_process_batch_no = cr2.ebcl_pyrl_batch_no;
"
"
"
"             DELETE
"
"               FROM payroll_hist_ln
"
"              WHERE phln_bu      = p_bu
"
"                AND phln_pyrl_no = cr2.ebcl_pyrl_no
"
"                AND phln_process_batch_no = cr2.ebcl_pyrl_batch_no;
"
"
"
"             UPDATE payroll_hist_hd
"
"                SET phhd_jrnl_reverse_flag = 'Y'
"
"              WHERE phhd_bu      = p_bu
"
"                AND phhd_year    = v_year
"
"                AND phhd_period  = v_period
"
"                AND phhd_pyrl_no = cr2.ebcl_pyrl_no
"
"                AND phhd_process_batch_no = cr2.ebcl_pyrl_batch_no;
"
"
"
"             DELETE
"
"               FROM payroll_hist_hd
"
"              WHERE phhd_bu      = p_bu
"
"                AND phhd_year    = v_year
"
"                AND phhd_period  = v_period
"
"                AND phhd_pyrl_no = cr2.ebcl_pyrl_no
"
"                AND phhd_process_batch_no = cr2.ebcl_pyrl_batch_no;
"
"
"
"             UPDATE pyrl_proc_batch_hd
"
"                SET ppbh_jrnl_reverse_flag = 'Y'
"
"              WHERE ppbh_bu       = p_bu
"
"                AND ppbh_year     = v_year
"
"                AND ppbh_period   = v_period
"
"                AND ppbh_batch_no = cr2.ebcl_pyrl_batch_no;
"
"
"
"             DELETE
"
"               FROM pyrl_proc_batch_hd
"
"              WHERE ppbh_bu       = p_bu
"
"                AND ppbh_year     = v_year
"
"                AND ppbh_period   = v_period
"
"                AND ppbh_batch_no = cr2.ebcl_pyrl_batch_no;
"
"
"
"              v_res := 'Y';
"
"
"
"                  END IF;
"
"
"
"               END LOOP c2;
"
"
"
"            END IF;
"
"
"
"            IF v_res = 'Y' THEN
"
"
"
"               UPDATE emp_bonus_calc_hd
"
"                  SET ebch_status      = 'R',
"
"                      ebch_upd_by      = p_user,
"
"              ebch_upd_ip_addr = v_ip_addr,
"
"              ebch_upd_os_user = v_os_user,
"
"              ebch_upd_date    = SYSDATE
"
"            WHERE ebch_bu     = p_bu
"
"              AND ebch_doc_no = p_doc_no
"
"              AND ebch_status = 'P';
"
"
"
"            END IF;
"
"
"
"            p_res := v_res;
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
"   END proc_reverse_emp_bonus;
"
"
"
"END pack_emp_bonus_calc;"
/
