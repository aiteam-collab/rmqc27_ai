CREATE OR REPLACE
"PACKAGE BODY pkg_bill_booking_new1
"
"AS
"
"   PROCEDURE proc_ins_grn_lines (p_bu           VARCHAR2,
"
"                                 p_doc_no       VARCHAR2,
"
"                                 p_from_date    DATE DEFAULT NULL,
"
"                                 p_to_date      DATE DEFAULT NULL,
"
"                                 p_status       VARCHAR2,
"
"                                 p_user         VARCHAR2)
"
"   IS
"
"   CURSOR c_grn_ln
"
"      IS
"
"           SELECT suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plnt_loc_id,
"
"                  suphd_doc_date,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  suphd_doc_type,
"
"                  suphd_suplr_id,
"
"                  suplr_name1 suphd_suplr_name,
"
"                  suphd_suplr_doc_no suphd_suplr_bill_no,
"
"                  suphd_suplr_doc_date suphd_suplr_bill_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  (suphd_sc_tot_amt * suphd_exchange_rate) bill_amt_bc,
"
"                  suphd_sc_tot_amt bill_amt_tc,
"
"                --  NVL (SUM (suplnh_inv_qty), 0) suplnh_inv_qty,
"
"                 /* (select NVL (SUM (suplnh_inv_qty), 0)
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLN_BU = suphd_bu
"
"                            AND SUPLN_DOC_NO = suphd_doc_no
"
"                             AND SUPLN_CONTRA_FLAG='N') */
"
"                (SELECT SUM(suplnh_inv_qty) suplnh_inv_qty
"
"                      FROM(
"
"                    select NVL ( SUM(suplnh_inv_qty), 0) suplnh_inv_qty
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_CONTRA_FLAG='N'
"
"                            AND suplnh_type <> 'C'
"
"                      UNION ALL
"
"                     select  SUM(suplnh_inv_qty) suplnh_inv_qty
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_CONTRA_FLAG='N'
"
"                              AND suplnh_type = 'C'
"
"                              and rownum=1))suplnh_inv_qty,
"
"                  suphd_mat_exp_amt,
"
"                   (select  SUM (
"
"                       (  suplnh_inv_qty
"
"                        * (  suplnh_unit_cost
"
"                           - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)   ))
"
"                     * suphd_exchange_rate)
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND SUPLNH_DR_CR = 'DR')
"
"                     mat_amt,
"
"                  suphd_grn_refer,
"
"                    (select ( SUM (( ( (  suplnh_unit_cost
"
"                             - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                        * (suplnh_inv_qty))) )
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND SUPLNH_DR_CR = 'DR')
"
"                  +  (SELECT NVL (SUM (SUPLNH_ASSBL_VAL), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                               and suplnh_type='C'
"
"                            AND SUPLNH_DR_CR = 'DR')
"
"                     suphd_gross_sc_val,
"
"                    (select  (  SUM (
"
"                          (  ( (  suplnh_unit_cost
"
"                                - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                           * (suplnh_inv_qty)))
"
"                     * suphd_exchange_rate)
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND SUPLNH_DR_CR = 'DR')
"
"                  + (SELECT NVL (SUM (SUPLNH_UNIT_COST * suphd_exchange_rate), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type='C'
"
"                            AND SUPLNH_DR_CR = 'DR')
"
"                     suphd_gross_bc_val,
"
"                     (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphd_exchange_rate), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                     suphd_dom_val,
"
"                  SUM (
"
"                     DECODE (
"
"                        suphd_currency,
"
"                        func_find_base_currency (suphd_bu), 0,
"
"                        (  ( (  suplnh_unit_cost
"
"                              - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                         * (suplnh_inv_qty)
"
"                         * suphd_exchange_rate)))
"
"                     suphd_imp_val,
"
"                     (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphd_exchange_rate), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                  +  (SELECT NVL (SUM (SUPLNH_UNIT_COST * suphd_exchange_rate), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE    SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_DR_CR = 'CR')
"
"                     suphd_tax_val_bc,
"
"                            (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                          +   (SELECT NVL (SUM (SUPLNH_UNIT_COST), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_DR_CR='CR')
"
"                     suphd_tax_val_tc,
"
"                     (SELECT NVL(SUM (CASE
"
"                               WHEN (suplnh_grn_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_igst_amt)
"
"                               WHEN (suplnh_grn_cgst_amt + suplnh_grn_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_cgst_amt + suplnh_grn_sgst_amt)
"
"                               WHEN (suplnh_grn_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_utgst_amt)
"
"                               WHEN (suplnh_grn_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphd_exchange_rate ),0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no )
"
"                     suphd_grn_tax_val,
"
"                          (SELECT NVL (SUM (SUPLNH_UNIT_COST), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          --AND SUPLNH_ASSBL_VAL <> 0
"
"                          AND SUPLNH_TDS_ASSBL_VAL <> 0
"
"                          )
"
"                     tds_value,
"
"                      (SELECT NVL (SUM (suplnh_appl_pct), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          --AND SUPLNH_ASSBL_VAL <> 0
"
"                          AND  SUPLNH_TDS_ASSBL_VAL <> 0
"
"                          )
"
"                     tds_pct,
"
"                      (SELECT NVL (SUM (SUPLNH_TDS_ASSBL_VAL), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          --AND SUPLNH_ASSBL_VAL <> 0
"
"                          AND SUPLNH_TDS_ASSBL_VAL <> 0
"
"                          )
"
"                     tds_assbl_value,
"
"                         (SELECT NVL (SUM (SUPLNH_UNIT_COST), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'ESI'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     esi_value,
"
"                           (SELECT NVL (SUM (suplnh_appl_pct), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'ESI'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     esi_pct,
"
"                        (SELECT NVL (SUM (SUPLNH_ASSBL_VAL), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                           AND glac_sub_grp_type = 'ESI'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     esi_assbl_value,
"
"                  suphd_suplr_reference,
"
"                  NULL recover_flag,
"
"                  suphd_gstin_no,
"
"                  suphd_bill_loc_name suphd_bill_loc_id,
"
"                  suphd_suplr_type,
"
"                  suphd_gst_class,
"
"                  suphd_gst_supply,
"
"                  suphd_gst_type,
"
"                  suphd_vou_type,
"
"                  suphd_state_code state_code,
"
"                  (SELECT ssl_addr1
"
"                     FROM suplr_ship_loc
"
"                    WHERE     ssl_bu = suphd_bu
"
"                          AND ssl_suplr_id = suphd_suplr_id
"
"                          AND ssl_loc_name1 = suphd_bill_loc_name
"
"                          )
"
"                     suplr_addr,
"
"                  (SELECT ssl_zip
"
"                     FROM suplr_ship_loc
"
"                    WHERE     ssl_bu = suphd_bu
"
"                          AND ssl_suplr_id = suphd_suplr_id
"
"                          AND ssl_loc_name1 = suphd_bill_loc_name
"
"                          )
"
"                     suplr_zip,
"
"                  (SELECT (SELECT NVL (state_name1, state_name2)
"
"                             FROM states
"
"                            WHERE state_id = ssl_state
"
"                              AND STATE_BU=ssl_bu)
"
"                     FROM suplr_ship_loc
"
"                    WHERE     ssl_bu = suphd_bu
"
"                          AND ssl_suplr_id = suphd_suplr_id
"
"                          AND ssl_loc_name1 = suphd_bill_loc_name
"
"                          )
"
"                     suplr_state,
"
"                     suphd_grn_pfx,
"
"                     suphd_grn_no,
"
"                     suphd_grn_date,
"
"                     suphd_blto_state_code,
"
"                     Suphd_tds_exmp_flag
"
"             FROM suplr_doc_hd_hist_vw1,
"
"                  suplr_doc_ln_hist,
"
"                  suppliers,
"
"                  profit_cost_centers
"
"                 -- appl_journals_hist_vw
"
"            WHERE     suphd_bu = suplnh_bu(+)
"
"                  AND suphd_doc_no = suplnh_doc_no(+)
"
"                  AND (   (    suphd_src_doc_pfx IS NULL
"
"                           AND suphd_src_doc_no IS NULL)
"
"                           OR suphd_doc_type IN ('SB'))
"
"                  AND suplr_bu = suphd_bu
"
"                  AND suplr_suplr_id = suphd_suplr_id
"
"                  AND  suphd_vou_type in ('SB')
"
"                   AND Suphd_Doc_Type='SB'
"
"                  AND suphd_grn_refer NOT IN ('LC', 'PO')
"
"                  AND suphd_status NOT IN 'D'
"
"                  AND (   (suphd_status IN ('O', 'N') AND p_status = 'N')
"
"                       OR (suphd_status IN ('P') AND p_status = 'P')
"
"                       OR p_status IS NULL)
"
"                  AND suphd_bu = p_bu
"
"                  AND (suphd_doc_date >= p_from_date OR p_from_date IS NULL)
"
"                  AND (suphd_doc_date <= p_to_date OR p_to_date IS NULL)
"
"                  AND func_find_glm_pur_jrnl_type (p_bu) IN ('I', 'G')
"
"                  AND suplnh_bu = pcc_bu
"
"                  AND SUPLNH_AP_CC_CODE = PCC_CC_CODE
"
"                --  AND ajhv_bu(+) = suphd_bu
"
"               -- AND ajhv_vou_type = suphd_vou_type
"
"              --  AND ajhv_vou_pfx(+) = suphd_pfx
"
"              --  AND ajhv_vou_no(+) = suphd_doc_no
"
"                --AND ajhv_vou_line_no(+) = suplnh_seq_no
"
"                AND (    PCC_AC_LVL1 IN (SELECT brl1_lvl_id     --ajhv_gl_lvl1
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL2 IN (SELECT brl2_lvl_id    --ajhv_gl_lvl2
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL3 IN (SELECT brl3_lvl_id    --ajhv_gl_lvl3
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL4 IN (SELECT brl4_lvl_id    --ajhv_gl_lvl4
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL5 IN (SELECT brl5_lvl_id   --ajhv_gl_lvl5
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL6 IN (SELECT brl6_lvl_id    --ajhv_gl_lvl6
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL_PRJ IN (SELECT brlp_lvl_id   --ajhv_gl_lvl_prj
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'))
"
"         GROUP BY suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plnt_loc_id,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  suphd_doc_date,
"
"                  suphd_doc_type,
"
"                  --suphd_doc_mode,
"
"                  suphd_suplr_id,
"
"                  suplr_name1,
"
"                  suphd_suplr_doc_no,
"
"                  suphd_suplr_doc_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  suphd_sc_tot_amt,
"
"                  suphd_grn_refer,
"
"                  suphd_suplr_reference,
"
"                  --suphd_bill_loc_id,
"
"                  suphd_gstin_no,
"
"                  suphd_suplr_type,
"
"                  suphd_gst_class,
"
"                  --suplnh_gst_rev_tax_flag,
"
"                  suphd_gst_supply,
"
"                  suphd_gst_type,
"
"                  suphd_vou_type,
"
"                  suphd_state_code,
"
"                  suphd_mat_exp_amt,
"
"                  suplr_addr1,
"
"                  suplr_addr2,
"
"                  suplr_addr3,
"
"                  suplr_zip,
"
"                  --suphd_loc_id,
"
"                   suphd_grn_pfx,
"
"                     suphd_grn_no,
"
"                     suphd_grn_date,
"
"                     suphd_blto_state_code,
"
"                     suphd_bill_loc_name,
"
"                     Suphd_tds_exmp_flag;
"
"
"
"      CURSOR c2 (
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"           SELECT suplnh_prod_sub_cls
"
"             FROM suplr_doc_ln_hist
"
"            WHERE     suplnh_bu = p_bu
"
"                  AND suplnh_doc_no = c_doc_no
"
"         GROUP BY suplnh_prod_sub_cls;
"
"
"
"
"
"      CURSOR c3 (
"
"         c_bu        VARCHAR2,
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"         SELECT suphd_bu,
"
"                suphd_plant,
"
"                suphd_plnt_loc_id,
"
"                suphd_pfx,
"
"                suphd_doc_no,
"
"                suplnh_prod_id,
"
"                suplnh_prod_rev,
"
"                ( case when SUPLNH_TYPE='C' then
"
"               (SELECT  glac_acct_desc1
"
"                    FROM gl_accts
"
"                   WHERE glac_bu = suplnh_bu
"
"                     AND glac_acct = suplnh_ap_gl_acct)
"
"                else
"
"                suplnh_prod_desc1
"
"                end ) suplnh_prod_desc1,
"
"                NULL pur_cls,
"
"                suplnh_receipt_qty,
"
"                suplnh_invoiced_qty,
"
"                suplnh_inv_qty,
"
"                suplnh_unit_cost,
"
"                (CASE
"
"                    WHEN suphd_currency IS NOT NULL
"
"                    THEN
"
"                       ROUND (
"
"                          (  (suplnh_unit_cost * suplnh_inv_qty)
"
"                           - suplnh_inv_disc_amt
"
"                           - suplnh_lm_disc_amt),
"
"                          5)
"
"                    ELSE
"
"                       0
"
"                 END)
"
"                   line_amt,
"
"                NVL (  (SELECT NVL (SUM (SUPLNH_TAX_AMT),0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL) ,
"
"                   0)
"
"                   navl_tax_amt,
"
"                suplnh_ap_gl_acct ajhv_gl_acct,                 --ajhv_gl_acct,
"
"                DECODE (suplnh_ap_gl_acct,
"
"                        NULL, NULL,
"
"                        func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct))
"
"                   gl_class,
"
"                DECODE (
"
"                   suplnh_ap_gl_acct,
"
"                   NULL, NULL,
"
"                   DECODE (
"
"                      func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct),
"
"                      NULL, NULL,
"
"                      func_find_gl_par_class_id (
"
"                         suphd_bu,
"
"                         func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct))))
"
"                   par_gl_class,
"
"                   SUPLNH_TAX_PCT  gst_rate,
"
"                NVL (suplnh_cgst_amt , 0) cgst_amt,
"
"              (CASE WHEN suplnh_cgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                       0
"
"                   END)cgst_rate,
"
"                NVL (suplnh_sgst_amt, 0) sgst_amt,
"
"                   (CASE WHEN suplnh_sgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) sgst_rate,
"
"                NVL (suplnh_igst_amt,
"
"                   0)
"
"                   igst_amt,
"
"                 (CASE WHEN SUPLNH_IGST_AMT > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) igst_rate,
"
"                NVL (suplnh_utgst_amt,  0) utgst_amt,
"
"                 (CASE WHEN suplnh_utgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) utgst_rate,
"
"                suplnh_hsn_code,
"
"                suplnh_inv_uom,
"
"                suphd_gstin_no,
"
"                suplnh_input_type,
"
"                suplnh_tax_exmpt_flag,
"
"                suplnh_inelgbl_type,
"
"                suplnh_inelgbl_sub_type,
"
"                suplnh_Seq_no,
"
"                suphd_suplr_type,
"
"                suphd_gst_class,
"
"                suphd_gst_type,
"
"                suphd_state_code,
"
"                suplnh_gst_rev_tax_flag,
"
"                (SELECT DISTINCT state_name1
"
"                   FROM states
"
"                  WHERE state_code = suphd_state_code AND ROWNUM = 1)
"
"                   state_code_name,
"
"                suphd_exchange_rate,
"
"                suplnh_ap_cc_code,
"
"                suplnh_gst_rev_tax_cat,
"
"                (CASE WHEN SUPLNH_GRN_TAX_PCT > 0 THEN
"
"                    NVL(suplnh_grn_igst_amt,0)+NVL(suplnh_grn_cgst_amt,0) + NVL(suplnh_grn_sgst_amt,0)+NVL(suplnh_grn_utgst_amt,0)+NVL(suplnh_grn_cess_amt,0)
"
"                    ELSE
"
"                    0 END)suphd_grn_tax_val,
"
"                    Suphd_tds_exmp_flag
"
"           FROM suplr_doc_hd_hist_vw1,
"
"                suplr_doc_ln_hist,
"
"                profit_cost_centers
"
"               -- appl_journals_hist_vw
"
"          WHERE     suphd_bu = p_bu
"
"                AND suphd_bu = suplnh_bu
"
"                AND suphd_doc_no = suplnh_doc_no
"
"               -- AND suphd_bu = c_bu
"
"                AND suphd_pfx = c_pfx
"
"                AND suphd_doc_no = c_doc_no
"
"              /*  AND ajhv_bu(+) = suphd_bu
"
"                AND ajhv_vou_type = suphd_vou_type
"
"                AND ajhv_vou_pfx(+) = suphd_pfx
"
"                AND ajhv_vou_no(+) = suphd_doc_no
"
"                AND ajhv_vou_line_no(+) = suplnh_seq_no
"
"                AND ajhv_jrnl_trns_seq_no = suplnh_seq_no  */
"
"                AND suplnh_bu = pcc_bu
"
"                AND SUPLNH_AP_CC_CODE = PCC_CC_CODE
"
"                AND (    PCC_AC_LVL1 IN (SELECT brl1_lvl_id   --ajhv_gl_lvl1
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL2 IN (SELECT brl2_lvl_id   --ajhv_gl_lvl2
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL3 IN (SELECT brl3_lvl_id   --ajhv_gl_lvl3
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL4 IN (SELECT brl4_lvl_id  --ajhv_gl_lvl4
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL5 IN (SELECT brl5_lvl_id  --ajhv_gl_lvl5
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL6 IN (SELECT brl6_lvl_id  --ajhv_gl_lvl6
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL_PRJ IN (SELECT brlp_lvl_id   --ajhv_gl_lvl_prj
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'));
"
"
"
"
"
"     -- cr1          c1%ROWTYPE;
"
"      v_type       VARCHAR2 (25);
"
"      v_sub_cls    VARCHAR2 (500);
"
"      v_sub_cls1   VARCHAR2 (500);
"
"      v_rnd        NUMBER (5);
"
"   BEGIN
"
"--RAISE_APPLICATION_ERROR(-20999,'TEST');
"
"      v_rnd := func_find_appl_rnddigit (p_bu);
"
"
"
"      DELETE bill_reg_grn_ln_temp
"
"       WHERE     brglt_bu = p_bu
"
"             AND brglt_doc_no = p_doc_no
"
"             AND brglt_vou_type IN ('SB');
"
"
"
"      DELETE bill_item_line_temp
"
"       WHERE bilt_bu = p_bu AND bilt_doc_no = p_doc_no;
"
"
"
"      FOR r_grn_ln IN c_grn_ln
"
"      LOOP
"
"            v_type := 'N';
"
"         IF r_grn_ln.suphd_grn_refer IN ('PO',--'PR',
"
"                                         'SCO',
"
"                                         'ST',
"
"                                         'PTN')
"
"         THEN
"
"            v_sub_cls := NULL;
"
"
"
"            FOR cr2 IN c2 (r_grn_ln.suphd_pfx, r_grn_ln.suphd_doc_no)
"
"            LOOP
"
"               IF cr2.suplnh_prod_sub_cls IS NOT NULL
"
"               THEN
"
"
"
"                  v_sub_cls1 :=
"
"                     func_find_subclass_desc (p_bu,
"
"                                              cr2.suplnh_prod_sub_cls,
"
"                                              1);
"
"                  v_sub_cls := v_sub_cls || v_sub_cls1 || ',';
"
"               END IF;
"
"            END LOOP;
"
"
"
"            v_sub_cls := RTRIM (v_sub_cls, ',');
"
"         ELSE
"
"            v_sub_cls := NULL;
"
"         END IF;
"
"
"
"         INSERT /*+ append */
"
"               INTO  bill_reg_grn_ln_temp (brglt_bu,
"
"                                           brglt_doc_no,
"
"                                          brglt_plnt,
"
"                                           brglt_plnt_loc,
"
"                                           brglt_vou_type,
"
"                                            brglt_inv_pfx,
"
"                                           brglt_inv_no,
"
"                                          brglt_inv_date,
"
"                                           brglt_inv_type,
"
"                                           brglt_inv_mode,
"
"                                           brglt_suplr_id,
"
"                                           brglt_suplr_name,
"
"                                           brglt_suplr_bill_no,
"
"                                           brglt_suplr_bill_date,
"
"                                           brglt_curry,
"
"                                           brglt_exchange_rate,
"
"                                          brglt_gross_sc_val,
"
"                                          brglt_gross_bc_val,
"
"                                           brglt_net_sc_val,
"
"                                           brglt_net_bc_val,
"
"                                          brglt_dom_val,
"
"                                          brglt_imp_val,
"
"                                           brglt_tax_val,
"
"                                           brglt_grn_tax_val,
"
"                                           brglt_cre_by,
"
"                                           brglt_cre_date,
"
"                                           brglt_bill_amt_bc,
"
"                                           brglt_bill_amt_tc,
"
"                                           brglt_type,
"
"                                           brglt_grn_refer,
"
"                                           brglt_sub_cls,
"
"                                           brglt_mat_amt,
"
"                                           brglt_status,
"
"                                           brglt_reference,
"
"                                           brglt_recover,
"
"                                           brglt_tds_val,
"
"                                           brglt_tds_pct,
"
"                                           brglt_tds_assbl_val,
"
"                                           brglt_esi_val,
"
"                                           brglt_esi_pct,
"
"                                           brglt_esi_assbl_val,
"
"                                           brglt_state_code,
"
"                                           brglt_bill_qty,
"
"                                           brglt_party_addr,
"
"                                           brglt_party_pin,
"
"                                           brglt_party_state,
"
"                                           brglt_suplr_gstin,
"
"                                            brglt_suplr_reg_type,
"
"                                            brglt_suplr_type,
"
"                                            brglt_bill_loc_id,
"
"                                            brglt_grn_pfx,
"
"                                            brglt_grn_no,
"
"                                            brglt_grn_date,
"
"                                            brglt_bill_to_code,
"
"                                            brglt_tds_appl_flag
"
"                                            )
"
"                 VALUES (
"
"                           p_bu,
"
"                           p_doc_no,
"
"                          r_grn_ln.suphd_plant,
"
"                           r_grn_ln.suphd_plnt_loc_id,
"
"                           r_grn_ln.suphd_vou_type,
"
"                            r_grn_ln.suphd_pfx,
"
"                           r_grn_ln.suphd_doc_no,
"
"                           r_grn_ln.suphd_doc_date,
"
"                           r_grn_ln.suphd_doc_type,
"
"                           NULL,-- r_grn_ln.suphd_doc_mode,
"
"                           r_grn_ln.suphd_suplr_id,
"
"                           r_grn_ln.suphd_suplr_name,
"
"                           r_grn_ln.suphd_suplr_bill_no,
"
"                           r_grn_ln.suphd_suplr_bill_date,
"
"                           r_grn_ln.suphd_currency,
"
"                         r_grn_ln.suphd_exchange_rate,
"
"                           ROUND (
"
"                              NVL (r_grn_ln.suphd_gross_sc_val,
"
"                                   r_grn_ln.suphd_mat_exp_amt),
"
"                              v_rnd),
"
"                           ROUND (
"
"                              NVL (
"
"                                 r_grn_ln.suphd_gross_bc_val,
"
"                                 (  r_grn_ln.suphd_mat_exp_amt
"
"                                  * r_grn_ln.suphd_exchange_rate)),
"
"                              v_rnd),
"
"                          ROUND (
"
"                                NVL (r_grn_ln.suphd_gross_sc_val,
"
"                                     r_grn_ln.suphd_mat_exp_amt)
"
"                              + r_grn_ln.suphd_tax_val_tc,
"
"                              v_rnd),
"
"                             ROUND (
"
"                                NVL (
"
"                                     r_grn_ln.suphd_gross_sc_val
"
"                                   * r_grn_ln.suphd_exchange_rate,
"
"                                     r_grn_ln.suphd_mat_exp_amt
"
"                                   * r_grn_ln.suphd_exchange_rate)
"
"                              + r_grn_ln.suphd_tax_val_bc,
"
"                              v_rnd),
"
"                        CASE
"
"                              WHEN func_find_base_currency (p_bu) =
"
"                                      r_grn_ln.suphd_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_grn_ln.bill_amt_bc
"
"                                     - r_grn_ln.suphd_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) <>
"
"                                      r_grn_ln.suphd_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_grn_ln.bill_amt_bc
"
"                                     - r_grn_ln.suphd_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           ROUND (r_grn_ln.suphd_tax_val_tc, v_rnd),
"
"                           ROUND (r_grn_ln.suphd_grn_tax_val, v_rnd),
"
"                           p_user,
"
"                           SYSDATE,
"
"                           ROUND (r_grn_ln.bill_amt_bc, v_rnd),
"
"                           ROUND (r_grn_ln.bill_amt_tc, v_rnd),
"
"                           v_type,
"
"                           r_grn_ln.suphd_grn_refer,
"
"                           v_sub_cls,
"
"                           ROUND (
"
"                                r_grn_ln.bill_amt_bc
"
"                              - r_grn_ln.suphd_tax_val_bc,
"
"                              v_rnd),
"
"                           r_grn_ln.suphd_status,
"
"                           r_grn_ln.suphd_suplr_reference,
"
"                           r_grn_ln.recover_flag,
"
"                           ROUND (r_grn_ln.tds_value, v_rnd),
"
"                           r_grn_ln.tds_pct,
"
"                           ROUND (r_grn_ln.tds_assbl_value, v_rnd),
"
"                           ROUND (r_grn_ln.esi_value, v_rnd),
"
"                           r_grn_ln.esi_pct,
"
"                           ROUND (r_grn_ln.esi_assbl_value, v_rnd),
"
"                           r_grn_ln.state_code,
"
"                           r_grn_ln.suplnh_inv_qty,
"
"                           r_grn_ln.suplr_addr,
"
"                           r_grn_ln.suplr_zip,
"
"                           r_grn_ln.suplr_state,
"
"                           r_grn_ln.suphd_gstin_no,
"
"                            r_grn_ln.suphd_suplr_type,
"
"                            r_grn_ln.suphd_gst_class,
"
"                            r_grn_ln.suphd_bill_loc_id,
"
"                             r_grn_ln.suphd_grn_pfx,
"
"                             r_grn_ln.suphd_grn_no,
"
"                             r_grn_ln.suphd_grn_date,
"
"                             r_grn_ln.suphd_blto_state_code,
"
"                             r_grn_ln.Suphd_tds_exmp_flag
"
"                             );
"
"
"
"        -- CLOSE c1;
"
"--proc_debug_proc(r_grn_ln.suphd_pfx||r_grn_ln.suphd_doc_no);
"
"         FOR cr3 IN c3 (p_bu, r_grn_ln.suphd_pfx, r_grn_ln.suphd_doc_no)
"
"         LOOP
"
"         -- proc_debug_proc('APM2248_YAZH'||r_grn_ln.suphd_pfx||r_grn_ln.suphd_doc_no||'`'|| cr3.ajhv_gl_acct||'`'|| cr3.par_gl_class||'`'|| cr3.gl_class);
"
"            --  raise_application_error(-20999,'HRM'||'~'||r_grn_ln.suphd_pfx||'~'||r_grn_ln.suphd_doc_no);
"
"            INSERT INTO bill_item_line_temp (bilt_bu,
"
"                                             bilt_doc_no,
"
"                                             bilt_plnt,
"
"                                             bilt_plnt_loc,
"
"                                             bilt_inv_pfx,
"
"                                             bilt_inv_no,
"
"                                             bilt_prod_id,
"
"                                             bilt_prod_rev,
"
"                                             bilt_prod_desc1,
"
"                                             bilt_pur_cls,
"
"                                             bilt_receipt_qty,
"
"                                             bilt_invoiced_qty,
"
"                                             bilt_inv_qty,
"
"                                             bilt_unit_cost,
"
"                                             bilt_ln_amt,
"
"                                             bilt_acct,
"
"                                             bilt_cl_id,
"
"                                             bilt_par_cl_id,
"
"                                             bilt_cre_by,
"
"                                             bilt_cre_date,
"
"                                             bilt_vou_type,
"
"                                             bilt_input_type,
"
"                                             bilt_tax_exmpt_flag,
"
"                                             bilt_inelgbl_type,
"
"                                             bilt_inelgbl_sub_type,
"
"                                             bilt_seq_no,
"
"                                             bilt_rcm_flag,
"
"                                             bilt_gst_rate,
"
"                                             bilt_cgst_amt,
"
"                                             bilt_sgst_amt,
"
"                                             bilt_igst_amt,
"
"                                             bilt_utgst_amt,
"
"                                             bilt_hsn_code,
"
"                                             bilt_uom,
"
"                                             bilt_gstin_no,
"
"                                             bilt_suplr_type,
"
"                                             bilt_gst_class,
"
"                                             bilt_gst_rev_tax_flag,
"
"                                             bilt_gst_type,
"
"                                             bilt_state_code,
"
"                                             bilt_state_code_desc,
"
"                                             bilt_cc_code,
"
"                                             bilt_rcm_cat,
"
"                                             bilt_cgst_rate,
"
"                                            bilt_sgst_rate,
"
"                                            bilt_igst_rate,
"
"                                            bilt_utgst_rate,
"
"                                            bilt_grn_tax_val)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         cr3.suphd_plant,
"
"                         cr3.suphd_plnt_loc_id,
"
"                         cr3.suphd_pfx,
"
"                         cr3.suphd_doc_no,
"
"                         cr3.suplnh_prod_id,
"
"                         cr3.suplnh_prod_rev,
"
"                         cr3.suplnh_prod_desc1,
"
"                         cr3.pur_cls,
"
"                         cr3.suplnh_receipt_qty,
"
"                         cr3.suplnh_invoiced_qty,
"
"                         cr3.suplnh_inv_qty,
"
"                         cr3.suplnh_unit_cost,
"
"                         cr3.line_amt + cr3.navl_tax_amt,
"
"                         cr3.ajhv_gl_acct,
"
"                         cr3.gl_class,
"
"                         cr3.par_gl_class,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'SB',
"
"                         cr3.suplnh_input_type,
"
"                         cr3.suplnh_tax_exmpt_flag,
"
"                         cr3.suplnh_inelgbl_type,
"
"                         cr3.suplnh_inelgbl_sub_type,
"
"                         cr3.suplnh_seq_no,
"
"                         cr3.suplnh_gst_rev_tax_flag,
"
"                         cr3.gst_rate,
"
"                         cr3.cgst_amt,
"
"                         cr3.sgst_amt,
"
"                         cr3.igst_amt,
"
"                         cr3.utgst_amt,
"
"                         cr3.suplnh_hsn_code,
"
"                         cr3.suplnh_inv_uom,
"
"                         cr3.suphd_gstin_no,
"
"                         cr3.suphd_suplr_type,
"
"                         cr3.suphd_gst_class,
"
"                         cr3.suplnh_gst_rev_tax_flag,
"
"                         cr3.suphd_gst_type,
"
"                         cr3.suphd_state_code,
"
"                         cr3.state_code_name,
"
"                         cr3.suplnh_ap_cc_code,
"
"                         cr3.suplnh_gst_rev_tax_cat,
"
"                         cr3.cgst_rate,
"
"                         cr3.sgst_rate,
"
"                         cr3.igst_rate,
"
"                         cr3.utgst_rate,
"
"                         CR3.suphd_grn_tax_val);
"
"         END LOOP;
"
"      END LOOP c_grn_ln;
"
"   END proc_ins_grn_lines;
"
"
"
"   PROCEDURE proc_ins_grn_perpectual (p_bu           VARCHAR2,
"
"                                      p_doc_no       VARCHAR2,
"
"                                      p_from_date    DATE DEFAULT NULL,
"
"                                      p_to_date      DATE DEFAULT NULL,
"
"                                      p_status       VARCHAR2,
"
"                                      p_user         VARCHAR2)
"
"   IS
"
"      CURSOR c_grn_pl
"
"      IS
"
"           SELECT suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plant_loc_id,
"
"                  suphd_doc_date,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  'I' suphd_doc_type,
"
"                  'R' suphd_doc_mode,
"
"                  suphd_suplr_id,
"
"                  suphd_suplr_name,
"
"                  suphd_suplr_bill_no,
"
"                  suphd_suplr_bill_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  SUM (bill_amt_bc) bill_amt_bc,
"
"                  SUM (bill_amt_tc) bill_amt_tc,
"
"                  SUM (porl_receipt_qty) porl_receipt_qty,
"
"                  SUM (mat_amt) mat_amt,
"
"                  suphd_grn_refer,
"
"                  SUM (suphd_gross_sc_val) suphd_gross_sc_val,
"
"                  SUM (suphd_gross_bc_val) suphd_gross_bc_val,
"
"                  (suphd_dom_val) suphd_dom_val,
"
"                  SUM (suphd_imp_val) suphd_imp_val,
"
"                  (suphd_tax_val_bc) suphd_tax_val_bc,
"
"                  (suphd_tax_val_tc) suphd_tax_val_tc,
"
"                  0 suphd_grn_tax_val,
"
"                  0 tds_value,
"
"                  0 tds_pct,
"
"                  0 tds_assbl_value,
"
"                  0 esi_value,
"
"                  0 esi_pct,
"
"                  0 esi_assbl_value,
"
"                  NULL suphd_suplr_reference,
"
"                  'N' recover_flag,
"
"                  suphd_gstin_no,
"
"                   suphd_bill_loc_id,
"
"                  'U' suphd_suplr_type,
"
"                  suphd_gst_class,
"
"                  --'N' suphd_gst_rev_tax_flag,
"
"                  'Y' suphd_gst_supply,
"
"                  suphd_gst_type,
"
"                  'GRN' suphd_vou_type,
"
"                  state_code,
"
"                  porptc_type,
"
"                  suplr_addr,
"
"                  suplr_zip,
"
"                  suplr_state,
"
"                   suphd_grn_pfx,
"
"                 suphd_grn_no,
"
"                 suphd_grn_date,
"
"                 suphd_blto_state_code
"
"             FROM (  SELECT porh_bu suphd_bu,
"
"                            porh_plnt suphd_plant,
"
"                            porh_billfr_loc_name suphd_plant_loc_id,
"
"                            porh_receipt_date suphd_doc_date,
"
"                            porh_receipt_pfx suphd_pfx,
"
"                            porh_receipt_no suphd_doc_no,
"
"                            'I' suphd_doc_type,
"
"                            'R' suphd_doc_mode,
"
"                            porh_suplr_id suphd_suplr_id,
"
"                            suplr_name1 suphd_suplr_name,
"
"                            porh_suplr_doc_no suphd_suplr_bill_no,
"
"                            TRUNC (porh_suplr_doc_date) suphd_suplr_bill_date,
"
"                            porh_currency suphd_currency,
"
"                            porh_exchange_rate suphd_exchange_rate,
"
"                            DECODE (porh_status,
"
"                                    'N', 'N',
"
"                                    'Q', 'N',
"
"                                    'P', 'N',
"
"                                    'O', 'N',
"
"                                    'R', 'P')
"
"                               suphd_status,
"
"                            (porh_tot_rcpt_amt * porh_exchange_rate) bill_amt_bc,
"
"                            porh_tot_rcpt_amt bill_amt_tc,
"
"                            SUM (porl_receipt_qty) porl_receipt_qty,
"
"                            SUM (
"
"                               DECODE (
"
"                                  porh_currency,
"
"                                  func_find_base_currency (porh_bu), ROUND (
"
"                                                                          porl_receipt_qty
"
"                                                                        * porl_sc_unit_cost
"
"                                                                        * porh_exchange_rate,
"
"                                                                        func_find_appl_rnddigit (
"
"                                                                           porh_bu)),
"
"                                  0))
"
"                               mat_amt,
"
"                            'G' suphd_grn_refer,
"
"                            ROUND (SUM (porl_receipt_qty * porl_sc_unit_cost),
"
"                                   func_find_appl_rnddigit (porh_bu))
"
"                               suphd_gross_sc_val,
"
"                            ROUND (
"
"                                 SUM (porl_receipt_qty * porl_sc_unit_cost)
"
"                               * porh_exchange_rate,
"
"                               func_find_appl_rnddigit (porh_bu))
"
"                               suphd_gross_bc_val,
"
"                                    ROUND (
"
"                                       NVL (
"
"                                          SUM (
"
"                                             NVL(SUM (CASE
"
"                                   WHEN (PORL_IGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_IGST_AMT)
"
"                                   WHEN (PORL_CGST_AMT + PORL_SGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CGST_AMT + PORL_SGST_AMT)
"
"                                   WHEN (PORL_UTGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_UTGST_AMT)
"
"                                   WHEN (PORL_CESS_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CESS_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END),0) * porh_exchange_rate),
"
"                                          0),
"
"                                       func_find_appl_rnddigit (porh_bu))
"
"                               suphd_dom_val,
"
"                            SUM (
"
"                               DECODE (
"
"                                  porh_currency,
"
"                                  func_find_base_currency (porh_bu), 0,
"
"                                  ROUND (
"
"                                       porl_receipt_qty
"
"                                     * porl_sc_unit_cost
"
"                                     * porh_exchange_rate,
"
"                                     func_find_appl_rnddigit (porh_bu))))
"
"                               suphd_imp_val,
"
"                                    ROUND (
"
"                                       NVL (
"
"                                          SUM (
"
"                                             NVL(SUM (CASE
"
"                                   WHEN (PORL_IGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_IGST_AMT)
"
"                                   WHEN (PORL_CGST_AMT + PORL_SGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CGST_AMT + PORL_SGST_AMT)
"
"                                   WHEN (PORL_UTGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_UTGST_AMT)
"
"                                   WHEN (PORL_CESS_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CESS_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END),0) * porh_exchange_rate),
"
"                                          0),
"
"                                       func_find_appl_rnddigit (porh_bu))
"
"                               suphd_tax_val_bc,
"
"                                    ROUND (
"
"                                       NVL (
"
"                                          SUM (
"
"                                             NVL(SUM (CASE
"
"                                   WHEN (PORL_IGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_IGST_AMT)
"
"                                   WHEN (PORL_CGST_AMT + PORL_SGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CGST_AMT + PORL_SGST_AMT)
"
"                                   WHEN (PORL_UTGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_UTGST_AMT)
"
"                                   WHEN (PORL_CESS_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CESS_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END),0) ),
"
"                                          0),
"
"                                       func_find_appl_rnddigit (porh_bu))
"
"                               suphd_tax_val_tc,
"
"                            0 suphd_grn_tax_val,
"
"                            0 tds_value,
"
"                            0 tds_pct,
"
"                            0 tds_assbl_value,
"
"                            0 esi_value,
"
"                            0 esi_pct,
"
"                            0 esi_assbl_value,
"
"                            NULL suphd_suplr_reference,
"
"                            'N' recover_flag,
"
"                            (SELECT ssl_gst_no
"
"                               FROM suplr_ship_loc
"
"                              WHERE     ssl_bu = porh_bu
"
"                                    AND ssl_suplr_id = porh_suplr_id
"
"                                     AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                    )
"
"                               suphd_gstin_no,
"
"                            porh_billfr_loc_name suphd_bill_loc_id,
"
"                            'U' suphd_suplr_type,
"
"                            (SELECT ssl_type
"
"                               FROM suplr_ship_loc
"
"                              WHERE     ssl_bu = porh_bu
"
"                                    AND ssl_suplr_id = porh_suplr_id
"
"                                    AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                    )
"
"                               suphd_gst_class,
"
"                            --'N' suphd_gst_rev_tax_flag,
"
"                            'Y' suphd_gst_supply,
"
"                            porh_gst_type suphd_gst_type,
"
"                            'GRN' suphd_vou_type,
"
"                            (SELECT state_code
"
"                               FROM states
"
"                              WHERE state_id = suplr_state)
"
"                               state_code,
"
"                            'R' porptc_type,
"
"                            (SELECT ssl_addr1
"
"                               FROM suplr_ship_loc
"
"                              WHERE     ssl_bu = porh_bu
"
"                                    AND ssl_suplr_id = porh_suplr_id
"
"                                    AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                  --  AND ssl_loc_id = porh_loc_id
"
"                                    )
"
"                               suplr_addr,
"
"                            (SELECT ssl_zip
"
"                               FROM suplr_ship_loc
"
"                              WHERE     ssl_bu = porh_bu
"
"                                    AND ssl_suplr_id = porh_suplr_id
"
"                                    AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                 --   AND ssl_loc_id = porh_loc_id
"
"                                    )
"
"                               suplr_zip,
"
"                            (SELECT (SELECT NVL (state_name1, state_name2)
"
"                                       FROM states
"
"                                      WHERE state_id = ssl_state)
"
"                               FROM suplr_ship_loc
"
"                              WHERE     ssl_bu = porh_bu
"
"                                    AND ssl_suplr_id = porh_suplr_id
"
"                                    AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                 --   AND ssl_loc_id = porh_loc_id
"
"                                    )
"
"                               suplr_state,
"
"                               porh_receipt_pfx suphd_grn_pfx,
"
"                               porh_receipt_no  suphd_grn_no,
"
"                               porh_receipt_date  suphd_grn_date,
"
"                               (select prah_billto_state_code
"
"                                from pur_rcpt_addr_hist
"
"                                where prah_bu = porh_bu
"
"                               -- and prah_rcpt_pfx = porh_receipt_pfx
"
"                                and prah_rcpt_no = porh_receipt_no) suphd_blto_state_code
"
"                       FROM pur_ord_receipt_hd_view,
"
"                            pur_ord_receipt_ln_view a,
"
"                            suppliers,
"
"                            appl_journals_hist_vw
"
"                      WHERE     porh_bu = porl_bu
"
"                            --AND porh_receipt_pfx = porl_receipt_pfx
"
"                            AND porh_receipt_no = porl_receipt_no
"
"                            AND suplr_bu = porh_bu
"
"                            AND suplr_suplr_id = porh_suplr_id
"
"                            AND porh_status NOT IN 'C'
"
"                            AND (   (    porh_status IN ('N',
"
"                                                         'Q',
"
"                                                         'P',
"
"                                                         'O')
"
"                                     AND p_status = 'N')
"
"                                 OR (porh_status IN ('R') AND p_status = 'P')
"
"                                 OR p_status IS NULL)
"
"                            AND porl_matl_type IN ('PR', 'T')
"
"                            AND porh_bu = p_bu
"
"                            AND (   porh_receipt_date >= p_from_date
"
"                                 OR p_from_date IS NULL)
"
"                            AND (   porh_receipt_date <= p_to_date
"
"                                 OR p_to_date IS NULL)
"
"                            AND func_find_glm_pur_jrnl_type (p_bu) IN ('G')
"
"                            AND ajhv_bu(+) = porh_bu
"
"                            AND ajhv_vou_pfx(+) = porh_receipt_pfx
"
"                            AND ajhv_vou_no(+) = porh_receipt_no
"
"                            AND ajhv_vou_line_no(+) = porl_seq_no
"
"                            AND (    ajhv_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                             AND ajhv_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                                    FROM bill_reg_lvl2
"
"                                                   WHERE     brl2_bu = p_bu
"
"                                                         AND brl2_cre_by = p_user
"
"                                                         AND brl2_sel_flag = 'Y')
"
"                             AND ajhv_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                                    FROM bill_reg_lvl3
"
"                                                   WHERE     brl3_bu = p_bu
"
"                                                         AND brl3_cre_by = p_user
"
"                                                         AND brl3_sel_flag = 'Y')
"
"                             AND ajhv_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                                    FROM bill_reg_lvl4
"
"                                                   WHERE     brl4_bu = p_bu
"
"                                                         AND brl4_cre_by = p_user
"
"                                                         AND brl4_sel_flag = 'Y')
"
"                             AND ajhv_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                                    FROM bill_reg_lvl5
"
"                                                   WHERE     brl5_bu = p_bu
"
"                                                         AND brl5_cre_by = p_user
"
"                                                         AND brl5_sel_flag = 'Y')
"
"                             AND ajhv_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                                    FROM bill_reg_lvl6
"
"                                                   WHERE     brl6_bu = p_bu
"
"                                                         AND brl6_cre_by = p_user
"
"                                                         AND brl6_sel_flag = 'Y')
"
"                             AND ajhv_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                                       FROM bill_reg_lvl_prj
"
"                                                      WHERE     brlp_bu = p_bu
"
"                                                            AND brlp_cre_by = p_user
"
"                                                            AND brlp_sel_flag = 'Y'))
"
"                   GROUP BY porh_bu,
"
"                            porh_plnt,
"
"                            porh_billfr_loc_name,
"
"                            porh_ref_unit,
"
"                            porh_receipt_pfx,
"
"                            porh_receipt_no,
"
"                            porh_receipt_date,
"
"                            porh_mode,
"
"                            porh_suplr_id,
"
"                            suplr_name1,
"
"                            porh_currency,
"
"                            porh_exchange_rate,
"
"                            porh_dc_no,
"
"                            porh_dc_date,
"
"                            porh_suplr_doc_no,
"
"                            porh_suplr_doc_date,
"
"                            porl_tcf_id,
"
"                            porh_gst_type,
"
"                            suplr_state,
"
"                            --porh_loc_id,
"
"                            porh_status,
"
"                            porh_tot_rcpt_amt,
"
"                            porh_receipt_pfx,
"
"                            porh_receipt_no,
"
"                            porh_receipt_date
"
"                   UNION ALL
"
"                     SELECT suphd_bu,
"
"                            suphd_plant,
"
"                            suphd_plant_loc_id,
"
"                            suphd_doc_date,
"
"                            suphd_pfx,
"
"                            suphd_doc_no,
"
"                            'I' suphd_doc_type,
"
"                            'R' suphd_doc_mode,
"
"                            suphd_suplr_id,
"
"                            suphd_suplr_name,
"
"                            suphd_suplr_bill_no,
"
"                            suphd_suplr_bill_date,
"
"                            suphd_currency,
"
"                            suphd_exchange_rate,
"
"                            suphd_status,
"
"                            SUM (bill_amt_bc) bill_amt_bc,
"
"                            SUM (bill_amt_tc) bill_amt_tc,
"
"                            SUM (porl_receipt_qty) porl_receipt_qty,
"
"                            SUM (mat_amt) mat_amt,
"
"                            suphd_grn_refer,
"
"                            SUM (suphd_gross_sc_val) suphd_gross_sc_val,
"
"                            SUM (suphd_gross_bc_val) suphd_gross_bc_val,
"
"                            (suphd_dom_val) suphd_dom_val,
"
"                            SUM (suphd_imp_val) suphd_imp_val,
"
"                            (suphd_tax_val_bc) suphd_tax_val_bc,
"
"                            (suphd_tax_val_tc) suphd_tax_val_tc,
"
"                            0 suphd_grn_tax_val,
"
"                            0 tds_value,
"
"                            0 tds_pct,
"
"                            0 tds_assbl_value,
"
"                            0 esi_value,
"
"                            0 esi_pct,
"
"                            0 esi_assbl_value,
"
"                            NULL suphd_suplr_reference,
"
"                            'N' recover_flag,
"
"                            suphd_gstin_no,
"
"                            suphd_bill_loc_id,
"
"                            'U' suphd_suplr_type,
"
"                            suphd_gst_class,
"
"                            --'N' suphd_gst_rev_tax_flag,
"
"                            'Y' suphd_gst_supply,
"
"                            suphd_gst_type,
"
"                            'GRN' suphd_vou_type,
"
"                            state_code,
"
"                            porptc_type,
"
"                            suplr_addr,
"
"                            suplr_zip,
"
"                            suplr_state,
"
"                            suphd_grn_pfx,
"
"                                suphd_grn_no,
"
"                                suphd_grn_date,
"
"                                suphd_blto_state_code
"
"                       FROM (  SELECT porh_bu suphd_bu,
"
"                                      porh_plnt suphd_plant,
"
"                                      porh_billfr_loc_name suphd_plant_loc_id,
"
"                                      porh_receipt_date suphd_doc_date,
"
"                                      NULL suphd_pfx,
"
"                                      prlc_rcpt_no suphd_doc_no,
"
"                                      'I' suphd_doc_type,
"
"                                      'R' suphd_doc_mode,
"
"                                      prlc_suplr_id suphd_suplr_id,
"
"                                      suplr_name1 suphd_suplr_name,
"
"                                      prlc_suplr_doc_no suphd_suplr_bill_no,
"
"                                      TRUNC (prlc_suplr_doc_date)
"
"                                         suphd_suplr_bill_date,
"
"                                      prlc_currency suphd_currency,
"
"                                      prlc_exchange_rate suphd_exchange_rate,
"
"                                      DECODE (porh_status,
"
"                                              'N', 'N',
"
"                                              'Q', 'N',
"
"                                              'P', 'N',
"
"                                              'O', 'N',
"
"                                              'R', 'P')
"
"                                         suphd_status,
"
"                                        --                            SUM (prlc_tc_amt * prlc_exchange_rate)
"
"                                        (SELECT ROUND (
"
"                                                   NVL (
"
"                                                      SUM (
"
"                                                           prlc_tc_amt
"
"                                                         * prlc_exchange_rate),
"
"                                                      0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NOT NULL)
"
"                                      + (SELECT ROUND (
"
"                                                   NVL (
"
"                                                      SUM (
"
"                                                           prlc_tc_amt
"
"                                                         * prlc_exchange_rate),
"
"                                                      0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NULL)
"
"                                         bill_amt_bc,
"
"                                        -- SUM (prlc_tc_amt)
"
"                                        (SELECT ROUND (
"
"                                                   NVL (SUM (prlc_tc_amt), 0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NOT NULL)
"
"                                      + (SELECT ROUND (
"
"                                                   NVL (SUM (prlc_tc_amt), 0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NULL)
"
"                                         bill_amt_tc,
"
"                                      0 porl_receipt_qty,
"
"                                      SUM (prlc_tc_amt) mat_amt,
"
"                                      'GL' suphd_grn_refer,
"
"                                      SUM (prlc_tc_amt) suphd_gross_sc_val,
"
"                                      SUM (prlc_tc_amt * prlc_exchange_rate)
"
"                                         suphd_gross_bc_val,
"
"                                      (SELECT ROUND (
"
"                                                 NVL (SUM (prlc_tc_amt), 0),
"
"                                                 func_find_appl_rnddigit (porh_bu))
"
"                                         FROM pur_rcpt_land_costs_view b
"
"                                        WHERE     b.prlc_bu = p_bu
"
"                                              AND b.prlc_rcpt_no = porh_receipt_no
"
"                                              AND b.prlc_seq_no = prlc_seq_no
"
"                                              AND prlc_sub_seq_no IS NOT NULL)
"
"                                         suphd_dom_val,
"
"                                      SUM (prlc_tc_amt * prlc_exchange_rate)
"
"                                         suphd_imp_val,
"
"                                      (SELECT ROUND (
"
"                                                 NVL (
"
"                                                    SUM (
"
"                                                         prlc_tc_amt
"
"                                                       * prlc_exchange_rate),
"
"                                                    0),
"
"                                                 func_find_appl_rnddigit (porh_bu))
"
"                                         FROM pur_rcpt_land_costs_view b
"
"                                        WHERE     b.prlc_bu = p_bu
"
"                                              AND b.prlc_rcpt_no = porh_receipt_no
"
"                                              AND b.prlc_seq_no = prlc_seq_no
"
"                                              AND prlc_sub_seq_no IS NOT NULL)
"
"                                         suphd_tax_val_bc,
"
"                                      (SELECT ROUND (
"
"                                                 NVL (SUM (prlc_tc_amt), 0),
"
"                                                 func_find_appl_rnddigit (porh_bu))
"
"                                         FROM pur_rcpt_land_costs_view b
"
"                                        WHERE     b.prlc_bu = p_bu
"
"                                              AND b.prlc_rcpt_no = porh_receipt_no
"
"                                              AND b.prlc_seq_no = prlc_seq_no
"
"                                              AND prlc_sub_seq_no IS NOT NULL)
"
"                                         suphd_tax_val_tc,
"
"                                      0 suphd_grn_tax_val,
"
"                                      0 tds_value,
"
"                                      0 tds_pct,
"
"                                      0 tds_assbl_value,
"
"                                      0 esi_value,
"
"                                      0 esi_pct,
"
"                                      0 esi_assbl_value,
"
"                                      NULL suphd_suplr_reference,
"
"                                      --func_find_recover_flag (suphd_bu, suphd_pfx, suphd_doc_no)
"
"                                      'N' recover_flag,
"
"                                      (SELECT ssl_gst_no
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                            --  AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suphd_gstin_no,
"
"                                      porh_billfr_loc_name suphd_bill_loc_id,
"
"                                      'U' suphd_suplr_type,
"
"                                      (SELECT ssl_type
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                            --  AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suphd_gst_class,
"
"                                      -- 'N' suphd_gst_rev_tax_flag,
"
"                                      'Y' suphd_gst_supply,
"
"                                      porh_gst_type suphd_gst_type,
"
"                                      'GRN' suphd_vou_type,
"
"                                      (SELECT state_code
"
"                                         FROM states
"
"                                        WHERE state_id = suplr_state)
"
"                                         state_code,
"
"                                      'L' porptc_type,
"
"                                      (SELECT ssl_addr1
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                           --   AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suplr_addr,
"
"                                      (SELECT ssl_zip
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                           --   AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suplr_zip,
"
"                                      (SELECT (SELECT NVL (state_name1,
"
"                                                           state_name2)
"
"                                                 FROM states
"
"                                                WHERE state_id = ssl_state)
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                             -- AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suplr_state,
"
"                                         porh_receipt_pfx suphd_grn_pfx,
"
"                               porh_receipt_no  suphd_grn_no,
"
"                               porh_receipt_date  suphd_grn_date,
"
"                                   (select prah_billto_state_code
"
"                                from pur_rcpt_addr_hist
"
"                                where prah_bu =p_bu
"
"                               -- and prah_rcpt_pfx = porh_receipt_pfx
"
"                                and prah_rcpt_no = porh_receipt_no) suphd_blto_state_code
"
"                                 FROM pur_ord_receipt_hd_view,
"
"                                      pur_rcpt_land_costs_view a,
"
"                                      suppliers,
"
"                                      appl_journals_hist_vw
"
"                                WHERE     porh_bu = prlc_bu
"
"                                      AND porh_receipt_no = prlc_rcpt_no
"
"                                      AND suplr_bu = prlc_bu
"
"                                      AND suplr_suplr_id = prlc_suplr_id
"
"                                      AND porh_status NOT IN 'C'
"
"                                      AND (   (    porh_status IN ('N',
"
"                                                                   'Q',
"
"                                                                   'P',
"
"                                                                   'O')
"
"                                               AND p_status = 'N')
"
"                                           OR (    porh_status IN ('R')
"
"                                               AND p_status = 'P')
"
"                                           OR p_status IS NULL)
"
"                                      AND a.prlc_sub_seq_no IS NULL
"
"                                      AND porh_bu = p_bu
"
"                                      AND (   porh_receipt_date >= p_from_date
"
"                                           OR p_from_date IS NULL)
"
"                                      AND (   porh_receipt_date <= p_to_date
"
"                                           OR p_to_date IS NULL)
"
"                                      AND func_find_glm_pur_jrnl_type (p_bu) IN ('G')
"
"                                    AND ajhv_bu(+) = porh_bu
"
"                                    AND ajhv_vou_pfx(+) = porh_receipt_pfx
"
"                                    AND ajhv_vou_no(+) = porh_receipt_no
"
"                                    AND ajhv_vou_line_no(+) = prlc_seq_no
"
"                                    AND (    ajhv_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                                                                FROM bill_reg_lvl1
"
"                                                                               WHERE     brl1_bu = p_bu
"
"                                                                                     AND brl1_cre_by = p_user
"
"                                                                                     AND brl1_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                                            FROM bill_reg_lvl2
"
"                                                           WHERE     brl2_bu = p_bu
"
"                                                                 AND brl2_cre_by = p_user
"
"                                                                 AND brl2_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                                            FROM bill_reg_lvl3
"
"                                                           WHERE     brl3_bu = p_bu
"
"                                                                 AND brl3_cre_by = p_user
"
"                                                                 AND brl3_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                                            FROM bill_reg_lvl4
"
"                                                           WHERE     brl4_bu = p_bu
"
"                                                                 AND brl4_cre_by = p_user
"
"                                                                 AND brl4_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                                            FROM bill_reg_lvl5
"
"                                                           WHERE     brl5_bu = p_bu
"
"                                                                 AND brl5_cre_by = p_user
"
"                                                                 AND brl5_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                                            FROM bill_reg_lvl6
"
"                                                           WHERE     brl6_bu = p_bu
"
"                                                                 AND brl6_cre_by = p_user
"
"                                                                 AND brl6_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                                               FROM bill_reg_lvl_prj
"
"                                                              WHERE     brlp_bu = p_bu
"
"                                                                    AND brlp_cre_by = p_user
"
"                                                                    AND brlp_sel_flag = 'Y'))
"
"                             GROUP BY porh_bu,
"
"                                      porh_plnt,
"
"                                      porh_billfr_loc_name,
"
"                                      porh_receipt_date,
"
"                                      prlc_rcpt_no,
"
"                                      prlc_suplr_id,
"
"                                      suplr_name1,
"
"                                      prlc_suplr_doc_no,
"
"                                      TRUNC (prlc_suplr_doc_date),
"
"                                      prlc_currency,
"
"                                      prlc_exchange_rate,
"
"                                      porh_status,
"
"                                    --  porh_loc_id,
"
"                                     porh_billfr_loc_name,
"
"                                      porh_gst_type,
"
"                                      suplr_state,
"
"                                      porh_receipt_pfx,
"
"                                      porh_receipt_no,
"
"                                      porh_receipt_date
"
"                             UNION ALL
"
"                               SELECT porh_bu suphd_bu,
"
"                                      porh_plnt suphd_plant,
"
"                                      porh_billfr_loc_name suphd_plant_loc_id,
"
"                                      porh_receipt_date suphd_doc_date,
"
"                                      null suphd_pfx,
"
"                                      null suphd_doc_no,
"
"                                      'I' suphd_doc_type,
"
"                                      'R' suphd_doc_mode,
"
"                                      prlc_suplr_id suphd_suplr_id,
"
"                                      suplr_name1 suphd_suplr_name,
"
"                                      prlc_suplr_doc_no suphd_suplr_bill_no,
"
"                                      TRUNC (prlc_suplr_doc_date)
"
"                                         suphd_suplr_bill_date,
"
"                                      prlc_currency suphd_currency,
"
"                                      prlc_exchange_rate suphd_exchange_rate,
"
"                                      DECODE (porh_status,
"
"                                              'N', 'N',
"
"                                              'Q', 'N',
"
"                                              'P', 'N',
"
"                                              'O', 'N',
"
"                                              'R', 'P')
"
"                                         suphd_status,
"
"                                        --                            SUM (prlc_tc_amt * prlc_exchange_rate)
"
"                                        (SELECT ROUND (
"
"                                                   NVL (
"
"                                                      SUM (
"
"                                                           prlc_tc_amt
"
"                                                         * prlc_exchange_rate),
"
"                                                      0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NOT NULL)
"
"                                      + (SELECT ROUND (
"
"                                                   NVL (
"
"                                                      SUM (
"
"                                                           prlc_tc_amt
"
"                                                         * prlc_exchange_rate),
"
"                                                      0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NULL)
"
"                                         bill_amt_bc,
"
"                                        -- SUM (prlc_tc_amt)
"
"                                        (SELECT ROUND (
"
"                                                   NVL (SUM (prlc_tc_amt), 0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NOT NULL)
"
"                                      + (SELECT ROUND (
"
"                                                   NVL (SUM (prlc_tc_amt), 0),
"
"                                                   func_find_appl_rnddigit (
"
"                                                      porh_bu))
"
"                                           FROM pur_rcpt_land_costs_view b
"
"                                          WHERE     b.prlc_bu = p_bu
"
"                                                AND b.prlc_rcpt_no =
"
"                                                       porh_receipt_no
"
"                                                AND b.prlc_seq_no = prlc_seq_no
"
"                                                AND prlc_sub_seq_no IS NULL)
"
"                                         bill_amt_tc,
"
"                                      0 porl_receipt_qty,
"
"                                      SUM (prlc_tc_amt) mat_amt,
"
"                                      'GL' suphd_grn_refer,
"
"                                      SUM (prlc_tc_amt) suphd_gross_sc_val,
"
"                                      SUM (prlc_tc_amt * prlc_exchange_rate)
"
"                                         suphd_gross_bc_val,
"
"                                      (SELECT ROUND (
"
"                                                 NVL (SUM (prlc_tc_amt), 0),
"
"                                                 func_find_appl_rnddigit (porh_bu))
"
"                                         FROM pur_rcpt_land_costs_view b
"
"                                        WHERE     b.prlc_bu = p_bu
"
"                                              AND b.prlc_rcpt_no = porh_receipt_no
"
"                                              AND b.prlc_seq_no = prlc_seq_no
"
"                                              AND prlc_sub_seq_no IS NOT NULL)
"
"                                         suphd_dom_val,
"
"                                      SUM (prlc_tc_amt * prlc_exchange_rate)
"
"                                         suphd_imp_val,
"
"                                      (SELECT ROUND (
"
"                                                 NVL (
"
"                                                    SUM (
"
"                                                         prlc_tc_amt
"
"                                                       * prlc_exchange_rate),
"
"                                                    0),
"
"                                                 func_find_appl_rnddigit (porh_bu))
"
"                                         FROM pur_rcpt_land_costs_view b
"
"                                        WHERE     b.prlc_bu = p_bu
"
"                                              AND b.prlc_rcpt_no = porh_receipt_no
"
"                                              AND b.prlc_seq_no = prlc_seq_no
"
"                                              AND prlc_sub_seq_no IS NOT NULL)
"
"                                         suphd_tax_val_bc,
"
"                                      (SELECT ROUND (
"
"                                                 NVL (SUM (prlc_tc_amt), 0),
"
"                                                 func_find_appl_rnddigit (porh_bu))
"
"                                         FROM pur_rcpt_land_costs_view b
"
"                                        WHERE     b.prlc_bu = p_bu
"
"                                              AND b.prlc_rcpt_no = porh_receipt_no
"
"                                              AND b.prlc_seq_no = prlc_seq_no
"
"                                              AND prlc_sub_seq_no IS NOT NULL)
"
"                                         suphd_tax_val_tc,
"
"                                      0 suphd_grn_tax_val,
"
"                                      0 tds_value,
"
"                                      0 tds_pct,
"
"                                      0 tds_assbl_value,
"
"                                      0 esi_value,
"
"                                      0 esi_pct,
"
"                                      0 esi_assbl_value,
"
"                                      NULL suphd_suplr_reference,
"
"                                      --func_find_recover_flag (suphd_bu, suphd_pfx, suphd_doc_no)
"
"                                      'N' recover_flag,
"
"                                      (SELECT ssl_gst_no
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                           --   AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suphd_gstin_no,
"
"                                       porh_billfr_loc_name suphd_bill_loc_id,
"
"                                      'U' suphd_suplr_type,
"
"                                      (SELECT ssl_type
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                             -- AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suphd_gst_class,
"
"                                      -- 'N' suphd_gst_rev_tax_flag,
"
"                                      'Y' suphd_gst_supply,
"
"                                      porh_gst_type suphd_gst_type,
"
"                                      'GRN' suphd_vou_type,
"
"                                      (SELECT state_code
"
"                                         FROM states
"
"                                        WHERE state_id = suplr_state)
"
"                                         state_code,
"
"                                      'R' porptc_type,
"
"                                      (SELECT ssl_addr1
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                             -- AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suplr_addr,
"
"                                      (SELECT ssl_zip
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                            --  AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suplr_zip,
"
"                                      (SELECT (SELECT NVL (state_name1,
"
"                                                           state_name2)
"
"                                                 FROM states
"
"                                                WHERE state_id = ssl_state)
"
"                                         FROM suplr_ship_loc
"
"                                        WHERE     ssl_bu = porh_bu
"
"                                              AND ssl_suplr_id = prlc_suplr_id
"
"                                              AND ssl_loc_name1 = porh_billfr_loc_name
"
"                                            --  AND ssl_loc_id = porh_loc_id
"
"                                              )
"
"                                         suplr_state,
"
"                                         porh_receipt_pfx   suphd_grn_pfx,
"
"                                        porh_receipt_no  suphd_grn_no,
"
"                                        porh_receipt_date  suphd_grn_date,
"
"                                         (select prah_billto_state_code
"
"                                from pur_rcpt_addr_hist
"
"                                where prah_bu =p_bu
"
"                             --   and prah_rcpt_pfx = porh_receipt_pfx
"
"                                and prah_rcpt_no = porh_receipt_no) suphd_blto_state_code
"
"                                 FROM pur_ord_receipt_hd_view,
"
"                                      pur_rcpt_land_costs_view a,
"
"                                      suppliers,
"
"                                      appl_journals_hist_vw
"
"                                WHERE     porh_bu = prlc_bu
"
"                                      AND porh_receipt_no = prlc_rcpt_no
"
"                                      AND suplr_bu = prlc_bu
"
"                                      AND suplr_suplr_id = porh_suplr_id
"
"                                      AND prlc_suplr_id IS NULL
"
"                                      AND porh_status NOT IN 'C'
"
"                                      AND (   (    porh_status IN ('N',
"
"                                                                   'Q',
"
"                                                                   'P',
"
"                                                                   'O')
"
"                                               AND p_status = 'N')
"
"                                           OR (    porh_status IN ('R')
"
"                                               AND p_status = 'P')
"
"                                           OR p_status IS NULL)
"
"                                      AND a.prlc_sub_seq_no IS NULL
"
"                                      AND a.prlc_type IN ('L', 'I')
"
"                                      AND porh_bu = p_bu
"
"                                      AND (   porh_receipt_date >= p_from_date
"
"                                           OR p_from_date IS NULL)
"
"                                      AND (   porh_receipt_date <= p_to_date
"
"                                           OR p_to_date IS NULL)
"
"                                      AND func_find_glm_pur_jrnl_type (p_bu) IN ('I')
"
"                                      AND ajhv_bu(+) = porh_bu
"
"                                    AND ajhv_vou_pfx(+) = porh_receipt_pfx
"
"                                    AND ajhv_vou_no(+) = porh_receipt_no
"
"                                    AND ajhv_vou_line_no(+) = prlc_seq_no
"
"                                    AND (    ajhv_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                                                                FROM bill_reg_lvl1
"
"                                                                               WHERE     brl1_bu = p_bu
"
"                                                                                     AND brl1_cre_by = p_user
"
"                                                                                     AND brl1_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                                            FROM bill_reg_lvl2
"
"                                                           WHERE     brl2_bu = p_bu
"
"                                                                 AND brl2_cre_by = p_user
"
"                                                                 AND brl2_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                                            FROM bill_reg_lvl3
"
"                                                           WHERE     brl3_bu = p_bu
"
"                                                                 AND brl3_cre_by = p_user
"
"                                                                 AND brl3_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                                            FROM bill_reg_lvl4
"
"                                                           WHERE     brl4_bu = p_bu
"
"                                                                 AND brl4_cre_by = p_user
"
"                                                                 AND brl4_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                                            FROM bill_reg_lvl5
"
"                                                           WHERE     brl5_bu = p_bu
"
"                                                                 AND brl5_cre_by = p_user
"
"                                                                 AND brl5_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                                            FROM bill_reg_lvl6
"
"                                                           WHERE     brl6_bu = p_bu
"
"                                                                 AND brl6_cre_by = p_user
"
"                                                                 AND brl6_sel_flag = 'Y')
"
"                                     AND ajhv_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                                               FROM bill_reg_lvl_prj
"
"                                                              WHERE     brlp_bu = p_bu
"
"                                                                    AND brlp_cre_by = p_user
"
"                                                                    AND brlp_sel_flag = 'Y'))
"
"                             GROUP BY porh_bu,
"
"                                      porh_plnt,
"
"                                      porh_billfr_loc_name,
"
"                                      porh_receipt_date,
"
"                                      prlc_rcpt_no,
"
"                                      prlc_suplr_id,
"
"                                      suplr_name1,
"
"                                      prlc_suplr_doc_no,
"
"                                      TRUNC (prlc_suplr_doc_date),
"
"                                      prlc_currency,
"
"                                      prlc_exchange_rate,
"
"                                      porh_status,
"
"                                    --  porh_loc_id,
"
"                                      porh_billfr_loc_name,
"
"                                      porh_gst_type,
"
"                                      suplr_state,
"
"                                      porh_receipt_pfx,
"
"                                      porh_receipt_no,
"
"                                      porh_receipt_date)
"
"                   GROUP BY suphd_bu,
"
"                            suphd_plant,
"
"                            suphd_plant_loc_id,
"
"                            suphd_doc_date,
"
"                            suphd_pfx,
"
"                            suphd_doc_no,
"
"                            suphd_suplr_id,
"
"                            suphd_suplr_name,
"
"                            suphd_suplr_bill_no,
"
"                            suphd_suplr_bill_date,
"
"                            suphd_currency,
"
"                            suphd_exchange_rate,
"
"                            suphd_status,
"
"                            suphd_gstin_no,
"
"                            suphd_bill_loc_id,
"
"                            suphd_gst_class,
"
"                            suphd_gst_type,
"
"                            state_code,
"
"                            porptc_type,
"
"                            suphd_grn_refer,
"
"                            suphd_dom_val,
"
"                            suphd_tax_val_bc,
"
"                            suphd_tax_val_tc,
"
"                            suplr_addr,
"
"                            suplr_zip,
"
"                            suplr_state,
"
"                             suphd_grn_pfx,
"
"                             suphd_grn_no,
"
"                             suphd_grn_date,
"
"                             suphd_blto_state_code)
"
"         GROUP BY suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plant_loc_id,
"
"                  suphd_doc_date,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  suphd_suplr_id,
"
"                  suphd_suplr_name,
"
"                  suphd_suplr_bill_no,
"
"                  suphd_suplr_bill_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  suphd_gstin_no,
"
"                  suphd_bill_loc_id,
"
"                  suphd_gst_class,
"
"                  suphd_gst_type,
"
"                  state_code,
"
"                  porptc_type,
"
"                  suphd_grn_refer,
"
"                  suphd_dom_val,
"
"                  suphd_tax_val_bc,
"
"                  suphd_tax_val_tc,
"
"                  suplr_addr,
"
"                  suplr_zip,
"
"                  suplr_state,
"
"                   suphd_grn_pfx,
"
"                     suphd_grn_no,
"
"                     suphd_grn_date,
"
"                     suphd_blto_state_code;
"
"
"
"
"
"      CURSOR c3 (
"
"         c_bu        VARCHAR2,
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"         SELECT porh_bu suphd_bu,
"
"                porh_plnt suphd_plant,
"
"               porh_billfr_loc_name suphd_plant_loc_id,
"
"                porh_receipt_pfx suphd_pfx,
"
"                porh_receipt_no suphd_doc_no,
"
"                porl_prod_id suplnh_prod_id,
"
"                porl_prod_rev suplnh_prod_rev,
"
"                porl_prod_desc1 suplnh_prod_desc1,
"
"                NULL pur_cls,
"
"                porl_receipt_qty suplnh_receipt_qty,
"
"                0 suplnh_invoiced_qty,
"
"                porl_accepted_qty suplnh_inv_qty,
"
"                porl_sc_unit_cost suplnh_unit_cost,
"
"                (CASE
"
"                    WHEN porh_currency IS NOT NULL
"
"                    THEN
"
"                       ROUND (
"
"                          (  (porl_sc_unit_cost * porl_receipt_qty)
"
"                           - porl_sc_chrg_amt
"
"                           - porl_sc_lm_disc_amt),
"
"                          5)
"
"                    ELSE
"
"                       0
"
"                 END)
"
"                   line_amt,
"
"                        ROUND (NVL (SUM (NVL(SUM (CASE
"
"                                   WHEN (PORL_IGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_IGST_AMT)
"
"                                   WHEN (PORL_CGST_AMT + PORL_SGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CGST_AMT + PORL_SGST_AMT)
"
"                                   WHEN (PORL_UTGST_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_UTGST_AMT)
"
"                                   WHEN (PORL_CESS_AMT) > 0
"
"                                   THEN
"
"                                      (PORL_CESS_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END),0)), 0),
"
"                               func_find_appl_rnddigit (porh_bu))
"
"                   navl_tax_amt,
"
"                ajhv_gl_acct,
"
"                DECODE (ajhv_gl_acct,
"
"                        NULL, NULL,
"
"                        func_find_gl_acct_cls (porl_bu, ajhv_gl_acct))
"
"                   gl_class,
"
"                DECODE (
"
"                   ajhv_gl_acct,
"
"                   NULL, NULL,
"
"                   DECODE (
"
"                      func_find_gl_acct_cls (porl_bu, ajhv_gl_acct),
"
"                      NULL, NULL,
"
"                      func_find_gl_par_class_id (
"
"                         porl_bu,
"
"                         func_find_gl_acct_cls (porl_bu, ajhv_gl_acct))))
"
"                   par_gl_class,
"
"                   porl_cc_code,
"
"                   porl_gst_rev_tax_cat suplnh_gst_rev_tax_cat,
"
"                   (select prah_billto_state_code
"
"                                from pur_rcpt_addr_hist
"
"                                where prah_bu =p_bu
"
"                               -- and prah_rcpt_pfx = porh_receipt_pfx
"
"                                and prah_rcpt_no = porh_receipt_no)suphd_blto_state_code,
"
"                                 porl_cgst_amt,
"
"                porl_sgst_amt,
"
"                porl_igst_amt,
"
"                porl_utgst_amt,
"
"                porl_tax_pct,
"
"                porl_hsn_code,
"
"                porh_billfr_clf_type,
"
"                porl_gst_rev_tax_flag,
"
"                porl_cgst_pct,
"
"                porl_sgst_pct,
"
"                porl_utgst_pct
"
"           FROM pur_ord_receipt_hd_view,
"
"                pur_ord_receipt_ln_view a,
"
"                appl_journals_hist_vw,
"
"                gl_accts
"
"          WHERE     porh_bu = porl_bu
"
"               -- AND porh_receipt_pfx = porl_receipt_pfx
"
"                AND porh_receipt_no = porl_receipt_no
"
"                AND porh_status NOT IN 'C'
"
"                AND (   (    porh_status IN ('N',
"
"                                             'Q',
"
"                                             'P',
"
"                                             'O')
"
"                         AND p_status = 'N')
"
"                     OR (porh_status IN ('R') AND p_status = 'P')
"
"                     OR p_status IS NULL)
"
"                AND porl_matl_type IN ('PR', 'T')
"
"                AND porh_bu = c_bu
"
"                AND porh_receipt_pfx = c_pfx
"
"                AND porh_receipt_no = c_doc_no
"
"                AND ajhv_bu(+) = porh_bu
"
"                AND ajhv_vou_pfx(+) = porh_receipt_pfx
"
"                AND ajhv_vou_no(+) = porh_receipt_no
"
"                AND ajhv_vou_line_no(+) = porl_seq_no
"
"                AND ajhv_tc_id IS NULL
"
"                AND glac_bu = porh_bu
"
"                AND glac_acct = ajhv_gl_acct
"
"                AND glac_sub_grp_type = 'P'
"
"                AND (    ajhv_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'));
"
"
"
"
"
"      v_rnd   NUMBER (5);
"
"   BEGIN
"
"
"
"      v_rnd := func_find_appl_rnddigit (p_bu);
"
"
"
"      DELETE bill_reg_grn_ln_temp
"
"       WHERE     brglt_bu = p_bu
"
"             AND brglt_doc_no = p_doc_no
"
"             AND brglt_vou_type = 'GRN';
"
"
"
"      DELETE bill_item_line_temp
"
"       WHERE     bilt_bu = p_bu
"
"             AND bilt_doc_no = p_doc_no
"
"             AND (bilt_vou_type = 'GRN' OR bilt_vou_type IS NULL);
"
"
"
"      FOR r_grn_pl IN c_grn_pl
"
"      LOOP
"
"         INSERT /*+ append */
"
"               INTO  bill_reg_grn_ln_temp (brglt_bu,
"
"                                           brglt_doc_no,
"
"                                           brglt_plnt,
"
"                                           brglt_plnt_loc,
"
"                                           brglt_vou_type,
"
"                                           brglt_inv_pfx,
"
"                                           brglt_inv_no,
"
"                                           brglt_inv_date,
"
"                                           brglt_inv_type,
"
"                                           brglt_inv_mode,
"
"                                           brglt_suplr_id,
"
"                                           brglt_suplr_name,
"
"                                           brglt_suplr_bill_no,
"
"                                           brglt_suplr_bill_date,
"
"                                           brglt_curry,
"
"                                           brglt_exchange_rate,
"
"                                           brglt_gross_sc_val,
"
"                                           brglt_gross_bc_val,
"
"                                           brglt_net_sc_val,
"
"                                           brglt_net_bc_val,
"
"                                           brglt_dom_val,
"
"                                           brglt_imp_val,
"
"                                           brglt_tax_val,
"
"                                           brglt_grn_tax_val,
"
"                                           brglt_cre_by,
"
"                                           brglt_cre_date,
"
"                                           brglt_bill_amt_bc,
"
"                                           brglt_bill_amt_tc,
"
"                                           brglt_type,
"
"                                           brglt_grn_refer,
"
"                                           brglt_sub_cls,
"
"                                           brglt_mat_amt,
"
"                                           brglt_status,
"
"                                           brglt_reference,
"
"                                           brglt_recover,
"
"                                           brglt_tds_val,
"
"                                           brglt_tds_pct,
"
"                                           brglt_tds_assbl_val,
"
"                                           brglt_esi_val,
"
"                                           brglt_esi_pct,
"
"                                           brglt_esi_assbl_val,
"
"                                           brglt_state_code,
"
"                                           brglt_grn_type,
"
"                                           brglt_bill_qty,
"
"                                           brglt_party_addr,
"
"                                           brglt_party_pin,
"
"                                           brglt_party_state,
"
"                                           brglt_suplr_gstin,
"
"                                            brglt_suplr_reg_type,
"
"                                            brglt_suplr_type,
"
"                                            brglt_bill_loc_id,
"
"                                            brglt_grn_pfx,
"
"                                                brglt_grn_no,
"
"                                                brglt_grn_date,
"
"                                                brglt_bill_to_code)
"
"                 VALUES (
"
"                           p_bu,
"
"                           p_doc_no,
"
"                           r_grn_pl.suphd_plant,
"
"                           r_grn_pl.suphd_plant_loc_id,
"
"                           r_grn_pl.suphd_vou_type,
"
"                           r_grn_pl.suphd_pfx,
"
"                           r_grn_pl.suphd_doc_no,
"
"                           r_grn_pl.suphd_doc_date,
"
"                           r_grn_pl.suphd_doc_type,
"
"                           r_grn_pl.suphd_doc_mode,
"
"                           r_grn_pl.suphd_suplr_id,
"
"                           r_grn_pl.suphd_suplr_name,
"
"                           r_grn_pl.suphd_suplr_bill_no,
"
"                           r_grn_pl.suphd_suplr_bill_date,
"
"                           r_grn_pl.suphd_currency,
"
"                           r_grn_pl.suphd_exchange_rate,
"
"                           ROUND (r_grn_pl.suphd_gross_sc_val, v_rnd),
"
"                           ROUND (r_grn_pl.suphd_gross_bc_val, v_rnd),
"
"                           ROUND (
"
"                                r_grn_pl.suphd_gross_sc_val
"
"                              + r_grn_pl.suphd_tax_val_tc,
"
"                              v_rnd),
"
"                           ROUND (
"
"                                r_grn_pl.suphd_gross_bc_val
"
"                              + r_grn_pl.suphd_tax_val_bc,
"
"                              v_rnd),
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) =
"
"                                      r_grn_pl.suphd_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_grn_pl.bill_amt_bc
"
"                                     - r_grn_pl.suphd_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) <>
"
"                                      r_grn_pl.suphd_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_grn_pl.bill_amt_bc
"
"                                     - r_grn_pl.suphd_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           ROUND (r_grn_pl.suphd_tax_val_tc, v_rnd),
"
"                           ROUND (r_grn_pl.suphd_grn_tax_val, v_rnd),
"
"                           p_user,
"
"                           SYSDATE,
"
"                           ROUND (r_grn_pl.bill_amt_bc, v_rnd),
"
"                           ROUND (r_grn_pl.bill_amt_tc, v_rnd),
"
"                           'M',
"
"                           r_grn_pl.suphd_grn_refer,
"
"                           NULL,                                  --v_sub_cls,
"
"                           ROUND (
"
"                                r_grn_pl.bill_amt_bc
"
"                              - r_grn_pl.suphd_tax_val_bc,
"
"                              v_rnd),
"
"                           r_grn_pl.suphd_status,
"
"                           r_grn_pl.suphd_suplr_reference,
"
"                           r_grn_pl.recover_flag,
"
"                           ROUND (r_grn_pl.tds_value, v_rnd),
"
"                           r_grn_pl.tds_pct,
"
"                           ROUND (r_grn_pl.tds_assbl_value, v_rnd),
"
"                           ROUND (r_grn_pl.esi_value, v_rnd),
"
"                           r_grn_pl.esi_pct,
"
"                           ROUND (r_grn_pl.esi_assbl_value, v_rnd),
"
"                           r_grn_pl.state_code,
"
"                           r_grn_pl.porptc_type,
"
"                           r_grn_pl.porl_receipt_qty,
"
"                           r_grn_pl.suplr_addr,
"
"                           r_grn_pl.suplr_zip,
"
"                           r_grn_pl.suplr_state,
"
"                           r_grn_pl.suphd_gstin_no,
"
"                            r_grn_pl.suphd_suplr_type,
"
"                            r_grn_pl.suphd_gst_class,
"
"                             r_grn_pl.suphd_bill_loc_id,
"
"                             r_grn_pl.suphd_grn_pfx,
"
"                             r_grn_pl.suphd_grn_no,
"
"                             r_grn_pl.suphd_grn_date,
"
"                             r_grn_pl.suphd_blto_state_code);
"
"
"
"         FOR cr3 IN c3 (p_bu, r_grn_pl.suphd_pfx, r_grn_pl.suphd_doc_no)
"
"         LOOP
"
"            INSERT INTO bill_item_line_temp (bilt_bu,
"
"                                             bilt_doc_no,
"
"                                             bilt_plnt,
"
"                                             bilt_plnt_loc,
"
"                                             bilt_inv_pfx,
"
"                                             bilt_inv_no,
"
"                                             bilt_prod_id,
"
"                                             bilt_prod_rev,
"
"                                             bilt_prod_desc1,
"
"                                             bilt_pur_cls,
"
"                                             bilt_receipt_qty,
"
"                                             bilt_invoiced_qty,
"
"                                             bilt_inv_qty,
"
"                                             bilt_unit_cost,
"
"                                             bilt_ln_amt,
"
"                                             bilt_acct,
"
"                                             bilt_cl_id,
"
"                                             bilt_par_cl_id,
"
"                                             bilt_cre_by,
"
"                                             bilt_cre_date,
"
"                                             bilt_vou_type,
"
"                                             bilt_cc_code,
"
"                                             bilt_rcm_cat,
"
"                                              bilt_cgst_amt,
"
"                                             bilt_sgst_amt,
"
"                                             bilt_igst_amt,
"
"                                             bilt_utgst_amt,
"
"                                             bilt_rcm_flag,
"
"                                             bilt_gst_rate,
"
"                                             bilt_hsn_code,
"
"                                             bilt_gst_class,
"
"                                             bilt_gst_rev_tax_flag,
"
"                                             bilt_cgst_rate,
"
"                                             bilt_sgst_rate,
"
"                                             bilt_igst_rate,
"
"                                             bilt_utgst_rate)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         cr3.suphd_plant,
"
"                         cr3.suphd_plant_loc_id,
"
"                         cr3.suphd_pfx,
"
"                         cr3.suphd_doc_no,
"
"                         cr3.suplnh_prod_id,
"
"                         cr3.suplnh_prod_rev,
"
"                         cr3.suplnh_prod_desc1,
"
"                         cr3.pur_cls,
"
"                         cr3.suplnh_receipt_qty,
"
"                         cr3.suplnh_invoiced_qty,
"
"                         cr3.suplnh_inv_qty,
"
"                         cr3.suplnh_unit_cost,
"
"                         cr3.line_amt + cr3.navl_tax_amt,
"
"                         cr3.ajhv_gl_acct,
"
"                         cr3.gl_class,
"
"                         cr3.par_gl_class,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'GRN',
"
"                         cr3.porl_cc_code,
"
"                         cr3.suplnh_gst_rev_tax_cat,
"
"
"
"                         cr3.porl_cgst_amt,
"
"                         cr3.porl_sgst_amt,
"
"                         cr3.porl_igst_amt,
"
"                         cr3.porl_utgst_amt,
"
"                         'N',
"
"                         cr3.porl_tax_pct,
"
"                         cr3.porl_hsn_code,
"
"                         cr3.porh_billfr_clf_type,
"
"                         cr3.porl_gst_rev_tax_flag,
"
"                         cr3.porl_cgst_pct,
"
"                         cr3.porl_sgst_pct,
"
"                         cr3.porl_tax_pct,
"
"                         cr3.porl_utgst_pct);
"
"         END LOOP;
"
"      END LOOP c_grn_pl;
"
"   END proc_ins_grn_perpectual;
"
"
"
"
"
"   PROCEDURE proc_ins_landcost_lines (p_bu           VARCHAR2,
"
"                                      p_doc_no       VARCHAR2,
"
"                                      p_from_date    DATE DEFAULT NULL,
"
"                                      p_to_date      DATE DEFAULT NULL,
"
"                                      p_status       VARCHAR2,
"
"                                      p_user         VARCHAR2)
"
"   IS
"
"      CURSOR c_lc_ln
"
"      IS
"
"            SELECT suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plnt_loc_id,
"
"                  suphd_doc_date,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  suphd_doc_type,
"
"                  suphd_suplr_id,
"
"                  suplr_name1 suphd_suplr_name,
"
"                  suphd_suplr_doc_no suphd_suplr_bill_no,
"
"                  suphd_suplr_doc_date suphd_suplr_bill_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  (suphd_sc_tot_amt * suphd_exchange_rate) bill_amt_bc,
"
"                  suphd_sc_tot_amt bill_amt_tc,
"
"                 -- NVL (SUM (suplnh_inv_qty), 0)
"
"                  (SELECT SUM(suplnh_inv_qty) suplnh_inv_qty
"
"                      FROM(
"
"                    select NVL ( SUM(suplnh_inv_qty), 0) suplnh_inv_qty
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_CONTRA_FLAG='N'
"
"                            AND suplnh_type <> 'C'
"
"                      UNION ALL
"
"                     select  SUM(suplnh_inv_qty) suplnh_inv_qty
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_CONTRA_FLAG='N'
"
"                              AND suplnh_type = 'C'
"
"                              and rownum=1)) suplnh_inv_qty,
"
"                  suphd_mat_exp_amt,
"
"                 (select  SUM (
"
"                       (  suplnh_inv_qty
"
"                        * (  suplnh_unit_cost
"
"                           - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)   ))
"
"                     * suphd_exchange_rate)
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND SUPLNH_DR_CR = 'DR')
"
"                     mat_amt,
"
"                  suphd_grn_refer,
"
"                    (select ( SUM (( ( (  suplnh_unit_cost
"
"                             - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                        * (suplnh_inv_qty))) )
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND SUPLNH_DR_CR = 'DR')
"
"                  +  (SELECT NVL (SUM (SUPLNH_ASSBL_VAL), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            and suplnh_type='C'
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_DR_CR = 'DR')
"
"                     suphd_gross_sc_val,
"
"                   (select  (  SUM (
"
"                          (  ( (  suplnh_unit_cost
"
"                                - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                           * (suplnh_inv_qty)))
"
"                     * suphd_exchange_rate)
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND SUPLNH_DR_CR = 'DR')
"
"                  + (SELECT NVL (SUM (SUPLNH_UNIT_COST * suphd_exchange_rate), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                             and suplnh_type='C'
"
"                            AND SUPLNH_DR_CR = 'DR')
"
"                     suphd_gross_bc_val,
"
"                     (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphd_exchange_rate), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                     suphd_dom_val,
"
"                  SUM (
"
"                     DECODE (
"
"                        suphd_currency,
"
"                        func_find_base_currency (suphd_bu), 0,
"
"                        (  ( (  suplnh_unit_cost
"
"                              - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                         * (suplnh_inv_qty)
"
"                         * suphd_exchange_rate)))
"
"                     suphd_imp_val,
"
"                     (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphd_exchange_rate), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                  +  (SELECT NVL (SUM (SUPLNH_UNIT_COST * suphd_exchange_rate), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE    SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_DR_CR = 'CR')
"
"                     suphd_tax_val_bc,
"
"                            (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                          +   (SELECT NVL (SUM (SUPLNH_UNIT_COST), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     SUPLNH_BU = suphd_bu
"
"                            AND SUPLNH_DOC_NO = suphd_doc_no
"
"                            AND SUPLNH_DR_CR='CR')
"
"                     suphd_tax_val_tc,
"
"                     (SELECT NVL(SUM (CASE
"
"                               WHEN (suplnh_grn_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_igst_amt)
"
"                               WHEN (suplnh_grn_cgst_amt + suplnh_grn_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_cgst_amt + suplnh_grn_sgst_amt)
"
"                               WHEN (suplnh_grn_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_utgst_amt)
"
"                               WHEN (suplnh_grn_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphd_exchange_rate ),0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no )
"
"                     suphd_grn_tax_val,
"
"                          (SELECT NVL (SUM (SUPLNH_UNIT_COST), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     tds_value,
"
"                      (SELECT NVL (SUM (suplnh_appl_pct), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     tds_pct,
"
"                      (SELECT NVL (SUM (SUPLNH_ASSBL_VAL), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     tds_assbl_value,
"
"                         (SELECT NVL (SUM (SUPLNH_UNIT_COST), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'ESI'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     esi_value,
"
"                           (SELECT NVL (SUM (suplnh_appl_pct), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'ESI'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     esi_pct,
"
"                        (SELECT NVL (SUM (SUPLNH_ASSBL_VAL), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     SUPLNH_BU = suphd_bu
"
"                          AND SUPLNH_DOC_NO = suphd_doc_no
"
"                          AND SUPLNH_BU = glac_bu
"
"                          AND SUPLNH_AP_GL_ACCT = glac_acct
"
"                           AND glac_sub_grp_type = 'ESI'
"
"                          AND SUPLNH_DR_CR = 'CR'
"
"                          AND SUPLNH_BFCRY_ID IS NOT NULL
"
"                          AND SUPLNH_ASSBL_VAL <> 0)
"
"                     esi_assbl_value,
"
"                  suphd_suplr_reference,
"
"                  NULL recover_flag,
"
"                  suphd_gstin_no,
"
"                  suphd_bill_loc_name suphd_bill_loc_id,
"
"                  suphd_suplr_type,
"
"                  suphd_gst_class,
"
"                  suphd_gst_supply,
"
"                  suphd_gst_type,
"
"                  suphd_vou_type,
"
"                  suphd_state_code state_code,
"
"                  (SELECT ssl_addr1
"
"                     FROM suplr_ship_loc
"
"                    WHERE     ssl_bu = suphd_bu
"
"                          AND ssl_suplr_id = suphd_suplr_id
"
"                          AND ssl_loc_name1 = suphd_bill_loc_name
"
"                          )
"
"                     suplr_addr,
"
"                  (SELECT ssl_zip
"
"                     FROM suplr_ship_loc
"
"                    WHERE     ssl_bu = suphd_bu
"
"                          AND ssl_suplr_id = suphd_suplr_id
"
"                          AND ssl_loc_name1 = suphd_bill_loc_name
"
"                          )
"
"                     suplr_zip,
"
"                  (SELECT (SELECT NVL (state_name1, state_name2)
"
"                             FROM states
"
"                            WHERE state_id = ssl_state
"
"                              AND STATE_BU=ssl_bu)
"
"                     FROM suplr_ship_loc
"
"                    WHERE     ssl_bu = suphd_bu
"
"                          AND ssl_suplr_id = suphd_suplr_id
"
"                          AND ssl_loc_name1 = suphd_bill_loc_name
"
"                          )
"
"                     suplr_state,
"
"                     suphd_grn_pfx,
"
"                     suphd_grn_no,
"
"                     suphd_grn_date,
"
"                     suphd_blto_state_code,
"
"                     Suphd_tds_exmp_flag
"
"             FROM suplr_doc_hd_hist_vw1,
"
"                  suplr_doc_ln_hist,
"
"                  suppliers,
"
"                  profit_cost_centers
"
"            WHERE     suphd_bu = suplnh_bu(+)
"
"                  AND suphd_doc_no = suplnh_doc_no(+)
"
"                  AND (   (    suphd_src_doc_pfx IS NULL
"
"                           AND suphd_src_doc_no IS NULL)
"
"                           OR suphd_doc_type IN ('SB'))
"
"                  AND suplr_bu = suphd_bu
"
"                  AND suplr_suplr_id = suphd_suplr_id
"
"                  AND  suphd_vou_type in ('SB')
"
"                  AND Suphd_Doc_Type='SB'
"
"                  AND suphd_grn_refer ='LC'
"
"                  AND suphd_status NOT IN 'D'
"
"                  AND (   (suphd_status IN ('O', 'N') AND p_status = 'N')
"
"                       OR (suphd_status IN ('P') AND p_status = 'P')
"
"                       OR p_status IS NULL)
"
"                  AND suphd_bu = p_bu
"
"                  AND (suphd_doc_date >= p_from_date OR p_from_date IS NULL)
"
"                  AND (suphd_doc_date <= p_to_date OR p_to_date IS NULL)
"
"                  AND func_find_glm_pur_jrnl_type (p_bu) IN ('I', 'G')
"
"                  AND suplnh_bu = pcc_bu
"
"                  AND SUPLNH_AP_CC_CODE = PCC_CC_CODE
"
"                AND (    PCC_AC_LVL1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL2 IN (SELECT brl2_lvl_id
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL3 IN (SELECT brl3_lvl_id
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL4 IN (SELECT brl4_lvl_id
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL5 IN (SELECT brl5_lvl_id
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL6 IN (SELECT brl6_lvl_id
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL_PRJ IN (SELECT brlp_lvl_id
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'))
"
"         GROUP BY suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plnt_loc_id,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  suphd_doc_date,
"
"                  suphd_doc_type,
"
"                  --suphd_doc_mode,
"
"                  suphd_suplr_id,
"
"                  suplr_name1,
"
"                  suphd_suplr_doc_no,
"
"                  suphd_suplr_doc_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  suphd_sc_tot_amt,
"
"                  suphd_grn_refer,
"
"                  suphd_suplr_reference,
"
"                  --suphd_bill_loc_id,
"
"                  suphd_gstin_no,
"
"                  suphd_suplr_type,
"
"                  suphd_gst_class,
"
"                  --suplnh_gst_rev_tax_flag,
"
"                  suphd_gst_supply,
"
"                  suphd_gst_type,
"
"                  suphd_vou_type,
"
"                  suphd_state_code,
"
"                  suphd_mat_exp_amt,
"
"                  suplr_addr1,
"
"                  suplr_addr2,
"
"                  suplr_addr3,
"
"                  suplr_zip,
"
"                  --suphd_loc_id,
"
"                   suphd_grn_pfx,
"
"                     suphd_grn_no,
"
"                     suphd_grn_date,
"
"                     suphd_blto_state_code,
"
"                     suphd_bill_loc_name,
"
"                     Suphd_tds_exmp_flag;
"
"
"
"      CURSOR c2 (
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"           SELECT suplnh_prod_sub_cls
"
"             FROM suplr_doc_ln_hist
"
"            WHERE     suplnh_bu = p_bu
"
"                  AND suplnh_doc_no = c_doc_no
"
"         GROUP BY suplnh_prod_sub_cls;
"
"
"
" CURSOR c3 (
"
"         c_bu        VARCHAR2,
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"         SELECT suphd_bu,
"
"                suphd_plant,
"
"                suphd_plnt_loc_id,
"
"                suphd_pfx,
"
"                suphd_doc_no,
"
"                suplnh_prod_id,
"
"                suplnh_prod_rev,
"
"                ( case when SUPLNH_TYPE='C' then
"
"               (SELECT  glac_acct_desc1
"
"                    FROM gl_accts
"
"                   WHERE glac_bu = suplnh_bu
"
"                     AND glac_acct = suplnh_ap_gl_acct)
"
"                else
"
"                suplnh_prod_desc1
"
"                end ) suplnh_prod_desc1,
"
"                NULL pur_cls,
"
"                suplnh_receipt_qty,
"
"                suplnh_invoiced_qty,
"
"                suplnh_inv_qty,
"
"                suplnh_unit_cost,
"
"                (CASE
"
"                    WHEN suphd_currency IS NOT NULL
"
"                    THEN
"
"                       ROUND (
"
"                          (  (suplnh_unit_cost * suplnh_inv_qty)
"
"                           - suplnh_inv_disc_amt
"
"                           - suplnh_lm_disc_amt),
"
"                          5)
"
"                    ELSE
"
"                       0
"
"                 END)
"
"                   line_amt,
"
"                NVL (  (SELECT NVL (SUM (SUPLNH_TAX_AMT),0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL) ,
"
"                   0)
"
"                   navl_tax_amt,
"
"                suplnh_ap_gl_acct ajhv_gl_acct,                 --ajhv_gl_acct,
"
"                DECODE (suplnh_ap_gl_acct,
"
"                        NULL, NULL,
"
"                        func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct))
"
"                   gl_class,
"
"                DECODE (
"
"                   suplnh_ap_gl_acct,
"
"                   NULL, NULL,
"
"                   DECODE (
"
"                      func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct),
"
"                      NULL, NULL,
"
"                      func_find_gl_par_class_id (
"
"                         suphd_bu,
"
"                         func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct))))
"
"                   par_gl_class,
"
"                   SUPLNH_TAX_PCT  gst_rate,
"
"                NVL (suplnh_cgst_amt , 0) cgst_amt,
"
"              (CASE WHEN suplnh_cgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                       0
"
"                   END)cgst_rate,
"
"                NVL (suplnh_sgst_amt, 0) sgst_amt,
"
"                   (CASE WHEN suplnh_sgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) sgst_rate,
"
"                NVL (suplnh_igst_amt,
"
"                   0)
"
"                   igst_amt,
"
"                 (CASE WHEN SUPLNH_IGST_AMT > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) igst_rate,
"
"                NVL (suplnh_utgst_amt,  0) utgst_amt,
"
"                 (CASE WHEN suplnh_utgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) utgst_rate,
"
"                suplnh_hsn_code,
"
"                suplnh_inv_uom,
"
"                suphd_gstin_no,
"
"                suplnh_input_type,
"
"                suplnh_tax_exmpt_flag,
"
"                suplnh_inelgbl_type,
"
"                suplnh_inelgbl_sub_type,
"
"                suplnh_Seq_no,
"
"                suphd_suplr_type,
"
"                suphd_gst_class,
"
"                suphd_gst_type,
"
"                suphd_state_code,
"
"                suplnh_gst_rev_tax_flag,
"
"                (SELECT DISTINCT state_name1
"
"                   FROM states
"
"                  WHERE state_code = suphd_state_code AND ROWNUM = 1)
"
"                   state_code_name,
"
"                suphd_exchange_rate,
"
"                suplnh_ap_cc_code,
"
"                suplnh_gst_rev_tax_cat,
"
"                Suphd_tds_exmp_flag
"
"           FROM suplr_doc_hd_hist_vw1,
"
"                suplr_doc_ln_hist,
"
"                profit_cost_centers
"
"          WHERE     suphd_bu = p_bu
"
"                AND suphd_bu = suplnh_bu
"
"                AND suphd_doc_no = suplnh_doc_no
"
"               -- AND suphd_bu = c_bu
"
"                AND suphd_pfx = c_pfx
"
"                AND suphd_doc_no = c_doc_no
"
"                AND suplnh_bu = pcc_bu
"
"                AND SUPLNH_AP_CC_CODE = PCC_CC_CODE
"
"                AND (    PCC_AC_LVL1 IN (SELECT brl1_lvl_id   --ajhv_gl_lvl1
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL2 IN (SELECT brl2_lvl_id   --ajhv_gl_lvl2
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL3 IN (SELECT brl3_lvl_id   --ajhv_gl_lvl3
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL4 IN (SELECT brl4_lvl_id  --ajhv_gl_lvl4
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL5 IN (SELECT brl5_lvl_id  --ajhv_gl_lvl5
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL6 IN (SELECT brl6_lvl_id  --ajhv_gl_lvl6
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL_PRJ IN (SELECT brlp_lvl_id   --ajhv_gl_lvl_prj
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'));
"
"
"
"      v_type       VARCHAR2 (5);
"
"      v_sub_cls    VARCHAR2 (500);
"
"      v_sub_cls1   VARCHAR2 (500);
"
"      v_rnd        NUMBER (5);
"
"   BEGIN
"
"      v_rnd := func_find_appl_rnddigit (p_bu);
"
"
"
"      DELETE bill_reg_lc_ln_temp
"
"       WHERE brllt_bu = p_bu AND brllt_doc_no = p_doc_no;
"
"
"
"      FOR r_lc_ln IN c_lc_ln
"
"      LOOP
"
"
"
"         IF r_lc_ln.suphd_tax_val_bc > 0
"
"         THEN
"
"            v_type := 'N';
"
"         END IF;
"
"
"
"         IF r_lc_ln.suphd_grn_refer IN ('Y',
"
"                                        'S',
"
"                                        'Z',
"
"                                        'T',
"
"                                        'PR',
"
"                                        'PO',
"
"                                        'STG',
"
"                                        'STD',
"
"                                        'POQ',
"
"                                        'ISD')
"
"         THEN
"
"            v_sub_cls := NULL;
"
"
"
"            FOR cr2 IN c2 (r_lc_ln.suphd_pfx, r_lc_ln.suphd_doc_no)
"
"            LOOP
"
"               IF cr2.suplnh_prod_sub_cls IS NOT NULL
"
"               THEN
"
"                  v_sub_cls1 :=
"
"                     func_find_subclass_desc (p_bu,
"
"                                              cr2.suplnh_prod_sub_cls,
"
"                                              1);
"
"                  v_sub_cls := v_sub_cls || v_sub_cls1 || ',';
"
"               END IF;
"
"            END LOOP;
"
"
"
"            v_sub_cls := RTRIM (v_sub_cls, ',');
"
"         ELSE
"
"            v_sub_cls := NULL;
"
"         END IF;
"
"
"
"         INSERT -- + append
"
"               INTO  bill_reg_lc_ln_temp (brllt_bu,
"
"                                          brllt_doc_no,
"
"                                          brllt_plnt,
"
"                                          brllt_plnt_loc,
"
"                                          brllt_vou_type,
"
"                                          brllt_inv_pfx,
"
"                                          brllt_inv_no,
"
"                                          brllt_inv_date,
"
"                                          brllt_inv_type,
"
"                                          --brllt_inv_mode,
"
"                                          brllt_suplr_id,
"
"                                          brllt_suplr_name,
"
"                                          brllt_suplr_bill_no,
"
"                                          brllt_suplr_bill_date,
"
"                                          brllt_curry,
"
"                                          brllt_exchange_rate,
"
"                                          brllt_gross_sc_val,
"
"                                          brllt_gross_bc_val,
"
"                                          brllt_net_sc_val,
"
"                                          brllt_net_bc_val,
"
"                                          brllt_dom_val,
"
"                                          brllt_imp_val,
"
"                                          brllt_tax_val,
"
"                                          brllt_grn_tax_val,
"
"                                          brllt_cre_by,
"
"                                          brllt_cre_date,
"
"                                          brllt_bill_amt_bc,
"
"                                          brllt_bill_amt_tc,
"
"                                          brllt_type,
"
"                                          brllt_grn_refer,
"
"                                          brllt_sub_cls,
"
"                                          brllt_mat_amt,
"
"                                          brllt_status,
"
"                                          brllt_reference,
"
"                                          brllt_recover,
"
"                                          brllt_tds_val,
"
"                                          brllt_tds_pct,
"
"                                          brllt_tds_assbl_val,
"
"                                          brllt_esi_val,
"
"                                          brllt_esi_pct,
"
"                                          brllt_esi_assbl_val,
"
"                                          brllt_state_code,
"
"                                          brllt_suplr_gstin,
"
"                                        brllt_suplr_reg_type,
"
"                                        brllt_suplr_type,
"
"                                        brllt_bill_loc_id,
"
"                                        brllt_grn_pfx,
"
"                                        brllt_grn_no,
"
"                                        brllt_grn_date,
"
"                                        brllt_bill_to_code,
"
"                                        brllt_tds_appl_flag)
"
"                 VALUES (
"
"                           p_bu,
"
"                           p_doc_no,
"
"                           r_lc_ln.suphd_plant,
"
"                           r_lc_ln.suphd_plnt_loc_id,
"
"                           r_lc_ln.suphd_vou_type,
"
"                           r_lc_ln.suphd_pfx,
"
"                           r_lc_ln.suphd_doc_no,
"
"                           r_lc_ln.suphd_doc_date,
"
"                           r_lc_ln.suphd_doc_type,
"
"                           --r_lc_ln.suphd_doc_mode,
"
"                           r_lc_ln.suphd_suplr_id,
"
"                           r_lc_ln.suphd_suplr_name,
"
"                           r_lc_ln.suphd_suplr_bill_no,
"
"                           r_lc_ln.suphd_suplr_bill_date,
"
"                           r_lc_ln.suphd_currency,
"
"                           r_lc_ln.suphd_exchange_rate,
"
"                           ROUND (
"
"                              (  r_lc_ln.suphd_gross_sc_val
"
"                               - r_lc_ln.suphd_tax_val_tc),
"
"                              v_rnd),
"
"                           ROUND (
"
"                              (  r_lc_ln.suphd_gross_bc_val
"
"                               - r_lc_ln.suphd_tax_val_bc),
"
"                              v_rnd),
"
"                           ROUND (r_lc_ln.suphd_gross_sc_val, -- + r_lc_ln.suphd_tax_val_tc,
"
"                                                             v_rnd),
"
"                           ROUND (r_lc_ln.suphd_gross_bc_val, -- + r_lc_ln.suphd_tax_val_bc,
"
"                                                             v_rnd),
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) =
"
"                                      r_lc_ln.suphd_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_lc_ln.bill_amt_bc
"
"                                     - r_lc_ln.suphd_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) <>
"
"                                      r_lc_ln.suphd_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_lc_ln.bill_amt_bc
"
"                                     - r_lc_ln.suphd_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           ROUND (r_lc_ln.suphd_tax_val_tc, v_rnd),
"
"                           ROUND (r_lc_ln.suphd_grn_tax_val, v_rnd),
"
"                           p_user,
"
"                           SYSDATE,
"
"                           ROUND (r_lc_ln.bill_amt_bc, v_rnd),
"
"                           ROUND (r_lc_ln.bill_amt_tc, v_rnd),
"
"                           v_type,
"
"                           r_lc_ln.suphd_grn_refer,
"
"                           v_sub_cls,
"
"                           ROUND (
"
"                              (r_lc_ln.bill_amt_bc - r_lc_ln.suphd_tax_val_bc),
"
"                              v_rnd),
"
"                           r_lc_ln.suphd_status,
"
"                           r_lc_ln.suphd_suplr_reference,
"
"                           r_lc_ln.recover_flag,
"
"                           ROUND (r_lc_ln.tds_value, v_rnd),
"
"                           r_lc_ln.tds_pct,
"
"                           ROUND (r_lc_ln.tds_assbl_value, v_rnd),
"
"                           ROUND (r_lc_ln.esi_value, v_rnd),
"
"                           r_lc_ln.esi_pct,
"
"                           ROUND (r_lc_ln.esi_assbl_value, v_rnd),
"
"                           r_lc_ln.state_code,
"
"                           r_lc_ln.suphd_gstin_no,
"
"                            r_lc_ln.suphd_suplr_type,
"
"                            r_lc_ln.suphd_gst_class,
"
"                            r_lc_ln.suphd_bill_loc_id,
"
"                             r_lc_ln.suphd_grn_pfx,
"
"                             r_lc_ln.suphd_grn_no,
"
"                            r_lc_ln.suphd_grn_date,
"
"                            r_lc_ln.suphd_blto_state_code,
"
"                            r_lc_ln.Suphd_tds_exmp_flag);
"
"
"
"     FOR cr3 IN c3 (p_bu, r_lc_ln.suphd_pfx, r_lc_ln.suphd_doc_no)
"
"         LOOP
"
"            INSERT INTO bill_item_line_temp (bilt_bu,
"
"                                             bilt_doc_no,
"
"                                             bilt_plnt,
"
"                                             bilt_plnt_loc,
"
"                                             bilt_inv_pfx,
"
"                                             bilt_inv_no,
"
"                                             bilt_prod_id,
"
"                                             bilt_prod_rev,
"
"                                             bilt_prod_desc1,
"
"                                             bilt_pur_cls,
"
"                                             bilt_receipt_qty,
"
"                                             bilt_invoiced_qty,
"
"                                             bilt_inv_qty,
"
"                                             bilt_unit_cost,
"
"                                             bilt_ln_amt,
"
"                                             bilt_acct,
"
"                                             bilt_cl_id,
"
"                                             bilt_par_cl_id,
"
"                                             bilt_cre_by,
"
"                                             bilt_cre_date,
"
"                                             bilt_vou_type,
"
"                                             bilt_input_type,
"
"                                             bilt_tax_exmpt_flag,
"
"                                             bilt_inelgbl_type,
"
"                                             bilt_inelgbl_sub_type,
"
"                                             bilt_seq_no,
"
"                                             bilt_rcm_flag,
"
"                                             bilt_gst_rate,
"
"                                             bilt_cgst_amt,
"
"                                             bilt_sgst_amt,
"
"                                             bilt_igst_amt,
"
"                                             bilt_utgst_amt,
"
"                                             bilt_hsn_code,
"
"                                             bilt_uom,
"
"                                             bilt_gstin_no,
"
"                                             bilt_suplr_type,
"
"                                             bilt_gst_class,
"
"                                             bilt_gst_rev_tax_flag,
"
"                                             bilt_gst_type,
"
"                                             bilt_state_code,
"
"                                             bilt_state_code_desc,
"
"                                             bilt_cc_code,
"
"                                             bilt_rcm_cat,
"
"                                             bilt_cgst_rate,
"
"                                            bilt_sgst_rate,
"
"                                            bilt_igst_rate,
"
"                                            bilt_utgst_rate)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         cr3.suphd_plant,
"
"                         cr3.suphd_plnt_loc_id,
"
"                         cr3.suphd_pfx,
"
"                         cr3.suphd_doc_no,
"
"                         cr3.suplnh_prod_id,
"
"                         cr3.suplnh_prod_rev,
"
"                         cr3.suplnh_prod_desc1,
"
"                         cr3.pur_cls,
"
"                         cr3.suplnh_receipt_qty,
"
"                         cr3.suplnh_invoiced_qty,
"
"                         cr3.suplnh_inv_qty,
"
"                         cr3.suplnh_unit_cost,
"
"                         cr3.line_amt + cr3.navl_tax_amt,
"
"                         cr3.ajhv_gl_acct,
"
"                         cr3.gl_class,
"
"                         cr3.par_gl_class,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'SB',
"
"                         cr3.suplnh_input_type,
"
"                         cr3.suplnh_tax_exmpt_flag,
"
"                         cr3.suplnh_inelgbl_type,
"
"                         cr3.suplnh_inelgbl_sub_type,
"
"                         cr3.suplnh_seq_no,
"
"                         cr3.suplnh_gst_rev_tax_flag,
"
"                         cr3.gst_rate,
"
"                         cr3.cgst_amt,
"
"                         cr3.sgst_amt,
"
"                         cr3.igst_amt,
"
"                         cr3.utgst_amt,
"
"                         cr3.suplnh_hsn_code,
"
"                         cr3.suplnh_inv_uom,
"
"                         cr3.suphd_gstin_no,
"
"                         cr3.suphd_suplr_type,
"
"                         cr3.suphd_gst_class,
"
"                         cr3.suplnh_gst_rev_tax_flag,
"
"                         cr3.suphd_gst_type,
"
"                         cr3.suphd_state_code,
"
"                         cr3.state_code_name,
"
"                         cr3.suplnh_ap_cc_code,
"
"                         cr3.suplnh_gst_rev_tax_cat,
"
"                         cr3.cgst_rate,
"
"                         cr3.sgst_rate,
"
"                         cr3.igst_rate,
"
"                         cr3.utgst_rate);
"
"         END LOOP;
"
"
"
"      END LOOP c_lc_ln;
"
"   END proc_ins_landcost_lines;
"
"
"
"   PROCEDURE proc_ins_pur_ret_lines (p_bu           VARCHAR2,
"
"                                     p_doc_no       VARCHAR2,
"
"                                     p_from_date    DATE DEFAULT NULL,
"
"                                     p_to_date      DATE DEFAULT NULL,
"
"                                     p_status       VARCHAR2,
"
"                                     p_user         VARCHAR2)
"
"   IS
"
"      CURSOR c_pr_ln
"
"      IS
"
"           SELECT suphdh_bu,
"
"                  suphdh_plant,
"
"                  suphdh_plnt_loc_id,
"
"                  suphdh_doc_date,
"
"                  suphdh_pfx,
"
"                  suphdh_doc_no,
"
"                  suphdh_doc_type,
"
"                  suphdh_suplr_id,
"
"                  suplr_name1 suphdh_suplr_name,
"
"                  suphdh_suplr_doc_no suphdh_suplr_bill_no,
"
"                  suphdh_suplr_doc_date suphdh_suplr_bill_date,
"
"                  suphdh_currency,
"
"                  suphdh_exchange_rate,
"
"                  suphdh_status,
"
"                  (suphdh_sc_tot_amt * suphdh_exchange_rate) bill_amt_bc,
"
"                  suphdh_sc_tot_amt bill_amt_tc,
"
"                    (select  SUM (
"
"                       (  suplnh_inv_qty
"
"                        * (  suplnh_unit_cost
"
"                           - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)   ))
"
"                     * suphdh_exchange_rate)
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     suplnh_BU = suphdh_bu
"
"                            AND suplnh_DOC_NO = suphdh_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND suplnh_DR_CR = 'DR')
"
"                     mat_amt,
"
"                  suphdh_grn_refer,
"
"                   (select ( SUM (( ( (  suplnh_unit_cost
"
"                             - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                        * (suplnh_inv_qty))) )
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     suplnh_BU = suphdh_bu
"
"                            AND suplnh_DOC_NO = suphdh_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND suplnh_DR_CR = 'DR')
"
"                  + (SELECT NVL (SUM (suplnh_ASSBL_VAL), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     suplnh_BU = suphdh_bu
"
"                            AND suplnh_DOC_NO = suphdh_doc_no
"
"                             and suplnh_type='C'
"
"                            AND suplnh_DR_CR = 'DR')
"
"                     suphdh_gross_sc_val,
"
"                   (select  (  SUM (
"
"                          (  ( (  suplnh_unit_cost
"
"                                - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                           * (suplnh_inv_qty)))
"
"                     * suphdh_exchange_rate)
"
"                      FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     suplnh_BU = suphdh_bu
"
"                            AND suplnh_DOC_NO = suphdh_doc_no
"
"                             and suplnh_type<>'C'
"
"                             AND suplnh_DR_CR = 'DR')
"
"                  + (SELECT NVL (SUM (suplnh_UNIT_COST * suphdh_exchange_rate), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     suplnh_BU = suphdh_bu
"
"                            AND suplnh_DOC_NO = suphdh_doc_no
"
"                            and suplnh_type='C'
"
"                            AND suplnh_DR_CR = 'DR')
"
"                     suphdh_gross_bc_val,
"
"                  (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphdh_exchange_rate), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphdh_bu
"
"                          AND suplnh_doc_no = suphdh_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                     suphdh_dom_val,
"
"                  SUM (
"
"                     DECODE (
"
"                        suphdh_currency,
"
"                        func_find_base_currency (suphdh_bu), 0,
"
"                        (  ( (  suplnh_unit_cost
"
"                              - (suplnh_unit_cost * suplnh_inv_disc_pct / 100)))
"
"                         * (suplnh_inv_qty)
"
"                         * suphdh_exchange_rate)))
"
"                     suphdh_imp_val,
"
"                   (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphdh_exchange_rate), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphdh_bu
"
"                          AND suplnh_doc_no = suphdh_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                  +  (SELECT NVL (SUM (suplnh_UNIT_COST * suphdh_exchange_rate), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE    suplnh_BU = suphdh_bu
"
"                            AND suplnh_DOC_NO = suphdh_doc_no
"
"                            AND suplnh_DR_CR = 'CR')
"
"                     suphdh_tax_val_bc,
"
"                    (SELECT NVL (SUM (
"
"                            CASE
"
"                               WHEN (suplnh_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_igst_amt)
"
"                               WHEN (suplnh_cgst_amt + suplnh_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cgst_amt + suplnh_sgst_amt)
"
"                               WHEN (suplnh_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_utgst_amt)
"
"                               WHEN (suplnh_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END), 0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphdh_bu
"
"                          AND suplnh_doc_no = suphdh_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL)
"
"                          +   (SELECT NVL (SUM (suplnh_UNIT_COST), 0)
"
"                       FROM SUPLR_DOC_LN_HIST
"
"                      WHERE     suplnh_BU = suphdh_bu
"
"                            AND suplnh_DOC_NO = suphdh_doc_no
"
"                            AND suplnh_DR_CR='CR')
"
"                     suphdh_tax_val_tc,
"
"                   (SELECT NVL(SUM (CASE
"
"                               WHEN (suplnh_grn_igst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_igst_amt)
"
"                               WHEN (suplnh_grn_cgst_amt + suplnh_grn_sgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_cgst_amt + suplnh_grn_sgst_amt)
"
"                               WHEN (suplnh_grn_utgst_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_utgst_amt)
"
"                               WHEN (suplnh_grn_cess_amt) > 0
"
"                               THEN
"
"                                  (suplnh_grn_cess_amt)
"
"                               ELSE
"
"                                  0
"
"                            END * suphdh_exchange_rate ),0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphdh_bu
"
"                          AND suplnh_doc_no = suphdh_doc_no )
"
"                     suphdh_grn_tax_val,
"
"                   (SELECT NVL (SUM (suplnh_UNIT_COST), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     suplnh_BU = suphdh_bu
"
"                          AND suplnh_DOC_NO = suphdh_doc_no
"
"                          AND suplnh_BU = glac_bu
"
"                          AND suplnh_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND suplnh_DR_CR = 'CR'
"
"                          AND suplnh_BFCRY_ID IS NOT NULL
"
"                          AND suplnh_TDS_ASSBL_VAL <> 0)
"
"                     tds_value,
"
"                  (SELECT NVL (SUM (suplnh_appl_pct), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     suplnh_BU = suphdh_bu
"
"                          AND suplnh_DOC_NO = suphdh_doc_no
"
"                          AND suplnh_BU = glac_bu
"
"                          AND suplnh_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND suplnh_DR_CR = 'CR'
"
"                          AND suplnh_BFCRY_ID IS NOT NULL
"
"                          AND suplnh_TDS_ASSBL_VAL <> 0)
"
"                     tds_pct,
"
"                 (SELECT NVL (SUM (suplnh_ASSBL_VAL), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     suplnh_BU = suphdh_bu
"
"                          AND suplnh_DOC_NO = suphdh_doc_no
"
"                          AND suplnh_BU = glac_bu
"
"                          AND suplnh_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'TDS'
"
"                          AND suplnh_DR_CR = 'CR'
"
"                          AND suplnh_BFCRY_ID IS NOT NULL
"
"                          AND suplnh_TDS_ASSBL_VAL <> 0)
"
"                     tds_assbl_val,
"
"                 (SELECT NVL (SUM (suplnh_UNIT_COST), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     suplnh_BU = suphdh_bu
"
"                          AND suplnh_DOC_NO = suphdh_doc_no
"
"                          AND suplnh_BU = glac_bu
"
"                          AND suplnh_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'ESI'
"
"                          AND suplnh_DR_CR = 'CR'
"
"                          AND suplnh_BFCRY_ID IS NOT NULL
"
"                          AND suplnh_ASSBL_VAL <> 0)
"
"                     esi_value,
"
"                  (SELECT NVL (SUM (suplnh_appl_pct), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     suplnh_BU = suphdh_bu
"
"                          AND suplnh_DOC_NO = suphdh_doc_no
"
"                          AND suplnh_BU = glac_bu
"
"                          AND suplnh_AP_GL_ACCT = glac_acct
"
"                          AND glac_sub_grp_type = 'ESI'
"
"                          AND suplnh_DR_CR = 'CR'
"
"                          AND suplnh_BFCRY_ID IS NOT NULL
"
"                          AND suplnh_ASSBL_VAL <> 0)
"
"                     esi_pct,
"
"                  (SELECT NVL (SUM (suplnh_ASSBL_VAL), 0)
"
"                     FROM SUPLR_DOC_LN_HIST, gl_accts
"
"                    WHERE     suplnh_BU = suphdh_bu
"
"                          AND suplnh_DOC_NO = suphdh_doc_no
"
"                          AND suplnh_BU = glac_bu
"
"                          AND suplnh_AP_GL_ACCT = glac_acct
"
"                           AND glac_sub_grp_type = 'ESI'
"
"                          AND suplnh_DR_CR = 'CR'
"
"                          AND suplnh_BFCRY_ID IS NOT NULL
"
"                          AND suplnh_ASSBL_VAL <> 0)
"
"                     esi_assbl_val,
"
"                  suphdh_suplr_reference,
"
"                  --func_find_recover_flag (suphdh_bu, suphdh_pfx, suphdh_doc_no)
"
"                  NULL recover_flag,
"
"                  suphdh_gstin_no,
"
"                  suphdh_bill_loc_name suphdh_bill_loc_id,
"
"                  suphdh_suplr_type,
"
"                  suphdh_gst_class,
"
"                  suplnh_gst_rev_tax_flag,
"
"                  suphdh_gst_supply,
"
"                  suphdh_gst_type,
"
"                  suphdh_vou_type,
"
"                  suphdh_state_code state_code,
"
"                  NVL (SUM (suplnh_inv_qty), 0) bill_qty,
"
"                   suphdh_grn_pfx,
"
"                     suphdh_grn_no,
"
"                     suphdh_grn_date,
"
"                     suphdh_blto_state_code,
"
"                     suphdh_tds_exmp_flag
"
"             FROM suplr_doc_hd_hist,
"
"                  SUPLR_DOC_LN_HIST,
"
"                  suppliers,
"
"                profit_cost_centers
"
"                --  appl_journals_hist_vw
"
"            WHERE     suphdh_bu = suplnh_bu(+)
"
"                  AND suphdh_doc_no = suplnh_doc_no(+)
"
"                  --AND suphdh_doc_type || suphdh_doc_mode IN ('IR')
"
"                  --AND suphdh_src_doc_pfx IS NULL
"
"                  --AND suphdh_src_doc_no IS NULL
"
"                  AND suplr_bu = suphdh_bu
"
"                  AND suplr_suplr_id = suphdh_suplr_id
"
"                  --AND suphdh_grn_refer ='EXP'
"
"                 -- AND  suphdh_vou_type in ('DN')
"
"                  AND suphdh_grn_refer ='DNPR'
"
"                  AND  suphdh_vou_type in ('SI')
"
"                  AND suphdh_Doc_Type='DN'
"
"                  AND suphdh_status NOT IN 'D'
"
"                  AND (   (suphdh_status IN ('O', 'N') AND p_status = 'N')
"
"                       OR (suphdh_status IN ('P') AND p_status = 'P')
"
"                       OR p_status IS NULL)
"
"                  AND suphdh_bu = p_bu
"
"                  AND (suphdh_doc_date >= p_from_date OR p_from_date IS NULL)
"
"                  AND (suphdh_doc_date <= p_to_date OR p_to_date IS NULL)
"
"                   AND suplnh_bu = pcc_bu
"
"                  AND suplnh_AP_CC_CODE = PCC_CC_CODE
"
"                    AND (    PCC_AC_LVL1 IN (SELECT brl1_lvl_id     --ajhv_gl_lvl1
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL2 IN (SELECT brl2_lvl_id    --ajhv_gl_lvl2
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL3 IN (SELECT brl3_lvl_id    --ajhv_gl_lvl3
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL4 IN (SELECT brl4_lvl_id    --ajhv_gl_lvl4
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL5 IN (SELECT brl5_lvl_id   --ajhv_gl_lvl5
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL6 IN (SELECT brl6_lvl_id    --ajhv_gl_lvl6
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND PCC_AC_LVL_PRJ IN (SELECT brlp_lvl_id   --ajhv_gl_lvl_prj
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'))
"
"                 /* AND ajhv_bu(+) = suphdh_bu
"
"                AND ajhv_vou_type = suphdh_vou_type
"
"                AND ajhv_vou_pfx(+) = suphdh_pfx
"
"                AND ajhv_vou_no(+) = suphdh_doc_no
"
"                AND ajhv_vou_line_no(+) = suplnh_seq_no
"
"                AND (    ajhv_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'))*/
"
"         GROUP BY suphdh_bu,
"
"                  suphdh_plant,
"
"                  suphdh_plnt_loc_id,
"
"                  suphdh_pfx,
"
"                  suphdh_doc_no,
"
"                  suphdh_doc_date,
"
"                  suphdh_doc_type,
"
"                  suphdh_suplr_id,
"
"                  suplr_name1,
"
"                  suphdh_suplr_doc_no,
"
"                  suphdh_suplr_doc_date,
"
"                  suphdh_currency,
"
"                  suphdh_exchange_rate,
"
"                  suphdh_status,
"
"                  suphdh_sc_tot_amt,
"
"                  suphdh_grn_refer,
"
"                  suphdh_suplr_reference,
"
"                  suphdh_bill_loc_name,
"
"                --  suphdh_bill_loc_id,
"
"                  suphdh_gstin_no,
"
"                  suphdh_suplr_type,
"
"                  suphdh_gst_class,
"
"                  suplnh_gst_rev_tax_flag,
"
"                  suphdh_gst_supply,
"
"                  suphdh_gst_type,
"
"                  suphdh_vou_type,
"
"                  suphdh_state_code,
"
"                   suphdh_grn_pfx,
"
"                     suphdh_grn_no,
"
"                     suphdh_grn_date,
"
"                     suphdh_blto_state_code,
"
"                     suphdh_tds_exmp_flag;
"
"
"
"      CURSOR c2 (
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"           SELECT suplnh_prod_sub_cls
"
"             FROM suplr_doc_ln_hist
"
"            WHERE     suplnh_bu = p_bu
"
"                  AND suplnh_doc_no = c_doc_no
"
"         GROUP BY suplnh_prod_sub_cls;
"
"
"
"
"
"      CURSOR c3 (
"
"         c_bu        VARCHAR2,
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"          SELECT suphd_bu,
"
"                suphd_plant,
"
"                suphd_plnt_loc_id,
"
"                suphd_pfx,
"
"                suphd_doc_no,
"
"                suplnh_prod_id,
"
"                suplnh_prod_rev,
"
"                  ( case when SUPLNH_TYPE='C' then
"
"               (SELECT  glac_acct_desc1
"
"                    FROM gl_accts
"
"                   WHERE glac_bu = suplnh_bu
"
"                     AND glac_acct = suplnh_ap_gl_acct)
"
"                else
"
"                suplnh_prod_desc1
"
"                end ) suplnh_prod_desc1,
"
"                NULL pur_cls,
"
"                suplnh_receipt_qty,
"
"                suplnh_invoiced_qty,
"
"                suplnh_inv_qty,
"
"                suplnh_unit_cost,
"
"                (CASE
"
"                    WHEN suphd_currency IS NOT NULL
"
"                    THEN
"
"                       ROUND (
"
"                          (  (suplnh_unit_cost * suplnh_inv_qty)
"
"                           - suplnh_inv_disc_amt
"
"                           - suplnh_lm_disc_amt),
"
"                          5)
"
"                    ELSE
"
"                       0
"
"                 END)
"
"                   line_amt,
"
"                NVL ((SELECT NVL (SUM (SUPLNH_TAX_AMT),0)
"
"                     FROM SUPLR_DOC_LN_HIST
"
"                    WHERE     suplnh_bu = suphd_bu
"
"                          AND suplnh_doc_no = suphd_doc_no
"
"                          AND suplnh_hsn_code IS NOT NULL) ,
"
"                   0)
"
"                   navl_tax_amt,
"
"                suplnh_ap_gl_acct ajhv_gl_acct,                 --ajhv_gl_acct,
"
"                DECODE (suplnh_ap_gl_acct,
"
"                        NULL, NULL,
"
"                        func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct))
"
"                   gl_class,
"
"                DECODE (
"
"                   suplnh_ap_gl_acct,
"
"                   NULL, NULL,
"
"                   DECODE (
"
"                      func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct),
"
"                      NULL, NULL,
"
"                      func_find_gl_par_class_id (
"
"                         suphd_bu,
"
"                         func_find_gl_acct_cls (suphd_bu, suplnh_ap_gl_acct))))
"
"                   par_gl_class,
"
"                SUPLNH_TAX_PCT gst_rate,
"
"               NVL (suplnh_cgst_amt , 0)cgst_amt,
"
"                (CASE WHEN suplnh_cgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                       0
"
"                   END)cgst_rate,
"
"               NVL (suplnh_sgst_amt, 0)  sgst_amt,
"
"                (CASE WHEN suplnh_sgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END)sgst_rate,
"
"                NVL (suplnh_igst_amt,
"
"                   0)
"
"                    igst_amt,
"
"            (CASE WHEN SUPLNH_IGST_AMT > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) igst_rate,
"
"               NVL (suplnh_utgst_amt,  0) utgst_amt,
"
"                (CASE WHEN suplnh_utgst_amt > 0 THEN
"
"                            SUPLNH_TAX_PCT
"
"                      ELSE
"
"                   0
"
"                   END) utgst_rate,
"
"                suplnh_inv_uom,
"
"                suplnh_hsn_code,
"
"                suphd_gstin_no,
"
"                suphd_suplr_type,
"
"                suphd_gst_class,
"
"                suplnh_gst_rev_tax_flag,
"
"                suphd_gst_type,
"
"                suphd_state_code,
"
"                (SELECT DISTINCT state_name1
"
"                   FROM states
"
"                  WHERE state_code = suphd_state_code AND ROWNUM = 1)
"
"                   state_code_name,
"
"                suphd_exchange_rate,
"
"                suplnh_ap_cc_code,suplnh_gst_rev_tax_cat,
"
"                 (CASE WHEN SUPLNH_GRN_TAX_PCT > 0 THEN
"
"                    NVL(suplnh_grn_igst_amt,0)+NVL(suplnh_grn_cgst_amt,0) + NVL(suplnh_grn_sgst_amt,0)+NVL(suplnh_grn_utgst_amt,0)+NVL(suplnh_grn_cess_amt,0)
"
"                    ELSE
"
"                    0 END)suphd_grn_tax_val,
"
"                    Suphd_tds_exmp_flag
"
"           FROM suplr_doc_hd_hist_vw1,
"
"                suplr_doc_ln_hist,
"
"                appl_journals_hist_vw
"
"          WHERE     suphd_bu = suplnh_bu
"
"                AND suphd_doc_no = suplnh_doc_no
"
"                AND suphd_bu = c_bu
"
"               -- AND suphd_pfx = c_pfx
"
"                AND suphd_doc_no = c_doc_no
"
"                AND ajhv_bu(+) = suphd_bu
"
"               -- AND ajhv_vou_pfx(+) = suphd_pfx
"
"                AND ajhv_vou_no(+) = suphd_doc_no
"
"                AND ajhv_vou_line_no(+) = suplnh_seq_no
"
"                AND ajhv_tc_id IS NULL
"
"                AND (    ajhv_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND ajhv_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y')) ;
"
"
"
"      v_type       VARCHAR2 (5);
"
"      v_sub_cls    VARCHAR2 (500);
"
"      v_sub_cls1   VARCHAR2 (500);
"
"      v_rnd        NUMBER (5);
"
"   BEGIN
"
"      v_rnd := func_find_appl_rnddigit (p_bu);
"
"
"
"      DELETE bill_reg_pr_ln_temp
"
"       WHERE brprlt_bu = p_bu AND brprlt_doc_no = p_doc_no;
"
"
"
"
"
"      FOR r_pr_ln IN c_pr_ln
"
"      LOOP
"
"
"
"            v_type := 'N';
"
"
"
"         IF r_pr_ln.suphdh_grn_refer IN ('Y',
"
"                                        'S',
"
"                                        'Z',
"
"                                        'T',
"
"                                        'PR',
"
"                                        'STG',
"
"                                        'STD',
"
"                                        'POQ')
"
"         THEN
"
"            v_sub_cls := NULL;
"
"
"
"            FOR cr2 IN c2 (r_pr_ln.suphdh_pfx, r_pr_ln.suphdh_doc_no)
"
"            LOOP
"
"               IF cr2.suplnh_prod_sub_cls IS NOT NULL
"
"               THEN
"
"                  v_sub_cls1 :=
"
"                     func_find_subclass_desc (p_bu,
"
"                                              cr2.suplnh_prod_sub_cls,
"
"                                              1);
"
"                  v_sub_cls := v_sub_cls || v_sub_cls1 || ',';
"
"               END IF;
"
"            END LOOP;
"
"
"
"            v_sub_cls := RTRIM (v_sub_cls, ',');
"
"         ELSE
"
"            v_sub_cls := NULL;
"
"         END IF;
"
"
"
"         INSERT INTO bill_reg_pr_ln_temp (brprlt_bu,
"
"                                          brprlt_doc_no,
"
"                                          brprlt_plnt,
"
"                                          brprlt_plnt_loc,
"
"                                          brprlt_vou_type,
"
"                                          brprlt_inv_pfx,
"
"                                          brprlt_inv_no,
"
"                                          brprlt_inv_date,
"
"                                          brprlt_inv_type,
"
"                                          --brprlt_inv_mode,
"
"                                          brprlt_suplr_id,
"
"                                          brprlt_suplr_name,
"
"                                          brprlt_suplr_bill_no,
"
"                                          brprlt_suplr_bill_date,
"
"                                          brprlt_curry,
"
"                                          brprlt_exchange_rate,
"
"                                          brprlt_gross_sc_val,
"
"                                          brprlt_gross_bc_val,
"
"                                          brprlt_net_sc_val,
"
"                                          brprlt_net_bc_val,
"
"                                          brprlt_dom_val,
"
"                                          brprlt_imp_val,
"
"                                          brprlt_tax_val,
"
"                                          brprlt_grn_tax_val,
"
"                                          brprlt_cre_by,
"
"                                          brprlt_cre_date,
"
"                                          brprlt_bill_amt_bc,
"
"                                          brprlt_bill_amt_tc,
"
"                                          brprlt_type,
"
"                                          brprlt_grn_refer,
"
"                                          brprlt_sub_cls,
"
"                                          brprlt_mat_amt,
"
"                                          brprlt_status,
"
"                                          brprlt_reference,
"
"                                          brprlt_recover,
"
"                                          brprlt_tds_val,
"
"                                          brprlt_tds_pct,
"
"                                          brprlt_tds_assbl_val,
"
"                                          brprlt_esi_val,
"
"                                          brprlt_esi_pct,
"
"                                          brprlt_esi_assbl_val,
"
"                                          brprlt_state_code,
"
"                                          brprlt_bill_qty,
"
"                                          brprlt_suplr_gstin,
"
"                                            brprlt_suplr_reg_type,
"
"                                            brprlt_suplr_type,
"
"                                            brplt_bill_loc_id,
"
"                                            brplt_grn_pfx,
"
"                                            brplt_grn_no,
"
"                                            brplt_grn_date,
"
"                                            brplt_bill_to_code)
"
"                 VALUES (
"
"                           p_bu,
"
"                           p_doc_no,
"
"                           r_pr_ln.suphdh_plant,
"
"                           r_pr_ln.suphdh_plnt_loc_id,
"
"                           r_pr_ln.suphdh_vou_type,
"
"                           r_pr_ln.suphdh_pfx,
"
"                           r_pr_ln.suphdh_doc_no,
"
"                           r_pr_ln.suphdh_doc_date,
"
"                           r_pr_ln.suphdh_doc_type,
"
"                           --r_pr_ln.suphd_doc_mode,
"
"                           r_pr_ln.suphdh_suplr_id,
"
"                           r_pr_ln.suphdh_suplr_name,
"
"                           r_pr_ln.suphdh_suplr_bill_no,
"
"                           r_pr_ln.suphdh_suplr_bill_date,
"
"                           r_pr_ln.suphdh_currency,
"
"                           r_pr_ln.suphdh_exchange_rate,
"
"                           ROUND ( (r_pr_ln.suphdh_gross_sc_val), v_rnd),
"
"                           ROUND ( (r_pr_ln.suphdh_gross_bc_val), v_rnd),
"
"                           ROUND (r_pr_ln.bill_amt_tc, v_rnd), --ROUND (r_pr_ln.suphd_gross_sc_val, v_rnd),
"
"                           ROUND (r_pr_ln.bill_amt_bc, v_rnd), --ROUND (r_pr_ln.suphd_gross_bc_val, v_rnd),
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) =
"
"                                      r_pr_ln.suphdh_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_pr_ln.bill_amt_bc
"
"                                     - r_pr_ln.suphdh_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) <>
"
"                                      r_pr_ln.suphdh_currency
"
"                              THEN
"
"                                 ROUND (
"
"                                    (  r_pr_ln.bill_amt_bc
"
"                                     - r_pr_ln.suphdh_tax_val_bc),
"
"                                    v_rnd)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           ROUND (r_pr_ln.suphdh_tax_val_tc, v_rnd),
"
"                           ROUND (r_pr_ln.suphdh_grn_tax_val, v_rnd),
"
"                           p_user,
"
"                           SYSDATE,
"
"                           ROUND (r_pr_ln.bill_amt_bc, v_rnd),
"
"                           ROUND (r_pr_ln.bill_amt_tc, v_rnd),
"
"                           v_type,
"
"                           r_pr_ln.suphdh_grn_refer,
"
"                           v_sub_cls,
"
"                           ROUND (
"
"                              (r_pr_ln.bill_amt_bc - r_pr_ln.suphdh_tax_val_bc),
"
"                              v_rnd),
"
"                           r_pr_ln.suphdh_status,
"
"                           r_pr_ln.suphdh_suplr_reference,
"
"                           r_pr_ln.recover_flag,
"
"                           ROUND (r_pr_ln.tds_value, v_rnd),
"
"                           r_pr_ln.tds_pct,
"
"                           ROUND (r_pr_ln.tds_assbl_val, v_rnd),
"
"                           ROUND (r_pr_ln.esi_value, v_rnd),
"
"                           r_pr_ln.esi_pct,
"
"                           ROUND (r_pr_ln.esi_assbl_val, v_rnd),
"
"                           r_pr_ln.state_code,
"
"                           r_pr_ln.bill_qty,
"
"                           r_pr_ln.suphdh_gstin_no,
"
"                            r_pr_ln.suphdh_suplr_type,
"
"                            r_pr_ln.suphdh_gst_class,
"
"                            r_pr_ln.suphdh_bill_loc_id,
"
"                             r_pr_ln.suphdh_grn_pfx,
"
"                             r_pr_ln.suphdh_grn_no,
"
"                             r_pr_ln.suphdh_grn_date,
"
"                             r_pr_ln.suphdh_blto_state_code);
"
"
"
"       --  CLOSE c1;
"
"
"
"         FOR cr3 IN c3 (p_bu, r_pr_ln.suphdh_pfx, r_pr_ln.suphdh_doc_no)
"
"         LOOP
"
"            INSERT INTO bill_item_line_temp (bilt_bu,
"
"                                             bilt_doc_no,
"
"                                             bilt_plnt,
"
"                                             BILT_PLNT_loc,
"
"                                             bilt_inv_pfx,
"
"                                             bilt_inv_no,
"
"                                             bilt_prod_id,
"
"                                             bilt_prod_rev,
"
"                                             bilt_prod_desc1,
"
"                                             bilt_pur_cls,
"
"                                             bilt_receipt_qty,
"
"                                             bilt_invoiced_qty,
"
"                                             bilt_inv_qty,
"
"                                             bilt_unit_cost,
"
"                                             bilt_ln_amt,
"
"                                             bilt_acct,
"
"                                             bilt_cl_id,
"
"                                             bilt_par_cl_id,
"
"                                             bilt_cre_by,
"
"                                             bilt_cre_date,
"
"                                             bilt_gst_rate,
"
"                                             bilt_cgst_amt,
"
"                                             bilt_sgst_amt,
"
"                                             bilt_igst_amt,
"
"                                             bilt_utgst_amt,
"
"                                             bilt_hsn_code,
"
"                                             bilt_uom,
"
"                                             bilt_gstin_no,
"
"                                             bilt_suplr_type,
"
"                                             bilt_gst_class,
"
"                                             bilt_gst_rev_tax_flag,
"
"                                             bilt_gst_type,
"
"                                             bilt_state_code,
"
"                                             bilt_state_code_desc,
"
"                                             bilt_cc_code,
"
"                                             bilt_rcm_cat,
"
"                                             bilt_cgst_rate,
"
"                                            bilt_sgst_rate,
"
"                                            bilt_igst_rate,
"
"                                            bilt_utgst_rate,
"
"                                            bilt_grn_tax_val)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         cr3.suphd_plant,
"
"                         cr3.suphd_plnt_loc_id,
"
"                         cr3.suphd_pfx,
"
"                         cr3.suphd_doc_no,
"
"                         cr3.suplnh_prod_id,
"
"                         cr3.suplnh_prod_rev,
"
"                         cr3.suplnh_prod_desc1,
"
"                         cr3.pur_cls,
"
"                         cr3.suplnh_receipt_qty,
"
"                         cr3.suplnh_invoiced_qty,
"
"                         cr3.suplnh_inv_qty,
"
"                         cr3.suplnh_unit_cost,
"
"                         cr3.line_amt + cr3.navl_tax_amt,
"
"                         cr3.ajhv_gl_acct,
"
"                         cr3.gl_class,
"
"                         cr3.par_gl_class,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr3.gst_rate,
"
"                         cr3.cgst_amt,
"
"                         cr3.sgst_amt,
"
"                         cr3.igst_amt,
"
"                         cr3.utgst_amt,
"
"                         cr3.suplnh_hsn_code,
"
"                         cr3.suplnh_inv_uom,
"
"                         cr3.suphd_gstin_no,
"
"                         cr3.suphd_suplr_type,
"
"                         cr3.suphd_gst_class,
"
"                         cr3.suplnh_gst_rev_tax_flag,
"
"                         cr3.suphd_gst_type,
"
"                         cr3.suphd_state_code,
"
"                         cr3.state_code_name,
"
"                         cr3.suplnh_ap_cc_code,
"
"                         cr3.suplnh_gst_rev_tax_cat,
"
"                           cr3.cgst_rate,
"
"                         cr3.sgst_rate,
"
"                         cr3.igst_rate,
"
"                         cr3.utgst_rate,
"
"                         CR3.suphd_grn_tax_val);
"
"         END LOOP;
"
"      END LOOP c_pr_ln;
"
"   END proc_ins_pur_ret_lines;
"
"
"
"   PROCEDURE proc_ins_proc_pyrl_lines (p_bu           VARCHAR2,
"
"                                       p_doc_no       VARCHAR2,
"
"                                       p_from_date    DATE DEFAULT NULL,
"
"                                       p_to_date      DATE DEFAULT NULL,
"
"                                       p_status       VARCHAR2,
"
"                                       p_user         VARCHAR2)
"
"   IS
"
"      CURSOR c_pp_ln
"
"      IS
"
"           SELECT DISTINCT ppbh_bu suphd_bu,
"
"                           ajh_plnt suphd_plant,
"
"                           ajh_gl_plnt_loc_id suphd_plnt_loc_id,
"
"                           ppbh_jrnl_date suphd_doc_date,
"
"                           'PRL' suphd_pfx,
"
"                           ppbh_batch_no suphd_doc_no,
"
"                           'CM' suphd_doc_type,
"
"                           'I' suphd_doc_mode,
"
"                           NULL suphd_suplr_id,
"
"                           NULL suphd_suplr_name,
"
"                           ppbh_batch_no suphd_suplr_bill_no,
"
"                           ppbh_jrnl_date suphd_suplr_bill_date,
"
"                           'INR' suphd_currency,
"
"                           '1' suphd_exchange_rate,
"
"                           ppbh_status suphd_status,
"
"                           SUM (ajh_bc_cr_amt) bill_amt_bc,
"
"                           SUM (ajh_fc_cr_amt) bill_amt_tc,
"
"                           0 mat_amt,
"
"                           'N' suphd_grn_refer,
"
"                           0 suphd_gross_sc_val,
"
"                           0 suphd_gross_bc_val,
"
"                           0 suphd_dom_val,
"
"                           0 suphd_imp_val,
"
"                           0 suphd_tax_val_bc,
"
"                           0 suphd_tax_val_tc,
"
"                           0 suphd_grn_tax_val,
"
"                           0 tds_value,
"
"                           0 tds_pct,
"
"                           0 tds_assbl_val,
"
"                           0 esi_value,
"
"                           0 esi_pct,
"
"                           0 esi_assbl_val,
"
"                           ppbh_jrnl_date suphd_suplr_reference,
"
"                           --func_find_recover_flag (suphd_bu, suphd_pfx, suphd_doc_no)
"
"                           NULL recover_flag,
"
"                           NULL suphd_gstin_no,
"
"                           NULL suphd_bill_loc_id,
"
"                           'R' suphd_suplr_type,
"
"                           'I' suphd_gst_class,
"
"                           'N' suplnh_gst_rev_tax_flag,
"
"                           'N' suphd_gst_supply,
"
"                           'G' suphd_gst_type,
"
"                           'PPV' suphd_vou_type,
"
"                           NULL state_code,
"
"                          null  suphd_grn_pfx,
"
"                            null suphd_grn_no,
"
"                            null suphd_grn_date,
"
"                            null suphd_blto_state_code,
"
"                            null Suphd_tds_exmp_flag
"
"             FROM pyrl_proc_batch_hd, appl_journals_hist
"
"            WHERE     (   (ppbh_status IN ('N') AND p_status = 'N')
"
"                       OR (ppbh_status IN ('P') AND p_status = 'P')
"
"                       OR p_status IS NULL)
"
"                  AND ppbh_bu = ajh_bu
"
"                  AND ppbh_batch_no = ajh_vou_no
"
"                  AND ajh_vou_pfx IS NULL
"
"                  AND ppbh_bu = p_bu
"
"                  AND (ppbh_jrnl_date >= p_from_date OR p_from_date IS NULL)
"
"                  AND (ppbh_jrnl_date <= p_to_date OR p_to_date IS NULL)
"
"                  AND (    ajh_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                             FROM bill_reg_lvl1
"
"                                            WHERE     brl1_bu = p_bu
"
"                                                  AND brl1_cre_by = p_user
"
"                                                  AND brl1_sel_flag = 'Y')
"
"                       AND ajh_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                             FROM bill_reg_lvl2
"
"                                            WHERE     brl2_bu = p_bu
"
"                                                  AND brl2_cre_by = p_user
"
"                                                  AND brl2_sel_flag = 'Y')
"
"                       AND ajh_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                             FROM bill_reg_lvl3
"
"                                            WHERE     brl3_bu = p_bu
"
"                                                  AND brl3_cre_by = p_user
"
"                                                  AND brl3_sel_flag = 'Y')
"
"                       AND ajh_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                             FROM bill_reg_lvl4
"
"                                            WHERE     brl4_bu = p_bu
"
"                                                  AND brl4_cre_by = p_user
"
"                                                  AND brl4_sel_flag = 'Y')
"
"                       AND ajh_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                             FROM bill_reg_lvl5
"
"                                            WHERE     brl5_bu = p_bu
"
"                                                  AND brl5_cre_by = p_user
"
"                                                  AND brl5_sel_flag = 'Y')
"
"                       AND ajh_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                             FROM bill_reg_lvl6
"
"                                            WHERE     brl6_bu = p_bu
"
"                                                  AND brl6_cre_by = p_user
"
"                                                  AND brl6_sel_flag = 'Y')
"
"                       AND ajh_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                                FROM bill_reg_lvl_prj
"
"                                               WHERE     brlp_bu = p_bu
"
"                                                     AND brlp_cre_by = p_user
"
"                                                     AND brlp_sel_flag = 'Y'))
"
"         GROUP BY ppbh_bu,
"
"                  ajh_plnt,
"
"                  ajh_gl_plnt_loc_id,
"
"                  ppbh_jrnl_date,
"
"                  ppbh_batch_no,
"
"                  ppbh_jrnl_date,
"
"                  ppbh_status;
"
"   BEGIN
"
"      --  v_rnd := func_find_appl_rnddigit (p_bu);
"
"
"
"      DELETE bill_reg_proc_pyrl_temp
"
"       WHERE brppt_bu = p_bu AND brppt_doc_no = p_doc_no;
"
"
"
"      FOR r_pp_ln IN c_pp_ln
"
"      LOOP
"
"         INSERT /*+ append */
"
"               INTO  bill_reg_proc_pyrl_temp (brppt_bu,
"
"                                              brppt_doc_no,
"
"                                              brppt_plnt,
"
"                                              brppt_plnt_loc,
"
"                                              brppt_vou_type,
"
"                                              brppt_inv_pfx,
"
"                                              brppt_inv_no,
"
"                                              brppt_inv_date,
"
"                                              brppt_inv_type,
"
"                                              brppt_inv_mode,
"
"                                              brppt_suplr_id,
"
"                                              brppt_suplr_name,
"
"                                              brppt_suplr_bill_no,
"
"                                              brppt_suplr_bill_date,
"
"                                              brppt_curry,
"
"                                              brppt_exchange_rate,
"
"                                              brppt_gross_sc_val,
"
"                                              brppt_gross_bc_val,
"
"                                              brppt_net_sc_val,
"
"                                              brppt_net_bc_val,
"
"                                              brppt_dom_val,
"
"                                              brppt_imp_val,
"
"                                              brppt_tax_val,
"
"                                              brppt_grn_tax_val,
"
"                                              brppt_cre_by,
"
"                                              brppt_cre_date,
"
"                                              brppt_bill_amt_bc,
"
"                                              brppt_bill_amt_tc,
"
"                                              brppt_type,
"
"                                              brppt_grn_refer,
"
"                                              brppt_sub_cls,
"
"                                              brppt_mat_amt,
"
"                                              brppt_status,
"
"                                              brppt_reference,
"
"                                              brppt_recover,
"
"                                              brppt_tds_val,
"
"                                              brppt_tds_pct,
"
"                                              brppt_tds_assbl_val,
"
"                                              brppt_esi_val,
"
"                                              brppt_esi_pct,
"
"                                              brppt_esi_assbl_val,
"
"                                              brppt_state_code,
"
"                                              brppt_suplr_gstin,
"
"                                                brppt_suplr_reg_type,
"
"                                                brppt_suplr_type,
"
"                                              brppt_bill_loc_id,
"
"                                              brppt_grn_pfx,
"
"                                                brppt_grn_no,
"
"                                                brppt_grn_date,
"
"                                                brppt_bill_to_code,
"
"                                                brppt_tds_appl_flag)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      r_pp_ln.suphd_plant,
"
"                      r_pp_ln.suphd_plnt_loc_id,
"
"                      r_pp_ln.suphd_vou_type,
"
"                      r_pp_ln.suphd_pfx,
"
"                      r_pp_ln.suphd_doc_no,
"
"                      r_pp_ln.suphd_doc_date,
"
"                      r_pp_ln.suphd_doc_type,
"
"                      r_pp_ln.suphd_doc_mode,
"
"                      r_pp_ln.suphd_suplr_id,
"
"                      r_pp_ln.suphd_suplr_name,
"
"                      r_pp_ln.suphd_suplr_bill_no,
"
"                      r_pp_ln.suphd_suplr_bill_date,
"
"                      r_pp_ln.suphd_currency,
"
"                      r_pp_ln.suphd_exchange_rate,
"
"                      (ABS (r_pp_ln.bill_amt_tc) - r_pp_ln.suphd_tax_val_tc),
"
"                      (ABS (r_pp_ln.bill_amt_bc) - r_pp_ln.suphd_tax_val_bc),
"
"                      (ABS (r_pp_ln.bill_amt_bc)),
"
"                      (ABS (r_pp_ln.bill_amt_tc)),
"
"                      0,
"
"                      0,
"
"                      r_pp_ln.suphd_tax_val_tc,
"
"                      r_pp_ln.suphd_grn_tax_val,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      ABS (r_pp_ln.bill_amt_bc),
"
"                      ABS (r_pp_ln.bill_amt_tc),
"
"                      'NULL',
"
"                      r_pp_ln.suphd_grn_refer,
"
"                      'NULL',
"
"                      ABS (r_pp_ln.bill_amt_bc) - r_pp_ln.suphd_tax_val_bc,
"
"                      r_pp_ln.suphd_status,
"
"                      r_pp_ln.suphd_suplr_reference,
"
"                      r_pp_ln.recover_flag,
"
"                      r_pp_ln.tds_value,
"
"                      r_pp_ln.tds_pct,
"
"                      r_pp_ln.tds_assbl_val,
"
"                      r_pp_ln.esi_value,
"
"                      r_pp_ln.esi_pct,
"
"                      r_pp_ln.esi_assbl_val,
"
"                      r_pp_ln.state_code,
"
"                      r_pp_ln.suphd_gstin_no,
"
"                        r_pp_ln.suphd_suplr_type,
"
"                        r_pp_ln.suphd_gst_class,
"
"                        null,--r_pp_ln.suphd_bill_loc_id,
"
"                         r_pp_ln.suphd_grn_pfx,
"
"                         r_pp_ln.suphd_grn_no,
"
"                         r_pp_ln.suphd_grn_date,
"
"                         r_pp_ln.suphd_blto_state_code,
"
"                         r_pp_ln.Suphd_tds_exmp_flag);
"
"      END LOOP c_pp_ln;
"
"   END proc_ins_proc_pyrl_lines;
"
"
"
"   PROCEDURE proc_ins_btrans_lines (p_bu           VARCHAR2,
"
"                                    p_doc_no       VARCHAR2,
"
"                                    p_from_date    DATE DEFAULT NULL,
"
"                                    p_to_date      DATE DEFAULT NULL,
"
"                                    p_status       VARCHAR2,
"
"                                    p_user         VARCHAR2)
"
"   IS
"
"      CURSOR c_btrans_ln
"
"      IS
"
"           SELECT suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plnt_loc_id,
"
"                  suphd_doc_date,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  suphd_doc_type,
"
"                  suphd_doc_mode,
"
"                  suphd_suplr_id,
"
"                  suphd_suplr_name,
"
"                  suphd_suplr_bill_no,
"
"                  suphd_suplr_bill_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  SUM (bill_amt_bc_db) bill_amt_bc, --SUM (bill_amt_bc_db) - SUM (bill_amt_bc_cr) bill_amt_bc,
"
"                  SUM (bill_amt_tc_db) bill_amt_tc, --SUM (bill_amt_tc_db) - SUM (bill_amt_tc_cr) bill_amt_tc,
"
"                  SUM (mat_amt) mat_amt,
"
"                  suphd_grn_refer,
"
"                  SUM (suphd_gross_sc_val) suphd_gross_sc_val,
"
"                  SUM (suphd_gross_bc_val) suphd_gross_bc_val,
"
"                  SUM (suphd_dom_val) suphd_dom_val,
"
"                  SUM (suphd_imp_val) suphd_imp_val,
"
"                  SUM (suphd_tax_val_bc) suphd_tax_val_bc,
"
"                  SUM (suphd_tax_val_tc) suphd_tax_val_tc,
"
"                  SUM (suphd_grn_tax_val) suphd_grn_tax_val,
"
"                  SUM (tds_value) tds_value,
"
"                  SUM (tds_pct) tds_pct,
"
"                  SUM (tds_assbl_val) tds_assbl_val,
"
"                  SUM (esi_value) esi_value,
"
"                  SUM (esi_pct) esi_pct,
"
"                  SUM (esi_assbl_val) esi_assbl_val,
"
"                  suphd_suplr_reference,
"
"                  recover_flag,
"
"                  NULL suphd_gstin_no,
"
"                  NULL suphd_bill_loc_id,
"
"                  'R' suphd_suplr_type,
"
"                  'L' suphd_gst_class,
"
"                  --NULL suphd_gst_rev_tax_flag,
"
"                  NULL suphd_gst_supply,
"
"                  NULL suphd_gst_type,
"
"                  suphd_vou_type,
"
"                  NULL state_code,
"
"                   suphd_grn_pfx,
"
"                     suphd_grn_no,
"
"                     suphd_grn_date,
"
"                     suphd_blto_state_code,
"
"                     Suphd_tds_exmp_flag
"
"             FROM (  SELECT suphd_bu,
"
"                            suphd_plant,
"
"                            suphd_plnt_loc_id,
"
"                            suphd_doc_date,
"
"                            suphd_pfx,
"
"                            suphd_doc_no,
"
"                            suphd_doc_type,
"
"                            suphd_doc_mode,
"
"                            suphd_suplr_id,
"
"                            suphd_suplr_name,
"
"                            suphd_suplr_bill_no,
"
"                            suphd_suplr_bill_date,
"
"                            suphd_currency,
"
"                            suphd_exchange_rate,
"
"                            suphd_status,
"
"                            ABS(SUM (bill_amt_bc_db)) bill_amt_bc_db,
"
"                            ABS(SUM (bill_amt_tc_db)) bill_amt_tc_db,
"
"                            SUM (bill_amt_bc_cr) bill_amt_bc_cr,
"
"                            SUM (bill_amt_tc_cr) bill_amt_tc_cr,
"
"                            SUM (mat_amt) mat_amt,
"
"                            suphd_grn_refer,
"
"                            SUM (suphd_gross_sc_val) suphd_gross_sc_val,
"
"                            SUM (suphd_gross_bc_val) suphd_gross_bc_val,
"
"                            SUM (suphd_dom_val) suphd_dom_val,
"
"                            SUM (suphd_imp_val) suphd_imp_val,
"
"                            SUM (suphd_tax_val_bc) suphd_tax_val_bc,
"
"                            SUM (suphd_tax_val_tc) suphd_tax_val_tc,
"
"                            SUM (suphd_grn_tax_val) suphd_grn_tax_val,
"
"                            SUM (tds_value) tds_value,
"
"                            SUM (tds_pct) tds_pct,
"
"                            SUM (tds_assbl_val) tds_assbl_val,
"
"                            SUM (esi_value) esi_value,
"
"                            SUM (esi_pct) esi_pct,
"
"                            SUM (esi_assbl_val) esi_assbl_val,
"
"                            suphd_suplr_reference,
"
"                            recover_flag,
"
"                            NULL suphd_gstin_no,
"
"                            null suphd_bill_loc_id,
"
"                            NULL suphd_suplr_type,
"
"                            NULL suphd_gst_class,
"
"                            --NULL suphd_gst_rev_tax_flag,
"
"                            NULL suphd_gst_supply,
"
"                            NULL suphd_gst_type,
"
"                            suphd_vou_type,
"
"                            NULL state_code,
"
"                             suphd_grn_pfx,
"
"                             suphd_grn_no,
"
"                             suphd_grn_date,
"
"                             suphd_blto_state_code,
"
"                             Suphd_tds_exmp_flag
"
"                       FROM (SELECT btrans_bu suphd_bu,
"
"                                    btrans_plant suphd_plant,
"
"                                    btrans_plnt_loc_id suphd_plnt_loc_id,
"
"                                    btrans_trans_date suphd_doc_date,
"
"                                    btrans_ord_pfx suphd_pfx,
"
"                                    btrans_ord_no suphd_doc_no,
"
"                                    DECODE (btrans_type,  'BT', 'P',  'CT', 'P')
"
"                                       suphd_doc_type,
"
"                                    DECODE (btrans_type,  'BT', 'I',  'CT', 'R')
"
"                                       suphd_doc_mode,
"
"                                    btrans_bank_id suphd_suplr_id,
"
"                                    DECODE (
"
"                                       btrans_type,
"
"                                       'BT', func_find_bank_desc (p_bu,
"
"                                                                  btrans_bank_id,
"
"                                                                  1),
"
"                                       'CT', FUNC_FIND_PARTY_NAME (p_bu,
"
"                                                                  btrans_bank_id,
"
"                                                                  1),
"
"                                       CASE
"
"                                          WHEN     btrans_type = 'CV'
"
"                                               AND btrans_ftype = 'CT'
"
"                                          THEN
"
"                                             FUNC_FIND_PARTY_NAME (p_bu,
"
"                                                                  btrans_bank_id,
"
"                                                                  1)
"
"                                          WHEN     btrans_type = 'CV'
"
"                                               AND btrans_ftype = 'BT'
"
"                                          THEN
"
"                                             func_find_bank_desc (p_bu,
"
"                                                                  btrans_bank_id,
"
"                                                                  1)
"
"                                       END)
"
"                                       suphd_suplr_name,
"
"                                   (CASE WHEN  btrans_type = 'JT' THEN
"
"                                   NULL
"
"                                   ELSE
"
"                                   btrans_ord_no END) suphd_suplr_bill_no,
"
"                                  ( CASE WHEN  btrans_type = 'JT' THEN
"
"                                   NULL
"
"                                   ELSE
"
"                                    btrans_trans_date END) suphd_suplr_bill_date,
"
"                                    btrans_bank_curcy suphd_currency,
"
"                                   btrans_trans_base_exrate suphd_exchange_rate,-- btrans_bank_base_exrate suphd_exchange_rate,
"
"                                    DECODE (btrans_status,
"
"                                            'I', 'P',
"
"                                            'C', 'P',
"
"                                            'R', 'P',
"
"                                            'P', 'P',
"
"                                            'V', 'P',
"
"                                            btrans_status)
"
"                                       suphd_status,
"
"                                    CASE
"
"                                       WHEN     btrans_type = 'JT'
"
"                                            AND btrans_trans_mode = 'P'
"
"                                       THEN
"
"                                        /*  (SELECT NVL (SUM (btdln_bc_amt), 0) --NVL(SUM(btdln_dist_amt) * btrans_trans_base_exrate,0)
"
"                                             FROM bank_trans_dist_ln_hist_vw
"
"                                            WHERE     btdln_bu = p_bu
"
"                                                  AND btdln_ord_no =
"
"                                                         btrans_ord_no
"
"                                                  AND btdln_dr_cr = 'DR')*/
"
"                                         ( CASE WHEN btdln_dr_cr = 'DR' THEN
"
"                                           NVL ( (btdln_bc_amt), 0)
"
"                                           ELSE
"
"                                           0
"
"                                           END)
"
"                                       --(btdln_dist_amt * btln_exrate)
"
"                                       WHEN     btrans_type = 'CV'
"
"                                            AND btrans_trans_mode IN ('I', 'O')
"
"                                       THEN
"
"                                         ( (  btdln_bc_amt /*btrans_trans_amt*/
"
"                                             * btrans_bank_base_exrate))
"
"                                       ELSE
"
"                                          ( CASE WHEN btdln_dr_cr ='DR' THEN
"
"                                                    BTDLN_BC_AMT
"
"                                              WHEN btdln_dr_cr ='CR' THEN
"
"                                               - BTDLN_BC_AMT
"
"                                               END /*btrans_trans_amt*/
"
"                                           )
"
"                                    END
"
"                                       bill_amt_bc_db,
"
"                                    --CASE WHEN btrans_type <> 'JT' THEN btrans_bank_net_amt ELSE btdln_dist_amt END bill_amt_bc_db,
"
"                                    CASE
"
"                                       WHEN     btrans_type = 'JT'
"
"                                            AND btrans_trans_mode = 'P'
"
"                                       THEN
"
"                                        /*  (SELECT NVL (SUM (btdln_dist_amt), 0)
"
"                                             FROM bank_trans_dist_ln_hist_vw
"
"                                            WHERE     btdln_bu = p_bu
"
"                                                  AND btdln_ord_no =
"
"                                                         btrans_ord_no
"
"                                                  AND btdln_dr_cr = 'DR')*/
"
"                                      ( CASE WHEN btdln_dr_cr = 'DR' THEN
"
"                                           NVL ( (btdln_dist_amt), 0)
"
"                                           ELSE
"
"                                           0
"
"                                           END)
"
"                                       WHEN     btrans_type = 'CV'
"
"                                            AND btrans_trans_mode IN ('I', 'O')
"
"                                       THEN
"
"                                          (btrans_bank_net_amt /*btrans_trans_amt + NVL(btdln_dist_amt,0)*/
"
"                                                              )
"
"                                       ELSE
"
"                                          ( CASE WHEN btdln_dr_cr ='DR' THEN
"
"                                                    btdln_dist_amt
"
"                                              WHEN btdln_dr_cr ='CR' THEN
"
"                                               - btdln_dist_amt
"
"                                               END /*btrans_trans_amt*/
"
"                                           ) --NVL(btdln_dist_amt,btrans_trans_amt)
"
"                                    END
"
"                                       bill_amt_tc_db,
"
"                                    --CASE WHEN btrans_type <> 'JT' THEN (btrans_bank_net_amt * btrans_bank_base_exrate) ELSE btdln_dist_amt END bill_amt_tc_db,
"
"                                    0 bill_amt_bc_cr,
"
"                                    0 bill_amt_tc_cr,
"
"                                    0 mat_amt,
"
"                                    NULL suphd_grn_refer,
"
"                                    0 suphd_gross_sc_val,
"
"                                    0 suphd_gross_bc_val,
"
"                                    0 suphd_dom_val,
"
"                                    0 suphd_imp_val,
"
"                                    NVL (
"
"                                               SUM (
"
"                                                    NVL( (CASE
"
"                                   WHEN (BTDLN_IGST_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_IGST_AMT)
"
"                                   WHEN (BTDLN_CGST_AMT + BTDLN_SGST_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_CGST_AMT + BTDLN_SGST_AMT)
"
"                                   WHEN (BTDLN_UTGST_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_UTGST_AMT)
"
"                                   WHEN (BTDLN_CESS_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_CESS_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END),0)
"
"                                                  * btrans_bank_base_exrate /*btln_exrate*/
"
"                                                                           ),
"
"                                               0)
"
"                                       suphd_tax_val_bc,
"
"                                      NVL (
"
"                                               SUM (
"
"                                                    NVL( (CASE
"
"                                   WHEN (BTDLN_IGST_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_IGST_AMT)
"
"                                   WHEN (BTDLN_CGST_AMT + BTDLN_SGST_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_CGST_AMT + BTDLN_SGST_AMT)
"
"                                   WHEN (BTDLN_UTGST_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_UTGST_AMT)
"
"                                   WHEN (BTDLN_CESS_AMT) > 0
"
"                                   THEN
"
"                                      (BTDLN_CESS_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END),0)
"
"                                                                           ),
"
"                                               0)
"
"                                       suphd_tax_val_tc,
"
"                                    0 suphd_grn_tax_val,
"
"                                    /*(SELECT NVL (SUM (btdln_bc_amt), 0) --NVL(SUM(btdln_dist_amt) * btrans_trans_base_exrate,0)
"
"                                       FROM bank_trans_dist_ln_hist_vw
"
"                                      WHERE     btdln_bu = p_bu
"
"                                            AND btdln_ord_no = btrans_ord_no
"
"                                            AND btdln_dr_cr = 'CR'
"
"                                            AND btdln_pct > 0)*/
"
"                                         ( CASE WHEN btdln_pct > 0 AND btdln_dr_cr = 'CR' THEN
"
"                                           NVL ( (btdln_bc_amt), 0)
"
"                                           ELSE
"
"                                           0
"
"                                           END)
"
"                                       tds_value,
"
"                                   /* (SELECT NVL (SUM (btdln_pct), 0) --NVL(SUM(btdln_dist_amt) * btrans_trans_base_exrate,0)
"
"                                       FROM bank_trans_dist_ln_hist_vw
"
"                                      WHERE     btdln_bu = p_bu
"
"                                            AND btdln_ord_no = btrans_ord_no
"
"                                            AND btdln_dr_cr = 'CR'
"
"                                            AND btdln_pct > 0)*/
"
"                                          ( CASE WHEN btdln_pct > 0 AND btdln_dr_cr = 'CR' THEN
"
"                                           NVL ( (btdln_pct), 0)
"
"                                           ELSE
"
"                                           0
"
"                                           END)
"
"                                       tds_pct,
"
"                                 /*  (SELECT NVL (SUM (btdln_assess_val), 0) --NVL(SUM(btdln_dist_amt) * btrans_trans_base_exrate,0)
"
"                                       FROM bank_trans_dist_ln_hist_vw
"
"                                      WHERE     btdln_bu = p_bu
"
"                                            AND btdln_ord_no = btrans_ord_no
"
"                                            AND btdln_dr_cr = 'CR'
"
"                                            AND btdln_pct > 0)*/
"
"                                         ( CASE WHEN btdln_pct > 0 AND btdln_dr_cr = 'CR' THEN
"
"                                           NVL ( (SUM(btdln_assess_val)), 0)
"
"                                           ELSE
"
"                                           0
"
"                                           END)
"
"                                       tds_assbl_val,
"
"                                    0 esi_value,
"
"                                    0 esi_pct,
"
"                                    0 esi_assbl_val,
"
"                                    btrans_reference suphd_suplr_reference,
"
"                                    NULL recover_flag,
"
"                                    NULL                    /*btdln_gstin_no*/
"
"                                        suphd_gstin_no,
"
"                                    NULL suphd_bill_loc_id,
"
"                                    'L' suphd_suplr_type,
"
"                                    'N' suphd_gst_class,
"
"                                    -- btrans_gst_rev_tax_flag suphd_gst_rev_tax_flag,
"
"                                    NULL                    /*btdln_gst_type*/
"
"                                        suphd_gst_supply,
"
"                                    'G' suphd_gst_type,
"
"                                    CASE
"
"                                       WHEN     btrans_type = 'BT'
"
"                                            AND btrans_trans_mode = 'C'
"
"                                       THEN
"
"                                          'BCHRG'
"
"                                       WHEN     btrans_type = 'BT'
"
"                                            AND btrans_trans_mode = 'P'
"
"                                       THEN
"
"                                          'BPV'
"
"                                       WHEN     btrans_type = 'BT'
"
"                                            AND btrans_trans_mode = 'R'
"
"                                       THEN
"
"                                          'BRV'
"
"                                       WHEN     btrans_type = 'BT'
"
"                                            AND btrans_trans_mode IN ('I', 'O')
"
"                                       THEN
"
"                                          'BFT'
"
"                                       WHEN     btrans_type = 'BT'
"
"                                            AND btrans_trans_mode = 'N'
"
"                                       THEN
"
"                                          'BERNG'
"
"                                       WHEN     btrans_type = 'CT'
"
"                                            AND btrans_trans_mode = 'P'
"
"                                       THEN
"
"                                          'CPV'
"
"                                       WHEN     btrans_type = 'CT'
"
"                                            AND btrans_trans_mode = 'R'
"
"                                       THEN
"
"                                          'CRV'
"
"                                       WHEN     btrans_type = 'JT'
"
"                                            AND btrans_trans_mode = 'P'
"
"                                       THEN
"
"                                          'JV'
"
"                                       WHEN     btrans_type = 'CV'
"
"                                            AND btrans_trans_mode IN ('I', 'O')
"
"                                       THEN
"
"                                          'CV'
"
"                                    END
"
"                                       suphd_vou_type,
"
"                                    NULL state_code,
"
"                                    null suphd_grn_pfx,
"
"                                    null suphd_grn_no,
"
"                                    null suphd_grn_date,
"
"                                    null suphd_blto_state_code,--btdln_state_code state_code
"
"                                    null Suphd_tds_exmp_flag
"
"                               FROM bank_trans_hist_vw,
"
"                                    bank_trans_dist_ln_hist_vw
"
"                              WHERE     btrans_bu = btdln_bu(+)
"
"                                    AND btrans_ord_no = btdln_ord_no(+)
"
"                                    AND btrans_status NOT IN ('X', 'D')
"
"                                    AND btrans_bu = p_bu
"
"                                    AND (   (    btrans_status IN ('O', 'N', 'S')
"
"                                             AND p_status = 'N')
"
"                                         OR (    btrans_status IN ('I',
"
"                                                                   'R',
"
"                                                                   'C',
"
"                                                                   'P',
"
"                                                                   'V')
"
"                                             AND p_status = 'P')
"
"                                         OR p_status IS NULL)
"
"                                    AND (   btrans_trans_date >= p_from_date
"
"                                         OR p_from_date IS NULL)
"
"                                    AND (   btrans_trans_date <= p_to_date
"
"                                         OR p_to_date IS NULL)
"
"                                    AND (    btdln_lvl1 IN (SELECT brl1_lvl_id
"
"                                                              FROM bill_reg_lvl1
"
"                                                             WHERE     brl1_bu =
"
"                                                                          p_bu
"
"                                                                   AND brl1_cre_by =
"
"                                                                          p_user
"
"                                                                   AND brl1_sel_flag =
"
"                                                                          'Y')
"
"                                         AND btdln_lvl2 IN (SELECT brl2_lvl_id
"
"                                                              FROM bill_reg_lvl2
"
"                                                             WHERE     brl2_bu =
"
"                                                                          p_bu
"
"                                                                   AND brl2_cre_by =
"
"                                                                          p_user
"
"                                                                   AND brl2_sel_flag =
"
"                                                                          'Y')
"
"                                         AND btdln_lvl3 IN (SELECT brl3_lvl_id
"
"                                                              FROM bill_reg_lvl3
"
"                                                             WHERE     brl3_bu =
"
"                                                                          p_bu
"
"                                                                   AND brl3_cre_by =
"
"                                                                          p_user
"
"                                                                   AND brl3_sel_flag =
"
"                                                                          'Y')
"
"                                         AND btdln_lvl4 IN (SELECT brl4_lvl_id
"
"                                                              FROM bill_reg_lvl4
"
"                                                             WHERE     brl4_bu =
"
"                                                                          p_bu
"
"                                                                   AND brl4_cre_by =
"
"                                                                          p_user
"
"                                                                   AND brl4_sel_flag =
"
"                                                                          'Y')
"
"                                         AND btdln_lvl5 IN (SELECT brl5_lvl_id
"
"                                                              FROM bill_reg_lvl5
"
"                                                             WHERE     brl5_bu =
"
"                                                                          p_bu
"
"                                                                   AND brl5_cre_by =
"
"                                                                          p_user
"
"                                                                   AND brl5_sel_flag =
"
"                                                                          'Y')
"
"                                         AND btdln_lvl6 IN (SELECT brl6_lvl_id
"
"                                                              FROM bill_reg_lvl6
"
"                                                             WHERE     brl6_bu =
"
"                                                                          p_bu
"
"                                                                   AND brl6_cre_by =
"
"                                                                          p_user
"
"                                                                   AND brl6_sel_flag =
"
"                                                                          'Y')
"
"                                         AND btdln_lvl_prj IN (SELECT brlp_lvl_id
"
"                                                                 FROM bill_reg_lvl_prj
"
"                                                                WHERE     brlp_bu =
"
"                                                                             p_bu
"
"                                                                      AND brlp_cre_by =
"
"                                                                             p_user
"
"                                                                      AND brlp_sel_flag =
"
"                                                                             'Y'))
"
"                                   GROUP BY     btrans_bu        ,
"
"                                                btrans_plant     ,
"
"                                                btrans_plnt_loc_id ,
"
"                                                btrans_trans_date  ,
"
"                                                btrans_ord_pfx     ,
"
"                                                btrans_ord_no      ,
"
"                                                btrans_type        ,
"
"                                                btrans_bank_id     ,
"
"                                                btrans_bank_curcy  ,
"
"                                                btrans_bank_base_exrate   ,
"
"                                                btrans_trans_base_exrate,
"
"                                                btrans_status             ,
"
"                                                btrans_trans_mode ,
"
"                                                btrans_reference,
"
"                                                btdln_cess_amt,
"
"                                                btdln_utgst_amt,
"
"                                                btdln_cgst_amt,
"
"                                                btdln_sgst_amt,
"
"                                                btdln_igst_amt,
"
"                                                btrans_ftype,
"
"                                                btrans_bank_net_amt ,
"
"                                                 btdln_dr_cr,
"
"                                                btdln_pct,
"
"                                                btdln_bc_amt,
"
"                                                btdln_dist_amt)
"
"                   GROUP BY suphd_bu,
"
"                            suphd_plant,
"
"                            suphd_plnt_loc_id,
"
"                            suphd_doc_date,
"
"                            suphd_pfx,
"
"                            suphd_doc_no,
"
"                            suphd_doc_type,
"
"                            suphd_doc_mode,
"
"                            suphd_suplr_id,
"
"                            suphd_suplr_name,
"
"                            suphd_suplr_bill_no,
"
"                            suphd_suplr_bill_date,
"
"                            suphd_currency,
"
"                            suphd_exchange_rate,
"
"                            suphd_status,
"
"                            suphd_grn_refer,
"
"                            suphd_suplr_reference,
"
"                            recover_flag,
"
"                            --  suphd_gstin_no,
"
"                          --  suphd_bill_loc_id,
"
"                            -- suphd_suplr_type,
"
"                            -- suphd_gst_class,
"
"                            -- suphd_gst_rev_tax_flag,
"
"                            -- suphd_gst_supply,
"
"                            -- suphd_gst_type,
"
"                            suphd_vou_type,
"
"                             suphd_grn_pfx,
"
"                             suphd_grn_no,
"
"                             suphd_grn_date,
"
"                             suphd_blto_state_code,
"
"                             Suphd_tds_exmp_flag)
"
"         GROUP BY suphd_bu,
"
"                  suphd_plant,
"
"                  suphd_plnt_loc_id,
"
"                  suphd_doc_date,
"
"                  suphd_pfx,
"
"                  suphd_doc_no,
"
"                  suphd_doc_type,
"
"                  suphd_doc_mode,
"
"                  suphd_suplr_id,
"
"                  suphd_suplr_name,
"
"                  suphd_suplr_bill_no,
"
"                  suphd_suplr_bill_date,
"
"                  suphd_currency,
"
"                  suphd_exchange_rate,
"
"                  suphd_status,
"
"                  suphd_grn_refer,
"
"                  suphd_suplr_reference,
"
"                  recover_flag,
"
"                  --  suphd_gstin_no,
"
"                  suphd_bill_loc_id,
"
"                  -- suphd_suplr_type,
"
"                  -- suphd_gst_class,
"
"                  -- suphd_gst_rev_tax_flag,
"
"                  -- suphd_gst_supply,
"
"                  -- suphd_gst_type,
"
"                  suphd_vou_type,
"
"                   suphd_grn_pfx,
"
"                 suphd_grn_no,
"
"                 suphd_grn_date,
"
"                 suphd_blto_state_code
"
"                 ;
"
"
"
"      --  state_code;
"
"
"
"     /* CURSOR c1 (
"
"         c_bu        VARCHAR2,
"
"         c_plnt      VARCHAR2,
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"         SELECT TYPE
"
"           FROM (SELECT 'M' TYPE
"
"                   FROM suplr_doc_tax_charges_hist_vw1
"
"                  WHERE     sdtc_bu = c_bu
"
"                        AND sdtc_plant = c_plnt
"
"                        AND sdtc_pfx = c_pfx
"
"                        AND sdtc_doc_no = c_doc_no
"
"                        AND sdtc_tc_id IN (SELECT tc_tc_id
"
"                                             FROM tax_charges
"
"                                            WHERE     tc_bu = c_bu
"
"                                                  AND tc_type_id IN (SELECT tctype_id
"
"                                                                       FROM tax_charges_types
"
"                                                                      WHERE     tctype_bu =
"
"                                                                                   c_bu
"
"                                                                            AND tctype_type_id IN ('ED',
"
"                                                                                                   'CED',
"
"                                                                                                   'SHECE',
"
"                                                                                                   'ADTY')))
"
"                 UNION ALL
"
"                 SELECT 'DE' TYPE
"
"                   FROM suplr_doc_tax_charges_hist_vw1
"
"                  WHERE     sdtc_bu = c_bu
"
"                        AND sdtc_plant = c_plnt
"
"                        AND sdtc_pfx = c_pfx
"
"                        AND sdtc_doc_no = c_doc_no
"
"                        AND sdtc_pay_to_supplier = 'Y'
"
"                        AND sdtc_tc_id IN (SELECT tc_tc_id
"
"                                             FROM tax_charges
"
"                                            WHERE     tc_bu = c_bu
"
"                                                  AND tc_type_id IN (SELECT tctype_id
"
"                                                                       FROM tax_charges_types
"
"                                                                      WHERE     tctype_bu =
"
"                                                                                   c_bu
"
"                                                                            AND tctype_type_id IN ('MED',
"
"                                                                                                   'MCED',
"
"                                                                                                   'MSED',
"
"                                                                                                   'MAD',
"
"                                                                                                   'MCVD',
"
"                                                                                                   'MCCVD',
"
"                                                                                                   'MSCVD')))
"
"                 UNION ALL
"
"                 SELECT 'DI' TYPE
"
"                   FROM suplr_doc_tax_charges_hist_vw1
"
"                  WHERE     sdtc_bu = c_bu
"
"                        AND sdtc_plant = c_plnt
"
"                        AND sdtc_pfx = c_pfx
"
"                        AND sdtc_doc_no = c_doc_no
"
"                        AND sdtc_pay_to_supplier = 'N'
"
"                        AND sdtc_tc_id IN (SELECT tc_tc_id
"
"                                             FROM tax_charges
"
"                                            WHERE     tc_bu = c_bu
"
"                                                  AND tc_type_id IN (SELECT tctype_id
"
"                                                                       FROM tax_charges_types
"
"                                                                      WHERE     tctype_bu =
"
"                                                                                   c_bu
"
"                                                                            AND tctype_type_id IN ('MED',
"
"                                                                                                   'MCED',
"
"                                                                                                   'MSED',
"
"                                                                                                   'MAD',
"
"                                                                                                   'MCVD',
"
"                                                                                                   'MCCVD',
"
"                                                                                                   'MSCVD'))));*/
"
"
"
"      CURSOR c2 (
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"           SELECT suplnh_prod_sub_cls
"
"             FROM suplr_doc_ln_hist
"
"            WHERE     suplnh_bu = p_bu
"
"                  AND suplnh_doc_no = c_doc_no
"
"         GROUP BY suplnh_prod_sub_cls;
"
"
"
"
"
" --     cr1          c1%ROWTYPE;
"
"      v_type       VARCHAR2 (5);
"
"      v_sub_cls    VARCHAR2 (500);
"
"      v_sub_cls1   VARCHAR2 (500);
"
"   BEGIN
"
"      DELETE bill_reg_btrans_ln_temp
"
"       WHERE brblt_bu = p_bu AND brblt_doc_no = p_doc_no;
"
"
"
"      FOR r_btrans_ln IN c_btrans_ln
"
"      LOOP
"
"       /*  OPEN c1 (p_bu,
"
"                  r_btrans_ln.suphd_plant,
"
"                  r_btrans_ln.suphd_pfx,
"
"                  r_btrans_ln.suphd_doc_no);
"
"
"
"         FETCH c1 INTO cr1;*/
"
"
"
"         IF r_btrans_ln.suphd_tax_val_bc > 0
"
"         THEN
"
"           -- v_type := cr1.TYPE;
"
"           v_type :='N';
"
"         ELSE
"
"            v_type := 'N';
"
"         END IF;
"
"
"
"         IF r_btrans_ln.suphd_grn_refer IN ('Y',
"
"                                            'S',
"
"                                            'Z',
"
"                                            'T',
"
"                                            'PR',
"
"                                            'STG',
"
"                                            'STD',
"
"                                            'POQ',
"
"                                            'ISD')
"
"         THEN
"
"            v_sub_cls := NULL;
"
"
"
"            FOR cr2 IN c2 (r_btrans_ln.suphd_pfx, r_btrans_ln.suphd_doc_no)
"
"            LOOP
"
"               IF cr2.suplnh_prod_sub_cls IS NOT NULL
"
"               THEN
"
"                  v_sub_cls1 :=
"
"                     func_find_subclass_desc (p_bu,
"
"                                              cr2.suplnh_prod_sub_cls,
"
"                                              1);
"
"                  v_sub_cls := v_sub_cls || v_sub_cls1 || ',';
"
"               END IF;
"
"            END LOOP;
"
"
"
"            v_sub_cls := RTRIM (v_sub_cls, ',');
"
"         ELSE
"
"            v_sub_cls := NULL;
"
"         END IF;
"
"
"
"         INSERT /*+ append */
"
"               INTO  bill_reg_btrans_ln_temp (brblt_bu,
"
"                                              brblt_doc_no,
"
"                                              brblt_plnt,
"
"                                              brblt_plnt_loc,
"
"                                              brblt_vou_type,
"
"                                              brblt_inv_pfx,
"
"                                              brblt_inv_no,
"
"                                              brblt_inv_date,
"
"                                              brblt_inv_type,
"
"                                              brblt_inv_mode,
"
"                                              brblt_suplr_id,
"
"                                              brblt_suplr_name,
"
"                                              brblt_suplr_bill_no,
"
"                                              brblt_suplr_bill_date,
"
"                                              brblt_curry,
"
"                                              brblt_exchange_rate,
"
"                                              brblt_gross_sc_val,
"
"                                              brblt_gross_bc_val,
"
"                                              brblt_net_sc_val,
"
"                                              brblt_net_bc_val,
"
"                                              brblt_dom_val,
"
"                                              brblt_imp_val,
"
"                                              brblt_tax_val,
"
"                                              brblt_grn_tax_val,
"
"                                              brblt_cre_by,
"
"                                              brblt_cre_date,
"
"                                              brblt_bill_amt_bc,
"
"                                              brblt_bill_amt_tc,
"
"                                              brblt_type,
"
"                                              brblt_grn_refer,
"
"                                              brblt_sub_cls,
"
"                                              brblt_mat_amt,
"
"                                              brblt_status,
"
"                                              brblt_reference,
"
"                                              brblt_recover,
"
"                                              brblt_tds_val,
"
"                                              brblt_tds_pct,
"
"                                              brblt_tds_assbl_val,
"
"                                              brblt_esi_val,
"
"                                              brblt_esi_pct,
"
"                                              brblt_esi_assbl_val,
"
"                                              brblt_state_code,
"
"                                              brblt_suplr_gstin,
"
"                                                brblt_suplr_reg_type,
"
"                                                brblt_suplr_type,
"
"                                                brblt_bill_loc_id,
"
"                                                brblt_grn_pfx,
"
"                                                brblt_grn_no,
"
"                                                brblt_grn_date,
"
"                                                brblt_bill_to_code,
"
"                                                brblt_tds_appl_flag)
"
"                 VALUES (
"
"                           p_bu,
"
"                           p_doc_no,
"
"                           r_btrans_ln.suphd_plant,
"
"                           r_btrans_ln.suphd_plnt_loc_id,
"
"                           r_btrans_ln.suphd_vou_type,
"
"                           r_btrans_ln.suphd_pfx,
"
"                           r_btrans_ln.suphd_doc_no,
"
"                           r_btrans_ln.suphd_doc_date,
"
"                           r_btrans_ln.suphd_doc_type,
"
"                           r_btrans_ln.suphd_doc_mode,
"
"                           r_btrans_ln.suphd_suplr_id,
"
"                           r_btrans_ln.suphd_suplr_name,
"
"                           r_btrans_ln.suphd_suplr_bill_no,
"
"                           r_btrans_ln.suphd_suplr_bill_date,
"
"                           r_btrans_ln.suphd_currency,
"
"                           r_btrans_ln.suphd_exchange_rate,
"
"                           (  ABS (r_btrans_ln.bill_amt_tc)
"
"                            - r_btrans_ln.suphd_tax_val_tc),
"
"                           (  ABS (r_btrans_ln.bill_amt_bc)
"
"                            - r_btrans_ln.suphd_tax_val_bc),
"
"                           (ABS (r_btrans_ln.bill_amt_tc)),
"
"                           (ABS (r_btrans_ln.bill_amt_bc)),
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) =
"
"                                      r_btrans_ln.suphd_currency
"
"                              THEN
"
"                                 (  ABS (r_btrans_ln.bill_amt_bc)
"
"                                  - r_btrans_ln.suphd_tax_val_bc)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           CASE
"
"                              WHEN func_find_base_currency (p_bu) <>
"
"                                      r_btrans_ln.suphd_currency
"
"                              THEN
"
"                                 (  ABS (r_btrans_ln.bill_amt_bc)
"
"                                  - r_btrans_ln.suphd_tax_val_bc)
"
"                              ELSE
"
"                                 0
"
"                           END,
"
"                           r_btrans_ln.suphd_tax_val_tc,
"
"                           r_btrans_ln.suphd_grn_tax_val,
"
"                           p_user,
"
"                           SYSDATE,
"
"                           ABS (r_btrans_ln.bill_amt_bc),
"
"                           ABS (r_btrans_ln.bill_amt_tc),
"
"                           v_type,
"
"                           r_btrans_ln.suphd_grn_refer,
"
"                           v_sub_cls,
"
"                             ABS (r_btrans_ln.bill_amt_bc)
"
"                           - r_btrans_ln.suphd_tax_val_bc,
"
"                           r_btrans_ln.suphd_status,
"
"                           r_btrans_ln.suphd_suplr_reference,
"
"                           r_btrans_ln.recover_flag,
"
"                           r_btrans_ln.tds_value,
"
"                           r_btrans_ln.tds_pct,
"
"                           r_btrans_ln.tds_assbl_val,
"
"                           r_btrans_ln.esi_value,
"
"                           r_btrans_ln.esi_pct,
"
"                           r_btrans_ln.esi_assbl_val,
"
"                           r_btrans_ln.state_code,
"
"                           r_btrans_ln.suphd_gstin_no,
"
"                            r_btrans_ln.suphd_suplr_type,
"
"                            r_btrans_ln.suphd_gst_class,
"
"                            null,--r_btrans_ln.suphd_bill_loc_id,
"
"                             r_btrans_ln.suphd_grn_pfx,
"
"                             r_btrans_ln.suphd_grn_no,
"
"                             r_btrans_ln.suphd_grn_date,
"
"                              r_btrans_ln.suphd_blto_state_code,
"
"                              r_btrans_ln.Suphd_tds_exmp_flag);
"
"
"
"       --  CLOSE c1;
"
"      END LOOP c_btrans_ln;
"
"
"
"   END proc_ins_btrans_lines;
"
"
"
"
"
"
"
"   PROCEDURE proc_ins_bill_register (p_bu           VARCHAR2,
"
"                                     p_doc_no       VARCHAR2,
"
"                                     p_from_date    DATE DEFAULT NULL,
"
"                                     p_to_date      DATE DEFAULT NULL,
"
"                                     p_status       VARCHAR2,
"
"                                     p_type         VARCHAR2,
"
"                                     p_user         VARCHAR2)
"
"   IS
"
"      CURSOR c_bill_reg_ln
"
"      IS
"
"         SELECT brglt_bu,
"
"                brglt_plnt,
"
"                brglt_plnt_loc,
"
"                brglt_inv_date,
"
"                brglt_inv_pfx,
"
"                brglt_inv_no,
"
"                brglt_inv_type,
"
"                brglt_inv_mode,
"
"                brglt_suplr_id,
"
"                brglt_suplr_name,
"
"                brglt_suplr_bill_no,
"
"                brglt_suplr_bill_date,
"
"                brglt_curry,
"
"                brglt_exchange_rate,
"
"                brglt_status,
"
"                brglt_bill_amt_bc,
"
"                brglt_bill_amt_tc,
"
"                brglt_mat_amt,
"
"                brglt_grn_refer,
"
"                brglt_gross_sc_val,
"
"                brglt_gross_bc_val,
"
"                brglt_dom_val,
"
"                brglt_imp_val,
"
"                brglt_tax_val,
"
"                brglt_grn_tax_val,
"
"                brglt_tds_val,
"
"                brglt_tds_pct,
"
"                brglt_tds_assbl_val,
"
"                brglt_esi_val,
"
"                brglt_esi_pct,
"
"                brglt_esi_assbl_val,
"
"                brglt_reference,
"
"                brglt_sub_cls,
"
"                brglt_type,
"
"                brglt_recover,
"
"                brglt_vou_type,
"
"                brglt_net_bc_val,
"
"                brglt_net_sc_val,
"
"                brglt_state_code,
"
"                brglt_grn_type,
"
"                brglt_bill_qty,
"
"                brglt_party_addr,
"
"                brglt_party_pin,
"
"                brglt_party_state,
"
"                brglt_cc_code,
"
"                        brglt_suplr_gstin,
"
"                        brglt_suplr_reg_type,
"
"                        brglt_suplr_type,
"
"                        brglt_bill_loc_id,
"
"                        brglt_grn_pfx,
"
"                            brglt_grn_no,
"
"                            brglt_grn_date,
"
"                            brglt_bill_to_code,
"
"                            BRGLT_TDS_APPL_FLAG
"
"           FROM (SELECT brglt_bu,
"
"                        brglt_plnt,
"
"                        brglt_plnt_loc,
"
"                        brglt_inv_date,
"
"                        brglt_inv_pfx,
"
"                        brglt_inv_no,
"
"                        brglt_inv_type,
"
"                        brglt_inv_mode,
"
"                        brglt_suplr_id,
"
"                        brglt_suplr_name,
"
"                        brglt_suplr_bill_no,
"
"                        brglt_suplr_bill_date,
"
"                        brglt_curry,
"
"                        brglt_exchange_rate,
"
"                        brglt_status,
"
"                        brglt_bill_amt_bc,
"
"                        brglt_bill_amt_tc,
"
"                        brglt_mat_amt,
"
"                        brglt_grn_refer,
"
"                        brglt_gross_sc_val,
"
"                        brglt_gross_bc_val,
"
"                        brglt_dom_val,
"
"                        brglt_imp_val,
"
"                        brglt_tax_val,
"
"                        brglt_grn_tax_val,
"
"                        brglt_tds_val,
"
"                        brglt_tds_pct,
"
"                        brglt_tds_assbl_val,
"
"                        brglt_esi_val,
"
"                        brglt_esi_pct,
"
"                        brglt_esi_assbl_val,
"
"                        brglt_reference,
"
"                        brglt_sub_cls,
"
"                        brglt_type,
"
"                        brglt_recover,
"
"                        brglt_vou_type,
"
"                        brglt_net_bc_val,
"
"                        brglt_net_sc_val,
"
"                        brglt_state_code,
"
"                        brglt_grn_type,
"
"                        brglt_bill_qty,
"
"                        brglt_party_addr,
"
"                        brglt_party_pin,
"
"                        brglt_party_state,
"
"                        brglt_cc_code,
"
"                        brglt_suplr_gstin,
"
"                        brglt_suplr_reg_type,
"
"                        brglt_suplr_type,
"
"                        brglt_bill_loc_id,
"
"                        brglt_grn_pfx,
"
"                        brglt_grn_no,
"
"                        brglt_grn_date,
"
"                        brglt_bill_to_code,
"
"                        BRGLT_TDS_APPL_FLAG
"
"                   FROM bill_reg_grn_ln_temp
"
"                  WHERE     brglt_bu = p_bu
"
"                        AND brglt_doc_no = p_doc_no
"
"                        AND (   brglt_inv_date >= p_from_date
"
"                             OR p_from_date IS NULL)
"
"                        AND (brglt_inv_date <= p_to_date OR p_to_date IS NULL)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM appl_journals_hist
"
"                                 WHERE ajh_bu = brglt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_parameter
"
"                                 WHERE     brp_bu = p_bu
"
"                                       AND brp_doc_no = p_doc_no
"
"                                       AND brp_sel_flg = 'Y'
"
"                                       AND brp_bu = brglt_bu
"
"                                       AND brp_vou_type = brglt_vou_type
"
"                                       AND BRP_CRE_BY=p_user)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_plant
"
"                                 WHERE     brpnt_bu = p_bu
"
"                                       AND brpnt_doc_no = p_doc_no
"
"                                       AND brpnt_sel_flg = 'Y'
"
"                                       AND brpnt_bu = brglt_bu
"
"                                       AND brpnt_plant = brglt_plnt
"
"                                       AND brpnt_plant_loc = brglt_plnt_loc
"
"                                       AND BRPNT_CRE_BY=p_user)
"
"                 UNION ALL
"
"                 SELECT brllt_bu,
"
"                        brllt_plnt,
"
"                        brllt_plnt_loc,
"
"                        brllt_inv_date,
"
"                        brllt_inv_pfx,
"
"                        brllt_inv_no,
"
"                        brllt_inv_type,
"
"                        brllt_inv_mode,
"
"                        brllt_suplr_id,
"
"                        brllt_suplr_name,
"
"                        brllt_suplr_bill_no,
"
"                        brllt_suplr_bill_date,
"
"                        brllt_curry,
"
"                        brllt_exchange_rate,
"
"                        brllt_status,
"
"                        brllt_bill_amt_bc,
"
"                        brllt_bill_amt_tc,
"
"                        brllt_mat_amt,
"
"                        brllt_grn_refer,
"
"                        brllt_gross_sc_val,
"
"                        brllt_gross_bc_val,
"
"                        brllt_dom_val,
"
"                        brllt_imp_val,
"
"                        brllt_tax_val,
"
"                        brllt_grn_tax_val,
"
"                        brllt_tds_val,
"
"                        brllt_tds_pct,
"
"                        brllt_tds_assbl_val,
"
"                        brllt_esi_val,
"
"                        brllt_esi_pct,
"
"                        brllt_esi_assbl_val,
"
"                        brllt_reference,
"
"                        brllt_sub_cls,
"
"                        brllt_type,
"
"                        brllt_recover,
"
"                        brllt_vou_type,
"
"                        brllt_net_bc_val,
"
"                        brllt_net_sc_val,
"
"                        brllt_state_code,
"
"                        NULL brglt_grn_type,
"
"                        0 brglt_bill_qty,
"
"                        NULL brglt_party_addr,
"
"                        NULL brglt_party_pin,
"
"                        NULL brglt_party_state,
"
"                        NULL brglt_cc_code,
"
"                        brllt_suplr_gstin,
"
"                        brllt_suplr_reg_type,
"
"                        brllt_suplr_type,
"
"                        brllt_bill_loc_id,
"
"                        brllt_grn_pfx,
"
"                        brllt_grn_no,
"
"                        brllt_grn_date,
"
"                        brllt_bill_to_code,
"
"                        BRLLT_TDS_APPL_FLAG
"
"                   FROM bill_reg_lc_ln_temp
"
"                  WHERE     brllt_bu = p_bu
"
"                        AND brllt_doc_no = p_doc_no
"
"                        AND (   brllt_inv_date >= p_from_date
"
"                             OR p_from_date IS NULL)
"
"                        AND (brllt_inv_date <= p_to_date OR p_to_date IS NULL)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM appl_journals_hist
"
"                                 WHERE ajh_bu = brllt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gl_accts
"
"                                 WHERE     glac_sub_grp_type NOT IN ('SAP',
"
"                                                                     'SAD',
"
"                                                                     'SAC',
"
"                                                                     'CASH',
"
"                                                                     'TDS',
"
"                                                                     'IMP')
"
"                                       AND glac_bu = brllt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_parameter
"
"                                 WHERE     brp_bu = p_bu
"
"                                       AND brp_doc_no = p_doc_no
"
"                                       AND brp_sel_flg = 'Y'
"
"                                       AND brp_bu = brllt_bu
"
"                                       AND brp_vou_type = brllt_vou_type
"
"                                       AND BRP_CRE_BY=p_user )
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_plant
"
"                                 WHERE     brpnt_bu = p_bu
"
"                                       AND brpnt_doc_no = p_doc_no
"
"                                       AND brpnt_sel_flg = 'Y'
"
"                                       AND brpnt_bu = brllt_bu
"
"                                       AND brpnt_plant = brllt_plnt
"
"                                       AND brpnt_plant_loc = brllt_plnt_loc
"
"                                       AND BRPNT_CRE_BY=p_user)
"
"                 UNION ALL
"
"                 SELECT brprlt_bu,
"
"                        brprlt_plnt,
"
"                        brprlt_plnt_loc,
"
"                        brprlt_inv_date,
"
"                        brprlt_inv_pfx,
"
"                        brprlt_inv_no,
"
"                        brprlt_inv_type,
"
"                        brprlt_inv_mode,
"
"                        brprlt_suplr_id,
"
"                        brprlt_suplr_name,
"
"                        brprlt_suplr_bill_no,
"
"                        brprlt_suplr_bill_date,
"
"                        brprlt_curry,
"
"                        brprlt_exchange_rate,
"
"                        brprlt_status,
"
"                        brprlt_bill_amt_bc,
"
"                        brprlt_bill_amt_tc,
"
"                        brprlt_mat_amt,
"
"                        brprlt_grn_refer,
"
"                        brprlt_gross_sc_val,
"
"                        brprlt_gross_bc_val,
"
"                        brprlt_dom_val,
"
"                        brprlt_imp_val,
"
"                        brprlt_tax_val,
"
"                        brprlt_grn_tax_val,
"
"                        brprlt_tds_val,
"
"                        brprlt_tds_pct,
"
"                        brprlt_tds_assbl_val,
"
"                        brprlt_esi_val,
"
"                        brprlt_esi_pct,
"
"                        brprlt_esi_assbl_val,
"
"                        brprlt_reference,
"
"                        brprlt_sub_cls,
"
"                        brprlt_type,
"
"                        brprlt_recover,
"
"                        brprlt_vou_type,
"
"                        brprlt_net_bc_val,
"
"                        brprlt_net_sc_val,
"
"                        brprlt_state_code,
"
"                        NULL brglt_grn_type,
"
"                        brprlt_bill_qty brglt_bill_qty,
"
"                        NULL brglt_party_addr,
"
"                        NULL brglt_party_pin,
"
"                        NULL brglt_party_state,
"
"                        NULL brglt_cc_code,
"
"                        brprlt_suplr_gstin,
"
"                        brprlt_suplr_reg_type,
"
"                        brprlt_suplr_type,
"
"                        brplt_bill_loc_id,
"
"                        brplt_grn_pfx,
"
"                        brplt_grn_no,
"
"                        brplt_grn_date,
"
"                        brplt_bill_to_code,
"
"                        BRPRLT_TDS_APPL_FLAG
"
"                   FROM bill_reg_pr_ln_temp
"
"                  WHERE     brprlt_bu = p_bu
"
"                        AND brprlt_doc_no = p_doc_no
"
"                        AND (   brprlt_inv_date >= p_from_date
"
"                             OR p_from_date IS NULL)
"
"                        AND (   brprlt_inv_date <= p_to_date
"
"                             OR p_to_date IS NULL)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM appl_journals_hist
"
"                                 WHERE ajh_bu = brprlt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gl_accts
"
"                                 WHERE     glac_sub_grp_type NOT IN ('SAP',
"
"                                                                     'SAD',
"
"                                                                     'SAC',
"
"                                                                     'CASH',
"
"                                                                     'TDS',
"
"                                                                     'IMP')
"
"                                       AND glac_bu = brprlt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_parameter
"
"                                 WHERE     brp_bu = p_bu
"
"                                       AND brp_doc_no = p_doc_no
"
"                                       AND brp_sel_flg = 'Y'
"
"                                       AND brp_bu = brprlt_bu
"
"                                       AND brp_vou_type = brprlt_vou_type
"
"                                        AND BRP_CRE_BY=p_user
"
"                                       )
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_plant
"
"                                 WHERE     brpnt_bu = p_bu
"
"                                       AND brpnt_doc_no = p_doc_no
"
"                                       AND brpnt_sel_flg = 'Y'
"
"                                       AND brpnt_bu = brprlt_bu
"
"                                       AND brpnt_plant = brprlt_plnt
"
"                                       AND brpnt_plant_loc = brprlt_plnt_loc
"
"                                       AND BRPNT_CRE_BY=p_user)
"
"                 UNION ALL
"
"                 SELECT brblt_bu,
"
"                        brblt_plnt,
"
"                        brblt_plnt_loc,
"
"                        brblt_inv_date,
"
"                        brblt_inv_pfx,
"
"                        brblt_inv_no,
"
"                        brblt_inv_type,
"
"                        brblt_inv_mode,
"
"                        brblt_suplr_id,
"
"                        brblt_suplr_name,
"
"                        brblt_suplr_bill_no,
"
"                        brblt_suplr_bill_date,
"
"                        brblt_curry,
"
"                        brblt_exchange_rate,
"
"                        brblt_status,
"
"                        brblt_bill_amt_bc,
"
"                        brblt_bill_amt_tc,
"
"                        brblt_mat_amt,
"
"                        brblt_grn_refer,
"
"                        brblt_gross_sc_val,
"
"                        brblt_gross_bc_val,
"
"                        brblt_dom_val,
"
"                        brblt_imp_val,
"
"                        brblt_tax_val,
"
"                        brblt_grn_tax_val,
"
"                        brblt_tds_val,
"
"                        brblt_tds_pct,
"
"                        brblt_tds_assbl_val,
"
"                        brblt_esi_val,
"
"                        brblt_esi_pct,
"
"                        brblt_esi_assbl_val,
"
"                        brblt_reference,
"
"                        brblt_sub_cls,
"
"                        brblt_type,
"
"                        brblt_recover,
"
"                        brblt_vou_type,
"
"                        brblt_net_bc_val,
"
"                        brblt_net_sc_val,
"
"                        brblt_state_code,
"
"                        NULL brglt_grn_type,
"
"                        0 brglt_bill_qty,
"
"                        NULL brglt_party_addr,
"
"                        NULL brglt_party_pin,
"
"                        NULL brglt_party_state,
"
"                        NULL brglt_cc_code,
"
"                        brblt_suplr_gstin,
"
"                        brblt_suplr_reg_type,
"
"                        brblt_suplr_type,
"
"                        brblt_bill_loc_id,
"
"                        brblt_grn_pfx,
"
"                        brblt_grn_no,
"
"                        brblt_grn_date,
"
"                        brblt_bill_to_code,
"
"                        BRBLT_TDS_APPL_FLAG
"
"                   FROM bill_reg_btrans_ln_temp
"
"                  WHERE     brblt_bu = p_bu
"
"                        AND brblt_doc_no = p_doc_no
"
"                        AND (   brblt_inv_date >= p_from_date
"
"                             OR p_from_date IS NULL)
"
"                        AND (brblt_inv_date <= p_to_date OR p_to_date IS NULL)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM appl_journals_hist
"
"                                 WHERE ajh_bu = brblt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gl_accts
"
"                                 WHERE     glac_sub_grp_type NOT IN ('SAP',
"
"                                                                     'SAD',
"
"                                                                     'SAC',
"
"                                                                     'CASH',
"
"                                                                     'TDS',
"
"                                                                     'IMP')
"
"                                       AND glac_bu = brblt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_parameter
"
"                                 WHERE     brp_bu = p_bu
"
"                                       AND brp_doc_no = p_doc_no
"
"                                       AND brp_sel_flg = 'Y'
"
"                                       AND brp_bu = brblt_bu
"
"                                       AND brp_vou_type = brblt_vou_type
"
"                                        AND BRP_CRE_BY=p_user)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_plant
"
"                                 WHERE     brpnt_bu = p_bu
"
"                                       AND brpnt_doc_no = p_doc_no
"
"                                       AND brpnt_sel_flg = 'Y'
"
"                                       AND brpnt_bu = brblt_bu
"
"                                       AND brpnt_plant = brblt_plnt
"
"                                       AND brpnt_plant_loc = brblt_plnt_loc
"
"                                       AND BRPNT_CRE_BY=p_user)
"
"                 UNION ALL
"
"                 SELECT brppt_bu,
"
"                        brppt_plnt,
"
"                        brppt_plnt_loc,
"
"                        brppt_inv_date,
"
"                        brppt_inv_pfx,
"
"                        brppt_inv_no,
"
"                        brppt_inv_type,
"
"                        brppt_inv_mode,
"
"                        brppt_suplr_id,
"
"                        brppt_suplr_name,
"
"                        brppt_suplr_bill_no,
"
"                        brppt_suplr_bill_date,
"
"                        brppt_curry,
"
"                        brppt_exchange_rate,
"
"                        brppt_status,
"
"                        brppt_bill_amt_bc,
"
"                        brppt_bill_amt_tc,
"
"                        brppt_mat_amt,
"
"                        brppt_grn_refer,
"
"                        brppt_gross_sc_val,
"
"                        brppt_gross_bc_val,
"
"                        brppt_dom_val,
"
"                        brppt_imp_val,
"
"                        brppt_tax_val,
"
"                        brppt_grn_tax_val,
"
"                        brppt_tds_val,
"
"                        brppt_tds_pct,
"
"                        brppt_tds_assbl_val,
"
"                        brppt_esi_val,
"
"                        brppt_esi_pct,
"
"                        brppt_esi_assbl_val,
"
"                        brppt_reference,
"
"                        brppt_sub_cls,
"
"                        brppt_type,
"
"                        brppt_recover,
"
"                        brppt_vou_type,
"
"                        brppt_net_bc_val,
"
"                        brppt_net_sc_val,
"
"                        brppt_state_code,
"
"                        NULL brppt_grn_type,
"
"                        0 brglt_bill_qty,
"
"                        NULL brglt_party_addr,
"
"                        NULL brglt_party_pin,
"
"                        NULL brglt_party_state,
"
"                        NULL brglt_cc_code,
"
"                        brppt_suplr_gstin,
"
"                        brppt_suplr_reg_type,
"
"                        brppt_suplr_type,
"
"                        brppt_bill_loc_id,
"
"                        brppt_grn_pfx,
"
"                        brppt_grn_no,
"
"                        brppt_grn_date,
"
"                        brppt_bill_to_code,
"
"                        BRPPT_TDS_APPL_FLAG
"
"                   FROM bill_reg_proc_pyrl_temp
"
"                  WHERE     brppt_bu = p_bu
"
"                        AND brppt_doc_no = p_doc_no
"
"                        AND (   brppt_inv_date >= p_from_date
"
"                             OR p_from_date IS NULL)
"
"                        AND (brppt_inv_date <= p_to_date OR p_to_date IS NULL)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM appl_journals_hist
"
"                                 WHERE ajh_bu = brppt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gl_accts
"
"                                 WHERE     glac_sub_grp_type NOT IN ('SAP',
"
"                                                                     'SAD',
"
"                                                                     'SAC',
"
"                                                                     'CASH',
"
"                                                                     'TDS',
"
"                                                                     'IMP')
"
"                                       AND glac_bu = brppt_bu)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_parameter
"
"                                 WHERE     brp_bu = p_bu
"
"                                       AND brp_doc_no = p_doc_no
"
"                                       AND brp_sel_flg = 'Y'
"
"                                       AND brp_bu = brppt_bu
"
"                                       AND brp_vou_type = brppt_vou_type
"
"                                        AND BRP_CRE_BY=p_user)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM bill_reg_plant
"
"                                 WHERE     brpnt_bu = p_bu
"
"                                       AND brpnt_doc_no = p_doc_no
"
"                                       AND brpnt_sel_flg = 'Y'
"
"                                       AND brpnt_bu = brppt_bu
"
"                                       AND brpnt_plant = brppt_plnt
"
"                                       AND brpnt_plant_loc = brppt_plnt_loc
"
"                                       AND BRPNT_CRE_BY=p_user));
"
"
"
"      CURSOR c6 (
"
"         c_inv_pfx     VARCHAR2,
"
"         c_inv_no      VARCHAR2,
"
"         c_grn_type    VARCHAR2,
"
"         c_vou_type    VARCHAR2)
"
"      IS
"
"          SELECT ajh_gl_acct ajhv_gl_acct,
"
"                  ajh_gl_acct_desc ajhv_gl_acct_desc,
"
"                  glac_alias_name,
"
"                  --DECODE (SUM (ajh_bc_db_amt), 0, 'CR', 'DR') dr_cr_type,
"
"                  CASE
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) > 0
"
"                     THEN
"
"                        'DR'
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) < 0
"
"                     THEN
"
"                        'CR'
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) = 0
"
"                     THEN
"
"                        'DR'
"
"                  END
"
"                     dr_cr_type,
"
"                  SUM (ajh_bc_db_amt) ajhv_bc_db_amt,
"
"                  SUM (ajh_bc_cr_amt) ajhv_bc_cr_amt,
"
"                  ABS (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) tot_amt,
"
"                  (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) tot_amt1,
"
"                  'T' v_type,
"
"                  ajh_grn_tc_type,
"
"                  'I' sddl_input_type,
"
"                  'G' sddl_gst_type,
"
"                  'A' sddl_inelgbl_type,
"
"                  'A' sddl_inelgbl_sub_type,
"
"                  'N' sddl_comm_cr_type,
"
"                  NULL sddl_Seq_no,
"
"                  'N' sddl_gst_rev_tax_flag,
"
"                  glac_acct_type_code,
"
"                  glac_acct_type,
"
"                  ajh_acctg_plnt
"
"             FROM appl_journals_hist, gl_accts
"
"            WHERE     ajh_bu = glac_bu
"
"                  AND ajh_gl_acct = glac_acct
"
"                  AND ajh_bu = p_bu
"
"                  AND ajh_vou_no = c_inv_no
"
"                  AND ajh_vou_pfx = c_inv_pfx
"
"                  AND c_vou_type NOT IN ('JV', 'PPV')               --, 'APD')
"
"                  AND ajh_vou_pfx IS NOT NULL
"
"                  AND (ajh_grn_tc_type = c_grn_type OR c_grn_type IS NULL)
"
"                  AND (   func_find_glm_gst_flg (p_bu) = 'Y'
"
"                       OR     (    func_find_glm_gst_flg (p_bu) = 'N'
"
"                               AND EXISTS
"
"                                      (SELECT 1
"
"                                         FROM tax_accounts
"
"                                        WHERE     ta_acct_id = ajh_gl_acct
"
"                                              AND ta_bu = ajh_bu))
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gst_ip_op_acct
"
"                                   WHERE     (   gioa_igst_acct = ajh_gl_acct
"
"                                              OR gioa_cgst_acct = ajh_gl_acct
"
"                                              OR gioa_sgst_acct = ajh_gl_acct
"
"                                              OR gioa_utgst_acct = ajh_gl_acct
"
"                                              OR gioa_cess_acct = ajh_gl_acct)
"
"                                         AND gioa_bu = ajh_bu))
"
"                  AND NOT EXISTS
"
"                         (SELECT 1
"
"                            FROM unitwise_accounts
"
"                           WHERE uwa_acct = ajh_gl_acct AND uwa_bu = ajh_bu)
"
"                 AND (    ajh_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'))
"
"         --AND (p_type IS NULL OR (p_type = 'E' AND glac_acct_type = 'E') OR (p_type = 'P' AND glac_acct_type IN ('L','A')))
"
"         GROUP BY ajh_gl_acct,
"
"                  ajh_gl_acct_desc,
"
"                  glac_alias_name,
"
"                  ajh_grn_tc_type,
"
"                  glac_acct_type_code,
"
"                  glac_acct_type,
"
"                  ajh_acctg_plnt
"
"         UNION ALL
"
"           SELECT ajh_gl_acct ajhv_gl_acct,
"
"                  ajh_gl_acct_desc ajhv_gl_acct_desc,
"
"                  glac_alias_name,
"
"                  --DECODE (SUM (ajh_bc_db_amt), 0, 'CR', 'DR') dr_cr_type,
"
"                  CASE
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) > 0
"
"                     THEN
"
"                        'DR'
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) < 0
"
"                     THEN
"
"                        'CR'
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) = 0
"
"                     THEN
"
"                        'DR'
"
"                  END
"
"                     dr_cr_type,
"
"                  SUM (ajh_bc_db_amt) ajhv_bc_db_amt,
"
"                  SUM (ajh_bc_cr_amt) ajhv_bc_cr_amt,
"
"                  ABS (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) tot_amt,
"
"                  (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) tot_amt1,
"
"                  'T' v_type,
"
"                  ajh_grn_tc_type,
"
"                  'I' sddl_input_type,
"
"                  'G' sddl_gst_type,
"
"                  'A' sddl_inelgbl_type,
"
"                  'A' sddl_inelgbl_sub_type,
"
"                  'N' sddl_comm_cr_type,
"
"                  NULL sddl_Seq_no,
"
"                  'N' sddl_gst_rev_tax_flag,
"
"                  glac_acct_type_code,
"
"                  glac_acct_type,
"
"                  ajh_acctg_plnt
"
"             FROM appl_journals_hist, gl_accts
"
"            WHERE     ajh_bu = glac_bu
"
"                  AND ajh_gl_acct = glac_acct
"
"                  AND ajh_bu = p_bu
"
"                  AND ajh_vou_no = c_inv_no
"
"                  AND ajh_vou_pfx = c_inv_pfx
"
"                  AND c_vou_type IN ('JV')
"
"                  AND ajh_vou_pfx IS NOT NULL
"
"                  AND (ajh_grn_tc_type = c_grn_type OR c_grn_type IS NULL)
"
"                  AND (   func_find_glm_gst_flg (p_bu) = 'Y'
"
"                       OR     (    func_find_glm_gst_flg (p_bu) = 'N'
"
"                               AND EXISTS
"
"                                      (SELECT 1
"
"                                         FROM tax_accounts
"
"                                        WHERE     ta_acct_id = ajh_gl_acct
"
"                                              AND ta_bu = ajh_bu))
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gst_ip_op_acct
"
"                                   WHERE     (   gioa_igst_acct = ajh_gl_acct
"
"                                              OR gioa_cgst_acct = ajh_gl_acct
"
"                                              OR gioa_sgst_acct = ajh_gl_acct
"
"                                              OR gioa_utgst_acct = ajh_gl_acct
"
"                                              OR gioa_cess_acct = ajh_gl_acct)
"
"                                         AND gioa_bu = ajh_bu))
"
"                  AND NOT EXISTS
"
"                         (SELECT 1
"
"                            FROM unitwise_accounts
"
"                           WHERE uwa_acct = ajh_gl_acct AND uwa_bu = ajh_bu)
"
"                 AND (    ajh_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'))
"
"         --AND (p_type IS NULL OR (p_type = 'E' AND glac_acct_type = 'E') OR (p_type = 'P' AND glac_acct_type IN ('L','A')))
"
"         GROUP BY ajh_gl_acct,
"
"                  ajh_gl_acct_desc,
"
"                  glac_alias_name,
"
"                  ajh_grn_tc_type,
"
"                  glac_acct_type_code,
"
"                  glac_acct_type,
"
"                  ajh_acctg_plnt
"
"         UNION ALL
"
"           SELECT ajh_gl_acct ajhv_gl_acct,
"
"                  ajh_gl_acct_desc ajhv_gl_acct_desc,
"
"                  glac_alias_name,
"
"                  --DECODE (SUM (ajh_bc_db_amt), 0, 'CR', 'DR') dr_cr_type,
"
"                  CASE
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) > 0
"
"                     THEN
"
"                        'DR'
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) < 0
"
"                     THEN
"
"                        'CR'
"
"                     WHEN (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) = 0
"
"                     THEN
"
"                        'DR'
"
"                  END
"
"                     dr_cr_type,
"
"                  SUM (ajh_bc_db_amt) ajhv_bc_db_amt,
"
"                  SUM (ajh_bc_cr_amt) ajhv_bc_cr_amt,
"
"                  ABS (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) tot_amt,
"
"                  (SUM (ajh_bc_db_amt) - SUM (ajh_bc_cr_amt)) tot_amt1,
"
"                  'T' v_type,
"
"                  ajh_grn_tc_type,
"
"                  'I' sddl_input_type,
"
"                  'G' sddl_gst_type,
"
"                  'A' sddl_inelgbl_type,
"
"                  'A' sddl_inelgbl_sub_type,
"
"                  'N' sddl_comm_cr_type,
"
"                  NULL sddl_Seq_no,
"
"                  'N' sddl_gst_rev_tax_flag,
"
"                  glac_acct_type_code,
"
"                  glac_acct_type,
"
"                  ajh_acctg_plnt
"
"             FROM appl_journals_hist, gl_accts
"
"            WHERE     ajh_bu = glac_bu
"
"                  AND ajh_gl_acct = glac_acct
"
"                  AND ajh_bu = p_bu
"
"                  AND ajh_vou_no = c_inv_no
"
"                  AND c_vou_type IN ('PPV')
"
"                  AND ajh_vou_pfx IS NULL
"
"                  AND (ajh_grn_tc_type = c_grn_type OR c_grn_type IS NULL)
"
"                  AND (   func_find_glm_gst_flg (p_bu) = 'Y'
"
"                       OR     (    func_find_glm_gst_flg (p_bu) = 'N'
"
"                               AND EXISTS
"
"                                      (SELECT 1
"
"                                         FROM tax_accounts
"
"                                        WHERE     ta_acct_id = ajh_gl_acct
"
"                                              AND ta_bu = ajh_bu))
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gst_ip_op_acct
"
"                                   WHERE     (   gioa_igst_acct = ajh_gl_acct
"
"                                              OR gioa_cgst_acct = ajh_gl_acct
"
"                                              OR gioa_sgst_acct = ajh_gl_acct
"
"                                              OR gioa_utgst_acct = ajh_gl_acct
"
"                                              OR gioa_cess_acct = ajh_gl_acct)
"
"                                         AND gioa_bu = ajh_bu))
"
"                  AND NOT EXISTS
"
"                         (SELECT 1
"
"                            FROM unitwise_accounts
"
"                           WHERE uwa_acct = ajh_gl_acct AND uwa_bu = ajh_bu)
"
"                 AND (    ajh_gl_lvl1 IN (SELECT brl1_lvl_id
"
"                                            FROM bill_reg_lvl1
"
"                                           WHERE     brl1_bu = p_bu
"
"                                                 AND brl1_cre_by = p_user
"
"                                                 AND brl1_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl2 IN (SELECT brl2_lvl_id
"
"                                            FROM bill_reg_lvl2
"
"                                           WHERE     brl2_bu = p_bu
"
"                                                 AND brl2_cre_by = p_user
"
"                                                 AND brl2_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl3 IN (SELECT brl3_lvl_id
"
"                                            FROM bill_reg_lvl3
"
"                                           WHERE     brl3_bu = p_bu
"
"                                                 AND brl3_cre_by = p_user
"
"                                                 AND brl3_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl4 IN (SELECT brl4_lvl_id
"
"                                            FROM bill_reg_lvl4
"
"                                           WHERE     brl4_bu = p_bu
"
"                                                 AND brl4_cre_by = p_user
"
"                                                 AND brl4_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl5 IN (SELECT brl5_lvl_id
"
"                                            FROM bill_reg_lvl5
"
"                                           WHERE     brl5_bu = p_bu
"
"                                                 AND brl5_cre_by = p_user
"
"                                                 AND brl5_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl6 IN (SELECT brl6_lvl_id
"
"                                            FROM bill_reg_lvl6
"
"                                           WHERE     brl6_bu = p_bu
"
"                                                 AND brl6_cre_by = p_user
"
"                                                 AND brl6_sel_flag = 'Y')
"
"                     AND ajh_gl_lvl_prj IN (SELECT brlp_lvl_id
"
"                                               FROM bill_reg_lvl_prj
"
"                                              WHERE     brlp_bu = p_bu
"
"                                                    AND brlp_cre_by = p_user
"
"                                                    AND brlp_sel_flag = 'Y'))
"
"         --AND (p_type IS NULL OR (p_type = 'E' AND glac_acct_type = 'E') OR (p_type = 'P' AND glac_acct_type IN ('L','A')))
"
"         GROUP BY ajh_gl_acct,
"
"                  ajh_gl_acct_desc,
"
"                  glac_alias_name,
"
"                  ajh_grn_tc_type,
"
"                  glac_acct_type_code,
"
"                  glac_acct_type,
"
"                  ajh_acctg_plnt;
"
"
"
"
"
"      CURSOR c7 (
"
"         c_plnt      VARCHAR2,
"
"         c_pfx       VARCHAR2,
"
"         c_doc_no    VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM bill_item_line_temp
"
"          WHERE     bilt_bu = p_bu
"
"                AND bilt_doc_no = p_doc_no
"
"                AND bilt_plnt = c_plnt
"
"                AND bilt_inv_pfx = c_pfx
"
"                AND bilt_inv_no = c_doc_no
"
"                AND EXISTS
"
"                       (SELECT 1
"
"                          FROM bill_reg_plant
"
"                         WHERE     brpnt_bu = p_bu
"
"                               AND brpnt_doc_no = p_doc_no
"
"                               AND brpnt_sel_flg = 'Y'
"
"                               AND brpnt_bu = bilt_bu
"
"                               AND brpnt_plant = bilt_plnt
"
"                               AND BRPNT_CRE_BY=p_user);
"
"
"
"     -- cr3          c3%ROWTYPE;
"
"      var_seq_no   NUMBER;
"
"   BEGIN
"
"      DELETE bill_reg_ln
"
"       WHERE brln_bu = p_bu AND brln_doc_no = p_doc_no AND brln_cre_by=p_user;
"
"
"
"      DELETE bill_item_lines
"
"       WHERE bil_bu = p_bu AND bil_doc_no = p_doc_no AND bil_cre_by = p_user;
"
"
"
"      DELETE bill_reg_tax
"
"       WHERE brtax_bu = p_bu AND brtax_doc_no = p_doc_no AND brtax_cre_by=p_user;
"
"
"
"      DELETE bill_reg_acct
"
"       WHERE bract_bu = p_bu AND bract_doc_no = p_doc_no AND bract_cre_by=p_user;
"
"
"
"      FOR r_bill_reg_ln IN c_bill_reg_ln
"
"      LOOP
"
"--          proc_debug_proc(r_bill_reg_ln.brglt_bill_loc_id||'/'||'HRM');
"
"         INSERT /*+ append */
"
"               INTO  bill_reg_ln (brln_bu,
"
"                                  brln_doc_no,
"
"                                  brln_plnt,
"
"                                  brln_plnt_loc,
"
"                                  brln_vou_type,
"
"                                  brln_inv_pfx,
"
"                                  brln_inv_no,
"
"                                  brln_inv_date,
"
"                                  brln_inv_type,
"
"                                  brln_inv_mode,
"
"                                  brln_suplr_id,
"
"                                  brln_suplr_name,
"
"                                  brln_suplr_bill_no,
"
"                                  brln_suplr_bill_date,
"
"                                  brln_curry,
"
"                                  brln_exchange_rate,
"
"                                  brln_gross_sc_val,
"
"                                  brln_gross_bc_val,
"
"                                  brln_net_sc_val,
"
"                                  brln_net_bc_val,
"
"                                  brln_dom_val,
"
"                                  brln_imp_val,
"
"                                  brln_tax_val,
"
"                                  brln_grn_tax_val,
"
"                                  brln_cre_by,
"
"                                  brln_cre_date,
"
"                                  brln_bill_amt_bc,
"
"                                  brln_bill_amt_tc,
"
"                                  brln_type,
"
"                                  brln_grn_refer,
"
"                                  brln_sub_cls,
"
"                                  brln_mat_amt,
"
"                                  brln_status,
"
"                                  brln_reference,
"
"                                  brln_recover,
"
"                                  brln_tds_val,
"
"                                  brln_tds_pct,
"
"                                  brln_tds_assbl_val,
"
"                                  brln_esi_val,
"
"                                  brln_esi_pct,
"
"                                  brln_esi_assbl_val,
"
"                                  brln_state_code,
"
"                                  brln_grn_type,
"
"                                  brln_bill_qty,
"
"                                  brln_party_addr,
"
"                                  brln_party_pin,
"
"                                  brln_party_state,
"
"                                  brln_suplr_cc_code,
"
"                                  brln_suplr_gstin,
"
"                                    brln_suplr_reg_type,
"
"                                    brln_suplr_type,
"
"                                    brln_bill_loc_id,
"
"                                    brln_grn_pfx,
"
"                                brln_grn_no,
"
"                                brln_grn_date,
"
"                                brln_bill_to_code,
"
"                                brln_tds_appl_flag)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      r_bill_reg_ln.brglt_plnt,
"
"                      r_bill_reg_ln.brglt_plnt_loc,
"
"                      r_bill_reg_ln.brglt_vou_type,
"
"                      r_bill_reg_ln.brglt_inv_pfx,
"
"                      r_bill_reg_ln.brglt_inv_no,
"
"                      r_bill_reg_ln.brglt_inv_date,
"
"                      r_bill_reg_ln.brglt_inv_type,
"
"                      r_bill_reg_ln.brglt_inv_mode,
"
"                      r_bill_reg_ln.brglt_suplr_id,
"
"                      r_bill_reg_ln.brglt_suplr_name,
"
"                      r_bill_reg_ln.brglt_suplr_bill_no,
"
"                      r_bill_reg_ln.brglt_suplr_bill_date,
"
"                      r_bill_reg_ln.brglt_curry,
"
"                      r_bill_reg_ln.brglt_exchange_rate,
"
"                      r_bill_reg_ln.brglt_gross_sc_val,
"
"                      r_bill_reg_ln.brglt_gross_bc_val,
"
"                      r_bill_reg_ln.brglt_net_sc_val,
"
"                      r_bill_reg_ln.brglt_net_bc_val,
"
"                      r_bill_reg_ln.brglt_dom_val,
"
"                      r_bill_reg_ln.brglt_imp_val,
"
"                      r_bill_reg_ln.brglt_tax_val,
"
"                      r_bill_reg_ln.brglt_grn_tax_val,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      r_bill_reg_ln.brglt_bill_amt_bc,
"
"                      r_bill_reg_ln.brglt_bill_amt_tc,
"
"                      r_bill_reg_ln.brglt_type,
"
"                      r_bill_reg_ln.brglt_grn_refer,
"
"                      r_bill_reg_ln.brglt_sub_cls,
"
"                      r_bill_reg_ln.brglt_mat_amt,
"
"                      r_bill_reg_ln.brglt_status,
"
"                      r_bill_reg_ln.brglt_reference,
"
"                      r_bill_reg_ln.brglt_recover,
"
"                      r_bill_reg_ln.brglt_tds_val,
"
"                      r_bill_reg_ln.brglt_tds_pct,
"
"                      r_bill_reg_ln.brglt_tds_assbl_val,
"
"                      r_bill_reg_ln.brglt_esi_val,
"
"                      r_bill_reg_ln.brglt_esi_pct,
"
"                      r_bill_reg_ln.brglt_esi_assbl_val,
"
"                      r_bill_reg_ln.brglt_state_code,
"
"                      r_bill_reg_ln.brglt_grn_type,
"
"                      r_bill_reg_ln.brglt_bill_qty,
"
"                      r_bill_reg_ln.brglt_party_addr,
"
"                      r_bill_reg_ln.brglt_party_pin,
"
"                      r_bill_reg_ln.brglt_party_state,
"
"                      r_bill_reg_ln.brglt_cc_code,
"
"                      r_bill_reg_ln.brglt_suplr_gstin,
"
"                        r_bill_reg_ln.brglt_suplr_reg_type,
"
"                        r_bill_reg_ln.brglt_suplr_type,
"
"                        r_bill_reg_ln.brglt_bill_loc_id,
"
"                        r_bill_reg_ln.brglt_grn_pfx,
"
"                        r_bill_reg_ln.brglt_grn_no,
"
"                        r_bill_reg_ln.brglt_grn_date,
"
"                        r_bill_reg_ln.brglt_bill_to_code,
"
"                         r_bill_reg_ln.brglt_tds_appl_flag);
"
"
"
"
"
"         FOR cr7
"
"            IN c7 (r_bill_reg_ln.brglt_plnt,
"
"                   r_bill_reg_ln.brglt_inv_pfx,
"
"                   r_bill_reg_ln.brglt_inv_no)
"
"         LOOP
"
"            INSERT INTO bill_item_lines (bil_bu,
"
"                                         bil_doc_no,
"
"                                         bil_plnt,
"
"                                         bil_inv_pfx,
"
"                                         bil_inv_no,
"
"                                         bil_prod_id,
"
"                                         bil_prod_rev,
"
"                                         bil_prod_desc1,
"
"                                         bil_pur_cls,
"
"                                         bil_receipt_qty,
"
"                                         bil_invoiced_qty,
"
"                                         bil_inv_qty,
"
"                                         bil_unit_cost,
"
"                                         bil_ln_amt,
"
"                                         bil_acct,
"
"                                         bil_cl_id,
"
"                                         bil_par_cl_id,
"
"                                         bil_cre_by,
"
"                                         bil_cre_date,
"
"                                         bil_input_type,
"
"                                         bil_tax_exmpt_flag,
"
"                                         bil_inelgbl_type,
"
"                                         bil_inelgbl_sub_type,
"
"                                         bil_seq_no,
"
"                                         bil_rcm_flag,
"
"                                         bil_gst_rate,
"
"                                         bil_cgst_amt,
"
"                                         bil_sgst_amt,
"
"                                         bil_igst_amt,
"
"                                         bil_utgst_amt,
"
"                                         bil_hsn_code,
"
"                                         bil_uom,
"
"                                         bil_gstin_no,
"
"                                         bil_suplr_type,
"
"                                         bil_gst_class,
"
"                                         bil_gst_rev_tax_flag,
"
"                                         bil_gst_type,
"
"                                         bil_state_code,
"
"                                         bil_state_code_desc,
"
"                                         bil_cc_code,
"
"                                         bil_rcm_cat,
"
"                                         bil_cgst_rate,
"
"                                        bil_sgst_rate,
"
"                                        bil_igst_rate,
"
"                                        bil_utgst_rate,
"
"                                        bil_grn_tax_val)
"
"                 VALUES (cr7.bilt_bu,
"
"                         cr7.bilt_doc_no,
"
"                         cr7.bilt_plnt,
"
"                         cr7.bilt_inv_pfx,
"
"                         cr7.bilt_inv_no,
"
"                         cr7.bilt_prod_id,
"
"                         cr7.bilt_prod_rev,
"
"                         cr7.bilt_prod_desc1,
"
"                         cr7.bilt_pur_cls,
"
"                         cr7.bilt_receipt_qty,
"
"                         cr7.bilt_invoiced_qty,
"
"                         cr7.bilt_inv_qty,
"
"                         cr7.bilt_unit_cost,
"
"                         cr7.bilt_ln_amt,
"
"                         cr7.bilt_acct,
"
"                         cr7.bilt_cl_id,
"
"                         cr7.bilt_par_cl_id,
"
"                         cr7.bilt_cre_by,
"
"                         cr7.bilt_cre_date,
"
"                         cr7.bilt_input_type,
"
"                         cr7.bilt_tax_exmpt_flag,
"
"                         cr7.bilt_inelgbl_type,
"
"                         cr7.bilt_inelgbl_sub_type,
"
"                         cr7.bilt_seq_no,
"
"                         cr7.bilt_rcm_flag,
"
"                         cr7.bilt_gst_rate,
"
"                         cr7.bilt_cgst_amt,
"
"                         cr7.bilt_sgst_amt,
"
"                         cr7.bilt_igst_amt,
"
"                         cr7.bilt_utgst_amt,
"
"                         cr7.bilt_hsn_code,
"
"                         cr7.bilt_uom,
"
"                         cr7.bilt_gstin_no,
"
"                         cr7.bilt_suplr_type,
"
"                         cr7.bilt_gst_class,
"
"                         cr7.bilt_gst_rev_tax_flag,
"
"                         cr7.bilt_gst_type,
"
"                         cr7.bilt_state_code,
"
"                         cr7.bilt_state_code_desc,
"
"                         cr7.bilt_cc_code,
"
"                         cr7.bilt_rcm_cat,
"
"                         cr7.bilt_cgst_rate,
"
"                        cr7.bilt_sgst_rate,
"
"                        cr7.bilt_igst_rate,
"
"                        cr7.bilt_utgst_rate,
"
"                        CR7.bilt_grn_tax_val);
"
"         END LOOP;
"
"
"
"         FOR cr6 IN c6 (r_bill_reg_ln.brglt_inv_pfx,
"
"                        r_bill_reg_ln.brglt_inv_no,
"
"                        r_bill_reg_ln.brglt_grn_type,
"
"                        r_bill_reg_ln.brglt_vou_type)
"
"         LOOP
"
"            INSERT INTO bill_reg_acct (bract_bu,
"
"                                       bract_doc_no,
"
"                                       bract_inv_pfx,
"
"                                       bract_inv_no,
"
"                                       bract_acct_id,
"
"                                       bract_acct_desc,
"
"                                       bract_alias_name,
"
"                                       bract_dr_cr,
"
"                                       bract_db_amt,
"
"                                       bract_cr_amt,
"
"                                       bract_amt,
"
"                                       bract_cre_by,
"
"                                       bract_cre_date,
"
"                                       bract_type,
"
"                                       bract_grn_type,
"
"                                       bract_input_type,
"
"                                       bract_gst_type,
"
"                                       bract_inelgbl_type,
"
"                                       bract_inelgbl_sub_type,
"
"                                       bract_comm_cr_type,
"
"                                       bract_seq_no,
"
"                                       bract_rcm_flag,
"
"                                       bract_acct_type_code,
"
"                                       bract_acct_type,
"
"                                       bract_plnt)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         r_bill_reg_ln.brglt_inv_pfx,
"
"                         r_bill_reg_ln.brglt_inv_no,
"
"                         cr6.ajhv_gl_acct,
"
"                         cr6.ajhv_gl_acct_desc,
"
"                         SUBSTR (cr6.glac_alias_name, 1, 30),
"
"                         cr6.dr_cr_type,
"
"                         cr6.tot_amt,                    --cr6.ajhv_bc_db_amt,
"
"                         cr6.tot_amt,                    --cr6.ajhv_bc_cr_amt,
"
"                         cr6.tot_amt1,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr6.v_type,
"
"                         cr6.ajh_grn_tc_type,
"
"                         cr6.sddl_input_type,
"
"                         cr6.sddl_gst_type,
"
"                         cr6.sddl_inelgbl_type,
"
"                         cr6.sddl_inelgbl_sub_type,
"
"                         cr6.sddl_comm_cr_type,
"
"                         cr6.sddl_Seq_no,
"
"                         cr6.sddl_gst_rev_tax_flag,
"
"                         cr6.glac_acct_type_code,
"
"                         cr6.glac_acct_type,
"
"                         cr6.ajh_acctg_plnt);
"
"         END LOOP c6;
"
"
"
"      END LOOP c_bill_reg_ln;
"
"   END proc_ins_bill_register;
"
"
"
"   PROCEDURE proc_upd_party_details (
"
"      p_bu        bill_reg_hd.brhd_bu%TYPE,
"
"      p_doc_no    bill_reg_hd.brhd_doc_no%TYPE,
"
"      p_user      appl_users.appluser_id%TYPE)
"
"   AS
"
"   BEGIN
"
"      UPDATE bill_reg_acct
"
"         SET (bract_party_id, bract_party_type, bract_party_name) =
"
"                (SELECT spla_suplr_id, p_type, suplr_name1
"
"                   FROM ( (SELECT spla_suplr_id,
"
"                                  'S' p_type,
"
"                                  suplr_name1,
"
"                                  ROW_NUMBER ()
"
"                                  OVER (PARTITION BY spla_acct
"
"                                        ORDER BY spla_suplr_id)
"
"                                     rnum
"
"                             FROM suplr_plant_accts, suppliers
"
"                            WHERE     spla_bu = suplr_bu
"
"                                  AND spla_suplr_id = suplr_suplr_id
"
"                                  AND suplr_status = 'A'
"
"                                  AND suplr_party_type IN ('M', 'S', 'K')
"
"                                  AND spla_bu = p_bu
"
"                                  AND spla_acct = bract_acct_id
"
"                                  AND spla_lgr_type = bract_acct_type_code
"
"                                  AND (   spla_plnt = bract_plnt
"
"                                       OR spla_plnt IS NULL)
"
"                                  AND bract_acct_type IN ('L', 'A')
"
"                           UNION ALL
"
"                           SELECT spla_suplr_id,
"
"                                  'C' p_type,
"
"                                  suplr_name1,
"
"                                  ROW_NUMBER ()
"
"                                  OVER (PARTITION BY spla_acct
"
"                                        ORDER BY spla_suplr_id)
"
"                                     rnum
"
"                             FROM suplr_plant_accts, suppliers
"
"                            WHERE     spla_bu = suplr_bu
"
"                                  AND spla_suplr_id = suplr_suplr_id
"
"                                  AND suplr_status = 'A'
"
"                                  AND suplr_party_type='C'
"
"                                  AND spla_bu = p_bu
"
"                                  AND spla_acct = bract_acct_id
"
"                                  AND spla_lgr_type = bract_acct_type_code
"
"                                  AND (   spla_plnt = bract_plnt
"
"                                       OR spla_plnt IS NULL)
"
"                                  AND bract_acct_type IN ('L', 'A')))
"
"                  WHERE rnum = 1)
"
"       WHERE     bract_bu = p_bu
"
"             AND bract_doc_no = p_doc_no
"
"             AND bract_acct_type_code IN ('AP',
"
"                                          'SAD',
"
"                                          'SSD',
"
"                                          'AR',
"
"                                          'CAD',
"
"                                          'CSD',
"
"                                          'EMD',
"
"                                          'PBG',
"
"                                          'RET');
"
"
"
"      UPDATE bill_reg_acct
"
"         SET (bract_gstin_no, bract_pan_no) =
"
"                (SELECT (SELECT DISTINCT ajh_gstin_no
"
"                           FROM appl_journals_hist
"
"                          WHERE     ajh_bu = p_bu
"
"                               -- AND aj_vou_type = gjlh_vou_type
"
"                                AND ajh_vou_pfx = bract_inv_pfx
"
"                                AND ajh_vou_no = bract_inv_no
"
"                                AND NVL (ajh_suplr_id, ajh_cust_id) =
"
"                                       bract_party_id
"
"                                       and rownum =1),
"
"                        (SELECT DISTINCT SUBSTR (ajh_gstin_no, 3, 10)
"
"                           FROM appl_journals_hist
"
"                          WHERE     ajh_bu = p_bu
"
"                                --AND aj_vou_type = gjlh_vou_type
"
"                                AND ajh_vou_pfx = bract_inv_pfx
"
"                                AND ajh_vou_no = bract_inv_no
"
"                                AND NVL (ajh_suplr_id, ajh_cust_id) =
"
"                                       bract_party_id
"
"                                       and rownum =1)
"
"                   FROM DUAL)
"
"       WHERE     bract_bu = p_bu
"
"             AND bract_doc_no = p_doc_no
"
"             AND bract_party_id IS NOT NULL;
"
"
"
"      UPDATE bill_reg_ln
"
"         SET (brln_party_type,
"
"              brln_party_id,
"
"              brln_party_name,
"
"              brln_gstin_no,
"
"              brln_pan_no,
"
"              brln_gross_amt) =
"
"                (SELECT bract_party_type,
"
"                        bract_party_id,
"
"                           bract_party_name
"
"                        || CASE WHEN cnt <> 1 THEN '; MORE(+) EXISTS..' END
"
"                           AS bract_party_name,
"
"                        bract_gstin_no,
"
"                        bract_pan_no,
"
"                        CASE
"
"                           WHEN brln_vou_type = 'JV' THEN brln_bill_amt_bc
"
"                           ELSE amt
"
"                        END
"
"                   FROM (SELECT bract_party_type,
"
"                                bract_party_id,
"
"                                bract_party_name,
"
"                                bract_gstin_no,
"
"                                bract_pan_no,
"
"                                ROW_NUMBER ()
"
"                                OVER (
"
"                                   PARTITION BY bract_inv_pfx, bract_inv_no
"
"                                   ORDER BY
"
"                                      bract_inv_pfx,
"
"                                      bract_inv_no,
"
"                                      bract_party_type DESC)
"
"                                   rnum,
"
"                                COUNT (
"
"                                   *)
"
"                                OVER (
"
"                                   PARTITION BY bract_inv_pfx, bract_inv_no)
"
"                                   cnt,
"
"                                NVL (
"
"                                   SUM (
"
"                                      bract_amt)
"
"                                   OVER (
"
"                                      PARTITION BY bract_inv_pfx,
"
"                                                   bract_inv_no),
"
"                                   0)
"
"                                   amt
"
"                           FROM bill_reg_acct
"
"                          WHERE     bract_bu = p_bu
"
"                                AND bract_doc_no = p_doc_no
"
"                                AND bract_inv_pfx = brln_inv_pfx
"
"                                AND bract_inv_no = brln_inv_no
"
"                                AND bract_party_type IS NOT NULL)
"
"                  WHERE rnum = 1)
"
"       WHERE brln_bu = p_bu AND brln_doc_no = p_doc_no;
"
"   END proc_upd_party_details;
"
"
"
" PROCEDURE proc_upd_tax_amt_xpns (p_bu        VARCHAR2,
"
"                                    p_doc_no    VARCHAR2,
"
"                                    p_user      VARCHAR2)
"
"   IS
"
"
"
"   CURSOR C1
"
"   IS
"
"   SELECT brln_inv_pfx,
"
"          brln_inv_no
"
"     FROM bill_reg_ln
"
"    WHERE brln_bu = p_bu
"
"      AND brln_doc_no = p_doc_no
"
"      AND brln_cre_by = p_user;
"
"
"
"   CURSOR C2(c_pfx   varchar2,c_doc_no varchar2 )
"
"   IS
"
"    SELECT SUPLNH_PLNT,
"
"                 -- sddlh_pfx,
"
"                  SUPLNH_DOC_NO,
"
"                  glac_acct_desc1,
"
"                   SUPLNH_UNIT_COST amt, -- (SDDLH_SC_AMOUNT * suphdh_exchange_rate)  amt,
"
"                  SUPLNH_AP_GL_ACCT,
"
"                  glac_cl_id,
"
"                  suplnh_input_type,
"
"                  suplnh_exmpt_tc_flag,
"
"                  SUPLNH_inelgbl_sub_type,
"
"                  SUPLNH_inelgbl_type,
"
"                  1,
"
"                  NVL (SUPLNH_RECOVER_FLAG, 'N')  sdtch_recover_flag,
"
"                  SUPLNH_TAX_PCT,
"
"                  SUM(NVL(SUPLNH_CGST_AMT,0))   cgst,
"
"                (CASE
"
"                        WHEN SUPLNH_CGST_AMT > 0
"
"                        THEN
"
"                           SUPLNH_TAX_PCT
"
"                        ELSE
"
"                           0
"
"                     END)   cgst_rate,
"
"                  SUM(NVL(SUPLNH_SGST_AMT,0)) sgst,
"
"                     (CASE
"
"                        WHEN SUPLNH_SGST_AMT > 0
"
"                        THEN
"
"                           SUPLNH_SGST_AMT
"
"                        ELSE
"
"                           0
"
"                     END) sgst_rate,
"
"                  SUM(NVL(SUPLNH_IGST_AMT,0)) igst,
"
"                 (CASE
"
"                        WHEN SUPLNH_IGST_AMT > 0
"
"                        THEN
"
"                           SUPLNH_TAX_PCT
"
"                        ELSE
"
"                           0
"
"                     END) igst_rate,
"
"                  sum(NVL(SUPLNH_UTGST_AMT,0)) utgst,
"
"                (CASE
"
"                        WHEN SUPLNH_UTGST_AMT >0
"
"                        THEN
"
"                           SUPLNH_TAX_PCT
"
"                        ELSE
"
"                           0
"
"                     END) utgst_rate,
"
"                  suphdh_gstin_no,
"
"                  suphdh_suplr_type,
"
"                  suphdh_gst_class,
"
"                  SUPLNH_gst_rev_tax_flag,
"
"                  suphdh_gst_type,
"
"                  suphdh_state_code,
"
"                  (SELECT DISTINCT state_name1
"
"                     FROM states
"
"                    WHERE state_code = suphdh_state_code AND ROWNUM = 1) state_name,
"
"                    SUPLNH_AP_CC_CODE,
"
"                    suphdh_blto_state_code,
"
"                    Suphdh_tds_flag
"
"             FROM suplr_doc_hd_hist,
"
"                  SUPLR_DOC_LN_HIST,
"
"                 -- suplr_doc_dist_ln_hist,
"
"                 -- suplr_doc_tax_charges_hist,
"
"                  gl_accts
"
"                  --tax_charges,
"
"                  --tax_charges_types
"
"            WHERE     suphdh_bu = SUPLNH_BU
"
"                 -- AND suphdh_pfx = sddlh_pfx
"
"                  AND suphdh_doc_no = SUPLNH_DOC_NO
"
"                 -- AND sddlh_bu = sdtch_bu(+)
"
"                  --AND sddlh_pfx = sdtch_pfx(+)
"
"                 -- AND sddlh_doc_no = sdtch_doc_no(+)
"
"                 -- AND sddlh_seq_no = sdtch_dist_seq_no(+)
"
"                  AND SUPLNH_BU = glac_bu(+)
"
"                  AND SUPLNH_AP_GL_ACCT = glac_acct(+)
"
"                  AND glac_sub_grp_type IN ('LNL',
"
"                                            'SL',
"
"                                            'UL',
"
"                                            'IVS',
"
"                                            'STK',
"
"                                            'P',
"
"                                            'S',
"
"                                            'DE',
"
"                                            'DNT',
"
"                                            'OTHR',
"
"                                            'PCK',
"
"                                            'BDS',
"
"                                            'FA')
"
"                --  AND sdtch_bu = tc_bu(+)
"
"                --  AND sdtch_tc_id = tc_tc_id(+)
"
"                 -- AND tc_bu = tctype_bu(+)
"
"                 -- AND tc_type_id = tctype_id(+)
"
"                  AND suphdh_bu = P_BU
"
"                  AND suphdh_pfx = c_pfx
"
"                  AND suphdh_doc_no = c_doc_no
"
"         GROUP BY SUPLNH_PLNT,
"
"                 -- sddlh_pfx,
"
"                  SUPLNH_DOC_NO,
"
"                  SUPLNH_AP_GL_ACCT,
"
"                  glac_acct_desc1,
"
"                  glac_cl_id,
"
"                  suplnh_recover_flag,
"
"                  SUPLNH_TAX_PCT,
"
"                  SUPLNH_UNIT_COST,
"
"                  suphdh_gstin_no,
"
"                  suphdh_suplr_type,
"
"                  suphdh_gst_class,
"
"                  suplnh_gst_rev_tax_flag,
"
"                  suphdh_gst_type,
"
"                  suphdh_state_code,
"
"                  suphdh_exchange_rate,
"
"                  suplnh_input_type,
"
"                  suplnh_exmpt_tc_flag,
"
"                  suplnh_inelgbl_sub_type,
"
"                  suplnh_inelgbl_type,
"
"                  SUPLNH_AP_CC_CODE,
"
"                  suphdh_blto_state_code,
"
"                  SUPLNH_TAX_PCT,
"
"                  SUPLNH_UTGST_AMT,
"
"                  SUPLNH_CGST_AMT,
"
"                  SUPLNH_IGST_AMT,
"
"                  SUPLNH_SGST_AMT,
"
"                  Suphdh_tds_flag;
"
"                 -- tctype_id
"
"
"
"     CURSOR C3(c_pfx  varchar2,c_doc_no varchar2)
"
"     IS
"
"       SELECT BTDLNH_PLANT,
"
"                 -- btdlnh_ord_pfx,
"
"                  btdlnh_ord_no,
"
"                  glac_acct_desc1,
"
"                 ( btdlnh_dist_amt * btln_exrate)  amt,
"
"                  btdlnh_acct,
"
"                  glac_cl_id,
"
"                  btdlnh_input_type,
"
"                  btdlnh_exmpt_flag,
"
"                  1,
"
"                  'Y'  bttc_recover_flag,
"
"                  BTDLNH_TAX_PCT,
"
"                  SUM (NVL(BTDLNH_CGST_AMT,0) )  cgst,
"
"                       (CASE
"
"                        WHEN BTDLNH_CGST_AMT > 0 THEN BTDLNH_TAX_PCT
"
"                        ELSE 0
"
"                     END)  cgst_rate,
"
"                  SUM (
"
"                     NVL(BTDLNH_SGST_AMT,0) ) sgst,
"
"                     (CASE
"
"                        WHEN BTDLNH_SGST_AMT > 0 THEN BTDLNH_TAX_PCT
"
"                        ELSE 0
"
"                     END) sgst_rate,
"
"                  SUM (
"
"                     NVL(BTDLNH_IGST_AMT,0)) igst,
"
"                      (CASE
"
"                        WHEN BTDLNH_IGST_AMT > 0 THEN BTDLNH_TAX_PCT
"
"                        ELSE 0
"
"                     END) igst_rate,
"
"                  SUM (
"
"                     NVL(BTDLNH_UTGST_AMT,0)) utgst,
"
"                     ( CASE
"
"                        WHEN BTDLNH_UTGST_AMT > 0
"
"                        THEN
"
"                          BTDLNH_TAX_PCT
"
"                        ELSE
"
"                           0
"
"                     END) utgst_rate,
"
"                  btdlnh_gstin_no,
"
"                  btdlnh_gst_type,
"
"                  btdlnh_suplr_type,
"
"                  btdlnh_gst_rev_tax_flag,
"
"                  btdlnh_supply_type,
"
"                  btdlnh_state_code,
"
"                  (SELECT DISTINCT state_name1
"
"                     FROM states
"
"                    WHERE state_code = btdlnh_state_code AND ROWNUM = 1) state_name,
"
"                    BTDLNH_CC_CODE
"
"             FROM bank_trans_dist_ln_hist,
"
"                  --bank_trans_tax_charges,
"
"                  gl_accts
"
"                 -- tax_charges,
"
"                 -- tax_charges_types
"
"            WHERE   btdlnh_bu =  P_BU
"
"            -- btdlnh_bu = bttc_bu(+)
"
"                  --AND btdlnh_ord_pfx = bttc_ord_pfx(+)
"
"                  --AND btdlnh_ord_no = bttc_ord_no(+)
"
"                  --AND btdlnh_seq_no = bttc_seq_no(+)
"
"                  AND btdlnh_bu = glac_bu(+)
"
"                  AND btdlnh_acct = glac_acct(+)
"
"                --  AND bttc_bu = tc_bu(+)
"
"                --  AND bttc_tc_id = tc_tc_id(+)
"
"                 -- AND tc_bu = tctype_bu(+)
"
"                 -- AND tc_type_id = tctype_id(+)
"
"                  --AND btdlnh_ord_pfx = c_pfx
"
"                  AND btdlnh_ord_no = c_doc_no
"
"         GROUP BY BTDLNH_PLANT,
"
"                  --btdlnh_ord_pfx,
"
"                  btdlnh_ord_no,
"
"                  btdlnh_acct,
"
"                  glac_acct_desc1,
"
"                  glac_cl_id,
"
"                  --BTTC_RECOVER_FLAG,
"
"                  BTDLNH_TAX_PCT,
"
"                  BTDLNH_DIST_AMT,
"
"                  btdlnh_gstin_no,
"
"                  btdlnh_gst_type,
"
"                  btdlnh_suplr_type,
"
"                  btdlnh_gst_rev_tax_flag,
"
"                  btdlnh_supply_type,
"
"                  btdlnh_state_code,
"
"                  btln_exrate,
"
"                  btdlnh_input_type,
"
"                  btdlnh_exmpt_flag,
"
"                  BTDLNH_CC_CODE,
"
"                  BTDLNH_TAX_PCT,
"
"                  BTDLNH_UTGST_AMT,
"
"                  BTDLNH_CGST_AMT,
"
"                  BTDLNH_IGST_AMT,
"
"                  BTDLNH_SGST_AMT;
"
"                  --tctype_id;
"
"
"
"   BEGIN
"
"
"
"   FOR CR1 IN C1
"
"   LOOP
"
"
"
"
"
"    FOR CR2 IN C2(CR1.brln_inv_pfx, CR1.brln_inv_no)
"
"    LOOP
"
"
"
"      INSERT INTO bill_item_lines (bil_bu,
"
"                                   bil_doc_no,
"
"                                   bil_plnt,
"
"                                   bil_inv_pfx,
"
"                                   bil_inv_no,
"
"                                   bil_prod_id,
"
"                                   bil_prod_rev,
"
"                                   bil_prod_desc1,
"
"                                   bil_receipt_qty,
"
"                                   bil_invoiced_qty,
"
"                                   bil_inv_qty,
"
"                                   bil_unit_cost,
"
"                                   bil_ln_amt,
"
"                                   bil_acct,
"
"                                   bil_cl_id,
"
"                                   bil_par_cl_id,
"
"                                   bil_pur_cls,
"
"                                   bil_cre_by,
"
"                                   bil_cre_date,
"
"                                   bil_input_type,
"
"                                   bil_tax_exmpt_flag,
"
"                                   bil_inelgbl_type,
"
"                                   bil_inelgbl_sub_type,
"
"                                   bil_seq_no,
"
"                                   bil_rcm_flag,
"
"                                   bil_gst_rate,
"
"                                   bil_cgst_amt,
"
"                                   bil_sgst_amt,
"
"                                   bil_igst_amt,
"
"                                   bil_utgst_amt,
"
"                                   bil_hsn_code,
"
"                                   bil_uom,
"
"                                   bil_gstin_no,
"
"                                   bil_suplr_type,
"
"                                   bil_gst_class,
"
"                                   bil_gst_rev_tax_flag,
"
"                                   bil_gst_type,
"
"                                   bil_state_code,
"
"                                   bil_state_code_desc,
"
"                                   bil_cc_code,
"
"                                   bil_cgst_rate,
"
"                                    bil_sgst_rate,
"
"                                    bil_igst_rate,
"
"                                    bil_utgst_rate)
"
"           VALUES( p_bu,
"
"                  p_doc_no,
"
"                  CR2.SUPLNH_PLNT,
"
"                  'EX1',--CR2.sddlh_pfx,
"
"                  CR2.SUPLNH_DOC_NO,
"
"                  NULL,
"
"                  NULL,
"
"                  CR2.glac_acct_desc1,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  CR2.amt,
"
"                 CR2.SUPLNH_AP_GL_ACCT,
"
"                  CR2.glac_cl_id,
"
"                  NULL,
"
"                  NULL,
"
"                  p_user,
"
"                  SYSDATE,
"
"                  CR2.suplnh_input_type,
"
"                  CR2.suplnh_exmpt_tc_flag,
"
"                  CR2.suplnh_inelgbl_sub_type,
"
"                  CR2.suplnh_inelgbl_type,
"
"                  1,
"
"                  CR2.sdtch_recover_flag,
"
"                  CR2.SUPLNH_TAX_PCT,
"
"                 CR2.cgst,
"
"                 CR2.sgst,
"
"                  CR2.igst,
"
"                  CR2.utgst,
"
"                  NULL,
"
"                  NULL,
"
"                  CR2.suphdh_gstin_no,
"
"                  CR2.suphdh_suplr_type,
"
"                  CR2.suphdh_gst_class,
"
"                  CR2.suplnh_gst_rev_tax_flag,
"
"                  CR2.suphdh_gst_type,
"
"                  CR2.suphdh_state_code,
"
"                  CR2.state_name,
"
"                    CR2.SUPLNH_AP_CC_CODE,
"
"                    CR2.cgst_rate,
"
"                    CR2.sgst_rate,
"
"                    CR2.igst_rate,
"
"                    CR2.utgst_rate);
"
"      END LOOP;
"
"
"
"   FOR CR3 IN C3(CR1.brln_inv_pfx, CR1.brln_inv_no)
"
"   LOOP
"
"   /*
"
"   IF CR3.amt IS NULL THEN
"
" RAISE_APPLICATION_ERROR(-20999,CR1.brln_inv_pfx||CR1.brln_inv_no);
"
"END IF; */
"
"      INSERT INTO bill_item_lines (bil_bu,
"
"                                   bil_doc_no,
"
"                                   bil_plnt,
"
"                                  -- bil_inv_pfx,
"
"                                   bil_inv_no,
"
"                                   bil_prod_id,
"
"                                   bil_prod_rev,
"
"                                   bil_prod_desc1,
"
"                                   bil_receipt_qty,
"
"                                   bil_invoiced_qty,
"
"                                   bil_inv_qty,
"
"                                   bil_unit_cost,
"
"                                   bil_ln_amt,
"
"                                   bil_acct,
"
"                                   bil_cl_id,
"
"                                   bil_par_cl_id,
"
"                                   bil_pur_cls,
"
"                                   bil_cre_by,
"
"                                   bil_cre_date,
"
"                                   bil_input_type,
"
"                                   bil_tax_exmpt_flag,
"
"                                   bil_inelgbl_type,
"
"                                   bil_inelgbl_sub_type,
"
"                                   bil_seq_no,
"
"                                   bil_rcm_flag,
"
"                                   bil_gst_rate,
"
"                                   bil_cgst_amt,
"
"                                   bil_sgst_amt,
"
"                                   bil_igst_amt,
"
"                                   bil_utgst_amt,
"
"                                   bil_hsn_code,
"
"                                   bil_uom,
"
"                                   bil_gstin_no,
"
"                                   bil_suplr_type,
"
"                                   bil_gst_class,
"
"                                   bil_gst_rev_tax_flag,
"
"                                   bil_gst_type,
"
"                                   bil_state_code,
"
"                                   bil_state_code_desc,
"
"                                   bil_cc_code,
"
"                                    bil_cgst_rate,
"
"                                    bil_sgst_rate,
"
"                                    bil_igst_rate,
"
"                                    bil_utgst_rate)
"
"           VALUES( p_bu,
"
"                  p_doc_no,
"
"                  cr3.BTDLNH_PLANT,
"
"                  --cr3.btdlnh_ord_pfx,
"
"                  cr3.btdlnh_ord_no,
"
"                  NULL,
"
"                  NULL,
"
"                  cr3.glac_acct_desc1,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  NVL(cr3.amt,0),
"
"                  cr3.btdlnh_acct,
"
"                 cr3.glac_cl_id,
"
"                  NULL,
"
"                  NULL,
"
"                  p_user,
"
"                  SYSDATE,
"
"                  cr3.btdlnh_input_type,
"
"                  cr3.btdlnh_exmpt_flag,
"
"                  'A',
"
"                  'A',
"
"                  1,
"
"                  cr3.bttc_recover_flag,
"
"                  cr3.BTDLNH_TAX_PCT,
"
"                  cr3.sgst,
"
"                  cr3.sgst,
"
"                  cr3.igst,
"
"                 cr3.utgst,
"
"                  NULL,
"
"                  NULL,
"
"                  cr3.btdlnh_gstin_no,
"
"                  cr3.btdlnh_gst_type,
"
"                  cr3.btdlnh_suplr_type,
"
"                  cr3.btdlnh_gst_rev_tax_flag,
"
"                  cr3.btdlnh_supply_type,
"
"                  cr3.btdlnh_state_code,
"
"                  cr3.state_name,
"
"                    cr3.btdlnh_cc_code,
"
"                    cr3.cgst_rate,
"
"                    cr3.sgst_rate,
"
"                    cr3.igst_rate,
"
"                    cr3.utgst_rate);
"
"         END LOOP;
"
"         END LOOP;
"
"
"
"   END proc_upd_tax_amt_xpns ;
"
"
"
"   PROCEDURE proc_load_bill_reg_new (
"
"      p_bu           bill_reg_hd.brhd_bu%TYPE,
"
"      p_doc_no       bill_reg_hd.brhd_doc_no%TYPE,
"
"      p_from_date    bill_reg_hd.brhd_date_from%TYPE,
"
"      p_to_date      bill_reg_hd.brhd_date_to%TYPE,
"
"      p_status       bill_reg_hd.brhd_status%TYPE,
"
"      p_type         bill_reg_hd.brhd_acct_type%TYPE,
"
"      p_user         appl_users.appluser_id%TYPE)
"
"   AS
"
"   BEGIN
"
"      DELETE bill_reg_grn_ln_temp
"
"       WHERE brglt_bu = p_bu AND brglt_doc_no = p_doc_no;
"
"
"
"      --   IF func_find_glm_pur_jrnl_type (p_bu) IN ('I','G')
"
"      --    THEN
"
"      proc_ins_grn_lines (p_bu,
"
"                                           p_doc_no,
"
"                                           p_from_date,
"
"                                           p_to_date,
"
"                                           p_status,
"
"                                           p_user);
"
"
"
"
"
"
"
"      /*ELSIF func_find_glm_pur_jrnl_type (p_bu) IN ('I','G')
"
"      THEN*/
"
"      /*pkg_bill_booking.proc_ins_grn_perpectual (p_bu,
"
"                                                p_doc_no,
"
"                                                p_from_date,
"
"                                                p_to_date,
"
"                                                p_status,
"
"                                                p_user);*/
"
"      --  END IF;
"
"
"
"
"
"
"
"
"
"      proc_ins_landcost_lines (p_bu,
"
"                               p_doc_no,
"
"                               p_from_date,
"
"                               p_to_date,
"
"                               p_status,
"
"                               p_user);
"
"
"
"
"
"     proc_ins_pur_ret_lines (p_bu,
"
"                              p_doc_no,
"
"                              p_from_date,
"
"                              p_to_date,
"
"                              p_status,
"
"                              p_user);
"
"
"
"
"
"      proc_ins_proc_pyrl_lines (p_bu,
"
"                                p_doc_no,
"
"                                p_from_date,
"
"                                p_to_date,
"
"                                p_status,
"
"                                p_user);
"
"
"
"
"
"      proc_ins_btrans_lines (p_bu,
"
"                             p_doc_no,
"
"                             p_from_date,
"
"                             p_to_date,
"
"                             p_status,
"
"                             p_user);
"
"
"
"
"
"      proc_ins_bill_register (p_bu,
"
"                              p_doc_no,
"
"                              p_from_date,
"
"                              p_to_date,
"
"                              p_status,
"
"                              p_type,
"
"                              p_user);
"
"
"
"      /*proc_upd_party_details (p_bu, p_doc_no, p_user);*/
"
"   END proc_load_bill_reg_new;
"
"END pkg_bill_booking_new1;"
/
