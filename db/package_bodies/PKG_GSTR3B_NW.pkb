CREATE OR REPLACE
"PACKAGE BODY        pkg_gstr3b_nw
"
"AS
"
"   PROCEDURE proc_ins_gstr2_plnts (p_bu        VARCHAR2,
"
"                                   p_doc_no    VARCHAR2,
"
"                                   p_user      VARCHAR2)
"
"   IS
"
"
"
"      CURSOR c2
"
"      IS
"
"         SELECT DISTINCT bup_gst_no bupld_gst_no, bup_plant_id bupld_plnt
"
"           FROM bus_unit_plants
"
"          WHERE bup_bu = p_bu
"
"                AND bup_gst_no IN
"
"                       (SELECT tg3h_gstin_no
"
"                          FROM tax_gstr3b_hd
"
"                         WHERE     tg3h_bu = p_bu
"
"                               AND tg3h_doc_no = p_doc_no
"
"                               AND tg3h_status = 'N');
"
"   BEGIN
"
"      DELETE FROM gstr2_plant
"
"            WHERE g2p_bu = p_bu AND g2p_doc_no = p_doc_no;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"         INSERT INTO gstr2_plant (g2p_bu,
"
"                                  g2p_doc_no,
"
"                                  g2p_plant,
"
"                                  g2p_gstin_no,
"
"                                  g2p_sel_flag,
"
"                                  g2p_cre_by,
"
"                                  g2p_cre_date)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      cr2.bupld_plnt,
"
"                      cr2.bupld_gst_no,
"
"                      'Y',
"
"                      p_user,
"
"                      SYSDATE);
"
"      END LOOP;
"
"   END proc_ins_gstr2_plnts;
"
"
"
"   PROCEDURE proc_load_gstr3b_31 (
"
"      p_bu         tax_gstr3b_hd.tg3h_bu%TYPE,
"
"      p_doc_no     tax_gstr3b_hd.tg3h_doc_no%TYPE,
"
"      p_date_fr    tax_gstr3b_hd.tg3h_date_from%TYPE,
"
"      p_date_to    tax_gstr3b_hd.tg3h_date_to%TYPE,
"
"      p_user       appl_users.appluser_id%TYPE)
"
"   AS
"
"      CURSOR c_gstr_31a
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (SELECT SUM (siln_gross_amt)taxable_val,
"
"                        SUM (siln_igst_amt) igst_tax_amt,
"
"                        SUM (siln_cgst_amt) cgst_tax_amt,
"
"                        SUM (siln_sgst_amt) sgst_tax_amt,
"
"                        SUM (siln_cess_amt) cess_tax_amt
"
"                   FROM sales_invoices_hd,
"
"                        sales_invoices_ln
"
"                  WHERE     sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND sihd_type IN
"
"                               ( --'SO',
"
"                                'SIG',
"
"                                'TP',
"
"                                'SU',
"
"                                'SS',
"
"                                'SIS','SISCR',  /* added on 12-01-26 */
"
"                                'LO',
"
"                                'LI',
"
"                                'SI',
"
"                                'DP',
"
"                                'DE',
"
"                                'FA',
"
"                                'FE',
"
"                                'TT',
"
"                                'OH',
"
"                                'LE',
"
"                                'RB',
"
"                                'RP',
"
"                                'PR',
"
"                                'JWI',
"
"                                'JWIG',
"
"                                 'LW',
"
"                                ''
"
"                                || DECODE (
"
"                                      (SELECT tg3h_si_type_st
"
"                                         FROM tax_gstr3b_hd
"
"                                        WHERE tg3h_bu = p_bu
"
"                                              AND tg3h_doc_no = p_doc_no),
"
"                                      'Y', 'ST',
"
"                                      NULL)
"
"                                || '',
"
"                                ''
"
"                                || DECODE (
"
"                                      (SELECT tg3h_si_type_fs
"
"                                         FROM tax_gstr3b_hd
"
"                                        WHERE tg3h_bu = p_bu
"
"                                              AND tg3h_doc_no = p_doc_no),
"
"                                      'Y', 'FS',
"
"                                      NULL)
"
"                                || '')
"
"                        AND sihd_status = 'I'
"
"                        AND (sihd_gst_reg_type = 'R'
"
"                             OR (sihd_gst_reg_type = 'U'
"
"                                 AND sihd_gst_cust_type = 'L'))
"
"                        AND sihd_gst_cust_type <> 'E'
"
"                        AND sihd_bu = p_bu
"
"                        AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                      AND p_date_to
"
"                        and siln_tax_pct > 0
"
"                        and ((siln_cgst_amt+siln_sgst_amt) > 0  or siln_utgst_amt >0 or siln_igst_amt > 0)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = sihd_plant)
"
"                 UNION ALL
"
"                 SELECT -SUM (siln_gross_amt) taxable_val,
"
"                        -SUM (siln_igst_amt) igst_tax_amt,
"
"                        -SUM (siln_cgst_amt) cgst_tax_amt,
"
"                        -SUM (siln_sgst_amt) sgst_tax_amt,
"
"                        -SUM (siln_cess_amt) cess_tax_amt
"
"                   FROM sales_invoices_hd,
"
"                        sales_invoices_ln
"
"                  WHERE     sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND sihd_type IN
"
"                               ('RD',
"
"                                'RL',
"
"                                'RS',
"
"                                'SR',
"
"                                'SG',
"
"                                'LR',
"
"                                'SN',
"
"                                'RV',
"
"                                'RY',
"
"                                'RH',
"
"                                'RU')
"
"                        AND sihd_status = 'I'
"
"                        AND (sihd_gst_reg_type = 'R'
"
"                             OR (sihd_gst_reg_type = 'U'
"
"                                 AND sihd_gst_cust_type = 'L'))
"
"                        AND sihd_gst_cust_type <> 'E'
"
"                        AND sihd_bu = p_bu
"
"                        AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                      AND p_date_to
"
"                        and siln_tax_pct > 0
"
"                        and ((siln_cgst_amt+siln_sgst_amt) > 0  or siln_utgst_amt >0 or siln_igst_amt > 0)
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = sihd_plant)
"
"                 UNION ALL
"
"                 SELECT SUM (sdgb_assbl_val) cdoch_cc_total_amt,
"
"                        SUM (sdgb_igst_amt) cdoch_igst_fw_amt,
"
"                        SUM (sdgb_cgst_amt) cdoch_cgst_fw_amt,
"
"                        SUM (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                           cdoch_sgst_fw_amt,
"
"                        0 cdoch_cess_fw_amt
"
"                   FROM suplr_doc_hd_hist,
"
"                        suplr_doc_gst_bal,
"
"                        suplr_ship_loc,
"
"                        states
"
"                  WHERE     suphdh_bu = p_bu
"
"                        AND suphdh_doc_type IN  ('R') /*'CMI','DMI'  THIS TWO */
"
"                        AND suphdh_acct_type IN ('AD') /*AR*/
"
"                        AND suphdh_status = 'P'
"
"                        AND suphdh_bu = sdgb_bu
"
"                        AND suphdh_doc_no = sdgb_doc_no
"
"                        AND suphdh_bu = ssl_bu
"
"                        AND suphdh_suplr_id = ssl_suplr_id
"
"                        AND ssl_state = state_id
"
"                        AND ssl_dflt_flg IN ('D', 'B')
"
"                        AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                       AND p_date_to
"
"                        AND sdgb_tax_pct > 0
"
"                   AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphdh_plant)
"
"               UNION ALL
"
"                  SELECT
"
"                        SUM (-sdgb_assbl_val) cdoch_cc_total_amt,
"
"                        SUM (-sdgb_igst_amt) cdoch_igst_fw_amt,
"
"                        SUM (-sdgb_cgst_amt) cdoch_cgst_fw_amt,
"
"                        SUM (-(sdgb_sgst_amt + sdgb_utgst_amt))
"
"                           cdoch_sgst_fw_amt,
"
"                        0 cdoch_cess_fw_amt
"
"                   FROM suplr_doc_hd_hist,
"
"                        suplr_doc_gst_bal,
"
"                        suplr_ship_loc,
"
"                        states
"
"                  WHERE     suphdh_bu = p_bu
"
"                        AND suphdh_doc_type IN  ('CN') --'CMI','DMI'  THIS TWO --
"
"                        AND suphdh_acct_type IN ('AR') --AR--
"
"                        AND suphdh_status = 'P'
"
"                        AND suphdh_bu = sdgb_bu
"
"                        AND suphdh_doc_no = sdgb_doc_no
"
"                        AND suphdh_bu = ssl_bu
"
"                        AND suphdh_suplr_id = ssl_suplr_id
"
"                        AND ssl_state = state_id
"
"                        AND ssl_dflt_flg IN ('D', 'B')
"
"                        AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                       AND p_date_to
"
"                        AND sdgb_tax_pct > 0
"
"                   AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphdh_plant)
"
"                 UNION ALL
"
"                 SELECT -ROUND (
"
"                            SUM (
"
"                               (  pdog_cgst_adj_amt
"
"                                + pdog_sgst_adj_amt
"
"                                + pdog_igst_adj_amt
"
"                                + pdog_utgst_adj_amt)
"
"                               * 100
"
"                               / pdog_tax_pct),
"
"                            3)
"
"                           cdoch_cc_total_amt,
"
"                        -SUM (pdog_igst_adj_amt) cdoch_igst_fw_amt,
"
"                        -SUM (pdog_cgst_adj_amt) cdoch_cgst_fw_amt,
"
"                        -SUM (pdog_sgst_adj_amt + pdog_utgst_adj_amt)
"
"                           cdoch_sgst_fw_amt,
"
"                        0 cdoch_cess_fw_amt
"
"                   FROM suplr_doc_hd_hist, par_doc_offsets_gst
"
"                  WHERE     suphdh_bu = p_bu
"
"                        AND suphdh_bu = pdog_bu
"
"                        AND suphdh_pfx = pdog_cr_doc_pfx
"
"                        AND suphdh_doc_no = pdog_cr_doc_no
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphdh_plant)
"
"                        --AND TRUNC (cdoch_doc_date) BETWEEN p_date_from AND p_date_to
"
"                        AND TRUNC (pdog_offset_date) BETWEEN p_date_fr
"
"                                                         AND p_date_to
"
"               );
"
"
"
"      CURSOR c_gstr_31b
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (SELECT SUM (siln_gross_amt * sihd_exchange_rate )taxable_val,
"
"                        SUM (siln_igst_amt * sihd_exchange_rate ) igst_tax_amt,
"
"                        SUM (siln_cgst_amt * sihd_exchange_rate ) cgst_tax_amt,
"
"                        SUM (siln_sgst_amt * sihd_exchange_rate ) sgst_tax_amt,
"
"                        SUM (siln_cess_amt * sihd_exchange_rate ) cess_tax_amt
"
"                   FROM sales_invoices_hd,
"
"                        sales_invoices_ln
"
"                  WHERE     sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND sihd_type IN
"
"                               (--'SO',
"
"                               'SIG',
"
"                                'TP',
"
"                                'SU',
"
"                                'SS',
"
"                                'LO',
"
"                                'LI',
"
"                                'SI',
"
"                                'DP',
"
"                                'DE',
"
"                                'FA',
"
"                                'FE',
"
"                                'TT',
"
"                                'OH',
"
"                                'LE',
"
"                                'RB',
"
"                                'RP',
"
"                                'PR',
"
"                                'JWI',
"
"                                'JWIG',
"
"                                 'LW',
"
"                                ''
"
"                                || DECODE (
"
"                                      (SELECT tg3h_si_type_st
"
"                                         FROM tax_gstr3b_hd
"
"                                        WHERE tg3h_bu = p_bu
"
"                                              AND tg3h_doc_no = p_doc_no),
"
"                                      'Y', 'ST',
"
"                                      NULL)
"
"                                || '',
"
"                                ''
"
"                                || DECODE (
"
"                                      (SELECT tg3h_si_type_fs
"
"                                         FROM tax_gstr3b_hd
"
"                                        WHERE tg3h_bu = p_bu
"
"                                              AND tg3h_doc_no = p_doc_no),
"
"                                      'Y', 'FS',
"
"                                      NULL)
"
"                                || '')
"
"                        AND sihd_status = 'I'
"
"                        AND sihd_gst_cust_type IN ('E', 'S', 'U','M')
"
"                        AND sihd_bu = p_bu
"
"                        AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                      AND p_date_to
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = sihd_plant)
"
"                 UNION ALL
"
"                 SELECT -SUM (siln_gross_amt * sihd_exchange_rate )taxable_val,
"
"                        -SUM (siln_igst_amt * sihd_exchange_rate ) igst_tax_amt,
"
"                        -SUM (siln_cgst_amt * sihd_exchange_rate ) cgst_tax_amt,
"
"                        -SUM (siln_sgst_amt * sihd_exchange_rate ) sgst_tax_amt,
"
"                        -SUM (siln_cess_amt * sihd_exchange_rate ) cess_tax_amt
"
"                   FROM sales_invoices_hd,
"
"                        sales_invoices_ln
"
"                  WHERE     sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND sihd_type IN
"
"                               ('RD',
"
"                                'RL',
"
"                                'RS',
"
"                                'SR',
"
"                                'SG',
"
"                                'LR',
"
"                                'SN',
"
"                                'RV',
"
"                                'RY',
"
"                                'RH',
"
"                                'RU',
"
"                                'JWI',
"
"                                'JWIG',
"
"                                 'LW')
"
"                        AND sihd_status = 'I'
"
"                        --AND (sihd_gst_reg_type = 'R' OR (sihd_gst_reg_type = 'U' AND sihd_gst_cust_type = 'L'))
"
"                        AND sihd_gst_cust_type IN ('E', 'S', 'U','M')
"
"                        AND sihd_bu = p_bu
"
"                        AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                      AND p_date_to
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = sihd_plant)
"
"                                                                   );
"
"
"
"      CURSOR c_gstr_31c
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT sihd_bu,
"
"                          sihd_inv_pfx,
"
"                          sihd_inv_no,
"
"                          siln_seq_no,
"
"                          SUM (
"
"                             (siln_inv_qty * siln_price) * sihd_exchange_rate)
"
"                             taxable_val,
"
"                          0 igst_tax_amt,
"
"                          0 cgst_tax_amt,
"
"                          0 sgst_tax_amt,
"
"                          0 cess_tax_amt
"
"                     FROM sales_invoices_hd, sales_invoices_ln
"
"                    WHERE     sihd_bu = siln_bu
"
"                          AND sihd_plant = siln_plnt
"
"                          AND sihd_doc_no = siln_doc_no
"
"                          AND sihd_type IN
"
"                                 (--'SO',
"
"                                 'SIG',
"
"                                  'TP',
"
"                                  'SU',
"
"                                  'SS',
"
"                                  'LO',
"
"                                  'LI',
"
"                                  'SI',
"
"                                  'DP',
"
"                                  'DE',
"
"                                  'FA',
"
"                                  'FE',
"
"                                  'TT',
"
"                                  'OH',
"
"                                  'LE',
"
"                                  'RB',
"
"                                  'RP',
"
"                                  'PR',
"
"                                  'JWI',
"
"                                   'LW',
"
"                                   'JWIG',
"
"                                  ''
"
"                                  || DECODE (
"
"                                        (SELECT tg3h_si_type_st
"
"                                           FROM tax_gstr3b_hd
"
"                                          WHERE tg3h_bu = p_bu
"
"                                                AND tg3h_doc_no = p_doc_no),
"
"                                        'Y', 'ST',
"
"                                        NULL)
"
"                                  || '',
"
"                                  ''
"
"                                  || DECODE (
"
"                                        (SELECT tg3h_si_type_fs
"
"                                           FROM tax_gstr3b_hd
"
"                                          WHERE tg3h_bu = p_bu
"
"                                                AND tg3h_doc_no = p_doc_no),
"
"                                        'Y', 'FS',
"
"                                        NULL)
"
"                                  || '')
"
"                          AND sihd_status = 'I'
"
"                          --AND sihd_gst_reg_type IN ('R','U')
"
"                          AND sihd_gst_cust_type NOT IN ('E','S')
"
"                          and siln_tax_pct = 0
"
"                          AND sihd_bu = p_bu
"
"                          AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                        AND p_date_to
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = sihd_plant)
"
"                 GROUP BY sihd_bu,
"
"                          sihd_inv_pfx,
"
"                          sihd_inv_no,
"
"                          siln_seq_no
"
"                 );
"
"
"
"      CURSOR c_gstr_31d
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no,
"
"                          SUM (supln_assbl_val) taxable_val,
"
"                          SUM (supln_igst_amt)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt)   cgst_tax_amt,
"
"                          SUM (supln_sgst_amt)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist_vw1,
"
"                          suplr_doc_ln_hist_vw1
"
"                    WHERE     suphd_bu = supln_bu
"
"                          AND suphd_doc_no = supln_doc_no
"
"                          AND suphd_status = 'P'
"
"                          AND supln_tax_pct > 0
"
"                          AND suphd_bu = p_bu
"
"                          AND TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                         AND p_date_to
"
"                          AND supln_gst_rev_tax_flag = 'Y'
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                 GROUP BY suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no
"
"               /*  UNION ALL
"
"                 SELECT sihd_bu,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             siln_seq_no,
"
"                           SUM (
"
"                           CASE
"
"                              WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                              THEN
"
"                                 siltc_acc_value
"
"                              ELSE
"
"                                 0
"
"                           END)
"
"                           taxable_val,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN tctype_type_id = 'IGST'
"
"                                   AND siltc_cust_chrg_flag = 'Y'
"
"                              THEN
"
"                                 siltc_tc_amt
"
"                              ELSE
"
"                                 0
"
"                           END)
"
"                           igst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN tctype_type_id = 'CGST'
"
"                                   AND siltc_cust_chrg_flag = 'Y'
"
"                              THEN
"
"                                 siltc_tc_amt
"
"                              ELSE
"
"                                 0
"
"                           END)
"
"                           cgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN tctype_type_id = 'SGST'
"
"                                   AND siltc_cust_chrg_flag = 'Y'
"
"                              THEN
"
"                                 siltc_tc_amt
"
"                              ELSE
"
"                                 0
"
"                           END)
"
"                           sgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN tctype_type_id = 'GSTC'
"
"                                   AND siltc_cust_chrg_flag = 'Y'
"
"                              THEN
"
"                                 siltc_tc_amt
"
"                              ELSE
"
"                                 0
"
"                           END)
"
"                           cess_tax_amt
"
"                   FROM sales_invoices_hd,
"
"                        sales_invoices_ln,
"
"                        sales_inv_line_tax_charges,
"
"                        tax_charges,
"
"                        tax_charges_types
"
"                  WHERE     sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND siltc_bu = siln_bu
"
"                        AND siltc_plnt = siln_plnt
"
"                        AND siltc_doc_no = siln_doc_no
"
"                        AND siltc_seq_no = siln_seq_no
"
"                        AND tc_bu = siltc_bu
"
"                        AND tc_tc_id = siltc_tc_id
"
"                        AND tctype_bu = tc_bu
"
"                        AND tctype_id = tc_type_id
"
"                        AND (sihd_type IN
"
"                                ('SO',
"
"                                 'TP',
"
"                                 'SU',
"
"                                 'SS',
"
"                                 'LO',
"
"                                 'LI',
"
"                                 'SI',
"
"                                 'DP',
"
"                                 'DE',
"
"                                 'FA',
"
"                                 'FE',
"
"                                 'TT',
"
"                                 'OH',
"
"                                 'LE',
"
"                                 'RB',
"
"                                 'RP',
"
"                                 'PR',
"
"                                 ''
"
"                                 || DECODE (
"
"                                       (SELECT tg3h_si_type_st
"
"                                          FROM tax_gstr3b_hd
"
"                                         WHERE tg3h_bu = p_bu
"
"                                               AND tg3h_doc_no = p_doc_no),
"
"                                       'Y', 'ST',
"
"                                       NULL)
"
"                                 || '',
"
"                                 ''
"
"                                 || DECODE (
"
"                                       (SELECT tg3h_si_type_fs
"
"                                          FROM tax_gstr3b_hd
"
"                                         WHERE tg3h_bu = p_bu
"
"                                               AND tg3h_doc_no = p_doc_no),
"
"                                       'Y', 'FS',
"
"                                       NULL)
"
"                                 || '')
"
"                             OR (sihd_type = 'RY'
"
"                                 AND sihd_sal_ret_type = 'DM'))
"
"                        AND sihd_status = 'I'
"
"                        --AND sihd_gst_reg_type = 'U'
"
"                        AND SILTC_TAX_TYPE = 'R'
"
"                        AND siltc_cust_chrg_flag = 'N'
"
"                        AND siltc_gst_inc_flag = 'N'
"
"                        AND sihd_bu = p_bu
"
"                        AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                      AND p_date_to
"
"                        AND tctype_type_id IN
"
"                               ('IGST', 'CGST', 'SGST', 'GSTC')
"
"                        AND siltc_tc_amt <> 0
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = sihd_plant)
"
"                         GROUP BY sihd_bu,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             siln_seq_no*/);
"
"
"
"      CURSOR c_gstr_31e
"
"      IS
"
"        SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT sihd_bu,
"
"                          sihd_inv_pfx,
"
"                          sihd_inv_no,
"
"                          siln_seq_no,
"
"                          SUM (
"
"                             (siln_inv_qty * siln_price) * sihd_exchange_rate)
"
"                             taxable_val,
"
"                          0 igst_tax_amt,
"
"                          0 cgst_tax_amt,
"
"                          0 sgst_tax_amt,
"
"                          0 cess_tax_amt
"
"                     FROM sales_invoices_hd, sales_invoices_ln
"
"                    WHERE     sihd_bu = siln_bu
"
"                          AND sihd_plant = siln_plnt
"
"                          AND sihd_doc_no = siln_doc_no
"
"                          AND sihd_type IN
"
"                                 (--'SO',
"
"                                 'SIG',
"
"                                  'TP',
"
"                                  'SU',
"
"                                  'SS',
"
"                                  'LO',
"
"                                  'LI',
"
"                                  'SI',
"
"                                  'DP',
"
"                                  'DE',
"
"                                  'FA',
"
"                                  'FE',
"
"                                  'TT',
"
"                                  'OH',
"
"                                  'LE',
"
"                                  'RB',
"
"                                  'RP',
"
"                                  'PR',
"
"                                  'JWI',
"
"                                   'LW',
"
"                                   'JWIG',
"
"                                  ''
"
"                                  || DECODE (
"
"                                        (SELECT tg3h_si_type_st
"
"                                           FROM tax_gstr3b_hd
"
"                                          WHERE tg3h_bu = p_bu
"
"                                                AND tg3h_doc_no = p_doc_no),
"
"                                        'Y', 'ST',
"
"                                        NULL)
"
"                                  || '',
"
"                                  ''
"
"                                  || DECODE (
"
"                                        (SELECT tg3h_si_type_fs
"
"                                           FROM tax_gstr3b_hd
"
"                                          WHERE tg3h_bu = p_bu
"
"                                                AND tg3h_doc_no = p_doc_no),
"
"                                        'Y', 'FS',
"
"                                        NULL)
"
"                                  || '')
"
"                          AND sihd_status = 'I'
"
"                          --AND sihd_gst_reg_type IN ('R','U')
"
"                           AND siln_gst_exempt_flag IN  ('N')
"
"                          AND sihd_gst_cust_type <> 'E'
"
"                          AND sihd_bu = p_bu
"
"                          and siln_tax_pct > 0
"
"                          AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                        AND p_date_to
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = sihd_plant)
"
"                 GROUP BY sihd_bu,
"
"                          sihd_inv_pfx,
"
"                          sihd_inv_no,
"
"                          siln_seq_no);
"
"
"
"      PROCEDURE proc_ins_rec (typ_code    VARCHAR2,
"
"                              tax_val     NUMBER,
"
"                              igst_amt    NUMBER,
"
"                              cgst_amt    NUMBER,
"
"                              sgst_amt    NUMBER,
"
"                              cess_amt    NUMBER)
"
"      AS
"
"         v_seq_no   NUMBER;
"
"      BEGIN
"
"         SELECT NVL (MAX (tg31l_seq_no), 0) + 1
"
"           INTO v_seq_no
"
"           FROM tax_gstr3b_31_ln
"
"          WHERE tg31l_bu = p_bu AND tg31l_doc_no = p_doc_no;
"
"
"
"         INSERT INTO tax_gstr3b_31_ln (tg31l_bu,
"
"                                       tg31l_doc_no,
"
"                                       tg31l_seq_no,
"
"                                       tg31l_typ_code,
"
"                                       tg31l_tot_tax_val,
"
"                                       tg31l_igst_amt,
"
"                                       tg31l_cgst_amt,
"
"                                       tg31l_sgst_amt,
"
"                                       tg31l_cess_amt,
"
"                                       tg31l_cre_by,
"
"                                       tg31l_cre_date)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      v_seq_no,
"
"                      typ_code,
"
"                      NVL (tax_val, 0),
"
"                      NVL (igst_amt, 0),
"
"                      NVL (cgst_amt, 0),
"
"                      NVL (sgst_amt, 0),
"
"                      NVL (cess_amt, 0),
"
"                      p_user,
"
"                      SYSDATE);
"
"      END proc_ins_rec;
"
"   BEGIN
"
"      DELETE FROM tax_gstr3b_31_ln
"
"            WHERE tg31l_bu = p_bu AND tg31l_doc_no = p_doc_no;
"
"
"
"      FOR r_gstr_31a IN c_gstr_31a
"
"      LOOP
"
"        proc_ins_rec ('GSTR3B31A',
"
"                       r_gstr_31a.taxable_val,
"
"                       r_gstr_31a.igst_tax_amt,
"
"                       r_gstr_31a.cgst_tax_amt,
"
"                       r_gstr_31a.sgst_tax_amt,
"
"                       r_gstr_31a.cess_tax_amt);
"
"
"
"      END LOOP c_gstr_31a;
"
"
"
"      FOR r_gstr_31b IN c_gstr_31b
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B31B',
"
"                       r_gstr_31b.taxable_val,
"
"                       r_gstr_31b.igst_tax_amt,
"
"                       r_gstr_31b.cgst_tax_amt,
"
"                       r_gstr_31b.sgst_tax_amt,
"
"                       r_gstr_31b.cess_tax_amt);
"
"      END LOOP c_gstr_31b;
"
"
"
"      FOR r_gstr_31c IN c_gstr_31c
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B31C',
"
"                       r_gstr_31c.taxable_val,
"
"                       r_gstr_31c.igst_tax_amt,
"
"                       r_gstr_31c.cgst_tax_amt,
"
"                       r_gstr_31c.sgst_tax_amt,
"
"                       r_gstr_31c.cess_tax_amt);
"
"      END LOOP c_gstr_31c;
"
"
"
"      FOR r_gstr_31d IN c_gstr_31d
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B31D',
"
"                       r_gstr_31d.taxable_val,
"
"                       r_gstr_31d.igst_tax_amt,
"
"                       r_gstr_31d.cgst_tax_amt,
"
"                       r_gstr_31d.sgst_tax_amt,
"
"                       r_gstr_31d.cess_tax_amt);
"
"      END LOOP c_gstr_31d;
"
"
"
"      FOR r_gstr_31e IN c_gstr_31e
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B31E',
"
"                       r_gstr_31e.taxable_val,
"
"                       r_gstr_31e.igst_tax_amt,
"
"                       r_gstr_31e.cgst_tax_amt,
"
"                       r_gstr_31e.sgst_tax_amt,
"
"                       r_gstr_31e.cess_tax_amt);
"
"      END LOOP c_gstr_31e;
"
"   END proc_load_gstr3b_31;
"
"
"
"   PROCEDURE proc_load_gstr3b_32 (
"
"      p_bu         tax_gstr3b_hd.tg3h_bu%TYPE,
"
"      p_doc_no     tax_gstr3b_hd.tg3h_doc_no%TYPE,
"
"      p_date_fr    tax_gstr3b_hd.tg3h_date_from%TYPE,
"
"      p_date_to    tax_gstr3b_hd.tg3h_date_to%TYPE,
"
"      p_user       appl_users.appluser_id%TYPE)
"
"   AS
"
"      CURSOR c_gstr_32a
"
"      IS
"
"           SELECT state_code,
"
"                  SUM (taxable_val) taxable_val,
"
"                  SUM (igst_tax_amt) igst_tax_amt
"
"             FROM (  SELECT SISA_BILLTO_STATE_CODE
"
"                               state_code,
"
"                            SUM (siln_gross_amt) taxable_val,
"
"                            SUM (siln_igst_amt)   igst_tax_amt
"
"                       FROM sales_invoices_hd,
"
"                            sales_invoices_ln,
"
"                            sales_inv_ship_addr
"
"                      WHERE     sihd_bu = siln_bu
"
"                            AND sihd_plant = siln_plnt
"
"                            AND sihd_doc_no = siln_doc_no
"
"                            AND sisa_bu = sihd_bu
"
"                            AND sisa_plnt = sihd_plant
"
"                            AND sisa_doc_no = sihd_doc_no
"
"                            AND sihd_type IN
"
"                                   (--'SO',
"
"                                   'SIG',
"
"                                    'TP',
"
"                                    'SU',
"
"                                    'SS',
"
"                                    'LO',
"
"                                    'LI',
"
"                                    'SI',
"
"                                    'DP',
"
"                                    'DE',
"
"                                    'FA',
"
"                                    'FE',
"
"                                    'TT',
"
"                                    'OH',
"
"                                    'LE',
"
"                                    'RB',
"
"                                    'RP',
"
"                                    'PR',
"
"                                    'JWI',
"
"                                     'LW',
"
"                                     'JWIG',
"
"                                    ''
"
"                                    || DECODE (
"
"                                          (SELECT tg3h_si_type_st
"
"                                             FROM tax_gstr3b_hd
"
"                                            WHERE tg3h_bu = p_bu
"
"                                                  AND tg3h_doc_no = p_doc_no),
"
"                                          'Y', 'ST',
"
"                                          NULL)
"
"                                    || '',
"
"                                    ''
"
"                                    || DECODE (
"
"                                          (SELECT tg3h_si_type_fs
"
"                                             FROM tax_gstr3b_hd
"
"                                            WHERE tg3h_bu = p_bu
"
"                                                  AND tg3h_doc_no = p_doc_no),
"
"                                          'Y', 'FS',
"
"                                          NULL)
"
"                                    || '')
"
"                            AND sihd_status = 'I'
"
"                            AND sihd_gst_reg_type = 'U'
"
"                            AND sihd_gst_cust_type = 'I'
"
"                            AND sihd_bu = p_bu
"
"                            AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to
"
"                            AND EXISTS
"
"                                   (SELECT 1
"
"                                      FROM gstr2_plant
"
"                                     WHERE     g2p_bu = p_bu
"
"                                           AND g2p_sel_flag = 'Y'
"
"                                           AND g2p_doc_no = p_doc_no
"
"                                           AND g2p_plant = sihd_plant)
"
"                   GROUP BY SISA_BILLTO_STATE_CODE
"
"                   UNION ALL
"
"                     SELECT SISA_BILLTO_STATE_CODE
"
"                               state_code,
"
"                            -SUM (siln_gross_amt)  taxable_val,
"
"                            -SUM (siln_igst_amt) igst_tax_amt
"
"                       FROM sales_invoices_hd,
"
"                            sales_invoices_ln,
"
"                            sales_inv_ship_addr
"
"                      WHERE     sihd_bu = siln_bu
"
"                            AND sihd_plant = siln_plnt
"
"                            AND sihd_doc_no = siln_doc_no
"
"                            AND sisa_bu = sihd_bu
"
"                            AND sisa_plnt = sihd_plant
"
"                            AND sisa_doc_no = sihd_doc_no
"
"                            AND sihd_type IN
"
"                                   ('RD',
"
"                                    'RL',
"
"                                    'RS',
"
"                                    'SR',
"
"                                    'SG',
"
"                                    'LR',
"
"                                    'SN',
"
"                                    'RV',
"
"                                    'RY',
"
"                                    'RH',
"
"                                    'RU',
"
"                                    'JWI',
"
"                                    'JWIG',
"
"                                     'LW')
"
"                            AND sihd_status = 'I'
"
"                            AND sihd_gst_reg_type = 'U'
"
"                            AND sihd_gst_cust_type = 'I'
"
"                            AND sihd_bu = p_bu
"
"                            AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to
"
"                            AND EXISTS
"
"                                   (SELECT 1
"
"                                      FROM gstr2_plant
"
"                                     WHERE     g2p_bu = p_bu
"
"                                           AND g2p_sel_flag = 'Y'
"
"                                           AND g2p_doc_no = p_doc_no
"
"                                           AND g2p_plant = sihd_plant)
"
"                   GROUP BY SISA_BILLTO_STATE_CODE
"
"                                     )
"
"         GROUP BY state_code;
"
"
"
"      CURSOR c_gstr_32b
"
"      IS
"
"           SELECT state_code,
"
"                  SUM (taxable_val) taxable_val,
"
"                  SUM (igst_tax_amt) igst_tax_amt
"
"             FROM (  SELECT sihd_bu,
"
"                            sihd_inv_pfx,
"
"                            sihd_inv_no,
"
"                            (SELECT state_code || '-' || state_name1
"
"                               FROM states
"
"                              WHERE state_id = sisa_billto_state)
"
"                               state_code,
"
"                            siln_seq_no,
"
"                            SUM (siln_gross_amt)  taxable_val,
"
"                            SUM (siln_igst_amt)  igst_tax_amt
"
"                       FROM sales_invoices_hd,
"
"                            sales_invoices_ln,
"
"                            sales_inv_ship_addr
"
"                      WHERE     sihd_bu = siln_bu
"
"                            AND sihd_plant = siln_plnt
"
"                            AND sihd_doc_no = siln_doc_no
"
"                            AND sisa_bu = sihd_bu
"
"                            AND sisa_plnt = sihd_plant
"
"                            AND sisa_doc_no = sihd_doc_no
"
"                            AND sihd_type IN
"
"                                   (--'SO',
"
"                                   'SIG',
"
"                                    'TP',
"
"                                    'SU',
"
"                                    'SS',
"
"                                    'LO',
"
"                                    'LI',
"
"                                    'SI',
"
"                                    'DP',
"
"                                    'DE',
"
"                                    'FA',
"
"                                    'FE',
"
"                                    'TT',
"
"                                    'OH',
"
"                                    'LE',
"
"                                    'RB',
"
"                                    'RP',
"
"                                    'PR',
"
"                                    'JWI',
"
"                                    'JWIG',
"
"                                     'LW',
"
"                                    ''
"
"                                    || DECODE (
"
"                                          (SELECT tg3h_si_type_st
"
"                                             FROM tax_gstr3b_hd
"
"                                            WHERE tg3h_bu = p_bu
"
"                                                  AND tg3h_doc_no = p_doc_no),
"
"                                          'Y', 'ST',
"
"                                          NULL)
"
"                                    || '',
"
"                                    ''
"
"                                    || DECODE (
"
"                                          (SELECT tg3h_si_type_fs
"
"                                             FROM tax_gstr3b_hd
"
"                                            WHERE tg3h_bu = p_bu
"
"                                                  AND tg3h_doc_no = p_doc_no),
"
"                                          'Y', 'FS',
"
"                                          NULL)
"
"                                    || '')
"
"                            AND sihd_gst_cust_type <> 'E'
"
"                            AND sihd_status = 'I'
"
"                            AND sihd_gst_reg_type = 'C'
"
"                            and siln_tax_pct > 0
"
"                            and ((siln_cgst_amt+siln_sgst_amt) > 0  or siln_utgst_amt >0 or siln_igst_amt > 0)
"
"                            AND sihd_bu = p_bu
"
"                            AND TRUNC (sihd_inv_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to
"
"                            AND EXISTS
"
"                                   (SELECT 1
"
"                                      FROM gstr2_plant
"
"                                     WHERE     g2p_bu = p_bu
"
"                                           AND g2p_sel_flag = 'Y'
"
"                                           AND g2p_doc_no = p_doc_no
"
"                                           AND g2p_plant = sihd_plant)
"
"                   GROUP BY sihd_bu,
"
"                            sihd_inv_pfx,
"
"                            sihd_inv_no,
"
"                            siln_seq_no,
"
"                            sisa_billto_state
"
"                                     )
"
"         GROUP BY state_code;
"
"
"
"      CURSOR c_gstr_32c
"
"      IS
"
"         SELECT NULL state_code, 0 taxable_val, 0 igst_tax_amt FROM DUAL;
"
"
"
"      PROCEDURE proc_ins_rec (typ_code       VARCHAR2,
"
"                              pos_dtl        VARCHAR2,
"
"                              taxable_val    NUMBER,
"
"                              igst_amt       NUMBER)
"
"      AS
"
"         v_seq_no   NUMBER;
"
"      BEGIN
"
"         SELECT NVL (MAX (tg32l_seq_no), 0) + 1
"
"           INTO v_seq_no
"
"           FROM tax_gstr3b_32_ln
"
"          WHERE tg32l_bu = p_bu AND tg32l_doc_no = p_doc_no;
"
"
"
"         INSERT INTO tax_gstr3b_32_ln (tg32l_bu,
"
"                                       tg32l_doc_no,
"
"                                       tg32l_seq_no,
"
"                                       tg32l_typ_code,
"
"                                       tg32l_place_of_supply,
"
"                                       tg32l_tot_taxable_val,
"
"                                       tg32l_tax_amt,
"
"                                       tg32l_cre_by,
"
"                                       tg32l_cre_date)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      v_seq_no,
"
"                      typ_code,
"
"                      pos_dtl,
"
"                      taxable_val,
"
"                      igst_amt,
"
"                      p_user,
"
"                      SYSDATE);
"
"      END proc_ins_rec;
"
"   BEGIN
"
"      DELETE FROM tax_gstr3b_32_ln
"
"            WHERE tg32l_bu = p_bu AND tg32l_doc_no = p_doc_no;
"
"
"
"      FOR r_gstr_32a IN c_gstr_32a
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B32A',
"
"                       r_gstr_32a.state_code,
"
"                       r_gstr_32a.taxable_val,
"
"                       r_gstr_32a.igst_tax_amt);
"
"
"
"                       NULL;
"
"      END LOOP;
"
"
"
"      FOR r_gstr_32b IN c_gstr_32b
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B32B',
"
"                       r_gstr_32b.state_code,
"
"                       r_gstr_32b.taxable_val,
"
"                       r_gstr_32b.igst_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_32c IN c_gstr_32c
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B32C',
"
"                       r_gstr_32c.state_code,
"
"                       r_gstr_32c.taxable_val,
"
"                       r_gstr_32c.igst_tax_amt);
"
"      END LOOP;
"
"   END proc_load_gstr3b_32;
"
"
"
"   PROCEDURE proc_load_gstr3b_40 (
"
"      p_bu         tax_gstr3b_hd.tg3h_bu%TYPE,
"
"      p_doc_no     tax_gstr3b_hd.tg3h_doc_no%TYPE,
"
"      p_date_fr    tax_gstr3b_hd.tg3h_date_from%TYPE,
"
"      p_date_to    tax_gstr3b_hd.tg3h_date_to%TYPE,
"
"      p_user       appl_users.appluser_id%TYPE)
"
"   AS
"
"      CURSOR c_gstr_40a
"
"      IS
"
"         SELECT 0 igst_tax_amt,
"
"                0 cgst_tax_amt,
"
"                0 sgst_tax_amt,
"
"                0 cess_tax_amt
"
"           FROM DUAL;
"
"
"
"      CURSOR c_gstr_40a1
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no,
"
"                          SUM (supln_assbl_val*suphd_exchange_rate)  taxable_val,
"
"                          SUM (supln_igst_amt*suphd_exchange_rate)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt*suphd_exchange_rate)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt*suphd_exchange_rate)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt*suphd_exchange_rate)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist_vw1,
"
"                          suplr_doc_ln_hist_vw1
"
"                    WHERE     suphd_bu = supln_bu
"
"                          AND suphd_doc_no = supln_doc_no
"
"                          AND suphd_doc_type = 'SB'
"
"                           AND suphd_grn_refer  IN ('LC')
"
"                          AND suphd_currency NOT LIKE '%INR%'
"
"                          AND suphd_status = 'P'
"
"                          AND suphd_bu = p_bu
"
"                          AND (TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to)
"
"                          AND supln_tax_pct > 0
"
"                          AND suphd_gst_class = 'M'
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                 GROUP BY suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no
"
"              UNION ALL  /* ADDED ON 19-04-2025*/
"
"              SELECT suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no,
"
"                          SUM (supln_assbl_val *suphd_exchange_rate)  taxable_val,
"
"                          SUM (supln_igst_amt*suphd_exchange_rate)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt*suphd_exchange_rate)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt*suphd_exchange_rate)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt*suphd_exchange_rate)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist_vw1,
"
"                          suplr_doc_ln_hist_vw1
"
"                    WHERE     suphd_bu = supln_bu
"
"                          AND suphd_doc_no = supln_doc_no
"
"                          AND suphd_doc_type = 'SB'
"
"                          AND suphd_currency NOT LIKE '%INR%'
"
"                          AND suphd_status = 'P'
"
"                          AND suphd_bu = p_bu
"
"                          AND (TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to)
"
"                          AND suphd_gst_class = 'M'
"
"                          AND SUPLN_INPUT_TYPE='M'
"
"                          AND supln_tax_pct =0
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                 GROUP BY suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no
"
"               UNION ALL/* ADDED ON 03-07-2025*/
"
"               SELECT suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no,
"
"                          SUM (0 * suphd_exchange_rate)  taxable_val,
"
"                         -- SUM (supln_igst_amt * suphd_exchange_rate)  igst_tax_amt,
"
"                          SUM (supln_assbl_val * suphd_exchange_rate)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt * suphd_exchange_rate)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt * suphd_exchange_rate)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt * suphd_exchange_rate)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist_vw1,
"
"                          suplr_doc_ln_hist_vw1
"
"                    WHERE     suphd_bu = supln_bu
"
"                          AND suphd_doc_no = supln_doc_no
"
"                          AND suphd_doc_type = 'SB'
"
"                          AND suphd_currency LIKE '%INR%'
"
"                          AND  SUPLN_PROD_CLS IS NOT NULL
"
"                          AND suphd_grn_refer  IN ('LC')
"
"                          AND func_find_class_type(SUPLN_BU,SUPLN_PROD_CLS)='IG'
"
"                          AND suphd_status = 'P'
"
"                          AND suphd_bu = p_bu
"
"                          AND (TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to)
"
"                          AND SUPLN_INPUT_TYPE='A'
"
"                          AND supln_tax_pct =0
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                 GROUP BY suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no
"
"                 );
"
"
"
"      CURSOR c_gstr_40a2
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          NULL sdtch_seq_no,
"
"                          SUM (suplnh_assbl_val)  taxable_val,
"
"                          SUM (suplnh_igst_amt)  igst_tax_amt,
"
"                          SUM (suplnh_cgst_amt)  cgst_tax_amt,
"
"                          SUM (suplnh_sgst_amt)  sgst_tax_amt,
"
"                          SUM (suplnh_cess_amt)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist
"
"                    WHERE     suphdh_bu = suplnh_bu
"
"                          AND suphdh_doc_no = suplnh_doc_no
"
"                          AND suplnh_input_type = 'S'
"
"                          AND suplnh_tax_exmpt_flag = 'G'
"
"                          AND suplnh_gst_rev_tax_flag = 'Y'
"
"                          AND suphdh_currency <> 'INR'
"
"                          AND suplnh_type = 'C'
"
"                          AND suphdh_bu = p_bu
"
"                          AND (suphdh_doc_date BETWEEN p_date_fr AND p_date_to)
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no);
"
"
"
"      CURSOR c_gstr_40a3
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no,
"
"                          SUM (supln_assbl_val)  taxable_val,
"
"                          SUM (supln_igst_amt)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist_vw1,
"
"                          suplr_doc_ln_hist_vw1
"
"                    WHERE     suphd_bu = supln_bu
"
"                          AND suphd_doc_no = supln_doc_no
"
"                          AND suphd_status = 'P'
"
"                          AND supln_tax_pct > 0
"
"                          AND suphd_bu = p_bu
"
"                          AND TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                         AND p_date_to
"
"                          AND supln_gst_rev_tax_flag = 'Y'
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                 GROUP BY suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no
"
"                 UNION ALL
"
"                   SELECT btrans_bu suphd_bu,
"
"                               btrans_ord_pfx suphd_pfx,
"
"                               btrans_ord_no suphd_doc_no,
"
"                               btdln_seq_no supln_seq_no,
"
"                          SUM (btdln_tax_assess_val)  taxable_val,
"
"                          SUM (btdln_igst_amt)  igst_tax_amt,
"
"                          SUM (btdln_cgst_amt)  cgst_tax_amt,
"
"                          SUM (btdln_sgst_amt)  sgst_tax_amt,
"
"                          SUM (btdln_cess_amt)  cess_tax_amt
"
"                   FROM bank_trans_hist_vw,
"
"                                  bank_trans_dist_ln_hist_vw
"
"                            WHERE     btrans_bu = btdln_bu
"
"                                  AND btrans_ord_no = btdln_ord_no
"
"                                  AND btdln_tax_pct > 0
"
"                                  AND btrans_bu = p_bu
"
"                                  AND btrans_status NOT IN
"
"                                         ('N', 'X', 'V', 'O', 'D')
"
"                                         AND btdln_gst_rev_tax_flag='Y'
"
"                                  AND TRUNC (btrans_pv_date) BETWEEN p_date_fr
"
"                                                                 AND p_date_to
"
"                                  AND EXISTS
"
"                                         (SELECT 1
"
"                                            FROM gstr2_plant
"
"                                           WHERE     g2p_bu = p_bu
"
"                                                 AND g2p_sel_flag = 'Y'
"
"                                                 AND g2p_doc_no = p_doc_no
"
"                                                 AND g2p_plant = btrans_plant)
"
"                         GROUP BY btrans_bu,btrans_ord_no, btrans_ord_pfx,btdln_seq_no
"
"                );
"
"
"
"      CURSOR c_gstr_40a4
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no,
"
"                          SUM (supln_assbl_val)  taxable_val,
"
"                          SUM (supln_igst_amt)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist_vw1,
"
"                          suplr_doc_ln_hist_vw1
"
"                    WHERE     suphd_bu = supln_bu
"
"                          AND suphd_doc_no = supln_doc_no
"
"                          AND suphd_status = 'P'
"
"                          AND suphd_grn_refer = 'ISD'
"
"                          AND supln_tax_pct > 0
"
"                          AND suphd_bu = p_bu
"
"                          AND TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                         AND p_date_to
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                 GROUP BY suphd_bu,
"
"                          suphd_pfx,
"
"                          suphd_doc_no,
"
"                          supln_seq_no
"
"                         );
"
"
"
"      CURSOR c_gstr_40a5
"
"      IS
"
"         SELECT SUM (suphd_sc_tot_amt) suphd_sc_tot_amt,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (SELECT     --  ROUND ((suphd_sc_tot_amt),2) suphd_sc_tot_amt,
"
"                       SUM (sdgb_assbl_val) suphd_sc_tot_amt,
"
"                        SUM (sdgb_igst_amt) igst_tax_amt,
"
"                        SUM (sdgb_cgst_amt) cgst_tax_amt,
"
"                        SUM ( (sdgb_sgst_amt + sdgb_utgst_amt)) sgst_tax_amt,
"
"                        SUM (sdgb_cess_amt) cess_tax_amt
"
"                   FROM suplr_doc_hd_hist_vw1, suplr_doc_gst_bal
"
"                  WHERE     suphd_bu = sdgb_bu
"
"                        AND suphd_doc_no = sdgb_doc_no
"
"                        AND suphd_bu = p_bu
"
"                        AND TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                       AND p_date_to
"
"                        AND sdgb_tax_mode = 'F'
"
"                        AND suphd_status = 'P'
"
"                        AND suphd_doc_type = 'SB'
"
"                        AND suphd_grn_refer NOT IN ('PTN','LC')
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphd_plant)
"
"                        AND sdgb_tax_pct > 0
"
"                 --     group by suphd_sc_tot_amt
"
"                 UNION ALL
"
"                 SELECT   --  ROUND ((suphdh_sc_tot_amt),2) suphdh_sc_tot_amt,
"
"                       SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'DN'
"
"                              THEN
"
"                                 -1 * sdgb_assbl_val
"
"                              ELSE
"
"                                 sdgb_assbl_val
"
"                           END)
"
"                           suphd_sc_tot_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'DN'
"
"                              THEN
"
"                                 -1 * sdgb_igst_amt
"
"                              ELSE
"
"                                 sdgb_igst_amt
"
"                           END)
"
"                           igst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'DN'
"
"                              THEN
"
"                                 -1 * sdgb_cgst_amt
"
"                              ELSE
"
"                                 sdgb_cgst_amt
"
"                           END)
"
"                           cgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'DN'
"
"                              THEN
"
"                                 -1 * (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                              ELSE
"
"                                 (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                           END)
"
"                           sgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'DN'
"
"                              THEN
"
"                                 -1 * sdgb_cess_amt
"
"                              ELSE
"
"                                 sdgb_cess_amt
"
"                           END)
"
"                           cess_tax_amt
"
"                   FROM suplr_doc_hd_hist, suplr_doc_gst_bal
"
"                  WHERE     suphdh_bu = sdgb_bu
"
"                        AND suphdh_doc_no = sdgb_doc_no
"
"                        AND suphdh_bu = p_bu
"
"                        AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                        AND p_date_to
"
"                        AND sdgb_tax_mode = 'F'
"
"                        AND suphdh_status = 'P'
"
"                        AND suphdh_doc_type = 'DN'
"
"                        AND suphdh_grn_refer NOT IN ('PTN')
"
"                        AND suphdh_src_doc_pfx IS NULL
"
"                        AND suphdh_src_doc_no IS NULL
"
"                        AND sdgb_tax_pct > 0
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphdh_plant)
"
"                 UNION ALL
"
"                 SELECT   --  ROUND ((suphdh_sc_tot_amt),2) suphdh_sc_tot_amt,
"
"                       SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'CN' THEN sdgb_assbl_val
"
"                              ELSE sdgb_assbl_val
"
"                           END)
"
"                           suphd_sc_tot_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'CN' THEN sdgb_igst_amt
"
"                              ELSE sdgb_igst_amt
"
"                           END)
"
"                           igst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'CN' THEN sdgb_cgst_amt
"
"                              ELSE sdgb_cgst_amt
"
"                           END)
"
"                           cgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'CN'
"
"                              THEN
"
"                                 (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                              ELSE
"
"                                 (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                           END)
"
"                           sgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN SUPHDH_DOC_TYPE = 'CN' THEN sdgb_cess_amt
"
"                              ELSE sdgb_cess_amt
"
"                           END)
"
"                           cess_tax_amt
"
"                   FROM suplr_doc_hd_hist, suplr_doc_gst_bal
"
"                  WHERE     suphdh_bu = sdgb_bu
"
"                        AND suphdh_doc_no = sdgb_doc_no
"
"                        AND suphdh_bu = p_bu
"
"                        AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                        AND p_date_to
"
"                        AND sdgb_tax_mode = 'F'
"
"                        AND suphdh_status = 'P'
"
"                        AND suphdh_doc_type IN  ('CN')
"
"                        AND suphdh_src_doc_pfx IS NULL
"
"                        AND suphdh_src_doc_no IS NULL
"
"                        AND sdgb_tax_pct > 0
"
"                        AND suphdh_grn_refer NOT IN ('PTN')
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphdh_plant)
"
"                 UNION ALL
"
"                 SELECT   --  ROUND ((suphdh_sc_tot_amt),2) suphdh_sc_tot_amt,
"
"                       SUM (
"
"                           CASE
"
"                              WHEN suphdh_doc_type IN
"
"                                      ('DN','CN')
"
"                              THEN
"
"                                 -1 * sdgb_assbl_val
"
"                              ELSE
"
"                                 sdgb_assbl_val
"
"                           END)
"
"                           suphd_sc_tot_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN suphdh_doc_type IN
"
"                                      ('DN','CN')
"
"                              THEN
"
"                                 -1 * sdgb_igst_amt
"
"                              ELSE
"
"                                 sdgb_igst_amt
"
"                           END)
"
"                           igst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN suphdh_doc_type IN
"
"                                      ('DN','CN')
"
"                              THEN
"
"                                 -1 * sdgb_cgst_amt
"
"                              ELSE
"
"                                 sdgb_cgst_amt
"
"                           END)
"
"                           cgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN suphdh_doc_type IN
"
"                                      ('DN','CN')
"
"                              THEN
"
"                                 -1 * (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                              ELSE
"
"                                 (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                           END)
"
"                           sgst_tax_amt,
"
"                        SUM (
"
"                           CASE
"
"                              WHEN suphdh_doc_type IN
"
"                                      ('DN','CN')
"
"                              THEN
"
"                                 -1 * sdgb_cess_amt
"
"                              ELSE
"
"                                 sdgb_cess_amt
"
"                           END)
"
"                           cess_tax_amt
"
"                   FROM suplr_doc_hd_hist, suplr_doc_gst_bal
"
"                  WHERE     suphdh_bu = sdgb_bu
"
"                        AND suphdh_doc_no = sdgb_doc_no
"
"                        AND suphdh_bu = p_bu
"
"                        AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                        AND p_date_to
"
"                        AND sdgb_tax_mode = 'F'
"
"                        AND suphdh_status = 'P'
"
"                        AND suphdh_doc_type IN  ('DN','CN')
"
"                        AND sdgb_tax_pct > 0
"
"                        AND suphdh_grn_refer IN ('PTN','EXP') /*'N' TYPE newly added*/
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphdh_plant)
"
"                 UNION ALL
"
"                 SELECT SUM (suphd_sc_tot_amt) suphd_sc_tot_amt,
"
"                        SUM (igst_tax_amt) igst_tax_amt,
"
"                        SUM (cgst_tax_amt) cgst_tax_amt,
"
"                        SUM (sgst_tax_amt) sgst_tax_amt,
"
"                        SUM (cess_tax_amt) cess_tax_amt
"
"                   FROM (  SELECT btrans_ord_no,
"
"                                  btrans_ord_pfx,
"
"                                 SUM ( btdln_tax_assess_val)  suphd_sc_tot_amt, -- btdln_assess_val
"
"                                  SUM (btdln_igst_amt) igst_tax_amt,
"
"                                  SUM (btdln_cgst_amt) cgst_tax_amt,
"
"                                  SUM (btdln_sgst_amt) sgst_tax_amt,
"
"                                  SUM (btdln_cess_amt) cess_tax_amt
"
"                             FROM bank_trans_hist_vw,
"
"                                  bank_trans_dist_ln_hist_vw
"
"                            WHERE     btrans_bu = btdln_bu
"
"                                  AND btrans_ord_no = btdln_ord_no
"
"                                  AND btdln_tax_pct > 0
"
"                                  AND btrans_bu = p_bu
"
"                                  AND btrans_status NOT IN
"
"                                         ('N', 'X', 'V', 'O', 'D')
"
"                                  AND TRUNC (btrans_pv_date) BETWEEN p_date_fr
"
"                                                                 AND p_date_to
"
"                                  AND btdln_gst_rev_tax_flag='N' --newly added (10-Mar-26)
"
"                                  AND EXISTS
"
"                                         (SELECT 1
"
"                                            FROM gstr2_plant
"
"                                           WHERE     g2p_bu = p_bu
"
"                                                 AND g2p_sel_flag = 'Y'
"
"                                                 AND g2p_doc_no = p_doc_no
"
"                                                 AND g2p_plant = btrans_plant)
"
"                         GROUP BY btrans_ord_no, btrans_ord_pfx));
"
"
"
"      --   group by suphdh_sc_tot_amt);
"
"
"
"      CURSOR c_gstr_40b
"
"      IS
"
"         SELECT 0 igst_tax_amt,
"
"                0 cgst_tax_amt,
"
"                0 sgst_tax_amt,
"
"                0 cess_tax_amt
"
"           FROM DUAL;
"
"
"
"      CURSOR c_gstr_40b1
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (SELECT suphd_bu,
"
"                        suphd_pfx,
"
"                        suphd_doc_no,
"
"                        supln_seq_no,
"
"                        suphd_suplr_id,
"
"                        SUM (supln_assbl_val)  taxable_val,
"
"                          SUM (supln_igst_amt)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt)  cess_tax_amt
"
"                   FROM suplr_doc_hd_hist_vw1,
"
"                        suplr_doc_ln_hist_vw1
"
"                  WHERE     suphd_bu = supln_bu
"
"                        AND suphd_doc_no = supln_doc_no
"
"                        AND suphd_status = 'P'
"
"                        AND supln_input_type = 'N'
"
"                        AND supln_inelgbl_type IN ('J', 'K')
"
"                        AND supln_tax_pct > 0
"
"                        AND suphd_bu = p_bu
"
"                        AND TRUNC (suphd_doc_date) BETWEEN p_date_fr
"
"                                                       AND p_date_to
"
"                        AND EXISTS
"
"                               (SELECT 1
"
"                                  FROM gstr2_plant
"
"                                 WHERE     g2p_bu = p_bu
"
"                                       AND g2p_sel_flag = 'Y'
"
"                                       AND g2p_doc_no = p_doc_no
"
"                                       AND g2p_plant = suphd_plant)
"
"                      GROUP BY suphd_bu,
"
"                        suphd_pfx,
"
"                        suphd_doc_no,
"
"                        supln_seq_no,
"
"                        suphd_suplr_id
"
"                      UNION ALL  /* ADDED ON 23-06-2025 (    GSTR3B40D1 PART) */
"
"                      SELECT suphd_bu,
"
"                     suphd_pfx,
"
"                     suphd_doc_no,
"
"                     supln_seq_no,
"
"                     suphd_suplr_id,
"
"                     SUM (supln_assbl_val)  taxable_val,
"
"                          SUM (supln_igst_amt)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt)  cess_tax_amt
"
"                FROM suplr_doc_hd_hist_vw1,
"
"                     suplr_doc_ln_hist_vw1
"
"               WHERE   suphd_status = 'P'
"
"                     AND  supln_bu = suphd_bu
"
"                        AND supln_doc_no = suphd_doc_no
"
"                        AND supln_input_type = 'N'
"
"                        AND supln_inelgbl_type IN ('I')
"
"                     AND supln_tax_pct <> 0
"
"                     AND suphd_bu = p_bu
"
"                     AND TRUNC (suphd_doc_date) BETWEEN TRUNC(TO_DATE(p_date_fr))
"
"                                                    AND trunc(TO_DATE(p_date_to))
"
"                                                    AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                    GROUP BY
"
"                     suphd_bu,
"
"                     suphd_pfx,
"
"                     suphd_doc_no,
"
"                     supln_seq_no,
"
"                     suphd_suplr_id
"
"             UNION ALL
"
"             SELECT NULL suphd_bu,
"
"                        NULL suphd_pfx,
"
"                        NULL suphd_doc_no,
"
"                        NULL supln_seq_no,
"
"                        NULL suphd_suplr_id,
"
"                        0 taxable_val,
"
"                        NVL (
"
"                           CASE
"
"                              WHEN gicl_xmpt_sales <> 0
"
"                                   OR gicl_tot_sales <> 0
"
"                              THEN
"
"                                 NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                                 * gicl_ccr_igst
"
"                           END,
"
"                           0)
"
"                           igst_tax_amt,
"
"                        NVL (
"
"                           CASE
"
"                              WHEN gicl_xmpt_sales <> 0
"
"                                   OR gicl_tot_sales <> 0
"
"                              THEN
"
"                                 NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                                 * gicl_ccr_cgst
"
"                           END,
"
"                           0)
"
"                           cgst_tax_amt,
"
"                        NVL (
"
"                           CASE
"
"                              WHEN gicl_xmpt_sales <> 0
"
"                                   OR gicl_tot_sales <> 0
"
"                              THEN
"
"                                 NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                                 * gicl_ccr_sgst
"
"                           END,
"
"                           0)
"
"                           sgst_tax_amt,
"
"                        0 cess_tax_amt
"
"                   FROM gst_itc_calc_hd, gst_itc_calc_ln
"
"                  WHERE     gich_bu = gicl_bu
"
"                        AND gich_doc_no = gicl_doc_no
"
"                        AND gich_bu = p_bu
"
"                        AND gich_status = 'P'
"
"                        AND gich_fin_year || gich_fin_per IN
"
"                               (SELECT fp_year || fp_period
"
"                                  FROM fin_periods
"
"                                 WHERE fp_bu = gich_bu
"
"                                       AND (TRUNC (p_date_fr) BETWEEN fp_from_date
"
"                                                                  AND fp_end_date
"
"                                            OR TRUNC (p_date_to) BETWEEN fp_from_date
"
"                                                                     AND fp_end_date)));
"
"
"
"      CURSOR c_gstr_40b2
"
"      IS
"
"         SELECT 0 igst_tax_amt,
"
"                0 cgst_tax_amt,
"
"                0 sgst_tax_amt,
"
"                0 cess_tax_amt
"
"           FROM DUAL;
"
"
"
"      CURSOR c_gstr_40c
"
"      IS
"
"         SELECT 0 igst_tax_amt,
"
"                0 cgst_tax_amt,
"
"                0 sgst_tax_amt,
"
"                0 cess_tax_amt
"
"           FROM DUAL;
"
"
"
"      CURSOR c_gstr_40d
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (  SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no,
"
"                          SUM (suplnh_assbl_val)  taxable_val,
"
"                          SUM (suplnh_igst_amt)  igst_tax_amt,
"
"                          SUM (suplnh_cgst_amt)  cgst_tax_amt,
"
"                          SUM (suplnh_sgst_amt)  sgst_tax_amt,
"
"                          SUM (suplnh_cess_amt)  cess_tax_amt
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist
"
"                    WHERE     suplnh_bu = suphdh_bu
"
"                          AND suplnh_doc_no = suphdh_doc_no
"
"                          AND suphdh_grn_refer NOT IN ('PTN')
"
"                          AND suplnh_input_type = 'N'
"
"                          AND suphdh_status = 'P'
"
"                          AND suplnh_tax_pct > 0
"
"                          AND suphdh_bu = p_bu
"
"                          AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no
"
"                 );
"
"
"
"      CURSOR c_gstr_40d1
"
"      IS
"
"         SELECT SUM (taxable_val) taxable_val,
"
"                SUM (igst_tax_amt) igst_tax_amt,
"
"                SUM (cgst_tax_amt) cgst_tax_amt,
"
"                SUM (sgst_tax_amt) sgst_tax_amt,
"
"                SUM (cess_tax_amt) cess_tax_amt
"
"           FROM (SELECT suphd_bu,
"
"                     suphd_pfx,
"
"                     suphd_doc_no,
"
"                     supln_seq_no,
"
"                     suphd_suplr_id,
"
"                     SUM (supln_assbl_val)  taxable_val,
"
"                          SUM (supln_igst_amt)  igst_tax_amt,
"
"                          SUM (supln_cgst_amt)  cgst_tax_amt,
"
"                          SUM (supln_sgst_amt)  sgst_tax_amt,
"
"                          SUM (supln_cess_amt)  cess_tax_amt
"
"                FROM suplr_doc_hd_hist_vw1,
"
"                     suplr_doc_ln_hist_vw1
"
"               WHERE   suphd_status = 'P'
"
"                     AND  supln_bu = suphd_bu
"
"                        AND supln_doc_no = suphd_doc_no
"
"                        AND supln_input_type = 'N'
"
"                        AND supln_inelgbl_type IN ('I')
"
"                     AND supln_tax_pct <> 0
"
"                     AND suphd_bu = p_bu
"
"                     AND TRUNC (suphd_doc_date) BETWEEN TRUNC(TO_DATE(p_date_fr))
"
"                                                    AND trunc(TO_DATE(p_date_to))
"
"                                                    AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphd_plant)
"
"                    GROUP BY
"
"                     suphd_bu,
"
"                     suphd_pfx,
"
"                     suphd_doc_no,
"
"                     supln_seq_no,
"
"                     suphd_suplr_id
"
"             UNION ALL
"
"             SELECT NULL suphd_bu,
"
"                        NULL suphd_pfx,
"
"                        NULL suphd_doc_no,
"
"                        NULL supln_seq_no,
"
"                        NULL suphd_suplr_id,
"
"                        0 taxable_val,
"
"                        NVL (
"
"                           CASE
"
"                              WHEN gicl_xmpt_sales <> 0
"
"                                   OR gicl_tot_sales <> 0
"
"                              THEN
"
"                                 NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                                 * gicl_ccr_igst
"
"                           END,
"
"                           0)
"
"                           igst_tax_amt,
"
"                        NVL (
"
"                           CASE
"
"                              WHEN gicl_xmpt_sales <> 0
"
"                                   OR gicl_tot_sales <> 0
"
"                              THEN
"
"                                 NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                                 * gicl_ccr_cgst
"
"                           END,
"
"                           0)
"
"                           cgst_tax_amt,
"
"                        NVL (
"
"                           CASE
"
"                              WHEN gicl_xmpt_sales <> 0
"
"                                   OR gicl_tot_sales <> 0
"
"                              THEN
"
"                                 NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                                 * gicl_ccr_sgst
"
"                           END,
"
"                           0)
"
"                           sgst_tax_amt,
"
"                        0 cess_tax_amt
"
"                   FROM gst_itc_calc_hd, gst_itc_calc_ln
"
"                  WHERE     gich_bu = gicl_bu
"
"                        AND gich_doc_no = gicl_doc_no
"
"                        AND gich_bu = p_bu
"
"                        AND gich_status = 'P'
"
"                        AND gich_fin_year || gich_fin_per IN
"
"                               (SELECT fp_year || fp_period
"
"                                  FROM fin_periods
"
"                                 WHERE fp_bu = gich_bu
"
"                                       AND (TRUNC (p_date_fr) BETWEEN fp_from_date
"
"                                                                  AND fp_end_date
"
"                                            OR TRUNC (p_date_to) BETWEEN fp_from_date
"
"                                                                     AND fp_end_date)));
"
"
"
"      CURSOR c_gstr_40d2
"
"      IS
"
"         SELECT 0 igst_tax_amt,
"
"                0 cgst_tax_amt,
"
"                0 sgst_tax_amt,
"
"                0 cess_tax_amt
"
"           FROM DUAL;
"
"
"
"
"
"      CURSOR C_comm_cr
"
"      IS
"
"         SELECT 0 taxable_val,
"
"                NVL (
"
"                   CASE
"
"                      WHEN gicl_xmpt_sales <> 0 OR gicl_tot_sales <> 0
"
"                      THEN
"
"                         NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                         * gicl_ccr_igst
"
"                   END,
"
"                   0)
"
"                   igst_tax_amt,
"
"                NVL (
"
"                   CASE
"
"                      WHEN gicl_xmpt_sales <> 0 OR gicl_tot_sales <> 0
"
"                      THEN
"
"                         NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                         * gicl_ccr_cgst
"
"                   END,
"
"                   0)
"
"                   cgst_tax_amt,
"
"                NVL (
"
"                   CASE
"
"                      WHEN gicl_xmpt_sales <> 0 OR gicl_tot_sales <> 0
"
"                      THEN
"
"                         NVL ( (gicl_xmpt_sales / gicl_tot_sales), 0)
"
"                         * gicl_ccr_sgst
"
"                   END,
"
"                   0)
"
"                   sgst_tax_amt,
"
"                0 cess_tax_amt
"
"           FROM gst_itc_calc_hd, gst_itc_calc_ln
"
"          WHERE     gich_bu = gicl_bu
"
"                AND gich_doc_no = gicl_doc_no
"
"                AND gich_bu = p_bu
"
"                AND gich_status = 'P'
"
"                AND gich_fin_year || gich_fin_per IN
"
"                       (SELECT fp_year || fp_period
"
"                          FROM fin_periods
"
"                         WHERE fp_bu = gich_bu
"
"                               AND (TRUNC (p_date_fr) BETWEEN fp_from_date
"
"                                                          AND fp_end_date
"
"                                    OR TRUNC (p_date_to) BETWEEN fp_from_date
"
"                                                             AND fp_end_date));
"
"
"
"      ccr1   C_comm_cr%ROWTYPE;
"
"
"
"      PROCEDURE proc_ins_rec (typ_code    VARCHAR2,
"
"                              taxable     NUMBER,
"
"                              igst_amt    NUMBER,
"
"                              cgst_amt    NUMBER,
"
"                              sgst_amt    NUMBER,
"
"                              cess_amt    NUMBER)
"
"      AS
"
"         v_seq_no   NUMBER;
"
"      BEGIN
"
"         SELECT NVL (MAX (tg40l_seq_no), 0) + 1
"
"           INTO v_seq_no
"
"           FROM tax_gstr3b_40_ln
"
"          WHERE tg40l_bu = p_bu AND tg40l_doc_no = p_doc_no;
"
"
"
"         INSERT INTO tax_gstr3b_40_ln (tg40l_bu,
"
"                                       tg40l_doc_no,
"
"                                       tg40l_seq_no,
"
"                                       tg40l_typ_code,
"
"                                       tg40l_tot_tax_val,
"
"                                       tg40l_igst_amt,
"
"                                       tg40l_cgst_amt,
"
"                                       tg40l_sgst_amt,
"
"                                       tg40l_cess_amt,
"
"                                       tg40l_cre_by,
"
"                                       tg40l_cre_date)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      v_seq_no,
"
"                      typ_code,
"
"                      NVL (taxable, 0),
"
"                      NVL (igst_amt, 0),
"
"                      NVL (cgst_amt, 0),
"
"                      NVL (sgst_amt, 0),
"
"                      NVL (cess_amt, 0),
"
"                      p_user,
"
"                      SYSDATE);
"
"      END proc_ins_rec;
"
"   BEGIN
"
"      DELETE FROM tax_gstr3b_40_ln
"
"            WHERE tg40l_bu = p_bu AND tg40l_doc_no = p_doc_no;
"
"
"
"      FOR r_gstr_40a IN c_gstr_40a
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40A',
"
"                       0,
"
"                       r_gstr_40a.igst_tax_amt,
"
"                       r_gstr_40a.cgst_tax_amt,
"
"                       r_gstr_40a.sgst_tax_amt,
"
"                       r_gstr_40a.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_40a1 IN c_gstr_40a1
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40A1',
"
"                       r_gstr_40a1.taxable_val,
"
"                       r_gstr_40a1.igst_tax_amt,
"
"                       r_gstr_40a1.cgst_tax_amt,
"
"                       r_gstr_40a1.sgst_tax_amt,
"
"                       r_gstr_40a1.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_40a2 IN c_gstr_40a2
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40A2',
"
"                       r_gstr_40a2.taxable_val,
"
"                       r_gstr_40a2.igst_tax_amt,
"
"                       r_gstr_40a2.cgst_tax_amt,
"
"                       r_gstr_40a2.sgst_tax_amt,
"
"                       r_gstr_40a2.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_40a3 IN c_gstr_40a3
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40A3',
"
"                       r_gstr_40a3.taxable_val,
"
"                       r_gstr_40a3.igst_tax_amt,
"
"                       r_gstr_40a3.cgst_tax_amt,
"
"                       r_gstr_40a3.sgst_tax_amt,
"
"                       r_gstr_40a3.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_40a4 IN c_gstr_40a4
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40A4',
"
"                       r_gstr_40a4.taxable_val,
"
"                       r_gstr_40a4.igst_tax_amt,
"
"                       r_gstr_40a4.cgst_tax_amt,
"
"                       r_gstr_40a4.sgst_tax_amt,
"
"                       r_gstr_40a4.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_40a5 IN c_gstr_40a5
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40A5',
"
"                       r_gstr_40a5.suphd_sc_tot_amt,
"
"                       r_gstr_40a5.igst_tax_amt,
"
"                       r_gstr_40a5.cgst_tax_amt,
"
"                       r_gstr_40a5.sgst_tax_amt,
"
"                       r_gstr_40a5.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      UPDATE tax_gstr3b_40_ln
"
"         SET tg40l_tot_tax_val =
"
"                (SELECT SUM (tg40l_tot_tax_val)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE tg40l_bu = p_bu AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN
"
"                               ('GSTR3B40A1',
"
"                                'GSTR3B40A2',
"
"                                'GSTR3B40A3',
"
"                                'GSTR3B40A4',
"
"                                'GSTR3B40A5')),
"
"             tg40l_igst_amt =
"
"                (SELECT SUM (tg40l_igst_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE tg40l_bu = p_bu AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN
"
"                               ('GSTR3B40A1',
"
"                                'GSTR3B40A2',
"
"                                'GSTR3B40A3',
"
"                                'GSTR3B40A4',
"
"                                'GSTR3B40A5')),
"
"             tg40l_cgst_amt =
"
"                (SELECT SUM (tg40l_cgst_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE tg40l_bu = p_bu AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN
"
"                               ('GSTR3B40A1',
"
"                                'GSTR3B40A2',
"
"                                'GSTR3B40A3',
"
"                                'GSTR3B40A4',
"
"                                'GSTR3B40A5')),
"
"             tg40l_sgst_amt =
"
"                (SELECT SUM (tg40l_sgst_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE tg40l_bu = p_bu AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN
"
"                               ('GSTR3B40A1',
"
"                                'GSTR3B40A2',
"
"                                'GSTR3B40A3',
"
"                                'GSTR3B40A4',
"
"                                'GSTR3B40A5')),
"
"             tg40l_cess_amt =
"
"                (SELECT SUM (tg40l_cess_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE tg40l_bu = p_bu AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN
"
"                               ('GSTR3B40A1',
"
"                                'GSTR3B40A2',
"
"                                'GSTR3B40A3',
"
"                                'GSTR3B40A4',
"
"                                'GSTR3B40A5'))
"
"       WHERE     tg40l_bu = p_bu
"
"             AND tg40l_doc_no = p_doc_no
"
"             AND tg40l_typ_code = 'GSTR3B40A';
"
"
"
"      FOR r_gstr_40b IN c_gstr_40b
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40B',
"
"                       0,
"
"                       r_gstr_40b.igst_tax_amt,
"
"                       r_gstr_40b.cgst_tax_amt,
"
"                       r_gstr_40b.sgst_tax_amt,
"
"                       r_gstr_40b.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_40b1 IN c_gstr_40b1
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40B1',
"
"                       r_gstr_40b1.taxable_val,
"
"                       r_gstr_40b1.igst_tax_amt,
"
"                       r_gstr_40b1.cgst_tax_amt,
"
"                       r_gstr_40b1.sgst_tax_amt,
"
"                       r_gstr_40b1.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_40b2 IN c_gstr_40b2
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40B2',
"
"                       0,
"
"                       r_gstr_40b2.igst_tax_amt,
"
"                       r_gstr_40b2.cgst_tax_amt,
"
"                       r_gstr_40b2.sgst_tax_amt,
"
"                       r_gstr_40b2.cess_tax_amt);
"
"      END LOOP;
"
"
"
"      UPDATE tax_gstr3b_40_ln
"
"         SET tg40l_tot_tax_val =
"
"                (SELECT SUM (tg40l_tot_tax_val)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN ('GSTR3B40B1', 'GSTR3B40B2')),
"
"             tg40l_igst_amt =
"
"                (SELECT SUM (tg40l_igst_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN ('GSTR3B40B1', 'GSTR3B40B2')),
"
"             tg40l_cgst_amt =
"
"                (SELECT SUM (tg40l_cgst_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN ('GSTR3B40B1', 'GSTR3B40B2')),
"
"             tg40l_sgst_amt =
"
"                (SELECT SUM (tg40l_sgst_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN ('GSTR3B40B1', 'GSTR3B40B2')),
"
"             tg40l_cess_amt =
"
"                (SELECT SUM (tg40l_cess_amt)
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code IN ('GSTR3B40B1', 'GSTR3B40B2'))
"
"       WHERE     tg40l_bu = p_bu
"
"             AND tg40l_doc_no = p_doc_no
"
"             AND tg40l_typ_code = 'GSTR3B40B';
"
"
"
"      FOR r_gstr_40c IN c_gstr_40c
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40C',
"
"                       0,
"
"                       r_gstr_40c.igst_tax_amt,
"
"                       r_gstr_40c.cgst_tax_amt,
"
"                       r_gstr_40c.sgst_tax_amt,
"
"                       r_gstr_40c.cess_tax_amt);
"
"      END LOOP;
"
"
"
"
"
"      OPEN C_comm_cr;
"
"
"
"      FETCH C_comm_cr INTO Ccr1;
"
"
"
"      CLOSE C_comm_cr;
"
"
"
"
"
"      UPDATE tax_gstr3b_40_ln
"
"         SET tg40l_tot_tax_val =
"
"                (SELECT tg40l_tot_tax_val
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40A')
"
"                - (SELECT tg40l_tot_tax_val
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40B')
"
"                - NVL (Ccr1.taxable_val, 0),
"
"             tg40l_igst_amt =
"
"                (SELECT tg40l_igst_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40A')
"
"                - (SELECT tg40l_igst_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40B')
"
"                - NVL (ccr1.igst_tax_amt, 0),
"
"             tg40l_cgst_amt =
"
"                (SELECT tg40l_cgst_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40A')
"
"                - (SELECT tg40l_cgst_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40B')
"
"                - NVL (ccr1.cgst_tax_amt, 0),
"
"             tg40l_sgst_amt =
"
"                (SELECT tg40l_sgst_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40A')
"
"                - (SELECT tg40l_sgst_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40B')
"
"                - NVL (ccr1.sgst_tax_amt, 0),
"
"             tg40l_cess_amt =
"
"                (SELECT tg40l_cess_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40A')
"
"                - (SELECT tg40l_cess_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40B')
"
"                - NVL (ccr1.cess_tax_amt, 0)
"
"       WHERE     tg40l_bu = p_bu
"
"             AND tg40l_doc_no = p_doc_no
"
"             AND tg40l_typ_code = 'GSTR3B40C';
"
"
"
"
"
"
"
"      FOR r_gstr_40d IN c_gstr_40d
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40D',
"
"                       r_gstr_40d.taxable_val,
"
"                       r_gstr_40d.igst_tax_amt,
"
"                       r_gstr_40d.cgst_tax_amt,
"
"                       r_gstr_40d.sgst_tax_amt,
"
"                       r_gstr_40d.cess_tax_amt);
"
"      END LOOP;
"
"/*
"
"      FOR r_gstr_40d1 IN c_gstr_40d1
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40D1',
"
"                       r_gstr_40d1.taxable_val,
"
"                       r_gstr_40d1.igst_tax_amt,
"
"                       r_gstr_40d1.cgst_tax_amt,
"
"                       r_gstr_40d1.sgst_tax_amt,
"
"                       r_gstr_40d1.cess_tax_amt);
"
"      END LOOP;
"
"      */
"
"
"
"      FOR r_gstr_40d2 IN c_gstr_40d2
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B40D2',
"
"                       0,
"
"                       r_gstr_40d2.igst_tax_amt,
"
"                       r_gstr_40d2.cgst_tax_amt,
"
"                       r_gstr_40d2.sgst_tax_amt,
"
"                       r_gstr_40d2.cess_tax_amt);
"
"      END LOOP;
"
"
"
"
"
"      UPDATE tax_gstr3b_40_ln
"
"         SET tg40l_tot_tax_val =
"
"              /*  (SELECT tg40l_tot_tax_val
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40D1')
"
"                +*/ (SELECT tg40l_tot_tax_val
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40D2'),
"
"             tg40l_igst_amt =
"
"              /*  (SELECT tg40l_igst_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40D1')
"
"                +*/ (SELECT tg40l_igst_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40D2'),
"
"             tg40l_cgst_amt =
"
"             /*   (SELECT tg40l_cgst_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40D1')
"
"                + */(SELECT tg40l_cgst_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40D2'),
"
"             tg40l_sgst_amt =
"
"              /*  (SELECT tg40l_sgst_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40D1')
"
"                +*/ (SELECT tg40l_sgst_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40D2'),
"
"             tg40l_cess_amt =
"
"            /*    (SELECT tg40l_cess_amt
"
"                   FROM tax_gstr3b_40_ln
"
"                  WHERE     tg40l_bu = p_bu
"
"                        AND tg40l_doc_no = p_doc_no
"
"                        AND tg40l_typ_code = 'GSTR3B40D1')
"
"                + */(SELECT tg40l_cess_amt
"
"                     FROM tax_gstr3b_40_ln
"
"                    WHERE     tg40l_bu = p_bu
"
"                          AND tg40l_doc_no = p_doc_no
"
"                          AND tg40l_typ_code = 'GSTR3B40D2')
"
"       WHERE     tg40l_bu = p_bu
"
"             AND tg40l_doc_no = p_doc_no
"
"             AND tg40l_typ_code = 'GSTR3B40D';
"
"   END proc_load_gstr3b_40;
"
"
"
"   PROCEDURE proc_load_gstr3b_50 (
"
"      p_bu         tax_gstr3b_hd.tg3h_bu%TYPE,
"
"      p_doc_no     tax_gstr3b_hd.tg3h_doc_no%TYPE,
"
"      p_date_fr    tax_gstr3b_hd.tg3h_date_from%TYPE,
"
"      p_date_to    tax_gstr3b_hd.tg3h_date_to%TYPE,
"
"      p_user       appl_users.appluser_id%TYPE)
"
"   AS
"
"     /* CURSOR c_gstr_50a
"
"      IS
"
"         SELECT SUM (inter_taxable_val) inter_taxable_val,
"
"                SUM (intra_taxable_val) intra_taxable_val
"
"           FROM (SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN suplnh_igst_amt >0
"
"                                THEN
"
"                                   suplnh_assbl_val
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             inter_taxable_val,
"
"                          SUM(CASE
"
"                              WHEN suplnh_cgst_amt >0
"
"                              THEN
"
"                                 suplnh_assbl_val
"
"                              ELSE
"
"                                 0
"
"                           END)
"
"                             intra_taxable_val
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist
"
"                    WHERE     suphdh_bu = suplnh_bu
"
"                          AND suphdh_doc_no = suplnh_doc_no
"
"                          AND suphdh_status = 'P'
"
"                          AND suphdh_gst_class IN ('I', 'L')
"
"                          AND suphdh_currency LIKE '%INR%'
"
"                          AND suphdh_doc_type = 'SB'
"
"                          AND suphdh_bu = p_bu
"
"                          AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to
"
"                          AND suplnh_tax_pct = 0
"
"                          AND suphdh_grn_refer NOT IN ('PTN')
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no);*/
"
"      CURSOR c_gstr_50a
"
"      IS
"
"         SELECT SUM (inter_taxable_val) inter_taxable_val,
"
"                SUM (intra_taxable_val) intra_taxable_val
"
"           FROM (SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN suplnh_igst_amt >0
"
"                                THEN
"
"                                   suplnh_assbl_val
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             inter_taxable_val,
"
"                          SUM(CASE
"
"                              WHEN suplnh_cgst_amt >0
"
"                              THEN
"
"                                 suplnh_assbl_val
"
"                              ELSE
"
"                                 0
"
"                           END)
"
"                             intra_taxable_val
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist
"
"                    WHERE     suphdh_bu = suplnh_bu
"
"                          AND suphdh_doc_no = suplnh_doc_no
"
"                          AND suphdh_status = 'P'
"
"                          AND suphdh_gst_class IN ('I', 'L')
"
"                          AND suphdh_currency LIKE '%INR%'
"
"                          AND suphdh_doc_type = 'SB'
"
"                          AND suphdh_bu = p_bu
"
"                          AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr
"
"                                                          AND p_date_to
"
"                          AND suplnh_tax_pct > 0
"
"                          AND suplnh_tax_exmpt_flag IN  ('C')
"
"                          AND suphdh_grn_refer NOT IN ('PTN')
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no
"
"                    UNION ALL    --added on 22-01-2025
"
"                        SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no,
"
"                          inter_taxable_val,
"
"                          intra_taxable_val
"
"                     FROM (SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          1 suplnh_seq_no,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN bup_state <> ssl_state
"
"                                THEN
"
"                                   suphdh_sc_tot_amt
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             inter_taxable_val,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN bup_state = ssl_state
"
"                                THEN
"
"                                   suphdh_sc_tot_amt
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             intra_taxable_val
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist,
"
"                          bus_unit_plants,
"
"                          suplr_ship_loc
"
"                    WHERE     suphdh_bu = suplnh_bu
"
"                          AND suphdh_doc_no = suplnh_doc_no
"
"                          AND bup_bu = suphdh_bu
"
"                          AND bup_plant_id = suphdh_plant
"
"                          AND ssl_bu = suphdh_bu
"
"                          AND ssl_suplr_id = suphdh_suplr_id
"
"                          AND ssl_loc_name1 = suphdh_bill_loc_name
"
"                          AND suplnh_tax_pct = 0
"
"                          AND suphdh_status = 'P'
"
"                          AND suplnh_tax_exmpt_flag IN  ('R')  -- AND suphdh_gst_type = 'O'
"
"                          AND suphdh_bu = p_bu
"
"                          AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr  AND p_date_to
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no
"
"              UNION
"
"                 SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          1 suplnh_seq_no,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN bup_state <> ssl_state
"
"                                THEN
"
"                                   suphdh_sc_tot_amt
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             inter_taxable_val,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN bup_state = ssl_state
"
"                                THEN
"
"                                   suphdh_sc_tot_amt
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             intra_taxable_val
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist,
"
"                          bus_unit_plants,
"
"                          suplr_ship_loc
"
"                    WHERE     suphdh_bu = suplnh_bu
"
"                          AND suphdh_doc_no = suplnh_doc_no
"
"                          AND bup_bu = suphdh_bu
"
"                          AND bup_plant_id = suphdh_plant
"
"                          AND ssl_bu = suphdh_bu
"
"                          AND ssl_suplr_id = suphdh_suplr_id
"
"                          AND ssl_loc_name1 = suphdh_bill_loc_name
"
"                          AND suplnh_tax_pct = 0
"
"                          AND suphdh_status = 'P'
"
"                            AND suplnh_tax_exmpt_flag IN  ('Y')  -- AND suphdh_gst_type = 'O'
"
"                          AND suphdh_bu = p_bu
"
"                          AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr  AND p_date_to
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no));
"
"
"
"      CURSOR c_gstr_50b
"
"      IS
"
"         SELECT SUM (inter_taxable_val) inter_taxable_val,
"
"                SUM (intra_taxable_val) intra_taxable_val
"
"           FROM ( SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN suplnh_igst_amt >0
"
"                                THEN
"
"                                   suplnh_assbl_val
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             inter_taxable_val,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN suplnh_cgst_amt >0
"
"                                THEN
"
"                                   suplnh_assbl_val
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             intra_taxable_val
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist
"
"                    WHERE     suphdh_bu = suplnh_bu
"
"                          AND suphdh_doc_no = suplnh_doc_no
"
"                          AND suphdh_status = 'P'
"
"                          AND suphdh_bu = p_bu
"
"                          AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr  AND p_date_to
"
"                          AND suplnh_tax_exmpt_flag = 'N'   -- AND suphdh_gst_type = 'O'
"
"                          AND suplnh_tax_pct > 0
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no
"
"                 UNION ALL
"
"                   SELECT suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN bup_state <> ssl_state
"
"                                THEN
"
"                                   suphdh_sc_tot_amt
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             inter_taxable_val,
"
"                          SUM (
"
"                             CASE
"
"                                WHEN bup_state = ssl_state
"
"                                THEN
"
"                                   suphdh_sc_tot_amt
"
"                                ELSE
"
"                                   0
"
"                             END)
"
"                             intra_taxable_val
"
"                     FROM suplr_doc_hd_hist,
"
"                          suplr_doc_ln_hist,
"
"                          bus_unit_plants,
"
"                          suplr_ship_loc
"
"                    WHERE     suphdh_bu = suplnh_bu
"
"                          AND suphdh_doc_no = suplnh_doc_no
"
"                          AND bup_bu = suphdh_bu
"
"                          AND bup_plant_id = suphdh_plant
"
"                          AND ssl_bu = suphdh_bu
"
"                          AND ssl_suplr_id = suphdh_suplr_id
"
"                          AND ssl_loc_name1 = suphdh_bill_loc_name
"
"                          AND suplnh_tax_pct = 0
"
"                          AND suphdh_status = 'P'
"
"                            AND suplnh_tax_exmpt_flag = 'N'  -- AND suphdh_gst_type = 'O'
"
"                          AND suphdh_bu = p_bu
"
"                          AND TRUNC (suphdh_doc_date) BETWEEN p_date_fr  AND p_date_to
"
"                          AND EXISTS
"
"                                 (SELECT 1
"
"                                    FROM gstr2_plant
"
"                                   WHERE     g2p_bu = p_bu
"
"                                         AND g2p_sel_flag = 'Y'
"
"                                         AND g2p_doc_no = p_doc_no
"
"                                         AND g2p_plant = suphdh_plant)
"
"                 GROUP BY suphdh_bu,
"
"                          suphdh_pfx,
"
"                          suphdh_doc_no,
"
"                          suplnh_seq_no);
"
"
"
"      PROCEDURE proc_ins_rec (typ_code     VARCHAR2,
"
"                              inter_val    NUMBER,
"
"                              intra_val    NUMBER)
"
"      AS
"
"         v_seq_no   NUMBER;
"
"      BEGIN
"
"         SELECT NVL (MAX (tg50l_seq_no), 0) + 1
"
"           INTO v_seq_no
"
"           FROM tax_gstr3b_50_ln
"
"          WHERE tg50l_bu = p_bu AND tg50l_doc_no = p_doc_no;
"
"
"
"         INSERT INTO tax_gstr3b_50_ln (tg50l_bu,
"
"                                       tg50l_doc_no,
"
"                                       tg50l_seq_no,
"
"                                       tg50l_typ_code,
"
"                                       tg50l_inter_state_amt,
"
"                                       tg50l_intra_state_amt,
"
"                                       tg50l_cre_by,
"
"                                       tg50l_cre_date)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      v_seq_no,
"
"                      typ_code,
"
"                      NVL (inter_val, 0),
"
"                      NVL (intra_val, 0),
"
"                      p_user,
"
"                      SYSDATE);
"
"      END proc_ins_rec;
"
"   BEGIN
"
"      DELETE FROM tax_gstr3b_50_ln
"
"            WHERE tg50l_bu = p_bu AND tg50l_doc_no = p_doc_no;
"
"
"
"      FOR r_gstr_50a IN c_gstr_50a
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B50A',
"
"                       r_gstr_50a.inter_taxable_val,
"
"                       r_gstr_50a.intra_taxable_val);
"
"      END LOOP;
"
"
"
"      FOR r_gstr_50b IN c_gstr_50b
"
"      LOOP
"
"         proc_ins_rec ('GSTR3B50B',
"
"                       r_gstr_50b.inter_taxable_val,
"
"                       r_gstr_50b.intra_taxable_val);
"
"      END LOOP;
"
"   END proc_load_gstr3b_50;
"
"
"
"   PROCEDURE proc_load_gstr3b_tds (
"
"      p_bu         tax_gstr3b_hd.tg3h_bu%TYPE,
"
"      p_doc_no     tax_gstr3b_hd.tg3h_doc_no%TYPE,
"
"      p_date_fr    tax_gstr3b_hd.tg3h_date_from%TYPE,
"
"      p_date_to    tax_gstr3b_hd.tg3h_date_to%TYPE,
"
"      p_user       appl_users.appluser_id%TYPE)
"
"   AS
"
"      CURSOR c_gst3b_tds
"
"      IS
"
"           SELECT cust_name,
"
"                  SUM (igst_tax_amt) igst_tax_amt,
"
"                  SUM (cgst_tax_amt) cgst_tax_amt,
"
"                  SUM (sgst_tax_amt) sgst_tax_amt,
"
"                  SUM (cess_tax_amt) cess_tax_amt
"
"             FROM (  SELECT btrans_ord_no,
"
"                            btrans_ord_pfx,
"
"                            btdln_src_bfcry_id cust_name,
"
"                            SUM (
"
"                               CASE
"
"                                  WHEN glac_gst_tds_flag = 'I'
"
"                                  THEN
"
"                                     btdln_dist_amt
"
"                                  ELSE
"
"                                     0
"
"                               END)
"
"                               igst_tax_amt,
"
"                            SUM (
"
"                               CASE
"
"                                  WHEN glac_gst_tds_flag = 'Y'
"
"                                  THEN
"
"                                     btdln_dist_amt / 2
"
"                                  ELSE
"
"                                     0
"
"                               END)
"
"                               cgst_tax_amt,
"
"                            SUM (
"
"                               CASE
"
"                                  WHEN glac_gst_tds_flag IN ('Y')
"
"                                  THEN
"
"                                     btdln_dist_amt / 2
"
"                                  ELSE
"
"                                     0
"
"                               END)
"
"                               sgst_tax_amt,
"
"                            0 cess_tax_amt
"
"                       FROM bank_trans_hist_vw,
"
"                            bank_trans_dist_ln_hist_vw,
"
"                            gl_accts
"
"                      WHERE     btrans_bu = btdln_bu
"
"                            AND btrans_ord_no = btdln_ord_no
"
"                            AND glac_bu = btdln_bu
"
"                            AND glac_acct = btdln_acct
"
"                            AND glac_gst_tds_flag IN ('Y', 'I')
"
"                            AND btrans_bu = p_bu
"
"                            AND btrans_status NOT IN ('N', 'X', 'V', 'O', 'D')
"
"                            AND btdln_assess_val > 0
"
"                            AND btdln_pct > 0
"
"                            AND TRUNC (btrans_pv_date) BETWEEN p_date_fr
"
"                                                           AND p_date_to
"
"                            AND EXISTS
"
"                                   (SELECT 1
"
"                                      FROM gstr2_plant
"
"                                     WHERE     g2p_bu = p_bu
"
"                                           AND g2p_sel_flag = 'Y'
"
"                                           AND g2p_doc_no = p_doc_no
"
"                                           AND g2p_plant = btrans_plant)
"
"                   GROUP BY btrans_ord_no, btrans_ord_pfx, btdln_src_bfcry_id)
"
"         GROUP BY cust_name;
"
"
"
"      PROCEDURE proc_ins_rec (typ_code    VARCHAR2,
"
"                              igst_val    NUMBER,
"
"                              cgst_val    NUMBER,
"
"                              sgst_val    NUMBER,
"
"                              cess_val    NUMBER)
"
"      AS
"
"         v_seq_no   NUMBER;
"
"      BEGIN
"
"         SELECT NVL (MAX (tgttc_seq_no), 0) + 1
"
"           INTO v_seq_no
"
"           FROM tax_gstr3b_tds_tcs_cr
"
"          WHERE tgttc_bu = p_bu AND tgttc_doc_no = p_doc_no;
"
"
"
"         INSERT INTO tax_gstr3b_tds_tcs_cr (tgttc_bu,
"
"                                            tgttc_doc_no,
"
"                                            tgttc_seq_no,
"
"                                            tgttc_dtl,
"
"                                            tgttc_igst_amt,
"
"                                            tgttc_cgst_amt,
"
"                                            tgttc_sgst_amt,
"
"                                            tgttc_cess_amt,
"
"                                            tgttc_cre_by,
"
"                                            tgttc_cre_ip_addr,
"
"                                            tgttc_cre_os_user,
"
"                                            tgttc_cre_date)
"
"              VALUES (p_bu,
"
"                      p_doc_no,
"
"                      v_seq_no,
"
"                      typ_code,
"
"                      NVL (igst_val, 0),
"
"                      NVL (cgst_val, 0),
"
"                      NVL (sgst_val, 0),
"
"                      NVL (cess_val, 0),
"
"                      p_user,
"
"                      AUDIT_INFO.GET_IP_ADDRESS,
"
"                      AUDIT_INFO.GET_OS_USER,
"
"                      SYSDATE);
"
"      END proc_ins_rec;
"
"   BEGIN
"
"      DELETE FROM tax_gstr3b_tds_tcs_cr
"
"            WHERE tgttc_bu = p_bu AND tgttc_doc_no = p_doc_no;
"
"
"
"      FOR r_gstr_tds IN c_gst3b_tds
"
"      LOOP
"
"         proc_ins_rec (r_gstr_tds.cust_name,
"
"                       r_gstr_tds.igst_tax_amt,
"
"                       r_gstr_tds.cgst_tax_amt,
"
"                       r_gstr_tds.sgst_tax_amt,
"
"                       r_gstr_tds.cess_tax_amt);
"
"      END LOOP;
"
"   END proc_load_gstr3b_tds;
"
"
"
"   PROCEDURE proc_load_gstr3b_nw (
"
"      p_bu         tax_gstr3b_hd.tg3h_bu%TYPE,
"
"      p_doc_no     tax_gstr3b_hd.tg3h_doc_no%TYPE,
"
"      p_date_fr    tax_gstr3b_hd.tg3h_date_from%TYPE,
"
"      p_date_to    tax_gstr3b_hd.tg3h_date_to%TYPE,
"
"      p_user       appl_users.appluser_id%TYPE)
"
"   AS
"
"   BEGIN
"
"      proc_load_gstr3b_31 (p_bu,
"
"                           p_doc_no,
"
"                           p_date_fr,
"
"                           p_date_to,
"
"                           p_user);
"
"
"
"      proc_load_gstr3b_32 (p_bu,
"
"                           p_doc_no,
"
"                           p_date_fr,
"
"                           p_date_to,
"
"                           p_user);
"
"
"
"      proc_load_gstr3b_40 (p_bu,
"
"                           p_doc_no,
"
"                           p_date_fr,
"
"                           p_date_to,
"
"                           p_user);
"
"
"
"      proc_load_gstr3b_50 (p_bu,
"
"                           p_doc_no,
"
"                           p_date_fr,
"
"                           p_date_to,
"
"                           p_user);
"
"      proc_load_gstr3b_tds (p_bu,
"
"                            p_doc_no,
"
"                            p_date_fr,
"
"                            p_date_to,
"
"                            p_user);
"
"   END proc_load_gstr3b_nw;
"
"END pkg_gstr3b_nw;"
/
