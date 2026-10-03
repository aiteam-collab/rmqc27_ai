CREATE OR REPLACE
"PACKAGE BODY        pack_calc_emp_tds
"
"AS
"
"
"
"   PROCEDURE proc_calc_emp_tds_pyrl(p_bu                VARCHAR2,
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
"     FROM hrm_tds_calc_hd,
"
"          employees
"
"    WHERE htch_bu     = emp_bu
"
"      AND htch_emp_id = emp_emp_id
"
"      AND htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id        VARCHAR2,
"
"             c_year          NUMBER,
"
"             c_period        NUMBER)
"
"       IS
"
"   SELECT phhd_year,
"
"          phhd_period,
"
"          phln_elmnt_id,
"
"          phln_mode,
"
"          SUM(phln_actual_amount) phln_actual_amount,
"
"          SUM(phln_amount)phln_amount,
"
"          pehd_type,
"
"          ppln_proc_type
"
"     FROM (SELECT phhd_year,
"
"          phhd_period,
"
"          phln_elmnt_id,
"
"          phln_mode,
"
"          phln_actual_amount,
"
"          phln_amount,
"
"          pehd_type,
"
"          'H' ppln_proc_type
"
"             FROM payroll_hist_hd,
"
"                  payroll_hist_ln,
"
"                  payroll_elements_hd
"
"            WHERE phhd_bu       = phln_bu
"
"              AND phhd_pyrl_no  = phln_pyrl_no
"
"              AND phhd_process_batch_no = phln_process_batch_no
"
"              AND phln_bu       = pehd_bu
"
"              AND phln_elmnt_id = pehd_elmnt_id
"
"              AND phhd_bu       = p_bu
"
"              AND phhd_emp_id   = c_emp_id
"
"              AND phhd_year     = c_year
"
"              AND (phhd_period  = c_period OR c_period IS NULL)
"
"              AND pehd_type NOT IN ('CA3', 'RC3')
"
"              AND phhd_pyrl_type = 'N'
"
"           ---AND phhd_pyrl_type  NOT IN ('I')  ---4.10.2024
"
"        UNION ALL
"
"           SELECT pphd_year,
"
"                  pphd_period,
"
"          ppln_elmnt_id,
"
"          ppln_mode,
"
"          ppln_actual_amount,
"
"          ppln_amount,
"
"          pehd_type,
"
"          'P' ppln_proc_type
"
"             FROM payroll_prep_hd,
"
"                  payroll_prep_ln,
"
"                  payroll_elements_hd
"
"            WHERE pphd_bu        = ppln_bu
"
"              AND pphd_pyrl_type = ppln_pyrl_type
"
"              AND pphd_year      = ppln_year
"
"              AND pphd_period    = ppln_period
"
"              AND pphd_emp_id    = ppln_emp_id
"
"              AND ppln_bu        = pehd_bu
"
"              AND ppln_elmnt_id  = pehd_elmnt_id
"
"              AND pphd_bu        = p_bu
"
"              AND pphd_emp_id    = c_emp_id
"
"              AND pphd_year      = c_year
"
"              AND (pphd_period   = c_period OR c_period IS NULL)
"
"              AND pehd_elmnt_id NOT IN ('TDS')
"
"              AND pehd_type NOT IN ('CA3', 'TDE','RC3'))
"
"         GROUP BY phhd_year,phhd_period,phln_elmnt_id,phln_mode,pehd_type,ppln_proc_type
"
"         ORDER BY phhd_year,phhd_period;
"
"
"
"   CURSOR c3(c_emp_id        VARCHAR2,
"
"         c_year        NUMBER)
"
"       IS
"
"   SELECT NVL(MIN(phhd_period), 0) - 1 phhd_min_period,
"
"          NVL(MAX(phhd_period), 0) + 1 phhd_max_period
"
"     FROM (SELECT phhd_period
"
"             FROM payroll_hist_hd
"
"            WHERE phhd_bu      = p_bu
"
"              AND phhd_emp_id  = c_emp_id
"
"              AND phhd_year    = c_year
"
"           ---AND phhd_pyrl_type   NOT IN ('I')    ---4.10.2024
"
"        UNION ALL
"
"           SELECT pphd_period
"
"             FROM payroll_prep_hd
"
"            WHERE pphd_bu        = p_bu
"
"              AND pphd_emp_id    = c_emp_id
"
"              AND pphd_year      = c_year);
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c5
"
"       IS
"
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl
"
"    WHERE htcp_bu     = p_bu
"
"      AND htcp_doc_no = p_doc_no
"
"      AND htcp_elmnt_id NOT IN ('ONS', 'LVA')
"
"      AND htcp_add_ded_type = '+';
"
"
"
"      cr5                c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_elmnt_id        VARCHAR2)
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
"      AND pehd_type     IN ('FA', 'TDE');
"
"
"
"      cr6                c6%ROWTYPE;
"
"
"
"   CURSOR c7(c_date            DATE,
"
"            c_clndr_id            VARCHAR2)
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
"    WHERE pcy_bu       = pcp_bu
"
"      AND pcy_year     = pcp_year
"
"      AND pcy_clndr_id = pcp_clndr_id
"
"      AND pcp_bu       = p_bu
"
"      AND pcp_clndr_id = c_clndr_id
"
"      AND TRUNC(c_date) BETWEEN TRUNC(pcp_start_date) AND TRUNC(pcp_end_date);
"
"
"
"      cr7                c7%ROWTYPE;
"
"
"
"   CURSOR c8(c_zone_id            VARCHAR2,
"
"           c_gender            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_pt_tax_slab_hd
"
"    WHERE hptsh_bu       = p_bu
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
"      cr8                c8%ROWTYPE;
"
"
"
"   CURSOR c9(c_emp_id         VARCHAR2,
"
"             c_year           NUMBER,
"
"             c_period         NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(phln_amount), 0) phln_oth_amount
"
"     FROM (SELECT phln_amount
"
"             FROM payroll_hist_hd,
"
"                  payroll_hist_ln,
"
"                  payroll_elements_hd
"
"            WHERE phhd_bu       = phln_bu
"
"              AND phhd_pyrl_no  = phln_pyrl_no
"
"              AND phhd_process_batch_no = phln_process_batch_no
"
"              AND phln_bu       = pehd_bu
"
"              AND phln_elmnt_id = pehd_elmnt_id
"
"              AND phhd_bu       = p_bu
"
"              AND phhd_emp_id   = c_emp_id
"
"              AND phhd_year     = c_year
"
"              AND phhd_period   = c_period
"
"              AND phln_elmnt_id = 'OTD'
"
"        UNION ALL
"
"           SELECT ppln_amount
"
"             FROM payroll_prep_hd,
"
"                  payroll_prep_ln,
"
"                  payroll_elements_hd
"
"            WHERE pphd_bu        = ppln_bu
"
"              AND pphd_pyrl_type = ppln_pyrl_type
"
"              AND pphd_year      = ppln_year
"
"          AND pphd_period    = ppln_period
"
"          AND pphd_emp_id    = ppln_emp_id
"
"          AND ppln_bu        = pehd_bu
"
"          AND ppln_elmnt_id  = pehd_elmnt_id
"
"          AND pphd_bu        = p_bu
"
"          AND pphd_emp_id    = c_emp_id
"
"          AND pphd_year      = c_year
"
"          AND pphd_period    = c_period
"
"          AND ppln_elmnt_id  = 'OTD'
"
"          );
"
"
"
"      cr9                c9%ROWTYPE;
"
"
"
"   CURSOR c10(c_emp_id            VARCHAR2,
"
"              c_elmnt_id          VARCHAR2,
"
"              c_year              NUMBER,
"
"              c_period            NUMBER,
"
"              c_mode              VARCHAR2,
"
"              c_type              VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(ppln_amount), 0) ppln_amount,
"
"          NVL(SUM(ppln_actual_amt), 0) ppln_actual_amt
"
"     FROM (SELECT ppln_amount ppln_amount,
"
"                  ppln_actual_amount ppln_actual_amt
"
"             FROM payroll_prep_hd,
"
"                  payroll_prep_ln
"
"            WHERE pphd_bu        = ppln_bu
"
"              AND pphd_pyrl_type = ppln_pyrl_type
"
"              AND pphd_year      = ppln_year
"
"              AND pphd_period    = ppln_period
"
"              AND pphd_emp_id    = ppln_emp_id
"
"              AND ppln_bu        = p_bu
"
"              AND ppln_year      = c_year
"
"              AND ppln_period    = c_period
"
"              AND ppln_emp_id    = c_emp_id
"
"              AND ppln_elmnt_id  = c_elmnt_id
"
"              AND ppln_mode      = c_mode
"
"              AND c_type         = 'P'
"
"        UNION ALL
"
"           SELECT phln_amount phln_amount,
"
"                  phln_actual_amount phln_actual_amt
"
"             FROM payroll_hist_hd,
"
"                  payroll_hist_ln
"
"            WHERE phhd_bu       = phln_bu
"
"              AND phhd_pyrl_no  = phln_pyrl_no
"
"              AND phhd_process_batch_no = phln_process_batch_no
"
"              AND phhd_bu       = p_bu
"
"              AND phhd_year     = c_year
"
"              AND phhd_period   = c_period
"
"              AND phhd_emp_id   = c_emp_id
"
"              AND phln_elmnt_id = c_elmnt_id
"
"              AND phln_mode     = c_mode
"
"          --- AND phhd_pyrl_type   NOT IN ('I')     ---4.10.2024
"
"              AND c_type        = 'H');
"
"
"
"      cr10                c10%ROWTYPE;
"
"
"
"   CURSOR c11(c_year            NUMBER,
"
"              c_period              NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM payroll_cal_year,
"
"          payroll_cal_period
"
"    WHERE pcy_bu       = pcp_bu
"
"      AND pcy_year     = pcp_year
"
"      --AND pcy_clndr_id = pcp_clndr_id
"
"      AND pcp_bu       = p_bu
"
"      AND pcp_period   = c_period
"
"      AND pcp_year     = c_year;
"
"
"
"      cr11                c11%ROWTYPE;
"
"
"
"   CURSOR c12(c_start_date     DATE,
"
"              c_end_date       DATE,
"
"              c_emp_id         VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(elpd_premium_amt),0) elpd_premium_amt
"
"     FROM emp_lic_policy_det
"
"    WHERE elpd_bu = p_bu
"
"      AND elpd_emp_id = c_emp_id
"
"      AND ((elpd_next_due_date BETWEEN c_start_date AND c_end_date)
"
"          OR (elpd_next_due_date IS NULL))
"
"      AND (((c_start_date BETWEEN elpd_start_date AND elpd_maturity_date)
"
"      AND (c_end_date BETWEEN elpd_start_date AND elpd_maturity_date))OR(c_start_date >= elpd_start_date AND elpd_maturity_date IS NULL));
"
"
"
"      cr12            c12%ROWTYPE;
"
"
"
"    CURSOR c13(c_emp_id            VARCHAR2,
"
"               c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                            FROM hrm_tds_decl_hd c
"
"                           WHERE c.htdh_bu     = a.htdh_bu
"
"                             AND c.htdh_doc_no = a.htdh_doc_no
"
"                             AND c.htdh_status IN ('A', 'R'));
"
"
"
"      cr13            c13%ROWTYPE;
"
"
"
"      v_pre_comp_add            NUMBER(15, 3) := 0;
"
"      v_yearly_sal              NUMBER(15, 3) := 0;
"
"      v_emp_year                NUMBER(7);
"
"      v_emp_period              NUMBER(2);
"
"      v_min_cnt                 NUMBER(5) := 0;
"
"      v_max_cnt                 NUMBER(5) := 0;
"
"      v_pyrl_amt                NUMBER(15, 3) := 0;
"
"      v_result                  VARCHAR2(1) := 'N';
"
"      v_oth_amt                 NUMBER(15, 3) := 0;
"
"      v_insert_flag             VARCHAR2(1) := 'Y';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"            DELETE
"
"              FROM hrm_tds_calc_pyrl
"
"             WHERE htcp_bu = p_bu
"
"               AND htcp_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_slry_incm      = 0,
"
"                   htch_us10_amt       = 0,
"
"                      htch_prof_tax       = 0,
"
"                      htch_net_sal_incm   = 0,
"
"                      htch_hp_incm        = 0,
"
"                      htch_oth_incm       = 0,
"
"                      htch_gr_incm        = 0,
"
"                      htch_vi_a_ded       = 0,
"
"                      htch_net_taxbl_incm = 0,
"
"                      htch_tax_amt        = 0,
"
"                      htch_rebate         = 0,
"
"                      htch_surcharge      = 0,
"
"                      htch_shec            = 0,
"
"                      htch_tds_ded        = 0,
"
"                      htch_yrly_tax_pybl  = 0,
"
"                      htch_lta_amt        = 0,
"
"                      htch_rmng_mnth      = 0,
"
"                      htch_upd_lta_amt    = 0,
"
"                      htch_mnth_tds_ded   = 0,
"
"                      htch_upd_by         = p_user,
"
"                      htch_upd_date       = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"            v_result  := 'N';
"
"
"
"            /* Payroll Calculation Begins */
"
"
"
"            FOR cr2 IN c2(cr1.htch_emp_id, cr1.htch_fin_year, NULL)
"
"            LOOP
"
"
"
"               v_insert_flag := 'Y';
"
"
"
"               IF cr2.ppln_proc_type = 'H' THEN
"
"
"
"                  /* This part is used to check element in both side +/- and insert only + element and also deduct  */
"
"
"
"                  IF cr2.phln_mode = '+' THEN
"
"
"
"                     OPEN c10(cr1.htch_emp_id, cr2.phln_elmnt_id, cr1.htch_fin_year, cr2.phhd_period, '-', cr2.ppln_proc_type);
"
"                     FETCH c10 INTO cr10;
"
"
"
"                        IF c10%FOUND THEN
"
"                           v_pyrl_amt := (cr2.phln_amount - cr10.ppln_amount);
"
"                        ELSE
"
"                           v_pyrl_amt := cr2.phln_amount;
"
"                        END IF;
"
"
"
"                     CLOSE c10;
"
"
"
"                  ELSE
"
"                     v_pyrl_amt := cr2.phln_amount;
"
"                  END IF;
"
"
"
"                  IF cr2.phln_mode = '-' THEN
"
"
"
"                     OPEN c10(cr1.htch_emp_id, cr2.phln_elmnt_id, cr1.htch_fin_year, cr2.phhd_period, '+', cr2.ppln_proc_type);
"
"                     FETCH c10 INTO cr10;
"
"
"
"                        IF c10%FOUND THEN
"
"
"
"                           IF cr10.ppln_amount > 0 THEN
"
"                              v_insert_flag := 'N';
"
"                           ELSE
"
"                              v_insert_flag := 'Y';
"
"                           END IF;
"
"
"
"                        ELSE
"
"                           v_insert_flag := 'Y';
"
"                        END IF;
"
"
"
"                     CLOSE c10;
"
"
"
"           ELSE
"
"              v_insert_flag := 'Y';
"
"                  END IF;
"
"
"
"               ELSE
"
"
"
"                  IF cr2.pehd_type IN ('CA', 'RCA', 'RC3', 'VA', 'FA') THEN
"
"                     v_pyrl_amt := cr2.phln_amount;
"
"                  ELSE
"
"
"
"             /* This part is used to check element in both side +/- and insert only + element and also deduct  */
"
"
"
"                     IF cr2.phln_mode = '+' THEN
"
"
"
"                        OPEN c10(cr1.htch_emp_id, cr2.phln_elmnt_id, cr1.htch_fin_year, cr2.phhd_period, '-', cr2.ppln_proc_type);
"
"                        FETCH c10 INTO cr10;
"
"
"
"                           IF c10%FOUND THEN
"
"                              v_pyrl_amt := ROUND(cr2.phln_amount - cr10.ppln_amount, 2);
"
"                           ELSE
"
"                              v_pyrl_amt := cr2.phln_actual_amount;
"
"                           END IF;
"
"
"
"                        CLOSE c10;
"
"
"
"                     ELSE
"
"                        v_pyrl_amt := cr2.phln_actual_amount;
"
"                     END IF;
"
"
"
"                     IF cr2.phln_mode = '-' THEN
"
"
"
"                        OPEN c10(cr1.htch_emp_id, cr2.phln_elmnt_id, cr1.htch_fin_year, cr2.phhd_period, '+', cr2.ppln_proc_type);
"
"                        FETCH c10 INTO cr10;
"
"
"
"                           IF c10%FOUND THEN
"
"
"
"                              IF cr10.ppln_amount > 0 THEN
"
"                                 v_insert_flag := 'N';
"
"                              ELSE
"
"                                 v_insert_flag := 'Y';
"
"                              END IF;
"
"
"
"                           ELSE
"
"                              v_insert_flag := 'Y';
"
"                           END IF;
"
"
"
"                        CLOSE c10;
"
"
"
"             ELSE
"
"                v_insert_flag := 'Y';
"
"                     END IF;
"
"
"
"                  END IF;
"
"
"
"               END IF;
"
"
"
"               /* Only for AML Client for Other Deduction made for arrear */
"
"
"
"               IF p_bu = 'AML' THEN
"
"
"
"                  OPEN c9(cr1.htch_emp_id, cr1.htch_fin_year, cr2.phhd_period);
"
"                  FETCH c9 INTO cr9;
"
"
"
"                     IF NVL(cr9.phln_oth_amount, 0) > 0 THEN
"
"                        v_oth_amt := NVL(cr9.phln_oth_amount, 0);
"
"                     ELSE
"
"                        v_oth_amt := 0;
"
"                     END IF;
"
"
"
"                  CLOSE c9;
"
"
"
"                  IF v_oth_amt > 0 THEN
"
"
"
"                     IF cr2.phln_elmnt_id IN ('BASIC', 'CVA', 'HRA', 'MEDI') THEN
"
"                        v_pyrl_amt := ROUND(v_pyrl_amt - ((v_pyrl_amt/31) * 6));
"
"                     ELSE
"
"                        v_pyrl_amt := v_pyrl_amt;
"
"                     END IF;
"
"
"
"                  END IF;
"
"
"
"               END IF;
"
"
"
"               /* Only for AML Client for Other Deduction made for arrear */
"
"
"
"              IF v_insert_flag = 'Y' THEN
"
"
"
"                  INSERT INTO hrm_tds_calc_pyrl(
"
"                                                htcp_bu             ,
"
"                        htcp_doc_no         ,
"
"                        htcp_fin_period     ,
"
"                        htcp_elmnt_id       ,
"
"                        htcp_elmnt_amt      ,
"
"                        htcp_add_ded_type       ,
"
"                        htcp_cre_by             ,
"
"                        htcp_cre_date
"
"                        )
"
"                     VALUES(
"
"                            p_bu                    ,          --htcp_bu
"
"                        p_doc_no                ,          --htcp_doc_no
"
"                        cr2.phhd_period         ,          --htcp_fin_period
"
"                        cr2.phln_elmnt_id       ,          --htcp_elmnt_id
"
"                        v_pyrl_amt              ,          --htcp_elmnt_amt
"
"                        cr2.phln_mode           ,          --htcp_add_ded_type
"
"                        p_user                  ,          --htcp_cre_by
"
"                        SYSDATE                            --htcp_cre_date
"
"                         );
"
"
"
"                  v_result := 'Y';
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
"            OPEN c7(TRUNC(cr1.emp_start_date), cr1.emp_clndr_id);
"
"            FETCH c7 INTO cr7;
"
"
"
"               IF c7%NOTFOUND THEN
"
"                  v_emp_year   := cr1.htch_fin_year;
"
"                  v_emp_period := 1;
"
"               ELSE
"
"                  v_emp_year   := cr7.pcp_year;
"
"                  v_emp_period := cr7.pcp_period;
"
"               END IF;
"
"
"
"            CLOSE c7;
"
"
"
"            v_max_cnt := 0;
"
"            v_min_cnt := 0;
"
"
"
"            OPEN c3(cr1.htch_emp_id, cr1.htch_fin_year);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20999, 'HRM');
"
"               ELSE
"
"
"
"                  IF cr3.phhd_min_period <= 0 THEN
"
"                     v_min_cnt := 0;
"
"                  ELSE
"
"                     v_min_cnt := cr3.phhd_min_period;
"
"                  END IF;
"
"
"
"                  IF v_min_cnt > 0 THEN
"
"
"
"                     IF (cr1.htch_fin_year||TO_CHAR(v_min_cnt, '00')) < (v_emp_year||TO_CHAR(v_emp_period, '00')) THEN
"
"                        v_min_cnt := 0;
"
"                     ELSE
"
"                        v_min_cnt := v_emp_period;
"
"                     END IF;
"
"
"
"                  END IF;
"
"
"
"                  IF cr3.phhd_max_period > 12 THEN
"
"                     v_max_cnt := 0;
"
"                  ELSE
"
"                     v_max_cnt := cr3.phhd_max_period;
"
"                  END IF;
"
"
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            IF v_min_cnt > 0 THEN
"
"
"
"               FOR i IN 1..v_min_cnt
"
"               LOOP
"
"
"
"                  FOR cr2 IN c2(cr1.htch_emp_id, cr1.htch_fin_year, v_min_cnt + 1)
"
"                  LOOP
"
"
"
"                     IF cr2.ppln_proc_type = 'H' THEN
"
"                        v_pyrl_amt := cr2.phln_amount;
"
"                     ELSE
"
"
"
"                        IF cr2.pehd_type IN ('CA', 'RCA', 'RC3', 'VA', 'FA') THEN
"
"                           v_pyrl_amt := cr2.phln_amount;
"
"                        ELSE
"
"                           v_pyrl_amt := cr2.phln_actual_amount;
"
"                        END IF;
"
"
"
"                     END IF;
"
"
"
"                 OPEN c6(cr2.phln_elmnt_id);
"
"                 FETCH c6 INTO cr6;
"
"
"
"                    IF c6%FOUND THEN
"
"
"
"                       OPEN c8(cr1.emp_zone, cr1.emp_gender);
"
"                       FETCH c8 INTO cr8;
"
"
"
"                  IF c8%FOUND THEN
"
"
"
"                 IF cr8.hptsh_elmnt_id = cr2.phln_elmnt_id THEN
"
"                   v_pyrl_amt := v_pyrl_amt;
"
"                 ELSE
"
"                   v_pyrl_amt := 0;
"
"                 END IF;
"
"
"
"                  ELSE
"
"                  v_pyrl_amt := 0;
"
"                  END IF;
"
"
"
"                       CLOSE c8;
"
"
"
"                    ELSE
"
"                       v_pyrl_amt := v_pyrl_amt;
"
"                    END IF;
"
"
"
"                 CLOSE c6;
"
"
"
"                 IF cr2.phln_elmnt_id = 'LIC' THEN
"
"
"
"                    OPEN c11(cr1.htch_fin_year, i);
"
"                    FETCH c11 INTO cr11;
"
"                       IF c11%FOUND THEN
"
"
"
"                            OPEN c12(cr11.pcp_start_date, cr11.pcp_end_date, cr1.emp_emp_id);
"
"                            FETCH c12 INTO cr12;
"
"                              IF c12%FOUND THEN
"
"                                 v_pyrl_amt := cr12.elpd_premium_amt;
"
"                              ELSE
"
"                                 v_pyrl_amt := v_pyrl_amt;
"
"                              END IF;
"
"                            CLOSE c12;
"
"
"
"                        ELSE
"
"                            v_pyrl_amt := v_pyrl_amt;
"
"                        END IF;
"
"                    CLOSE c11;
"
"
"
"                 END IF;
"
"
"
"--raise_application_error(-20999,p_bu||'-'||p_doc_no||'-'||cr2.phln_elmnt_id||'-'||v_pyrl_amt||'-'||cr2.phln_mode);
"
"INSERT INTO hrm_tds_calc_pyrl(htcp_bu        ,
"
"                                htcp_doc_no      ,
"
"                                htcp_fin_period  ,
"
"                                htcp_elmnt_id    ,
"
"                                htcp_elmnt_amt   ,
"
"                                htcp_add_ded_type,
"
"                                htcp_cre_by      ,
"
"                                htcp_cre_date    )
"
"                             VALUES(p_bu                ,
"
"                                p_doc_no        ,
"
"                                i               ,
"
"                                cr2.phln_elmnt_id,
"
"                                v_pyrl_amt       ,
"
"                                cr2.phln_mode    ,
"
"                                p_user        ,
"
"                                SYSDATE        );
"
"
"
"                 v_result := 'Y';
"
"
"
"                  END LOOP c2;
"
"
"
"               END LOOP i;
"
"
"
"            END IF;
"
"
"
"            IF v_max_cnt > 0 THEN
"
"
"
"               FOR i IN v_max_cnt..12
"
"               LOOP
"
"
"
"                  FOR cr2 IN c2(cr1.htch_emp_id, cr1.htch_fin_year, v_max_cnt - 1)
"
"                  LOOP
"
"
"
"                     IF cr2.ppln_proc_type = 'H' THEN
"
"                        v_pyrl_amt := cr2.phln_amount;
"
"                     ELSE
"
"
"
"                        IF cr2.pehd_type IN ('CA', 'RCA', 'RC3', 'VA', 'FA') THEN
"
"                           v_pyrl_amt := cr2.phln_amount;
"
"                        ELSE
"
"                           v_pyrl_amt := cr2.phln_actual_amount;
"
"                        END IF;
"
"
"
"                     END IF;
"
"
"
"                 OPEN c6(cr2.phln_elmnt_id);
"
"                 FETCH c6 INTO cr6;
"
"
"
"                    IF c6%FOUND THEN
"
"
"
"                       OPEN c8(cr1.emp_zone, cr1.emp_gender);
"
"                       FETCH c8 INTO cr8;
"
"                  IF c8%FOUND THEN
"
"
"
"                 IF cr8.hptsh_elmnt_id = cr2.phln_elmnt_id THEN
"
"                v_pyrl_amt := v_pyrl_amt;
"
"                 ELSE
"
"                v_pyrl_amt := 0;
"
"                 END IF;
"
"
"
"              ELSE
"
"                v_pyrl_amt := 0;
"
"                  END IF;
"
"                       CLOSE c8;
"
"
"
"                    ELSE
"
"                       v_pyrl_amt := v_pyrl_amt;
"
"                    END IF;
"
"
"
"                 CLOSE c6;
"
"
"
"                 IF cr2.phln_elmnt_id = 'LIC' THEN
"
"
"
"                    OPEN c11(cr1.htch_fin_year, i);
"
"                    FETCH c11 INTO cr11;
"
"                       IF c11%FOUND THEN
"
"
"
"                            OPEN c12(cr11.pcp_start_date, cr11.pcp_end_date, cr1.emp_emp_id);
"
"                            FETCH c12 INTO cr12;
"
"                              IF c12%FOUND THEN
"
"                                 v_pyrl_amt := cr12.elpd_premium_amt;
"
"                              ELSE
"
"                                 v_pyrl_amt := v_pyrl_amt;
"
"                              END IF;
"
"                            CLOSE c12;
"
"
"
"                        ELSE
"
"                            v_pyrl_amt := v_pyrl_amt;
"
"                        END IF;
"
"                    CLOSE c11;
"
"
"
"                 END IF;
"
"
"
"                INSERT INTO hrm_tds_calc_pyrl(
"
"                        htcp_bu          ,
"
"                        htcp_doc_no      ,
"
"                        htcp_fin_period  ,
"
"                        htcp_elmnt_id    ,
"
"                        htcp_elmnt_amt   ,
"
"                        htcp_add_ded_type,
"
"                        htcp_cre_by      ,
"
"                        htcp_cre_date
"
"                        )
"
"                                         VALUES(
"
"                                                p_bu             ,
"
"                        p_doc_no         ,
"
"                        i                ,
"
"                        cr2.phln_elmnt_id,
"
"                        v_pyrl_amt       ,
"
"                        cr2.phln_mode    ,
"
"                        p_user           ,
"
"                        SYSDATE
"
"                        );
"
"
"
"                 v_result := 'Y';
"
"
"
"                  END LOOP c2;
"
"
"
"               END LOOP i;
"
"
"
"            END IF;
"
"
"
"            IF cr1.emp_status IN ('R','T') THEN
"
"
"
"               DELETE hrm_tds_calc_pyrl
"
"                WHERE htcp_fin_period >= v_max_cnt-- + 1
"
"                  AND htcp_bu     = p_bu
"
"                  AND htcp_doc_no = p_doc_no;
"
"
"
"            END IF;
"
"
"
"            OPEN c5;
"
"            FETCH c5 INTO cr5;
"
"
"
"               IF c5%FOUND THEN
"
"                  v_yearly_sal := cr5.htcp_elmnt_amt;
"
"               ELSE
"
"                  v_yearly_sal := 0;
"
"               END IF;
"
"
"
"            CLOSE c5;
"
"            ------pre comp tds add -------------bala 23-09-2025
"
"            OPEN c13(cr1.emp_emp_id,cr1.htch_fin_year);
"
"            FETCH c13 INTO cr13;
"
"
"
"               IF c13%FOUND THEN
"
"                  v_pre_comp_add := cr13.htdld_pre_comp_add;
"
"               ELSE
"
"                  v_pre_comp_add := 0;
"
"               END IF;
"
"
"
"            CLOSE c13;
"
"        ----------------------------
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_slry_incm = (htch_bonus_amt + htch_exgratia_amt + htch_med_rebmnt_amt + htch_others_amt) + v_yearly_sal + v_pre_comp_add,
"
"                   htch_upd_by    = p_user,
"
"                   htch_upd_date  = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"            /* End of Payroll Calculation */
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_pyrl;
"
"
"
"   PROCEDURE proc_calc_emp_tds_hra(p_bu                    VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                            FROM hrm_tds_decl_hd c
"
"                           WHERE c.htdh_bu     = a.htdh_bu
"
"                             AND c.htdh_doc_no = a.htdh_doc_no
"
"                       AND c.htdh_status IN ('A', 'R'));
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
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_sec10_13a_elmnt
"
"    WHERE htcp_bu       = htsae_bu
"
"      AND htcp_elmnt_id = htsae_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no
"
"      AND htsae_elmnt_type IN ('H');
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_sec10_13a_elmnt
"
"    WHERE htcp_bu       = htsae_bu
"
"      AND htcp_elmnt_id = htsae_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no
"
"      AND htsae_elmnt_type IN ('B');
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_sec10_13a_limit
"
"    WHERE htsal_bu = p_bu;
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"      v_metro_n_pct            HRM_TDS_SEC10_13A_LIMIT.HTSAL_METRO_N_PCT%TYPE;
"
"      v_metro_y_pct            HRM_TDS_SEC10_13A_LIMIT.HTSAL_METRO_Y_PCT%TYPE;
"
"      v_rent_paid_pct            HRM_TDS_SEC10_13A_LIMIT.HTSAL_RENT_PAID_PCT%TYPE;
"
"      v_exempt_flag            HRM_TDS_SEC10_13A_LIMIT.HTSAL_EXEMPT_FLAG%TYPE;
"
"      v_doc_limit            HRM_TDS_SEC10_13A_LIMIT.HTSAL_DOC_LIMIT%TYPE;
"
"
"
"      v_hra_rcvd            NUMBER(15, 3) := 0;
"
"      v_rent_paid            NUMBER(15, 3) := 0;
"
"      v_basic                NUMBER(15, 3) := 0;
"
"      v_10pct_basic            NUMBER(15, 3) := 0;
"
"      v_4050pct_basic            NUMBER(15, 3) := 0;
"
"      v_excess_paid            NUMBER(15, 3) := 0;
"
"      v_min_hra                NUMBER(15, 3) := 0;
"
"      v_act_hra                NUMBER(15, 3) := 0;
"
"      v_hra_exempt            NUMBER(15, 3) := 0;
"
"      v_metro_flag            VARCHAR2(1) := 'N';
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~ Entity : '||p_bu||' ~ Employee : '||cr0.htch_emp_id||' ~ Year : '||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_hra_dec
"
"             WHERE hthrd_bu = p_bu
"
"               AND hthrd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_hra_dec(hthrd_bu           ,
"
"                        hthrd_doc_no      ,
"
"                        hthrd_cre_by      ,
"
"                        hthrd_cre_date    )
"
"                     VALUES(p_bu        ,    --hthrd_bu
"
"                         p_doc_no    ,    --hthrd_doc_no
"
"                        p_user        ,    --hthrd_cre_by
"
"                        SYSDATE        );    --hthrd_cre_date
"
"
"
"            v_metro_flag := NVL(cr1.htdld_sec10_13a_hra_type, 'N');
"
"            v_rent_paid  := NVL(cr1.htdld_sec10_13a_hra, 0);
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_hra_rcvd := 0;
"
"               ELSE
"
"                  v_hra_rcvd := cr2.htcp_elmnt_amt;
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  v_basic := 0;
"
"               ELSE
"
"                  v_basic := cr3.htcp_elmnt_amt;
"
"               END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"            OPEN c4;
"
"            FETCH c4 INTO cr4;
"
"
"
"               IF c4%NOTFOUND THEN
"
"              v_metro_n_pct   := 0;
"
"              v_metro_y_pct   := 0;
"
"              v_rent_paid_pct := 0;
"
"              v_exempt_flag   := 'N';
"
"              v_doc_limit     := 0;
"
"               ELSE
"
"                  v_metro_n_pct   := NVL(cr4.htsal_metro_n_pct, 0);
"
"              v_metro_y_pct   := NVL(cr4.htsal_metro_y_pct, 0);
"
"              v_rent_paid_pct := NVL(cr4.htsal_rent_paid_pct, 0);
"
"              v_exempt_flag   := cr4.htsal_exempt_flag;
"
"              v_doc_limit     := NVL(cr4.htsal_doc_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c4;
"
"
"
"                  v_10pct_basic := NVL(ROUND(((v_basic * v_rent_paid_pct)/100)), 0);
"
"
"
"                  IF v_metro_flag = 'Y' THEN
"
"                     v_4050pct_basic := NVL(ROUND(((v_basic * v_metro_y_pct)/100)), 0);
"
"                  ELSE
"
"                     v_4050pct_basic := NVL(ROUND(((v_basic * v_metro_n_pct)/100)), 0);
"
"                  END IF;
"
"
"
"                  IF (v_rent_paid - v_10pct_basic) <= 0 THEN
"
"                     v_excess_paid := 0;
"
"                  ELSE
"
"                     v_excess_paid := NVL((v_rent_paid - v_10pct_basic), 0);
"
"                  END IF;
"
"
"
"                  IF v_exempt_flag = 'N' THEN
"
"                     v_min_hra := NVL(LEAST(v_hra_rcvd, v_4050pct_basic, v_excess_paid), 0);
"
"                  ELSIF v_exempt_flag = 'M' THEN
"
"                     v_min_hra := NVL(GREATEST(v_hra_rcvd, v_4050pct_basic, v_excess_paid), 0);
"
"                  END IF;
"
"
"
"                  IF v_min_hra < 0 THEN
"
"                     v_act_hra := v_hra_rcvd;
"
"                  ELSE
"
"                     v_act_hra := v_min_hra;
"
"                  END IF;
"
"
"
"                  IF v_rent_paid <= 0 THEN
"
"                     v_hra_exempt := 0;
"
"                  ELSE
"
"                     v_hra_exempt := v_act_hra;
"
"                  END IF;
"
"
"
"                  UPDATE hrm_tds_hra_dec
"
"                     SET hthrd_hra_rcvd        = v_hra_rcvd,
"
"               hthrd_metro_flag      = v_metro_flag,
"
"               hthrd_rent_paid       = v_rent_paid,
"
"               hthrd_act_rent_paid   = v_rent_paid,
"
"               hthrd_basic_10_pct    = v_10pct_basic,
"
"               hthrd_basic_40_50_pct = v_4050pct_basic,
"
"               hthrd_excess_paid     = v_excess_paid,
"
"               hthrd_hra_min      = v_min_hra,
"
"               hthrd_act_hra      = v_act_hra,
"
"               hthrd_hra_exempt      = v_hra_exempt,
"
"               hthrd_upd_by         = p_user,
"
"               hthrd_upd_date     = SYSDATE
"
"             WHERE hthrd_bu     = p_bu
"
"               AND hthrd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_us10_amt  = CASE WHEN cr1.htdh_tax_type = 'E' THEN htch_us10_amt + v_hra_exempt + 50000
"
"                                    WHEN cr1.htdh_tax_type = 'N' THEN htch_us10_amt +  75000
"
"                               END,--htch_us10_amt + v_hra_exempt + (CASE WHEN cr1.htdh_tax_type = 'E' THEN 50000 ELSE 75000 END),--oormi
"
"               htch_upd_by    = p_user,
"
"               htch_upd_date  = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_hra;
"
"
"
"   PROCEDURE proc_calc_emp_tds_hpso(p_bu                VARCHAR2,
"
"                        p_doc_no                VARCHAR2,
"
"                        p_user                VARCHAR2,
"
"                        p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_hp_limit
"
"    WHERE hthl_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_std_ded_pct            HRM_TDS_HP_LIMIT.HTHL_STD_DED_PCT%TYPE;
"
"      v_fl_y_so_limit            HRM_TDS_HP_LIMIT.HTHL_FL_Y_SO_LIMIT%TYPE;
"
"      v_fl_n_so_limit            HRM_TDS_HP_LIMIT.HTHL_FL_N_SO_LIMIT%TYPE;
"
"      v_fl_y_lo_limit            HRM_TDS_HP_LIMIT.HTHL_FL_Y_LO_LIMIT%TYPE;
"
"      v_fl_n_lo_limit            HRM_TDS_HP_LIMIT.HTHL_FL_N_LO_LIMIT%TYPE;
"
"      v_house_cost_limit        HRM_TDS_HP_LIMIT.HTHL_HOUSE_COST_LIMIT%TYPE;
"
"      v_house_cost_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_HOUSE_COST_EXCEED_LIMIT%TYPE;
"
"      v_loan_sant_limit            HRM_TDS_HP_LIMIT.HTHL_LOAN_SANT_LIMIT%TYPE;
"
"      v_loan_sant_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_LOAN_SANT_EXCEED_LIMIT%TYPE;
"
"      v_int_paid_limit            HRM_TDS_HP_LIMIT.HTHL_INT_PAID_LIMIT%TYPE;
"
"      v_int_paid_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_INT_PAID_EXCEED_LIMIT%TYPE;
"
"      v_int_ded_limit            HRM_TDS_HP_LIMIT.HTHL_INT_DED_LIMIT%TYPE;
"
"      v_int_ded_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_INT_DED_EXCEED_LIMIT%TYPE;
"
"
"
"      v_rent_type            VARCHAR2(1) := 'N';
"
"      v_self_ocup            VARCHAR2(1) := 'N';
"
"      v_first_loan            VARCHAR2(1) := 'S';
"
"      v_3yr_acom            VARCHAR2(1) := 'S';
"
"      v_rent_rcvd            NUMBER(15, 3) := 0;
"
"      v_house_tax            NUMBER(15, 3) := 0;
"
"      v_rr_ht_tot            NUMBER(15, 3) := 0;
"
"      v_std_ded                NUMBER(15, 3) := 0;
"
"      v_int_rent_paid            NUMBER(15, 3) := 0;
"
"      v_int_dclr            NUMBER(15, 3) := 0;
"
"      v_tot_ded                NUMBER(15, 3) := 0;
"
"      v_house_cost            NUMBER(15, 3) := 0;
"
"      v_loan_sant_amt            NUMBER(15, 3) := 0;
"
"      v_income_shp            NUMBER(15, 3) := 0;
"
"      v_income_rhp            NUMBER(15, 3) := 0;
"
"      v_pp_dclr                NUMBER(15, 3) := 0;
"
"      v_add_int_paid            NUMBER(15, 3) := 0;
"
"      v_tot_income_hp            NUMBER(15, 3) := 0;
"
"      v_temp1                NUMBER(15, 3) := 0;
"
"      v_temp2                NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
"
"
"
"
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result        := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_house_property
"
"             WHERE hthp_bu = p_bu
"
"               AND hthp_doc_no = p_doc_no
"
"               AND hthp_hp_type = 'S';
"
"
"
"            INSERT INTO hrm_tds_house_property(hthp_bu           ,
"
"                               hthp_doc_no      ,
"
"                               hthp_hp_type    ,
"
"                               hthp_seq_no    ,
"
"                               hthp_cre_by      ,
"
"                               hthp_cre_date    )
"
"                            VALUES(p_bu        ,    --hthp_bu
"
"                                p_doc_no        ,    --hthp_doc_no
"
"                                'S'        ,    --hthp_hp_type
"
"                                1        ,    --hthp_seq_no
"
"                               p_user        ,    --hthp_cre_by
"
"                               SYSDATE        );    --hthp_cre_date
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"              v_std_ded_pct := 0;
"
"              v_fl_y_so_limit := 0;
"
"              v_fl_n_so_limit := 0;
"
"              v_fl_y_lo_limit := 0;
"
"              v_fl_n_lo_limit := 0;
"
"              v_house_cost_limit := 0;
"
"              v_house_cost_exceed_limit := 0;
"
"              v_loan_sant_limit := 0;
"
"              v_loan_sant_exceed_limit := 0;
"
"              v_int_paid_limit := 0;
"
"              v_int_paid_exceed_limit := 0;
"
"              v_int_ded_limit := 0;
"
"              v_int_ded_exceed_limit := 0;
"
"               ELSE
"
"              v_std_ded_pct   := NVL(cr2.hthl_std_ded_pct, 0);
"
"              v_fl_y_so_limit := NVL(cr2.hthl_fl_y_so_limit, 0);
"
"              v_fl_n_so_limit := NVL(cr2.hthl_fl_n_so_limit, 0);
"
"              v_fl_y_lo_limit := NVL(cr2.hthl_fl_y_lo_limit, 0);
"
"              v_fl_n_lo_limit := NVL(cr2.hthl_fl_n_lo_limit, 0);
"
"              v_house_cost_limit := NVL(cr2.hthl_house_cost_limit, 0);
"
"              v_house_cost_exceed_limit := NVL(cr2.hthl_house_cost_exceed_limit, 0);
"
"              v_loan_sant_limit  := NVL(cr2.hthl_loan_sant_limit, 0);
"
"              v_loan_sant_exceed_limit  := NVL(cr2.hthl_loan_sant_exceed_limit, 0);
"
"              v_int_paid_limit   := NVL(cr2.hthl_int_paid_limit, 0);
"
"              v_int_paid_exceed_limit   := NVL(cr2.hthl_int_paid_exceed_limit, 0);
"
"              v_int_ded_limit    := NVL(cr2.hthl_int_ded_limit, 0);
"
"              v_int_ded_exceed_limit    := NVL(cr2.hthl_int_ded_exceed_limit, 0);
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"                v_rent_type        := 'Y';
"
"                v_self_ocup        := 'Y';
"
"                v_first_loan    := NVL(cr1.htdld_hp_first_hl, 'S');
"
"                v_3yr_acom        := NVL(cr1.htdld_hp_const_comp_3yrs, 'S');
"
"                v_rent_rcvd        := 0;
"
"                v_house_tax        := 0;
"
"                v_rr_ht_tot        := NVL((v_rent_rcvd - v_house_tax), 0);
"
"                v_std_ded        := NVL(ROUND((v_rent_rcvd * v_std_ded_pct)/100), 0);
"
"                v_int_rent_paid := 0;
"
"                v_tot_ded       := NVL(v_std_ded + v_int_rent_paid, 0);
"
"
"
"                IF cr1.htdh_tax_type = 'E' THEN
"
"                   v_int_dclr := NVL((cr1.htdld_hpso_hl_ip1 + cr1.htdld_hpso_hl_ip2), 0);
"
"                ELSE
"
"                   v_int_dclr := 0;
"
"                END IF;
"
"
"
"                v_house_cost    := NVL(cr1.htdld_hp_house_cost, 0);
"
"                v_loan_sant_amt := NVL(cr1.htdld_hp_hl_sant_amt, 0);
"
"                v_pp_dclr       := NVL((cr1.htdld_hpso_hl_pp1 + cr1.htdld_hpso_hl_pp2), 0);
"
"
"
"                IF (v_rr_ht_tot - v_tot_ded) > 0 THEN
"
"                   v_income_rhp := v_rr_ht_tot - v_tot_ded;
"
"                ELSE
"
"               v_income_rhp := 0;
"
"            END IF;
"
"
"
"            IF v_self_ocup = 'Y' THEN
"
"
"
"               IF v_3yr_acom = 'Y' THEN
"
"
"
"                  IF v_int_dclr <= v_fl_y_so_limit THEN
"
"                     v_income_shp := v_int_dclr;
"
"                  ELSE
"
"                     v_income_shp := v_fl_y_so_limit;
"
"                  END IF;
"
"
"
"               ELSE
"
"
"
"                  IF v_int_dclr <= v_fl_n_so_limit THEN
"
"                     v_income_shp := v_int_dclr;
"
"                  ELSE
"
"                     v_income_shp := v_fl_n_so_limit;
"
"                  END IF;
"
"
"
"               END IF;
"
"
"
"            ELSE
"
"               v_income_shp := 0;
"
"            END IF;
"
"
"
"            IF v_first_loan = 'Y' THEN
"
"
"
"               IF v_house_cost <= v_house_cost_limit THEN
"
"
"
"                  IF v_loan_sant_amt <= v_loan_sant_limit THEN
"
"
"
"                     IF v_int_dclr > v_fl_y_so_limit THEN
"
"
"
"                        IF v_int_dclr <= v_int_paid_limit THEN
"
"                           v_temp1 := v_int_dclr - v_fl_y_so_limit;
"
"                ELSE
"
"                   v_temp1 := v_int_paid_exceed_limit;
"
"                        END IF;
"
"
"
"                     ELSE
"
"                        v_temp1 := 0;
"
"                     END IF;
"
"
"
"                  ELSE
"
"                     v_temp1 := 0;
"
"                  END IF;
"
"
"
"               ELSE
"
"                  v_temp1 := 0;
"
"               END IF;
"
"
"
"            ELSE
"
"               v_temp1 := 0;
"
"            END IF;
"
"
"
"            IF v_temp1 < 0 THEN
"
"               v_temp1 := 0;
"
"            ELSE
"
"               v_temp1 := v_temp1;
"
"            END IF;
"
"
"
"            IF (v_first_loan = 'Y' AND v_house_cost <= v_house_cost_limit AND v_loan_sant_amt <= v_loan_sant_limit) THEN
"
"               v_add_int_paid := v_temp1;
"
"            ELSE
"
"               v_add_int_paid := 0;
"
"            END IF;
"
"
"
"            IF (v_income_rhp + v_income_shp + v_add_int_paid) < 0 THEN
"
"               v_tot_income_hp := 0;
"
"            ELSE
"
"               v_tot_income_hp := (v_income_rhp + v_income_shp + v_add_int_paid);
"
"            END IF;
"
"
"
"                  UPDATE hrm_tds_house_property
"
"                     SET hthp_rent_type     = v_rent_type,
"
"               hthp_rent_rcvd     = 0,
"
"               hthp_house_tax     = 0,
"
"               hthp_rr_ht_tot     = 0,
"
"               hthp_std_ded       = v_std_ded,
"
"               hthp_std_int       = v_int_rent_paid,
"
"               hthp_tot_std_ded     = v_tot_ded,
"
"               hthp_rent_hp_income     = v_income_rhp,
"
"               hthp_self_occup     = v_self_ocup,
"
"               hthp_first_loan     = v_first_loan,
"
"               hthp_acqu_const_comp = v_3yr_acom,
"
"               hthp_int_paid     = v_int_dclr,
"
"               hthp_cost_of_house     = v_house_cost,
"
"               hthp_loan_sant_amt     = v_loan_sant_amt,
"
"               hthp_self_hp_income     = v_income_shp,
"
"               hthp_principal_paid     = v_pp_dclr,
"
"               hthp_add_int     = v_add_int_paid,
"
"               hthp_int_calc     = v_temp1,
"
"               hthp_tot_hp_income     = v_tot_income_hp,
"
"               hthp_upd_by        = p_user,
"
"               hthp_upd_date    = SYSDATE
"
"             WHERE hthp_bu = p_bu
"
"               AND hthp_doc_no  = p_doc_no
"
"               AND hthp_hp_type = 'S'
"
"               AND hthp_seq_no  = 1;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_hp_incm  = htch_hp_incm + v_tot_income_hp,
"
"               htch_upd_date = SYSDATE,
"
"               htch_upd_by   = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_hpso;
"
"
"
"   PROCEDURE proc_calc_emp_tds_hplo(p_bu                VARCHAR2,
"
"                        p_doc_no                VARCHAR2,
"
"                        p_user                VARCHAR2,
"
"                        p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_hp_limit
"
"    WHERE hthl_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_std_ded_pct            HRM_TDS_HP_LIMIT.HTHL_STD_DED_PCT%TYPE;
"
"      v_fl_y_so_limit            HRM_TDS_HP_LIMIT.HTHL_FL_Y_SO_LIMIT%TYPE;
"
"      v_fl_n_so_limit            HRM_TDS_HP_LIMIT.HTHL_FL_N_SO_LIMIT%TYPE;
"
"      v_fl_y_lo_limit            HRM_TDS_HP_LIMIT.HTHL_FL_Y_LO_LIMIT%TYPE;
"
"      v_fl_n_lo_limit            HRM_TDS_HP_LIMIT.HTHL_FL_N_LO_LIMIT%TYPE;
"
"      v_house_cost_limit        HRM_TDS_HP_LIMIT.HTHL_HOUSE_COST_LIMIT%TYPE;
"
"      v_house_cost_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_HOUSE_COST_EXCEED_LIMIT%TYPE;
"
"      v_loan_sant_limit            HRM_TDS_HP_LIMIT.HTHL_LOAN_SANT_LIMIT%TYPE;
"
"      v_loan_sant_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_LOAN_SANT_EXCEED_LIMIT%TYPE;
"
"      v_int_paid_limit            HRM_TDS_HP_LIMIT.HTHL_INT_PAID_LIMIT%TYPE;
"
"      v_int_paid_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_INT_PAID_EXCEED_LIMIT%TYPE;
"
"      v_int_ded_limit            HRM_TDS_HP_LIMIT.HTHL_INT_DED_LIMIT%TYPE;
"
"      v_int_ded_exceed_limit        HRM_TDS_HP_LIMIT.HTHL_INT_DED_EXCEED_LIMIT%TYPE;
"
"
"
"      v_rent_type            VARCHAR2(1) := 'N';
"
"      v_self_ocup            VARCHAR2(1) := 'N';
"
"      v_first_loan            VARCHAR2(1) := 'S';
"
"      v_3yr_acom            VARCHAR2(1) := 'S';
"
"      v_rent_rcvd            NUMBER(15, 3) := 0;
"
"      v_house_tax            NUMBER(15, 3) := 0;
"
"      v_rr_ht_tot            NUMBER(15, 3) := 0;
"
"      v_std_ded                NUMBER(15, 3) := 0;
"
"      v_int_rent_paid            NUMBER(15, 3) := 0;
"
"      v_int_dclr            NUMBER(15, 3) := 0;
"
"      v_tot_ded                NUMBER(15, 3) := 0;
"
"      v_house_cost            NUMBER(15, 3) := 0;
"
"      v_loan_sant_amt            NUMBER(15, 3) := 0;
"
"      v_income_shp            NUMBER(15, 3) := 0;
"
"      v_income_rhp            NUMBER(15, 3) := 0;
"
"      v_pp_dclr                NUMBER(15, 3) := 0;
"
"      v_add_int_paid            NUMBER(15, 3) := 0;
"
"      v_tot_income_hp            NUMBER(15, 3) := 0;
"
"      v_temp1                NUMBER(15, 3) := 0;
"
"      v_temp2                NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            DELETE
"
"              FROM hrm_tds_house_property
"
"             WHERE hthp_bu = p_bu
"
"               AND hthp_doc_no = p_doc_no
"
"               AND hthp_hp_type = 'L';
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"              v_std_ded_pct := 0;
"
"              v_fl_y_so_limit := 0;
"
"              v_fl_n_so_limit := 0;
"
"              v_fl_y_lo_limit := 0;
"
"              v_fl_n_lo_limit := 0;
"
"              v_house_cost_limit := 0;
"
"              v_house_cost_exceed_limit := 0;
"
"              v_loan_sant_limit := 0;
"
"              v_loan_sant_exceed_limit := 0;
"
"              v_int_paid_limit := 0;
"
"              v_int_paid_exceed_limit := 0;
"
"              v_int_ded_limit := 0;
"
"              v_int_ded_exceed_limit := 0;
"
"               ELSE
"
"              v_std_ded_pct   := NVL(cr2.hthl_std_ded_pct, 0);
"
"              v_fl_y_so_limit := NVL(cr2.hthl_fl_y_so_limit, 0);
"
"              v_fl_n_so_limit := NVL(cr2.hthl_fl_n_so_limit, 0);
"
"              v_fl_y_lo_limit := NVL(cr2.hthl_fl_y_lo_limit, 0);
"
"              v_fl_n_lo_limit := NVL(cr2.hthl_fl_n_lo_limit, 0);
"
"              v_house_cost_limit := NVL(cr2.hthl_house_cost_limit, 0);
"
"              v_house_cost_exceed_limit := NVL(cr2.hthl_house_cost_exceed_limit, 0);
"
"              v_loan_sant_limit  := NVL(cr2.hthl_loan_sant_limit, 0);
"
"              v_loan_sant_exceed_limit  := NVL(cr2.hthl_loan_sant_exceed_limit, 0);
"
"              v_int_paid_limit   := NVL(cr2.hthl_int_paid_limit, 0);
"
"              v_int_paid_exceed_limit   := NVL(cr2.hthl_int_paid_exceed_limit, 0);
"
"              v_int_ded_limit    := NVL(cr2.hthl_int_ded_limit, 0);
"
"              v_int_ded_exceed_limit    := NVL(cr2.hthl_int_ded_exceed_limit, 0);
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            FOR i IN 1..2
"
"            LOOP
"
"
"
"               v_result := 'Y';
"
"
"
"               INSERT INTO hrm_tds_house_property(hthp_bu       ,
"
"                                  hthp_doc_no      ,
"
"                                  hthp_hp_type    ,
"
"                                  hthp_seq_no    ,
"
"                                  hthp_cre_by      ,
"
"                                  hthp_cre_date    )
"
"                               VALUES(p_bu        ,    --hthp_bu
"
"                                   p_doc_no    ,    --hthp_doc_no
"
"                                   'L'        ,    --hthp_hp_type
"
"                                   i        ,    --hthp_seq_no
"
"                                  p_user    ,    --hthp_cre_by
"
"                                  SYSDATE    );    --hthp_cre_date
"
"
"
"                   v_rent_type     := 'Y';
"
"                   v_self_ocup     := 'Y';
"
"                   v_first_loan    := NVL(cr1.htdld_hp_first_hl, 'S');
"
"                   v_3yr_acom      := NVL(cr1.htdld_hp_const_comp_3yrs, 'S');
"
"                   v_rent_rcvd     := NVL((CASE WHEN i = 1 THEN cr1.htdld_hplo_hl_rr1 WHEN i = 2 THEN cr1.htdld_hplo_hl_rr2 ELSE 0 END), 0);
"
"                   v_house_tax     := NVL((CASE WHEN i = 1 THEN cr1.htdld_hplo_hl_tp1 WHEN i = 2 THEN cr1.htdld_hplo_hl_tp2 ELSE 0 END), 0);
"
"                   v_rr_ht_tot     := NVL((v_rent_rcvd - v_house_tax), 0);
"
"                   v_std_ded       := NVL(ROUND((v_rent_rcvd * v_std_ded_pct)/100), 0);
"
"
"
"                   IF cr1.htdh_tax_type = 'E' THEN
"
"                      v_int_rent_paid := NVL((CASE WHEN i = 1 THEN cr1.htdld_hplo_hl_ip1 WHEN i = 2 THEN cr1.htdld_hplo_hl_ip2 ELSE 0 END), 0);
"
"                   ELSE
"
"                      v_int_rent_paid := 0;
"
"                   END IF;
"
"
"
"                   v_tot_ded       := NVL(v_std_ded + v_int_rent_paid, 0);
"
"                   v_int_dclr      := 0;
"
"                   v_house_cost    := NVL(cr1.htdld_hp_house_cost, 0);
"
"                   v_loan_sant_amt := NVL(cr1.htdld_hp_hl_sant_amt, 0);
"
"                   v_pp_dclr       := NVL((CASE WHEN i = 1 THEN cr1.htdld_hplo_hl_pp1 WHEN i = 2 THEN cr1.htdld_hplo_hl_pp2 ELSE 0 END), 0);
"
"
"
"                   IF (v_tot_ded - v_rr_ht_tot) > 0 THEN    --old value (v_rr_ht_tot - v_tot_ded) new value (v_tot_ded - v_rr_ht_tot) --KU--
"
"                      v_income_rhp := v_tot_ded - v_rr_ht_tot;
"
"                   ELSE
"
"                  v_income_rhp := 0;
"
"               END IF;
"
"
"
"               IF v_self_ocup = 'Y' THEN
"
"
"
"                  IF v_3yr_acom = 'Y' THEN
"
"
"
"                     IF v_int_dclr <= v_fl_y_lo_limit THEN
"
"                        v_income_shp := v_int_dclr;
"
"                     ELSE
"
"                        v_income_shp := v_fl_y_lo_limit;
"
"                     END IF;
"
"
"
"                  ELSE
"
"
"
"                     IF v_int_dclr <= v_fl_n_lo_limit THEN
"
"                        v_income_shp := v_int_dclr;
"
"                     ELSE
"
"                        v_income_shp := v_fl_n_lo_limit;
"
"                     END IF;
"
"
"
"                  END IF;
"
"
"
"               ELSE
"
"                  v_income_shp := 0;
"
"               END IF;
"
"
"
"               IF v_first_loan = 'Y' THEN
"
"
"
"                  IF v_house_cost <= v_house_cost_limit THEN
"
"
"
"                     IF v_loan_sant_amt <= v_loan_sant_limit THEN
"
"
"
"                        IF v_int_dclr > v_fl_y_lo_limit THEN
"
"
"
"                           IF v_int_dclr <= v_int_paid_limit THEN
"
"                              v_temp1 := v_int_dclr - v_int_paid_limit;
"
"                   ELSE
"
"                      v_temp1 := v_int_paid_exceed_limit;
"
"                           END IF;
"
"
"
"                        ELSE
"
"                           v_temp1 := 0;
"
"                        END IF;
"
"
"
"                     ELSE
"
"                        v_temp1 := 0;
"
"                     END IF;
"
"
"
"                  ELSE
"
"                     v_temp1 := 0;
"
"                  END IF;
"
"
"
"               ELSE
"
"                  v_temp1 := 0;
"
"               END IF;
"
"
"
"               IF v_temp1 < 0 THEN
"
"                  v_temp1 := 0;
"
"               ELSE
"
"                  v_temp1 := v_temp1;
"
"               END IF;
"
"
"
"               IF (v_income_rhp + v_income_shp) < 0 THEN
"
"                  v_tot_income_hp := 0;
"
"               ELSE
"
"                  v_tot_income_hp := (v_income_rhp + v_income_shp);
"
"               END IF;
"
"
"
"                     UPDATE hrm_tds_house_property
"
"                        SET hthp_rent_type        = v_rent_type,
"
"                  hthp_rent_rcvd        = v_rent_rcvd,    --old value 0 new value v_rent_rcvd --KU--
"
"                  hthp_house_tax        = v_house_tax,    --old value 0 new value v_house_tax --KU--
"
"                  hthp_rr_ht_tot        = 0,
"
"                  hthp_std_ded          = v_std_ded,
"
"                  hthp_std_int          = v_int_rent_paid,
"
"                  hthp_tot_std_ded        = v_tot_ded,
"
"                  hthp_rent_hp_income  = v_income_rhp,
"
"                  hthp_self_occup        = v_self_ocup,
"
"                  hthp_first_loan        = v_first_loan,
"
"                  hthp_acqu_const_comp = v_3yr_acom,
"
"                  hthp_int_paid        = v_int_dclr,
"
"                  hthp_cost_of_house   = v_house_cost,
"
"                  hthp_loan_sant_amt   = v_loan_sant_amt,
"
"                  hthp_self_hp_income  = v_income_shp,
"
"                  hthp_principal_paid  = v_pp_dclr,
"
"                  hthp_add_int        = v_add_int_paid,
"
"                  hthp_int_calc        = v_temp1,
"
"                  hthp_tot_hp_income   = v_tot_income_hp,
"
"                  hthp_upd_by       = p_user,
"
"                  hthp_upd_date       = SYSDATE
"
"                WHERE hthp_bu      = p_bu
"
"                  AND hthp_doc_no  = p_doc_no
"
"                  AND hthp_hp_type = 'L'
"
"                  AND hthp_seq_no  = i;
"
"
"
"               UPDATE hrm_tds_calc_hd
"
"                  SET htch_hp_incm  = htch_hp_incm + v_tot_income_hp,
"
"                  htch_upd_date = SYSDATE,
"
"                  htch_upd_by   = p_user
"
"                WHERE htch_bu     = p_bu
"
"                  AND htch_doc_no = p_doc_no;
"
"
"
"            END LOOP i;
"
"
"
"                    UPDATE hrm_tds_calc_hd
"
"               SET htch_hp_incm  = CASE WHEN htch_hp_incm >= v_fl_y_so_limit THEN v_fl_y_so_limit ELSE htch_hp_incm END,
"
"                   htch_upd_date = SYSDATE,
"
"                   htch_upd_by   = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_hplo;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80c(p_bu                    VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_sec_80c_elmnt
"
"    WHERE htcp_bu       = htsce_bu
"
"      AND htcp_elmnt_id = htsce_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_sec_80c_limit
"
"    WHERE htscl_bu = p_bu;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_elmnt_id        VARCHAR2)
"
"       IS
"
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_sec_80c_elmnt
"
"    WHERE htcp_bu       = htsce_bu
"
"      AND htcp_elmnt_id = htsce_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no
"
"      AND htcp_elmnt_id = c_elmnt_id;
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"      v_insur_amt            NUMBER(15, 3) := 0;
"
"      v_gpf_amt               NUMBER(15, 3) := 0;
"
"      v_ppf_amt               NUMBER(15, 3) := 0;
"
"      v_ulip_amt              NUMBER(15, 3) := 0;
"
"      v_mf_amt                NUMBER(15, 3) := 0;
"
"      v_nsc_amt                NUMBER(15, 3) := 0;
"
"      v_nss_amt             NUMBER(15, 3) := 0;
"
"      v_ctf1_amt            NUMBER(15, 3) := 0;
"
"      v_ctf2_amt            NUMBER(15, 3) := 0;
"
"      v_tsfd_amt            NUMBER(15, 3) := 0;
"
"      v_sss_amt             NUMBER(15, 3) := 0;
"
"      v_aoei1_amt            NUMBER(15, 3) := 0;
"
"      v_aoei2_amt            NUMBER(15, 3) := 0;
"
"      v_pension_fund            NUMBER(15, 3) := 0;
"
"      v_pf_amt                NUMBER(15, 3) := 0;
"
"      v_pf_pf_amt        NUMBER(15,3) := 0;
"
"      v_pf_lic_amt        NUMBER(15,3) := 0;
"
"      v_hp_amt                NUMBER(15, 3) := 0;
"
"      v_80c_sec_limit            NUMBER(15, 3) := 0;
"
"      v_80c_tot                NUMBER(15, 3) := 0;
"
"      v_80c_act                NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80c_dec
"
"             WHERE htcd_bu = p_bu
"
"               AND htcd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80c_dec(htcd_bu           ,
"
"                        htcd_doc_no      ,
"
"                        htcd_cre_by      ,
"
"                        htcd_cre_date    )
"
"                     VALUES(p_bu        ,    --htcd_bu
"
"                         p_doc_no    ,    --htcd_doc_no
"
"                        p_user        ,    --htcd_cre_by
"
"                        SYSDATE        );    --htcd_cre_date
"
"
"
"            v_insur_amt := NVL(cr1.htdld_sec_80c_ipp,   0);
"
"            v_gpf_amt   := NVL(cr1.htdld_sec_80c_gpf,   0);
"
"            v_ppf_amt   := NVL(cr1.htdld_sec_80c_ppf,   0);
"
"            v_ulip_amt  := NVL(cr1.htdld_sec_80c_ulip,  0);
"
"            v_mf_amt    := NVL(cr1.htdld_sec_80c_mf,    0);
"
"            v_nsc_amt    := NVL(cr1.htdld_sec_80c_nsc,   0);
"
"            v_nss_amt     := NVL(cr1.htdld_sec_80c_nss,   0);
"
"
"
"            IF cr1.htdh_tax_type = 'E' THEN
"
"               v_ctf1_amt := NVL(cr1.htdld_sec_80c_ctf1,  0);
"
"               v_ctf2_amt := NVL(cr1.htdld_sec_80c_ctf2,  0);
"
"            ELSE
"
"               v_ctf1_amt := 0;
"
"               v_ctf2_amt := 0;
"
"            END IF;
"
"
"
"            v_tsfd_amt    := NVL(cr1.htdld_sec_80c_tsfd,  0);
"
"            v_sss_amt     := NVL(cr1.htdld_sec_80c_sss,   0);
"
"            v_aoei1_amt    := NVL(cr1.htdld_sec_80c_aoei1, 0);
"
"            v_aoei2_amt    := NVL(cr1.htdld_sec_80c_aoei2, 0);
"
"            v_hp_amt    := NVL(cr1.htdld_hpso_hl_pp1, 0) + NVL(cr1.htdld_hpso_hl_pp2, 0) + NVL(cr1.htdld_hplo_hl_pp1, 0) + NVL(cr1.htdld_hplo_hl_pp2, 0);
"
"            v_pension_fund := NVL(cr1.htdld_sec_80ccc_ctcpf, 0);
"
"
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_pf_amt := 0;
"
"               ELSE
"
"                  v_pf_amt := cr2.htcp_elmnt_amt;
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            OPEN c4('PFE');
"
"            FETCH c4 INTO cr4;
"
"              IF c4%NOTFOUND THEN
"
"                 v_pf_pf_amt := 0;
"
"              ELSE
"
"                 v_pf_pf_amt := cr4.htcp_elmnt_amt;
"
"              END IF;
"
"            CLOSE c4;
"
"
"
"            OPEN c4('LIC');
"
"            FETCH c4 INTO cr4;
"
"              IF c4%NOTFOUND THEN
"
"                 v_pf_lic_amt := 0;
"
"              ELSE
"
"                 v_pf_lic_amt := cr4.htcp_elmnt_amt;
"
"              END IF;
"
"            CLOSE c4;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  v_80c_sec_limit := 0;
"
"               ELSE
"
"                  v_80c_sec_limit := NVL(cr3.htscl_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"                  v_80c_tot := v_insur_amt + v_ulip_amt + v_pf_amt + v_mf_amt + v_ctf1_amt + v_tsfd_amt + v_nsc_amt + v_gpf_amt +
"
"                           v_ppf_amt + v_hp_amt + v_sss_amt + v_ctf2_amt + v_nss_amt + v_pension_fund + v_aoei1_amt + v_aoei2_amt + v_pension_fund;
"
"
"
"                  IF v_80c_tot <= v_80c_sec_limit THEN
"
"                     v_80c_act := v_80c_tot;
"
"                  ELSE
"
"                     v_80c_act := v_80c_sec_limit;
"
"                  END IF;
"
"
"
"                  UPDATE hrm_tds_80c_dec
"
"                     SET htcd_insur             = v_insur_amt,
"
"                 htcd_ulip              = v_ulip_amt,
"
"                 htcd_pf               = v_pf_amt,
"
"                 htcd_pf_pf        = v_pf_pf_amt,
"
"                 htcd_pf_lic        = v_pf_lic_amt,
"
"                 htcd_mut_fund          = v_mf_amt,
"
"                 htcd_child_edu1        = v_ctf1_amt,
"
"                 htcd_fdr               = v_tsfd_amt,
"
"                 htcd_nsc               = v_nsc_amt,
"
"                 htcd_gpf               = v_gpf_amt,
"
"                 htcd_ppf               = v_ppf_amt,
"
"                 htcd_house_rpymnt      = v_hp_amt,
"
"                 htcd_nps               = v_sss_amt,
"
"                 htcd_child_edu2        = v_ctf2_amt,
"
"                 htcd_nss              = v_nss_amt,
"
"                 htcd_pension_fund      = v_pension_fund,
"
"                 htcd_oth_elgble_80c_1 = v_aoei1_amt,
"
"                 htcd_oth_elgble_80c_2 = v_aoei2_amt,
"
"                 htcd_oth_elgble_80c_3 = v_pension_fund,
"
"                 htcd_tot_80c         = v_80c_tot,
"
"                 htcd_act_80c         = v_80c_act,
"
"                 htcd_upd_by         = p_user,
"
"                 htcd_upd_date     = SYSDATE
"
"                   WHERE htcd_bu = p_bu
"
"                     AND htcd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = v_80c_act,
"
"               htch_upd_by    = p_user,
"
"               htch_upd_date  = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80c;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ccg(p_bu                VARCHAR2,
"
"                         p_doc_no                VARCHAR2,
"
"                         p_user                VARCHAR2,
"
"                         p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl
"
"    WHERE htcp_bu           = p_bu
"
"      AND htcp_doc_no       = p_doc_no
"
"      AND htcp_add_ded_type = '+';
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_sec_80ccg_limit
"
"    WHERE htscgl_bu = p_bu;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"
"
"      v_invest_limit            HRM_TDS_SEC_80CCG_LIMIT.HTSCGL_INVEST_LIMIT%TYPE;
"
"      v_invest_div_fact            HRM_TDS_SEC_80CCG_LIMIT.HTSCGL_INVEST_DIV_FACT%TYPE;
"
"      v_invest_exceed_limit        HRM_TDS_SEC_80CCG_LIMIT.HTSCGL_INVEST_EXCEED_LIMIT%TYPE;
"
"
"
"      v_yearly_sal            NUMBER(15, 3) := 0;
"
"      v_80ccg_sec_limit            NUMBER(15, 3) := 0;
"
"      v_rgess_amt            NUMBER(15, 3) := 0;
"
"      v_80ccg_ded_amt            NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccg_dec
"
"             WHERE htccgd_bu = p_bu
"
"               AND htccgd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80ccg_dec(htccgd_bu           ,
"
"                          htccgd_doc_no      ,
"
"                          htccgd_cre_by      ,
"
"                          htccgd_cre_date    )
"
"                       VALUES(p_bu            ,    --htccgd_bu
"
"                           p_doc_no        ,    --htccgd_doc_no
"
"                          p_user        ,    --htccgd_cre_by
"
"                          SYSDATE        );    --htccgd_cre_date
"
"
"
"            v_rgess_amt := NVL(cr1.htdld_sec_80ccg_rgess, 0);
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_yearly_sal := 0;
"
"               ELSE
"
"                  v_yearly_sal := cr2.htcp_elmnt_amt;
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  v_80ccg_sec_limit := 0;
"
"                  v_invest_limit    := 0;
"
"                  v_invest_div_fact := 1;
"
"                  v_invest_exceed_limit := 0;
"
"               ELSE
"
"                  v_80ccg_sec_limit := NVL(cr3.htscgl_limit, 0);
"
"                  v_invest_limit    := NVL(cr3.htscgl_invest_limit, 0);
"
"                  v_invest_div_fact := NVL(cr3.htscgl_invest_div_fact, 0);
"
"                  v_invest_exceed_limit := NVL(cr3.htscgl_invest_exceed_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"                  IF v_yearly_sal <= v_80ccg_sec_limit THEN
"
"
"
"                     IF v_rgess_amt <= v_invest_limit THEN
"
"                        v_80ccg_ded_amt := ROUND(v_rgess_amt/v_invest_div_fact);
"
"                     ELSE
"
"                        v_80ccg_ded_amt := v_invest_exceed_limit;
"
"                     END IF;
"
"
"
"                  ELSE
"
"                     v_80ccg_ded_amt := 0;
"
"                  END IF;
"
"
"
"                  UPDATE hrm_tds_80ccg_dec
"
"                     SET htccgd_yrly_sal  = v_yearly_sal,
"
"                         htccgd_rgess_amt = v_rgess_amt,
"
"                         htccgd_ded_amt   = v_80ccg_ded_amt,
"
"                         htccgd_upd_by    = p_user,
"
"                         htccgd_upd_date  = SYSDATE
"
"                   WHERE htccgd_bu = p_bu
"
"                     AND htccgd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + (CASE WHEN htch_net_sal_incm <= v_80ccg_sec_limit THEN v_80ccg_ded_amt ELSE 0 END),
"
"               htch_upd_date  = SYSDATE,
"
"               htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80ccg;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80d(p_bu                    VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec_80d_limit
"
"    WHERE htsdl_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_80d_sec_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_LIMIT%TYPE;
"
"
"
"      v_ipo_dec_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_IPO_DEC_LIMIT%TYPE;
"
"      v_ipo_dec_exceed_limit        HRM_TDS_SEC_80D_LIMIT.HTSDL_IPO_DEC_EXCEED_LIMIT%TYPE;
"
"      v_ipo_cal_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_IPO_CAL_LIMIT%TYPE;
"
"      v_ipo_ovrl_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_IPO_OVRL_LIMIT%TYPE;
"
"
"
"      v_ipp_dec_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_IPP_DEC_LIMIT%TYPE;
"
"      v_ipp_dec_exceed_limit        HRM_TDS_SEC_80D_LIMIT.HTSDL_IPP_DEC_EXCEED_LIMIT%TYPE;
"
"      v_ipp_cal_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_IPP_CAL_LIMIT%TYPE;
"
"      v_ipp_ovrl_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_IPP_OVRL_LIMIT%TYPE;
"
"
"
"      v_sco_dec_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_SCO_DEC_LIMIT%TYPE;
"
"      v_sco_dec_exceed_limit        HRM_TDS_SEC_80D_LIMIT.HTSDL_SCO_DEC_EXCEED_LIMIT%TYPE;
"
"      v_sco_cal_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_SCO_CAL_LIMIT%TYPE;
"
"      v_sco_ovrl_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_SCO_OVRL_LIMIT%TYPE;
"
"
"
"      v_scp_dec_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_SCP_DEC_LIMIT%TYPE;
"
"      v_scp_dec_exceed_limit        HRM_TDS_SEC_80D_LIMIT.HTSDL_SCP_DEC_EXCEED_LIMIT%TYPE;
"
"      v_scp_cal_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_SCP_CAL_LIMIT%TYPE;
"
"      v_scp_ovrl_limit            HRM_TDS_SEC_80D_LIMIT.HTSDL_SCP_OVRL_LIMIT%TYPE;
"
"
"
"      v_mip_fmly            NUMBER(15, 3) := 0;
"
"      v_mip_snor1            NUMBER(15, 3) := 0;
"
"      v_mip_par                NUMBER(15, 3) := 0;
"
"      v_mip_snor2            NUMBER(15, 3) := 0;
"
"      v_mip_tot_fmly            NUMBER(15, 3) := 0;
"
"      v_mip_tot_snor1            NUMBER(15, 3) := 0;
"
"      v_mip_tot_par            NUMBER(15, 3) := 0;
"
"      v_mip_tot_snor2            NUMBER(15, 3) := 0;
"
"      v_mip_act_fmly            NUMBER(15, 3) := 0;
"
"      v_mip_act_snor            NUMBER(15, 3) := 0;
"
"
"
"      v_80d_total            NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80d_dec
"
"             WHERE htdd_bu = p_bu
"
"               AND htdd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80d_dec(htdd_bu           ,
"
"                        htdd_doc_no      ,
"
"                        htdd_cre_by      ,
"
"                        htdd_cre_date    )
"
"                     VALUES(p_bu        ,    --htdd_bu
"
"                            p_doc_no    ,    --htdd_doc_no
"
"                            p_user        ,    --htdd_cre_by
"
"                            SYSDATE        );    --htdd_cre_date
"
"
"
"            v_mip_fmly  := NVL(cr1.htdld_sec_80d_mip_fmly, 0);
"
"            v_mip_par   := NVL(cr1.htdld_sec_80d_mip_par, 0);
"
"
"
"            v_mip_snor1 := NVL(cr1.htdld_sec_80d_mip_snor1, 0);
"
"            v_mip_snor2 := NVL(cr1.htdld_sec_80d_mip_snor2, 0);
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"
"
"                  v_80d_sec_limit := 0;
"
"
"
"                  v_ipo_dec_limit  := 0;
"
"              v_ipo_cal_limit  := 0;
"
"              v_ipo_ovrl_limit := 0;
"
"              v_ipo_dec_exceed_limit := 0;
"
"
"
"              v_ipp_dec_limit  := 0;
"
"              v_ipp_cal_limit  := 0;
"
"              v_ipp_ovrl_limit := 0;
"
"              v_ipp_dec_exceed_limit := 0;
"
"
"
"              v_sco_dec_limit  := 0;
"
"              v_sco_cal_limit  := 0;
"
"              v_sco_ovrl_limit := 0;
"
"              v_sco_dec_exceed_limit := 0;
"
"
"
"              v_scp_dec_limit  := 0;
"
"              v_scp_cal_limit  := 0;
"
"              v_scp_ovrl_limit := 0;
"
"              v_scp_dec_exceed_limit := 0;
"
"
"
"               ELSE
"
"                  v_80d_sec_limit := NVL(cr2.htsdl_limit, 0);
"
"
"
"                  v_ipo_dec_limit  := NVL(cr2.htsdl_ipo_dec_limit, 0);
"
"              v_ipo_cal_limit  := NVL(cr2.htsdl_ipo_cal_limit, 0);
"
"              v_ipo_ovrl_limit := NVL(cr2.htsdl_ipo_ovrl_limit, 0);
"
"              v_ipo_dec_exceed_limit := NVL(cr2.htsdl_ipo_dec_exceed_limit, 0);
"
"
"
"              v_ipp_dec_limit  := NVL(cr2.htsdl_ipp_dec_limit, 0);
"
"              v_ipp_cal_limit  := NVL(cr2.htsdl_ipp_cal_limit, 0);
"
"              v_ipp_ovrl_limit := NVL(cr2.htsdl_ipp_ovrl_limit, 0);
"
"              v_ipp_dec_exceed_limit := NVL(cr2.htsdl_ipp_dec_exceed_limit, 0);
"
"
"
"              v_sco_dec_limit  := NVL(cr2.htsdl_sco_dec_limit, 0);
"
"              v_sco_cal_limit  := NVL(cr2.htsdl_sco_cal_limit, 0);
"
"              v_sco_ovrl_limit := NVL(cr2.htsdl_sco_ovrl_limit, 0);
"
"              v_sco_dec_exceed_limit := NVL(cr2.htsdl_sco_dec_exceed_limit, 0);
"
"
"
"              v_scp_dec_limit  := NVL(cr2.htsdl_scp_dec_limit, 0);
"
"              v_scp_cal_limit  := NVL(cr2.htsdl_scp_cal_limit, 0);
"
"              v_scp_ovrl_limit := NVL(cr2.htsdl_scp_ovrl_limit, 0);
"
"              v_scp_dec_exceed_limit := NVL(cr2.htsdl_scp_dec_exceed_limit, 0);
"
"
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            /* Declaration Limit Calculation */
"
"
"
"            IF v_mip_fmly <= v_ipo_dec_limit THEN
"
"               v_mip_fmly := v_mip_fmly;
"
"            ELSE
"
"               v_mip_fmly := v_ipo_dec_exceed_limit;
"
"            END IF;
"
"
"
"            IF v_mip_par <= v_ipp_dec_limit THEN
"
"               v_mip_par := v_mip_par;
"
"            ELSE
"
"               v_mip_par := v_ipp_dec_exceed_limit;
"
"            END IF;
"
"
"
"            IF v_mip_snor1 <= v_sco_dec_limit THEN
"
"               v_mip_snor1 := v_mip_snor1;
"
"            ELSE
"
"               v_mip_snor1 := v_sco_dec_exceed_limit;
"
"            END IF;
"
"
"
"            IF v_mip_snor2 <= v_scp_dec_limit THEN
"
"               v_mip_snor2 := v_mip_snor2;
"
"            ELSE
"
"               v_mip_snor2 := v_scp_dec_exceed_limit;
"
"            END IF;
"
"
"
"            /* End of Declaration Limit Calculation */
"
"
"
"            /* After Declaration Limit Calculation */
"
"
"
"            IF v_mip_fmly <= v_ipo_cal_limit THEN
"
"               v_mip_tot_fmly := v_mip_fmly;
"
"            ELSE
"
"               v_mip_tot_fmly := v_ipo_cal_limit;
"
"            END IF;
"
"
"
"            IF v_mip_par <= v_ipp_cal_limit THEN
"
"               v_mip_tot_par := v_mip_par;
"
"            ELSE
"
"               v_mip_tot_par := v_ipp_cal_limit;
"
"            END IF;
"
"
"
"            IF v_mip_snor1 <= v_sco_cal_limit THEN
"
"               v_mip_tot_snor1 := v_mip_snor1;
"
"            ELSE
"
"               v_mip_tot_snor1 := v_sco_cal_limit;
"
"            END IF;
"
"
"
"            IF v_mip_snor2 <= v_scp_cal_limit THEN
"
"               v_mip_tot_snor2 := v_mip_snor2;
"
"            ELSE
"
"               v_mip_tot_snor2 := v_scp_cal_limit;
"
"            END IF;
"
"
"
"            /* End of After Declaration Limit Calculation */
"
"
"
"            IF (v_mip_tot_fmly + v_mip_tot_par) <= v_ipo_ovrl_limit THEN
"
"               v_mip_act_fmly := NVL((v_mip_tot_fmly + v_mip_tot_par), 0);
"
"            ELSE
"
"               v_mip_act_fmly := v_ipo_ovrl_limit;
"
"            END IF;
"
"
"
"            IF (v_mip_tot_snor1 + v_mip_tot_snor2) <= v_sco_ovrl_limit THEN
"
"               v_mip_act_snor := NVL((v_mip_tot_snor1 + v_mip_tot_snor2), 0);
"
"            ELSE
"
"               v_mip_act_snor := v_sco_ovrl_limit;
"
"            END IF;
"
"
"
"            IF (v_mip_act_fmly + v_mip_act_snor) <= v_80d_sec_limit THEN
"
"               v_80d_total := NVL((v_mip_act_fmly + v_mip_act_snor) , 0);
"
"            ELSE
"
"               v_80d_total := v_80d_sec_limit;
"
"            END IF;
"
"
"
"            UPDATE hrm_tds_80d_dec
"
"               SET htdd_fmly_ip     = v_mip_fmly,
"
"               htdd_sc1_ip         = v_mip_snor1,
"
"               htdd_fmly_tot_ip = v_mip_tot_fmly,
"
"               htdd_sc1_tot_ip  = v_mip_tot_snor1,
"
"               htdd_prnt_ip     = v_mip_par,
"
"               htdd_sc2_ip      = v_mip_snor2,
"
"               htdd_prnt_tot_ip = v_mip_tot_par,
"
"               htdd_sc2_tot_ip  = v_mip_tot_snor2,
"
"               htdd_fmly_act_ip = v_mip_act_fmly,
"
"               htdd_sc_act_ip   = v_mip_act_snor,
"
"               htdd_80d_tot     = v_80d_total,
"
"               htdd_upd_by      = p_user,
"
"               htdd_upd_date    = SYSDATE
"
"             WHERE htdd_bu = p_bu
"
"               AND htdd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + v_80d_total,
"
"               htch_upd_date  = SYSDATE,
"
"               htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80d;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80dd(p_bu                VARCHAR2,
"
"                        p_doc_no                VARCHAR2,
"
"                        p_user                VARCHAR2,
"
"                        p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec_80dd_limit
"
"    WHERE htsddl_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_normal_limit            HRM_TDS_SEC_80DD_LIMIT.HTSDDL_NORMAL_LIMIT%TYPE;
"
"      v_severe_limit            HRM_TDS_SEC_80DD_LIMIT.HTSDDL_SEVERE_LIMIT%TYPE;
"
"
"
"      v_act_expns            NUMBER(15, 3) := 0;
"
"      v_tot_expns            NUMBER(15, 3) := 0;
"
"      v_80dd_sec_limit            NUMBER(15, 3) := 0;
"
"      v_80dd_type            VARCHAR2(1) := 'S';
"
"      v_result                 VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80dd_dec
"
"             WHERE htddd_bu = p_bu
"
"               AND htddd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80dd_dec(htddd_bu       ,
"
"                         htddd_doc_no      ,
"
"                         htddd_cre_by      ,
"
"                         htddd_cre_date    )
"
"                      VALUES(p_bu        ,    --htdd_bu
"
"                             p_doc_no    ,    --htdd_doc_no
"
"                             p_user        ,    --htdd_cre_by
"
"                             SYSDATE    );    --htdd_cre_date
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_80dd_sec_limit := 0;
"
"                  v_normal_limit   := 0;
"
"                  v_severe_limit   := 0;
"
"               ELSE
"
"                  v_80dd_sec_limit := NVL(cr2.htsddl_limit, 0);
"
"                  v_normal_limit   := NVL(cr2.htsddl_normal_limit, 0);
"
"                  v_severe_limit   := NVL(cr2.htsddl_severe_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            v_tot_expns := NVL(cr1.htdld_sec_80dd_med_hd, 0);
"
"            v_80dd_type := NVL(cr1.htdld_sec_80dd_med_hd_type, 'S');
"
"
"
"            IF v_80dd_type IN ('N') THEN
"
"
"
"               IF v_tot_expns <= v_normal_limit THEN
"
"                  v_act_expns := v_tot_expns;
"
"               ELSE
"
"                  v_act_expns := v_normal_limit;
"
"               END IF;
"
"
"
"            ELSIF v_80dd_type IN ('V') THEN
"
"
"
"               IF v_tot_expns <= v_severe_limit THEN
"
"                  v_act_expns := v_tot_expns;
"
"               ELSE
"
"                  v_act_expns := v_severe_limit;
"
"               END IF;
"
"
"
"            ELSE
"
"               v_act_expns := 0;
"
"            END IF;
"
"
"
"            UPDATE hrm_tds_80dd_dec
"
"               SET htddd_type      = v_80dd_type,
"
"               htddd_tot_expns = v_tot_expns,
"
"               htddd_act_expns = v_act_expns,
"
"               htddd_upd_by    = p_user,
"
"               htddd_upd_date  = SYSDATE
"
"              WHERE htddd_bu = p_bu
"
"               AND htddd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + v_act_expns,
"
"               htch_upd_date  = SYSDATE,
"
"               htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80dd;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ddb(p_bu                VARCHAR2,
"
"                         p_doc_no                VARCHAR2,
"
"                         p_user                VARCHAR2,
"
"                         p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec_80ddb_limit
"
"    WHERE htsddbl_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT TO_NUMBER(TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_dob, 'DD-MON-RRRR'))/365)) emp_age,
"
"          emp_gender
"
"     FROM employees
"
"    WHERE emp_bu     = p_bu
"
"      AND emp_emp_id = c_emp_id;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"      v_act_expns            NUMBER(15, 3) := 0;
"
"      v_tot_expns            NUMBER(15, 3) := 0;
"
"      v_80ddb_sec_limit            NUMBER(15, 3) := 0;
"
"      v_80ddb_sc_sec_limit        NUMBER(15, 3) := 0;
"
"      v_emp_age                NUMBER(5)     := 0;
"
"      v_emp_gender            VARCHAR2(1)   := 'M';
"
"      v_result                VARCHAR2(1)   := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ddb_dec
"
"             WHERE htddbd_bu = p_bu
"
"               AND htddbd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80ddb_dec(htddbd_bu      ,
"
"                          htddbd_doc_no  ,
"
"                          htddbd_cre_by  ,
"
"                          htddbd_cre_date)
"
"                       VALUES(p_bu         ,    --htddbd_bu
"
"                              p_doc_no     ,    --htddbd_doc_no
"
"                              p_user     ,    --htddbd_cre_by
"
"                              SYSDATE     );    --htddbd_cre_date
"
"
"
"            OPEN c3(cr0.htch_emp_id);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  v_emp_age    := 0;
"
"                  v_emp_gender := 'M';
"
"               ELSE
"
"                  v_emp_age    := cr3.emp_age;
"
"                  v_emp_gender := cr3.emp_gender;
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_80ddb_sec_limit := 0;
"
"               ELSE
"
"
"
"                  IF v_emp_age < 60 THEN
"
"                     v_80ddb_sec_limit := NVL(cr2.htsddbl_limit, 0);
"
"                  ELSE
"
"                     v_80ddb_sec_limit := NVL(cr2.htsddbl_sc_limit, 0);
"
"                  END IF;
"
"
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            v_tot_expns := NVL(cr1.htdld_sec_80ddb_amt, 0);
"
"
"
"            IF v_tot_expns <= v_80ddb_sec_limit THEN
"
"               v_act_expns := v_tot_expns;
"
"            ELSE
"
"               v_act_expns := v_80ddb_sec_limit;
"
"            END IF;
"
"
"
"            UPDATE hrm_tds_80ddb_dec
"
"               SET htddbd_tot_expns = v_tot_expns,
"
"                   htddbd_act_expns = v_act_expns,
"
"                   htddbd_upd_by    = p_user,
"
"                   htddbd_upd_date  = SYSDATE
"
"             WHERE htddbd_bu = p_bu
"
"               AND htddbd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + v_act_expns,
"
"                   htch_upd_date  = SYSDATE,
"
"                   htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80ddb;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80g(p_bu                    VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec_80g_limit
"
"    WHERE htsgl_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_div_factor            HRM_TDS_SEC_80G_LIMIT.HTSGL_EXEMPT_DIV_FACT%TYPE;
"
"      v_donation_amt            NUMBER(15, 3) := 0;
"
"      v_exempt_amt            NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80g_dec
"
"             WHERE htgd_bu = p_bu
"
"               AND htgd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80g_dec(htgd_bu           ,
"
"                        htgd_doc_no       ,
"
"                        htgd_cre_by       ,
"
"                        htgd_cre_date    )
"
"                     VALUES(p_bu        ,    --htddbd_bu
"
"                            p_doc_no    ,    --htddbd_doc_no
"
"                            p_user        ,    --htddbd_cre_by
"
"                            SYSDATE        );    --htddbd_cre_date
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_div_factor := 1;
"
"               ELSE
"
"                  v_div_factor := NVL(cr2.htsgl_exempt_div_fact, 0);
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            v_donation_amt := NVL(cr1.htdld_sec_80g_donation, 0);
"
"
"
"            IF v_donation_amt > 0 THEN
"
"               v_exempt_amt := v_donation_amt/v_div_factor;
"
"            ELSE
"
"               v_exempt_amt := 0;
"
"            END IF;
"
"
"
"            UPDATE hrm_tds_80g_dec
"
"               SET htgd_donation_amt = v_donation_amt,
"
"               htgd_exempt_amt   = v_exempt_amt,
"
"               htgd_upd_by       = p_user,
"
"               htgd_upd_date     = SYSDATE
"
"              WHERE htgd_bu     = p_bu
"
"               AND htgd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded = htch_vi_a_ded + v_exempt_amt,--v_donation_amt,
"
"               htch_upd_date = SYSDATE,
"
"               htch_upd_by   = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80g;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80e(p_bu                    VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec_80e_limit
"
"    WHERE htsel_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_edu_loan_amt            NUMBER(15, 3) := 0;
"
"      v_80e_sec_limit            HRM_TDS_SEC_80E_LIMIT.HTSEL_LIMIT%TYPE;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80e_dec
"
"             WHERE hted_bu = p_bu
"
"               AND hted_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80e_dec(hted_bu           ,
"
"                        hted_doc_no       ,
"
"                        hted_cre_by       ,
"
"                        hted_cre_date    )
"
"                     VALUES(p_bu        ,    --htddbd_bu
"
"                            p_doc_no    ,    --htddbd_doc_no
"
"                            p_user        ,    --htddbd_cre_by
"
"                            SYSDATE        );    --htddbd_cre_date
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_80e_sec_limit := 0;
"
"               ELSE
"
"                  v_80e_sec_limit := NVL(cr2.htsel_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            v_edu_loan_amt := NVL(cr1.htdld_sec_80e_edu_loan, 0);
"
"
"
"            UPDATE hrm_tds_80e_dec
"
"               SET hted_edu_loan_int = v_edu_loan_amt,
"
"               hted_upd_by       = p_user,
"
"               hted_upd_date     = SYSDATE
"
"              WHERE hted_bu     = p_bu
"
"               AND hted_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + v_edu_loan_amt,
"
"               htch_upd_date  = SYSDATE,
"
"               htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80e;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80u(p_bu                    VARCHAR2,
"
"                       p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec_80u_limit
"
"    WHERE htsul_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"
"
"      v_normal_limit            HRM_TDS_SEC_80U_LIMIT.HTSUL_NORMAL_LIMIT%TYPE;
"
"      v_severe_limit            HRM_TDS_SEC_80U_LIMIT.HTSUL_SEVERE_LIMIT%TYPE;
"
"
"
"      v_phy_chlng_flag            VARCHAR2(1) := 'S';
"
"      v_total_amt            NUMBER(15, 3) := 0;
"
"      v_qualify_amt            NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80u_dec
"
"             WHERE htud_bu = p_bu
"
"               AND htud_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80u_dec(htud_bu           ,
"
"                        htud_doc_no       ,
"
"                        htud_cre_by       ,
"
"                        htud_cre_date    )
"
"                     VALUES(p_bu        ,    --htddbd_bu
"
"                            p_doc_no    ,    --htddbd_doc_no
"
"                            p_user        ,    --htddbd_cre_by
"
"                            SYSDATE        );    --htddbd_cre_date
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_normal_limit := 0;
"
"                  v_severe_limit := 0;
"
"               ELSE
"
"                  v_normal_limit := NVL(cr2.htsul_normal_limit, 0);
"
"                  v_severe_limit := NVL(cr2.htsul_severe_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"                  v_phy_chlng_flag := NVL(cr1.htdld_sec_80u_phy_chlng_flag, 'S');
"
"            v_total_amt := 0;
"
"
"
"            IF v_phy_chlng_flag = 'N' THEN
"
"
"
"               IF v_total_amt <= v_normal_limit THEN
"
"                  v_qualify_amt := v_total_amt;
"
"               ELSE
"
"                  v_qualify_amt := v_normal_limit;
"
"               END IF;
"
"
"
"            ELSIF v_phy_chlng_flag = 'V' THEN
"
"
"
"               IF v_total_amt <= v_severe_limit THEN
"
"                  v_qualify_amt := v_total_amt;
"
"               ELSE
"
"                  v_qualify_amt := v_severe_limit;
"
"               END IF;
"
"
"
"            ELSE
"
"               v_qualify_amt := 0;
"
"            END IF;
"
"
"
"            UPDATE hrm_tds_80u_dec
"
"               SET htud_prmnt_phy_chlng_flag = v_phy_chlng_flag,
"
"                   hted_tot_amt      = v_total_amt,
"
"                   hted_qualify_amt  = v_qualify_amt,
"
"               htud_upd_by       = p_user,
"
"               htud_upd_date     = SYSDATE
"
"              WHERE htud_bu     = p_bu
"
"               AND htud_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + v_qualify_amt,
"
"               htch_upd_date  = SYSDATE,
"
"               htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80u;
"
"
"
"   PROCEDURE proc_calc_emp_tds_conv(p_bu                VARCHAR2,
"
"                        p_doc_no                VARCHAR2,
"
"                        p_user                VARCHAR2,
"
"                        p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                                 FROM hrm_tds_decl_hd c
"
"                                WHERE c.htdh_bu     = a.htdh_bu
"
"                                  AND c.htdh_doc_no = a.htdh_doc_no
"
"                                  AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec10_14_dsc_limit
"
"    WHERE htsdl_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_sec10_14_dsc_elmnt
"
"    WHERE htcp_bu    = htsde_bu
"
"      AND htcp_elmnt_id = htsde_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"      v_10_13a_sec_limit        HRM_TDS_SEC10_14_DSC_LIMIT.HTSDL_LIMIT%TYPE;
"
"      v_dsc_paid_pct            HRM_TDS_SEC10_14_DSC_LIMIT.HTSDL_DSC_PAID_PCT%TYPE;
"
"      v_exempt_flag             HRM_TDS_SEC10_14_DSC_LIMIT.HTSDL_EXEMPT_FLAG%TYPE;
"
"
"
"      v_conv_rcvd               NUMBER(15, 3) := 0;
"
"      v_dsc_amt                 NUMBER(15, 3) := 0;
"
"      v_30p_dsc_amt             NUMBER(15, 3) := 0;
"
"      v_tot_conv_amt            NUMBER(15, 3) := 0;
"
"      v_act_conv_amt            NUMBER(15, 3) := 0;
"
"      v_act_cld_edu_alw         NUMBER(15, 3) := 0;
"
"      v_cld_edu_alw_lmt         NUMBER(15, 3) := 0;
"
"      v_fin_cld_edu_alw         NUMBER(15, 3) := 0;
"
"      v_result                  VARCHAR2(1) := 'N';
"
"
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result           := 'Y';
"
"            v_act_cld_edu_alw  := cr1.htdld_chld_edu_alw_limit;
"
"
"
"            DELETE
"
"              FROM hrm_tds_conv_dec
"
"             WHERE htcvd_bu = p_bu
"
"               AND htcvd_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_conv_dec(
"
"                         htcvd_bu          ,
"
"                         htcvd_doc_no      ,
"
"                         htcvd_cre_by      ,
"
"                         htcvd_cre_date
"
"                         )
"
"                      VALUES(
"
"                        p_bu               ,    --htddbd_bu
"
"                        p_doc_no           ,    --htddbd_doc_no
"
"                        p_user             ,    --htddbd_cre_by
"
"                        SYSDATE                 --htddbd_cre_date
"
"                        );
"
"
"
"                  v_dsc_amt := NVL(cr1.htdld_sec10_14_dsc, 0);
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"              v_10_13a_sec_limit := 0;
"
"              v_dsc_paid_pct     := 0;
"
"              v_exempt_flag      := 'N';
"
"              v_cld_edu_alw_lmt  := 0;
"
"               ELSE
"
"              v_10_13a_sec_limit := NVL(cr2.htsdl_limit, 0);
"
"              v_dsc_paid_pct     := NVL(cr2.htsdl_dsc_paid_pct, 0);
"
"              v_exempt_flag      := cr2.htsdl_exempt_flag;
"
"              v_cld_edu_alw_lmt  := cr2.htsdl_chld_edu_alw_limit;
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  v_conv_rcvd := 0;
"
"               ELSE
"
"                  v_conv_rcvd := NVL(cr3.htcp_elmnt_amt, 0);
"
"               END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"                  v_30p_dsc_amt := NVL((v_dsc_amt - ((v_dsc_amt * v_dsc_paid_pct)/100)), 0);
"
"
"
"                  IF (v_conv_rcvd - v_30p_dsc_amt) >= 0 THEN
"
"                     v_tot_conv_amt := (v_conv_rcvd - v_30p_dsc_amt);
"
"                  ELSE
"
"                     v_tot_conv_amt := 0;
"
"                  END IF;
"
"
"
"                  IF v_30p_dsc_amt <= 0 THEN
"
"                     v_act_conv_amt := 0;
"
"                  ELSE
"
"
"
"                     IF v_conv_rcvd <= v_10_13a_sec_limit THEN
"
"
"
"                        IF v_exempt_flag = 'N' THEN
"
"                           v_act_conv_amt := NVL(LEAST(v_conv_rcvd, v_30p_dsc_amt), 0);
"
"                        ELSIF v_exempt_flag = 'M' THEN
"
"                           v_act_conv_amt := NVL(GREATEST(v_conv_rcvd, v_30p_dsc_amt), 0);
"
"                        END IF;
"
"
"
"                     ELSE
"
"                        v_act_conv_amt := v_30p_dsc_amt;
"
"                     END IF;
"
"
"
"                  END IF;
"
"
"
"                  IF  v_act_cld_edu_alw >= v_cld_edu_alw_lmt THEN
"
"                      v_fin_cld_edu_alw := v_cld_edu_alw_lmt;
"
"                  ELSE
"
"                      v_fin_cld_edu_alw := v_act_cld_edu_alw;
"
"                  END IF;
"
"
"
"            UPDATE hrm_tds_conv_dec
"
"               SET htcvd_conv_rcvd           = v_conv_rcvd,
"
"                   htcvd_ds_conv             = v_dsc_amt,
"
"                   htcvd_30p_ds_conv         = v_30p_dsc_amt,
"
"                   htcvd_tot_conv            = v_tot_conv_amt,
"
"                   htcvd_act_conv            = v_act_conv_amt,
"
"                   htcvd_chld_edu_alw_limit     = v_fin_cld_edu_alw,
"
"                   htcvd_upd_by       = p_user,
"
"                   htcvd_upd_date     = SYSDATE
"
"              WHERE htcvd_bu     = p_bu
"
"               AND htcvd_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_us10_amt  = htch_us10_amt + v_act_conv_amt + v_fin_cld_edu_alw,
"
"                   htch_upd_by    = p_user,
"
"                   htch_upd_date  = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_conv;
"
"
"
"   PROCEDURE proc_calc_emp_tds_lta(p_bu                    VARCHAR2,
"
"                   p_doc_no                VARCHAR2,
"
"                   p_user                  VARCHAR2,
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
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT NVL(SUM(phln_amount), 0) phln_lta_amt
"
"     FROM payroll_hist_hd,
"
"      payroll_hist_ln
"
"    WHERE phhd_bu        = phln_bu
"
"      AND phhd_pyrl_no   = phln_pyrl_no
"
"      AND phhd_process_batch_no = phln_process_batch_no
"
"      AND phhd_bu        = p_bu
"
"      AND phhd_emp_id    = c_emp_id
"
"      AND phhd_year      = c_year
"
"      AND phhd_pyrl_type = 'L';
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_result                VARCHAR2(1)   := 'N';
"
"      v_lta_empr_amt            NUMBER(17, 2) := 0;
"
"      v_lta_decl_amt            NUMBER(17, 2) := 0;
"
"      v_lta_emp_amt            NUMBER(17, 2) := 0;
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_lta_dec
"
"             WHERE htld_bu = p_bu
"
"               AND htld_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_lta_dec(htld_bu          ,
"
"                        htld_doc_no      ,
"
"                        htld_cre_by      ,
"
"                        htld_cre_date    )
"
"                     VALUES(p_bu        ,    --htddbd_bu
"
"                            p_doc_no    ,    --htddbd_doc_no
"
"                            p_user        ,    --htddbd_cre_by
"
"                            SYSDATE        );    --htddbd_cre_date
"
"
"
"            OPEN c2(cr0.htch_emp_id, cr0.htch_fin_year);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_lta_empr_amt := 0;
"
"               ELSE
"
"                  v_lta_empr_amt := NVL(cr2.phln_lta_amt, 0);
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"                  IF cr0.htch_upd_lta_amt <> cr1.htdld_sec10_5_lta AND cr0.htch_upd_lta_amt <> 0 THEN
"
"                     v_lta_decl_amt := cr0.htch_upd_lta_amt;
"
"
"
"                  ELSE
"
"                     v_lta_decl_amt := cr1.htdld_sec10_5_lta;
"
"
"
"                  END IF;
"
"
"
"                  IF v_lta_decl_amt > v_lta_empr_amt THEN
"
"                     v_lta_emp_amt := v_lta_empr_amt;
"
"                  ELSE
"
"                     v_lta_emp_amt := v_lta_decl_amt;
"
"                  END IF;
"
"
"
"            UPDATE hrm_tds_lta_dec
"
"               SET htld_lta_limit    = 0,
"
"                   htld_empr_lta_amt = v_lta_empr_amt,
"
"                   htld_decl_lta_amt = NVL(cr1.htdld_sec10_5_lta,0),
"
"                   htld_act_lta_amt  = NVL(v_lta_emp_amt,0),
"
"                   htld_upd_by       = p_user,
"
"               htld_upd_date     = SYSDATE
"
"              WHERE htld_bu     = p_bu
"
"               AND htld_doc_no = p_doc_no;
"
"
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_upd_lta_amt = NVL(v_lta_decl_amt,0),
"
"                   htch_lta_amt     = NVL(v_lta_emp_amt,0),
"
"               htch_upd_by      = p_user,
"
"               htch_upd_date    = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_lta;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ccd1(p_bu                VARCHAR2,
"
"                           p_doc_no                VARCHAR2,
"
"                          p_user                VARCHAR2,
"
"                          p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"     FROM hrm_tds_sec_80ccd1_limit
"
"    WHERE htsccd1l_bu = p_bu;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT htcd_act_80c
"
"     FROM hrm_tds_80c_dec
"
"    WHERE htcd_bu     = p_bu
"
"      AND htcd_doc_no = p_doc_no;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_sec_80c_limit
"
"    WHERE htscl_bu = p_bu;
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"      v_80c_sec_limit            NUMBER(15, 3) := 0;
"
"      v_80ccd_sec_limit            NUMBER(15, 3) := 0;
"
"      v_80ccd_dec_amt            NUMBER(15, 3) := 0;
"
"      v_80c_amt                NUMBER(15, 3) := 0;
"
"      v_act_80ccd_amt            NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccd1_dec
"
"             WHERE htccd1d_bu = p_bu
"
"               AND htccd1d_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80ccd1_dec(htccd1d_bu          ,
"
"                           htccd1d_doc_no      ,
"
"                           htccd1d_cre_by      ,
"
"                           htccd1d_cre_date    )
"
"                        VALUES(p_bu            ,    --htccd1d_bu
"
"                               p_doc_no        ,    --htccd1d_doc_no
"
"                               p_user        ,    --htccd1d_cre_by
"
"                               SYSDATE        );    --htccd1d_cre_date
"
"
"
"            v_80ccd_dec_amt := NVL(cr1.htdld_sec_80ccd_nps_sc, 0);
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_80ccd_sec_limit := 0;
"
"               ELSE
"
"                  v_80ccd_sec_limit := NVL(cr2.htsccd1l_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c2;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  v_80c_amt := 0;
"
"               ELSE
"
"                  v_80c_amt := cr3.htcd_act_80c;
"
"               END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"            OPEN c4;
"
"            FETCH c4 INTO cr4;
"
"
"
"               IF c4%NOTFOUND THEN
"
"                  v_80c_sec_limit := 0;
"
"               ELSE
"
"                  v_80c_sec_limit := NVL(cr4.htscl_limit, 0);
"
"               END IF;
"
"
"
"                  CLOSE c4;
"
"
"
"                  IF v_80c_amt <= v_80c_sec_limit THEN
"
"
"
"                     IF v_80ccd_dec_amt <= v_80ccd_sec_limit THEN
"
"                        v_act_80ccd_amt := v_80ccd_dec_amt;
"
"                     ELSE
"
"                        v_act_80ccd_amt := v_80ccd_sec_limit;
"
"                     END IF;
"
"
"
"                  ELSE
"
"                     v_act_80ccd_amt := 0;
"
"                  END IF;
"
"
"
"            UPDATE hrm_tds_80ccd1_dec
"
"               SET htccd1d_80ccd_amt = v_80ccd_dec_amt,
"
"                   htccd1d_80c_amt   = v_80c_amt,
"
"                   htccd1d_80ccd_act = v_act_80ccd_amt,
"
"                   htccd1d_upd_by    = p_user,
"
"                   htccd1d_upd_date  = SYSDATE
"
"             WHERE htccd1d_bu = p_bu
"
"               AND htccd1d_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + v_act_80ccd_amt,
"
"               htch_upd_date  = SYSDATE,
"
"               htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80ccd1;
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ccd2(p_bu                VARCHAR2,
"
"                           p_doc_no                VARCHAR2,
"
"                          p_user                VARCHAR2,
"
"                          p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
"
"
"
"      cr1                c1%ROWTYPE;
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
"    WHERE emp_bu     = p_bu
"
"      AND emp_Emp_id = c_emp_id;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_sec_80ccd2_elmnt
"
"    WHERE htcp_bu       = htsccd2e_bu
"
"      AND htcp_elmnt_id = htsccd2e_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"      v_nps_n_pct            HRM_TDS_SEC_80CCD2_LIMIT.HTSCCD2L_NPS_N_PCT%TYPE;
"
"      v_nps_y_pct            HRM_TDS_SEC_80CCD2_LIMIT.HTSCCD2L_NPS_Y_PCT%TYPE;
"
"
"
"      v_80ccd2_type            VARCHAR2(1) := 'S';
"
"      v_salary_amt            NUMBER(15, 3) := 0;
"
"      v_80ccd_amt            NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 0;
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccd2_dec
"
"             WHERE htccd2d_bu = p_bu
"
"               AND htccd2d_doc_no = p_doc_no;
"
"
"
"            INSERT INTO hrm_tds_80ccd2_dec(htccd2d_bu          ,
"
"                           htccd2d_doc_no      ,
"
"                           htccd2d_cre_by      ,
"
"                           htccd2d_cre_date    )
"
"                        VALUES(p_bu            ,    --htccd2d_bu
"
"                               p_doc_no        ,    --htccd2d_doc_no
"
"                               p_user        ,    --htccd2d_cre_by
"
"                               SYSDATE        );    --htccd2d_cre_date
"
"
"
"            v_80ccd2_type := NVL(cr1.htdld_sec_80ccd_nps_ec, 'S');
"
"
"
"            OPEN c2(cr0.htch_emp_id);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_nps_n_pct := 0;
"
"                  v_nps_y_pct := 0;
"
"               ELSE
"
"                  v_nps_n_pct := NVL(cr2.emp_nps_n_pct, 0);
"
"                  v_nps_y_pct := NVL(cr2.emp_nps_y_pct, 0);
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  v_salary_amt := 0;
"
"               ELSE
"
"                  v_salary_amt := cr3.htcp_elmnt_amt;
"
"               END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"                  IF v_80ccd2_type = 'Y' THEN
"
"                     v_80ccd_amt := NVL(ROUND(((v_salary_amt * v_nps_y_pct)/100)), 0);
"
"                  ELSIF v_80ccd2_type = 'N' THEN
"
"                     v_80ccd_amt := NVL(ROUND(((v_salary_amt * v_nps_n_pct)/100)), 0);
"
"                  ELSE
"
"                     v_80ccd_amt := 0;
"
"                  END IF;
"
"
"
"            UPDATE hrm_tds_80ccd2_dec
"
"               SET htccd2d_type     = v_80ccd2_type,
"
"                   htccd2d_yrly_sal = v_salary_amt,
"
"                   htccd2d_act_amt  = v_80ccd_amt,
"
"                   htccd2d_upd_by   = p_user,
"
"                   htccd2d_upd_date = SYSDATE
"
"             WHERE htccd2d_bu = p_bu
"
"               AND htccd2d_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_vi_a_ded  = htch_vi_a_ded + v_80ccd_amt,
"
"               htch_upd_date  = SYSDATE,
"
"               htch_upd_by    = p_user
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_80ccd2;
"
"
"
"   PROCEDURE proc_calc_emp_tds_other(p_bu                VARCHAR2,
"
"                          p_doc_no                VARCHAR2,
"
"                         p_user                VARCHAR2,
"
"                         p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
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
"   SELECT htoel_elmnt_id,
"
"          pehd_desc1,
"
"          htoel_limit,
"
"          NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_other_elmnt_limit,
"
"          payroll_elements_hd
"
"    WHERE htcp_bu    = htoel_bu
"
"      AND htcp_elmnt_id = htoel_elmnt_id
"
"      AND htcp_bu       = pehd_bu
"
"      AND htcp_elmnt_id = pehd_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no
"
"    GROUP BY htoel_elmnt_id,
"
"             pehd_desc1,
"
"             htoel_limit;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT htcp_elmnt_id,
"
"          pehd_desc1,
"
"          NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_pt_elmnt_limit,
"
"          payroll_elements_hd
"
"    WHERE htcp_bu    = htpel_bu
"
"      AND htcp_elmnt_id = htpel_elmnt_id
"
"      AND htcp_bu       = pehd_bu
"
"      AND htcp_elmnt_id = pehd_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no
"
"    GROUP BY htcp_elmnt_id, pehd_desc1;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_hp_limit
"
"    WHERE hthl_bu = p_bu;
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"      v_limit                NUMBER(15, 3) := 0;
"
"      v_other_amt            NUMBER(15, 3) := 0;
"
"      v_prof_tax_amt            NUMBER(15, 3) := 0;
"
"      v_oth_income            NUMBER(15, 3) := 0;
"
"      v_result                VARCHAR2(1) := 'N';
"
"      v_fl_y_so_limit            HRM_TDS_HP_LIMIT.HTHL_FL_Y_SO_LIMIT%TYPE;
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"            v_result := 'Y';
"
"
"
"            v_oth_income := NVL(cr1.htdld_any_oth_income, 0);
"
"
"
"            OPEN c4;
"
"            FETCH c4 INTO cr4;
"
"
"
"               IF c4%NOTFOUND THEN
"
"              v_fl_y_so_limit := 0;
"
"               ELSE
"
"              v_fl_y_so_limit := NVL(cr4.hthl_fl_y_so_limit, 0);
"
"               END IF;
"
"
"
"            CLOSE c4;
"
"
"
"            DELETE
"
"              FROM hrm_tds_elmnt_calc
"
"             WHERE hthc_bu = p_bu
"
"               AND hthc_doc_no = p_doc_no;
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"               IF cr2.htcp_elmnt_amt <= cr2.htoel_limit THEN
"
"                  v_other_amt := cr2.htcp_elmnt_amt;
"
"               ELSE
"
"                  v_other_amt := cr2.htoel_limit;
"
"               END IF;
"
"
"
"               INSERT INTO hrm_tds_elmnt_calc(hthc_bu        ,
"
"                              hthc_doc_no    ,
"
"                              hthc_elmnt_id    ,
"
"                              hthc_ref        ,
"
"                              hthc_amt        ,
"
"                              hthc_cre_by    ,
"
"                              hthc_cre_date    )
"
"                           VALUES(p_bu        ,
"
"                                     p_doc_no        ,
"
"                                     cr2.htoel_elmnt_id,
"
"                                     cr2.pehd_desc1    ,
"
"                                     v_other_amt       ,
"
"                                     p_user        ,
"
"                                     SYSDATE        );
"
"
"
"               UPDATE hrm_tds_calc_hd
"
"                  SET htch_us10_amt  = htch_us10_amt + v_other_amt,
"
"                  htch_upd_by    = p_user,
"
"                  htch_upd_date  = SYSDATE
"
"                WHERE htch_bu     = p_bu
"
"                  AND htch_doc_no = p_doc_no;
"
"
"
"            END LOOP c2;
"
"
"
"            IF cr1.htdh_tax_type = 'E' THEN    --'E' Existing Tax Regime i.e Upto 201920 Fin Year    'N' New Tax Regime i.e From 202021 Fin Year
"
"
"
"               FOR cr3 IN c3
"
"               LOOP
"
"
"
"                  INSERT INTO hrm_tds_elmnt_calc(hthc_bu       ,
"
"                                 hthc_doc_no       ,
"
"                                 hthc_elmnt_id       ,
"
"                                 hthc_ref       ,
"
"                                 hthc_amt       ,
"
"                                 hthc_cre_by       ,
"
"                                 hthc_cre_date       )
"
"                              VALUES(p_bu           ,
"
"                                        p_doc_no       ,
"
"                                        cr3.htcp_elmnt_id ,
"
"                                        cr3.pehd_desc1       ,
"
"                                        cr3.htcp_elmnt_amt,
"
"                                        p_user           ,
"
"                                        SYSDATE       );
"
"
"
"                  UPDATE hrm_tds_calc_hd
"
"                     SET htch_prof_tax  = htch_prof_tax + NVL(cr3.htcp_elmnt_amt, 0),
"
"                     htch_upd_by    = p_user,
"
"                     htch_upd_date  = SYSDATE
"
"                   WHERE htch_bu     = p_bu
"
"                     AND htch_doc_no = p_doc_no;
"
"
"
"               END LOOP c3;
"
"
"
"            END IF;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_oth_incm  = htch_oth_incm + v_oth_income,
"
"               htch_upd_by    = p_user,
"
"               htch_upd_date  = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"
"
"               UPDATE hrm_tds_calc_hd
"
"                  SET htch_net_sal_incm = htch_slry_incm - (htch_us10_amt + htch_prof_tax + htch_lta_amt),
"
"                  htch_upd_by       = p_user,
"
"                  htch_upd_date     = SYSDATE
"
"                WHERE htch_bu     = p_bu
"
"                  AND htch_doc_no = p_doc_no;
"
"
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_gr_incm  = ((htch_net_sal_incm + htch_oth_incm) - CASE WHEN htch_hp_incm > v_fl_y_so_limit THEN v_fl_y_so_limit ELSE htch_hp_incm END),
"
"               htch_upd_by   = p_user,
"
"               htch_upd_date = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"            UPDATE hrm_tds_calc_hd
"
"               SET htch_net_taxbl_incm = CASE WHEN htch_gr_incm - htch_vi_a_ded < 0 THEN 0 ELSE htch_gr_incm - htch_vi_a_ded END,
"
"               htch_upd_by         = p_user,
"
"               htch_upd_date       = SYSDATE
"
"             WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = p_doc_no;
"
"
"
"         END IF;
"
"
"
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_other;
"
"
"
"   PROCEDURE proc_calc_emp_tds_tax(p_bu                    VARCHAR2,
"
"                        p_doc_no                VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                       p_res        OUT        VARCHAR2)
"
"   IS
"
"   CURSOR c0
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                           FROM hrm_tds_decl_hd c
"
"                          WHERE c.htdh_bu     = a.htdh_bu
"
"                            AND c.htdh_doc_no = a.htdh_doc_no
"
"                      AND c.htdh_status IN ('A', 'R'));
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT TO_NUMBER(TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_dob, 'DD-MON-RRRR'))/365)) emp_age,
"
"          emp_gender
"
"     FROM employees
"
"    WHERE emp_bu = p_bu
"
"      AND emp_emp_id = c_emp_id;
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT NVL(SUM(htcp_elmnt_amt), 0) htcp_elmnt_amt
"
"     FROM hrm_tds_calc_pyrl,
"
"          hrm_tds_tds_elmnt
"
"    WHERE htcp_bu       = htte_bu
"
"      AND htcp_elmnt_id = htte_elmnt_id
"
"      AND htcp_bu       = p_bu
"
"      AND htcp_doc_no   = p_doc_no;
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id            VARCHAR2,
"
"         c_year            NUMBER)
"
"       IS
"
"   SELECT NVL(MAX(phhd_period), 0) phhd_max_period
"
"     FROM (SELECT phhd_period
"
"         FROM payroll_hist_hd
"
"        WHERE phhd_bu        = p_bu
"
"          AND phhd_emp_id    = c_emp_id
"
"          AND phhd_year      = c_year
"
"          AND phhd_pyrl_type = 'N');
"
"
"
"      cr4                c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_year            NUMBER,
"
"            c_gender            VARCHAR2,
"
"            c_age            NUMBER,
"
"            c_tax_type            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_slab_rates_hd
"
"    WHERE htsrh_bu       = p_bu
"
"      AND htsrh_year     = c_year
"
"      AND (htsrh_gender  = c_gender OR htsrh_gender IN ('B'))
"
"      AND c_age BETWEEN htsrh_min_age AND htsrh_max_age
"
"      AND htsrh_tax_type = c_tax_type
"
"      AND htsrh_status   = 'A';
"
"
"
"      cr5                c5%ROWTYPE;
"
"
"
"   CURSOR c6(c_doc_no            VARCHAR2,
"
"            c_tax_amt            NUMBER)
"
"       IS
"
"   SELECT htsrl_min_amt,
"
"          htsrl_max_amt,
"
"          htsrl_tax_pct,
"
"          (((htsrl_max_amt - htsrl_min_amt) * htsrl_tax_pct)/100) htsrl_tax_amt
"
"     FROM (SELECT htsrl_min_amt,
"
"          CASE WHEN c_tax_amt < htsrl_max_amt THEN c_tax_amt ELSE  htsrl_max_amt END htsrl_max_amt,
"
"          htsrl_tax_pct
"
"         FROM hrm_tds_slab_rates_ln
"
"        WHERE htsrl_bu      = p_bu
"
"          AND htsrl_doc_no  = c_doc_no
"
"          AND htsrl_min_amt < c_tax_amt)
"
"    ORDER BY htsrl_min_amt ASC;
"
"
"
"   CURSOR c7(c_doc_no            VARCHAR2,
"
"            c_seq_no            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_slab_rates_ln
"
"    WHERE htsrl_bu     = p_bu
"
"      AND htsrl_doc_no = c_doc_no
"
"      AND htsrl_seq_no IN (SELECT MIN(htsrl_seq_no)
"
"                       FROM hrm_tds_slab_rates_ln
"
"                      WHERE htsrl_bu     = p_bu
"
"                        AND htsrl_doc_no = c_doc_no
"
"                        AND htsrl_seq_no > c_seq_no);
"
"
"
"      cr7                c7%ROWTYPE;
"
"
"
"   CURSOR c8(c_doc_no            VARCHAR2,
"
"            c_tax_amt            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_slab_rates_surchrg
"
"    WHERE htsrs_bu     = p_bu
"
"      AND htsrs_doc_no = c_doc_no
"
"      AND c_tax_amt BETWEEN htsrs_min_amt AND htsrs_max_amt;
"
"
"
"      cr8                c8%ROWTYPE;
"
"
"
"      CURSOR c9(c_emp_id            VARCHAR2,
"
"                        c_year            NUMBER)
"
"              IS
"
"       SELECT (pcp_period - 1) as tot_rem_count
"
"         FROM payroll_cal_period,employees
"
"          WHERE pcp_bu = emp_bu
"
"            AND emp_start_date BETWEEN pcp_start_date AND pcp_end_date
"
"            AND pcp_bu =p_bu
"
"            AND pcp_year = c_year
"
"            AND emp_emp_id = c_emp_id;
"
"
"
"      cr9                c9%ROWTYPE;
"
"
"
"      v_pre_comp_tds_amt           NUMBER(15, 3) := 0;
"
"      v_next_tax_pct               NUMBER(5, 2) := 0;
"
"      v_next_tax_limit             NUMBER(15, 3) := 0;
"
"      v_calc_tax_add_amt           NUMBER(15, 3) := 0;
"
"      v_calc_tax_ded_amt           NUMBER(15, 3) := 0;
"
"
"
"      v_emp_age                    NUMBER(5) := 0;
"
"      v_emp_gender                 VARCHAR2(1) := 'M';
"
"      v_act_tax_amt                NUMBER(15, 3) := 0;
"
"      v_net_tax_amt                NUMBER(15, 3) := 0;
"
"
"
"      v_tot_tax                    NUMBER(15, 3) := 0;
"
"      v_rebat_amt                  NUMBER(15, 3) := 0;
"
"      v_surcharge                  NUMBER(15, 3) := 0;
"
"      v_shec                       NUMBER(15, 3) := 0;
"
"      v_paid_tds_amt               NUMBER(15, 3) := 0;
"
"      v_yrly_tax_pay_amt           NUMBER(15, 3) := 0;
"
"      v_rmng_tds_per_mon           NUMBER(15, 3) := 0;
"
"      v_rem_count                  NUMBER(5) := 0;
"
"      v_tds_ded_cnt                NUMBER(5) := 0;
"
"      v_result                     VARCHAR2(1) := 'N';
"
"      v_next_limit_avail           VARCHAR2(1) := 'N';
"
"      v_next_seq_no                NUMBER(5);
"
"      v_seq_no                     NUMBER(5) := 0;
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"          OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year);
"
"         ELSE
"
"
"
"             v_result := 'Y';
"
"
"
"             v_net_tax_amt := NVL(cr0.htch_net_taxbl_incm, 0);
"
"
"
"             v_pre_comp_tds_amt :=  NVL(cr1.htdld_pre_comp_tds, 0);
"
"
"
"            OPEN c2(cr0.htch_emp_id);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  v_emp_age    := 0;
"
"                  v_emp_gender := 'M';
"
"               ELSE
"
"                  v_emp_age    := cr2.emp_age;
"
"                  v_emp_gender := cr2.emp_gender;
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            OPEN c4(cr0.htch_emp_id, cr0.htch_fin_year);
"
"            FETCH c4 INTO cr4;
"
"
"
"               IF c4%NOTFOUND THEN
"
"                  v_tds_ded_cnt := 0;
"
"               ELSE
"
"                  v_tds_ded_cnt := (12 - NVL(cr4.phhd_max_period, 0));
"
"               END IF;
"
"
"
"            CLOSE c4;
"
"
"
"            v_calc_tax_ded_amt := v_net_tax_amt;
"
"            v_seq_no := 1;
"
"
"
"            OPEN c5(cr0.htch_fin_year, v_emp_gender, v_emp_age, cr1.htdh_tax_type);
"
"            FETCH c5 INTO cr5;
"
"
"
"               IF c5%FOUND THEN
"
"
"
"                IF cr1.htdh_tax_type = 'N' THEN
"
"
"
"                  --IF v_calc_tax_ded_amt >= 700000 THEN --500000
"
"
"
"                     FOR cr6 IN c6(cr5.htsrh_doc_no, v_net_tax_amt)
"
"                     LOOP
"
"                        v_calc_tax_add_amt := v_calc_tax_add_amt + NVL(cr6.htsrl_tax_amt, 0);
"
"                     END LOOP c6;
"
"
"
"                 -- END IF;
"
"
"
"                END IF;
"
"
"
"                IF cr1.htdh_tax_type = 'E' THEN
"
"
"
"                  --IF v_calc_tax_ded_amt >= 500000 THEN --500000
"
"
"
"                     FOR cr6 IN c6(cr5.htsrh_doc_no, v_net_tax_amt)
"
"                     LOOP
"
"                        v_calc_tax_add_amt := v_calc_tax_add_amt + NVL(cr6.htsrl_tax_amt, 0);
"
"                     END LOOP c6;
"
"
"
"                  --END IF;
"
"
"
"                END IF;
"
"
"
"                  v_act_tax_amt := ROUND(NVL(v_calc_tax_add_amt, 0));
"
"
"
"                  UPDATE hrm_tds_calc_hd
"
"                     SET htch_tax_amt  = v_act_tax_amt,
"
"                     htch_upd_by   = p_user,
"
"                    htch_upd_date = SYSDATE
"
"                    WHERE htch_bu     = p_bu
"
"                      AND htch_doc_no = p_doc_no;
"
"
"
"                       IF cr1.htdh_tax_type ='N' THEN
"
"
"
"                          ---IF v_net_tax_amt < 700000 THEN --500000,350001 THEN
"
"                          --- ajis / 21-04-2025 - Rebate : 60000 limit 12 Lac
"
"                          IF v_net_tax_amt < 1200000 THEN --500000,350001 THEN
"
"
"
"                             ---IF v_act_tax_amt <= 25000 THEN  --12500
"
"                             IF v_act_tax_amt <= 60000 THEN  --12500
"
"                                v_rebat_amt := v_act_tax_amt;
"
"                             ELSE
"
"                                ---v_rebat_amt := 25000;
"
"                                v_rebat_amt := 60000;
"
"                             END IF;
"
"
"
"                          ELSE
"
"                                v_rebat_amt := 0;
"
"                          END IF;
"
"
"
"                       END IF;
"
"
"
"                       IF cr1.htdh_tax_type ='E' THEN
"
"
"
"                          IF v_net_tax_amt < 500000 THEN --500000,350001 THEN
"
"
"
"                                IF v_act_tax_amt <= 12500 THEN  --12500
"
"                                v_rebat_amt := v_act_tax_amt;
"
"                             ELSE
"
"                                v_rebat_amt := 12500;--25000
"
"                                END IF;
"
"
"
"                          ELSE
"
"                                v_rebat_amt := 0;
"
"                          END IF;
"
"
"
"                       END IF;
"
"
"
"                         OPEN c8(cr5.htsrh_doc_no, v_net_tax_amt);
"
"                          FETCH c8 INTO cr8;
"
"
"
"                             IF c8%FOUND THEN
"
"                                v_surcharge := NVL(ROUND((v_act_tax_amt * cr8.htsrs_chrg_pct)/100), 0);
"
"                             ELSE
"
"                                v_surcharge := 0;
"
"                             END IF;
"
"
"
"                          CLOSE c8;
"
"
"
"                          v_tot_tax := NVL((v_act_tax_amt - v_rebat_amt), 0);
"
"
"
"                          IF cr5.htsrh_include_surchrg = 'N' THEN
"
"                             v_shec := ROUND((v_tot_tax/100) * cr5.htsrh_cess_pct);
"
"                          ELSE
"
"                             v_shec := ROUND(((v_tot_tax/100) * cr5.htsrh_cess_pct) + v_surcharge);
"
"                          END IF;
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
"                      v_paid_tds_amt := NVL(cr3.htcp_elmnt_amt, 0) ;
"
"                     ELSE
"
"                      v_paid_tds_amt := 0;
"
"                     END IF;
"
"
"
"                  CLOSE c3;
"
"
"
"
"
"                OPEN c9(cr0.htch_emp_id, cr0.htch_fin_year);
"
"                FETCH c9 INTO cr9;
"
"
"
"                   IF c9%NOTFOUND THEN
"
"                      v_rem_count := 0;
"
"                   ELSE
"
"                      v_rem_count := cr9.tot_rem_count ;
"
"                   END IF;
"
"
"
"                CLOSE c9;
"
"
"
"                 v_tds_ded_cnt := v_tds_ded_cnt - v_rem_count;
"
"
"
"
"
"                          IF ((v_tot_tax + v_surcharge + v_shec) - v_paid_tds_amt - nvl(v_pre_comp_tds_amt,0)) > 0 THEN
"
"                                v_yrly_tax_pay_amt := NVL(((v_tot_tax + v_surcharge + v_shec) - v_paid_tds_amt - nvl(v_pre_comp_tds_amt,0)), 0);
"
"                          ELSE
"
"                                v_yrly_tax_pay_amt := 0;
"
"                          END IF;
"
"
"
"                          IF v_yrly_tax_pay_amt > 0 THEN
"
"                                v_rmng_tds_per_mon := NVL(ROUND(v_yrly_tax_pay_amt/v_tds_ded_cnt), 0);
"
"                          ELSE
"
"                                v_rmng_tds_per_mon := 0;
"
"                          END IF;
"
"
"
"              UPDATE hrm_tds_calc_hd
"
"                 SET htch_rebate        = v_rebat_amt,
"
"                   htch_tot_tax_amt   = v_tot_tax,
"
"                     htch_surcharge     = v_surcharge,
"
"                     htch_shec          = v_shec,
"
"                     htch_tds_ded       = v_paid_tds_amt,
"
"                     htch_rmng_mnth     = CASE WHEN v_tds_ded_cnt - 1 < 0 THEN 0 ELSE  (v_tds_ded_cnt - 1) END ,
"
"                     --htch_rmng_mnth     =  v_tds_ded_cnt,
"
"                     htch_yrly_tax_pybl = v_yrly_tax_pay_amt,
"
"                     htch_mnth_tds_ded  = v_rmng_tds_per_mon,
"
"                     htch_upd_by        = p_user,
"
"                     htch_upd_date      = SYSDATE
"
"               WHERE htch_bu     = p_bu
"
"                 AND htch_doc_no = p_doc_no;
"
"
"
"                END IF;
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
"          CLOSE c1;
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
"      p_res := v_result;
"
"
"
"   END proc_calc_emp_tds_tax;
"
"
"
"   PROCEDURE proc_load_emp_tds(p_bu                VARCHAR2,
"
"                   p_doc_no                VARCHAR2,
"
"                   p_user                VARCHAR2,
"
"                   p_res        OUT        VARCHAR2)
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
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu     = p_bu
"
"      AND htch_doc_no = p_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"
"
"   CURSOR c1(c_emp_id            VARCHAR2,
"
"            c_year            NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd a,
"
"          hrm_tds_decl_det b
"
"    WHERE a.htdh_bu         = b.htdld_bu(+)
"
"      AND a.htdh_doc_no     = b.htdld_doc_no(+)
"
"      AND a.htdh_doc_rev_no = b.htdld_doc_rev_no(+)
"
"      AND a.htdh_bu         = p_bu
"
"      AND a.htdh_emp_id     = c_emp_id
"
"      AND a.htdh_fin_year   = c_year
"
"      AND a.htdh_status     IN ('A', 'R')
"
"      AND a.htdh_doc_rev_no = (SELECT MAX(c.htdh_doc_rev_no)
"
"                                 FROM hrm_tds_decl_hd c
"
"                                WHERE c.htdh_bu     = a.htdh_bu
"
"                                  AND c.htdh_doc_no = a.htdh_doc_no
"
"                                  AND c.htdh_status IN ('A', 'R'));
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"      v_tax_type        VARCHAR2(1) := 'E';
"
"      v_pyrl_res        VARCHAR2(100);
"
"      v_hra_res            VARCHAR2(100);
"
"      v_hpso_res        VARCHAR2(100);
"
"      v_hplo_res        VARCHAR2(100);
"
"      v_80c_res            VARCHAR2(100);
"
"      v_80ccg_res        VARCHAR2(100);
"
"      v_80d_res            VARCHAR2(100);
"
"      v_80dd_res        VARCHAR2(100);
"
"      v_80ddb_res        VARCHAR2(100);
"
"      v_80g_res            VARCHAR2(100);
"
"      v_80e_res            VARCHAR2(100);
"
"      v_80u_res            VARCHAR2(100);
"
"      v_conv_res        VARCHAR2(100);
"
"      v_80ccd1_res        VARCHAR2(100);
"
"      v_80ccd2_res        VARCHAR2(100);
"
"      v_oth_res            VARCHAR2(100);
"
"      v_tax_res            VARCHAR2(100);
"
"      v_lta_res            VARCHAR2(100);
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
"            RAISE_APPLICATION_ERROR(-20999, 'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"         ELSE
"
"
"
"        OPEN c1(cr0.htch_emp_id, cr0.htch_fin_year);
"
"        FETCH c1 INTO cr1;
"
"
"
"           IF c1%NOTFOUND THEN
"
"          RAISE_APPLICATION_ERROR(-20071, 'HRM'||'~'||p_bu||'~'||cr0.htch_emp_id||'~'||cr0.htch_fin_year||'~'||'TDS Declaration in New Status');
"
"           ELSE
"
"          v_tax_type := cr1.htdh_tax_type;
"
"           END IF;
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
"      proc_calc_emp_tds_pyrl(p_bu,
"
"                     p_doc_no,
"
"                    p_user,
"
"                    v_pyrl_res);
"
"
"
"
"
"         proc_calc_emp_tds_hra(p_bu,
"
"                   p_doc_no,
"
"                      p_user,
"
"                      v_hra_res);
"
"
"
"
"
"      proc_calc_emp_tds_hpso(p_bu,
"
"                 p_doc_no,
"
"                 p_user,
"
"                 v_hpso_res);
"
"
"
"      proc_calc_emp_tds_hplo(p_bu,
"
"                 p_doc_no,
"
"                 p_user,
"
"                 v_hplo_res);
"
"
"
"      IF v_tax_type = 'E' THEN
"
"
"
"         proc_calc_emp_tds_80c(p_bu,
"
"                   p_doc_no,
"
"                   p_user,
"
"                   v_80c_res);
"
"
"
"         proc_calc_emp_tds_80ccg(p_bu,
"
"                         p_doc_no,
"
"                        p_user,
"
"                     v_80ccg_res);
"
"
"
"         proc_calc_emp_tds_80d(p_bu,
"
"                       p_doc_no,
"
"                      p_user,
"
"                   v_80d_res);
"
"
"
"         proc_calc_emp_tds_80dd(p_bu,
"
"                           p_doc_no,
"
"                       p_user,
"
"                    v_80dd_res);
"
"
"
"         proc_calc_emp_tds_80ddb(p_bu,
"
"                         p_doc_no,
"
"                        p_user,
"
"                     v_80ddb_res);
"
"
"
"         proc_calc_emp_tds_80g(p_bu,
"
"                       p_doc_no,
"
"                      p_user,
"
"                   v_80g_res);
"
"
"
"         proc_calc_emp_tds_80e(p_bu,
"
"                       p_doc_no,
"
"                      p_user,
"
"                   v_80e_res);
"
"
"
"         proc_calc_emp_tds_80u(p_bu,
"
"                       p_doc_no,
"
"                      p_user,
"
"                   v_80u_res);
"
"
"
"         proc_calc_emp_tds_conv(p_bu,
"
"                        p_doc_no,
"
"                       p_user,
"
"                       v_conv_res);
"
"
"
"         proc_calc_emp_tds_lta(p_bu,
"
"                   p_doc_no,
"
"                      p_user,
"
"                   v_lta_res);
"
"
"
"         proc_calc_emp_tds_80ccd1(p_bu,
"
"                          p_doc_no,
"
"                         p_user,
"
"                      v_80ccd1_res);
"
"
"
"      ELSE
"
"         v_80c_res    := 'N';
"
"         v_80ccg_res  := 'N';
"
"         v_80d_res    := 'N';
"
"         v_80dd_res   := 'N';
"
"         v_80ddb_res  := 'N';
"
"         v_80g_res    := 'N';
"
"         v_80e_res    := 'N';
"
"         v_80u_res    := 'N';
"
"         v_conv_res   := 'N';
"
"         v_lta_res    := 'N';
"
"         v_80ccd1_res := 'N';
"
"      END IF;
"
"
"
"      proc_calc_emp_tds_80ccd2(p_bu,
"
"                       p_doc_no,
"
"                      p_user,
"
"                   v_80ccd1_res);
"
"
"
"      proc_calc_emp_tds_other(p_bu,
"
"                      p_doc_no,
"
"                     p_user,
"
"                  v_oth_res);
"
"
"
"      proc_calc_emp_tds_tax(p_bu,
"
"                            p_doc_no,
"
"                p_user,
"
"                v_tax_res);
"
"
"
"      IF (v_pyrl_res = 'Y' OR v_hra_res = 'Y' OR v_hpso_res ='Y' OR v_hplo_res = 'Y' OR v_80c_res = 'Y' OR v_80ccg_res = 'Y' OR v_80d_res = 'Y' OR v_80dd_res = 'Y' OR v_80g_res = 'Y' OR
"
"          v_80e_res = 'Y' OR v_80u_res = 'Y' OR v_conv_res = 'Y' OR v_80ccd1_res = 'Y' OR v_80ccd2_res = 'Y' OR v_oth_res = 'Y' OR v_tax_res = 'Y') THEN
"
"         p_res := 'Y';
"
"      ELSE
"
"         p_res := 'N';
"
"      END IF;
"
"
"
"   END proc_load_emp_tds;
"
"
"
"END;"
/
