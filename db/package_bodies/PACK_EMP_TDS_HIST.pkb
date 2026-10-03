CREATE OR REPLACE
"PACKAGE BODY        pack_emp_tds_hist
"
"AS
"
"
"
"   PROCEDURE proc_insert_emp_tds_hist(p_bu                VARCHAR2,
"
"                          p_emp_id                VARCHAR2,
"
"                          p_year                NUMBER,
"
"                          p_period                NUMBER,
"
"                         p_user                VARCHAR2)
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
"    WHERE htdh_bu       = p_bu
"
"      AND htdh_emp_id   = p_emp_id
"
"      AND htdh_fin_year = p_year;
"
"
"
"   CURSOR c2(c_doc_no            VARCHAR2,
"
"            c_doc_rev_no        NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_det
"
"    WHERE htdld_bu         = p_bu
"
"      AND htdld_doc_no     = c_doc_no
"
"      AND htdld_doc_rev_no = c_doc_rev_no;
"
"
"
"   CURSOR c3(c_doc_no            VARCHAR2,
"
"            c_doc_rev_no        NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_attach
"
"    WHERE htda_bu         = p_bu
"
"      AND htda_doc_no     = c_doc_no
"
"      AND htda_doc_rev_no = c_doc_rev_no;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd
"
"    WHERE htch_bu       = p_bu
"
"      AND htch_emp_id   = p_emp_id
"
"      AND htch_fin_year = p_year;
"
"
"
"   CURSOR c5(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_pyrl
"
"    WHERE htcp_bu     = p_bu
"
"      AND htcp_doc_no = c_doc_no;
"
"
"
"   CURSOR c6(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_hra_dec
"
"    WHERE hthrd_bu     = p_bu
"
"      AND hthrd_doc_no = c_doc_no;
"
"
"
"   CURSOR c7(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_house_property
"
"    WHERE hthp_bu     = p_bu
"
"      AND hthp_doc_no = c_doc_no;
"
"
"
"   CURSOR c8(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80c_dec
"
"    WHERE htcd_bu     = p_bu
"
"      AND htcd_doc_no = c_doc_no;
"
"
"
"   CURSOR c9(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ccg_dec
"
"    WHERE htccgd_bu     = p_bu
"
"      AND htccgd_doc_no = c_doc_no;
"
"
"
"   CURSOR c10(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80d_dec
"
"    WHERE htdd_bu     = p_bu
"
"      AND htdd_doc_no = c_doc_no;
"
"
"
"   CURSOR c11(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80dd_dec
"
"    WHERE htddd_bu     = p_bu
"
"      AND htddd_doc_no = c_doc_no;
"
"
"
"   CURSOR c12(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ddb_dec
"
"    WHERE htddbd_bu     = p_bu
"
"      AND htddbd_doc_no = c_doc_no;
"
"
"
"   CURSOR c13(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80g_dec
"
"    WHERE htgd_bu     = p_bu
"
"      AND htgd_doc_no = c_doc_no;
"
"
"
"   CURSOR c14(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80e_dec
"
"    WHERE hted_bu     = p_bu
"
"      AND hted_doc_no = c_doc_no;
"
"
"
"   CURSOR c15(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80u_dec
"
"    WHERE htud_bu     = p_bu
"
"      AND htud_doc_no = c_doc_no;
"
"
"
"   CURSOR c16(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_conv_dec
"
"    WHERE htcvd_bu     = p_bu
"
"      AND htcvd_doc_no = c_doc_no;
"
"
"
"   CURSOR c17(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_lta_dec
"
"    WHERE htld_bu     = p_bu
"
"      AND htld_doc_no = c_doc_no;
"
"
"
"   CURSOR c18(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ccd1_dec
"
"    WHERE htccd1d_bu     = p_bu
"
"      AND htccd1d_doc_no = c_doc_no;
"
"
"
"   CURSOR c19(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ccd2_dec
"
"    WHERE htccd2d_bu     = p_bu
"
"      AND htccd2d_doc_no = c_doc_no;
"
"
"
"   CURSOR c20(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_elmnt_calc
"
"    WHERE hthc_bu     = p_bu
"
"      AND hthc_doc_no = c_doc_no;
"
"
"
"   BEGIN
"
"
"
"      IF p_period = 12 THEN
"
"
"
"         /* Start to insert Employee TDS Declaration */
"
"
"
"         FOR cr1 IN c1
"
"         LOOP
"
"
"
"            INSERT INTO hrm_tds_decl_hd_hist(htdhh_bu           ,
"
"                                                                 htdhh_doc_no       ,
"
"                                                                 htdhh_doc_rev_no       ,
"
"                                                                 htdhh_doc_date       ,
"
"                                                                 htdhh_pfx,
"
"                                                                 htdhh_source       ,
"
"                                                                 htdhh_emp_id       ,
"
"                                                                 htdhh_fin_year       ,
"
"                                                                 htdhh_status       ,
"
"                                                                 htdhh_activate_date   ,
"
"                                                                 htdhh_tax_type       ,
"
"                                                                 htdhh_cre_by       ,
"
"                                                                 htdhh_cre_ip_addr       ,
"
"                                                                 htdhh_cre_os_user       ,
"
"                                                                 htdhh_cre_emp_id       ,
"
"                                                                 htdhh_cre_date       ,
"
"                                                                 htdhh_upd_by       ,
"
"                                                                 htdhh_upd_ip_addr       ,
"
"                                                                 htdhh_upd_os_user       ,
"
"                                                                 htdhh_upd_emp_id       ,
"
"                                                                 htdhh_upd_date       )
"
"                                                      VALUES(cr1.htdh_bu       ,            --htdhh_bu
"
"                                                         cr1.htdh_doc_no       ,            --htdhh_doc_no
"
"                                                         cr1.htdh_doc_rev_no   ,            --htdhh_doc_rev_no
"
"                                                         cr1.htdh_doc_date       ,            --htdhh_doc_date
"
"                                                         cr1.htdh_pfx,
"
"                                                         cr1.htdh_source       ,            --htdhh_source
"
"                                                         cr1.htdh_emp_id       ,            --htdhh_emp_id
"
"                                                         cr1.htdh_fin_year       ,            --htdhh_fin_year
"
"                                                         cr1.htdh_status       ,            --htdhh_status
"
"                                                         cr1.htdh_activate_date,            --htdhh_activate_date
"
"                                                         cr1.htdh_tax_type       ,            --htdhh_tax_type
"
"                                                         cr1.htdh_cre_by       ,            --htdhh_cre_by
"
"                                                         cr1.htdh_cre_ip_addr  ,            --htdhh_cre_ip_addr
"
"                                                         cr1.htdh_cre_os_user  ,            --htdhh_cre_os_user
"
"                                                         cr1.htdh_cre_emp_id   ,            --htdhh_cre_emp_id
"
"                                                         cr1.htdh_cre_date       ,             --htdhh_cre_date
"
"                                                         cr1.htdh_upd_by       ,            --htdhh_upd_by
"
"                                                         cr1.htdh_upd_ip_addr  ,            --htdhh_upd_ip_addr
"
"                                                         cr1.htdh_upd_os_user  ,            --htdhh_upd_os_user
"
"                                                         cr1.htdh_upd_emp_id   ,            --htdhh_upd_emp_id
"
"                                                         cr1.htdh_upd_date       );            --htdhh_upd_date
"
"
"
"            FOR cr2 IN c2(cr1.htdh_doc_no, cr1.htdh_doc_rev_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_decl_det_hist(htdldh_bu             ,
"
"                         htdldh_doc_no             ,
"
"                         htdldh_doc_rev_no         ,
"
"                         htdldh_sec10_14_dsc         ,
"
"                         htdldh_sec10_13a_hra         ,
"
"                         htdldh_sec10_13a_hra_type     ,
"
"                         htdldh_sec_80c_ipp         ,
"
"                         htdldh_sec_80c_gpf         ,
"
"                         htdldh_sec_80c_ppf         ,
"
"                         htdldh_sec_80c_ulip         ,
"
"                         htdldh_sec_80c_mf         ,
"
"                         htdldh_sec_80c_nsc         ,
"
"                         htdldh_sec_80c_nss         ,
"
"                         htdldh_sec_80c_ctf1         ,
"
"                         htdldh_sec_80c_ctf2         ,
"
"                         htdldh_sec_80c_tsfd         ,
"
"                         htdldh_sec_80c_sss         ,
"
"                         htdldh_sec_80c_aoei1         ,
"
"                         htdldh_sec_80c_aoei2         ,
"
"                         htdldh_sec_80ccc_ctcpf         ,
"
"                         htdldh_sec_80ccd_nps_sc     ,
"
"                         htdldh_sec_80ccd_nps_ec     ,
"
"                         htdldh_sec_80ccg_rgess         ,
"
"                         htdldh_sec_80d_mip_fmly     ,
"
"                         htdldh_sec_80d_mip_snor1     ,
"
"                         htdldh_sec_80d_mip_par         ,
"
"                         htdldh_sec_80d_mip_snor2     ,
"
"                         htdldh_sec_80dd_med_hd         ,
"
"                         htdldh_sec_80dd_med_hd_type     ,
"
"                         htdldh_sec_80ddb_amt         ,
"
"                         htdldh_sec_80e_edu_loan     ,
"
"                         htdldh_sec_80g_donation     ,
"
"                         htdldh_sec_80u_phy_chlng_flag     ,
"
"                         htdldh_hp_first_hl         ,
"
"                         htdldh_hp_hl_sant_date         ,
"
"                         htdldh_hp_house_cost         ,
"
"                         htdldh_hp_const_comp_3yrs     ,
"
"                         htdldh_hp_hl_sant_amt         ,
"
"                         htdldh_hpso_hl_ip1         ,
"
"                         htdldh_hpso_hl_pp1         ,
"
"                         htdldh_hpso_hl_ip2         ,
"
"                         htdldh_hpso_hl_pp2         ,
"
"                         htdldh_hplo_hl_ip1         ,
"
"                         htdldh_hplo_hl_pp1         ,
"
"                         htdldh_hplo_hl_rr1         ,
"
"                         htdldh_hplo_hl_tp1         ,
"
"                         htdldh_hplo_hl_ip2         ,
"
"                         htdldh_hplo_hl_pp2         ,
"
"                         htdldh_hplo_hl_rr2         ,
"
"                         htdldh_hplo_hl_tp2         ,
"
"                         htdldh_sec10_5_lta         ,
"
"                         htdldh_sec_192b_hp_inc         ,
"
"                         htdldh_sec_192b_oth_inc     ,
"
"                         htdldh_any_oth_income         ,
"
"                         htdldh_cre_by             ,
"
"                         htdldh_cre_ip_addr         ,
"
"                         htdldh_cre_os_user         ,
"
"                         htdldh_cre_emp_id         ,
"
"                         htdldh_cre_date         ,
"
"                         htdldh_upd_by             ,
"
"                         htdldh_upd_ip_addr         ,
"
"                         htdldh_upd_os_user         ,
"
"                         htdldh_upd_emp_id         ,
"
"                         htdldh_upd_date         )
"
"                      VALUES(cr2.htdld_bu             ,            --htdldh_bu
"
"                         cr2.htdld_doc_no         ,            --htdldh_doc_no
"
"                         cr2.htdld_doc_rev_no         ,            --htdldh_doc_rev_no
"
"                         cr2.htdld_sec10_14_dsc         ,            --htdldh_sec10_14_dsc
"
"                         cr2.htdld_sec10_13a_hra     ,            --htdldh_sec10_13a_hra
"
"                         cr2.htdld_sec10_13a_hra_type     ,            --htdldh_sec10_13a_hra_type
"
"                         cr2.htdld_sec_80c_ipp         ,            --htdldh_sec_80c_ipp
"
"                         cr2.htdld_sec_80c_gpf         ,            --htdldh_sec_80c_gpf
"
"                         cr2.htdld_sec_80c_ppf         ,            --htdldh_sec_80c_ppf
"
"                         cr2.htdld_sec_80c_ulip         ,            --htdldh_sec_80c_ulip
"
"                         cr2.htdld_sec_80c_mf         ,            --htdldh_sec_80c_mf
"
"                         cr2.htdld_sec_80c_nsc         ,            --htdldh_sec_80c_nsc
"
"                         cr2.htdld_sec_80c_nss         ,            --htdldh_sec_80c_nss
"
"                         cr2.htdld_sec_80c_ctf1         ,            --htdldh_sec_80c_ctf1
"
"                         cr2.htdld_sec_80c_ctf2         ,            --htdldh_sec_80c_ctf2
"
"                         cr2.htdld_sec_80c_tsfd         ,            --htdldh_sec_80c_tsfd
"
"                         cr2.htdld_sec_80c_sss         ,            --htdldh_sec_80c_sss
"
"                         cr2.htdld_sec_80c_aoei1     ,            --htdldh_sec_80c_aoei1
"
"                         cr2.htdld_sec_80c_aoei2     ,            --htdldh_sec_80c_aoei2
"
"                         cr2.htdld_sec_80ccc_ctcpf     ,            --htdldh_sec_80ccc_ctcpf
"
"                         cr2.htdld_sec_80ccd_nps_sc     ,            --htdldh_sec_80ccd_nps_sc
"
"                         cr2.htdld_sec_80ccd_nps_ec     ,            --htdldh_sec_80ccd_nps_ec
"
"                         cr2.htdld_sec_80ccg_rgess     ,            --htdldh_sec_80ccg_rgess
"
"                         cr2.htdld_sec_80d_mip_fmly     ,            --htdldh_sec_80d_mip_fmly
"
"                         cr2.htdld_sec_80d_mip_snor1     ,            --htdldh_sec_80d_mip_snor1
"
"                         cr2.htdld_sec_80d_mip_par     ,            --htdldh_sec_80d_mip_par
"
"                         cr2.htdld_sec_80d_mip_snor2     ,            --htdldh_sec_80d_mip_snor2
"
"                         cr2.htdld_sec_80dd_med_hd     ,            --htdldh_sec_80dd_med_hd
"
"                         cr2.htdld_sec_80dd_med_hd_type     ,            --htdldh_sec_80dd_med_hd_type
"
"                         cr2.htdld_sec_80ddb_amt     ,            --htdldh_sec_80ddb_amt
"
"                         cr2.htdld_sec_80e_edu_loan     ,            --htdldh_sec_80e_edu_loan
"
"                         cr2.htdld_sec_80g_donation     ,            --htdldh_sec_80g_donation
"
"                         cr2.htdld_sec_80u_phy_chlng_flag,            --htdldh_sec_80u_phy_chlng_flag
"
"                         cr2.htdld_hp_first_hl         ,            --htdldh_hp_first_hl
"
"                         cr2.htdld_hp_hl_sant_date     ,            --htdldh_hp_hl_sant_date
"
"                         cr2.htdld_hp_house_cost     ,            --htdldh_hp_house_cost
"
"                         cr2.htdld_hp_const_comp_3yrs      ,            --htdldh_hp_const_comp_3yrs
"
"                         cr2.htdld_hp_hl_sant_amt     ,            --htdldh_hp_hl_sant_amt
"
"                         cr2.htdld_hpso_hl_ip1         ,            --htdldh_hpso_hl_ip1
"
"                         cr2.htdld_hpso_hl_pp1         ,            --htdldh_hpso_hl_pp1
"
"                         cr2.htdld_hpso_hl_ip2         ,            --htdldh_hpso_hl_ip2
"
"                         cr2.htdld_hpso_hl_pp2         ,            --htdldh_hpso_hl_pp2
"
"                         cr2.htdld_hplo_hl_ip1         ,            --htdldh_hplo_hl_ip1
"
"                         cr2.htdld_hplo_hl_pp1         ,            --htdldh_hplo_hl_pp1
"
"                         cr2.htdld_hplo_hl_rr1         ,            --htdldh_hplo_hl_rr1
"
"                         cr2.htdld_hplo_hl_tp1         ,            --htdldh_hplo_hl_tp1
"
"                         cr2.htdld_hplo_hl_ip2         ,            --htdldh_hplo_hl_ip2
"
"                         cr2.htdld_hplo_hl_pp2         ,            --htdldh_hplo_hl_pp2
"
"                         cr2.htdld_hplo_hl_rr2         ,            --htdldh_hplo_hl_rr2
"
"                         cr2.htdld_hplo_hl_tp2         ,            --htdldh_hplo_hl_tp2
"
"                         cr2.htdld_sec10_5_lta         ,            --htdldh_sec10_5_lta
"
"                         cr2.htdld_sec_192b_hp_inc     ,            --htdldh_sec_192b_hp_inc
"
"                         cr2.htdld_sec_192b_oth_inc     ,            --htdldh_sec_192b_oth_inc
"
"                         cr2.htdld_any_oth_income     ,            --htdldh_any_oth_income
"
"                         cr2.htdld_cre_by         ,            --htdldh_cre_by
"
"                         cr2.htdld_cre_ip_addr         ,            --htdldh_cre_ip_addr
"
"                         cr2.htdld_cre_os_user         ,            --htdldh_cre_os_user
"
"                         cr2.htdld_cre_emp_id         ,            --htdldh_cre_emp_id
"
"                         cr2.htdld_cre_date         ,            --htdldh_cre_date
"
"                         cr2.htdld_upd_by         ,            --htdldh_upd_by
"
"                         cr2.htdld_upd_ip_addr         ,            --htdldh_upd_ip_addr
"
"                         cr2.htdld_upd_os_user         ,            --htdldh_upd_os_user
"
"                         cr2.htdld_upd_emp_id         ,            --htdldh_upd_emp_id
"
"                         cr2.htdld_upd_date         );            --htdldh_upd_date
"
"
"
"            END LOOP c2;
"
"
"
"            FOR cr3 IN c3(cr1.htdh_doc_no, cr1.htdh_doc_rev_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_decl_attach_hist(htdah_bu        ,
"
"                            htdah_doc_no    ,
"
"                            htdah_doc_rev_no    ,
"
"                            htdah_col_name    ,
"
"                            htdah_seq_no    ,
"
"                            htdah_doc_name    ,
"
"                            htdah_file_name    ,
"
"                            htdah_doc        ,
"
"                            htdah_cre_by    ,
"
"                            htdah_cre_ip_addr    ,
"
"                            htdah_cre_os_user    ,
"
"                            htdah_cre_emp_id    ,
"
"                            htdah_cre_date    ,
"
"                            htdah_upd_by    ,
"
"                            htdah_upd_ip_addr    ,
"
"                            htdah_upd_os_user    ,
"
"                            htdah_upd_emp_id    ,
"
"                            htdah_upd_date    )
"
"                         VALUES(cr3.htda_bu        ,            --htdah_bu
"
"                            cr3.htda_doc_no    ,            --htdah_doc_no
"
"                            cr3.htda_doc_rev_no    ,            --htdah_doc_rev_no
"
"                            cr3.htda_col_name    ,            --htdah_col_name
"
"                            cr3.htda_seq_no    ,            --htdah_seq_no
"
"                            cr3.htda_doc_name    ,            --htdah_doc_name
"
"                            cr3.htda_file_name    ,            --htdah_file_name
"
"                            cr3.htda_doc    ,            --htdah_doc
"
"                            cr3.htda_cre_by    ,            --htdah_cre_by
"
"                            cr3.htda_cre_ip_addr,            --htdah_cre_ip_addr
"
"                            cr3.htda_cre_os_user,            --htdah_cre_os_user
"
"                            cr3.htda_cre_emp_id    ,            --htdah_cre_emp_id
"
"                            cr3.htda_cre_date    ,            --htdah_cre_date
"
"                            cr3.htda_upd_by    ,            --htdah_upd_by
"
"                            cr3.htda_upd_ip_addr,            --htdah_upd_ip_addr
"
"                            cr3.htda_upd_os_user,            --htdah_upd_os_user
"
"                            cr3.htda_upd_emp_id    ,            --htdah_upd_emp_id
"
"                            cr3.htda_upd_date    );            --htdah_upd_date
"
"
"
"            END LOOp c3;
"
"
"
"            DELETE
"
"              FROM hrm_tds_decl_attach
"
"             WHERE htda_bu         = p_bu
"
"                 AND htda_doc_no     = cr1.htdh_doc_no
"
"                  AND htda_doc_rev_no = cr1.htdh_doc_rev_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_decl_det
"
"             WHERE htdld_bu         = p_bu
"
"                 AND htdld_doc_no     = cr1.htdh_doc_no
"
"                  AND htdld_doc_rev_no = cr1.htdh_doc_rev_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_decl_hd
"
"             WHERE htdh_bu         = p_bu
"
"                 AND htdh_doc_no     = cr1.htdh_doc_no
"
"                  AND htdh_doc_rev_no = cr1.htdh_doc_rev_no;
"
"
"
"         END LOOP c1;
"
"
"
"         /* End to insert Employee TDS Declaration */
"
"
"
"         /* Start to Insert Employee TDS Calculation */
"
"
"
"         FOR cr4 IN c4
"
"         LOOP
"
"
"
"            INSERT INTO hrm_tds_calc_hd_hist(htchh_bu            ,
"
"                         htchh_doc_no        ,
"
"                         htchh_doc_date        ,
"
"                         htchh_pfx,
"
"                         htchh_emp_id        ,
"
"                         htchh_fin_year        ,
"
"                         htchh_slry_incm        ,
"
"                         htchh_us10_amt        ,
"
"                         htchh_prof_tax        ,
"
"                         htchh_net_sal_incm         ,
"
"                         htchh_hp_incm         ,
"
"                         htchh_oth_incm         ,
"
"                         htchh_gr_incm         ,
"
"                         htchh_vi_a_ded         ,
"
"                         htchh_net_taxbl_incm    ,
"
"                         htchh_tax_amt        ,
"
"                         htchh_rebate        ,
"
"                         htchh_surcharge        ,
"
"                         htchh_shec            ,
"
"                         htchh_tds_ded        ,
"
"                         htchh_yrly_tax_pybl    ,
"
"                         htchh_rmng_mnth        ,
"
"                         htchh_mnth_tds_ded        ,
"
"                         htchh_tot_tax_amt        ,
"
"                         htchh_hold_flag        ,
"
"                         htchh_source        ,
"
"                         htchh_bonus_amt        ,
"
"                         htchh_exgratia_amt        ,
"
"                         htchh_med_rebmnt_amt    ,
"
"                         htchh_others_amt        ,
"
"                         htchh_upd_lta_amt        ,
"
"                         htchh_lta_amt        ,
"
"                         htchh_cre_by        ,
"
"                         htchh_cre_ip_addr        ,
"
"                         htchh_cre_os_user        ,
"
"                         htchh_cre_emp_id        ,
"
"                         htchh_cre_date        ,
"
"                         htchh_upd_by        ,
"
"                         htchh_upd_ip_addr        ,
"
"                         htchh_upd_os_user        ,
"
"                         htchh_upd_emp_id        ,
"
"                         htchh_upd_date        )
"
"                      VALUES(cr4.htch_bu        ,            --htchh_bu
"
"                         cr4.htch_doc_no        ,            --htchh_doc_no
"
"                         cr4.htch_doc_date        ,            --htchh_doc_date
"
"                         cr4.htch_pfx,
"
"                         cr4.htch_emp_id        ,            --htchh_emp_id
"
"                         cr4.htch_fin_year        ,            --htchh_fin_year
"
"                         cr4.htch_slry_incm        ,            --htchh_slry_incm
"
"                         cr4.htch_us10_amt        ,            --htchh_us10_amt
"
"                         cr4.htch_prof_tax        ,            --htchh_prof_tax
"
"                         cr4.htch_net_sal_incm    ,            --htchh_net_sal_incm
"
"                         cr4.htch_hp_incm        ,            --htchh_hp_incm
"
"                         cr4.htch_oth_incm        ,            --htchh_oth_incm
"
"                         cr4.htch_gr_incm        ,            --htchh_gr_incm
"
"                         cr4.htch_vi_a_ded        ,            --htchh_vi_a_ded
"
"                         cr4.htch_net_taxbl_incm    ,            --htchh_net_taxbl_incm
"
"                         cr4.htch_tax_amt        ,            --htchh_tax_amt
"
"                         cr4.htch_rebate        ,            --htchh_rebate
"
"                         cr4.htch_surcharge        ,            --htchh_surcharge
"
"                         cr4.htch_shec        ,            --htchh_shec
"
"                         cr4.htch_tds_ded        ,            --htchh_tds_ded
"
"                         cr4.htch_yrly_tax_pybl    ,            --htchh_yrly_tax_pybl
"
"                         cr4.htch_rmng_mnth        ,            --htchh_rmng_mnth
"
"                         cr4.htch_mnth_tds_ded    ,            --htchh_mnth_tds_ded
"
"                         cr4.htch_tot_tax_amt    ,            --htchh_tot_tax_amt
"
"                         cr4.htch_hold_flag        ,            --htchh_hold_flag
"
"                         cr4.htch_source        ,            --htchh_source
"
"                         cr4.htch_bonus_amt        ,            --htchh_bonus_amt
"
"                         cr4.htch_exgratia_amt    ,            --htchh_exgratia_amt
"
"                         cr4.htch_med_rebmnt_amt    ,            --htchh_med_rebmnt_amt
"
"                         cr4.htch_others_amt    ,            --htchh_others_amt
"
"                         cr4.htch_upd_lta_amt    ,            --htchh_upd_lta_amt
"
"                         cr4.htch_lta_amt        ,            --htchh_lta_amt
"
"                         cr4.htch_cre_by        ,            --htchh_cre_by
"
"                         cr4.htch_cre_ip_addr    ,            --htchh_cre_ip_addr
"
"                         cr4.htch_cre_os_user    ,            --htchh_cre_os_user
"
"                         cr4.htch_cre_emp_id    ,            --htchh_cre_emp_id
"
"                         cr4.htch_cre_date        ,            --htchh_cre_date
"
"                         cr4.htch_upd_by        ,            --htchh_upd_by
"
"                         cr4.htch_upd_ip_addr    ,            --htchh_upd_ip_addr
"
"                         cr4.htch_upd_os_user    ,            --htchh_upd_os_user
"
"                         cr4.htch_upd_emp_id    ,            --htchh_upd_emp_id
"
"                         cr4.htch_upd_date        );            --htchh_upd_date
"
"
"
"            FOR cr5 IN c5(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_calc_pyrl_hist(htcph_bu        ,
"
"                          htcph_doc_no        ,
"
"                          htcph_fin_period    ,
"
"                          htcph_elmnt_id    ,
"
"                          htcph_elmnt_amt    ,
"
"                          htcph_add_ded_type    ,
"
"                          htcph_cre_by        ,
"
"                          htcph_cre_ip_addr    ,
"
"                          htcph_cre_os_user    ,
"
"                          htcph_cre_emp_id    ,
"
"                          htcph_cre_date    ,
"
"                          htcph_upd_by        ,
"
"                          htcph_upd_ip_addr    ,
"
"                          htcph_upd_os_user    ,
"
"                          htcph_upd_emp_id    ,
"
"                          htcph_upd_date    )
"
"                       VALUES(cr5.htcp_bu        ,            --htcph_bu
"
"                          cr5.htcp_doc_no    ,            --htcph_doc_no
"
"                          cr5.htcp_fin_period    ,            --htcph_fin_period
"
"                          cr5.htcp_elmnt_id    ,            --htcph_elmnt_id
"
"                          cr5.htcp_elmnt_amt    ,            --htcph_elmnt_amt
"
"                          cr5.htcp_add_ded_type ,            --htcph_add_ded_type
"
"                          cr5.htcp_cre_by    ,            --htcph_cre_by
"
"                          cr5.htcp_cre_ip_addr    ,            --htcph_cre_ip_addr
"
"                          cr5.htcp_cre_os_user    ,            --htcph_cre_os_user
"
"                          cr5.htcp_cre_emp_id    ,            --htcph_cre_emp_id
"
"                          cr5.htcp_cre_date    ,            --htcph_cre_date
"
"                          cr5.htcp_upd_by    ,            --htcph_upd_by
"
"                          cr5.htcp_upd_ip_addr    ,            --htcph_upd_ip_addr
"
"                          cr5.htcp_upd_os_user    ,            --htcph_upd_os_user
"
"                          cr5.htcp_upd_emp_id    ,            --htcph_upd_emp_id
"
"                          cr5.htcp_upd_date    );            --htcph_upd_date
"
"
"
"            END LOOP c5;
"
"
"
"            FOR cr6 IN c6(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_hra_dec_hist(hthrdh_bu         ,
"
"                        hthrdh_doc_no         ,
"
"                        hthrdh_hra_rcvd         ,
"
"                        hthrdh_metro_flag     ,
"
"                        hthrdh_rent_paid     ,
"
"                        hthrdh_act_rent_paid     ,
"
"                        hthrdh_basic_10_pct     ,
"
"                        hthrdh_basic_40_50_pct     ,
"
"                        hthrdh_excess_paid     ,
"
"                        hthrdh_hra_min         ,
"
"                        hthrdh_act_hra         ,
"
"                        hthrdh_hra_exempt     ,
"
"                        hthrdh_cre_by         ,
"
"                        hthrdh_cre_ip_addr     ,
"
"                        hthrdh_cre_os_user     ,
"
"                        hthrdh_cre_emp_id     ,
"
"                        hthrdh_cre_date         ,
"
"                        hthrdh_upd_by         ,
"
"                        hthrdh_upd_ip_addr     ,
"
"                        hthrdh_upd_os_user     ,
"
"                        hthrdh_upd_emp_id     ,
"
"                        hthrdh_upd_date         )
"
"                     VALUES(cr6.hthrd_bu         ,            --hthrdh_bu
"
"                        cr6.hthrd_doc_no     ,            --hthrdh_doc_no
"
"                        cr6.hthrd_hra_rcvd     ,            --hthrdh_hra_rcvd
"
"                        cr6.hthrd_metro_flag     ,            --hthrdh_metro_flag
"
"                        cr6.hthrd_rent_paid     ,            --hthrdh_rent_paid
"
"                        cr6.hthrd_act_rent_paid     ,            --hthrdh_act_rent_paid
"
"                        cr6.hthrd_basic_10_pct     ,            --hthrdh_basic_10_pct
"
"                        cr6.hthrd_basic_40_50_pct,            --hthrdh_basic_40_50_pct
"
"                        cr6.hthrd_excess_paid     ,            --hthrdh_excess_paid
"
"                        cr6.hthrd_hra_min     ,            --hthrdh_hra_min
"
"                        cr6.hthrd_act_hra     ,            --hthrdh_act_hra
"
"                        cr6.hthrd_hra_exempt     ,            --hthrdh_hra_exempt
"
"                        cr6.hthrd_cre_by     ,            --hthrdh_cre_by
"
"                        cr6.hthrd_cre_ip_addr     ,            --hthrdh_cre_ip_addr
"
"                        cr6.hthrd_cre_os_user     ,            --hthrdh_cre_os_user
"
"                        cr6.hthrd_cre_emp_id     ,            --hthrdh_cre_emp_id
"
"                        cr6.hthrd_cre_date     ,            --hthrdh_cre_date
"
"                        cr6.hthrd_upd_by     ,            --hthrdh_upd_by
"
"                        cr6.hthrd_upd_ip_addr     ,            --hthrdh_upd_ip_addr
"
"                        cr6.hthrd_upd_os_user     ,            --hthrdh_upd_os_user
"
"                        cr6.hthrd_upd_emp_id     ,             --hthrdh_upd_emp_id
"
"                        cr6.hthrd_upd_date     );            --hthrdh_upd_date
"
"
"
"            END LOOP c6;
"
"
"
"            FOR cr7 IN c7(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_house_property_hist( hthph_bu        ,
"
"                                hthph_doc_no        ,
"
"                            hthph_hp_type        ,
"
"                            hthph_seq_no        ,
"
"                            hthph_rent_type        ,
"
"                            hthph_rent_rcvd        ,
"
"                            hthph_house_tax        ,
"
"                            hthph_rr_ht_tot        ,
"
"                            hthph_std_ded        ,
"
"                            hthph_std_int        ,
"
"                            hthph_tot_std_ded    ,
"
"                            hthph_rent_hp_income    ,
"
"                            hthph_self_occup    ,
"
"                            hthph_first_loan    ,
"
"                            hthph_acqu_const_comp    ,
"
"                            hthph_int_paid        ,
"
"                            hthph_cost_of_house    ,
"
"                            hthph_loan_sant_amt    ,
"
"                            hthph_self_hp_income    ,
"
"                            hthph_principal_paid    ,
"
"                            hthph_add_int        ,
"
"                            hthph_int_calc        ,
"
"                            hthph_tot_hp_income    ,
"
"                            hthph_cre_by        ,
"
"                            hthph_cre_ip_addr    ,
"
"                            hthph_cre_os_user    ,
"
"                            hthph_cre_emp_id    ,
"
"                            hthph_cre_date        ,
"
"                            hthph_upd_by        ,
"
"                            hthph_upd_ip_addr    ,
"
"                            hthph_upd_os_user    ,
"
"                            hthph_upd_emp_id    ,
"
"                            hthph_upd_date        )
"
"                         VALUES(cr7.hthp_bu        ,            --hthph_bu
"
"                                cr7.hthp_doc_no        ,            --hthph_doc_no
"
"                            cr7.hthp_hp_type    ,            --hthph_hp_type
"
"                            cr7.hthp_seq_no        ,            --hthph_seq_no
"
"                            cr7.hthp_rent_type    ,            --hthph_rent_type
"
"                            cr7.hthp_rent_rcvd    ,            --hthph_rent_rcvd
"
"                            cr7.hthp_house_tax    ,            --hthph_house_tax
"
"                            cr7.hthp_rr_ht_tot    ,            --hthph_rr_ht_tot
"
"                            cr7.hthp_std_ded    ,            --hthph_std_ded
"
"                            cr7.hthp_std_int    ,            --hthph_std_int
"
"                            cr7.hthp_tot_std_ded    ,            --hthph_tot_std_ded
"
"                            cr7.hthp_rent_hp_income    ,            --hthph_rent_hp_income
"
"                            cr7.hthp_self_occup    ,            --hthph_self_occup
"
"                            cr7.hthp_first_loan    ,            --hthph_first_loan
"
"                            cr7.hthp_acqu_const_comp,            --hthph_acqu_const_comp
"
"                            cr7.hthp_int_paid    ,            --hthph_int_paid
"
"                            cr7.hthp_cost_of_house    ,            --hthph_cost_of_house
"
"                            cr7.hthp_loan_sant_amt    ,            --hthph_loan_sant_amt
"
"                            cr7.hthp_self_hp_income    ,            --hthph_self_hp_income
"
"                            cr7.hthp_principal_paid    ,            --hthph_principal_paid
"
"                            cr7.hthp_add_int    ,            --hthph_add_int
"
"                            cr7.hthp_int_calc    ,            --hthph_int_calc
"
"                            cr7.hthp_tot_hp_income    ,            --hthph_tot_hp_income
"
"                            cr7.hthp_cre_by        ,            --hthph_cre_by
"
"                            cr7.hthp_cre_ip_addr    ,            --hthph_cre_ip_addr
"
"                            cr7.hthp_cre_os_user    ,            --hthph_cre_os_user
"
"                            cr7.hthp_cre_emp_id    ,            --hthph_cre_emp_id
"
"                            cr7.hthp_cre_date    ,            --hthph_cre_date
"
"                            cr7.hthp_upd_by        ,            --hthph_upd_by
"
"                            cr7.hthp_upd_ip_addr    ,            --hthph_upd_ip_addr
"
"                            cr7.hthp_upd_os_user    ,            --hthph_upd_os_user
"
"                            cr7.hthp_upd_emp_id    ,            --hthph_upd_emp_id
"
"                            cr7.hthp_upd_date    );            --hthph_upd_date
"
"
"
"            END LOOP c7;
"
"
"
"            FOR cr8 IN c8(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80c_dec_hist(htcdh_bu         ,
"
"                        htcdh_doc_no         ,
"
"                        htcdh_insur         ,
"
"                        htcdh_ulip         ,
"
"                        htcdh_pf         ,
"
"                        htcdh_mut_fund         ,
"
"                        htcdh_child_edu1     ,
"
"                        htcdh_fdr         ,
"
"                        htcdh_nsc         ,
"
"                        htcdh_gpf         ,
"
"                        htcdh_ppf         ,
"
"                        htcdh_house_rpymnt     ,
"
"                        htcdh_nps         ,
"
"                        htcdh_child_edu2     ,
"
"                        htcdh_nss         ,
"
"                        htcdh_pension_fund     ,
"
"                        htcdh_oth_elgble_80c_1     ,
"
"                        htcdh_oth_elgble_80c_2     ,
"
"                        htcdh_oth_elgble_80c_3     ,
"
"                        htcdh_tot_80c         ,
"
"                        htcdh_act_80c         ,
"
"                        htcdh_cre_by         ,
"
"                        htcdh_cre_ip_addr     ,
"
"                        htcdh_cre_os_user     ,
"
"                        htcdh_cre_emp_id     ,
"
"                        htcdh_cre_date         ,
"
"                        htcdh_upd_by         ,
"
"                        htcdh_upd_ip_addr     ,
"
"                        htcdh_upd_os_user     ,
"
"                        htcdh_upd_emp_id     ,
"
"                        htcdh_upd_date         )
"
"                     VALUES(cr8.htcd_bu         ,            --htcdh_bu
"
"                        cr8.htcd_doc_no         ,            --htcdh_doc_no
"
"                        cr8.htcd_insur         ,            --htcdh_insur
"
"                        cr8.htcd_ulip         ,            --htcdh_ulip
"
"                        cr8.htcd_pf         ,            --htcdh_pf
"
"                        cr8.htcd_mut_fund     ,            --htcdh_mut_fund
"
"                        cr8.htcd_child_edu1     ,            --htcdh_child_edu1
"
"                        cr8.htcd_fdr         ,            --htcdh_fdr
"
"                        cr8.htcd_nsc         ,            --htcdh_nsc
"
"                        cr8.htcd_gpf         ,            --htcdh_gpf
"
"                        cr8.htcd_ppf         ,            --htcdh_ppf
"
"                        cr8.htcd_house_rpymnt     ,            --htcdh_house_rpymnt
"
"                        cr8.htcd_nps         ,            --htcdh_nps
"
"                        cr8.htcd_child_edu2     ,            --htcdh_child_edu2
"
"                        cr8.htcd_nss         ,            --htcdh_nss
"
"                        cr8.htcd_pension_fund     ,            --htcdh_pension_fund
"
"                        cr8.htcd_oth_elgble_80c_1,            --htcdh_oth_elgble_80c_1
"
"                        cr8.htcd_oth_elgble_80c_2,            --htcdh_oth_elgble_80c_2
"
"                        cr8.htcd_oth_elgble_80c_3,            --htcdh_oth_elgble_80c_3
"
"                        cr8.htcd_tot_80c     ,              --htcdh_tot_80c
"
"                        cr8.htcd_act_80c     ,            --htcdh_act_80c
"
"                        cr8.htcd_cre_by         ,            --htcdh_cre_by
"
"                        cr8.htcd_cre_ip_addr     ,            --htcdh_cre_ip_addr
"
"                        cr8.htcd_cre_os_user     ,            --htcdh_cre_os_user
"
"                        cr8.htcd_cre_emp_id     ,            --htcdh_cre_emp_id
"
"                        cr8.htcd_cre_date     ,            --htcdh_cre_date
"
"                        cr8.htcd_upd_by         ,            --htcdh_upd_by
"
"                        cr8.htcd_upd_ip_addr     ,            --htcdh_upd_ip_addr
"
"                        cr8.htcd_upd_os_user     ,            --htcdh_upd_os_user
"
"                        cr8.htcd_upd_emp_id     ,            --htcdh_upd_emp_id
"
"                        cr8.htcd_upd_date     );            --htcdh_upd_date
"
"
"
"            END LOOP c8;
"
"
"
"            FOR cr9 IN c9(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80ccg_dec_hist(htccgdh_bu        ,
"
"                          htccgdh_doc_no    ,
"
"                          htccgdh_rgess_amt    ,
"
"                          htccgdh_yrly_sal    ,
"
"                          htccgdh_ded_amt    ,
"
"                          htccgdh_cre_by    ,
"
"                          htccgdh_cre_ip_addr    ,
"
"                          htccgdh_cre_os_user    ,
"
"                          htccgdh_cre_emp_id    ,
"
"                          htccgdh_cre_date    ,
"
"                          htccgdh_upd_by    ,
"
"                          htccgdh_upd_ip_addr    ,
"
"                          htccgdh_upd_os_user    ,
"
"                          htccgdh_upd_emp_id    ,
"
"                          htccgdh_upd_date    )
"
"                       VALUES(cr9.htccgd_bu        ,            --htccgdh_bu
"
"                          cr9.htccgd_doc_no    ,            --htccgdh_doc_no
"
"                          cr9.htccgd_rgess_amt    ,            --htccgdh_rgess_amt
"
"                          cr9.htccgd_yrly_sal    ,            --htccgdh_yrly_sal
"
"                          cr9.htccgd_ded_amt    ,            --htccgdh_ded_amt
"
"                          cr9.htccgd_cre_by    ,            --htccgdh_cre_by
"
"                          cr9.htccgd_cre_ip_addr,            --htccgdh_cre_ip_addr
"
"                          cr9.htccgd_cre_os_user,            --htccgdh_cre_os_user
"
"                          cr9.htccgd_cre_emp_id    ,            --htccgdh_cre_emp_id
"
"                          cr9.htccgd_cre_date    ,            --htccgdh_cre_date
"
"                          cr9.htccgd_upd_by    ,            --htccgdh_upd_by
"
"                          cr9.htccgd_upd_ip_addr,            --htccgdh_upd_ip_addr
"
"                          cr9.htccgd_upd_os_user,            --htccgdh_upd_os_user
"
"                          cr9.htccgd_upd_emp_id    ,            --htccgdh_upd_emp_id
"
"                          cr9.htccgd_upd_date    );            --htccgdh_upd_date
"
"
"
"            END LOOP c9;
"
"
"
"            FOR cr10 IN c10(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80d_dec_hist(htddh_bu         ,
"
"                        htddh_doc_no         ,
"
"                        htddh_fmly_ip         ,
"
"                        htddh_sc1_ip         ,
"
"                        htddh_fmly_tot_ip    ,
"
"                        htddh_sc1_tot_ip     ,
"
"                        htddh_prnt_ip         ,
"
"                        htddh_sc2_ip         ,
"
"                        htddh_prnt_tot_ip    ,
"
"                        htddh_sc2_tot_ip     ,
"
"                        htddh_fmly_act_ip    ,
"
"                        htddh_sc_act_ip         ,
"
"                        htddh_80d_tot         ,
"
"                        htddh_cre_by          ,
"
"                        htddh_cre_ip_addr    ,
"
"                        htddh_cre_os_user    ,
"
"                        htddh_cre_emp_id     ,
"
"                        htddh_cre_date         ,
"
"                        htddh_upd_by         ,
"
"                        htddh_upd_ip_addr    ,
"
"                        htddh_upd_os_user    ,
"
"                        htddh_upd_emp_id     ,
"
"                        htddh_upd_date         )
"
"                     VALUES(cr10.htdd_bu         ,            --htddh_bu
"
"                        cr10.htdd_doc_no    ,            --htddh_doc_no
"
"                        cr10.htdd_fmly_ip    ,            --htddh_fmly_ip
"
"                        cr10.htdd_sc1_ip    ,            --htddh_sc1_ip
"
"                        cr10.htdd_fmly_tot_ip    ,            --htddh_fmly_tot_ip
"
"                        cr10.htdd_sc1_tot_ip     ,            --htddh_sc1_tot_ip
"
"                        cr10.htdd_prnt_ip    ,            --htddh_prnt_ip
"
"                        cr10.htdd_sc2_ip    ,            --htddh_sc2_ip
"
"                        cr10.htdd_prnt_tot_ip    ,            --htddh_prnt_tot_ip
"
"                        cr10.htdd_sc2_tot_ip     ,            --htddh_sc2_tot_ip
"
"                        cr10.htdd_fmly_act_ip    ,            --htddh_fmly_act_ip
"
"                        cr10.htdd_sc_act_ip    ,            --htddh_sc_act_ip
"
"                        cr10.htdd_80d_tot    ,            --htddh_80d_tot
"
"                        cr10.htdd_cre_by     ,            --htddh_cre_by
"
"                        cr10.htdd_cre_ip_addr    ,            --htddh_cre_ip_addr
"
"                        cr10.htdd_cre_os_user    ,            --htddh_cre_os_user
"
"                        cr10.htdd_cre_emp_id     ,            --htddh_cre_emp_id
"
"                        cr10.htdd_cre_date    ,            --htddh_cre_date
"
"                        cr10.htdd_upd_by    ,            --htddh_upd_by
"
"                        cr10.htdd_upd_ip_addr    ,            --htddh_upd_ip_addr
"
"                        cr10.htdd_upd_os_user    ,            --htddh_upd_os_user
"
"                        cr10.htdd_upd_emp_id     ,            --htddh_upd_emp_id
"
"                        cr10.htdd_upd_date    );            --htddh_upd_date
"
"
"
"            END LOOP c10;
"
"
"
"            FOR cr11 IN c11(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80dd_dec_hist(htdddh_bu        ,
"
"                         htdddh_doc_no        ,
"
"                         htdddh_type        ,
"
"                         htdddh_tot_expns    ,
"
"                         htdddh_act_expns    ,
"
"                         htdddh_cre_by        ,
"
"                         htdddh_cre_ip_addr    ,
"
"                         htdddh_cre_os_user    ,
"
"                         htdddh_cre_emp_id    ,
"
"                         htdddh_cre_date    ,
"
"                         htdddh_upd_by        ,
"
"                         htdddh_upd_ip_addr    ,
"
"                         htdddh_upd_os_user    ,
"
"                         htdddh_upd_emp_id    ,
"
"                         htdddh_upd_date    )
"
"                      VALUES(cr11.htddd_bu        ,            --htdddh_bu
"
"                         cr11.htddd_doc_no    ,            --htdddh_doc_no
"
"                         cr11.htddd_type    ,            --htdddh_type
"
"                         cr11.htddd_tot_expns    ,            --htdddh_tot_expns
"
"                         cr11.htddd_act_expns    ,            --htdddh_act_expns
"
"                         cr11.htddd_cre_by    ,            --htdddh_cre_by
"
"                         cr11.htddd_cre_ip_addr    ,            --htdddh_cre_ip_addr
"
"                         cr11.htddd_cre_os_user    ,            --htdddh_cre_os_user
"
"                         cr11.htddd_cre_emp_id    ,            --htdddh_cre_emp_id
"
"                         cr11.htddd_cre_date    ,            --htdddh_cre_date
"
"                         cr11.htddd_upd_by    ,            --htdddh_upd_by
"
"                         cr11.htddd_upd_ip_addr    ,            --htdddh_upd_ip_addr
"
"                         cr11.htddd_upd_os_user    ,            --htdddh_upd_os_user
"
"                         cr11.htddd_upd_emp_id    ,            --htdddh_upd_emp_id
"
"                         cr11.htddd_upd_date    );            --htdddh_upd_date
"
"
"
"            END LOOP c11;
"
"
"
"            FOR cr12 IN c12(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80ddb_dec_hist(htddbdh_bu         ,
"
"                          htddbdh_doc_no     ,
"
"                          htddbdh_tot_expns     ,
"
"                          htddbdh_act_expns     ,
"
"                          htddbdh_cre_by     ,
"
"                          htddbdh_cre_ip_addr     ,
"
"                          htddbdh_cre_os_user     ,
"
"                          htddbdh_cre_emp_id     ,
"
"                          htddbdh_cre_date     ,
"
"                          htddbdh_upd_by     ,
"
"                          htddbdh_upd_ip_addr     ,
"
"                          htddbdh_upd_os_user     ,
"
"                          htddbdh_upd_emp_id     ,
"
"                          htddbdh_upd_date     )
"
"                       VALUES(cr12.htddbd_bu     ,                --htddbdh_bu
"
"                          cr12.htddbd_doc_no     ,                --htddbdh_doc_no
"
"                          cr12.htddbd_tot_expns     ,                --htddbdh_tot_expns
"
"                          cr12.htddbd_act_expns     ,                --htddbdh_act_expns
"
"                          cr12.htddbd_cre_by     ,                --htddbdh_cre_by
"
"                          cr12.htddbd_cre_ip_addr,                --htddbdh_cre_ip_addr
"
"                          cr12.htddbd_cre_os_user,                --htddbdh_cre_os_user
"
"                          cr12.htddbd_cre_emp_id ,                --htddbdh_cre_emp_id
"
"                          cr12.htddbd_cre_date     ,                --htddbdh_cre_date
"
"                          cr12.htddbd_upd_by     ,                --htddbdh_upd_by
"
"                          cr12.htddbd_upd_ip_addr,                --htddbdh_upd_ip_addr
"
"                          cr12.htddbd_upd_os_user,                --htddbdh_upd_os_user
"
"                          cr12.htddbd_upd_emp_id ,                --htddbdh_upd_emp_id
"
"                          cr12.htddbd_upd_date     );                --htddbdh_upd_date
"
"
"
"            END LOOP c12;
"
"
"
"            FOR cr13 IN c13(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80g_dec_hist(htgdh_bu        ,
"
"                        htgdh_doc_no        ,
"
"                        htgdh_donation_amt    ,
"
"                        htgdh_exempt_amt    ,
"
"                        htgdh_cre_by        ,
"
"                        htgdh_cre_ip_addr    ,
"
"                        htgdh_cre_os_user    ,
"
"                        htgdh_cre_emp_id    ,
"
"                        htgdh_cre_date        ,
"
"                        htgdh_upd_by        ,
"
"                        htgdh_upd_ip_addr    ,
"
"                        htgdh_upd_os_user    ,
"
"                        htgdh_upd_emp_id    ,
"
"                        htgdh_upd_date        )
"
"                     VALUES(cr13.htgd_bu        ,            --htgdh_bu
"
"                        cr13.htgd_doc_no    ,            --htgdh_doc_no
"
"                        cr13.htgd_donation_amt    ,            --htgdh_donation_amt
"
"                        cr13.htgd_exempt_amt    ,            --htgdh_exempt_amt
"
"                        cr13.htgd_cre_by    ,            --htgdh_cre_by
"
"                        cr13.htgd_cre_ip_addr    ,            --htgdh_cre_ip_addr
"
"                        cr13.htgd_cre_os_user    ,            --htgdh_cre_os_user
"
"                        cr13.htgd_cre_emp_id    ,            --htgdh_cre_emp_id
"
"                        cr13.htgd_cre_date    ,            --htgdh_cre_date
"
"                        cr13.htgd_upd_by    ,            --htgdh_upd_by
"
"                        cr13.htgd_upd_ip_addr    ,            --htgdh_upd_ip_addr
"
"                        cr13.htgd_upd_os_user    ,            --htgdh_upd_os_user
"
"                        cr13.htgd_upd_emp_id    ,            --htgdh_upd_emp_id
"
"                        cr13.htgd_upd_date    );            --htgdh_upd_date
"
"
"
"            END LOOP c13;
"
"
"
"            FOR cr14 IN c14(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80e_dec_hist(htedh_bu        ,
"
"                        htedh_doc_no        ,
"
"                        htedh_edu_loan_int    ,
"
"                        htedh_cre_by        ,
"
"                        htedh_cre_ip_addr    ,
"
"                        htedh_cre_os_user    ,
"
"                        htedh_cre_emp_id    ,
"
"                        htedh_cre_date        ,
"
"                        htedh_upd_by        ,
"
"                        htedh_upd_ip_addr    ,
"
"                        htedh_upd_os_user    ,
"
"                        htedh_upd_emp_id    ,
"
"                        htedh_upd_date        )
"
"                     VALUES(cr14.hted_bu        ,            --htedh_bu
"
"                        cr14.hted_doc_no    ,            --htedh_doc_no
"
"                        cr14.hted_edu_loan_int    ,            --htedh_edu_loan_int
"
"                        cr14.hted_cre_by    ,            --htedh_cre_by
"
"                        cr14.hted_cre_ip_addr    ,            --htedh_cre_ip_addr
"
"                        cr14.hted_cre_os_user    ,            --htedh_cre_os_user
"
"                        cr14.hted_cre_emp_id    ,            --htedh_cre_emp_id
"
"                        cr14.hted_cre_date    ,            --htedh_cre_date
"
"                        cr14.hted_upd_by    ,            --htedh_upd_by
"
"                        cr14.hted_upd_ip_addr    ,            --htedh_upd_ip_addr
"
"                        cr14.hted_upd_os_user    ,            --htedh_upd_os_user
"
"                        cr14.hted_upd_emp_id    ,            --htedh_upd_emp_id
"
"                        cr14.hted_upd_date    );            --htedh_upd_date
"
"
"
"            END LOOP c14;
"
"
"
"            FOR cr15 IN c15(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80u_dec_hist(htudh_bu            ,
"
"                        htudh_doc_no            ,
"
"                        htudh_prmnt_phy_chlng_flag    ,
"
"                        htudh_tot_amt            ,
"
"                        htudh_qualify_amt        ,
"
"                        htudh_cre_by            ,
"
"                        htudh_cre_ip_addr        ,
"
"                        htudh_cre_os_user        ,
"
"                        htudh_cre_emp_id        ,
"
"                        htudh_cre_date            ,
"
"                        htudh_upd_by            ,
"
"                        htudh_upd_ip_addr        ,
"
"                        htudh_upd_os_user        ,
"
"                        htudh_upd_emp_id        ,
"
"                        htudh_upd_date            )
"
"                     VALUES(cr15.htud_bu            ,            --htudh_bu
"
"                        cr15.htud_doc_no        ,            --htudh_doc_no
"
"                        cr15.htud_prmnt_phy_chlng_flag    ,            --htudh_prmnt_phy_chlng_flag
"
"                        cr15.hted_tot_amt        ,            --htudh_tot_amt
"
"                        cr15.hted_qualify_amt        ,            --htudh_qualify_amt
"
"                        cr15.htud_cre_by        ,            --htudh_cre_by
"
"                        cr15.htud_cre_ip_addr        ,            --htudh_cre_ip_addr
"
"                        cr15.htud_cre_os_user        ,            --htudh_cre_os_user
"
"                        cr15.htud_cre_emp_id        ,            --htudh_cre_emp_id
"
"                        cr15.htud_cre_date        ,            --htudh_cre_date
"
"                        cr15.htud_upd_by        ,            --htudh_upd_by
"
"                        cr15.htud_upd_ip_addr        ,            --htudh_upd_ip_addr
"
"                        cr15.htud_upd_os_user        ,            --htudh_upd_os_user
"
"                        cr15.htud_upd_emp_id        ,            --htudh_upd_emp_id
"
"                        cr15.htud_upd_date        );            --htudh_upd_date
"
"
"
"            END LOOP c15;
"
"
"
"            FOR cr16 IN c16(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_conv_dec_hist(htcvdh_bu        ,
"
"                         htcvdh_doc_no        ,
"
"                         htcvdh_conv_rcvd    ,
"
"                         htcvdh_ds_conv        ,
"
"                         htcvdh_30p_ds_conv    ,
"
"                         htcvdh_tot_conv    ,
"
"                         htcvdh_act_conv    ,
"
"                         htcvdh_cre_by        ,
"
"                         htcvdh_cre_ip_addr    ,
"
"                         htcvdh_cre_os_user    ,
"
"                         htcvdh_cre_emp_id    ,
"
"                         htcvdh_cre_date    ,
"
"                         htcvdh_upd_by        ,
"
"                         htcvdh_upd_ip_addr    ,
"
"                         htcvdh_upd_os_user    ,
"
"                         htcvdh_upd_emp_id    ,
"
"                         htcvdh_upd_date    )
"
"                      VALUES(cr16.htcvd_bu        ,            --htcvdh_bu
"
"                         cr16.htcvd_doc_no    ,            --htcvdh_doc_no
"
"                         cr16.htcvd_conv_rcvd    ,            --htcvdh_conv_rcvd
"
"                         cr16.htcvd_ds_conv    ,            --htcvdh_ds_conv
"
"                         cr16.htcvd_30p_ds_conv    ,            --htcvdh_30p_ds_conv
"
"                         cr16.htcvd_tot_conv    ,            --htcvdh_tot_conv
"
"                         cr16.htcvd_act_conv    ,            --htcvdh_act_conv
"
"                         cr16.htcvd_cre_by    ,            --htcvdh_cre_by
"
"                         cr16.htcvd_cre_ip_addr    ,            --htcvdh_cre_ip_addr
"
"                         cr16.htcvd_cre_os_user    ,            --htcvdh_cre_os_user
"
"                         cr16.htcvd_cre_emp_id    ,            --htcvdh_cre_emp_id
"
"                         cr16.htcvd_cre_date    ,            --htcvdh_cre_date
"
"                         cr16.htcvd_upd_by    ,            --htcvdh_upd_by
"
"                         cr16.htcvd_upd_ip_addr    ,            --htcvdh_upd_ip_addr
"
"                         cr16.htcvd_upd_os_user    ,            --htcvdh_upd_os_user
"
"                         cr16.htcvd_upd_emp_id    ,            --htcvdh_upd_emp_id
"
"                         cr16.htcvd_upd_date    );            --htcvdh_upd_date
"
"
"
"            END LOOP c16;
"
"
"
"            FOR cr17 IN c17(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_lta_dec_hist(htldh_bu        ,
"
"                        htldh_doc_no        ,
"
"                        htldh_lta_limit        ,
"
"                        htldh_empr_lta_amt    ,
"
"                        htldh_decl_lta_amt    ,
"
"                        htldh_act_lta_amt    ,
"
"                        htldh_cre_by        ,
"
"                        htldh_cre_date        ,
"
"                        htldh_upd_by        ,
"
"                        htldh_upd_date        )
"
"                     VALUES(cr17.htld_bu        ,            --htldh_bu
"
"                        cr17.htld_doc_no    ,            --htldh_doc_no
"
"                        cr17.htld_lta_limit    ,            --htldh_lta_limit
"
"                        cr17.htld_empr_lta_amt    ,            --htldh_empr_lta_amt
"
"                        cr17.htld_decl_lta_amt    ,            --htldh_decl_lta_amt
"
"                        cr17.htld_act_lta_amt    ,            --htldh_act_lta_amt
"
"                        cr17.htld_cre_by    ,            --htldh_cre_by
"
"                        cr17.htld_cre_date    ,            --htldh_cre_date
"
"                        cr17.htld_upd_by    ,            --htldh_upd_by
"
"                        cr17.htld_upd_date    );            --htldh_upd_date
"
"
"
"            END LOOP c17;
"
"
"
"            FOR cr18 IN c18(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80ccd1_dec_hist(htccd1dh_bu           ,
"
"                           htccd1dh_doc_no       ,
"
"                           htccd1dh_80ccd_amt       ,
"
"                           htccd1dh_80c_amt       ,
"
"                           htccd1dh_80ccd_act       ,
"
"                           htccd1dh_cre_by       ,
"
"                           htccd1dh_cre_ip_addr       ,
"
"                           htccd1dh_cre_os_user       ,
"
"                           htccd1dh_cre_emp_id       ,
"
"                           htccd1dh_cre_date       ,
"
"                           htccd1dh_upd_by       ,
"
"                           htccd1dh_upd_ip_addr       ,
"
"                           htccd1dh_upd_os_user       ,
"
"                           htccd1dh_upd_emp_id       ,
"
"                           htccd1dh_upd_date        )
"
"                        VALUES(cr18.htccd1d_bu       ,            --htccd1dh_bu
"
"                           cr18.htccd1d_doc_no       ,             --htccd1dh_doc_no
"
"                           cr18.htccd1d_80ccd_amt  ,            --htccd1dh_80ccd_amt
"
"                           cr18.htccd1d_80c_amt       ,            --htccd1dh_80c_amt
"
"                           cr18.htccd1d_80ccd_act  ,            --htccd1dh_80ccd_act
"
"                           cr18.htccd1d_cre_by       ,            --htccd1dh_cre_by
"
"                           cr18.htccd1d_cre_ip_addr,            --htccd1dh_cre_ip_addr
"
"                           cr18.htccd1d_cre_os_user,            --htccd1dh_cre_os_user
"
"                           cr18.htccd1d_cre_emp_id ,            --htccd1dh_cre_emp_id
"
"                           cr18.htccd1d_cre_date   ,            --htccd1dh_cre_date
"
"                           cr18.htccd1d_upd_by       ,            --htccd1dh_upd_by
"
"                           cr18.htccd1d_upd_ip_addr,            --htccd1dh_upd_ip_addr
"
"                           cr18.htccd1d_upd_os_user,            --htccd1dh_upd_os_user
"
"                           cr18.htccd1d_upd_emp_id ,            --htccd1dh_upd_emp_id
"
"                           cr18.htccd1d_upd_date   );            --htccd1dh_upd_date
"
"
"
"            END LOOP c18;
"
"
"
"            FOR cr19 IN c19(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_80ccd2_dec_hist(htccd2dh_bu           ,
"
"                           htccd2dh_doc_no       ,
"
"                           htccd2dh_type       ,
"
"                           htccd2dh_yrly_sal       ,
"
"                           htccd2dh_act_amt       ,
"
"                           htccd2dh_cre_by       ,
"
"                           htccd2dh_cre_ip_addr       ,
"
"                           htccd2dh_cre_os_user       ,
"
"                           htccd2dh_cre_emp_id       ,
"
"                           htccd2dh_cre_date       ,
"
"                           htccd2dh_upd_by       ,
"
"                           htccd2dh_upd_ip_addr       ,
"
"                           htccd2dh_upd_os_user       ,
"
"                           htccd2dh_upd_emp_id       ,
"
"                           htccd2dh_upd_date       )
"
"                        VALUES(cr19.htccd2d_bu       ,            --htccd2dh_bu
"
"                           cr19.htccd2d_doc_no       ,            --htccd2dh_doc_no
"
"                           cr19.htccd2d_type       ,            --htccd2dh_type
"
"                           cr19.htccd2d_yrly_sal   ,            --htccd2dh_yrly_sal
"
"                           cr19.htccd2d_act_amt       ,            --htccd2dh_act_amt
"
"                           cr19.htccd2d_cre_by       ,            --htccd2dh_cre_by
"
"                           cr19.htccd2d_cre_ip_addr,            --htccd2dh_cre_ip_addr
"
"                           cr19.htccd2d_cre_os_user,            --htccd2dh_cre_os_user
"
"                           cr19.htccd2d_cre_emp_id ,            --htccd2dh_cre_emp_id
"
"                           cr19.htccd2d_cre_date   ,             --htccd2dh_cre_date
"
"                           cr19.htccd2d_upd_by       ,            --htccd2dh_upd_by
"
"                           cr19.htccd2d_upd_ip_addr,            --htccd2dh_upd_ip_addr
"
"                           cr19.htccd2d_upd_os_user,            --htccd2dh_upd_os_user
"
"                           cr19.htccd2d_upd_emp_id ,            --htccd2dh_upd_emp_id
"
"                           cr19.htccd2d_upd_date   );            --htccd2dh_upd_date
"
"
"
"            END LOOP c19;
"
"
"
"            FOR cr20 IN c20(cr4.htch_doc_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_elmnt_calc_hist(hthch_bu        ,
"
"                           hthch_doc_no        ,
"
"                           hthch_elmnt_id    ,
"
"                           hthch_ref        ,
"
"                           hthch_amt        ,
"
"                           hthch_calc_flag    ,
"
"                           hthch_cre_by        ,
"
"                           hthch_cre_ip_addr    ,
"
"                           hthch_cre_os_user    ,
"
"                           hthch_cre_emp_id    ,
"
"                           hthch_cre_date    ,
"
"                           hthch_upd_by        ,
"
"                           hthch_upd_ip_addr    ,
"
"                           hthch_upd_os_user    ,
"
"                           hthch_upd_emp_id    ,
"
"                           hthch_upd_date    )
"
"                        VALUES(cr20.hthc_bu        ,            --hthch_bu
"
"                           cr20.hthc_doc_no    ,            --hthch_doc_no
"
"                           cr20.hthc_elmnt_id    ,            --hthch_elmnt_id
"
"                           cr20.hthc_ref    ,            --hthch_ref
"
"                           cr20.hthc_amt    ,            --hthch_amt
"
"                           cr20.hthc_calc_flag    ,            --hthch_calc_flag
"
"                           cr20.hthc_cre_by    ,            --hthch_cre_by
"
"                           cr20.hthc_cre_ip_addr,            --hthch_cre_ip_addr
"
"                           cr20.hthc_cre_os_user,            --hthch_cre_os_user
"
"                           cr20.hthc_cre_emp_id    ,            --hthch_cre_emp_id
"
"                           cr20.hthc_cre_date    ,            --hthch_cre_date
"
"                           cr20.hthc_upd_by    ,            --hthch_upd_by
"
"                           cr20.hthc_upd_ip_addr,            --hthch_upd_ip_addr
"
"                           cr20.hthc_upd_os_user,            --hthch_upd_os_user
"
"                           cr20.hthc_upd_emp_id    ,            --hthch_upd_emp_id
"
"                           cr20.hthc_upd_date    );            --hthch_upd_date
"
"
"
"            END LOOP c20;
"
"
"
"            DELETE
"
"              FROM hrm_tds_elmnt_calc
"
"         WHERE hthc_bu     = p_bu
"
"               AND hthc_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccd2_dec
"
"         WHERE htccd2d_bu     = p_bu
"
"               AND htccd2d_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccd1_dec
"
"         WHERE htccd1d_bu     = p_bu
"
"               AND htccd1d_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_lta_dec
"
"         WHERE htld_bu     = p_bu
"
"               AND htld_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_conv_dec
"
"         WHERE htcvd_bu     = p_bu
"
"               AND htcvd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80u_dec
"
"         WHERE htud_bu     = p_bu
"
"               AND htud_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80e_dec
"
"         WHERE hted_bu     = p_bu
"
"               AND hted_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80g_dec
"
"         WHERE htgd_bu     = p_bu
"
"               AND htgd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ddb_dec
"
"         WHERE htddbd_bu     = p_bu
"
"               AND htddbd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80dd_dec
"
"         WHERE htddd_bu     = p_bu
"
"               AND htddd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80d_dec
"
"         WHERE htdd_bu     = p_bu
"
"               AND htdd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccg_dec
"
"         WHERE htccgd_bu     = p_bu
"
"               AND htccgd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80c_dec
"
"         WHERE htcd_bu     = p_bu
"
"               AND htcd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_house_property
"
"         WHERE hthp_bu     = p_bu
"
"               AND hthp_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_hra_dec
"
"         WHERE hthrd_bu     = p_bu
"
"               AND hthrd_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_calc_pyrl
"
"         WHERE htcp_bu     = p_bu
"
"               AND htcp_doc_no = cr4.htch_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_calc_hd
"
"         WHERE htch_bu     = p_bu
"
"               AND htch_doc_no = cr4.htch_doc_no;
"
"
"
"         END LOOP c4;
"
"
"
"         /* End to Insert Employee TDS Calculation */
"
"
"
"      END IF;
"
"
"
"   END proc_insert_emp_tds_hist;
"
"
"
"   PROCEDURE proc_reverse_emp_tds_hist(p_bu                VARCHAR2,
"
"                           p_emp_id                VARCHAR2,
"
"                           p_year                NUMBER,
"
"                           p_period                NUMBER,
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
"     FROM hrm_tds_decl_hd_hist
"
"    WHERE htdhh_bu       = p_bu
"
"      AND htdhh_emp_id   = p_emp_id
"
"      AND htdhh_fin_year = p_year;
"
"
"
"   CURSOR c2(c_doc_no            VARCHAR2,
"
"            c_doc_rev_no        NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_det_hist
"
"    WHERE htdldh_bu         = p_bu
"
"      AND htdldh_doc_no     = c_doc_no
"
"      AND htdldh_doc_rev_no = c_doc_rev_no;
"
"
"
"   CURSOR c3(c_doc_no            VARCHAR2,
"
"            c_doc_rev_no        NUMBER)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_decl_attach_hist
"
"    WHERE htdah_bu         = p_bu
"
"      AND htdah_doc_no     = c_doc_no
"
"      AND htdah_doc_rev_no = c_doc_rev_no;
"
"
"
"   CURSOR c4
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_hd_hist
"
"    WHERE htchh_bu       = p_bu
"
"      AND htchh_emp_id   = p_emp_id
"
"      AND htchh_fin_year = p_year;
"
"
"
"   CURSOR c5(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_calc_pyrl_hist
"
"    WHERE htcph_bu     = p_bu
"
"      AND htcph_doc_no = c_doc_no;
"
"
"
"   CURSOR c6(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_hra_dec_hist
"
"    WHERE hthrdh_bu     = p_bu
"
"      AND hthrdh_doc_no = c_doc_no;
"
"
"
"   CURSOR c7(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_house_property_hist
"
"    WHERE hthph_bu     = p_bu
"
"      AND hthph_doc_no = c_doc_no;
"
"
"
"   CURSOR c8(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80c_dec_hist
"
"    WHERE htcdh_bu     = p_bu
"
"      AND htcdh_doc_no = c_doc_no;
"
"
"
"   CURSOR c9(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ccg_dec_hist
"
"    WHERE htccgdh_bu     = p_bu
"
"      AND htccgdh_doc_no = c_doc_no;
"
"
"
"   CURSOR c10(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80d_dec_hist
"
"    WHERE htddh_bu     = p_bu
"
"      AND htddh_doc_no = c_doc_no;
"
"
"
"   CURSOR c11(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80dd_dec_hist
"
"    WHERE htdddh_bu     = p_bu
"
"      AND htdddh_doc_no = c_doc_no;
"
"
"
"   CURSOR c12(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ddb_dec_hist
"
"    WHERE htddbdh_bu     = p_bu
"
"      AND htddbdh_doc_no = c_doc_no;
"
"
"
"   CURSOR c13(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80g_dec_hist
"
"    WHERE htgdh_bu     = p_bu
"
"      AND htgdh_doc_no = c_doc_no;
"
"
"
"   CURSOR c14(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80e_dec_hist
"
"    WHERE htedh_bu     = p_bu
"
"      AND htedh_doc_no = c_doc_no;
"
"
"
"   CURSOR c15(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80u_dec_hist
"
"    WHERE htudh_bu     = p_bu
"
"      AND htudh_doc_no = c_doc_no;
"
"
"
"   CURSOR c16(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_conv_dec_hist
"
"    WHERE htcvdh_bu     = p_bu
"
"      AND htcvdh_doc_no = c_doc_no;
"
"
"
"   CURSOR c17(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_lta_dec_hist
"
"    WHERE htldh_bu     = p_bu
"
"      AND htldh_doc_no = c_doc_no;
"
"
"
"   CURSOR c18(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ccd1_dec_hist
"
"    WHERE htccd1dh_bu     = p_bu
"
"      AND htccd1dh_doc_no = c_doc_no;
"
"
"
"   CURSOR c19(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_80ccd2_dec_hist
"
"    WHERE htccd2dh_bu     = p_bu
"
"      AND htccd2dh_doc_no = c_doc_no;
"
"
"
"   CURSOR c20(c_doc_no            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM hrm_tds_elmnt_calc_hist
"
"    WHERE hthch_bu     = p_bu
"
"      AND hthch_doc_no = c_doc_no;
"
"
"
"   BEGIN
"
"
"
"      IF p_period = 12 THEN
"
"
"
"         /* Start to insert Employee TDS Declaration */
"
"
"
"         FOR cr1 IN c1
"
"         LOOP
"
"
"
"            INSERT INTO hrm_tds_decl_hd(htdh_bu               ,
"
"                    htdh_doc_no           ,
"
"                        htdh_doc_rev_no           ,
"
"                        htdh_doc_date           ,
"
"                        htdh_source           ,
"
"                        htdh_emp_id           ,
"
"                        htdh_fin_year           ,
"
"                        htdh_status           ,
"
"                        htdh_activate_date     ,
"
"                        htdh_tax_type           ,
"
"                        htdh_cre_by           ,
"
"                        htdh_cre_ip_addr       ,
"
"                        htdh_cre_os_user       ,
"
"                        htdh_cre_emp_id           ,
"
"                        htdh_cre_date           ,
"
"                        htdh_upd_by           ,
"
"                        htdh_upd_ip_addr       ,
"
"                        htdh_upd_os_user       ,
"
"                        htdh_upd_emp_id           ,
"
"                        htdh_upd_date           )
"
"                     VALUES(cr1.htdhh_bu           ,            --htdh_bu
"
"                        cr1.htdhh_doc_no       ,             --htdh_doc_no
"
"                        cr1.htdhh_doc_rev_no   ,            --htdh_doc_rev_no
"
"                        cr1.htdhh_doc_date     ,            --htdh_doc_date
"
"                        cr1.htdhh_source       ,            --htdh_source
"
"                        cr1.htdhh_emp_id       ,            --htdh_emp_id
"
"                        cr1.htdhh_fin_year     ,            --htdh_fin_year
"
"                        cr1.htdhh_status       ,            --htdh_status
"
"                        cr1.htdhh_activate_date,            --htdh_activate_date
"
"                        cr1.htdhh_tax_type     ,            --htdh_tax_type
"
"                        cr1.htdhh_cre_by       ,            --htdh_cre_by
"
"                        cr1.htdhh_cre_ip_addr  ,            --htdh_cre_ip_addr
"
"                        cr1.htdhh_cre_os_user  ,            --htdh_cre_os_user
"
"                        cr1.htdhh_cre_emp_id   ,            --htdh_cre_emp_id
"
"                        cr1.htdhh_cre_date     ,             --htdh_cre_date
"
"                        cr1.htdhh_upd_by       ,            --htdh_upd_by
"
"                        cr1.htdhh_upd_ip_addr  ,            --htdh_upd_ip_addr
"
"                        cr1.htdhh_upd_os_user  ,            --htdh_upd_os_user
"
"                        cr1.htdhh_upd_emp_id   ,            --htdh_upd_emp_id
"
"                        cr1.htdhh_upd_date     );            --htdh_upd_date
"
"
"
"            FOR cr2 IN c2(cr1.htdhh_doc_no, cr1.htdhh_doc_rev_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_decl_det(htdld_bu                     ,
"
"                        htdld_doc_no         ,
"
"                            htdld_doc_rev_no             ,
"
"                        htdld_sec10_14_dsc             ,
"
"                            htdld_sec10_13a_hra             ,
"
"                            htdld_sec10_13a_hra_type     ,
"
"                        htdld_sec_80c_ipp             ,
"
"                        htdld_sec_80c_gpf             ,
"
"                        htdld_sec_80c_ppf             ,
"
"                            htdld_sec_80c_ulip             ,
"
"                            htdld_sec_80c_mf             ,
"
"                            htdld_sec_80c_nsc             ,
"
"                            htdld_sec_80c_nss             ,
"
"                            htdld_sec_80c_ctf1             ,
"
"                        htdld_sec_80c_ctf2             ,
"
"                        htdld_sec_80c_tsfd             ,
"
"                        htdld_sec_80c_sss             ,
"
"                        htdld_sec_80c_aoei1             ,
"
"                        htdld_sec_80c_aoei2             ,
"
"                        htdld_sec_80ccc_ctcpf     ,
"
"                        htdld_sec_80ccd_nps_sc       ,
"
"                        htdld_sec_80ccd_nps_ec       ,
"
"                        htdld_sec_80ccg_rgess        ,
"
"                        htdld_sec_80d_mip_fmly       ,
"
"                        htdld_sec_80d_mip_snor1      ,
"
"                        htdld_sec_80d_mip_par        ,
"
"                        htdld_sec_80d_mip_snor2      ,
"
"                        htdld_sec_80dd_med_hd        ,
"
"                        htdld_sec_80dd_med_hd_type   ,
"
"                        htdld_sec_80ddb_amt             ,
"
"                        htdld_sec_80e_edu_loan       ,
"
"                        htdld_sec_80g_donation       ,
"
"                        htdld_sec_80u_phy_chlng_flag ,
"
"                        htdld_hp_first_hl             ,
"
"                        htdld_hp_hl_sant_date     ,
"
"                        htdld_hp_house_cost             ,
"
"                        htdld_hp_const_comp_3yrs     ,
"
"                        htdld_hp_hl_sant_amt     ,
"
"                        htdld_hpso_hl_ip1             ,
"
"                        htdld_hpso_hl_pp1             ,
"
"                            htdld_hpso_hl_ip2             ,
"
"                        htdld_hpso_hl_pp2             ,
"
"                        htdld_hplo_hl_ip1             ,
"
"                        htdld_hplo_hl_pp1             ,
"
"                            htdld_hplo_hl_rr1             ,
"
"                        htdld_hplo_hl_tp1             ,
"
"                        htdld_hplo_hl_ip2             ,
"
"                        htdld_hplo_hl_pp2             ,
"
"                        htdld_hplo_hl_rr2             ,
"
"                        htdld_hplo_hl_tp2             ,
"
"                        htdld_sec10_5_lta             ,
"
"                        htdld_sec_192b_hp_inc     ,
"
"                        htdld_sec_192b_oth_inc     ,
"
"                        htdld_any_oth_income     ,
"
"                        htdld_cre_by         ,
"
"                        htdld_cre_ip_addr             ,
"
"                        htdld_cre_os_user             ,
"
"                        htdld_cre_emp_id             ,
"
"                        htdld_cre_date         ,
"
"                               htdld_upd_by         ,
"
"                            htdld_upd_ip_addr             ,
"
"                        htdld_upd_os_user             ,
"
"                        htdld_upd_emp_id             ,
"
"                        htdld_upd_date         )
"
"                     VALUES(cr2.htdldh_bu         ,            --htdld_bu
"
"                        cr2.htdldh_doc_no         ,            --htdld_doc_no
"
"                        cr2.htdldh_doc_rev_no     ,            --htdld_doc_rev_no
"
"                        cr2.htdldh_sec10_14_dsc     ,            --htdld_sec10_14_dsc
"
"                        cr2.htdldh_sec10_13a_hra     ,            --htdld_sec10_13a_hra
"
"                        cr2.htdldh_sec10_13a_hra_type,            --htdld_sec10_13a_hra_type
"
"                        cr2.htdldh_sec_80c_ipp     ,            --htdld_sec_80c_ipp
"
"                        cr2.htdldh_sec_80c_gpf     ,            --htdld_sec_80c_gpf
"
"                            cr2.htdldh_sec_80c_ppf     ,            --htdld_sec_80c_ppf
"
"                        cr2.htdldh_sec_80c_ulip     ,            --htdld_sec_80c_ulip
"
"                        cr2.htdldh_sec_80c_mf     ,            --htdld_sec_80c_mf
"
"                        cr2.htdldh_sec_80c_nsc     ,            --htdld_sec_80c_nsc
"
"                        cr2.htdldh_sec_80c_nss     ,            --htdld_sec_80c_nss
"
"                        cr2.htdldh_sec_80c_ctf1     ,            --htdld_sec_80c_ctf1
"
"                        cr2.htdldh_sec_80c_ctf2     ,            --htdld_sec_80c_ctf2
"
"                        cr2.htdldh_sec_80c_tsfd     ,            --htdld_sec_80c_tsfd
"
"                            cr2.htdldh_sec_80c_sss     ,            --htdld_sec_80c_sss
"
"                        cr2.htdldh_sec_80c_aoei1     ,            --htdld_sec_80c_aoei1
"
"                        cr2.htdldh_sec_80c_aoei2     ,            --htdld_sec_80c_aoei2
"
"                        cr2.htdldh_sec_80ccc_ctcpf     ,            --htdld_sec_80ccc_ctcpf
"
"                        cr2.htdldh_sec_80ccd_nps_sc     ,            --htdld_sec_80ccd_nps_sc
"
"                        cr2.htdldh_sec_80ccd_nps_ec     ,            --htdld_sec_80ccd_nps_ec
"
"                        cr2.htdldh_sec_80ccg_rgess     ,            --htdld_sec_80ccg_rgess
"
"                            cr2.htdldh_sec_80d_mip_fmly     ,            --htdld_sec_80d_mip_fmly
"
"                            cr2.htdldh_sec_80d_mip_snor1 ,            --htdld_sec_80d_mip_snor1
"
"                            cr2.htdldh_sec_80d_mip_par     ,            --htdld_sec_80d_mip_par
"
"                            cr2.htdldh_sec_80d_mip_snor2 ,            --htdld_sec_80d_mip_snor2
"
"                            cr2.htdldh_sec_80dd_med_hd     ,            --htdld_sec_80dd_med_hd
"
"                             cr2.htdldh_sec_80dd_med_hd_type,            --htdld_sec_80dd_med_hd_type
"
"                        cr2.htdldh_sec_80ddb_amt     ,            --htdld_sec_80ddb_amt
"
"                            cr2.htdldh_sec_80e_edu_loan     ,            --htdld_sec_80e_edu_loan
"
"                        cr2.htdldh_sec_80g_donation     ,            --htdld_sec_80g_donation
"
"                        cr2.htdldh_sec_80u_phy_chlng_flag,            --htdld_sec_80u_phy_chlng_flag
"
"                        cr2.htdldh_hp_first_hl     ,            --htdld_hp_first_hl
"
"                        cr2.htdldh_hp_hl_sant_date     ,            --htdld_hp_hl_sant_date
"
"                        cr2.htdldh_hp_house_cost     ,            --htdld_hp_house_cost
"
"                        cr2.htdldh_hp_const_comp_3yrs,            --htdld_hp_const_comp_3yrs
"
"                        cr2.htdldh_hp_hl_sant_amt     ,            --htdld_hp_hl_sant_amt
"
"                        cr2.htdldh_hpso_hl_ip1     ,            --htdld_hpso_hl_ip1
"
"                        cr2.htdldh_hpso_hl_pp1     ,            --htdld_hpso_hl_pp1
"
"                        cr2.htdldh_hpso_hl_ip2     ,            --htdld_hpso_hl_ip2
"
"                        cr2.htdldh_hpso_hl_pp2     ,            --htdld_hpso_hl_pp2
"
"                        cr2.htdldh_hplo_hl_ip1     ,            --htdld_hplo_hl_ip1
"
"                        cr2.htdldh_hplo_hl_pp1     ,            --htdld_hplo_hl_pp1
"
"                        cr2.htdldh_hplo_hl_rr1     ,            --htdld_hplo_hl_rr1
"
"                        cr2.htdldh_hplo_hl_tp1     ,            --htdld_hplo_hl_tp1
"
"                        cr2.htdldh_hplo_hl_ip2     ,            --htdld_hplo_hl_ip2
"
"                        cr2.htdldh_hplo_hl_pp2     ,            --htdld_hplo_hl_pp2
"
"                        cr2.htdldh_hplo_hl_rr2     ,            --htdld_hplo_hl_rr2
"
"                        cr2.htdldh_hplo_hl_tp2     ,            --htdld_hplo_hl_tp2
"
"                        cr2.htdldh_sec10_5_lta     ,            --htdld_sec10_5_lta
"
"                        cr2.htdldh_sec_192b_hp_inc     ,            --htdld_sec_192b_hp_inc
"
"                        cr2.htdldh_sec_192b_oth_inc     ,            --htdld_sec_192b_oth_inc
"
"                        cr2.htdldh_any_oth_income     ,            --htdld_any_oth_income
"
"                        cr2.htdldh_cre_by         ,            --htdld_cre_by
"
"                        cr2.htdldh_cre_ip_addr     ,            --htdld_cre_ip_addr
"
"                        cr2.htdldh_cre_os_user     ,            --htdld_cre_os_user
"
"                        cr2.htdldh_cre_emp_id     ,            --htdld_cre_emp_id
"
"                        cr2.htdldh_cre_date         ,            --htdld_cre_date
"
"                        cr2.htdldh_upd_by         ,            --htdld_upd_by
"
"                        cr2.htdldh_upd_ip_addr     ,            --htdld_upd_ip_addr
"
"                        cr2.htdldh_upd_os_user     ,            --htdld_upd_os_user
"
"                        cr2.htdldh_upd_emp_id     ,            --htdld_upd_emp_id
"
"                        cr2.htdldh_upd_date         );            --htdld_upd_date
"
"
"
"            END LOOP c2;
"
"
"
"            FOR cr3 IN c3(cr1.htdhh_doc_no, cr1.htdhh_doc_rev_no)
"
"            LOOP
"
"
"
"               INSERT INTO hrm_tds_decl_attach (htda_bu                ,
"
"                               htda_doc_no            ,
"
"                            htda_doc_rev_no            ,
"
"                            htda_col_name            ,
"
"                            htda_seq_no            ,
"
"                            htda_doc_name            ,
"
"                            htda_file_name            ,
"
"                            htda_doc            ,
"
"                            htda_cre_by            ,
"
"                            htda_cre_ip_addr        ,
"
"                            htda_cre_os_user        ,
"
"                            htda_cre_emp_id            ,
"
"                            htda_cre_date            ,
"
"                            htda_upd_by            ,
"
"                            htda_upd_ip_addr        ,
"
"                            htda_upd_os_user        ,
"
"                            htda_upd_emp_id            ,
"
"                            htda_upd_date            )
"
"                      VALUES(cr3.htdah_bu        ,            --htda_bu
"
"                            cr3.htdah_doc_no    ,            --htda_doc_no
"
"                            cr3.htdah_doc_rev_no    ,            --htda_doc_rev_no
"
"                            cr3.htdah_col_name    ,            --htda_col_name
"
"                            cr3.htdah_seq_no    ,            --htda_seq_no
"
"                            cr3.htdah_doc_name    ,            --htda_doc_name
"
"                            cr3.htdah_file_name    ,            --htda_file_name
"
"                            cr3.htdah_doc            ,            --htda_doc
"
"                            cr3.htdah_cre_by    ,            --htda_cre_by
"
"                            cr3.htdah_cre_ip_addr   ,            --htda_cre_ip_addr
"
"                            cr3.htdah_cre_os_user   ,            --htda_cre_os_user
"
"                            cr3.htdah_cre_emp_id    ,            --htda_cre_emp_id
"
"                            cr3.htdah_cre_date    ,            --htda_cre_date
"
"                            cr3.htdah_upd_by    ,            --htda_upd_by
"
"                            cr3.htdah_upd_ip_addr   ,            --htda_upd_ip_addr
"
"                            cr3.htdah_upd_os_user   ,            --htda_upd_os_user
"
"                            cr3.htdah_upd_emp_id    ,            --htda_upd_emp_id
"
"                            cr3.htdah_upd_date    );            --htda_upd_date
"
"
"
"            END LOOp c3;
"
"
"
"            DELETE
"
"              FROM hrm_tds_decl_attach_hist
"
"             WHERE htdah_bu         = p_bu
"
"                 AND htdah_doc_no     = cr1.htdhh_doc_no
"
"                  AND htdah_doc_rev_no = cr1.htdhh_doc_rev_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_decl_det_hist
"
"             WHERE htdldh_bu         = p_bu
"
"                 AND htdldh_doc_no     = cr1.htdhh_doc_no
"
"                  AND htdldh_doc_rev_no = cr1.htdhh_doc_rev_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_decl_hd_hist
"
"             WHERE htdhh_bu         = p_bu
"
"                 AND htdhh_doc_no     = cr1.htdhh_doc_no
"
"                  AND htdhh_doc_rev_no = cr1.htdhh_doc_rev_no;
"
"
"
"         END LOOP c1;
"
"
"
"         /* End to insert Employee TDS Declaration */
"
"
"
"         /* Start to Insert Employee TDS Calculation */
"
"
"
"         FOR cr4 IN c4
"
"         LOOP
"
"
"
"            INSERT INTO hrm_tds_calc_hd(htch_bu            ,
"
"                    htch_doc_no        ,
"
"                         htch_doc_date        ,
"
"                         htch_emp_id        ,
"
"                         htch_fin_year        ,
"
"                         htch_slry_incm        ,
"
"                         htch_us10_amt        ,
"
"                         htch_prof_tax        ,
"
"                         htch_net_sal_incm         ,
"
"                         htch_hp_incm         ,
"
"                         htch_oth_incm         ,
"
"                         htch_gr_incm         ,
"
"                         htch_vi_a_ded         ,
"
"                         htch_net_taxbl_incm    ,
"
"                         htch_tax_amt        ,
"
"                         htch_rebate        ,
"
"                         htch_surcharge        ,
"
"                         htch_shec            ,
"
"                         htch_tds_ded        ,
"
"                         htch_yrly_tax_pybl    ,
"
"                         htch_rmng_mnth        ,
"
"                         htch_mnth_tds_ded        ,
"
"                         htch_tot_tax_amt        ,
"
"                         htch_hold_flag        ,
"
"                         htch_source        ,
"
"                         htch_bonus_amt        ,
"
"                         htch_exgratia_amt        ,
"
"                         htch_med_rebmnt_amt    ,
"
"                         htch_others_amt        ,
"
"                         htch_upd_lta_amt        ,
"
"                         htch_lta_amt        ,
"
"                         htch_cre_by        ,
"
"                         htch_cre_ip_addr        ,
"
"                         htch_cre_os_user        ,
"
"                         htch_cre_emp_id        ,
"
"                         htch_cre_date        ,
"
"                         htch_upd_by        ,
"
"                         htch_upd_ip_addr        ,
"
"                         htch_upd_os_user        ,
"
"                         htch_upd_emp_id        ,
"
"                         htch_upd_date        )
"
"                      VALUES(cr4.htchh_bu        ,            --htch_bu
"
"                         cr4.htchh_doc_no        ,            --htch_doc_no
"
"                         cr4.htchh_doc_date        ,            --htch_doc_date
"
"                         cr4.htchh_emp_id        ,            --htch_emp_id
"
"                         cr4.htchh_fin_year        ,            --htch_fin_year
"
"                         cr4.htchh_slry_incm    ,            --htch_slry_incm
"
"                         cr4.htchh_us10_amt        ,            --htch_us10_amt
"
"                         cr4.htchh_prof_tax        ,            --htch_prof_tax
"
"                         cr4.htchh_net_sal_incm    ,            --htch_net_sal_incm
"
"                         cr4.htchh_hp_incm        ,            --htch_hp_incm
"
"                         cr4.htchh_oth_incm        ,            --htch_oth_incm
"
"                         cr4.htchh_gr_incm        ,            --htch_gr_incm
"
"                         cr4.htchh_vi_a_ded        ,            --htch_vi_a_ded
"
"                         cr4.htchh_net_taxbl_incm    ,            --htch_net_taxbl_incm
"
"                         cr4.htchh_tax_amt        ,            --htch_tax_amt
"
"                         cr4.htchh_rebate        ,            --htch_rebate
"
"                         cr4.htchh_surcharge    ,            --htch_surcharge
"
"                         cr4.htchh_shec        ,            --htch_shec
"
"                         cr4.htchh_tds_ded        ,            --htch_tds_ded
"
"                         cr4.htchh_yrly_tax_pybl    ,            --htch_yrly_tax_pybl
"
"                         cr4.htchh_rmng_mnth    ,            --htch_rmng_mnth
"
"                         cr4.htchh_mnth_tds_ded    ,            --htch_mnth_tds_ded
"
"                         cr4.htchh_tot_tax_amt    ,            --htch_tot_tax_amt
"
"                         cr4.htchh_hold_flag    ,            --htch_hold_flag
"
"                         cr4.htchh_source        ,            --htch_source
"
"                         cr4.htchh_bonus_amt    ,            --htch_bonus_amt
"
"                         cr4.htchh_exgratia_amt    ,            --htch_exgratia_amt
"
"                         cr4.htchh_med_rebmnt_amt    ,            --htch_med_rebmnt_amt
"
"                         cr4.htchh_others_amt    ,            --htch_others_amt
"
"                         cr4.htchh_upd_lta_amt    ,            --htch_upd_lta_amt
"
"                         cr4.htchh_lta_amt        ,            --htch_lta_amt
"
"                         cr4.htchh_cre_by        ,            --htch_cre_by
"
"                         cr4.htchh_cre_ip_addr    ,            --htch_cre_ip_addr
"
"                         cr4.htchh_cre_os_user    ,            --htch_cre_os_user
"
"                         cr4.htchh_cre_emp_id    ,            --htch_cre_emp_id
"
"                         cr4.htchh_cre_date        ,            --htch_cre_date
"
"                         cr4.htchh_upd_by        ,            --htch_upd_by
"
"                         cr4.htchh_upd_ip_addr    ,            --htch_upd_ip_addr
"
"                         cr4.htchh_upd_os_user    ,            --htch_upd_os_user
"
"                         cr4.htchh_upd_emp_id    ,            --htch_upd_emp_id
"
"                         cr4.htchh_upd_date        );            --htch_upd_date
"
"
"
"            FOR cr5 IN c5(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                       INSERT INTO hrm_tds_calc_pyrl(htcp_bu        ,
"
"                          htcp_doc_no        ,
"
"                          htcp_fin_period    ,
"
"                          htcp_elmnt_id    ,
"
"                          htcp_elmnt_amt    ,
"
"                          htcp_add_ded_type    ,
"
"                          htcp_cre_by        ,
"
"                          htcp_cre_ip_addr    ,
"
"                          htcp_cre_os_user    ,
"
"                          htcp_cre_emp_id    ,
"
"                          htcp_cre_date    ,
"
"                          htcp_upd_by        ,
"
"                          htcp_upd_ip_addr    ,
"
"                          htcp_upd_os_user    ,
"
"                          htcp_upd_emp_id    ,
"
"                          htcp_upd_date    )
"
"                       VALUES(cr5.htcph_bu        ,            --htcp_bu
"
"                          cr5.htcph_doc_no    ,            --htcp_doc_no
"
"                          cr5.htcph_fin_period    ,            --htcp_fin_period
"
"                          cr5.htcph_elmnt_id    ,            --htcp_elmnt_id
"
"                          cr5.htcph_elmnt_amt    ,            --htcp_elmnt_amt
"
"                          cr5.htcph_add_ded_type,            --htcp_add_ded_type
"
"                          cr5.htcph_cre_by    ,            --htcp_cre_by
"
"                          cr5.htcph_cre_ip_addr    ,            --htcp_cre_ip_addr
"
"                          cr5.htcph_cre_os_user    ,            --htcp_cre_os_user
"
"                          cr5.htcph_cre_emp_id    ,            --htcp_cre_emp_id
"
"                          cr5.htcph_cre_date    ,            --htcp_cre_date
"
"                          cr5.htcph_upd_by    ,            --htcp_upd_by
"
"                          cr5.htcph_upd_ip_addr    ,            --htcp_upd_ip_addr
"
"                          cr5.htcph_upd_os_user    ,            --htcp_upd_os_user
"
"                          cr5.htcph_upd_emp_id    ,            --htcp_upd_emp_id
"
"                          cr5.htcph_upd_date    );            --htcp_upd_date
"
"
"
"            END LOOP c5;
"
"
"
"            FOR cr6 IN c6(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_hra_dec(hthrd_bu         ,
"
"                        hthrd_doc_no         ,
"
"                        hthrd_hra_rcvd         ,
"
"                        hthrd_metro_flag     ,
"
"                        hthrd_rent_paid     ,
"
"                        hthrd_act_rent_paid     ,
"
"                        hthrd_basic_10_pct     ,
"
"                        hthrd_basic_40_50_pct     ,
"
"                        hthrd_excess_paid     ,
"
"                        hthrd_hra_min         ,
"
"                        hthrd_act_hra         ,
"
"                        hthrd_hra_exempt     ,
"
"                        hthrd_cre_by         ,
"
"                        hthrd_cre_ip_addr     ,
"
"                        hthrd_cre_os_user     ,
"
"                        hthrd_cre_emp_id     ,
"
"                        hthrd_cre_date         ,
"
"                        hthrd_upd_by         ,
"
"                        hthrd_upd_ip_addr     ,
"
"                        hthrd_upd_os_user     ,
"
"                        hthrd_upd_emp_id     ,
"
"                        hthrd_upd_date         )
"
"                     VALUES(cr6.hthrdh_bu         ,            --hthrd_bu
"
"                        cr6.hthrdh_doc_no     ,            --hthrd_doc_no
"
"                        cr6.hthrdh_hra_rcvd     ,            --hthrd_hra_rcvd
"
"                        cr6.hthrdh_metro_flag     ,            --hthrd_metro_flag
"
"                        cr6.hthrdh_rent_paid     ,            --hthrd_rent_paid
"
"                        cr6.hthrdh_act_rent_paid ,            --hthrd_act_rent_paid
"
"                        cr6.hthrdh_basic_10_pct     ,            --hthrd_basic_10_pct
"
"                        cr6.hthrdh_basic_40_50_pct,            --hthrd_basic_40_50_pct
"
"                        cr6.hthrdh_excess_paid     ,            --hthrd_excess_paid
"
"                        cr6.hthrdh_hra_min     ,            --hthrd_hra_min
"
"                        cr6.hthrdh_act_hra     ,            --hthrd_act_hra
"
"                        cr6.hthrdh_hra_exempt     ,            --hthrd_hra_exempt
"
"                        cr6.hthrdh_cre_by     ,            --hthrd_cre_by
"
"                        cr6.hthrdh_cre_ip_addr     ,            --hthrd_cre_ip_addr
"
"                        cr6.hthrdh_cre_os_user     ,            --hthrd_cre_os_user
"
"                        cr6.hthrdh_cre_emp_id     ,            --hthrd_cre_emp_id
"
"                        cr6.hthrdh_cre_date     ,            --hthrd_cre_date
"
"                        cr6.hthrdh_upd_by     ,            --hthrd_upd_by
"
"                        cr6.hthrdh_upd_ip_addr     ,            --hthrd_upd_ip_addr
"
"                        cr6.hthrdh_upd_os_user     ,            --hthrd_upd_os_user
"
"                        cr6.hthrdh_upd_emp_id     ,             --hthrd_upd_emp_id
"
"                        cr6.hthrdh_upd_date     );            --hthrd_upd_date
"
"
"
"            END LOOP c6;
"
"
"
"            FOR cr7 IN c7(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_house_property( hthp_bu        ,
"
"                                hthp_doc_no        ,
"
"                            hthp_hp_type        ,
"
"                            hthp_seq_no        ,
"
"                            hthp_rent_type        ,
"
"                            hthp_rent_rcvd        ,
"
"                            hthp_house_tax        ,
"
"                            hthp_rr_ht_tot        ,
"
"                            hthp_std_ded        ,
"
"                            hthp_std_int        ,
"
"                            hthp_tot_std_ded    ,
"
"                            hthp_rent_hp_income    ,
"
"                            hthp_self_occup    ,
"
"                            hthp_first_loan    ,
"
"                            hthp_acqu_const_comp    ,
"
"                            hthp_int_paid        ,
"
"                            hthp_cost_of_house    ,
"
"                            hthp_loan_sant_amt    ,
"
"                            hthp_self_hp_income    ,
"
"                            hthp_principal_paid    ,
"
"                            hthp_add_int        ,
"
"                            hthp_int_calc        ,
"
"                            hthp_tot_hp_income    ,
"
"                            hthp_cre_by        ,
"
"                            hthp_cre_ip_addr    ,
"
"                            hthp_cre_os_user    ,
"
"                            hthp_cre_emp_id    ,
"
"                            hthp_cre_date        ,
"
"                            hthp_upd_by        ,
"
"                            hthp_upd_ip_addr    ,
"
"                            hthp_upd_os_user    ,
"
"                            hthp_upd_emp_id    ,
"
"                            hthp_upd_date        )
"
"                         VALUES(cr7.hthph_bu        ,            --hthp_bu
"
"                                cr7.hthph_doc_no    ,            --hthp_doc_no
"
"                            cr7.hthph_hp_type    ,            --hthp_hp_type
"
"                            cr7.hthph_seq_no    ,            --hthp_seq_no
"
"                            cr7.hthph_rent_type    ,            --hthp_rent_type
"
"                            cr7.hthph_rent_rcvd    ,            --hthp_rent_rcvd
"
"                            cr7.hthph_house_tax    ,            --hthp_house_tax
"
"                            cr7.hthph_rr_ht_tot    ,            --hthp_rr_ht_tot
"
"                            cr7.hthph_std_ded    ,            --hthp_std_ded
"
"                            cr7.hthph_std_int    ,            --hthp_std_int
"
"                            cr7.hthph_tot_std_ded    ,            --hthp_tot_std_ded
"
"                            cr7.hthph_rent_hp_income,            --hthp_rent_hp_income
"
"                            cr7.hthph_self_occup    ,            --hthp_self_occup
"
"                            cr7.hthph_first_loan    ,            --hthp_first_loan
"
"                            cr7.hthph_acqu_const_comp,            --hthp_acqu_const_comp
"
"                            cr7.hthph_int_paid    ,            --hthp_int_paid
"
"                            cr7.hthph_cost_of_house    ,            --hthp_cost_of_house
"
"                            cr7.hthph_loan_sant_amt    ,            --hthp_loan_sant_amt
"
"                            cr7.hthph_self_hp_income,            --hthp_self_hp_income
"
"                            cr7.hthph_principal_paid,            --hthp_principal_paid
"
"                            cr7.hthph_add_int    ,            --hthp_add_int
"
"                            cr7.hthph_int_calc    ,            --hthp_int_calc
"
"                            cr7.hthph_tot_hp_income    ,            --hthp_tot_hp_income
"
"                            cr7.hthph_cre_by    ,            --hthp_cre_by
"
"                            cr7.hthph_cre_ip_addr    ,            --hthp_cre_ip_addr
"
"                            cr7.hthph_cre_os_user    ,            --hthp_cre_os_user
"
"                            cr7.hthph_cre_emp_id    ,            --hthp_cre_emp_id
"
"                            cr7.hthph_cre_date    ,            --hthp_cre_date
"
"                            cr7.hthph_upd_by    ,            --hthp_upd_by
"
"                            cr7.hthph_upd_ip_addr    ,            --hthp_upd_ip_addr
"
"                            cr7.hthph_upd_os_user    ,            --hthp_upd_os_user
"
"                            cr7.hthph_upd_emp_id    ,            --hthp_upd_emp_id
"
"                            cr7.hthph_upd_date    );            --hthp_upd_date
"
"
"
"            END LOOP c7;
"
"
"
"            FOR cr8 IN c8(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_80c_dec(htcd_bu              ,
"
"                        htcd_doc_no         ,
"
"                        htcd_insur         ,
"
"                        htcd_ulip         ,
"
"                        htcd_pf              ,
"
"                        htcd_mut_fund         ,
"
"                        htcd_child_edu1          ,
"
"                        htcd_fdr         ,
"
"                        htcd_nsc         ,
"
"                        htcd_gpf         ,
"
"                        htcd_ppf         ,
"
"                        htcd_house_rpymnt     ,
"
"                        htcd_nps         ,
"
"                        htcd_child_edu2          ,
"
"                        htcd_nss         ,
"
"                        htcd_pension_fund     ,
"
"                        htcd_oth_elgble_80c_1     ,
"
"                        htcd_oth_elgble_80c_2     ,
"
"                        htcd_oth_elgble_80c_3     ,
"
"                        htcd_tot_80c         ,
"
"                        htcd_act_80c         ,
"
"                        htcd_cre_by         ,
"
"                        htcd_cre_ip_addr     ,
"
"                        htcd_cre_os_user     ,
"
"                        htcd_cre_emp_id          ,
"
"                        htcd_cre_date         ,
"
"                        htcd_upd_by         ,
"
"                        htcd_upd_ip_addr     ,
"
"                        htcd_upd_os_user     ,
"
"                        htcd_upd_emp_id           ,
"
"                        htcd_upd_date         )
"
"                     VALUES(cr8.htcdh_bu         ,            --htcd_bu
"
"                        cr8.htcdh_doc_no     ,            --htcd_doc_no
"
"                        cr8.htcdh_insur         ,            --htcd_insur
"
"                        cr8.htcdh_ulip         ,            --htcd_ulip
"
"                        cr8.htcdh_pf         ,            --htcd_pf
"
"                        cr8.htcdh_mut_fund     ,            --htcd_mut_fund
"
"                        cr8.htcdh_child_edu1     ,            --htcd_child_edu1
"
"                        cr8.htcdh_fdr         ,            --htcd_fdr
"
"                        cr8.htcdh_nsc         ,            --htcd_nsc
"
"                        cr8.htcdh_gpf         ,            --htcd_gpf
"
"                        cr8.htcdh_ppf         ,            --htcd_ppf
"
"                        cr8.htcdh_house_rpymnt     ,            --htcd_house_rpymnt
"
"                        cr8.htcdh_nps         ,            --htcd_nps
"
"                        cr8.htcdh_child_edu2     ,            --htcd_child_edu2
"
"                        cr8.htcdh_nss         ,            --htcd_nss
"
"                        cr8.htcdh_pension_fund     ,            --htcd_pension_fund
"
"                        cr8.htcdh_oth_elgble_80c_1,            --htcd_oth_elgble_80c_1
"
"                        cr8.htcdh_oth_elgble_80c_2,            --htcd_oth_elgble_80c_2
"
"                        cr8.htcdh_oth_elgble_80c_3,            --htcd_oth_elgble_80c_3
"
"                        cr8.htcdh_tot_80c     ,              --htcd_tot_80c
"
"                        cr8.htcdh_act_80c     ,            --htcd_act_80c
"
"                        cr8.htcdh_cre_by     ,            --htcd_cre_by
"
"                        cr8.htcdh_cre_ip_addr     ,            --htcd_cre_ip_addr
"
"                        cr8.htcdh_cre_os_user     ,            --htcd_cre_os_user
"
"                        cr8.htcdh_cre_emp_id     ,            --htcd_cre_emp_id
"
"                        cr8.htcdh_cre_date     ,            --htcd_cre_date
"
"                        cr8.htcdh_upd_by     ,            --htcd_upd_by
"
"                        cr8.htcdh_upd_ip_addr     ,            --htcd_upd_ip_addr
"
"                        cr8.htcdh_upd_os_user     ,            --htcd_upd_os_user
"
"                        cr8.htcdh_upd_emp_id     ,            --htcd_upd_emp_id
"
"                        cr8.htcdh_upd_date     );            --htcd_upd_date
"
"
"
"            END LOOP c8;
"
"
"
"            FOR cr9 IN c9(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_80ccg_dec(htccgd_bu        ,
"
"                          htccgd_doc_no        ,
"
"                          htccgd_rgess_amt    ,
"
"                          htccgd_yrly_sal    ,
"
"                          htccgd_ded_amt    ,
"
"                          htccgd_cre_by        ,
"
"                          htccgd_cre_ip_addr    ,
"
"                          htccgd_cre_os_user    ,
"
"                          htccgd_cre_emp_id    ,
"
"                          htccgd_cre_date    ,
"
"                          htccgd_upd_by        ,
"
"                          htccgd_upd_ip_addr    ,
"
"                          htccgd_upd_os_user    ,
"
"                          htccgd_upd_emp_id    ,
"
"                          htccgd_upd_date    )
"
"                       VALUES(cr9.htccgdh_bu    ,            --htccgd_bu
"
"                          cr9.htccgdh_doc_no    ,            --htccgd_doc_no
"
"                          cr9.htccgdh_rgess_amt    ,            --htccgd_rgess_amt
"
"                          cr9.htccgdh_yrly_sal    ,            --htccgd_yrly_sal
"
"                          cr9.htccgdh_ded_amt    ,            --htccgd_ded_amt
"
"                          cr9.htccgdh_cre_by    ,            --htccgd_cre_by
"
"                          cr9.htccgdh_cre_ip_addr,            --htccgd_cre_ip_addr
"
"                          cr9.htccgdh_cre_os_user,            --htccgd_cre_os_user
"
"                          cr9.htccgdh_cre_emp_id,            --htccgd_cre_emp_id
"
"                          cr9.htccgdh_cre_date    ,            --htccgd_cre_date
"
"                          cr9.htccgdh_upd_by    ,            --htccgd_upd_by
"
"                          cr9.htccgdh_upd_ip_addr,            --htccgd_upd_ip_addr
"
"                          cr9.htccgdh_upd_os_user,            --htccgd_upd_os_user
"
"                          cr9.htccgdh_upd_emp_id,            --htccgd_upd_emp_id
"
"                          cr9.htccgdh_upd_date    );            --htccgd_upd_date
"
"
"
"            END LOOP c9;
"
"
"
"            FOR cr10 IN c10(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                       INSERT INTO hrm_tds_80d_dec(htdd_bu             ,
"
"                        htdd_doc_no         ,
"
"                        htdd_fmly_ip         ,
"
"                        htdd_sc1_ip         ,
"
"                        htdd_fmly_tot_ip    ,
"
"                        htdd_sc1_tot_ip     ,
"
"                        htdd_prnt_ip         ,
"
"                        htdd_sc2_ip         ,
"
"                        htdd_prnt_tot_ip    ,
"
"                        htdd_sc2_tot_ip     ,
"
"                        htdd_fmly_act_ip    ,
"
"                        htdd_sc_act_ip         ,
"
"                        htdd_80d_tot         ,
"
"                        htdd_cre_by          ,
"
"                        htdd_cre_ip_addr    ,
"
"                        htdd_cre_os_user    ,
"
"                        htdd_cre_emp_id     ,
"
"                        htdd_cre_date         ,
"
"                        htdd_upd_by         ,
"
"                        htdd_upd_ip_addr    ,
"
"                        htdd_upd_os_user    ,
"
"                        htdd_upd_emp_id     ,
"
"                        htdd_upd_date         )
"
"                     VALUES(cr10.htddh_bu         ,            --htdd_bu
"
"                        cr10.htddh_doc_no    ,            --htdd_doc_no
"
"                        cr10.htddh_fmly_ip    ,            --htdd_fmly_ip
"
"                        cr10.htddh_sc1_ip    ,            --htdd_sc1_ip
"
"                        cr10.htddh_fmly_tot_ip    ,            --htdd_fmly_tot_ip
"
"                        cr10.htddh_sc1_tot_ip     ,            --htdd_sc1_tot_ip
"
"                        cr10.htddh_prnt_ip    ,            --htdd_prnt_ip
"
"                        cr10.htddh_sc2_ip    ,            --htdd_sc2_ip
"
"                        cr10.htddh_prnt_tot_ip    ,            --htdd_prnt_tot_ip
"
"                        cr10.htddh_sc2_tot_ip     ,            --htdd_sc2_tot_ip
"
"                        cr10.htddh_fmly_act_ip    ,            --htdd_fmly_act_ip
"
"                        cr10.htddh_sc_act_ip    ,            --htdd_sc_act_ip
"
"                        cr10.htddh_80d_tot    ,            --htdd_80d_tot
"
"                        cr10.htddh_cre_by     ,            --htdd_cre_by
"
"                        cr10.htddh_cre_ip_addr    ,            --htdd_cre_ip_addr
"
"                        cr10.htddh_cre_os_user    ,            --htdd_cre_os_user
"
"                        cr10.htddh_cre_emp_id     ,            --htdd_cre_emp_id
"
"                        cr10.htddh_cre_date    ,            --htdd_cre_date
"
"                        cr10.htddh_upd_by    ,            --htdd_upd_by
"
"                        cr10.htddh_upd_ip_addr    ,            --htdd_upd_ip_addr
"
"                        cr10.htddh_upd_os_user    ,            --htdd_upd_os_user
"
"                        cr10.htddh_upd_emp_id     ,            --htdd_upd_emp_id
"
"                        cr10.htddh_upd_date    );            --htdd_upd_date
"
"
"
"            END LOOP c10;
"
"
"
"            FOR cr11 IN c11(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_80dd_dec(htddd_bu        ,
"
"                         htddd_doc_no        ,
"
"                         htddd_type        ,
"
"                         htddd_tot_expns    ,
"
"                         htddd_act_expns    ,
"
"                         htddd_cre_by        ,
"
"                         htddd_cre_ip_addr    ,
"
"                         htddd_cre_os_user    ,
"
"                         htddd_cre_emp_id    ,
"
"                         htddd_cre_date        ,
"
"                         htddd_upd_by        ,
"
"                         htddd_upd_ip_addr    ,
"
"                         htddd_upd_os_user    ,
"
"                         htddd_upd_emp_id    ,
"
"                         htddd_upd_date    )
"
"                      VALUES(cr11.htdddh_bu        ,            --htddd_bu
"
"                         cr11.htdddh_doc_no    ,            --htddd_doc_no
"
"                         cr11.htdddh_type    ,            --htddd_type
"
"                         cr11.htdddh_tot_expns    ,            --htddd_tot_expns
"
"                         cr11.htdddh_act_expns    ,            --htddd_act_expns
"
"                         cr11.htdddh_cre_by    ,            --htddd_cre_by
"
"                         cr11.htdddh_cre_ip_addr,            --htddd_cre_ip_addr
"
"                         cr11.htdddh_cre_os_user,            --htddd_cre_os_user
"
"                         cr11.htdddh_cre_emp_id    ,            --htddd_cre_emp_id
"
"                         cr11.htdddh_cre_date    ,            --htddd_cre_date
"
"                         cr11.htdddh_upd_by    ,            --htddd_upd_by
"
"                         cr11.htdddh_upd_ip_addr,            --htddd_upd_ip_addr
"
"                         cr11.htdddh_upd_os_user,            --htddd_upd_os_user
"
"                         cr11.htdddh_upd_emp_id    ,            --htddd_upd_emp_id
"
"                         cr11.htdddh_upd_date    );            --htddd_upd_date
"
"
"
"            END LOOP c11;
"
"
"
"            FOR cr12 IN c12(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_80ddb_dec(htddbd_bu         ,
"
"                          htddbd_doc_no            ,
"
"                          htddbd_tot_expns     ,
"
"                          htddbd_act_expns     ,
"
"                          htddbd_cre_by          ,
"
"                          htddbd_cre_ip_addr     ,
"
"                          htddbd_cre_os_user     ,
"
"                          htddbd_cre_emp_id     ,
"
"                          htddbd_cre_date     ,
"
"                          htddbd_upd_by          ,
"
"                          htddbd_upd_ip_addr     ,
"
"                          htddbd_upd_os_user     ,
"
"                          htddbd_upd_emp_id     ,
"
"                          htddbd_upd_date     )
"
"                       VALUES(cr12.htddbdh_bu     ,                --htddbd_bu
"
"                          cr12.htddbdh_doc_no     ,                --htddbd_doc_no
"
"                          cr12.htddbdh_tot_expns ,                --htddbd_tot_expns
"
"                          cr12.htddbdh_act_expns ,                --htddbd_act_expns
"
"                          cr12.htddbdh_cre_by     ,                --htddbd_cre_by
"
"                          cr12.htddbdh_cre_ip_addr,                --htddbd_cre_ip_addr
"
"                          cr12.htddbdh_cre_os_user,                --htddbd_cre_os_user
"
"                          cr12.htddbdh_cre_emp_id ,                --htddbd_cre_emp_id
"
"                          cr12.htddbdh_cre_date     ,                --htddbd_cre_date
"
"                          cr12.htddbdh_upd_by     ,                --htddbd_upd_by
"
"                          cr12.htddbdh_upd_ip_addr,                --htddbd_upd_ip_addr
"
"                          cr12.htddbdh_upd_os_user,                --htddbd_upd_os_user
"
"                          cr12.htddbdh_upd_emp_id ,                --htddbd_upd_emp_id
"
"                          cr12.htddbdh_upd_date     );                --htddbd_upd_date
"
"
"
"            END LOOP c12;
"
"
"
"            FOR cr13 IN c13(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_80g_dec(htgd_bu            ,
"
"                        htgd_doc_no        ,
"
"                        htgd_donation_amt    ,
"
"                        htgd_exempt_amt        ,
"
"                        htgd_cre_by        ,
"
"                        htgd_cre_ip_addr    ,
"
"                        htgd_cre_os_user    ,
"
"                        htgd_cre_emp_id        ,
"
"                        htgd_cre_date        ,
"
"                        htgd_upd_by        ,
"
"                        htgd_upd_ip_addr    ,
"
"                        htgd_upd_os_user    ,
"
"                        htgd_upd_emp_id        ,
"
"                        htgd_upd_date        )
"
"                     VALUES(cr13.htgdh_bu        ,            --htgd_bu
"
"                        cr13.htgdh_doc_no    ,            --htgd_doc_no
"
"                        cr13.htgdh_donation_amt    ,            --htgd_donation_amt
"
"                        cr13.htgdh_exempt_amt    ,            --htgd_exempt_amt
"
"                        cr13.htgdh_cre_by    ,            --htgd_cre_by
"
"                        cr13.htgdh_cre_ip_addr    ,            --htgd_cre_ip_addr
"
"                        cr13.htgdh_cre_os_user    ,            --htgd_cre_os_user
"
"                        cr13.htgdh_cre_emp_id    ,            --htgd_cre_emp_id
"
"                        cr13.htgdh_cre_date    ,            --htgd_cre_date
"
"                        cr13.htgdh_upd_by    ,            --htgd_upd_by
"
"                        cr13.htgdh_upd_ip_addr    ,            --htgd_upd_ip_addr
"
"                        cr13.htgdh_upd_os_user    ,            --htgd_upd_os_user
"
"                        cr13.htgdh_upd_emp_id    ,            --htgd_upd_emp_id
"
"                        cr13.htgdh_upd_date    );            --htgd_upd_date
"
"
"
"            END LOOP c13;
"
"
"
"            FOR cr14 IN c14(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_80e_dec(hted_bu            ,
"
"                        hted_doc_no        ,
"
"                        hted_edu_loan_int    ,
"
"                        hted_cre_by        ,
"
"                        hted_cre_ip_addr    ,
"
"                        hted_cre_os_user    ,
"
"                        hted_cre_emp_id        ,
"
"                        hted_cre_date        ,
"
"                        hted_upd_by        ,
"
"                        hted_upd_ip_addr    ,
"
"                        hted_upd_os_user    ,
"
"                        hted_upd_emp_id        ,
"
"                        hted_upd_date        )
"
"                     VALUES(cr14.htedh_bu        ,            --hted_bu
"
"                        cr14.htedh_doc_no    ,            --hted_doc_no
"
"                        cr14.htedh_edu_loan_int    ,            --hted_edu_loan_int
"
"                        cr14.htedh_cre_by    ,            --hted_cre_by
"
"                        cr14.htedh_cre_ip_addr    ,            --hted_cre_ip_addr
"
"                        cr14.htedh_cre_os_user    ,            --hted_cre_os_user
"
"                        cr14.htedh_cre_emp_id    ,            --hted_cre_emp_id
"
"                        cr14.htedh_cre_date    ,            --hted_cre_date
"
"                        cr14.htedh_upd_by    ,            --hted_upd_by
"
"                        cr14.htedh_upd_ip_addr    ,            --hted_upd_ip_addr
"
"                        cr14.htedh_upd_os_user    ,            --hted_upd_os_user
"
"                        cr14.htedh_upd_emp_id    ,            --hted_upd_emp_id
"
"                        cr14.htedh_upd_date    );            --hted_upd_date
"
"
"
"            END LOOP c14;
"
"
"
"            FOR cr15 IN c15(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                       INSERT INTO hrm_tds_80u_dec(htud_bu                ,
"
"                        htud_doc_no            ,
"
"                        htud_prmnt_phy_chlng_flag    ,
"
"                        hted_tot_amt            ,
"
"                        hted_qualify_amt        ,
"
"                        htud_cre_by            ,
"
"                        htud_cre_ip_addr        ,
"
"                        htud_cre_os_user        ,
"
"                        htud_cre_emp_id            ,
"
"                        htud_cre_date            ,
"
"                        htud_upd_by            ,
"
"                        htud_upd_ip_addr        ,
"
"                        htud_upd_os_user        ,
"
"                        htud_upd_emp_id            ,
"
"                        htud_upd_date            )
"
"                     VALUES(cr15.htudh_bu            ,            --htud_bu
"
"                        cr15.htudh_doc_no        ,            --htud_doc_no
"
"                        cr15.htudh_prmnt_phy_chlng_flag    ,            --htud_prmnt_phy_chlng_flag
"
"                        cr15.htudh_tot_amt        ,            --htud_tot_amt
"
"                        cr15.htudh_qualify_amt        ,            --htud_qualify_amt
"
"                        cr15.htudh_cre_by        ,            --htud_cre_by
"
"                        cr15.htudh_cre_ip_addr        ,            --htud_cre_ip_addr
"
"                        cr15.htudh_cre_os_user        ,            --htud_cre_os_user
"
"                        cr15.htudh_cre_emp_id        ,            --htud_cre_emp_id
"
"                        cr15.htudh_cre_date        ,            --htud_cre_date
"
"                        cr15.htudh_upd_by        ,            --htud_upd_by
"
"                        cr15.htudh_upd_ip_addr        ,            --htud_upd_ip_addr
"
"                        cr15.htudh_upd_os_user        ,            --htud_upd_os_user
"
"                        cr15.htudh_upd_emp_id        ,            --htud_upd_emp_id
"
"                        cr15.htudh_upd_date        );            --htud_upd_date
"
"
"
"            END LOOP c15;
"
"
"
"            FOR cr16 IN c16(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_conv_dec(htcvd_bu        ,
"
"                         htcvd_doc_no        ,
"
"                         htcvd_conv_rcvd    ,
"
"                         htcvd_ds_conv        ,
"
"                         htcvd_30p_ds_conv    ,
"
"                         htcvd_tot_conv        ,
"
"                         htcvd_act_conv        ,
"
"                         htcvd_cre_by        ,
"
"                         htcvd_cre_ip_addr    ,
"
"                         htcvd_cre_os_user    ,
"
"                         htcvd_cre_emp_id    ,
"
"                         htcvd_cre_date        ,
"
"                         htcvd_upd_by        ,
"
"                         htcvd_upd_ip_addr    ,
"
"                         htcvd_upd_os_user    ,
"
"                         htcvd_upd_emp_id    ,
"
"                         htcvd_upd_date    )
"
"                      VALUES(cr16.htcvdh_bu        ,            --htcvd_bu
"
"                         cr16.htcvdh_doc_no    ,            --htcvd_doc_no
"
"                         cr16.htcvdh_conv_rcvd    ,            --htcvd_conv_rcvd
"
"                         cr16.htcvdh_ds_conv    ,            --htcvd_ds_conv
"
"                         cr16.htcvdh_30p_ds_conv,            --htcvd_30p_ds_conv
"
"                         cr16.htcvdh_tot_conv    ,            --htcvd_tot_conv
"
"                         cr16.htcvdh_act_conv    ,            --htcvd_act_conv
"
"                         cr16.htcvdh_cre_by    ,            --htcvd_cre_by
"
"                         cr16.htcvdh_cre_ip_addr,            --htcvd_cre_ip_addr
"
"                         cr16.htcvdh_cre_os_user,            --htcvd_cre_os_user
"
"                         cr16.htcvdh_cre_emp_id    ,            --htcvd_cre_emp_id
"
"                         cr16.htcvdh_cre_date    ,            --htcvd_cre_date
"
"                         cr16.htcvdh_upd_by    ,            --htcvd_upd_by
"
"                         cr16.htcvdh_upd_ip_addr,            --htcvd_upd_ip_addr
"
"                         cr16.htcvdh_upd_os_user,            --htcvd_upd_os_user
"
"                         cr16.htcvdh_upd_emp_id    ,            --htcvd_upd_emp_id
"
"                         cr16.htcvdh_upd_date    );            --htcvd_upd_date
"
"
"
"            END LOOP c16;
"
"
"
"            FOR cr17 IN c17(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_lta_dec(htld_bu            ,
"
"                        htld_doc_no        ,
"
"                        htld_lta_limit        ,
"
"                        htld_empr_lta_amt    ,
"
"                        htld_decl_lta_amt    ,
"
"                        htld_act_lta_amt    ,
"
"                        htld_cre_by        ,
"
"                        htld_cre_date        ,
"
"                        htld_upd_by        ,
"
"                        htld_upd_date        )
"
"                     VALUES(cr17.htldh_bu        ,            --htld_bu
"
"                        cr17.htldh_doc_no    ,            --htld_doc_no
"
"                        cr17.htldh_lta_limit    ,            --htld_lta_limit
"
"                        cr17.htldh_empr_lta_amt    ,            --htld_empr_lta_amt
"
"                        cr17.htldh_decl_lta_amt    ,            --htld_decl_lta_amt
"
"                        cr17.htldh_act_lta_amt    ,            --htld_act_lta_amt
"
"                        cr17.htldh_cre_by    ,            --htld_cre_by
"
"                        cr17.htldh_cre_date    ,            --htld_cre_date
"
"                        cr17.htldh_upd_by    ,            --htld_upd_by
"
"                        cr17.htldh_upd_date    );            --htld_upd_date
"
"
"
"            END LOOP c17;
"
"
"
"            FOR cr18 IN c18(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_80ccd1_dec(htccd1d_bu           ,
"
"                           htccd1d_doc_no       ,
"
"                           htccd1d_80ccd_amt       ,
"
"                           htccd1d_80c_amt       ,
"
"                           htccd1d_80ccd_act       ,
"
"                           htccd1d_cre_by       ,
"
"                           htccd1d_cre_ip_addr       ,
"
"                           htccd1d_cre_os_user       ,
"
"                           htccd1d_cre_emp_id       ,
"
"                           htccd1d_cre_date       ,
"
"                           htccd1d_upd_by       ,
"
"                           htccd1d_upd_ip_addr       ,
"
"                           htccd1d_upd_os_user       ,
"
"                           htccd1d_upd_emp_id       ,
"
"                           htccd1d_upd_date        )
"
"                        VALUES(cr18.htccd1dh_bu       ,            --htccd1d_bu
"
"                           cr18.htccd1dh_doc_no       ,             --htccd1d_doc_no
"
"                           cr18.htccd1dh_80ccd_amt ,            --htccd1d_80ccd_amt
"
"                           cr18.htccd1dh_80c_amt   ,            --htccd1d_80c_amt
"
"                           cr18.htccd1dh_80ccd_act ,            --htccd1d_80ccd_act
"
"                           cr18.htccd1dh_cre_by       ,            --htccd1d_cre_by
"
"                           cr18.htccd1dh_cre_ip_addr,            --htccd1d_cre_ip_addr
"
"                           cr18.htccd1dh_cre_os_user,            --htccd1d_cre_os_user
"
"                           cr18.htccd1dh_cre_emp_id,            --htccd1d_cre_emp_id
"
"                           cr18.htccd1dh_cre_date  ,            --htccd1d_cre_date
"
"                           cr18.htccd1dh_upd_by       ,            --htccd1d_upd_by
"
"                           cr18.htccd1dh_upd_ip_addr,            --htccd1d_upd_ip_addr
"
"                           cr18.htccd1dh_upd_os_user,            --htccd1d_upd_os_user
"
"                           cr18.htccd1dh_upd_emp_id ,            --htccd1d_upd_emp_id
"
"                           cr18.htccd1dh_upd_date   );            --htccd1d_upd_date
"
"
"
"            END LOOP c18;
"
"
"
"            FOR cr19 IN c19(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                       INSERT INTO hrm_tds_80ccd2_dec(htccd2d_bu           ,
"
"                           htccd2d_doc_no       ,
"
"                           htccd2d_type              ,
"
"                           htccd2d_yrly_sal       ,
"
"                           htccd2d_act_amt       ,
"
"                           htccd2d_cre_by       ,
"
"                           htccd2d_cre_ip_addr       ,
"
"                           htccd2d_cre_os_user       ,
"
"                           htccd2d_cre_emp_id       ,
"
"                           htccd2d_cre_date       ,
"
"                           htccd2d_upd_by       ,
"
"                           htccd2d_upd_ip_addr       ,
"
"                           htccd2d_upd_os_user       ,
"
"                           htccd2d_upd_emp_id       ,
"
"                           htccd2d_upd_date       )
"
"                        VALUES(cr19.htccd2dh_bu       ,            --htccd2d_bu
"
"                           cr19.htccd2dh_doc_no       ,            --htccd2d_doc_no
"
"                           cr19.htccd2dh_type       ,            --htccd2d_type
"
"                           cr19.htccd2dh_yrly_sal  ,            --htccd2d_yrly_sal
"
"                           cr19.htccd2dh_act_amt   ,            --htccd2d_act_amt
"
"                           cr19.htccd2dh_cre_by       ,            --htccd2d_cre_by
"
"                           cr19.htccd2dh_cre_ip_addr,            --htccd2d_cre_ip_addr
"
"                           cr19.htccd2dh_cre_os_user,            --htccd2d_cre_os_user
"
"                           cr19.htccd2dh_cre_emp_id ,            --htccd2d_cre_emp_id
"
"                           cr19.htccd2dh_cre_date   ,             --htccd2d_cre_date
"
"                           cr19.htccd2dh_upd_by       ,            --htccd2d_upd_by
"
"                           cr19.htccd2dh_upd_ip_addr,            --htccd2d_upd_ip_addr
"
"                           cr19.htccd2dh_upd_os_user,            --htccd2d_upd_os_user
"
"                           cr19.htccd2dh_upd_emp_id ,            --htccd2d_upd_emp_id
"
"                           cr19.htccd2dh_upd_date   );            --htccd2d_upd_date
"
"
"
"            END LOOP c19;
"
"
"
"            FOR cr20 IN c20(cr4.htchh_doc_no)
"
"            LOOP
"
"
"
"                    INSERT INTO hrm_tds_elmnt_calc(hthc_bu        ,
"
"                           hthc_doc_no        ,
"
"                           hthc_elmnt_id    ,
"
"                           hthc_ref        ,
"
"                           hthc_amt        ,
"
"                           hthc_calc_flag    ,
"
"                           hthc_cre_by        ,
"
"                           hthc_cre_ip_addr    ,
"
"                           hthc_cre_os_user    ,
"
"                           hthc_cre_emp_id    ,
"
"                           hthc_cre_date    ,
"
"                           hthc_upd_by        ,
"
"                           hthc_upd_ip_addr    ,
"
"                           hthc_upd_os_user    ,
"
"                           hthc_upd_emp_id    ,
"
"                           hthc_upd_date    )
"
"                        VALUES(cr20.hthch_bu    ,            --hthc_bu
"
"                           cr20.hthch_doc_no    ,            --hthc_doc_no
"
"                           cr20.hthch_elmnt_id    ,            --hthc_elmnt_id
"
"                           cr20.hthch_ref    ,            --hthc_ref
"
"                           cr20.hthch_amt    ,            --hthc_amt
"
"                           cr20.hthch_calc_flag    ,            --hthc_calc_flag
"
"                           cr20.hthch_cre_by    ,            --hthc_cre_by
"
"                           cr20.hthch_cre_ip_addr,            --hthc_cre_ip_addr
"
"                           cr20.hthch_cre_os_user,            --hthc_cre_os_user
"
"                           cr20.hthch_cre_emp_id,            --hthc_cre_emp_id
"
"                           cr20.hthch_cre_date    ,            --hthc_cre_date
"
"                           cr20.hthch_upd_by    ,            --hthc_upd_by
"
"                           cr20.hthch_upd_ip_addr,            --hthc_upd_ip_addr
"
"                           cr20.hthch_upd_os_user,            --hthc_upd_os_user
"
"                           cr20.hthch_upd_emp_id,            --hthc_upd_emp_id
"
"                           cr20.hthch_upd_date    );            --hthc_upd_date
"
"
"
"            END LOOP c20;
"
"
"
"            DELETE
"
"              FROM hrm_tds_elmnt_calc_hist
"
"         WHERE hthch_bu     = p_bu
"
"               AND hthch_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccd2_dec_hist
"
"         WHERE htccd2dh_bu     = p_bu
"
"               AND htccd2dh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccd1_dec_hist
"
"         WHERE htccd1dh_bu     = p_bu
"
"               AND htccd1dh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_lta_dec_hist
"
"         WHERE htldh_bu     = p_bu
"
"               AND htldh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_conv_dec_hist
"
"         WHERE htcvdh_bu     = p_bu
"
"               AND htcvdh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80u_dec_hist
"
"         WHERE htudh_bu     = p_bu
"
"               AND htudh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80e_dec_hist
"
"         WHERE htedh_bu     = p_bu
"
"               AND htedh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80g_dec_hist
"
"         WHERE htgdh_bu     = p_bu
"
"               AND htgdh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ddb_dec_hist
"
"         WHERE htddbdh_bu     = p_bu
"
"               AND htddbdh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80dd_dec_hist
"
"         WHERE htdddh_bu     = p_bu
"
"               AND htdddh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80d_dec_hist
"
"         WHERE htddh_bu     = p_bu
"
"               AND htddh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80ccg_dec_hist
"
"         WHERE htccgdh_bu     = p_bu
"
"               AND htccgdh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_80c_dec_hist
"
"         WHERE htcdh_bu     = p_bu
"
"               AND htcdh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_house_property_hist
"
"         WHERE hthph_bu     = p_bu
"
"               AND hthph_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_hra_dec_hist
"
"         WHERE hthrdh_bu     = p_bu
"
"               AND hthrdh_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_calc_pyrl_hist
"
"         WHERE htcph_bu     = p_bu
"
"               AND htcph_doc_no = cr4.htchh_doc_no;
"
"
"
"            DELETE
"
"              FROM hrm_tds_calc_hd_hist
"
"         WHERE htchh_bu     = p_bu
"
"               AND htchh_doc_no = cr4.htchh_doc_no;
"
"
"
"         END LOOP c4;
"
"
"
"         /* End to Insert Employee TDS Calculation */
"
"
"
"      END IF;
"
"
"
"   END proc_reverse_emp_tds_hist;
"
"
"
"END;"
/
