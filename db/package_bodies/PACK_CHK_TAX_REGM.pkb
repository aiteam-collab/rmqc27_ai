CREATE OR REPLACE
"PACKAGE BODY        pack_chk_tax_regm
"
"AS
"
"
"
"   PROCEDURE proc_ins_tax_regm(p_bu                VARCHAR2,
"
"                   p_doc_no                VARCHAR2,
"
"                   p_doc_rev_no            NUMBER,
"
"                   p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_hd
"
"    WHERE htdh_bu         = p_bu
"
"      AND htdh_doc_no     = p_doc_no
"
"      AND htdh_doc_rev_no = p_doc_rev_no;
"
"
"
"      cr1                    c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_doc_no                VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu = p_bu
"
"      AND htch_doc_no = c_doc_no;
"
"
"
"      cr2                    c2%ROWTYPE;
"
"
"
"      v_act_status                VARCHAR2(5);
"
"      v_act_reg_type                VARCHAR2(5);
"
"      v_old_tax_doc_no                VARCHAR2(15);
"
"      v_new_tax_doc_no                VARCHAR2(15);
"
"      v_result                    VARCHAR2(100);
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
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_doc_no||'~'||p_doc_rev_no);
"
"         ELSE
"
"
"
"            DELETE
"
"              FROM hrm_tds_calc_tax_regm
"
"             WHERE htctr_bu         = p_bu
"
"               AND htctr_doc_no     = p_doc_no
"
"               AND htctr_doc_rev_no = p_doc_rev_no;
"
"
"
"            v_act_status   := cr1.htdh_status;
"
"            v_act_reg_type := cr1.htdh_tax_type;
"
"
"
"            UPDATE hrm_tds_decl_hd
"
"               SET htdh_status   = 'A',
"
"                   htdh_upd_by   = p_user,
"
"                   htdh_upd_date = SYSDATE
"
"             WHERE htdh_bu         = p_bu
"
"               AND htdh_doc_no     = p_doc_no
"
"               AND htdh_doc_rev_no = p_doc_rev_no;
"
"
"
"            /* New Tax Regime */
"
"
"
"           /* UPDATE hrm_tds_decl_hd
"
"               SET htdh_tax_type = 'N',
"
"                   htdh_upd_by   = p_user,
"
"                   htdh_upd_date = SYSDATE
"
"             WHERE htdh_bu         = p_bu
"
"               AND htdh_doc_no     = p_doc_no
"
"               AND htdh_doc_rev_no = p_doc_rev_no;*/
"
"            /*
"
"            SELECT NVL(MAX(TO_NUMBER(htch_doc_no)), 1000000000) + 1
"
"             INTO v_new_tax_doc_no
"
"             FROM (SELECT htch_doc_no
"
"                     FROM hrm_tds_calc_hd
"
"                      WHERE htch_bu = p_bu
"
"                      UNION ALL
"
"                     SELECT htchh_doc_no
"
"              FROM hrm_tds_calc_hd_hist
"
"                      WHERE htchh_bu = p_bu);
"
"        */
"
"
"
"        v_new_tax_doc_no := func_find_pfx_nextno(p_bu,
"
"                             TRUNC(SYSDATE),
"
"                             'TDS',
"
"                             p_user
"
"                              );
"
"            INSERT INTO hrm_tds_calc_hd(htch_bu         ,
"
"                        htch_doc_no     ,
"
"                        htch_pfx,
"
"                        htch_doc_date     ,
"
"                        htch_emp_id     ,
"
"                        htch_fin_year     ,
"
"                        htch_cre_by     ,
"
"                        htch_cre_date     )
"
"                     VALUES(p_bu         ,        --htch_bu
"
"                        v_new_tax_doc_no ,        --htch_doc_no
"
"                        'TDS',    --htch_pfx
"
"                              TRUNC(SYSDATE)     ,        --htch_doc_date
"
"                              cr1.htdh_emp_id     ,        --htch_emp_id
"
"                              cr1.htdh_fin_year,        --htch_fin_year
"
"                              p_user         ,        --htch_cre_by
"
"                              SYSDATE         );        --htch_cre_date
"
"
"
"            pack_calc_emp_tds.proc_load_emp_tds(p_bu,
"
"                            v_new_tax_doc_no,
"
"                            p_user,
"
"                            v_result);
"
"
"
"        OPEN c2(v_new_tax_doc_no);
"
"        FETCH c2 INTO cr2;
"
"
"
"           IF c2%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_doc_no||'~'||p_doc_rev_no);
"
"           ELSE
"
"
"
"              INSERT INTO hrm_tds_calc_tax_regm(htctr_bu            ,
"
"                                htctr_doc_no        ,
"
"                                htctr_doc_rev_no        ,
"
"                                htctr_tax_type        ,
"
"                                  htctr_slry_incm        ,
"
"                                htctr_us10_amt        ,
"
"                                htctr_prof_tax        ,
"
"                                htctr_upd_lta_amt        ,
"
"                                htctr_lta_amt        ,
"
"                                htctr_net_sal_incm        ,
"
"                                htctr_hp_incm        ,
"
"                                htctr_oth_incm        ,
"
"                                htctr_gr_incm        ,
"
"                                htctr_vi_a_ded        ,
"
"                                htctr_net_taxbl_incm    ,
"
"                                htctr_tax_amt        ,
"
"                                htctr_rebate        ,
"
"                                htctr_surcharge        ,
"
"                                htctr_shec            ,
"
"                                htctr_tds_ded        ,
"
"                                htctr_yrly_tax_pybl        ,
"
"                                htctr_rmng_mnth        ,
"
"                              htctr_mnth_tds_ded        ,
"
"                            htctr_tot_tax_amt        ,
"
"                            htctr_hold_flag        ,
"
"                            htctr_source        ,
"
"                            htctr_bonus_amt        ,
"
"                            htctr_exgratia_amt        ,
"
"                            htctr_med_rebmnt_amt    ,
"
"                            htctr_others_amt        ,
"
"                            htctr_tot_tds        ,
"
"                            htctr_cre_by        ,
"
"                             htctr_cre_date        )
"
"                         VALUES(p_bu            ,
"
"                              p_doc_no            ,
"
"                              p_doc_rev_no        ,
"
"                              'N'                ,
"
"                              cr2.htch_slry_incm        ,
"
"                            cr2.htch_us10_amt        ,
"
"                            cr2.htch_prof_tax        ,
"
"                            cr2.htch_upd_lta_amt    ,
"
"                            cr2.htch_lta_amt        ,
"
"                            cr2.htch_net_sal_incm    ,
"
"                            cr2.htch_hp_incm        ,
"
"                            cr2.htch_oth_incm        ,
"
"                            cr2.htch_gr_incm        ,
"
"                            cr2.htch_vi_a_ded        ,
"
"                            cr2.htch_net_taxbl_incm    ,
"
"                            cr2.htch_tax_amt        ,
"
"                            cr2.htch_rebate        ,
"
"                            cr2.htch_surcharge        ,
"
"                            cr2.htch_shec        ,
"
"                            cr2.htch_tds_ded        ,
"
"                            cr2.htch_yrly_tax_pybl    ,
"
"                            cr2.htch_rmng_mnth        ,
"
"                            cr2.htch_mnth_tds_ded    ,
"
"                            cr2.htch_tot_tax_amt    ,
"
"                            cr2.htch_hold_flag        ,
"
"                            cr2.htch_source        ,
"
"                            cr2.htch_bonus_amt        ,
"
"                            cr2.htch_exgratia_amt    ,
"
"                            cr2.htch_med_rebmnt_amt    ,
"
"                            cr2.htch_others_amt        ,
"
"                            (cr2.htch_tot_tax_amt + cr2.htch_surcharge + cr2.htch_shec),
"
"                            p_user            ,
"
"                             SYSDATE            );
"
"
"
"           END IF;
"
"
"
"        CLOSE c2;
"
"
"
"            /* New Old Regime */
"
"
"
"            UPDATE hrm_tds_decl_hd
"
"               SET htdh_tax_type = 'E',
"
"                   htdh_upd_by   = p_user,
"
"                   htdh_upd_date = SYSDATE
"
"             WHERE htdh_bu         = p_bu
"
"               AND htdh_doc_no     = p_doc_no
"
"               AND htdh_doc_rev_no = p_doc_rev_no;
"
"            /*
"
"            SELECT NVL(MAX(TO_NUMBER(htch_doc_no)), 1000000000) + 1
"
"             INTO v_old_tax_doc_no
"
"             FROM (SELECT htch_doc_no
"
"                    FROM hrm_tds_calc_hd
"
"                      WHERE htch_bu = p_bu
"
"                      UNION ALL
"
"                     SELECT htchh_doc_no
"
"              FROM hrm_tds_calc_hd_hist
"
"                      WHERE htchh_bu = p_bu);
"
"            */
"
"
"
"        v_old_tax_doc_no := func_find_pfx_nextno(p_bu,
"
"                             TRUNC(SYSDATE),
"
"                             'TDS',
"
"                             p_user
"
"                              );
"
"            INSERT INTO hrm_tds_calc_hd(htch_bu         ,
"
"                        htch_doc_no     ,
"
"                        htch_doc_date     ,
"
"                        htch_pfx,
"
"                        htch_emp_id     ,
"
"                        htch_fin_year     ,
"
"                        htch_cre_by     ,
"
"                        htch_cre_date     )
"
"                     VALUES(p_bu         ,        --htch_bu
"
"                        v_old_tax_doc_no ,        --htch_doc_no
"
"                              TRUNC(SYSDATE)     ,        --htch_doc_date
"
"                              'TDS',
"
"                              cr1.htdh_emp_id     ,        --htch_emp_id
"
"                              cr1.htdh_fin_year,        --htch_fin_year
"
"                              p_user         ,        --htch_cre_by
"
"                              SYSDATE         );        --htch_cre_date
"
"
"
"            pack_calc_emp_tds.proc_load_emp_tds(p_bu,
"
"                            v_old_tax_doc_no,
"
"                            p_user,
"
"                            v_result);
"
"
"
"        OPEN c2(v_old_tax_doc_no);
"
"        FETCH c2 INTO cr2;
"
"
"
"           IF c2%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_doc_no||'~'||p_doc_rev_no);
"
"           ELSE
"
"
"
"              INSERT INTO hrm_tds_calc_tax_regm(htctr_bu            ,
"
"                                htctr_doc_no        ,
"
"                                htctr_doc_rev_no        ,
"
"                                htctr_tax_type        ,
"
"                                  htctr_slry_incm        ,
"
"                                htctr_us10_amt        ,
"
"                                htctr_prof_tax        ,
"
"                                htctr_upd_lta_amt        ,
"
"                                htctr_lta_amt        ,
"
"                                htctr_net_sal_incm        ,
"
"                                htctr_hp_incm        ,
"
"                                htctr_oth_incm        ,
"
"                                htctr_gr_incm        ,
"
"                                htctr_vi_a_ded        ,
"
"                                htctr_net_taxbl_incm    ,
"
"                                htctr_tax_amt        ,
"
"                                htctr_rebate        ,
"
"                                htctr_surcharge        ,
"
"                                htctr_shec            ,
"
"                                htctr_tds_ded        ,
"
"                                htctr_yrly_tax_pybl        ,
"
"                                htctr_rmng_mnth        ,
"
"                              htctr_mnth_tds_ded        ,
"
"                            htctr_tot_tax_amt        ,
"
"                            htctr_hold_flag        ,
"
"                            htctr_source        ,
"
"                            htctr_bonus_amt        ,
"
"                            htctr_exgratia_amt        ,
"
"                            htctr_med_rebmnt_amt    ,
"
"                            htctr_others_amt        ,
"
"                            htctr_tot_tds        ,
"
"                            htctr_cre_by        ,
"
"                             htctr_cre_date        )
"
"                         VALUES(p_bu            ,
"
"                              p_doc_no            ,
"
"                              p_doc_rev_no        ,
"
"                              'E'                ,
"
"                              cr2.htch_slry_incm        ,
"
"                            cr2.htch_us10_amt        ,
"
"                            cr2.htch_prof_tax        ,
"
"                            cr2.htch_upd_lta_amt    ,
"
"                            cr2.htch_lta_amt        ,
"
"                            cr2.htch_net_sal_incm    ,
"
"                            cr2.htch_hp_incm        ,
"
"                            cr2.htch_oth_incm        ,
"
"                            cr2.htch_gr_incm        ,
"
"                            cr2.htch_vi_a_ded        ,
"
"                            cr2.htch_net_taxbl_incm    ,
"
"                            cr2.htch_tax_amt        ,
"
"                            cr2.htch_rebate        ,
"
"                            cr2.htch_surcharge        ,
"
"                            cr2.htch_shec        ,
"
"                            cr2.htch_tds_ded        ,
"
"                            cr2.htch_yrly_tax_pybl    ,
"
"                            cr2.htch_rmng_mnth        ,
"
"                            cr2.htch_mnth_tds_ded    ,
"
"                            cr2.htch_tot_tax_amt    ,
"
"                            cr2.htch_hold_flag        ,
"
"                            cr2.htch_source        ,
"
"                            cr2.htch_bonus_amt        ,
"
"                            cr2.htch_exgratia_amt    ,
"
"                            cr2.htch_med_rebmnt_amt    ,
"
"                            cr2.htch_others_amt        ,
"
"                            (cr2.htch_tot_tax_amt + cr2.htch_surcharge + cr2.htch_shec),
"
"                            p_user            ,
"
"                             SYSDATE            );
"
"
"
"           END IF;
"
"
"
"        CLOSE c2;
"
"
"
"            proc_del_tax_regm(p_bu,
"
"                          v_new_tax_doc_no);
"
"
"
"            proc_del_tax_regm(p_bu,
"
"                          v_old_tax_doc_no);
"
"
"
"            UPDATE hrm_tds_decl_hd
"
"               SET htdh_status   = v_act_status,
"
"                ---   htdh_tax_type = v_act_reg_type,
"
"                   htdh_upd_by   = p_user,
"
"                   htdh_upd_date = SYSDATE
"
"             WHERE htdh_bu         = p_bu
"
"               AND htdh_doc_no     = p_doc_no
"
"               AND htdh_doc_rev_no = p_doc_rev_no;
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
"   END proc_ins_tax_regm;
"
"
"
"   PROCEDURE proc_del_tax_regm(p_bu                VARCHAR2,
"
"                      p_doc_no                VARCHAR2)
"
"   IS
"
"   BEGIN
"
"
"
"      DELETE
"
"      FROM hrm_tds_calc_pyrl
"
"       WHERE htcp_bu = p_bu
"
"      AND htcp_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_hra_dec
"
"       WHERE hthrd_bu = p_bu
"
"         AND hthrd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_house_property
"
"       WHERE hthp_bu = p_bu
"
"         AND hthp_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80c_dec
"
"       WHERE htcd_bu = p_bu
"
"         AND htcd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80ccg_dec
"
"       WHERE htccgd_bu = p_bu
"
"         AND htccgd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80d_dec
"
"       WHERE htdd_bu = p_bu
"
"         AND htdd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80dd_dec
"
"       WHERE htddd_bu = p_bu
"
"         AND htddd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80ddb_dec
"
"       WHERE htddbd_bu     = p_bu
"
"         AND htddbd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80g_dec
"
"       WHERE htgd_bu = p_bu
"
"         AND htgd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80e_dec
"
"       WHERE hted_bu = p_bu
"
"         AND hted_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80u_dec
"
"       WHERE htud_bu = p_bu
"
"         AND htud_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_conv_dec
"
"       WHERE htcvd_bu = p_bu
"
"         AND htcvd_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_lta_dec
"
"       WHERE htld_bu = p_bu
"
"         AND htld_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80ccd1_dec
"
"       WHERE htccd1d_bu = p_bu
"
"         AND htccd1d_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_80ccd2_dec
"
"       WHERE htccd2d_bu = p_bu
"
"         AND htccd2d_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_elmnt_calc
"
"       WHERE hthc_bu = p_bu
"
"         AND hthc_doc_no = p_doc_no;
"
"
"
"      DELETE
"
"        FROM hrm_tds_calc_hd
"
"       WHERE htch_bu = p_bu
"
"         AND htch_doc_no = p_doc_no;
"
"
"
"   END proc_del_tax_regm;
"
"
"
"END;"
/
