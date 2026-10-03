CREATE OR REPLACE
"PACKAGE BODY pkg_Journal_vou_trans
"
"AS
"
"PROCEDURE proc_cre_pending_payable_mn_jv (
"
"   p_bu              IN     business_units.bu_id%TYPE,
"
"   p_doc_type        IN     VARCHAR2,                      --- JT - Jrnl vouch
"
"   p_plnt            IN     bank_trans.btrans_plant%TYPE,               --Unit
"
"   p_trans_mode      IN     VARCHAR2,        --- P - Payables, R - Receivables
"
"   p_bs_lvl          IN     VARCHAR2,                 --- E - Entity, U - Unit
"
"   p_trans_date      IN     DATE,
"
"   p_user            IN     appl_users.appluser_id%TYPE,
"
"   p_jv_pfx          IN     VARCHAR2,
"
"   p_plnt_loc_id     IN     VARCHAR2,
"
"   p_base_cur_flag      OUT NUMBER,
"
"   p_oth_cur_flag       OUT NUMBER,
"
"   p_ord_no             OUT VARCHAR2)
"
"IS
"
"   /****** This cursor is for Header records ********************/
"
"   v_apmc_prj_req_pay     VARCHAR2 (5) := func_find_apm_prj_req_flag (p_bu);
"
"   v_armc_prj_req_recev   VARCHAR2 (5) := func_find_arm_prj_req_flag (p_bu);
"
"
"
"   CURSOR c1
"
"   IS
"
"       SELECT                                                 /*+ ALL_ROWS */
"
"              SUM (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                  db_amt,
"
"               SUM (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                  cr_amt,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  db_amt_bc,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  cr_amt_bc,
"
"               par_currency
"
"          FROM pending_payables_vw_hist_rev, --   pending_payables_vw_hist_rev  pending_payables_vw_hist
"
"               suplr_cust_ledger_vw_rev,
"
"               acct_type_codes
"
"         WHERE     par_bu = glal_bu
"
"               AND atc_bu = par_bu
"
"               AND atc_code = par_acct_type
"
"               AND (   p_bs_lvl = 'E'
"
"                    OR (    p_bs_lvl = 'U'
"
"                        AND glal_plant = par_plant
"
"                        AND glal_party_plant = par_plant))
"
"               AND glal_suplr_id = par_suplr_id
"
"               AND par_bfcry_type IN ('S', 'C')
"
"               AND ( (par_acct_type IN ('AP', 'AR')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND gacl_lgr_sub_cls_type IN
"
"                             ('SAP',
"
"                              'TDS',
"
"                              'TCS',
"
"                              'SVT',
"
"                              'ESI',
"
"                              'CASH',
"
"                              'IMP',
"
"                              'CAR'))
"
"                    OR ( (par_bfcry_type IN ('S')
"
"                          AND ( (par_acct_type = 'SAD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SAD', 'CAD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N')))
"
"                               OR (par_acct_type = 'SSD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SSD', 'CSD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N'))))
"
"                          OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                              AND par_acct_type = atc_code
"
"                              AND atc_sup_cust_type = 'S'
"
"                              AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                     AND atc_rqrd_type = 'N')
"
"                                   OR (atc_rqrd_type <> 'N'
"
"                                       AND glac_acct_type_code = atc_code))))
"
"                        OR ( (par_bfcry_type IN ('C')
"
"                              AND ( (par_acct_type = 'CAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'CSD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SSD', 'CSD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'EMD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SEMD', 'CEMD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'PBG'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SPBG', 'CPBG')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'RET'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SRET', 'CRET')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (par_acct_type NOT IN
"
"                                     ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'C'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code)))))))
"
"               AND par_sc_bal_amt > par_sc_proc_amt
"
"               AND pdd_bal_amt > pdd_in_progress
"
"               AND pdd_check_flag = 'Y'
"
"               AND par_status = 'P'
"
"               AND par_bu = p_bu
"
"               AND pdd_user = p_user
"
"               AND p_trans_mode = 'P'
"
"      GROUP BY par_currency;
"
"
"
"
"
"   /*********************** This cursor is for distribution Lines *********/
"
"
"
"   CURSOR c2 (
"
"      c_currency VARCHAR2)        ----- MERGE JRNL VOUCHER HEADER,DISTRIBUTION
"
"   IS
"
"      WITH suplr_cust_ledger_tmp
"
"           AS (SELECT
"
"                     glal_bu,
"
"                      glal_plant,
"
"                      glal_party_plant,
"
"                      glal_suplr_id,
"
"                      glac_acct_type_code,
"
"                      gacl_lgr_sub_cls_type,
"
"                      glal_lvl1,
"
"                      glal_lvl2,
"
"                      glal_lvl3,
"
"                      glal_lvl4,
"
"                      glal_lvl5,
"
"                      glal_lvl6,
"
"                      glal_lvl_prj,
"
"                      glal_cc_code,
"
"                      glal_acct,
"
"                      glal_cust_id
"
"                 FROM suplr_cust_ledger_vw_rev
"
"                WHERE glal_bu = p_bu)
"
"        SELECT                                                 /*+ ALL_ROWS */
"
"              SUM (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                  db_amt,
"
"               SUM (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                  cr_amt,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  db_amt_bc,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  cr_amt_bc,
"
"               par_currency,
"
"               glal_lvl1,
"
"               glal_lvl2,
"
"               glal_lvl3,
"
"               glal_lvl4,
"
"               glal_lvl5,
"
"               glal_lvl6,
"
"               glal_lvl_prj,
"
"               -- par_plnt_loc_id glal_plnt_loc_id,
"
"               func_find_dflt_plnt_loc (p_bu, glal_plant) glal_plnt_loc_id,
"
"               glal_cc_code,
"
"               glal_acct,
"
"               glal_plant,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name
"
"          FROM pending_payables_vw_hist_rev,        --pending_payables_vw_hist
"
"               suplr_cust_ledger_tmp,
"
"               acct_type_codes,
"
"               suppliers
"
"         --                         apm_control,
"
"         --                          arm_control
"
"         WHERE     par_bu = glal_bu
"
"               AND atc_bu = par_bu
"
"               AND suplr_bu = par_bu --                       AND apmc_BU=par_bu
"
"               --                      AND armc_bu=par_bu
"
"               AND atc_code = par_acct_type
"
"               AND p_bs_lvl = 'E'
"
"               AND ( (    glal_suplr_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_suplr_id
"
"                      AND par_bfcry_type = 'S')
"
"                    OR (    glal_cust_id = par_suplr_id
"
"                        AND suplr_suplr_id = glal_cust_id
"
"                        AND par_bfcry_type = 'C'))
"
"               AND ( (par_acct_type IN ('AP', 'AR')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND ( (suplr_party_type = 'I'
"
"                             AND gacl_lgr_sub_cls_type = 'IMP')
"
"                           OR (suplr_party_type = 'P'
"
"                               AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                           OR (suplr_party_type NOT IN ('P', 'I')
"
"                               AND gacl_lgr_sub_cls_type IN
"
"                                      ('SAP',
"
"                                       'TDS',
"
"                                       'TCS',
"
"                                       'SVT',
"
"                                       'ESI',
"
"                                       'CASH',
"
"                                       'CAR',
"
"                                       'PF'))))
"
"                    OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND ( (suplr_party_type = 'I'
"
"                                 AND gacl_lgr_sub_cls_type = 'IMP')
"
"                               OR (suplr_party_type = 'P'
"
"                                   AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                               OR (suplr_party_type NOT IN ('P', 'I')
"
"                                   AND gacl_lgr_sub_cls_type IN
"
"                                          ('TDS',
"
"                                           'TCS',
"
"                                           'SVT',
"
"                                           'ESI',
"
"                                           'CASH',
"
"                                           'IMP',
"
"                                           'CAD',
"
"                                           'PF')))))
"
"                    OR (    par_acct_type IN ('SSD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                    OR ( (par_bfcry_type IN ('S')
"
"                          AND ( (par_acct_type = 'SAD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SAD', 'CAD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N')))
"
"                               OR (par_acct_type = 'SSD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SSD', 'CSD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N'))))
"
"                          OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                              AND par_acct_type = atc_code
"
"                              AND atc_sup_cust_type = 'S'
"
"                              AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                     AND atc_rqrd_type = 'N')
"
"                                   OR (atc_rqrd_type <> 'N'
"
"                                       AND glac_acct_type_code = atc_code))))
"
"                        OR ( (par_bfcry_type IN ('C')
"
"                              AND ( (par_acct_type = 'CAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'CSD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SSD', 'CSD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'EMD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SEMD', 'CEMD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'PBG'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SPBG', 'CPBG')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'RET'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SRET', 'CRET')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (par_acct_type NOT IN
"
"                                     ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'C'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code)))))))
"
"               AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"               AND (pdd_bal_amt - pdd_in_progress) > 0
"
"               AND pdd_check_flag = 'Y'
"
"               AND par_status = 'P'
"
"               AND par_bu = p_bu
"
"               AND pdd_user = p_user
"
"               AND p_trans_mode = 'P'
"
"               AND ( ( -- func_find_apm_prj_req_flag(par_bu) = 'N' AND par_bfcry_type = 'S'
"
"                      V_APMC_PRJ_REQ_PAY = 'N' AND par_bfcry_type = 'S')
"
"                    OR ( --func_find_arm_prj_req_flag(par_bu) = 'N' AND par_bfcry_type = 'C'
"
"                        V_ARMC_PRJ_REQ_RECEV = 'N' AND par_bfcry_type = 'C'))
"
"               AND par_currency = c_currency
"
"      GROUP BY par_currency,
"
"               glal_lvl1,
"
"               glal_lvl2,
"
"               glal_lvl3,
"
"               glal_lvl4,
"
"               glal_lvl5,
"
"               glal_lvl6,
"
"               glal_lvl_prj,
"
"               --par_plnt_loc_id,
"
"               func_find_dflt_plnt_loc (p_bu, glal_plant),
"
"               glal_cc_code,
"
"               glal_acct,
"
"               glal_plant,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name
"
"      UNION ALL
"
"        SELECT                                                 /*+ ALL_ROWS */
"
"              SUM (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                  db_amt,
"
"               SUM (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                  cr_amt,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  db_amt_bc,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  cr_amt_bc,
"
"               par_currency,
"
"               glal_lvl1,
"
"               glal_lvl2,
"
"               glal_lvl3,
"
"               glal_lvl4,
"
"               glal_lvl5,
"
"               glal_lvl6,
"
"               glal_lvl_prj,
"
"               -- par_plnt_loc_id glal_plnt_loc_id,
"
"               NVL (par_plnt_loc_id,
"
"                    func_find_dflt_plnt_loc (p_bu, glal_plant))
"
"                  glal_plnt_loc_id,
"
"               glal_cc_code,
"
"               glal_acct,
"
"               glal_plant,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name
"
"          FROM pending_payables_vw_hist_rev,        --pending_payables_vw_hist
"
"               suplr_cust_ledger_tmp,
"
"               acct_type_codes,
"
"               suppliers
"
"         --                         apm_control,
"
"         --                          arm_control
"
"         WHERE     par_bu = glal_bu
"
"               AND atc_bu = par_bu
"
"               AND suplr_bu = par_bu --                       AND apmc_BU=par_bu
"
"               --                      AND armc_bu=par_bu
"
"               AND atc_code = par_acct_type
"
"               AND glal_plant = par_plant
"
"               AND p_bs_lvl = 'U'
"
"               AND glal_party_plant = par_plant
"
"               AND ( (    glal_suplr_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_suplr_id
"
"                      AND par_bfcry_type = 'S')
"
"                    OR (    glal_cust_id = par_suplr_id
"
"                        AND suplr_suplr_id = glal_cust_id
"
"                        AND par_bfcry_type = 'C'))
"
"               /*AND ((par_acct_type IN ('AP', 'AR') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR'))*/
"
"               --                      AND ((par_acct_type IN ('AP', 'AR' ) AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR','PF'))
"
"               --                          OR (par_acct_type IN ('CAD' ,'SAD') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('TDS','TCS','SVT','ESI','CASH','IMP','CAD','PF'))
"
"               AND ( (par_acct_type IN ('AP', 'AR')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND ( (suplr_party_type = 'I'
"
"                             AND gacl_lgr_sub_cls_type = 'IMP')
"
"                           OR (suplr_party_type = 'P'
"
"                               AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                           OR (suplr_party_type NOT IN ('P', 'I')
"
"                               AND gacl_lgr_sub_cls_type IN
"
"                                      ('SAP',
"
"                                       'TDS',
"
"                                       'TCS',
"
"                                       'SVT',
"
"                                       'ESI',
"
"                                       'CASH',
"
"                                       'CAR',
"
"                                       'PF'))))
"
"                    OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND ( (suplr_party_type = 'I'
"
"                                 AND gacl_lgr_sub_cls_type = 'IMP')
"
"                               OR (suplr_party_type = 'P'
"
"                                   AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                               OR (suplr_party_type NOT IN ('P', 'I')
"
"                                   AND gacl_lgr_sub_cls_type IN
"
"                                          ('TDS',
"
"                                           'TCS',
"
"                                           'SVT',
"
"                                           'ESI',
"
"                                           'CASH',
"
"                                           'IMP',
"
"                                           'CAD',
"
"                                           'PF')))))
"
"                    OR (    par_acct_type IN ('SSD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                    OR ( (par_bfcry_type IN ('S')
"
"                          AND ( (par_acct_type = 'SAD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SAD', 'CAD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N')))
"
"                               OR (par_acct_type = 'SSD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SSD', 'CSD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N'))))
"
"                          OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                              AND par_acct_type = atc_code
"
"                              AND atc_sup_cust_type = 'S'
"
"                              AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                     AND atc_rqrd_type = 'N')
"
"                                   OR (atc_rqrd_type <> 'N'
"
"                                       AND glac_acct_type_code = atc_code))))
"
"                        OR ( (par_bfcry_type IN ('C')
"
"                              AND ( (par_acct_type = 'CAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'CSD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SSD', 'CSD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'EMD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SEMD', 'CEMD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'PBG'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SPBG', 'CPBG')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'RET'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SRET', 'CRET')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (par_acct_type NOT IN
"
"                                     ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'C'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code)))))))
"
"               AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"               AND (pdd_bal_amt - pdd_in_progress) > 0
"
"               AND pdd_check_flag = 'Y'
"
"               AND par_status = 'P'
"
"               AND par_bu = p_bu
"
"               AND pdd_user = p_user
"
"               AND p_trans_mode = 'P'
"
"               AND ( ( -- func_find_apm_prj_req_flag(par_bu) = 'N' AND par_bfcry_type = 'S'
"
"                      V_APMC_PRJ_REQ_PAY = 'N' AND par_bfcry_type = 'S')
"
"                    OR ( --func_find_arm_prj_req_flag(par_bu) = 'N' AND par_bfcry_type = 'C'
"
"                        V_ARMC_PRJ_REQ_RECEV = 'N' AND par_bfcry_type = 'C'))
"
"               AND par_currency = c_currency
"
"      GROUP BY par_currency,
"
"               glal_lvl1,
"
"               glal_lvl2,
"
"               glal_lvl3,
"
"               glal_lvl4,
"
"               glal_lvl5,
"
"               glal_lvl6,
"
"               glal_lvl_prj,
"
"               --par_plnt_loc_id,
"
"               NVL (par_plnt_loc_id,
"
"                    func_find_dflt_plnt_loc (p_bu, glal_plant)),
"
"               glal_cc_code,
"
"               glal_acct,
"
"               glal_plant,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name
"
"      UNION ALL
"
"        SELECT                                                 /*+ ALL_ROWS */
"
"              SUM (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                  db_amt,
"
"               SUM (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                  cr_amt,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  db_amt_bc,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  cr_amt_bc,
"
"               par_currency,
"
"               PCC_AC_LVL1 glal_lvl1,
"
"               PCC_AC_LVL2 glal_lvl2,
"
"               PCC_AC_LVL3 glal_lvl3,
"
"               PCC_AC_LVL4 glal_lvl4,
"
"               PCC_AC_LVL5 glal_lvl5,
"
"               PCC_AC_LVL6 glal_lvl6,
"
"               PCC_AC_LVL_PRJ glal_lvl_prj,
"
"               --par_plnt_loc_id glal_plnt_loc_id,
"
"               func_find_dflt_plnt_loc (p_bu, PCC_AC_PLNT) glal_plnt_loc_id,
"
"               PCC_CC_CODE glal_cc_code,
"
"               glal_acct,
"
"               PCC_AC_PLNT glal_plant,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name
"
"          FROM pending_payables_vw_hist_rev,        --pending_payables_vw_hist
"
"               suplr_cust_ledger_tmp,
"
"               acct_type_codes,
"
"               profit_cost_centers,
"
"               suppliers
"
"         --                          apm_control,
"
"         --                          arm_control
"
"         WHERE     par_bu = glal_bu
"
"               AND atc_bu = par_bu
"
"               AND atc_code = par_acct_type
"
"               AND par_bu = pcc_bu
"
"               AND suplr_bu = pcc_bu
"
"               --                        AND apmc_BU=par_bu
"
"               --                      AND armc_bu=par_bu
"
"               --AND par_proj_id = pcc_ac_lvl_prj
"
"               AND ( ( (V_APMC_PRJ_REQ_PAY = 'Y' OR V_ARMC_PRJ_REQ_RECEV = 'Y')
"
"                      AND par_proj_id = pcc_ac_lvl_prj)
"
"                    OR ( (V_APMC_PRJ_REQ_PAY = 'C'
"
"                          OR V_ARMC_PRJ_REQ_RECEV = 'C')
"
"                        AND par_proj_id = pcc_cc_code))
"
"               AND par_plant = pcc_ac_plnt
"
"               -- AND pcc_default_flag = 'Y'
"
"               AND p_bs_lvl = 'E'
"
"               AND ( (    glal_suplr_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_suplr_id
"
"                      AND par_bfcry_type = 'S')
"
"                    OR (    glal_cust_id = par_suplr_id
"
"                        AND suplr_suplr_id = glal_cust_id
"
"                        AND par_bfcry_type = 'C'))
"
"               --AND ((par_acct_type IN ('AP', 'AR') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR'))
"
"               AND ( (par_acct_type IN ('AP', 'AR')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND ( (suplr_party_type = 'I'
"
"                             AND gacl_lgr_sub_cls_type = 'IMP')
"
"                           OR (suplr_party_type = 'P'
"
"                               AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                           OR (suplr_party_type NOT IN ('P', 'I')
"
"                               AND gacl_lgr_sub_cls_type IN
"
"                                      ('SAP',
"
"                                       'TDS',
"
"                                       'TCS',
"
"                                       'SVT',
"
"                                       'ESI',
"
"                                       'CASH',
"
"                                       'CAR',
"
"                                       'PF'))))
"
"                    OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND ( (suplr_party_type = 'I'
"
"                                 AND gacl_lgr_sub_cls_type = 'IMP')
"
"                               OR (suplr_party_type = 'P'
"
"                                   AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                               OR (suplr_party_type NOT IN ('P', 'I')
"
"                                   AND gacl_lgr_sub_cls_type IN
"
"                                          ('TDS',
"
"                                           'TCS',
"
"                                           'SVT',
"
"                                           'ESI',
"
"                                           'CASH',
"
"                                           'IMP',
"
"                                           'CAD',
"
"                                           'PF')))))
"
"                    OR (    par_acct_type IN ('SSD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                    OR ( (par_bfcry_type IN ('S')
"
"                          AND ( (par_acct_type = 'SAD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SAD', 'CAD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N')))
"
"                               OR (par_acct_type = 'SSD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SSD', 'CSD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N'))))
"
"                          OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                              AND par_acct_type = atc_code
"
"                              AND atc_sup_cust_type = 'S'
"
"                              AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                     AND atc_rqrd_type = 'N')
"
"                                   OR (atc_rqrd_type <> 'N'
"
"                                       AND glac_acct_type_code = atc_code))))
"
"                        OR ( (par_bfcry_type IN ('C')
"
"                              AND ( (par_acct_type = 'CAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'CSD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SSD', 'CSD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'EMD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SEMD', 'CEMD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'PBG'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SPBG', 'CPBG')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'RET'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SRET', 'CRET')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (par_acct_type NOT IN
"
"                                     ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'C'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code)))))))
"
"               AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"               AND (pdd_bal_amt - pdd_in_progress) > 0
"
"               AND pdd_check_flag = 'Y'
"
"               AND pcc_active_flag = 'Y'
"
"               --AND pcc_default_flag = 'Y'
"
"               AND par_status = 'P'
"
"               AND par_bu = p_bu
"
"               AND pdd_user = p_user
"
"               AND p_trans_mode = 'P'
"
"               AND ( (                    --func_find_apm_prj_req_flag(par_bu)
"
"                      V_APMC_PRJ_REQ_PAY IN ('Y', 'C')
"
"                      AND par_bfcry_type = 'S')
"
"                    OR (                  --func_find_arm_prj_req_flag(par_bu)
"
"                        V_ARMC_PRJ_REQ_RECEV IN ('Y', 'C')
"
"                        AND par_bfcry_type = 'C'))
"
"               AND par_proj_id IS NOT NULL
"
"               AND par_currency = c_currency
"
"      GROUP BY par_currency,
"
"               PCC_AC_LVL1,
"
"               PCC_AC_LVL2,
"
"               PCC_AC_LVL3,
"
"               PCC_AC_LVL4,
"
"               PCC_AC_LVL5,
"
"               PCC_AC_LVL6,
"
"               PCC_AC_LVL_PRJ,
"
"               --par_plnt_loc_id,
"
"               func_find_dflt_plnt_loc (p_bu, PCC_AC_PLNT),
"
"               PCC_CC_CODE,
"
"               glal_acct,
"
"               PCC_AC_PLNT,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name
"
"      UNION ALL
"
"        SELECT                                                 /*+ ALL_ROWS */
"
"              SUM (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                  db_amt,
"
"               SUM (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                  cr_amt,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  db_amt_bc,
"
"               SUM (
"
"                  CASE
"
"                     WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                     ELSE 0
"
"                  END)
"
"                  cr_amt_bc,
"
"               par_currency,
"
"               PCC_AC_LVL1 glal_lvl1,
"
"               PCC_AC_LVL2 glal_lvl2,
"
"               PCC_AC_LVL3 glal_lvl3,
"
"               PCC_AC_LVL4 glal_lvl4,
"
"               PCC_AC_LVL5 glal_lvl5,
"
"               PCC_AC_LVL6 glal_lvl6,
"
"               PCC_AC_LVL_PRJ glal_lvl_prj,
"
"               --par_plnt_loc_id glal_plnt_loc_id,
"
"               NVL (par_plnt_loc_id,
"
"                    func_find_dflt_plnt_loc (p_bu, PCC_AC_PLNT))
"
"                  glal_plnt_loc_id,
"
"               PCC_CC_CODE glal_cc_code,
"
"               glal_acct,
"
"               PCC_AC_PLNT glal_plant,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name
"
"          FROM pending_payables_vw_hist_rev,        --pending_payables_vw_hist
"
"               suplr_cust_ledger_tmp,
"
"               acct_type_codes,
"
"               profit_cost_centers,
"
"               suppliers
"
"         --                          apm_control,
"
"         --                          arm_control
"
"         WHERE     par_bu = glal_bu
"
"               AND atc_bu = par_bu
"
"               AND atc_code = par_acct_type
"
"               AND par_bu = pcc_bu
"
"               AND suplr_bu = pcc_bu
"
"               --                        AND apmc_BU=par_bu
"
"               --                      AND armc_bu=par_bu
"
"               -- AND par_proj_id = pcc_ac_lvl_prj
"
"               AND ( ( (V_APMC_PRJ_REQ_PAY = 'Y' OR V_ARMC_PRJ_REQ_RECEV = 'Y')
"
"                      AND par_proj_id = pcc_ac_lvl_prj)
"
"                    OR ( (V_APMC_PRJ_REQ_PAY = 'C'
"
"                          OR V_ARMC_PRJ_REQ_RECEV = 'C')
"
"                        AND par_proj_id = pcc_cc_code))
"
"               AND par_plant = pcc_ac_plnt
"
"               AND glal_plant = par_plant
"
"               AND p_bs_lvl = 'U'
"
"               AND glal_party_plant = par_plant
"
"               AND ( (    glal_suplr_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_suplr_id
"
"                      AND par_bfcry_type = 'S')
"
"                    OR (    glal_cust_id = par_suplr_id
"
"                        AND suplr_suplr_id = glal_cust_id
"
"                        AND par_bfcry_type = 'C'))
"
"               --AND ((par_acct_type IN ('AP', 'AR') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR'))
"
"               AND ( (par_acct_type IN ('AP', 'AR')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND ( (suplr_party_type = 'I'
"
"                             AND gacl_lgr_sub_cls_type = 'IMP')
"
"                           OR (suplr_party_type = 'P'
"
"                               AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                           OR (suplr_party_type NOT IN ('P', 'I')
"
"                               AND gacl_lgr_sub_cls_type IN
"
"                                      ('SAP',
"
"                                       'TDS',
"
"                                       'TCS',
"
"                                       'SVT',
"
"                                       'ESI',
"
"                                       'CASH',
"
"                                       'CAR',
"
"                                       'PF'))))
"
"                    OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND ( (suplr_party_type = 'I'
"
"                                 AND gacl_lgr_sub_cls_type = 'IMP')
"
"                               OR (suplr_party_type = 'P'
"
"                                   AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                               OR (suplr_party_type NOT IN ('P', 'I')
"
"                                   AND gacl_lgr_sub_cls_type IN
"
"                                          ('TDS',
"
"                                           'TCS',
"
"                                           'SVT',
"
"                                           'ESI',
"
"                                           'CASH',
"
"                                           'IMP',
"
"                                           'CAD',
"
"                                           'PF')))))
"
"                    OR (    par_acct_type IN ('SSD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                    OR ( (par_bfcry_type IN ('S')
"
"                          AND ( (par_acct_type = 'SAD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SAD', 'CAD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N')))
"
"                               OR (par_acct_type = 'SSD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SSD', 'CSD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N'))))
"
"                          OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                              AND par_acct_type = atc_code
"
"                              AND atc_sup_cust_type = 'S'
"
"                              AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                     AND atc_rqrd_type = 'N')
"
"                                   OR (atc_rqrd_type <> 'N'
"
"                                       AND glac_acct_type_code = atc_code))))
"
"                        OR ( (par_bfcry_type IN ('C')
"
"                              AND ( (par_acct_type = 'CAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'CSD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SSD', 'CSD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'EMD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SEMD', 'CEMD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'PBG'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SPBG', 'CPBG')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'RET'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SRET', 'CRET')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (par_acct_type NOT IN
"
"                                     ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'C'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code)))))))
"
"               AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"               AND (pdd_bal_amt - pdd_in_progress) > 0
"
"               AND pdd_check_flag = 'Y'
"
"               AND pcc_active_flag = 'Y'
"
"               --AND pcc_default_flag = 'Y'
"
"               AND par_status = 'P'
"
"               AND par_bu = p_bu
"
"               AND pdd_user = p_user
"
"               AND p_trans_mode = 'P'
"
"               AND ( (                    --func_find_apm_prj_req_flag(par_bu)
"
"                      V_APMC_PRJ_REQ_PAY IN ('Y', 'C')
"
"                      AND par_bfcry_type = 'S')
"
"                    OR (                  --func_find_arm_prj_req_flag(par_bu)
"
"                        V_ARMC_PRJ_REQ_RECEV IN ('Y', 'C')
"
"                        AND par_bfcry_type = 'C'))
"
"               AND par_proj_id IS NOT NULL
"
"               AND par_currency = c_currency
"
"      GROUP BY par_currency,
"
"               PCC_AC_LVL1,
"
"               PCC_AC_LVL2,
"
"               PCC_AC_LVL3,
"
"               PCC_AC_LVL4,
"
"               PCC_AC_LVL5,
"
"               PCC_AC_LVL6,
"
"               PCC_AC_LVL_PRJ,
"
"               --par_plnt_loc_id,
"
"               NVL (par_plnt_loc_id,
"
"                    func_find_dflt_plnt_loc (p_bu, PCC_AC_PLNT)),
"
"               PCC_CC_CODE,
"
"               glal_acct,
"
"               PCC_AC_PLNT,
"
"               par_suplr_id,
"
"               par_bfcry_type,
"
"               --par_loc_id
"
"               par_loc_name;
"
"
"
"
"
"   /*********************** This cursor is for bill details*********/
"
"
"
"   CURSOR c3 (
"
"      c_plant          VARCHAR2,                             ---  BILL DETAILS
"
"      c_lvl1           VARCHAR2,
"
"      c_lvl2           VARCHAR2,
"
"      c_lvl3           VARCHAR2,
"
"      c_lvl4           VARCHAR2,
"
"      c_lvl5           VARCHAR2,
"
"      c_lvl6           VARCHAR2,
"
"      c_lvl_prj        VARCHAR2,
"
"      c_plnt_loc_id    VARCHAR2,
"
"      c_acct           VARCHAR2,
"
"      c_curr           VARCHAR2,
"
"      c_suplr_id       VARCHAR2,
"
"      c_bfcry_type     VARCHAR2,
"
"      c_loc_id         VARCHAR2)
"
"   IS
"
"      WITH suplr_cust_ledger_tmp
"
"           AS (SELECT   /*+ MATERIALIZE ALL_ROWS */
"
"                      glal_bu,
"
"                      glal_plant,
"
"                      glal_party_plant,
"
"                      glal_suplr_id,
"
"                      glac_acct_type_code,
"
"                      gacl_lgr_sub_cls_type,
"
"                      glal_lvl1,
"
"                      glal_lvl2,
"
"                      glal_lvl3,
"
"                      glal_lvl4,
"
"                      glal_lvl5,
"
"                      glal_lvl6,
"
"                      glal_lvl_prj,
"
"                      glal_cc_code,
"
"                      glal_acct,
"
"                      glal_cust_id
"
"                 FROM suplr_cust_ledger_vw_rev
"
"                WHERE glal_bu = p_bu)
"
"      SELECT                                                   /*+ ALL_ROWS */
"
"            par_doc_date,
"
"             par_pfx,
"
"             par_doc_no,
"
"             par_plant,
"
"             par_bfcry_type,
"
"             par_suplr_id,
"
"             pdd_seq_no,
"
"             pdd_due_date,
"
"             par_aged_days,
"
"             pdd_due_amt,
"
"             pdd_pay_amt,
"
"             par_acct_type,
"
"             par_currency,
"
"             par_exchange_rate,
"
"             par_suplr_reference,
"
"             par_suplr_doc_date,
"
"             par_suplr_doc_no,
"
"             par_doc_type,
"
"             -- par_doc_mode,
"
"             --par_loc_id,
"
"             par_ref_bu,
"
"             par_ref_inv_pfx,
"
"             par_ref_inv_no,
"
"             par_ref_plnt,
"
"             par_bill_amt,
"
"             par_tax_amt,
"
"             par_dr_cr,
"
"             par_proj_id,
"
"             --par_plnt_loc_id,
"
"             func_find_dflt_plnt_loc (p_bu, par_plant) par_plnt_loc_id,
"
"             par_loc_name
"
"        FROM pending_payables_vw_hist_rev,          --pending_payables_vw_hist
"
"             suplr_cust_ledger_tmp,
"
"             acct_type_codes,
"
"             suppliers
"
"       --                        apm_control,
"
"       --                          arm_control
"
"       WHERE     par_bu = glal_bu
"
"             AND atc_bu = par_bu
"
"             AND suplr_bu = par_bu   --                     AND apmc_BU=par_bu
"
"             --                      AND armc_bu=par_bu
"
"             AND atc_code = par_acct_type
"
"             AND p_bs_lvl = 'E'
"
"             AND ( (    glal_suplr_id = par_suplr_id
"
"                    AND suplr_suplr_id = glal_suplr_id
"
"                    AND par_bfcry_type = 'S')
"
"                  OR (    glal_cust_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_cust_id
"
"                      AND par_bfcry_type = 'C'))
"
"             --AND ((par_acct_type IN ('AP', 'AR') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR'))
"
"             AND ( (par_acct_type IN ('AP', 'AR')
"
"                    AND par_bfcry_type IN ('S', 'C')
"
"                    AND ( (suplr_party_type = 'I'
"
"                           AND gacl_lgr_sub_cls_type = 'IMP')
"
"                         OR (suplr_party_type = 'P'
"
"                             AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                         OR (suplr_party_type NOT IN ('P', 'I')
"
"                             AND gacl_lgr_sub_cls_type IN
"
"                                    ('SAP',
"
"                                     'TDS',
"
"                                     'TCS',
"
"                                     'SVT',
"
"                                     'ESI',
"
"                                     'CASH',
"
"                                     'CAR',
"
"                                     'PF'))))
"
"                  OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND ( (suplr_party_type = 'I'
"
"                               AND gacl_lgr_sub_cls_type = 'IMP')
"
"                             OR (suplr_party_type = 'P'
"
"                                 AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                             OR (suplr_party_type NOT IN ('P', 'I')
"
"                                 AND gacl_lgr_sub_cls_type IN
"
"                                        ('TDS',
"
"                                         'TCS',
"
"                                         'SVT',
"
"                                         'ESI',
"
"                                         'CASH',
"
"                                         'IMP',
"
"                                         'CAD',
"
"                                         'PF')))))
"
"                  OR (    par_acct_type IN ('SSD')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                  OR ( (par_bfcry_type IN ('S')
"
"                        AND ( (par_acct_type = 'SAD'
"
"                               AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                      AND atc_rqrd_type = 'N')
"
"                                    OR (gacl_lgr_sub_cls_type IN
"
"                                           ('SAD', 'CAD')
"
"                                        AND glac_acct_type_code = atc_code
"
"                                        AND atc_rqrd_type <> 'N')))
"
"                             OR (par_acct_type = 'SSD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN
"
"                                           ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SSD', 'CSD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N'))))
"
"                        OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                            AND par_acct_type = atc_code
"
"                            AND atc_sup_cust_type = 'S'
"
"                            AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                   AND atc_rqrd_type = 'N')
"
"                                 OR (atc_rqrd_type <> 'N'
"
"                                     AND glac_acct_type_code = atc_code))))
"
"                      OR ( (par_bfcry_type IN ('C')
"
"                            AND ( (par_acct_type = 'CAD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SAD', 'CAD')
"
"                                            AND glac_acct_type_code =
"
"                                                   atc_code
"
"                                            AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'CSD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SSD', 'CSD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'EMD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SEMD', 'CEMD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'PBG'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SPBG', 'CPBG')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'RET'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SRET', 'CRET')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N'))))
"
"                            OR (par_acct_type NOT IN
"
"                                   ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                AND par_acct_type = atc_code
"
"                                AND atc_sup_cust_type = 'C'
"
"                                AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                       AND atc_rqrd_type = 'N')
"
"                                     OR (atc_rqrd_type <> 'N'
"
"                                         AND glac_acct_type_code = atc_code)))))))
"
"             AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND p_trans_mode = 'P'
"
"             AND glal_acct = c_acct
"
"             AND par_currency = c_curr
"
"             AND par_suplr_id = c_suplr_id
"
"             AND par_bfcry_type = c_bfcry_type
"
"             AND ( (                     -- func_find_apm_prj_req_flag(par_bu)
"
"                    V_APMC_PRJ_REQ_PAY = 'N' AND par_bfcry_type = 'S')
"
"                  OR (                   -- func_find_arm_prj_req_flag(par_bu)
"
"                      V_ARMC_PRJ_REQ_RECEV = 'N' AND par_bfcry_type = 'C'))
"
"      UNION ALL
"
"      SELECT                                                   /*+ ALL_ROWS */
"
"            par_doc_date,
"
"             par_pfx,
"
"             par_doc_no,
"
"             par_plant,
"
"             par_bfcry_type,
"
"             par_suplr_id,
"
"             pdd_seq_no,
"
"             pdd_due_date,
"
"             par_aged_days,
"
"             pdd_due_amt,
"
"             pdd_pay_amt,
"
"             par_acct_type,
"
"             par_currency,
"
"             par_exchange_rate,
"
"             par_suplr_reference,
"
"             par_suplr_doc_date,
"
"             par_suplr_doc_no,
"
"             par_doc_type,
"
"             -- par_doc_mode,
"
"             --par_loc_id,
"
"             par_ref_bu,
"
"             par_ref_inv_pfx,
"
"             par_ref_inv_no,
"
"             par_ref_plnt,
"
"             par_bill_amt,
"
"             par_tax_amt,
"
"             par_dr_cr,
"
"             par_proj_id,
"
"             --par_plnt_loc_id,
"
"             NVL (par_plnt_loc_id, func_find_dflt_plnt_loc (p_bu, par_plant))
"
"                par_plnt_loc_id,
"
"             par_loc_name
"
"        FROM pending_payables_vw_hist_rev,          --pending_payables_vw_hist
"
"             suplr_cust_ledger_tmp,
"
"             acct_type_codes,
"
"             suppliers
"
"       WHERE     par_bu = glal_bu
"
"             AND atc_bu = par_bu
"
"             AND suplr_bu = par_bu
"
"             AND atc_code = par_acct_type
"
"             AND ( (    glal_plant = par_plant
"
"                    AND p_bs_lvl = 'U'
"
"                    AND glal_party_plant = par_plant))
"
"             AND ( (    glal_suplr_id = par_suplr_id
"
"                    AND suplr_suplr_id = glal_suplr_id
"
"                    AND par_bfcry_type = 'S')
"
"                  OR (    glal_cust_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_cust_id
"
"                      AND par_bfcry_type = 'C'))
"
"             AND ( (par_acct_type IN ('AP', 'AR')
"
"                    AND par_bfcry_type IN ('S', 'C')
"
"                    AND ( (suplr_party_type = 'I'
"
"                           AND gacl_lgr_sub_cls_type = 'IMP')
"
"                         OR (suplr_party_type = 'P'
"
"                             AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                         OR (suplr_party_type NOT IN ('P', 'I')
"
"                             AND gacl_lgr_sub_cls_type IN
"
"                                    ('SAP',
"
"                                     'TDS',
"
"                                     'TCS',
"
"                                     'SVT',
"
"                                     'ESI',
"
"                                     'CASH',
"
"                                     'CAR',
"
"                                     'PF'))))
"
"                  OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND ( (suplr_party_type = 'I'
"
"                               AND gacl_lgr_sub_cls_type = 'IMP')
"
"                             OR (suplr_party_type = 'P'
"
"                                 AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                             OR (suplr_party_type NOT IN ('P', 'I')
"
"                                 AND gacl_lgr_sub_cls_type IN
"
"                                        ('TDS',
"
"                                         'TCS',
"
"                                         'SVT',
"
"                                         'ESI',
"
"                                         'CASH',
"
"                                         'IMP',
"
"                                         'CAD',
"
"                                         'PF')))))
"
"                  OR (    par_acct_type IN ('SSD')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                  OR ( (par_bfcry_type IN ('S')
"
"                        AND ( (par_acct_type = 'SAD'
"
"                               AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                      AND atc_rqrd_type = 'N')
"
"                                    OR (gacl_lgr_sub_cls_type IN
"
"                                           ('SAD', 'CAD')
"
"                                        AND glac_acct_type_code = atc_code
"
"                                        AND atc_rqrd_type <> 'N')))
"
"                             OR (par_acct_type = 'SSD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN
"
"                                           ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SSD', 'CSD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N'))))
"
"                        OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                            AND par_acct_type = atc_code
"
"                            AND atc_sup_cust_type = 'S'
"
"                            AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                   AND atc_rqrd_type = 'N')
"
"                                 OR (atc_rqrd_type <> 'N'
"
"                                     AND glac_acct_type_code = atc_code))))
"
"                      OR ( (par_bfcry_type IN ('C')
"
"                            AND ( (par_acct_type = 'CAD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SAD', 'CAD')
"
"                                            AND glac_acct_type_code =
"
"                                                   atc_code
"
"                                            AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'CSD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SSD', 'CSD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'EMD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SEMD', 'CEMD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'PBG'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SPBG', 'CPBG')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'RET'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SRET', 'CRET')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N'))))
"
"                            OR (par_acct_type NOT IN
"
"                                   ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                AND par_acct_type = atc_code
"
"                                AND atc_sup_cust_type = 'C'
"
"                                AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                       AND atc_rqrd_type = 'N')
"
"                                     OR (atc_rqrd_type <> 'N'
"
"                                         AND glac_acct_type_code = atc_code)))))))
"
"             AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND p_trans_mode = 'P'
"
"             AND glal_plant = c_plant
"
"             AND glal_lvl1 = c_lvl1
"
"             AND glal_lvl2 = c_lvl2
"
"             AND glal_lvl3 = c_lvl3
"
"             AND glal_lvl4 = c_lvl4
"
"             AND glal_lvl5 = c_lvl5
"
"             AND glal_lvl6 = c_lvl6
"
"             AND glal_lvl_prj = c_lvl_prj
"
"             AND par_plnt_loc_id = c_plnt_loc_id
"
"             AND glal_acct = c_acct
"
"             AND par_currency = c_curr
"
"             AND par_suplr_id = c_suplr_id
"
"             AND par_bfcry_type = c_bfcry_type
"
"             AND ( (                     -- func_find_apm_prj_req_flag(par_bu)
"
"                    V_APMC_PRJ_REQ_PAY = 'N' AND par_bfcry_type = 'S')
"
"                  OR (                   -- func_find_arm_prj_req_flag(par_bu)
"
"                      V_ARMC_PRJ_REQ_RECEV = 'N' AND par_bfcry_type = 'C'))
"
"      UNION ALL
"
"      SELECT                                                   /*+ ALL_ROWS */
"
"            par_doc_date,
"
"             par_pfx,
"
"             par_doc_no,
"
"             par_plant,
"
"             par_bfcry_type,
"
"             par_suplr_id,
"
"             pdd_seq_no,
"
"             pdd_due_date,
"
"             par_aged_days,
"
"             pdd_due_amt,
"
"             pdd_pay_amt,
"
"             par_acct_type,
"
"             par_currency,
"
"             par_exchange_rate,
"
"             par_suplr_reference,
"
"             par_suplr_doc_date,
"
"             par_suplr_doc_no,
"
"             par_doc_type,
"
"             --par_doc_mode,
"
"             --par_loc_id,
"
"             par_ref_bu,
"
"             par_ref_inv_pfx,
"
"             par_ref_inv_no,
"
"             par_ref_plnt,
"
"             par_bill_amt,
"
"             par_tax_amt,
"
"             par_dr_cr,
"
"             par_proj_id,
"
"             --  par_plnt_loc_id,
"
"             func_find_dflt_plnt_loc (p_bu, par_plant) par_plnt_loc_id,
"
"             par_loc_name
"
"        FROM pending_payables_vw_hist_rev,          --pending_payables_vw_hist
"
"             suplr_cust_ledger_tmp,
"
"             acct_type_codes,
"
"             profit_cost_centers,
"
"             suppliers
"
"       --                        apm_control,
"
"       --                          arm_control
"
"       WHERE     par_bu = glal_bu
"
"             AND atc_bu = par_bu
"
"             AND atc_code = par_acct_type
"
"             AND par_bu = pcc_bu
"
"             AND suplr_bu = pcc_bu
"
"             --                     AND apmc_BU=par_bu
"
"             --                      AND armc_bu=par_bu
"
"             -- AND par_proj_id = pcc_ac_lvl_prj
"
"             AND ( ( (V_APMC_PRJ_REQ_PAY = 'Y' OR V_ARMC_PRJ_REQ_RECEV = 'Y')
"
"                    AND par_proj_id = pcc_ac_lvl_prj)
"
"                  OR ( (V_APMC_PRJ_REQ_PAY = 'C'
"
"                        OR V_ARMC_PRJ_REQ_RECEV = 'C')
"
"                      AND par_proj_id = pcc_cc_code))
"
"             AND par_plant = pcc_ac_plnt
"
"             --AND pcc_default_flag = 'Y'
"
"             AND p_bs_lvl = 'E'
"
"             AND ( (    glal_suplr_id = par_suplr_id
"
"                    AND suplr_suplr_id = glal_suplr_id
"
"                    AND par_bfcry_type = 'S')
"
"                  OR (    glal_cust_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_cust_id
"
"                      AND par_bfcry_type = 'C'))
"
"             --AND ((par_acct_type IN ('AP', 'AR') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR'))
"
"             AND ( (par_acct_type IN ('AP', 'AR')
"
"                    AND par_bfcry_type IN ('S', 'C')
"
"                    AND ( (suplr_party_type = 'I'
"
"                           AND gacl_lgr_sub_cls_type = 'IMP')
"
"                         OR (suplr_party_type = 'P'
"
"                             AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                         OR (suplr_party_type NOT IN ('P', 'I')
"
"                             AND gacl_lgr_sub_cls_type IN
"
"                                    ('SAP',
"
"                                     'TDS',
"
"                                     'TCS',
"
"                                     'SVT',
"
"                                     'ESI',
"
"                                     'CASH',
"
"                                     'CAR',
"
"                                     'PF'))))
"
"                  OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND ( (suplr_party_type = 'I'
"
"                               AND gacl_lgr_sub_cls_type = 'IMP')
"
"                             OR (suplr_party_type = 'P'
"
"                                 AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                             OR (suplr_party_type NOT IN ('P', 'I')
"
"                                 AND gacl_lgr_sub_cls_type IN
"
"                                        ('TDS',
"
"                                         'TCS',
"
"                                         'SVT',
"
"                                         'ESI',
"
"                                         'CASH',
"
"                                         'IMP',
"
"                                         'CAD',
"
"                                         'PF')))))
"
"                  OR (    par_acct_type IN ('SSD')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                  OR ( (par_bfcry_type IN ('S')
"
"                        AND ( (par_acct_type = 'SAD'
"
"                               AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                      AND atc_rqrd_type = 'N')
"
"                                    OR (gacl_lgr_sub_cls_type IN
"
"                                           ('SAD', 'CAD')
"
"                                        AND glac_acct_type_code = atc_code
"
"                                        AND atc_rqrd_type <> 'N')))
"
"                             OR (par_acct_type = 'SSD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN
"
"                                           ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SSD', 'CSD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N'))))
"
"                        OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                            AND par_acct_type = atc_code
"
"                            AND atc_sup_cust_type = 'S'
"
"                            AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                   AND atc_rqrd_type = 'N')
"
"                                 OR (atc_rqrd_type <> 'N'
"
"                                     AND glac_acct_type_code = atc_code))))
"
"                      OR ( (par_bfcry_type IN ('C')
"
"                            AND ( (par_acct_type = 'CAD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SAD', 'CAD')
"
"                                            AND glac_acct_type_code =
"
"                                                   atc_code
"
"                                            AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'CSD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SSD', 'CSD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'EMD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SEMD', 'CEMD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'PBG'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SPBG', 'CPBG')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'RET'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SRET', 'CRET')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N'))))
"
"                            OR (par_acct_type NOT IN
"
"                                   ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                AND par_acct_type = atc_code
"
"                                AND atc_sup_cust_type = 'C'
"
"                                AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                       AND atc_rqrd_type = 'N')
"
"                                     OR (atc_rqrd_type <> 'N'
"
"                                         AND glac_acct_type_code = atc_code)))))))
"
"             AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND pcc_active_flag = 'Y'
"
"             -- AND pcc_default_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND p_trans_mode = 'P'
"
"             AND glal_acct = c_acct
"
"             AND par_currency = c_curr
"
"             AND par_suplr_id = c_suplr_id
"
"             AND par_bfcry_type = c_bfcry_type
"
"             AND par_proj_id IS NOT NULL
"
"             --      AND FUNC_FIND_APM_PRJ_REQ_FLAG(p_bu) = 'Y'
"
"             AND ( (                      --func_find_apm_prj_req_flag(par_bu)
"
"                    V_APMC_PRJ_REQ_PAY IN ('Y', 'C')
"
"                    AND par_bfcry_type = 'S')
"
"                  OR (                    --func_find_arm_prj_req_flag(par_bu)
"
"                      V_ARMC_PRJ_REQ_RECEV IN ('Y', 'C')
"
"                      AND par_bfcry_type = 'C'))
"
"      UNION ALL
"
"      SELECT                                                 /*+ FIRST_ROWS */
"
"            par_doc_date,
"
"             par_pfx,
"
"             par_doc_no,
"
"             par_plant,
"
"             par_bfcry_type,
"
"             par_suplr_id,
"
"             pdd_seq_no,
"
"             pdd_due_date,
"
"             par_aged_days,
"
"             pdd_due_amt,
"
"             pdd_pay_amt,
"
"             par_acct_type,
"
"             par_currency,
"
"             par_exchange_rate,
"
"             par_suplr_reference,
"
"             par_suplr_doc_date,
"
"             par_suplr_doc_no,
"
"             par_doc_type,
"
"             --par_doc_mode,
"
"             --par_loc_id,
"
"             par_ref_bu,
"
"             par_ref_inv_pfx,
"
"             par_ref_inv_no,
"
"             par_ref_plnt,
"
"             par_bill_amt,
"
"             par_tax_amt,
"
"             par_dr_cr,
"
"             par_proj_id,
"
"             --  par_plnt_loc_id,
"
"             NVL (par_plnt_loc_id, func_find_dflt_plnt_loc (p_bu, par_plant))
"
"                par_plnt_loc_id,
"
"             par_loc_name
"
"        FROM pending_payables_vw_hist_rev,          --pending_payables_vw_hist
"
"             suplr_cust_ledger_tmp,
"
"             acct_type_codes,
"
"             profit_cost_centers,
"
"             suppliers
"
"       --                        apm_control,
"
"       --                          arm_control
"
"       WHERE     par_bu = glal_bu
"
"             AND atc_bu = par_bu
"
"             AND atc_code = par_acct_type
"
"             AND par_bu = pcc_bu
"
"             AND suplr_bu = pcc_bu
"
"             --                     AND apmc_BU=par_bu
"
"             --                      AND armc_bu=par_bu
"
"             -- AND par_proj_id = pcc_ac_lvl_prj
"
"             AND ( ( (V_APMC_PRJ_REQ_PAY = 'Y' OR V_ARMC_PRJ_REQ_RECEV = 'Y')
"
"                    AND par_proj_id = pcc_ac_lvl_prj)
"
"                  OR ( (V_APMC_PRJ_REQ_PAY = 'C'
"
"                        OR V_ARMC_PRJ_REQ_RECEV = 'C')
"
"                      AND par_proj_id = pcc_cc_code))
"
"             AND par_plant = pcc_ac_plnt
"
"             --AND pcc_default_flag = 'Y'
"
"             AND glal_plant = par_plant
"
"             AND p_bs_lvl = 'U'
"
"             AND glal_party_plant = par_plant
"
"             AND ( (    glal_suplr_id = par_suplr_id
"
"                    AND suplr_suplr_id = glal_suplr_id
"
"                    AND par_bfcry_type = 'S')
"
"                  OR (    glal_cust_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_cust_id
"
"                      AND par_bfcry_type = 'C'))
"
"             --AND ((par_acct_type IN ('AP', 'AR') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR'))
"
"             AND ( (par_acct_type IN ('AP', 'AR')
"
"                    AND par_bfcry_type IN ('S', 'C')
"
"                    AND ( (suplr_party_type = 'I'
"
"                           AND gacl_lgr_sub_cls_type = 'IMP')
"
"                         OR (suplr_party_type = 'P'
"
"                             AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                         OR (suplr_party_type NOT IN ('P', 'I')
"
"                             AND gacl_lgr_sub_cls_type IN
"
"                                    ('SAP',
"
"                                     'TDS',
"
"                                     'TCS',
"
"                                     'SVT',
"
"                                     'ESI',
"
"                                     'CASH',
"
"                                     'CAR',
"
"                                     'PF'))))
"
"                  OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND ( (suplr_party_type = 'I'
"
"                               AND gacl_lgr_sub_cls_type = 'IMP')
"
"                             OR (suplr_party_type = 'P'
"
"                                 AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                             OR (suplr_party_type NOT IN ('P', 'I')
"
"                                 AND gacl_lgr_sub_cls_type IN
"
"                                        ('TDS',
"
"                                         'TCS',
"
"                                         'SVT',
"
"                                         'ESI',
"
"                                         'CASH',
"
"                                         'IMP',
"
"                                         'CAD',
"
"                                         'PF')))))
"
"                  OR (    par_acct_type IN ('SSD')
"
"                      AND par_bfcry_type IN ('S', 'C')
"
"                      AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                  OR ( (par_bfcry_type IN ('S')
"
"                        AND ( (par_acct_type = 'SAD'
"
"                               AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                      AND atc_rqrd_type = 'N')
"
"                                    OR (gacl_lgr_sub_cls_type IN
"
"                                           ('SAD', 'CAD')
"
"                                        AND glac_acct_type_code = atc_code
"
"                                        AND atc_rqrd_type <> 'N')))
"
"                             OR (par_acct_type = 'SSD'
"
"                                 AND ( (gacl_lgr_sub_cls_type IN
"
"                                           ('SAP', 'CAR')
"
"                                        AND atc_rqrd_type = 'N')
"
"                                      OR (gacl_lgr_sub_cls_type IN
"
"                                             ('SSD', 'CSD')
"
"                                          AND glac_acct_type_code = atc_code
"
"                                          AND atc_rqrd_type <> 'N'))))
"
"                        OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                            AND par_acct_type = atc_code
"
"                            AND atc_sup_cust_type = 'S'
"
"                            AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                   AND atc_rqrd_type = 'N')
"
"                                 OR (atc_rqrd_type <> 'N'
"
"                                     AND glac_acct_type_code = atc_code))))
"
"                      OR ( (par_bfcry_type IN ('C')
"
"                            AND ( (par_acct_type = 'CAD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                             ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SAD', 'CAD')
"
"                                            AND glac_acct_type_code =
"
"                                                   atc_code
"
"                                            AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'CSD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SSD', 'CSD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'EMD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SEMD', 'CEMD')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'PBG'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SPBG', 'CPBG')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'RET'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                               ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SRET', 'CRET')
"
"                                              AND glac_acct_type_code =
"
"                                                     atc_code
"
"                                              AND atc_rqrd_type <> 'N'))))
"
"                            OR (par_acct_type NOT IN
"
"                                   ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                AND par_acct_type = atc_code
"
"                                AND atc_sup_cust_type = 'C'
"
"                                AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                       AND atc_rqrd_type = 'N')
"
"                                     OR (atc_rqrd_type <> 'N'
"
"                                         AND glac_acct_type_code = atc_code)))))))
"
"             AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND pcc_active_flag = 'Y'
"
"             -- AND pcc_default_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND p_trans_mode = 'P'
"
"             AND glal_plant = c_plant
"
"             AND PCC_AC_PLNT = c_plant
"
"             AND PCC_AC_LVL1 = c_lvl1
"
"             AND PCC_AC_LVL2 = c_lvl2
"
"             AND PCC_AC_LVL3 = c_lvl3
"
"             AND PCC_AC_LVL4 = c_lvl4
"
"             AND PCC_AC_LVL5 = c_lvl5
"
"             AND PCC_AC_LVL6 = c_lvl6
"
"             -- AND PCC_AC_LVL_PRJ = c_lvl_prj
"
"             AND (CASE
"
"                     WHEN V_APMC_PRJ_REQ_PAY = 'C'
"
"                          OR V_ARMC_PRJ_REQ_RECEV = 'C'
"
"                     THEN
"
"                        pcc_cc_code
"
"                     ELSE
"
"                        pcc_ac_lvl_prj
"
"                  END) = c_lvl_prj
"
"             AND par_plnt_loc_id = c_plnt_loc_id
"
"             AND glal_acct = c_acct
"
"             AND par_currency = c_curr
"
"             AND par_suplr_id = c_suplr_id
"
"             AND par_bfcry_type = c_bfcry_type
"
"             AND par_proj_id IS NOT NULL
"
"             --      AND FUNC_FIND_APM_PRJ_REQ_FLAG(p_bu) = 'Y'
"
"             AND ( (                      --func_find_apm_prj_req_flag(par_bu)
"
"                    V_APMC_PRJ_REQ_PAY IN ('Y', 'C')
"
"                    AND par_bfcry_type = 'S')
"
"                  OR (                    --func_find_arm_prj_req_flag(par_bu)
"
"                      V_ARMC_PRJ_REQ_RECEV IN ('Y', 'C')
"
"                      AND par_bfcry_type = 'C')) ;
"
"
"
"
"
"   v_base_curcy           VARCHAR2 (10);
"
"   v_pfx                  VARCHAR2 (10);
"
"   v_pfx_no               VARCHAR2 (20);
"
"   v_first_no             VARCHAR2 (25);
"
"   v_dr_cr                VARCHAR2 (2);
"
"   v_sysdate              DATE := SYSDATE;
"
"   v_rec_cnt              NUMBER;
"
"   v_valid_rec_cnt        NUMBER;
"
"   v_base_cur_flag        NUMBER := 0;
"
"   v_oth_cur_flag         NUMBER := 0;
"
"   v_base_exrate          BANK_TRANS.BTRANS_TRANS_BASE_EXRATE%TYPE;
"
"   V_BC_OK                NUMBER;
"
"   V_DIST_OK              NUMBER;
"
"   rnd                    NUMBER;
"
"--V_CNT VARCHAR2(20);
"
"BEGIN
"
"   v_base_curcy := func_find_base_currency (p_bu);
"
"   rnd := func_find_appl_rnddigit (p_bu);
"
"
"
"   /* START - Validate Documents  */
"
"
"
"   v_valid_rec_cnt := 0;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"      FOR cr2 IN c2 (cr1.par_currency)
"
"      LOOP
"
"         IF NVL (cr2.db_amt, 0) - NVL (cr2.cr_amt, 0) <> 0
"
"         THEN
"
"            v_valid_rec_cnt := v_valid_rec_cnt + 1;
"
"         END IF;
"
"      END LOOP;
"
"   END LOOP;
"
"
"
"   /* END - Validate Documents  */
"
"
"
"   IF v_valid_rec_cnt > 0
"
"   THEN
"
"      FOR cr1 IN c1
"
"      LOOP
"
"         IF p_jv_pfx IS NULL
"
"         THEN
"
"            v_pfx :=
"
"               func_find_dflt_pfx (p_bu,
"
"                                   p_plnt,
"
"                                   p_user,
"
"                                   'JV',
"
"                                   'FIN');
"
"         ELSE
"
"            v_pfx := p_jv_pfx;
"
"         END IF;
"
"
"
"         v_pfx_no :=
"
"            func_find_pfx_nextno (p_bu,
"
"                                  p_trans_date,
"
"                                  v_pfx,
"
"                                  p_user);
"
"
"
"         IF c1%ROWCOUNT = 1 OR v_first_no IS NULL
"
"         THEN
"
"            v_first_no := v_pfx || v_pfx_no;
"
"            DBMS_OUTPUT.put_line (cr1.par_currency || '--' || v_first_no);
"
"         END IF;
"
"
"
"
"
"         proc_ins_bank_trans (p_bu,
"
"                              v_pfx,
"
"                              v_pfx_no,
"
"                              p_plnt,
"
"                              p_trans_date,
"
"                              p_doc_type,
"
"                              NULL,
"
"                              'P',
"
"                              'C',
"
"                              p_trans_date,
"
"                              NULL,
"
"                              NULL,
"
"                              NULL,
"
"                              cr1.par_currency,
"
"                              cr1.par_currency,
"
"                              cr1.par_currency,                --v_base_curcy,
"
"                              1,
"
"                              0,
"
"                              0,
"
"                              0,
"
"                              0,
"
"                              0,
"
"                              0,
"
"                              'N',
"
"                              'JOURNAL VOUCHER AGAINST INVOICES',
"
"                              'JV',
"
"                              p_user,
"
"                              v_sysdate,
"
"                              p_loc_id   => p_plnt_loc_id);
"
"
"
"         FOR cr2 IN c2 (cr1.par_currency)
"
"         LOOP
"
"            IF cr2.cr_amt - cr2.db_amt > 0
"
"            THEN
"
"               v_dr_cr := 'DR';
"
"            ELSIF cr2.cr_amt - cr2.db_amt < 0
"
"            THEN
"
"               v_dr_cr := 'CR';
"
"            END IF;
"
"
"
"            proc_ins_bank_trans_dist_ln (
"
"               p_bu,
"
"               v_pfx,
"
"               v_pfx_no,
"
"               c2%ROWCOUNT,
"
"               p_plnt,
"
"               'R',
"
"               cr2.glal_plant,
"
"               cr2.glal_lvl1,
"
"               cr2.glal_lvl2,
"
"               cr2.glal_lvl3,
"
"               cr2.glal_lvl4,
"
"               cr2.glal_lvl5,
"
"               cr2.glal_lvl6,
"
"               cr2.glal_lvl_prj,
"
"               cr2.glal_cc_code,
"
"               cr2.glal_acct,
"
"               ROUND (ABS (cr2.db_amt - cr2.cr_amt), rnd),
"
"               ABS (cr2.db_amt_bc - cr2.cr_amt_bc),
"
"               NULL,
"
"               v_dr_cr,
"
"               NULL,
"
"               'N',
"
"               NULL,
"
"               cr1.par_currency,
"
"               1,
"
"               0,
"
"               0,
"
"               p_user,
"
"               v_sysdate,
"
"               cr2.par_bfcry_type,                                      --'C',
"
"               cr2.par_suplr_id,
"
"               cr2.par_bfcry_type,
"
"               p_loc_id   => CASE
"
"                               WHEN p_bs_lvl = 'E'
"
"                               THEN
"
"                                  func_find_dflt_plnt_loc (p_bu,
"
"                                                           cr2.glal_plant)
"
"                               ELSE
"
"                                  cr2.glal_plnt_loc_id
"
"                            END);                     --cr2.glal_plnt_loc_id);
"
"
"
"            FOR cr3
"
"               IN c3 (
"
"                     cr2.glal_plant,
"
"                     cr2.glal_lvl1,
"
"                     cr2.glal_lvl2,
"
"                     cr2.glal_lvl3,
"
"                     cr2.glal_lvl4,
"
"                     cr2.glal_lvl5,
"
"                     cr2.glal_lvl6,
"
"                     --cr2.glal_lvl_prj
"
"                     CASE
"
"                        WHEN V_APMC_PRJ_REQ_PAY = 'C'
"
"                             OR V_ARMC_PRJ_REQ_RECEV = 'C'
"
"                        THEN
"
"                           cr2.glal_cc_code
"
"                        ELSE
"
"                           cr2.glal_lvl_prj
"
"                     END,
"
"                     cr2.glal_plnt_loc_id,
"
"                     cr2.glal_acct,
"
"                     cr2.par_currency,
"
"                     cr2.par_suplr_id,
"
"                     cr2.par_bfcry_type,
"
"                     cr2.par_loc_name)
"
"            --cr2.par_loc_id)
"
"            LOOP
"
"               IF cr3.par_dr_cr = 'DR'
"
"               THEN
"
"                  v_dr_cr := 'CR';
"
"               ELSE
"
"                  v_dr_cr := 'DR';
"
"               END IF;
"
"
"
"               proc_ins_bank_trans_ref_det (
"
"                  p_bu,
"
"                  v_pfx,
"
"                  v_pfx_no,
"
"                  p_plnt,
"
"                  c2%ROWCOUNT,
"
"                  c3%ROWCOUNT,
"
"                  cr3.par_doc_date,
"
"                  cr3.par_pfx,
"
"                  cr3.par_doc_no,
"
"                  cr3.par_plant,
"
"                  cr3.par_bfcry_type,
"
"                  cr3.par_suplr_id,
"
"                  cr3.pdd_seq_no,
"
"                  cr3.pdd_due_date,
"
"                  cr3.par_aged_days,
"
"                  cr3.pdd_due_amt,
"
"                  ROUND (cr3.pdd_pay_amt, rnd),
"
"                  cr3.par_acct_type,
"
"                  v_dr_cr,
"
"                  cr3.par_currency,
"
"                  cr3.par_exchange_rate,
"
"                  cr3.par_suplr_reference,
"
"                  cr3.par_suplr_doc_date,
"
"                  cr3.par_suplr_doc_no,
"
"                  cr3.par_doc_type,
"
"                  --cr3.par_doc_mode,
"
"                  p_user,
"
"                  v_sysdate,
"
"                  --cr3.par_loc_id,
"
"                  cr3.par_loc_name,
"
"                  p_proj_id       => cr3.par_proj_id,
"
"                  --p_plnt_loc_id => cr3.par_plnt_loc_id
"
"                  p_plnt_loc_id   => CASE
"
"                                       WHEN p_bs_lvl = 'E'
"
"                                       THEN
"
"                                          func_find_dflt_plnt_loc (
"
"                                             p_bu,
"
"                                             cr3.par_plant)
"
"                                       ELSE
"
"                                          cr3.par_plnt_loc_id
"
"                                    END);
"
"
"
"               UPDATE suplr_doc_disc_hist
"
"                  SET sddh_check_flag = 'N', sddh_user = NULL
"
"                WHERE     sddh_bu = p_bu
"
"                      -- AND sddh_pfx = cr3.par_pfx
"
"                      AND sddh_doc_no = cr3.par_doc_no
"
"                      AND sddh_seq_no = cr3.pdd_seq_no;
"
"            END LOOP;
"
"
"
"            --END IF;
"
"            proc_adjust_bills (p_bu,
"
"                               'JV',
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               c2%ROWCOUNT,
"
"                               p_user,
"
"                               1);
"
"         END LOOP;
"
"
"
"         SELECT COUNT (1)
"
"           INTO v_rec_cnt
"
"           FROM bank_trans_dist_ln
"
"          WHERE btdln_bu = p_bu                    --AND btdln_ord_pfx = v_pfx
"
"                               AND btdln_ord_no = v_pfx_no;
"
"
"
"         IF v_rec_cnt = 0
"
"         THEN
"
"            DELETE FROM bank_trans
"
"                  WHERE     btrans_bu = p_bu
"
"                        AND btrans_ord_pfx = v_pfx
"
"                        AND btrans_ord_no = v_pfx_no;
"
"
"
"            IF v_first_no = v_pfx || v_pfx_no
"
"            THEN
"
"               v_first_no := NULL;
"
"            END IF;
"
"
"
"            v_pfx := NULL;
"
"            v_pfx_no := NULL;
"
"
"
"            CONTINUE;
"
"         END IF;
"
"
"
"         IF v_base_curcy = cr1.par_currency
"
"         THEN
"
"            v_base_cur_flag := 1;
"
"         ELSE
"
"            v_oth_cur_flag := 1;
"
"         END IF;
"
"
"
"         /* for exchange rate updation - amount recalculation */
"
"         FOR cr1
"
"            IN (SELECT *
"
"                  FROM bank_trans_dist_ln
"
"                 WHERE     btdln_bu = p_bu        -- AND btdln_ord_pfx = v_pfx
"
"                       AND btdln_ord_no = v_pfx_no
"
"                       AND btdln_ref_type = 'R')
"
"         LOOP
"
"            proc_upd_jv_rgl_amt (p_bu,
"
"                                 v_pfx,
"
"                                 v_pfx_no,
"
"                                 cr1.btdln_seq_no,
"
"                                 p_user);
"
"         END LOOP;
"
"
"
"
"
"         --  PROC_DEBUG_PROC(v_base_exrate||'-'||'THIRU'||'--'||v_base_exrate||'-'||cr1.par_currency);
"
"         SELECT NVL (SUM (btdln_bc_amt) / SUM (btdln_dist_amt), 1)
"
"           INTO v_base_exrate
"
"           FROM bank_trans_dist_ln
"
"          WHERE btdln_bu = p_bu                    --AND btdln_ord_pfx = v_pfx
"
"                               AND btdln_ord_no = v_pfx_no;
"
"
"
"
"
"         UPDATE bank_trans
"
"            SET btrans_trans_base_exrate = v_base_exrate
"
"          WHERE     btrans_bu = p_bu
"
"                AND btrans_ord_pfx = v_pfx
"
"                AND btrans_ord_no = v_pfx_no;
"
"
"
"         proc_upd_btrans_ref_bill_det (p_bu,
"
"                                       v_pfx,
"
"                                       v_pfx_no,
"
"                                       p_user);
"
"      END LOOP;
"
"   END IF;
"
"
"
"   proc_upd_btrans_ref_bill_det (p_bu,
"
"                                 v_pfx,
"
"                                 v_pfx_no,
"
"                                 p_user);
"
"
"
"   DELETE FROM BANK_TRANS_DIST_LN
"
"         WHERE     BTDLN_BU = p_bu
"
"               AND BTDLN_ORD_NO = v_pfx_no
"
"               AND BTDLN_DIST_AMT = 0
"
"               AND NOT EXISTS
"
"                          (SELECT 1
"
"                             FROM BANK_TRANS_REF_DET
"
"                            WHERE     BTR_BU = BTDLN_BU
"
"                                  AND BTR_ORD_NO = BTDLN_ORD_NO
"
"                                  AND BTR_SEQ_NO = BTDLN_SEQ_NO);
"
"
"
"   DBMS_OUTPUT.put_line (v_first_no || '--' || v_pfx || '--' || v_pfx_no);
"
"
"
"     IF p_bu='TVSA' THEN
"
"  RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"  END IF;
"
"
"
"   IF v_pfx || v_pfx_no IS NOT NULL
"
"   THEN
"
"      IF v_first_no = v_pfx || v_pfx_no
"
"      THEN
"
"         p_ord_no := '-' || v_first_no;
"
"         p_base_cur_flag := v_base_cur_flag;
"
"         p_oth_cur_flag := v_oth_cur_flag;
"
"      ELSE
"
"         p_ord_no := ' from ' || v_first_no || ' to ' || v_pfx || v_pfx_no;
"
"         p_base_cur_flag := v_base_cur_flag;
"
"         p_oth_cur_flag := v_oth_cur_flag;
"
"      END IF;
"
"   ELSIF v_pfx || v_pfx_no IS NULL AND v_first_no IS NULL
"
"   THEN
"
"      p_ord_no := 'NO_DOC';
"
"      p_base_cur_flag := v_base_cur_flag;
"
"      p_oth_cur_flag := v_oth_cur_flag;
"
"   ELSIF v_pfx || v_pfx_no IS NULL AND v_first_no IS NOT NULL
"
"   THEN
"
"      p_ord_no := '-' || v_first_no;
"
"      p_base_cur_flag := v_base_cur_flag;
"
"      p_oth_cur_flag := v_oth_cur_flag;
"
"   END IF;
"
"END proc_cre_pending_payable_mn_jv;
"
"END pkg_Journal_vou_trans;"
/
