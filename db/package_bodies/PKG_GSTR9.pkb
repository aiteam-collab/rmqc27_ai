CREATE OR REPLACE
"PACKAGE BODY pkg_gstr9
"
"AS
"
"   PROCEDURE proc_load_gstr9_4 (p_bu        gstr9_hd.g9h_bu%type,
"
"                                p_year      gstr9_hd.g9h_year%type,
"
"                                p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                p_user      VARCHAR2)
"
"   IS
"
"   BEGIN
"
"   /* TYPE A - Supplies made to un-registered persons (B2C) */
"
"
"
"   INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                   g45dd_doc_no,
"
"                                   g45dd_code_type,
"
"                                   g45dd_45_type,
"
"                                   g45dd_inv_no,
"
"                                   g45dd_inv_pfx,
"
"                                   g45dd_inv_date,
"
"                                   g45dd_tax_amt,
"
"                                   g45dd_cgst_amt,
"
"                                   g45dd_sgst_amt,
"
"                                   g45dd_igst_amt,
"
"                                   g45dd_cess_amt,
"
"                                   g45dd_cre_by,
"
"                                   g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'A',
"
"                             'TP',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                      SELECT sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             sihd_inv_date,
"
"                             --SUM (dISTINCT ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                             SUM (
"
"                            CASE
"
"                               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                               THEN
"
"                                  SILN_ASSBL_VAL
"
"                               ELSE
"
"                                  0
"
"                            END) taxable_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_gstc_amt
"
"                        FROM sales_invoices_hd,
"
"                             sales_invoices_ln,
"
"                             --sales_inv_line_tax_charges,
"
"                             suppliers,
"
"                             tax_charges_types,
"
"                             tax_charges,
"
"                             suplr_ship_loc,
"
"                             states
"
"                       WHERE     sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                            -- AND siln_bu = siltc_bu
"
"                           --  AND siln_plnt = siltc_plnt
"
"                         --    AND siln_doc_no = siltc_doc_no
"
"                         --    AND siln_seq_no = siltc_seq_no
"
"                             AND sihd_bu = suplr_bu
"
"                             AND sihd_cust_id = suplr_suplr_id
"
"                             AND tctype_bu = tc_bu
"
"                             AND tctype_id = tc_type_id
"
"                             --AND siltc_bu = tc_bu
"
"                             --AND siltc_tc_id = tc_tc_id
"
"                             AND tctype_type_id IN ('CGST', 'SGST', 'IGST', 'UTGST')
"
"                             AND sihd_bu = p_bu
"
"                             AND sihd_type IN
"
"                                    ('SO',
"
"                                     'FA',
"
"                                     'SS',
"
"                                     'LO',
"
"                                     'SI',
"
"                                     'SU',
"
"                                     'FE',
"
"                                     'DE'/*,
"
"                                        ''
"
"                                     || DECODE ( (SELECT gh_si_type_st
"
"                                                    FROM gstr1_hd
"
"                                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                'Y', 'ST',
"
"                                                NULL)
"
"                                     || '',
"
"                                        ''
"
"                                     || DECODE ( (SELECT gh_si_type_fs
"
"                                                    FROM gstr1_hd
"
"                                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                'Y', 'FS',
"
"                                                NULL)
"
"                                     || ''*/)
"
"                             AND sihd_status = 'I'
"
"                           --  AND siltc_tc_pct <> 0
"
"                             AND suplr_status = 'A'
"
"                             AND sihd_gst_cust_type NOT IN ('E')
"
"                             AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                             AND sihd_cust_id = ssl_suplr_id
"
"                             AND sihd_bu = ssl_bu
"
"                             AND ssl_state = state_id
"
"                            /* AND EXISTS
"
"                                    (SELECT gp_plant
"
"                                       FROM gstr9_plant
"
"                                      WHERE     gp_bu = p_bu
"
"                                            AND gp_sel_flag = 'Y'
"
"                                            AND gp_doc_no = p_doc_no
"
"                                            AND gp_plant = sihd_plant)*/
"
"                             AND sihd_year = p_year
"
"                    GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                    UNION ALL
"
"                      SELECT sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             sihd_inv_date,
"
"                             --SUM ( dISTINCT ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                             SUM (
"
"                            CASE
"
"                               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                               THEN
"
"                                  SILN_ASSBL_VAL
"
"                               ELSE
"
"                                  0
"
"                            END) taxable_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_gstc_amt
"
"                        FROM sales_invoices_hd,
"
"                             sales_invoices_ln,
"
"                           --  sales_inv_line_tax_charges,
"
"                             suppliers,
"
"                             tax_charges_types,
"
"                             tax_charges,
"
"                             suplr_ship_loc,
"
"                             states
"
"                       WHERE     sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                             --AND siln_bu = siltc_bu
"
"                             --AND siln_plnt = siltc_plnt
"
"                             --AND siln_doc_no = siltc_doc_no
"
"                             --AND siln_seq_no = siltc_seq_no
"
"                             AND sihd_bu = suplr_bu
"
"                             AND sihd_cust_id = suplr_suplr_id
"
"                             AND tctype_bu = tc_bu
"
"                             AND tctype_id = tc_type_id
"
"                             --AND siltc_bu = tc_bu
"
"                             --AND siltc_tc_id = tc_tc_id
"
"                             AND sihd_bu = p_bu
"
"                             AND tctype_type_id IN ('CGST', 'SGST', 'IGST', 'UTGST')
"
"                             AND sihd_type IN ('PR', 'NS', 'NN', 'SP')
"
"                             --AND sihd_rtn_doc_type = 'I'
"
"                             AND sihd_status = 'I'
"
"                            -- AND siltc_tc_pct <> 0
"
"                            AND sihd_gst_cust_type NOT IN ('E')
"
"                             AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                             AND sihd_cust_id = ssl_suplr_id
"
"                             AND sihd_bu = ssl_bu
"
"                             AND suplr_state = state_id
"
"                             AND sihd_year = p_year
"
"                             /*AND EXISTS
"
"                                    (SELECT gp_plant
"
"                                       FROM gstr9_plant
"
"                                      WHERE     gp_bu = p_bu
"
"                                            AND gp_sel_flag = 'Y'
"
"                                            AND gp_doc_no = p_doc_no
"
"                                            AND gp_plant = sihd_plant)*/
"
"                             GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   /* TYPE B - Supplies made to Registered Persons (B2B) */
"
"
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_45_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'B',
"
"                             'TP',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                      SELECT sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             sihd_inv_date,
"
"                             --SUM (dISTINCT ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                             SUM (
"
"                            CASE
"
"                               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                               THEN
"
"                                  SILN_ASSBL_VAL
"
"                               ELSE
"
"                                  0
"
"                            END)taxable_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_gstc_amt
"
"                        FROM sales_invoices_hd,
"
"                             sales_invoices_ln,
"
"                             --sales_inv_line_tax_charges,
"
"                             suppliers,
"
"                             tax_charges_types,
"
"                             tax_charges,
"
"                             suplr_ship_loc,
"
"                             states
"
"                       WHERE     sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                            -- AND siln_bu = siltc_bu
"
"                            -- AND siln_plnt = siltc_plnt
"
"                            -- AND siln_doc_no = siltc_doc_no
"
"                            -- AND siln_seq_no = siltc_seq_no
"
"                             AND sihd_bu = suplr_bu
"
"                             AND sihd_cust_id = suplr_suplr_id
"
"                             AND tctype_bu = tc_bu
"
"                             AND tctype_id = tc_type_id
"
"                             --AND siltc_bu = tc_bu
"
"                             --`AND siltc_tc_id = tc_tc_id
"
"                             AND sihd_bu = p_bu
"
"                             --aND SIHD_TAX_AMT > 0
"
"                             AND tctype_type_id IN ('CGST',
"
"                                                    'SGST',
"
"                                                    'IGST',
"
"                                                    'UTGST')
"
"                            AND (sihd_type IN ('SO',
"
"                                          'TP',
"
"                                          'SU',
"
"                                          'SS',
"
"                                          'LO',
"
"                                          'LI',
"
"                                          'SI',
"
"                                          'DP',
"
"                                          'DE',
"
"                                          'FA',
"
"                                          'FE',
"
"                                          'TT',
"
"                                          'OH',
"
"                                          'LE',
"
"                                          'RB',
"
"                                          'RP',
"
"                                          'PR',
"
"                                          'ST',
"
"                                          'FS')  OR (sihd_type='RY' AND sihd_sal_ret_type='DM'))
"
"                             AND sihd_status = 'I'
"
"                            /* AND siltc_tc_pct IS NOT NULL
"
"                             AND (   (sihd_gst_cust_type IN ('I', 'L') AND siltc_tc_pct > 0)
"
"                                  OR (    sihd_gst_cust_type IN ('S', 'U')
"
"                                      AND (siltc_tc_pct = 0 OR siltc_tc_pct > 0)))
"
"                             AND sihd_gst_reg_type = 'R'*/
"
"                      /*  AND (   sihd_gst_reg_type = 'R'
"
"                             OR (    sihd_gst_reg_type = 'U'
"
"                                 AND sihd_gst_cust_type IN ( 'L','I')))*/
"
"                        AND sihd_gst_cust_type <> 'E'
"
"                              AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                             AND sihd_cust_id = ssl_suplr_id
"
"                             AND sihd_bu = ssl_bu
"
"                             AND ssl_state = state_id
"
"                            /* AND EXISTS
"
"                                    (SELECT gp_plant
"
"                                       FROM gstr9_plant
"
"                                      WHERE     gp_bu = p_bu
"
"                                            AND gp_sel_flag = 'Y'
"
"                                            AND gp_doc_no = p_doc_no
"
"                                            AND gp_plant = sihd_plant)*/
"
"                             AND sihd_year = p_year
"
"                             GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                    UNION ALL
"
"                      SELECT sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             sihd_inv_date,
"
"                           --  -SUM (dISTINCT ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                         -SUM (
"
"                            CASE
"
"                               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                               THEN
"
"                                  SILN_ASSBL_VAL
"
"                               ELSE
"
"                                  0
"
"                            END) taxable_amt,
"
"                             -SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      (SIHD_TOT_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             -SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      (SIHD_TOT_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             -SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      (SIHD_TOT_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             -SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      (SIHD_TOT_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt,
"
"                             -SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                   THEN
"
"                                      (SIHD_TOT_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_gstc_amt
"
"                        FROM sales_invoices_hd,
"
"                        sales_invoices_ln,
"
"                        --sales_inv_line_tax_charges,
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
"                        --AND siltc_bu = siln_bu
"
"                        --AND siltc_plnt = siln_plnt
"
"                        --AND siltc_doc_no = siln_doc_no
"
"                        --AND siltc_seq_no = siln_seq_no
"
"                       -- AND tc_bu = siltc_bu
"
"                       --AND tc_tc_id = siltc_tc_id
"
"                        AND tctype_bu = tc_bu
"
"                        AND tctype_id = tc_type_id
"
"                        --aND SIHD_TAX_AMT > 0
"
"                        AND (sihd_type IN ('RD',
"
"                                          'RL',
"
"                                          'RS',
"
"                                          'SR',
"
"                                          'SG',
"
"                                          'LR',
"
"                                          'SN',
"
"                                          'RV',
"
"                                          'RH',
"
"                                          'RU') OR (sihd_type='RY' AND sihd_sal_ret_type<>'DM'))
"
"                        AND sihd_status = 'I'
"
"                      /*  AND (   sihd_gst_reg_type = 'R'
"
"                             OR (    sihd_gst_reg_type = 'U'
"
"                                 AND sihd_gst_cust_type IN ( 'L','I')))*/
"
"                        AND sihd_gst_cust_type <> 'E'
"
"                        AND sihd_bu = p_bu
"
"                        AND tctype_type_id IN ('IGST',
"
"                                               'CGST',
"
"                                               'SGST',
"
"                                               'GSTC')
"
"                       -- AND SIHD_TAX_AMT <> 0
"
"                     /*  AND EXISTS
"
"                                    (SELECT gp_plant
"
"                                       FROM gstr9_plant
"
"                                      WHERE     gp_bu = p_bu
"
"                                            AND gp_sel_flag = 'Y'
"
"                                            AND gp_doc_no = p_doc_no
"
"                                            AND gp_plant = sihd_plant)*/
"
"                             AND sihd_year = p_year
"
"                             group by  sihd_inv_pfx,sihd_inv_no,sihd_inv_date
"
"                   /* UNION ALL
"
"                      SELECT sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             sihd_inv_date,
"
"                             SUM (
"
"                                dISTINCT ROUND (
"
"                                     ( (  (siln_inv_qty * siln_price)
"
"                                        - ( (siln_inv_qty * siln_price) * siln_disc_pct / 100)))
"
"                                   * sihd_exchange_rate,
"
"                                   2))
"
"                                taxable_amt,
"
"                             0 v_cgst_amt,
"
"                             0 v_sgst_amt,
"
"                             0 v_utgst_amt,
"
"                             0 v_igst_amt,
"
"                             0 v_gstc_amt
"
"                        FROM sales_invoices_hd,
"
"                             sales_invoices_ln,
"
"                             suppliers,
"
"                             suplr_ship_loc,
"
"                             states
"
"                       WHERE     sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                             AND sihd_bu = suplr_bu
"
"                             AND sihd_cust_id = suplr_suplr_id
"
"                             AND sihd_bu = p_bu
"
"                             AND sihd_type IN ('SO',
"
"                                               'FA',
"
"                                               'SS',
"
"                                               'LO',
"
"                                               'SI',
"
"                                               'FE',
"
"                                               'DE',
"
"                                               'LI',
"
"                                               'OH',
"
"                                               'SG',
"
"                                               'ST',
"
"                                               'FS')*/
"
"                                                  /*''
"
"                                               || DECODE (
"
"                                                     (SELECT gh_si_type_st
"
"                                                        FROM gstr1_hd
"
"                                                       WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                     'Y', 'ST',
"
"                                                     NULL)
"
"                                               || '',
"
"                                                  ''
"
"                                               || DECODE (
"
"                                                     (SELECT gh_si_type_fs
"
"                                                        FROM gstr1_hd
"
"                                                       WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                     'Y', 'FS',
"
"                                                     NULL)
"
"                                               || '')*/
"
"                            /* AND sihd_status = 'I'
"
"                             AND sihd_gst_cust_type IN ('S', 'U')
"
"                             AND sihd_gst_reg_type = 'R'
"
"                             AND sihd_billto_loc_id = Ssl_loc_id
"
"                             AND sihd_cust_id = ssl_suplr_id
"
"                             AND sihd_bu = ssl_bu
"
"                             AND ssl_state = state_id
"
"                             --AND csl_bill_frm = 'Y'
"
"                             AND NOT EXISTS
"
"                                        (SELECT 1
"
"                                           FROM sales_inv_line_tax_charges
"
"                                          WHERE     siltc_bu = siln_bu
"
"                                                AND siltc_doc_no = siln_doc_no
"
"                                                AND siltc_plnt = siln_plnt
"
"                                                AND siltc_seq_no = siln_seq_no)
"
"                             AND EXISTS
"
"                                    (SELECT gp_plant
"
"                                       FROM gstr9_plant
"
"                                      WHERE     gp_bu = p_bu
"
"                                            AND gp_sel_flag = 'Y'
"
"                                            AND gp_doc_no = p_doc_no
"
"                                            AND gp_plant = sihd_plant)
"
"                             AND sihd_year = p_year
"
"                    GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date*/
"
"                    UNION ALL
"
"                      SELECT sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             sihd_inv_date,
"
"                             --SUM (dISTINCT ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                             SUM (
"
"                            CASE
"
"                               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                               THEN
"
"                                  SILN_ASSBL_VAL
"
"                               ELSE
"
"                                  0
"
"                            END) taxable_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_gstc_amt
"
"                        FROM sales_invoices_hd,
"
"                             sales_invoices_ln,
"
"                             --sales_inv_line_tax_charges,
"
"                             suppliers,
"
"                             tax_charges_types,
"
"                             tax_charges,
"
"                             suplr_ship_loc,
"
"                             states
"
"                       WHERE     sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                             --AND siln_bu = siltc_bu
"
"                             --AND siln_plnt = siltc_plnt
"
"                             --AND siln_doc_no = siltc_doc_no
"
"                            -- AND siln_seq_no = siltc_seq_no
"
"                             AND sihd_bu = suplr_bu
"
"                             AND sihd_cust_id = suplr_suplr_id
"
"                             AND tctype_bu = tc_bu
"
"                             AND tctype_id = tc_type_id
"
"                            -- AND siltc_bu = tc_bu
"
"                             --AND siltc_tc_id = tc_tc_id
"
"                             AND sihd_bu = p_bu
"
"                            -- aND SIHD_TAX_AMT > 0
"
"                             AND tctype_type_id IN ('CGST',
"
"                                                    'SGST',
"
"                                                    'IGST',
"
"                                                    'UTGST')
"
"                             AND sihd_type IN ('PR',
"
"                                               'NS',
"
"                                               'NN',
"
"                                               'SP')
"
"                             --AND sihd_rtn_doc_type = 'I'
"
"                             AND sihd_status = 'I'
"
"                             --AND siltc_tc_pct IS NOT NULL
"
"                             AND sihd_gst_cust_type NOT IN ('E')
"
"                              AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                             AND sihd_cust_id = ssl_suplr_id
"
"                             AND sihd_bu = ssl_bu
"
"                             AND suplr_state = state_id
"
"                            /* AND EXISTS
"
"                                    (SELECT gp_plant
"
"                                       FROM gstr9_plant
"
"                                      WHERE     gp_bu = p_bu
"
"                                            AND gp_sel_flag = 'Y'
"
"                                            AND gp_doc_no = p_doc_no
"
"                                            AND gp_plant = sihd_plant)*/
"
"                             AND sihd_year = p_year
"
"                    GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   /* TYPE C - Zero rated supply (Export) on payment of tax (except supplies to SEZs) */
"
"
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_45_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'C',
"
"                             'TP',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM (ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_cgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_sgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_utgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_igst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"--         sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         --AND siln_bu = siltc_bu
"
"         --AND siln_plnt = siltc_plnt
"
"         --AND siln_doc_no = siltc_doc_no
"
"         --AND siln_seq_no = siltc_seq_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"         --AND siltc_bu = tc_bu
"
"         --AND siltc_tc_id = tc_tc_id
"
"         AND sihd_bu = p_bu
"
"         AND tctype_type_id IN ('CGST',
"
"                                'SGST',
"
"                                'IGST',
"
"                                'UTGST')
"
"         AND sihd_type IN ('SO',
"
"                           'FA',
"
"                           'SS',
"
"                           'LO',
"
"                           'SI',
"
"                           'FE',
"
"                           'DE',
"
"                           'LI',
"
"                           'OH',
"
"                           'SG',
"
"                           'ST',
"
"                           'FS')
"
"                           /*   ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_st
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'ST',
"
"                                 NULL)
"
"                           || '',
"
"                              ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_fs
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'FS',
"
"                                 NULL)
"
"                           || '')*/
"
"         AND sihd_status = 'I'
"
"         --AND siltc_tc_pct IS NOT NULL
"
"         --AND siltc_tc_pct = 0
"
"         AND sihd_gst_cust_type NOT IN ('S', 'U')
"
"         AND sihd_currency<>func_find_base_currency(p_bu)
"
"         /*AND (   (sihd_gst_cust_type IN ('I', 'L') AND siltc_tc_pct > 0)
"
"              OR (    sihd_gst_cust_type IN ('S', 'U')
"
"                  AND (siltc_tc_pct = 0 OR siltc_tc_pct > 0)))
"
"         AND sihd_gst_reg_type = 'R'*/
"
"          AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"        /* AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"UNION ALL
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM (
"
"            ROUND (
"
"                 ( (  (siln_inv_qty * siln_price)
"
"                    - ( (siln_inv_qty * siln_price) * siln_disc_pct / 100)))
"
"               * sihd_exchange_rate,
"
"               2))
"
"            taxable_amt,
"
"         0 v_cgst_amt,
"
"         0 v_sgst_amt,
"
"         0 v_utgst_amt,
"
"         0 v_igst_amt,
"
"         0 v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"         suppliers,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_type IN ('SO',
"
"                           'FA',
"
"                           'SS',
"
"                           'LO',
"
"                           'SI',
"
"                           'FE',
"
"                           'DE',
"
"                           'LI',
"
"                           'OH',
"
"                           'SG',
"
"                           'ST',
"
"                           'FS')
"
"                           /*
"
"                              ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_st
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'ST',
"
"                                 NULL)
"
"                           || '',
"
"                              ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_fs
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'FS',
"
"                                 NULL)
"
"                           || '')*/
"
"         AND sihd_status = 'I'
"
"         AND sihd_gst_cust_type NOT IN ('S', 'U')
"
"         AND sihd_currency<>func_find_base_currency(p_bu)
"
"        /* AND sihd_gst_cust_type IN ('S', 'U')
"
"         AND sihd_gst_reg_type = 'R'*/
"
"          AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"         --AND csl_bill_frm = 'Y'
"
"       /*  AND NOT EXISTS
"
"                    (SELECT 1
"
"                       FROM sales_inv_line_tax_charges
"
"                      WHERE     siltc_bu = siln_bu
"
"                            AND siltc_doc_no = siln_doc_no
"
"                            AND siltc_plnt = siln_plnt
"
"                            AND siltc_seq_no = siln_seq_no)*/
"
"       /*  AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"UNION ALL
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM (ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_cgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_sgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_utgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_igst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"--         sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"        /* AND siln_bu = siltc_bu
"
"         AND siln_plnt = siltc_plnt
"
"         AND siln_doc_no = siltc_doc_no
"
"         AND siln_seq_no = siltc_seq_no*/
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"          AND sihd_bu = p_bu
"
"         AND tctype_type_id IN ('CGST',
"
"                                'SGST',
"
"                                'IGST',
"
"                                'UTGST')
"
"         AND sihd_type IN ('PR',
"
"                           'NS',
"
"                           'NN',
"
"                           'SP')
"
"          AND sihd_status = 'I'
"
"         --AND siltc_tc_pct = 0
"
"         AND sihd_gst_cust_type NOT IN ('S', 'U')
"
"         AND sihd_currency<>func_find_base_currency(p_bu)
"
"         /*AND sihd_gst_reg_type = 'R'
"
"         AND sihd_gst_cust_type NOT IN ('E')*/
"
"          AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND suplr_state = state_id
"
"       /*  AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   /* TYPE D - Supply to SEZs on payment of tax */
"
"
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_45_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'D',
"
"                             'TP',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM (ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"               THEN
"
"                  (SILN_CGST_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_cgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"               THEN
"
"                  (SILN_SGST_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_sgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"               THEN
"
"                  (SILN_UTGST_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_utgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"               THEN
"
"                  (SILN_IGST_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_igst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"        -- sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"       --  AND siln_bu = siltc_bu
"
"      --   AND siln_plnt = siltc_plnt
"
"       --  AND siln_doc_no = siltc_doc_no
"
"        -- AND siln_seq_no = siltc_seq_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"       --  AND siltc_bu = tc_bu
"
"       --  AND siltc_tc_id = tc_tc_id
"
"         AND sihd_bu = p_bu
"
"         AND tctype_type_id IN ('CGST',
"
"                                'SGST',
"
"                                'IGST',
"
"                                'UTGST')
"
"         AND sihd_type IN ('SO',
"
"                           'FA',
"
"                           'SS',
"
"                           'LO',
"
"                           'SI',
"
"                           'FE',
"
"                           'DE',
"
"                           'LI',
"
"                           'OH',
"
"                           'SG',
"
"                           'ST',
"
"                           'FS')
"
"                           /*
"
"                              ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_st
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'ST',
"
"                                 NULL)
"
"                           || '',
"
"                              ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_fs
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'FS',
"
"                                 NULL)
"
"                           || '')*/
"
"         AND sihd_status = 'I'
"
"        -- AND siltc_tc_pct IS NOT NULL
"
"         AND sihd_gst_cust_type IN ('S', 'U')
"
"         /*AND (   (sihd_gst_cust_type IN ('I', 'L') AND siltc_tc_pct > 0)
"
"              OR (    sihd_gst_cust_type IN ('S', 'U')
"
"                  AND (siltc_tc_pct = 0 OR siltc_tc_pct > 0)))
"
"         AND sihd_gst_reg_type = 'R'*/
"
"          AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"       /*  AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"UNION ALL
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM (
"
"            ROUND (
"
"                 ( (  (siln_inv_qty * siln_price)
"
"                    - ( (siln_inv_qty * siln_price) * siln_disc_pct / 100)))
"
"               * sihd_exchange_rate,
"
"               2))
"
"            taxable_amt,
"
"         0 v_cgst_amt,
"
"         0 v_sgst_amt,
"
"         0 v_utgst_amt,
"
"         0 v_igst_amt,
"
"         0 v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"         suppliers,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_type IN ('SO',
"
"                           'FA',
"
"                           'SS',
"
"                           'LO',
"
"                           'SI',
"
"                           'FE',
"
"                           'DE',
"
"                           'LI',
"
"                           'OH',
"
"                           'SG',
"
"                           'ST',
"
"                           'FS')
"
"                           /*
"
"                              ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_st
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'ST',
"
"                                 NULL)
"
"                           || '',
"
"                              ''
"
"                           || DECODE (
"
"                                 (SELECT gh_si_type_fs
"
"                                    FROM gstr1_hd
"
"                                   WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                 'Y', 'FS',
"
"                                 NULL)
"
"                           || '')*/
"
"         AND sihd_status = 'I'
"
"         AND sihd_gst_cust_type IN ('S', 'U')
"
"         --AND sihd_gst_reg_type = 'R'
"
"          AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"         --AND csl_bill_frm = 'Y'
"
"        /* AND NOT EXISTS
"
"                    (SELECT 1
"
"                       FROM sales_inv_line_tax_charges
"
"                      WHERE     siltc_bu = siln_bu
"
"                            AND siltc_doc_no = siln_doc_no
"
"                            AND siltc_plnt = siln_plnt
"
"                            AND siltc_seq_no = siln_seq_no)
"
"         AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"UNION ALL
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM (ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_cgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_sgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_utgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_igst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"      --   sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"        AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"         AND sihd_bu = p_bu
"
"         AND tctype_type_id IN ('CGST',
"
"                                'SGST',
"
"                                'IGST',
"
"                                'UTGST')
"
"         AND sihd_type IN ('PR',
"
"                           'NS',
"
"                           'NN',
"
"                           'SP')
"
"          AND sihd_status = 'I'
"
"        --AND sihd_gst_reg_type = 'R'
"
"         --AND sihd_gst_cust_type NOT IN ('E')
"
"         AND sihd_gst_cust_type IN ('S', 'U')
"
"          AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND suplr_state = state_id
"
"        /* AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   /* TYPE G - Inward supplies on which tax is to be paid on reverse charge basis */
"
"
"
"   INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                   g45dd_doc_no,
"
"                                   g45dd_code_type,
"
"                                   g45dd_45_type,
"
"                                   g45dd_inv_no,
"
"                                   g45dd_inv_pfx,
"
"                                   g45dd_inv_date,
"
"                                   g45dd_tax_amt,
"
"                                   g45dd_cgst_amt,
"
"                                   g45dd_sgst_amt,
"
"                                   g45dd_igst_amt,
"
"                                   g45dd_cess_amt,
"
"                                   g45dd_cre_by,
"
"                                   g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'G',
"
"                             'TP',
"
"                             suphdh_doc_no,
"
"                             suphdh_pfx,
"
"                             suphdh_doc_date,
"
"                             taxable_val,
"
"                             cgst_tax_amt,
"
"                             sgst_tax_amt,
"
"                             igst_tax_amt,
"
"                             cess_tax_amt,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (/* Formatted on 4/16/2022 2:54:39 PM (QP5 v5.252.13127.32847) */
"
"  SELECT suphdh_doc_no,
"
"         suphdH_pfx,
"
"         suphdh_doc_date,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 *1-- sdlitch_assess_val
"
"                     ELSE  1--sdlitch_assess_val
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            taxable_val,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'CGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                     ELSE  1--sdlitch_tax_amt
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'SGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                     ELSE 1--sdlitch_tax_amt
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            sgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'IGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 *1-- sdlitch_tax_amt
"
"                     ELSE 1--sdlitch_tax_amt
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            igst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'GSTC'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                     ELSE 1
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cess_tax_amt
"
"    FROM suplr_doc_hd_hist,
"
"         suplr_doc_ln_hist,
"
"        -- suplr_doc_ln_inv_tc_hist,
"
"         tax_charges,
"
"         tax_charges_types
"
"   WHERE     suphdh_bu = suplnh_bu
"
"        -- AND suphdh_pfx = suplnh_pfx
"
"         AND suphdh_doc_no = suplnh_doc_no
"
"        -- AND sdlitch_bu(+) = suplnh_bu
"
"        -- AND sdlitch_doc_pfx(+) = suplnh_pfx
"
"        -- AND sdlitch_doc_no(+) = suplnh_doc_no
"
"       --  AND sdlitch_seq_no(+) = suplnh_seq_no
"
"        -- AND tc_bu(+) = sdlitch_bu
"
"        -- AND tc_tc_id(+) = sdlitch_tc_id
"
"         AND tctype_bu(+) = tc_bu
"
"         AND tctype_id(+) = tc_type_id
"
"         AND suphdh_status = 'P'
"
"         --AND sdlitch_tax_pct <> 0
"
"         AND suphdh_bu = p_bu
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'GSTC')
"
"         AND suplnh_gst_rev_tax_flag = 'Y'
"
"         AND suphdh_currency = 'INR'
"
"         AND suphdh_doc_year = p_year
"
"        /* AND EXISTS
"
"                (SELECT 1
"
"                   FROM gstr2_plant
"
"                  WHERE     g2p_bu = p_bu
"
"                        AND g2p_sel_flag = 'Y'
"
"                        AND g2p_doc_no = p_doc_no
"
"                        AND g2p_plant = suphdh_plant)*/
"
"GROUP BY suphdh_doc_no, suphdh_pfx, suphdh_doc_date
"
"UNION ALL
"
"  SELECT suphdh_doc_no suphdh_doc_no,
"
"         suphdh_pfx suphdh_pfx,
"
"         suphdh_doc_date suphdh_doc_date,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdtch_inv_assess
"
"                     ELSE 1--sdtch_inv_assess
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            taxable_val,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'CGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdtch_amount
"
"                     ELSE 1--sdtch_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'SGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdtch_amount
"
"                     ELSE 1--sdtch_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            sgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'IGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdtch_amount
"
"                     ELSE 1--sdtch_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            igst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'GSTC'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdtch_amount
"
"                     ELSE 1--sdtch_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cess_tax_amt
"
"    FROM suplr_doc_hd_hist,
"
"         --suplr_doc_tax_charges_hist,
"
"         tax_charges,
"
"         tax_charges_types
"
"   WHERE   /*  sdtch_bu(+) = suphdh_bu
"
"         AND sdtch_pfx(+) = suphdh_pfx
"
"         AND sdtch_doc_no(+) = suphdh_doc_no
"
"         AND tc_bu(+) = sdtch_bu
"
"         AND tc_tc_id(+) = sdtch_tc_id
"
"         AND*/ tctype_bu(+) = tc_bu
"
"         AND tctype_id(+) = tc_type_id
"
"         AND suphdh_status = 'P'
"
"       --  AND sdtch_tc_pct <> 0
"
"         AND suphdh_bu = p_bu
"
"         AND suphdh_doc_year = p_year
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'GSTC')
"
"         --AND suplnh_gst_rev_tax_flag = 'Y'
"
"         AND suphdh_currency = 'INR'
"
"         AND EXISTS
"
"                (SELECT 1
"
"                   FROM gstr2_plant
"
"                  WHERE     g2p_bu = p_bu
"
"                        AND g2p_sel_flag = 'Y'
"
"                        AND g2p_doc_no = p_doc_no
"
"                        AND g2p_plant = suphdh_plant)
"
"GROUP BY suphdh_doc_no, suphdh_pfx, suphdh_doc_date
"
"UNION ALL
"
"  SELECT suphdh_doc_no,
"
"         suphdh_pfx,
"
"         suphdh_doc_date,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_assbl_val
"
"                     ELSE 1--sddl_assbl_val
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            taxable_val,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'IGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                     ELSE 1--sddl_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            igst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'CGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                     ELSE 1--sddl_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'SGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                     ELSE 1--sddl_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            sgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'GSTC'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                     ELSE 1--sddl_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cess_tax_amt
"
"    FROM suplr_doc_hd_hist,
"
"       -- suplr_doc_dist_ln,
"
"        -- gst_lvl_accounts,
"
"         tax_charges,
"
"         tax_charges_types
"
"   WHERE   /*  suphdh_bu = sddl_bu
"
"         AND suphdh_pfx = sddl_pfx
"
"         AND suphdh_doc_no = sddl_doc_no
"
"         AND sddl_bu = gstl_bu
"
"         AND sddl_acct = gstl_acct
"
"         AND tc_bu(+) = sddl_bu
"
"         AND tc_tc_id(+) = sddl_tax_code
"
"         AND*/ tctype_bu(+) = tc_bu
"
"         AND tctype_id(+) = tc_type_id
"
"         AND suphdh_status = 'P'
"
"         AND suphdh_bu = p_bu
"
"         AND suphdh_doc_year = p_year
"
"       --  AND sddl_gst_rev_tax_flag = 'Y'
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'GSTC')
"
"       --  AND sddl_tax_code IS NOT NULL
"
"       --  AND gstl_type IN ('CGSTR', 'SGSTR', 'IGSTR')
"
"         /*AND EXISTS
"
"                (SELECT 1
"
"                   FROM gstr2_plant
"
"                  WHERE     g2p_bu = p_bu
"
"                        AND g2p_sel_flag = 'Y'
"
"                        AND g2p_doc_no = p_doc_no
"
"                        AND g2p_plant = suphdh_plant)*/
"
"GROUP BY suphdh_doc_no, suphdh_pfx, suphdh_doc_date
"
"UNION ALL
"
"  SELECT suphdh_doc_no suphdh_doc_no,
"
"         suphdh_pfx suphdh_pfx,
"
"         suphdh_doc_date suphdh_doc_date,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddlh_assbl_val
"
"                     ELSE 1--sddlh_assbl_val
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            taxable_val,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'IGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddlh_sc_amount
"
"                     ELSE 1--sddlh_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            igst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'CGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddlh_sc_amount
"
"                     ELSE 1--sddlh_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'SGST'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddlh_sc_amount
"
"                     ELSE 1--sddlh_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            sgst_tax_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN tctype_type_id = 'GSTC'
"
"               THEN
"
"                  CASE
"
"                     WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddlh_sc_amount
"
"                     ELSE 1--sddlh_sc_amount
"
"                  END
"
"               ELSE
"
"                  0
"
"            END)
"
"            cess_tax_amt
"
"    FROM suplr_doc_hd_hist,
"
"     --    suplr_doc_dist_ln_hist,
"
"      --   gst_lvl_accounts,
"
"         tax_charges,
"
"         tax_charges_types
"
"   WHERE  /*   suphdh_bu = sddlh_bu
"
"         AND suphdh_pfx = sddlh_pfx
"
"         AND suphdh_doc_no = sddlh_doc_no
"
"         AND sddlh_bu = gstl_bu
"
"         AND sddlh_acct = gstl_acct
"
"         AND tc_bu(+) = sddlh_bu
"
"         AND tc_tc_id(+) = sddlh_tax_code
"
"         AND*/ tctype_bu(+) = tc_bu
"
"         AND tctype_id(+) = tc_type_id
"
"         AND suphdh_status = 'P'
"
"         AND suphdh_bu = p_bu
"
"         AND suphdh_doc_year = p_year
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'GSTC')
"
"         -- AND gstl_type IN ('CGSTR', 'SGSTR', 'IGSTR')
"
"        /* AND EXISTS
"
"                (SELECT 1
"
"                   FROM gstr2_plant
"
"                  WHERE     g2p_bu = p_bu
"
"                        AND g2p_sel_flag = 'Y'
"
"                        AND g2p_doc_no = p_doc_no
"
"                        AND g2p_plant = suphdh_plant)*/
"
"GROUP BY suphdh_doc_no, suphdh_pfx, suphdh_doc_date
"
"UNION ALL
"
"          SELECT suphdh_doc_no,
"
"                 suphdh_pfx,
"
"                 suphdh_doc_date,
"
"                 SUM(suphdh_sc_tot_amt) suphdh_sc_tot_amt,
"
"                 SUM(igst_tax_amt) igst_tax_amt,
"
"                 SUM(cgst_tax_amt) cgst_tax_amt,
"
"                 SUM(sgst_tax_amt) sgst_tax_amt,
"
"                 SUM(cess_tax_amt) cess_tax_amt
"
"          FROM(
"
"SELECT btrans_ord_no suphdh_doc_no,
"
"       btrans_ord_pfx suphdh_pfx,
"
"       btrans_trans_date suphdh_doc_date,
"
"       CASE WHEN tctype_type_id IN ('IGST') THEN 1--bttc_tc_assbl_val
"
"           ELSE 0 END
"
"          suphdh_sc_tot_amt,
"
"       1--(bttc_tax_amt)
"
"        igst_tax_amt,
"
"       0 cgst_tax_amt,
"
"       0 sgst_tax_amt,
"
"       0 cess_tax_amt
"
"  FROM bank_trans_hist_vw,
"
"     --  bank_trans_tax_charges,
"
"       tax_charges,
"
"       tax_charges_types
"
" WHERE  /*   btrans_bu = bttc_bu
"
"       AND btrans_ord_pfx = bttc_ord_pfx
"
"       AND btrans_ord_no = bttc_ord_no
"
"       AND tc_bu = bttc_bu
"
"       AND tc_tc_id = bttc_tc_id
"
"       AND */tctype_bu = tc_bu
"
"       AND tctype_id = tc_type_id
"
"       AND tctype_type_id IN ('IGST')
"
"       AND btrans_status NOT IN ('N',
"
"                                 'X',
"
"                                 'V',
"
"                                 'O',
"
"                                 'D')
"
"      AND btrans_bu = p_bu
"
"       AND btrans_trans_year= p_year
"
"      /* AND EXISTS
"
"              (SELECT 1
"
"                 FROM gstr2_plant
"
"                WHERE     g2p_bu = p_bu
"
"                      AND g2p_sel_flag = 'Y'
"
"                      AND g2p_doc_no = p_doc_no
"
"                      AND g2p_plant = btrans_plant)*/
"
"UNION ALL
"
"SELECT btrans_ord_no suphdh_doc_no,
"
"       btrans_ord_pfx suphdh_pfx,
"
"       btrans_trans_date suphdh_doc_date,
"
"       CASE WHEN tctype_type_id IN ('CGST') THEN 1--bttc_tc_assbl_val
"
"        ELSE 0 END
"
"          suphdh_sc_tot_amt,
"
"       0 igst_tax_amt,
"
"      1-- (bttc_tax_amt)
"
"        cgst_tax_amt,
"
"       0 sgst_tax_amt,
"
"       0 cess_tax_amt
"
"  FROM bank_trans_hist_vw,
"
"      -- bank_trans_tax_charges,
"
"       tax_charges,
"
"       tax_charges_types
"
" WHERE  /*   btrans_bu = bttc_bu
"
"       AND btrans_ord_pfx = bttc_ord_pfx
"
"       AND btrans_ord_no = bttc_ord_no
"
"       AND tc_bu = bttc_bu
"
"       AND tc_tc_id = bttc_tc_id
"
"       AND*/ tctype_bu = tc_bu
"
"       AND tctype_id = tc_type_id
"
"       AND tctype_type_id IN ('CGST')
"
"       AND btrans_status NOT IN ('N',
"
"                                 'X',
"
"                                 'V',
"
"                                 'O',
"
"                                 'D')
"
"       AND btrans_bu = p_bu
"
"       AND btrans_trans_year= p_year
"
"       /*AND EXISTS
"
"              (SELECT 1
"
"                 FROM gstr2_plant
"
"                WHERE     g2p_bu = p_bu
"
"                      AND g2p_sel_flag = 'Y'
"
"                      AND g2p_doc_no = p_doc_no
"
"                      AND g2p_plant = btrans_plant)*/
"
"UNION ALL
"
"SELECT btrans_ord_no suphdh_doc_no,
"
"       btrans_ord_pfx suphdh_pfx,
"
"       btrans_trans_date suphdh_doc_date,
"
"       0 suphdh_sc_tot_amt,
"
"       0 igst_tax_amt,
"
"       0 cgst_tax_amt,
"
"      1-- (bttc_tax_amt)
"
"      sgst_tax_amt,
"
"       0 cess_tax_amt
"
"  FROM bank_trans_hist_vw,
"
"      -- bank_trans_tax_charges,
"
"       tax_charges,
"
"       tax_charges_types
"
" WHERE  /*   btrans_bu = bttc_bu
"
"       AND btrans_ord_pfx = bttc_ord_pfx
"
"       AND btrans_ord_no = bttc_ord_no
"
"       AND tc_bu = bttc_bu
"
"       AND tc_tc_id = bttc_tc_id
"
"       AND*/ tctype_bu = tc_bu
"
"       AND tctype_id = tc_type_id
"
"       AND tctype_type_id IN ('SGST')
"
"       AND btrans_status NOT IN ('N',
"
"                                 'X',
"
"                                 'V',
"
"                                 'O',
"
"                                 'D')
"
"       AND btrans_bu = p_bu
"
"       AND btrans_trans_year= p_year
"
"      /* AND EXISTS
"
"              (SELECT 1
"
"                 FROM gstr2_plant
"
"                WHERE     g2p_bu = p_bu
"
"                      AND g2p_sel_flag = 'Y'
"
"                      AND g2p_doc_no = p_doc_no
"
"                      AND g2p_plant = btrans_plant)*/
"
"UNION ALL
"
"SELECT btrans_ord_no suphdh_doc_no,
"
"       btrans_ord_pfx suphdh_pfx,
"
"       btrans_trans_date suphdh_doc_date,
"
"       0 suphdh_sc_tot_amt,
"
"       0 igst_tax_amt,
"
"       0 cgst_tax_amt,
"
"       0 sgst_tax_amt,
"
"      1-- (bttc_tax_amt)
"
"      cess_tax_amt
"
"  FROM bank_trans_hist_vw,
"
"    --   bank_trans_tax_charges,
"
"       tax_charges,
"
"       tax_charges_types
"
" WHERE  /*   btrans_bu = bttc_bu
"
"       AND btrans_ord_pfx = bttc_ord_pfx
"
"       AND btrans_ord_no = bttc_ord_no
"
"       AND tc_bu = bttc_bu
"
"       AND tc_tc_id = bttc_tc_id
"
"       AND */tctype_bu = tc_bu
"
"       AND tctype_id = tc_type_id
"
"       AND tctype_type_id IN ('GSTC')
"
"       AND btrans_status NOT IN ('N',
"
"                                 'X',
"
"                                 'V',
"
"                                 'O',
"
"                                 'D')
"
"       AND btrans_bu = p_bu
"
"       AND btrans_trans_year= p_year)
"
"       GROUP BY suphdh_doc_no,
"
"                 suphdh_pfx,
"
"                 suphdh_doc_date);
"
"      /* AND EXISTS
"
"              (SELECT 1
"
"                 FROM gstr2_plant
"
"                WHERE     g2p_bu = p_bu
"
"                      AND g2p_sel_flag = 'Y'
"
"                      AND g2p_doc_no = p_doc_no
"
"                      AND g2p_plant = btrans_plant)); */
"
"   /* TYPE I - Credit Notes issued in respect of transactions specified in (B) to (E) above (-)*/
"
"
"
"   INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                   g45dd_doc_no,
"
"                                   g45dd_code_type,
"
"                                   g45dd_45_type,
"
"                                   g45dd_inv_no,
"
"                                   g45dd_inv_pfx,
"
"                                   g45dd_inv_date,
"
"                                   g45dd_tax_amt,
"
"                                   g45dd_cgst_amt,
"
"                                   g45dd_sgst_amt,
"
"                                   g45dd_igst_amt,
"
"                                   g45dd_cess_amt,
"
"                                   g45dd_cre_by,
"
"                                   g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'I',
"
"                             'TP',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          /*SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM(ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_cgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_sgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_utgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_igst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_gstc_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                                 sales_inv_line_tax_charges,
"
"                                 suppliers,
"
"                                 tax_charges_types,
"
"                                 tax_charges,
"
"                                 suplr_ship_loc,
"
"                                 states
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                                 AND siln_bu = siltc_bu
"
"                                 AND siln_plnt = siltc_plnt
"
"                                 AND siln_doc_no = siltc_doc_no
"
"                                 AND siln_seq_no = siltc_seq_no
"
"                                 AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND tctype_bu = tc_bu
"
"                                 AND tctype_id = tc_type_id
"
"                                 AND tctype_type_id IN ('IGST',
"
"                                                        'CGST',
"
"                                                        'SGST',
"
"                                                        'UTGST',
"
"                                                        'GSTC')
"
"                                 AND siltc_bu = tc_bu
"
"                                 AND siltc_tc_id = tc_tc_id
"
"                                 AND sihd_bu = p_bu
"
"                                 AND sihd_sal_ret_type <> 'DM'
"
"                                 AND sihd_type IN ('DR',
"
"                                                   'RL',
"
"                                                   'RS',
"
"                                                   'SR' ,
"
"                                                   'LR',
"
"                                                   'SN',
"
"                                                   'RV',
"
"                                                   'RY',
"
"                                                   'RH',
"
"                                                   'RU',
"
"                                                   'CR',
"
"                                                   'SU')
"
"                                 AND sihd_status = 'I'
"
"                                 AND siltc_tc_pct > 0
"
"                                 AND sihd_gst_reg_type = 'R'
"
"                                 AND ssl_gst_no IS NOT NULL
"
"                                 AND sihd_billto_loc_id = Ssl_loc_id
"
"                                 AND sihd_cust_id = ssl_suplr_id
"
"                                 AND sihd_bu = ssl_bu
"
"                                 AND ssl_state = state_id
"
"                               AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr1_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)
"
"                                 AND sihd_year = p_year
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                        UNION ALL*/
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM(-1 * ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_cgst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_sgst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_utgst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_igst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_gstc_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                              --   sales_inv_line_tax_charges,
"
"                                 suppliers,
"
"                                 tax_charges_types,
"
"                                 tax_charges,
"
"                                 suplr_ship_loc,
"
"                                 states
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                                 --AND siln_bu = siltc_bu
"
"                                 --AND siln_plnt = siltc_plnt
"
"                                 --AND siln_doc_no = siltc_doc_no
"
"                                 --AND siln_seq_no = siltc_seq_no
"
"                                 AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND tctype_bu = tc_bu
"
"                                 AND tctype_id = tc_type_id
"
"                                 AND sihd_sal_ret_type = 'CM'
"
"                                 AND tctype_type_id IN ('IGST',
"
"                                                        'CGST',
"
"                                                        'SGST',
"
"                                                        'UTGST',
"
"                                                        'GSTC')
"
"                                -- AND siltc_bu = tc_bu
"
"                                 --AND siltc_tc_id = tc_tc_id
"
"                                 AND sihd_bu = p_bu
"
"                                 AND sihd_type IN ('DR',
"
"                                                   'RL',
"
"                                                   'RS',
"
"                                                   'SR',                                      /*,'SG'*/
"
"                                                   'LR',
"
"                                                   'SN',
"
"                                                   'RV',
"
"                                                   'RY',
"
"                                                   'RH',
"
"                                                   'RU',
"
"                                                   'CR',
"
"                                                   'SU')
"
"                                 AND sihd_status = 'I'
"
"                                 --AND siltc_tc_pct > 0
"
"                                   AND ssl_gst_no IS NOT NULL
"
"                               AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                                 AND sihd_cust_id = ssl_suplr_id
"
"                                 AND sihd_bu = ssl_bu
"
"                                 AND ssl_state = state_id
"
"                                 /*AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr9_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)*/
"
"                                 AND sihd_year = p_year
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"
"
"  /*TYPE J - Debit Notes issued in respect of transactions specified in (B) to (E) above (+)*/
"
"
"
"   INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                   g45dd_doc_no,
"
"                                   g45dd_code_type,
"
"                                   g45dd_45_type,
"
"                                   g45dd_inv_no,
"
"                                   g45dd_inv_pfx,
"
"                                   g45dd_inv_date,
"
"                                   g45dd_tax_amt,
"
"                                   g45dd_cgst_amt,
"
"                                   g45dd_sgst_amt,
"
"                                   g45dd_igst_amt,
"
"                                   g45dd_cess_amt,
"
"                                   g45dd_cre_by,
"
"                                   g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'I',
"
"                             'TP',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                         /* SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM(ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_cgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_sgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_utgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_igst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_gstc_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                                 sales_inv_line_tax_charges,
"
"                                 suppliers,
"
"                                 tax_charges_types,
"
"                                 tax_charges,
"
"                                 suplr_ship_loc,
"
"                                 states
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                                 AND siln_bu = siltc_bu
"
"                                 AND siln_plnt = siltc_plnt
"
"                                 AND siln_doc_no = siltc_doc_no
"
"                                 AND siln_seq_no = siltc_seq_no
"
"                                 AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND tctype_bu = tc_bu
"
"                                 AND tctype_id = tc_type_id
"
"                                 AND tctype_type_id IN ('IGST',
"
"                                                        'CGST',
"
"                                                        'SGST',
"
"                                                        'UTGST',
"
"                                                        'GSTC')
"
"                                 AND siltc_bu = tc_bu
"
"                                 AND siltc_tc_id = tc_tc_id
"
"                                 AND sihd_bu = p_bu
"
"                                 AND sihd_sal_ret_type <> 'CM'
"
"                                 AND sihd_type IN ('DR',
"
"                                                   'RL',
"
"                                                   'RS',
"
"                                                   'SR',
"
"                                                   'LR',
"
"                                                   'SN',
"
"                                                   'RV',
"
"                                                   'RY',
"
"                                                   'RH',
"
"                                                   'RU',
"
"                                                   'CR',
"
"                                                   'SU')
"
"                                 AND sihd_status = 'I'
"
"                                 AND siltc_tc_pct > 0
"
"                                 AND sihd_gst_reg_type = 'R'
"
"                                 AND ssl_gst_no IS NOT NULL
"
"                                 AND sihd_billto_loc_id = Ssl_loc_id
"
"                                 AND sihd_cust_id = ssl_suplr_id
"
"                                 AND sihd_bu = ssl_bu
"
"                                 AND ssl_state = state_id
"
"                                 AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr1_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)
"
"                                 AND sihd_year = p_year
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                        UNION ALL*/
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM(-1 * ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_cgst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_sgst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_utgst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_igst_amt,
"
"                                   -1
"
"                                 * SUM (
"
"                                      CASE
"
"                                         WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                         THEN
"
"                                            (SIHD_TAX_AMT)
"
"                                         ELSE
"
"                                            0
"
"                                      END)
"
"                                    v_gstc_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                                 --sales_inv_line_tax_charges,
"
"                                 suppliers,
"
"                                 tax_charges_types,
"
"                                 tax_charges,
"
"                                 suplr_ship_loc,
"
"                                 states
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                               AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND tctype_bu = tc_bu
"
"                                 AND tctype_id = tc_type_id
"
"                                 AND sihd_sal_ret_type = 'DM'
"
"                                 AND tctype_type_id IN ('IGST',
"
"                                                        'CGST',
"
"                                                        'SGST',
"
"                                                        'UTGST',
"
"                                                        'GSTC')
"
"                                AND sihd_bu = p_bu
"
"                                 AND sihd_type IN ('DR',
"
"                                                   'RL',
"
"                                                   'RS',
"
"                                                   'SR'                                      /*,'SG'*/
"
"                                                       ,
"
"                                                   'LR',
"
"                                                   'SN',
"
"                                                   'RV',
"
"                                                   'RY',
"
"                                                   'RH',
"
"                                                   'RU',
"
"                                                   'CR',
"
"                                                   'SU')
"
"                                 AND sihd_status = 'I'
"
"                                AND ssl_gst_no IS NOT NULL
"
"                                 AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                                 AND sihd_cust_id = ssl_suplr_id
"
"                                 AND sihd_bu = ssl_bu
"
"                                 AND ssl_state = state_id
"
"                               /*  AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr9_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)*/
"
"                                 AND sihd_year = p_year
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   COMMIT;
"
"   END proc_load_gstr9_4;
"
"
"
"   PROCEDURE proc_load_gstr9_5 (p_bu        gstr9_hd.g9h_bu%type,
"
"                                p_year      gstr9_hd.g9h_year%type,
"
"                                p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                p_user      VARCHAR2)
"
"   IS
"
"   BEGIN
"
"   /* TYPE A - Zero rated supply (Export) without payment of tax*/
"
"
"
"   INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                   g45dd_45_type,
"
"                                   g45dd_doc_no,
"
"                                   g45dd_code_type,
"
"                                   g45dd_inv_no,
"
"                                   g45dd_inv_pfx,
"
"                                   g45dd_inv_date,
"
"                                   g45dd_tax_amt,
"
"                                   g45dd_cgst_amt,
"
"                                   g45dd_sgst_amt,
"
"                                   g45dd_igst_amt,
"
"                                   g45dd_cess_amt,
"
"                                   g45dd_cre_by,
"
"                                   g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'A',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                           SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM (ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                              --   sales_inv_line_tax_charges,
"
"                                 sales_inv_bill_of_lading,
"
"                                 suppliers,
"
"                                 comm_inv_dtl,
"
"                                 tax_charges_types,
"
"                                 tax_charges
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                                 AND sihd_bu = cid_bu(+)
"
"                                 AND sihd_plant = cid_plnt(+)
"
"                                 AND sihd_doc_no = cid_doc_no(+)
"
"                                 AND sihd_bu = sibol_bu(+)
"
"                                 AND sihd_doc_no = sibol_doc_no(+)
"
"                              --   AND siln_bu = siltc_bu(+)
"
"                              --   AND siln_plnt = siltc_plnt(+)
"
"                             --    AND siln_doc_no = siltc_doc_no(+)
"
"                              --   AND siln_seq_no = siltc_seq_no(+)
"
"                               --  AND siltc_bu = tc_bu(+)
"
"                                -- AND siltc_tc_id = tc_tc_id(+)
"
"                                 AND tctype_bu(+) = tc_bu
"
"                                 AND tctype_id(+) = tc_type_id
"
"                                 AND tctype_type_id(+) IN ('IGST',
"
"                                                           'CGST',
"
"                                                           'SGST',
"
"                                                           'UTGST',
"
"                                                           'GSTC')
"
"                                 AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND sihd_bu = p_bu
"
"                                 AND sihd_type IN ('SO',
"
"                                                   'FA',
"
"                                                   'SS',
"
"                                                   'LO',
"
"                                                   'SI',
"
"                                                   'SU',
"
"                                                   'FE',
"
"                                                   'DE')
"
"                                 AND sihd_status = 'I'
"
"                                 --AND sihd_gst_cust_type = 'E'
"
"                                 AND sihd_currency<>func_find_base_currency(p_bu)
"
"                              --   AND siltc_tc_pct = 0
"
"                                 AND sihd_gst_cust_type NOT IN ('S', 'U')
"
"                                 AND sihd_currency<>func_find_base_currency(p_bu)
"
"                               /*  AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr9_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)*/
"
"                                 AND sihd_year = p_year
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   /* TYPE B - Supply to SEZs without payment of tax */
"
"
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_45_type,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'B',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM (ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                       THEN
"
"                                          (SILN_CGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_cgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                       THEN
"
"                                          (SILN_SGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_sgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                       THEN
"
"                                          (SILN_UTGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_utgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                       THEN
"
"                                          (SILN_IGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_igst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_gstc_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                              --   sales_inv_line_tax_charges,
"
"                                 suppliers,
"
"                                 tax_charges_types,
"
"                                 tax_charges,
"
"                                 suplr_ship_loc,
"
"                                 states
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                               --  AND siln_bu = siltc_bu
"
"                               --  AND siln_plnt = siltc_plnt
"
"                               --  AND siln_doc_no = siltc_doc_no
"
"                               --  AND siln_seq_no = siltc_seq_no
"
"                                 AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND tctype_bu = tc_bu
"
"                                 AND tctype_id = tc_type_id
"
"                              --   AND siltc_bu = tc_bu
"
"                               --  AND siltc_tc_id = tc_tc_id
"
"                                 AND sihd_bu = p_bu
"
"                                 AND tctype_type_id IN ('CGST',
"
"                                                        'SGST',
"
"                                                        'IGST',
"
"                                                        'UTGST')
"
"                                 AND sihd_type IN ('SO',
"
"                                                   'FA',
"
"                                                   'SS',
"
"                                                   'LO',
"
"                                                   'SI',
"
"                                                   'FE',
"
"                                                   'DE',
"
"                                                   'LI',
"
"                                                   'OH',
"
"                                                   'SG',
"
"                                                   'ST',
"
"                                                   'FS')
"
"                                                   /*   ''
"
"                                                   || DECODE (
"
"                                                         (SELECT gh_si_type_st
"
"                                                            FROM gstr1_hd
"
"                                                           WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                         'Y', 'ST',
"
"                                                         NULL)
"
"                                                   || '',
"
"                                                      ''
"
"                                                   || DECODE (
"
"                                                         (SELECT gh_si_type_fs
"
"                                                            FROM gstr1_hd
"
"                                                           WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                         'Y', 'FS',
"
"                                                         NULL)
"
"                                                   || '')*/
"
"                                 AND sihd_status = 'I'
"
"                                 AND sihd_gst_cust_type IN ('S', 'U')
"
"                                /*AND siltc_tc_pct IS NOT NULL
"
"                                 AND (   (sihd_gst_cust_type IN ('I', 'L') AND siltc_tc_pct > 0)
"
"                                      OR (    sihd_gst_cust_type IN ('S', 'U')
"
"                                          AND (siltc_tc_pct = 0 OR siltc_tc_pct > 0)))*/
"
"                                 AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                                 AND sihd_cust_id = ssl_suplr_id
"
"                                 AND sihd_bu = ssl_bu
"
"                                 AND ssl_state = state_id
"
"                                /* AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr9_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)*/
"
"                                 AND sihd_year = p_year
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                        UNION ALL
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM (
"
"                                    ROUND (
"
"                                         ( (  (siln_inv_qty * siln_price)
"
"                                            - ( (siln_inv_qty * siln_price) * siln_disc_pct / 100)))
"
"                                       * sihd_exchange_rate,
"
"                                       2))
"
"                                    taxable_amt,
"
"                                 0 v_cgst_amt,
"
"                                 0 v_sgst_amt,
"
"                                 0 v_utgst_amt,
"
"                                 0 v_igst_amt,
"
"                                 0 v_gstc_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                                 suppliers,
"
"                                 suplr_ship_loc,
"
"                                 states
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                                 AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND sihd_bu = p_bu
"
"                                 AND sihd_type IN ('SO',
"
"                                                   'FA',
"
"                                                   'SS',
"
"                                                   'LO',
"
"                                                   'SI',
"
"                                                   'FE',
"
"                                                   'DE',
"
"                                                   'LI',
"
"                                                   'OH',
"
"                                                   'SG',
"
"                                                   'ST',
"
"                                                   'FS'
"
"                                                   /*   ''
"
"                                                   || DECODE (
"
"                                                         (SELECT gh_si_type_st
"
"                                                            FROM gstr1_hd
"
"                                                           WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                         'Y', 'ST',
"
"                                                         NULL)
"
"                                                   || '',
"
"                                                      ''
"
"                                                   || DECODE (
"
"                                                         (SELECT gh_si_type_fs
"
"                                                            FROM gstr1_hd
"
"                                                           WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                         'Y', 'FS',
"
"                                                         NULL)
"
"                                                   || ''*/)
"
"                                 AND sihd_status = 'I'
"
"                                 AND sihd_gst_cust_type IN ('S', 'U')
"
"                                 AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                                 AND sihd_cust_id = ssl_suplr_id
"
"                                 AND sihd_bu = ssl_bu
"
"                                 AND ssl_state = state_id
"
"                                 --AND csl_bill_frm = 'Y'
"
"                              /*   AND NOT EXISTS
"
"                                            (SELECT 1
"
"                                               FROM sales_inv_line_tax_charges
"
"                                              WHERE     siltc_bu = siln_bu
"
"                                                    AND siltc_doc_no = siln_doc_no
"
"                                                    AND siltc_plnt = siln_plnt
"
"                                                    AND siltc_seq_no = siln_seq_no)*/
"
"                               /*  AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr9_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)*/
"
"                                 AND sihd_year = p_year
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                        UNION ALL
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date,
"
"                                 SUM (ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                       THEN
"
"                                          (SILN_CGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_cgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                       THEN
"
"                                          (SILN_SGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_sgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                       THEN
"
"                                          (SILN_UTGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_utgst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                       THEN
"
"                                          (SILN_IGST_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_igst_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                                       THEN
"
"                                          (SIHD_TAX_AMT)
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    v_gstc_amt
"
"                            FROM sales_invoices_hd,
"
"                                 sales_invoices_ln,
"
"                               --  sales_inv_line_tax_charges,
"
"                                 suppliers,
"
"                                 tax_charges_types,
"
"                                 tax_charges,
"
"                                 suplr_ship_loc,
"
"                                 states
"
"                           WHERE     sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                             --    AND siln_bu = siltc_bu
"
"                              --   AND siln_plnt = siltc_plnt
"
"                              --   AND siln_doc_no = siltc_doc_no
"
"                              --   AND siln_seq_no = siltc_seq_no
"
"                                 AND sihd_bu = suplr_bu
"
"                                 AND sihd_cust_id = suplr_suplr_id
"
"                                 AND tctype_bu = tc_bu
"
"                                 AND tctype_id = tc_type_id
"
"                                 AND sihd_bu = p_bu
"
"                                 AND tctype_type_id IN ('CGST',
"
"                                                        'SGST',
"
"                                                        'IGST',
"
"                                                        'UTGST')
"
"                                 AND sihd_type IN ('PR',
"
"                                                   'NS',
"
"                                                   'NN',
"
"                                                   'SP')
"
"                                  AND sihd_status = 'I'
"
"                                   AND sihd_gst_cust_type NOT IN ('E')
"
"                                  AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"                                 AND sihd_cust_id = ssl_suplr_id
"
"                                 AND sihd_bu = ssl_bu
"
"                                 AND suplr_state = state_id
"
"                                 AND sihd_year = p_year
"
"                               /*  AND EXISTS
"
"                                        (SELECT gp_plant
"
"                                           FROM gstr9_plant
"
"                                          WHERE     gp_bu = p_bu
"
"                                                AND gp_sel_flag = 'Y'
"
"                                                AND gp_doc_no = p_doc_no
"
"                                                AND gp_plant = sihd_plant)*/
"
"                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   /* TYPE D - Exempted */
"
"
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_45_type,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'D',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date
"
"                                  FROM (  SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE')
"
"                                                 AND sihd_status = 'I'
"
"                                                /* AND EXISTS
"
"                                                        (SELECT 1
"
"                                                           FROM sales_inv_line_tax_charges,
"
"                                                                tax_charges_types,
"
"                                                                tax_charges
"
"                                                          WHERE     siltc_bu = siln_bu
"
"                                                                AND siltc_doc_no = siln_doc_no
"
"                                                                AND siltc_plnt = siln_plnt
"
"                                                                AND siltc_seq_no = siln_seq_no
"
"                                                                AND tctype_bu = tc_bu
"
"                                                                AND tctype_id = tc_type_id
"
"                                                                AND siltc_bu = tc_bu
"
"                                                                AND siltc_tc_id = tc_tc_id
"
"                                                                AND tctype_type_id IN ('IGST',
"
"                                                                                       'CGST',
"
"                                                                                       'SGST',
"
"                                                                                       'UTGST',
"
"                                                                                       'GSTC')
"
"                                                                AND siltc_tc_pct = 0)*/
"
"                                                  AND siln_gst_exempt_flag = 'Y'
"
"                                                 --AND sihd_gst_cust_type IN ('I', 'L')
"
"                                                 AND sihd_year = p_year
"
"                                               /*  AND EXISTS
"
"                                                        (SELECT gp_plant
"
"                                                           FROM gstr9_plant
"
"                                                          WHERE     gp_bu = p_bu
"
"                                                                AND gp_sel_flag = 'Y'
"
"                                                                AND gp_doc_no = p_doc_no
"
"                                                                AND gp_plant = sihd_plant)*/
"
"                                                 GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                        UNION ALL
"
"                                          SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE',
"
"                                                                   'SR')
"
"                                                 AND sihd_status = 'I'
"
"                                             /*    AND NOT EXISTS
"
"                                                            (SELECT 1
"
"                                                               FROM sales_inv_line_tax_charges
"
"                                                              WHERE     siltc_bu = siln_bu
"
"                                                                    AND siltc_doc_no = siln_doc_no
"
"                                                                    AND siltc_plnt = siln_plnt
"
"                                                                    AND siltc_seq_no = siln_seq_no)*/
"
"                                                AND siln_gst_exempt_flag = 'Y'
"
"                                                 --AND sihd_gst_cust_type IN ('I', 'L')
"
"                                                 AND sihd_year = p_year
"
"                                              /*   AND EXISTS
"
"                                                        (SELECT gp_plant
"
"                                                           FROM gstr9_plant
"
"                                                          WHERE     gp_bu = p_bu
"
"                                                                AND gp_sel_flag = 'Y'
"
"                                                                AND gp_doc_no = p_doc_no
"
"                                                                AND gp_plant = sihd_plant)*/
"
"                                                 GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date));
"
"   /* TYPE E - Nil Rated  */
"
"
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_45_type,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'E',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date
"
"                                  FROM (  SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE')
"
"                                                 AND sihd_status = 'I'
"
"                                               /*  AND EXISTS
"
"                                                        (SELECT 1
"
"                                                           FROM sales_inv_line_tax_charges,
"
"                                                                tax_charges_types,
"
"                                                                tax_charges
"
"                                                          WHERE     siltc_bu = siln_bu
"
"                                                                AND siltc_doc_no = siln_doc_no
"
"                                                                AND siltc_plnt = siln_plnt
"
"                                                                AND siltc_seq_no = siln_seq_no
"
"                                                                AND tctype_bu = tc_bu
"
"                                                                AND tctype_id = tc_type_id
"
"                                                                AND siltc_bu = tc_bu
"
"                                                                AND siltc_tc_id = tc_tc_id
"
"                                                                AND tctype_type_id IN ('IGST',
"
"                                                                                       'CGST',
"
"                                                                                       'SGST',
"
"                                                                                       'UTGST',
"
"                                                                                       'GSTC')
"
"                                                                AND siltc_tc_pct = 0)*/
"
"                                                 AND SILN_GST_EXEMPT_FLAG = 'R'
"
"                                                 --AND sihd_gst_cust_type IN ('I', 'L')
"
"                                               /*  AND EXISTS
"
"                                                        (SELECT gp_plant
"
"                                                           FROM gstr9_plant
"
"                                                          WHERE     gp_bu = p_bu
"
"                                                                AND gp_sel_flag = 'Y'
"
"                                                                AND gp_doc_no = p_doc_no
"
"                                                                AND gp_plant = sihd_plant)*/
"
"                                                 AND sihd_year = p_year
"
"                                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                        UNION ALL
"
"                                          SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE',
"
"                                                                   'SR')
"
"                                                 AND sihd_status = 'I'
"
"                                                /* AND NOT EXISTS
"
"                                                            (SELECT 1
"
"                                                               FROM sales_inv_line_tax_charges
"
"                                                              WHERE     siltc_bu = siln_bu
"
"                                                                    AND siltc_doc_no = siln_doc_no
"
"                                                                    AND siltc_plnt = siln_plnt
"
"                                                                    AND siltc_seq_no = siln_seq_no)*/
"
"                                               AND SILN_GST_EXEMPT_FLAG = 'R'
"
"                                                 --AND sihd_gst_cust_type IN ('I', 'L')
"
"                                               /*  AND EXISTS
"
"                                                        (SELECT gp_plant
"
"                                                           FROM gstr9_plant
"
"                                                          WHERE     gp_bu = p_bu
"
"                                                                AND gp_sel_flag = 'Y'
"
"                                                                AND gp_doc_no = p_doc_no
"
"                                                                AND gp_plant = sihd_plant)*/
"
"                                                 AND sihd_year = p_year
"
"                                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date));
"
"   /* TYPE F - Non-GST supply (includes 'no supply' )   */
"
"
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_45_type,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'F',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date
"
"                                  FROM (  SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE')
"
"                                                 AND sihd_status = 'I'
"
"                                              /*   AND EXISTS
"
"                                                        (SELECT 1
"
"                                                           FROM sales_inv_line_tax_charges,
"
"                                                                tax_charges_types,
"
"                                                                tax_charges
"
"                                                          WHERE     siltc_bu = siln_bu
"
"                                                                AND siltc_doc_no = siln_doc_no
"
"                                                                AND siltc_plnt = siln_plnt
"
"                                                                AND siltc_seq_no = siln_seq_no
"
"                                                                AND tctype_bu = tc_bu
"
"                                                                AND tctype_id = tc_type_id
"
"                                                                AND siltc_bu = tc_bu
"
"                                                                AND siltc_tc_id = tc_tc_id
"
"                                                                AND tctype_type_id IN ('IGST',
"
"                                                                                       'CGST',
"
"                                                                                       'SGST',
"
"                                                                                       'UTGST',
"
"                                                                                       'GSTC')
"
"                                                                AND siltc_tc_pct = 0)*/
"
"                                                 AND siln_gst_exempt_flag = 'N'
"
"                                                 --AND sihd_gst_cust_type IN ('I', 'L')
"
"                                                /* AND EXISTS
"
"                                                        (SELECT gp_plant
"
"                                                           FROM gstr9_plant
"
"                                                          WHERE     gp_bu = p_bu
"
"                                                                AND gp_sel_flag = 'Y'
"
"                                                                AND gp_doc_no = p_doc_no
"
"                                                                AND gp_plant = sihd_plant)*/
"
"                                                 AND sihd_year = p_year
"
"                                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                        UNION ALL
"
"                                          SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE',
"
"                                                                   'SR')
"
"                                                 AND sihd_status = 'I'
"
"                                             /*    AND NOT EXISTS
"
"                                                            (SELECT 1
"
"                                                               FROM sales_inv_line_tax_charges
"
"                                                              WHERE     siltc_bu = siln_bu
"
"                                                                    AND siltc_doc_no = siln_doc_no
"
"                                                                    AND siltc_plnt = siln_plnt
"
"                                                                    AND siltc_seq_no = siln_seq_no)*/
"
"                                                  AND siln_gst_exempt_flag = 'N'
"
"                                                 --AND sihd_gst_cust_type IN ('I', 'L')
"
"                                               /*  AND EXISTS
"
"                                                        (SELECT gp_plant
"
"                                                           FROM gstr9_plant
"
"                                                          WHERE     gp_bu = p_bu
"
"                                                                AND gp_sel_flag = 'Y'
"
"                                                                AND gp_doc_no = p_doc_no
"
"                                                                AND gp_plant = sihd_plant)*/
"
"                                                 AND sihd_year = p_year
"
"                            GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date));
"
"   /* TYPE F - Non-GST supply (includes 'no supply' )   */
"
"   /*
"
"    INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                    g45dd_45_type,
"
"                                    g45dd_doc_no,
"
"                                    g45dd_code_type,
"
"                                    g45dd_inv_no,
"
"                                    g45dd_inv_pfx,
"
"                                    g45dd_inv_date,
"
"                                    g45dd_tax_amt,
"
"                                    g45dd_cgst_amt,
"
"                                    g45dd_sgst_amt,
"
"                                    g45dd_igst_amt,
"
"                                    g45dd_cess_amt,
"
"                                    g45dd_cre_by,
"
"                                    g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'F',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          SELECT sihd_inv_pfx,
"
"                                 sihd_inv_no,
"
"                                 sihd_inv_date
"
"                                  FROM (  SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE')
"
"                                                 AND sihd_status = 'I'
"
"                                                 AND EXISTS
"
"                                                        (SELECT 1
"
"                                                           FROM sales_inv_line_tax_charges,
"
"                                                                tax_charges_types,
"
"                                                                tax_charges
"
"                                                          WHERE     siltc_bu = siln_bu
"
"                                                                AND siltc_doc_no = siln_doc_no
"
"                                                                AND siltc_plnt = siln_plnt
"
"                                                                AND siltc_seq_no = siln_seq_no
"
"                                                                AND tctype_bu = tc_bu
"
"                                                                AND tctype_id = tc_type_id
"
"                                                                AND siltc_bu = tc_bu
"
"                                                                AND siltc_tc_id = tc_tc_id
"
"                                                                AND tctype_type_id IN ('IGST',
"
"                                                                                       'CGST',
"
"                                                                                       'SGST',
"
"                                                                                       'UTGST',
"
"                                                                                       'GSTC')
"
"                                                                AND siltc_tc_pct = 0)
"
"                                                 AND sihd_gst_reg_type IN ('R', 'U')
"
"                                                 AND sihd_gst_cust_type IN ('I', 'L')
"
"                                                 AND sihd_year = p_year
"
"                                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                        UNION ALL
"
"                                          SELECT sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"                                            FROM sales_invoices_hd, sales_invoices_ln, suppliers
"
"                                           WHERE     sihd_bu = suplr_bu
"
"                                                 AND sihd_cust_id = suplr_suplr_id
"
"                                                 AND sihd_bu = siln_bu
"
"                                                 AND sihd_plant = siln_plnt
"
"                                                 AND sihd_doc_no = siln_doc_no
"
"                                                 AND suplr_status = 'A'
"
"                                                 AND sihd_bu = p_bu
"
"                                                 AND sihd_type IN ('SO',
"
"                                                                   'FA',
"
"                                                                   'SS',
"
"                                                                   'LO',
"
"                                                                   'SI',
"
"                                                                   'SU',
"
"                                                                   'FE',
"
"                                                                   'DE',
"
"                                                                   'SR')
"
"                                                 AND sihd_status = 'I'
"
"                                                 AND NOT EXISTS
"
"                                                            (SELECT 1
"
"                                                               FROM sales_inv_line_tax_charges
"
"                                                              WHERE     siltc_bu = siln_bu
"
"                                                                    AND siltc_doc_no = siln_doc_no
"
"                                                                    AND siltc_plnt = siln_plnt
"
"                                                                    AND siltc_seq_no = siln_seq_no)
"
"                                                 AND sihd_gst_reg_type IN ('R', 'U')
"
"                                                 AND sihd_gst_cust_type IN ('I', 'L')
"
"                                                 AND sihd_year = p_year
"
"                                        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date));  */
"
"  /* TYPE H - Credit Notes issued in respect of transactions specified in A to F above (-)  */
"
"       INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                   g45dd_45_type,
"
"                                   g45dd_doc_no,
"
"                                   g45dd_code_type,
"
"                                   g45dd_inv_no,
"
"                                   g45dd_inv_pfx,
"
"                                   g45dd_inv_date,
"
"                                   g45dd_tax_amt,
"
"                                   g45dd_cgst_amt,
"
"                                   g45dd_sgst_amt,
"
"                                   g45dd_igst_amt,
"
"                                   g45dd_cess_amt,
"
"                                   g45dd_cre_by,
"
"                                   g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'H',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"  /*SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM(ROUND (NVL (SILN_ASSBL_VAL, 0), 2) )taxable_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_cgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_sgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_utgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_igst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"         sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND siln_bu = siltc_bu
"
"         AND siln_plnt = siltc_plnt
"
"         AND siln_doc_no = siltc_doc_no
"
"         AND siln_seq_no = siltc_seq_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'UTGST',
"
"                                'GSTC')
"
"         AND siltc_bu = tc_bu
"
"         AND siltc_tc_id = tc_tc_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_sal_ret_type <> 'DM'
"
"         AND sihd_type IN ('DR',
"
"                           'RL',
"
"                           'RS',
"
"                           'SR'
"
"                           'LR',
"
"                           'SN',
"
"                           'RV',
"
"                           'RY',
"
"                           'RH',
"
"                           'RU',
"
"                           'CR',
"
"                           'SU')
"
"         AND sihd_status = 'I'
"
"         AND siltc_tc_pct > 0
"
"         AND sihd_gst_reg_type = 'R'
"
"         AND ssl_gst_no IS NOT NULL
"
"         AND sihd_billto_loc_id = Ssl_loc_id
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"UNION ALL*/
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM(-1 * ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                 THEN
"
"                    (SILN_CGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_cgst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                 THEN
"
"                    (SILN_SGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_sgst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                 THEN
"
"                    (SILN_UTGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_utgst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                 THEN
"
"                    (SILN_IGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_igst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                 THEN
"
"                    (SIHD_TAX_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"       --  sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"      --   AND siln_bu = siltc_bu
"
"       --  AND siln_plnt = siltc_plnt
"
"      --   AND siln_doc_no = siltc_doc_no
"
"     --    AND siln_seq_no = siltc_seq_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"         AND sihd_sal_ret_type = 'CM'
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'UTGST',
"
"                                'GSTC')
"
"       --  AND siltc_bu = tc_bu
"
"      --   AND siltc_tc_id = tc_tc_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_type IN ('DR',
"
"                           'RL',
"
"                           'RS',
"
"                           'SR'                                      /*,'SG'*/
"
"                               ,
"
"                           'LR',
"
"                           'SN',
"
"                           'RV',
"
"                           'RY',
"
"                           'RH',
"
"                           'RU',
"
"                           'CR',
"
"                           'SU')
"
"         AND sihd_status = 'I'
"
"     --    AND siltc_tc_pct = 0
"
"       AND ssl_gst_no IS NOT NULL
"
"          AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"       /*  AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   /* TYPE I - Debit Notes issued in respect of transactions specified in A to F above (+)*/
"
"
"
"   INSERT INTO gstr9_45_dlts_drill(g45dd_bu,
"
"                                   g45dd_45_type,
"
"                                   g45dd_doc_no,
"
"                                   g45dd_code_type,
"
"                                   g45dd_inv_no,
"
"                                   g45dd_inv_pfx,
"
"                                   g45dd_inv_date,
"
"                                   g45dd_tax_amt,
"
"                                   g45dd_cgst_amt,
"
"                                   g45dd_sgst_amt,
"
"                                   g45dd_igst_amt,
"
"                                   g45dd_cess_amt,
"
"                                   g45dd_cre_by,
"
"                                   g45dd_cre_date)
"
"                      SELECT p_bu,
"
"                             'TNP',
"
"                             p_doc_no,
"
"                             'I',
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_date,
"
"                             taxable_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"  /*SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM(ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_cgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_sgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_utgst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_igst_amt,
"
"         SUM (
"
"            CASE
"
"               WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"               THEN
"
"                  (SIHD_TAX_AMT)
"
"               ELSE
"
"                  0
"
"            END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"         sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"         AND siln_bu = siltc_bu
"
"         AND siln_plnt = siltc_plnt
"
"         AND siln_doc_no = siltc_doc_no
"
"         AND siln_seq_no = siltc_seq_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'UTGST',
"
"                                'GSTC')
"
"         AND siltc_bu = tc_bu
"
"         AND siltc_tc_id = tc_tc_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_sal_ret_type <> 'CM'
"
"         AND sihd_type IN ('DR',
"
"                           'RL',
"
"                           'RS',
"
"                           'SR' ,
"
"                           'LR',
"
"                           'SN',
"
"                           'RV',
"
"                           'RY',
"
"                           'RH',
"
"                           'RU',
"
"                           'CR',
"
"                           'SU')
"
"         AND sihd_status = 'I'
"
"         AND siltc_tc_pct > 0
"
"         AND sihd_gst_reg_type = 'R'
"
"         AND ssl_gst_no IS NOT NULL
"
"         AND sihd_billto_loc_id = Ssl_loc_id
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"         AND sihd_year = p_year
"
"        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date
"
"UNION ALL*/
"
"  SELECT sihd_inv_pfx,
"
"         sihd_inv_no,
"
"         sihd_inv_date,
"
"         SUM(-1 * ROUND (NVL (SILN_ASSBL_VAL, 0), 2)) taxable_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                 THEN
"
"                    (SILN_CGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_cgst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                 THEN
"
"                    (SILN_SGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_sgst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                 THEN
"
"                    (SILN_UTGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_utgst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                 THEN
"
"                    (SILN_IGST_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_igst_amt,
"
"           -1
"
"         * SUM (
"
"              CASE
"
"                 WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'GSTC'
"
"                 THEN
"
"                    (SIHD_TAX_AMT)
"
"                 ELSE
"
"                    0
"
"              END)
"
"            v_gstc_amt
"
"    FROM sales_invoices_hd,
"
"         sales_invoices_ln,
"
"       --  sales_inv_line_tax_charges,
"
"         suppliers,
"
"         tax_charges_types,
"
"         tax_charges,
"
"         suplr_ship_loc,
"
"         states
"
"   WHERE     sihd_bu = siln_bu
"
"         AND sihd_plant = siln_plnt
"
"         AND sihd_doc_no = siln_doc_no
"
"       --  AND siln_bu = siltc_bu
"
"       --  AND siln_plnt = siltc_plnt
"
"       --  AND siln_doc_no = siltc_doc_no
"
"        -- AND siln_seq_no = siltc_seq_no
"
"         AND sihd_bu = suplr_bu
"
"         AND sihd_cust_id = suplr_suplr_id
"
"         AND tctype_bu = tc_bu
"
"         AND tctype_id = tc_type_id
"
"         AND sihd_sal_ret_type = 'DM'
"
"         AND tctype_type_id IN ('IGST',
"
"                                'CGST',
"
"                                'SGST',
"
"                                'UTGST',
"
"                                'GSTC')
"
"        -- AND siltc_bu = tc_bu
"
"        -- AND siltc_tc_id = tc_tc_id
"
"         AND sihd_bu = p_bu
"
"         AND sihd_type IN ('DR',
"
"                           'RL',
"
"                           'RS',
"
"                           'SR'                                      /*,'SG'*/
"
"                               ,
"
"                           'LR',
"
"                           'SN',
"
"                           'RV',
"
"                           'RY',
"
"                           'RH',
"
"                           'RU',
"
"                           'CR',
"
"                           'SU')
"
"         AND sihd_status = 'I'
"
"        -- AND siltc_tc_pct = 0
"
"        AND ssl_gst_no IS NOT NULL
"
"         AND SIHD_BILLTO_LOC_NAME = SSL_LOC_NAME1
"
"         AND sihd_cust_id = ssl_suplr_id
"
"         AND sihd_bu = ssl_bu
"
"         AND ssl_state = state_id
"
"        /* AND EXISTS
"
"                (SELECT gp_plant
"
"                   FROM gstr9_plant
"
"                  WHERE     gp_bu = p_bu
"
"                        AND gp_sel_flag = 'Y'
"
"                        AND gp_doc_no = p_doc_no
"
"                        AND gp_plant = sihd_plant)*/
"
"         AND sihd_year = p_year
"
"        GROUP BY sihd_inv_pfx, sihd_inv_no, sihd_inv_date);
"
"   END proc_load_gstr9_5;
"
"
"
"   PROCEDURE proc_load_gstr9_6 (p_bu        gstr9_hd.g9h_bu%type,
"
"                                p_year      gstr9_hd.g9h_year%type,
"
"                                p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                p_user      VARCHAR2)
"
"   IS
"
"   BEGIN
"
"   /* TYPE B - Inward supplies (other than imports and inward supplies liable to reverse charge but includes services received from SEZs)*/
"
"
"
"   INSERT INTO GSTR9_678_DLTS_DRILL(g678dd_bu,
"
"                                    g678dd_doc_no,
"
"                                    g678dd_code_type,
"
"                                    g678dd_type,
"
"                                    g678dd_inv_pfx,
"
"                                    g678dd_inv_no,
"
"                                    g678dd_inv_date,
"
"                                    g678dd_tax_amt,
"
"                                    g678dd_cgst_amt,
"
"                                    g678dd_sgst_amt,
"
"                                    g678dd_igst_amt,
"
"                                    g678dd_cess_amt,
"
"                                    g678dd_cre_by,
"
"                                    g678dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'B',
"
"                             'ITC',
"
"                             suphdh_pfx,
"
"                             suphdh_doc_no,
"
"                             suphdh_doc_date,
"
"                             taxable_amt,
"
"                             cgst_tax_amt,
"
"                             sgst_tax_amt,
"
"                             igst_tax_amt,
"
"                             cess_tax_amt,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          SELECT suphdh_pfx,
"
"                                 suphdh_doc_no,
"
"                                 suphdh_doc_date,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_assbl_val
"
"                                       ELSE sdgb_assbl_val
"
"                                    END)
"
"                                    taxable_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_igst_amt
"
"                                       ELSE sdgb_igst_amt
"
"                                    END)
"
"                                    igst_tax_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_cgst_amt
"
"                                       ELSE sdgb_cgst_amt
"
"                                    END)
"
"                                    cgst_tax_amt,
"
"                                 SUM (
"
"                                    (CASE
"
"                                        WHEN suphdh_doc_type = 'DM'
"
"                                        THEN
"
"                                           -1 * (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                                        ELSE
"
"                                           sdgb_sgst_amt + sdgb_utgst_amt
"
"                                     END))
"
"                                    sgst_tax_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_cess_amt
"
"                                       ELSE sdgb_cess_amt
"
"                                    END)
"
"                                    cess_tax_amt
"
"                            FROM suplr_doc_hd_hist, suplr_doc_gst_bal
"
"                           WHERE     suphdh_bu = sdgb_bu
"
"                               --  AND suphdh_pfx = sdgb_doc_pfx
"
"                                 AND suphdh_doc_no = sdgb_doc_no
"
"                                 AND suphdh_bu = p_bu
"
"                                 AND suphdh_doc_year = p_year
"
"                                 AND sdgb_tax_mode = 'F'
"
"                                 AND suphdh_status = 'P'
"
"                                 AND suphdh_suplr_type = 'R'
"
"                                 AND suphdh_grn_refer NOT IN ('PR')
"
"                                 AND suphdh_currency = func_find_base_currency(p_bu)
"
"                                 AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no
"
"                                                AND g2p_plant = suphdh_plant)
"
"                                 AND sdgb_tax_pct > 0
"
"                        GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date
"
"                        UNION ALL
"
"                          SELECT suphdh_pfx suphdh_pfx,
"
"                                 suphdh_doc_no suphdh_doc_no,
"
"                                 suphdh_doc_date suphdh_doc_date,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_assbl_val
"
"                                       ELSE sdgb_assbl_val
"
"                                    END)
"
"                                    taxable_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_igst_amt
"
"                                       ELSE sdgb_igst_amt
"
"                                    END)
"
"                                    igst_tax_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_cgst_amt
"
"                                       ELSE sdgb_cgst_amt
"
"                                    END)
"
"                                    cgst_tax_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM'
"
"                                       THEN
"
"                                          -1 * (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                                       ELSE
"
"                                          (sdgb_sgst_amt + sdgb_utgst_amt)
"
"                                    END)
"
"                                    sgst_tax_amt,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN suphdh_doc_type = 'DM' THEN -1 * sdgb_cess_amt
"
"                                       ELSE sdgb_cess_amt
"
"                                    END)
"
"                                    cess_tax_amt
"
"                            FROM suplr_doc_hd_hist, suplr_doc_gst_bal
"
"                           WHERE     suphdh_bu = sdgb_bu
"
"                                 --AND suphdh_pfx = sdgb_doc_pfx
"
"                                 AND suphdh_doc_no = sdgb_doc_no
"
"                                 AND suphdh_bu = p_bu
"
"                                 AND suphdh_doc_year = p_year
"
"                                 AND sdgb_tax_mode = 'F'
"
"                                 AND suphdh_status = 'P'
"
"                                 AND suphdh_suplr_type = 'R'
"
"                                 AND suphdh_currency = func_find_base_currency(p_bu)
"
"                                 AND sdgb_tax_pct > 0
"
"                                 -- AND suphdh_grn_refer NOT IN ('PR')
"
"                                /* AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no)*/
"
"                        GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date
"
"                        UNION ALL
"
"                        SELECT btrans_ord_pfx suphdh_pfx,
"
"                               btrans_ord_no suphdh_doc_no,
"
"                               btrans_trans_date suphdh_doc_date,
"
"                               1--SUM(bttc_tc_assbl_val)
"
"                               taxable_amt,
"
"                               1--SUM (bttc_tax_amt)
"
"                               igst_tax_amt,
"
"                               0 cgst_tax_amt,
"
"                               0 sgst_tax_amt,
"
"                               0 cess_tax_amt
"
"                          FROM bank_trans_hist_vw,
"
"                            --   bank_trans_tax_charges,
"
"                               tax_charges,
"
"                               tax_charges_types
"
"                         WHERE  /*   btrans_bu = bttc_bu
"
"                               AND btrans_ord_pfx = bttc_ord_pfx
"
"                               AND btrans_ord_no = bttc_ord_no
"
"                               AND tc_bu = bttc_bu
"
"                               AND tc_tc_id = bttc_tc_id
"
"                               AND*/ tctype_bu = tc_bu
"
"                               AND tc_type_id = tctype_type_id
"
"                               AND tctype_type_id IN ('IGST')
"
"                               AND btrans_status NOT IN ('N',
"
"                                                         'X',
"
"                                                         'V',
"
"                                                         'O',
"
"                                                         'D')
"
"                              --AND bttc_pts_flag = 'Y'
"
"                               AND btrans_trans_curcy = func_find_base_currency(p_bu)
"
"                              -- AND bttc_tax_pct > 0
"
"                               AND btrans_bu = p_bu
"
"                               AND btrans_trans_year= p_year
"
"                              /* AND EXISTS
"
"                                      (SELECT 1
"
"                                         FROM gstr2_plant
"
"                                        WHERE     g2p_bu = p_bu
"
"                                              AND g2p_sel_flag = 'Y'
"
"                                              AND g2p_doc_no = p_doc_no
"
"                                              AND g2p_plant = btrans_plant)*/
"
"                               GROUP BY btrans_ord_pfx,
"
"                                        btrans_ord_no,
"
"                                        btrans_trans_date
"
"                        UNION ALL
"
"                          SELECT btrans_ord_pfx suphdh_pfx,
"
"                                 btrans_ord_no suphdh_doc_no,
"
"                                 btrans_trans_date suphdh_doc_date,
"
"                                 1--SUM(bttc_tc_assbl_val)
"
"                                 taxable_amt,
"
"                                 0 igst_tax_amt,
"
"                                 1--SUM(bttc_tax_amt)
"
"                                 cgst_tax_amt,
"
"                                 0 sgst_tax_amt,
"
"                                 0 cess_tax_amt
"
"                            FROM bank_trans_hist_vw,
"
"                                 --bank_trans_tax_charges,
"
"                                 tax_charges,
"
"                                 tax_charges_types
"
"                           WHERE   /*  btrans_bu = bttc_bu
"
"                                 AND btrans_ord_pfx = bttc_ord_pfx
"
"                                 AND btrans_ord_no = bttc_ord_no
"
"                                 AND tc_bu = bttc_bu
"
"                                 AND tc_tc_id = bttc_tc_id
"
"                                 AND*/ tctype_bu = tc_bu
"
"                                 AND tc_type_id = tctype_type_id
"
"                                 AND tctype_type_id IN ('CGST')
"
"                                 AND btrans_status NOT IN ('N',
"
"                                                           'X',
"
"                                                           'V',
"
"                                                           'O',
"
"                                                           'D')
"
"                                -- AND bttc_pts_flag = 'Y'
"
"                                 AND btrans_trans_curcy = func_find_base_currency(p_bu)
"
"                                -- AND bttc_tax_pct > 0
"
"                                 AND btrans_bu = p_bu
"
"                                 AND btrans_trans_year= p_year
"
"                                /* AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no
"
"                                                AND g2p_plant = btrans_plant)*/
"
"                        GROUP BY btrans_ord_pfx, btrans_ord_no, btrans_trans_date
"
"                        UNION ALL
"
"                          SELECT btrans_ord_pfx suphdh_pfx,
"
"                                 btrans_ord_no suphdh_doc_no,
"
"                                 btrans_trans_date suphdh_doc_date,
"
"                                 1--SUM(bttc_tc_assbl_val)
"
"                                 taxable_amt,
"
"                                 0 igst_tax_amt,
"
"                                 0 cgst_tax_amt,
"
"                                 1--SUM(bttc_tax_amt)
"
"                                 sgst_tax_amt,
"
"                                 0 cess_tax_amt
"
"                            FROM bank_trans_hist_vw,
"
"                                 --bank_trans_tax_charges,
"
"                                 tax_charges,
"
"                                 tax_charges_types
"
"                           WHERE /*    btrans_bu = bttc_bu
"
"                                 AND btrans_ord_pfx = bttc_ord_pfx
"
"                                 AND btrans_ord_no = bttc_ord_no
"
"                                 AND tc_bu = bttc_bu
"
"                                 AND tc_tc_id = bttc_tc_id
"
"                                 AND*/ tctype_bu = tc_bu
"
"                                 AND tc_type_id = tctype_type_id
"
"                                 AND tctype_type_id IN ('SGST')
"
"                                 AND btrans_status NOT IN ('N',
"
"                                                           'X',
"
"                                                           'V',
"
"                                                           'O',
"
"                                                           'D')
"
"                                -- AND bttc_pts_flag = 'Y'
"
"                                 AND btrans_trans_curcy = func_find_base_currency(p_bu)
"
"                               --  AND bttc_tax_pct > 0
"
"                                 AND btrans_bu = p_bu
"
"                                 AND btrans_trans_year= p_year
"
"                               /*  AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no
"
"                                                AND g2p_plant = btrans_plant)*/
"
"                        GROUP BY btrans_ord_pfx, btrans_ord_no, btrans_trans_date
"
"                        UNION ALL
"
"                          SELECT btrans_ord_pfx suphdh_pfx,
"
"                                 btrans_ord_no suphdh_doc_no,
"
"                                 btrans_trans_date suphdh_doc_date,
"
"                                 1--SUM(bttc_tc_assbl_val)
"
"                                 taxable_amt,
"
"                                 0 igst_tax_amt,
"
"                                 0 cgst_tax_amt,
"
"                                 0 sgst_tax_amt,
"
"                                 1--SUM(bttc_tax_amt)
"
"                                 cess_tax_amt
"
"                            FROM bank_trans_hist_vw,
"
"                                -- bank_trans_tax_charges,
"
"                                 tax_charges,
"
"                                 tax_charges_types
"
"                           WHERE   /*  btrans_bu = bttc_bu
"
"                                 AND btrans_ord_pfx = bttc_ord_pfx
"
"                                 AND btrans_ord_no = bttc_ord_no
"
"                                 AND tc_bu = bttc_bu
"
"                                 AND tc_tc_id = bttc_tc_id
"
"                                 AND */tctype_bu = tc_bu
"
"                                 AND tc_type_id = tctype_type_id
"
"                                 AND tctype_type_id IN ('GSTC')
"
"                                 AND btrans_status NOT IN ('N',
"
"                                                           'X',
"
"                                                           'V',
"
"                                                           'O',
"
"                                                           'D')
"
"                                -- AND bttc_pts_flag = 'Y'
"
"                                 --AND bttc_tax_pct > 0
"
"                                 AND btrans_trans_curcy = func_find_base_currency(p_bu)
"
"                                 AND btrans_bu = p_bu
"
"                                 AND btrans_trans_year= p_year
"
"                                /* AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no
"
"                                                AND g2p_plant = btrans_plant)*/
"
"                        GROUP BY btrans_ord_pfx, btrans_ord_no, btrans_trans_date);
"
"   /* TYPE C - Inward supplies received from unregistered persons liable to reverse charge*/
"
"
"
"   INSERT INTO GSTR9_678_DLTS_DRILL(g678dd_bu,
"
"                                    g678dd_doc_no,
"
"                                    g678dd_code_type,
"
"                                    g678dd_type,
"
"                                    g678dd_inv_pfx,
"
"                                    g678dd_inv_no,
"
"                                    g678dd_inv_date,
"
"                                    g678dd_tax_amt,
"
"                                    g678dd_cgst_amt,
"
"                                    g678dd_sgst_amt,
"
"                                    g678dd_igst_amt,
"
"                                    g678dd_cess_amt,
"
"                                    g678dd_cre_by,
"
"                                    g678dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'C',
"
"                             'ITC',
"
"                             suphdh_pfx,
"
"                             suphdh_doc_no,
"
"                             suphdh_doc_date,
"
"                             taxable_val,
"
"                             cgst_tax_amt,
"
"                             sgst_tax_amt,
"
"                             igst_tax_amt,
"
"                             cess_tax_amt,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                        SELECT suphdh_pfx,
"
"                         suphdh_doc_no,
"
"                         suphdh_doc_date,
"
"                         SUM (
"
"                            CASE
"
"                               WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                               THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_assess_val
"
"                                 ELSE 1--sdlitch_assess_val
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        taxable_val,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'IGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                 ELSE 1--sdlitch_tax_amt
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        igst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'CGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                 ELSE 1--sdlitch_tax_amt
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'SGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                 ELSE 1--sdlitch_tax_amt
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        sgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'GSTC'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                 ELSE 1--sdlitch_tax_amt
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cess_tax_amt
"
"                FROM suplr_doc_hd_hist,
"
"                     suplr_doc_ln_hist,
"
"                   --  suplr_doc_ln_inv_tc_hist,
"
"                     tax_charges,
"
"                     tax_charges_types
"
"               WHERE     suphdh_bu = suplnh_bu
"
"                   --  AND suphdh_pfx = suplnh_pfx
"
"                     AND suphdh_doc_no = suplnh_doc_no
"
"                   /*  AND sdlitch_bu(+) = suplnh_bu
"
"                     AND sdlitch_doc_pfx(+) = suplnh_pfx
"
"                     AND sdlitch_doc_no(+) = suplnh_doc_no
"
"                     AND sdlitch_seq_no(+) = suplnh_seq_no
"
"                     AND tc_bu(+) = sdlitch_bu
"
"                     AND tc_tc_id(+) = sdlitch_tc_id*/
"
"                     AND tctype_bu(+) = tc_bu
"
"                     AND tctype_id(+) = tc_type_id
"
"                     AND suphdh_status = 'P'
"
"                  --   AND sdlitch_tax_pct <> 0
"
"                     AND suphdh_bu = p_bu
"
"                     AND suphdh_suplr_type = 'U'
"
"                     AND suplnh_gst_rev_tax_flag = 'Y'
"
"                     AND suphdh_cr_avl_status = 'A'
"
"                     AND suphdh_doc_year = p_year
"
"                     AND tctype_type_id IN ('IGST',
"
"                                            'CGST',
"
"                                            'SGST',
"
"                                            'GSTC')
"
"                     AND suphdh_currency = 'INR'
"
"            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date
"
"/*            UNION ALL
"
"              SELECT suphdh_pfx,
"
"                     suphdh_doc_no,
"
"                     suphdh_doc_date,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_inv_assess
"
"                                 ELSE sdtch_inv_assess
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        taxable_val,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'IGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                 ELSE sdtch_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        igst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'CGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                 ELSE sdtch_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'SGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                 ELSE sdtch_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        sgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'GSTC'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                 ELSE sdtch_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cess_tax_amt
"
"                FROM suplr_doc_hd_hist,
"
"                     suplr_doc_tax_charges_hist,
"
"                     tax_charges,
"
"                     tax_charges_types
"
"               WHERE     sdtch_bu(+) = suphdh_bu
"
"                     AND sdtch_pfx(+) = suphdh_pfx
"
"                     AND sdtch_doc_no(+) = suphdh_doc_no
"
"                     AND tc_bu(+) = sdtch_bu
"
"                     AND tc_tc_id(+) = sdtch_tc_id
"
"                     AND tctype_bu(+) = tc_bu
"
"                     AND tctype_id(+) = tc_type_id
"
"                     AND suphdh_status = 'P'
"
"                     AND sdtch_tc_pct <> 0
"
"                     AND suphdh_bu = p_bu
"
"                     AND suphdh_doc_year = p_year
"
"                     AND tctype_type_id IN ('IGST',
"
"                                            'CGST',
"
"                                            'SGST',
"
"                                            'GSTC')
"
"                     AND supln_gst_rev_tax_flag = 'Y'
"
"                     AND suphdh_currency = 'INR'
"
"            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date*/
"
"            UNION ALL
"
"              SELECT suphdh_pfx,
"
"                     suphdh_doc_no,
"
"                     suphdh_doc_date,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_assbl_val
"
"                                 ELSE 1--sddl_assbl_val
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        taxable_val,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'IGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                 ELSE 1--sddl_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        igst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'CGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                 ELSE 1--sddl_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'SGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                 ELSE 1--sddl_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        sgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'GSTC'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                 ELSE 1--sddl_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cess_tax_amt
"
"                FROM suplr_doc_hd_hist,
"
"                    -- suplr_doc_dist_ln,
"
"                    -- gst_lvl_accounts,
"
"                     tax_charges,
"
"                     tax_charges_types
"
"               WHERE    /* suphdh_bu = sddl_bu
"
"                     AND suphdh_pfx = sddl_pfx
"
"                     AND suphdh_doc_no = sddl_doc_no
"
"                     AND sddl_bu = gstl_bu
"
"                     AND sddl_acct = gstl_acct
"
"                     AND tc_bu(+) = sddl_bu
"
"                     AND tc_tc_id(+) = sddl_tax_code
"
"                     AND*/ tctype_bu(+) = tc_bu
"
"                     AND tctype_id(+) = tc_type_id
"
"                     AND suphdh_status = 'P'
"
"                     AND suphdh_suplr_type = 'U'
"
"                     --AND sddl_gst_rev_tax_flag = 'Y'
"
"                     AND suphdh_cr_avl_status = 'A'
"
"                     AND suphdh_bu = p_bu
"
"                     AND suphdh_doc_year = p_year
"
"                     AND tctype_type_id IN ('IGST',
"
"                                            'CGST',
"
"                                            'SGST',
"
"                                            'GSTC')
"
"                     --AND sddl_tax_code IS NOT NULL
"
"                     --AND gstl_type IN ('CGSTR', 'SGSTR', 'IGSTR')
"
"            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date
"
"        /*    UNION ALL
"
"              SELECT suphdh_pfx suphdh_pfx,
"
"                     suphdh_doc_no suphdh_doc_no,
"
"                     suphdh_doc_date suphdh_doc_date,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_assbl_val
"
"                                 ELSE sddlh_assbl_val
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        taxable_val,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'IGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                 ELSE sddlh_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        igst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'CGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                 ELSE sddlh_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'SGST'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                 ELSE sddlh_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        sgst_tax_amt,
"
"                     SUM (
"
"                        CASE
"
"                           WHEN tctype_type_id = 'GSTC'
"
"                           THEN
"
"                              CASE
"
"                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                 ELSE sddlh_sc_amount
"
"                              END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                        cess_tax_amt
"
"                FROM suplr_doc_hd_hist,
"
"                     suplr_doc_dist_ln_hist,
"
"                     gst_lvl_accounts,
"
"                     tax_charges,
"
"                     tax_charges_types
"
"               WHERE     suphdh_bu = sddlh_bu
"
"                     AND suphdh_pfx = sddlh_pfx
"
"                     AND suphdh_doc_no = sddlh_doc_no
"
"                     AND sddlh_bu = gstl_bu
"
"                     AND sddlh_acct = gstl_acct
"
"                     AND tc_bu(+) = sddlh_bu
"
"                     AND tc_tc_id(+) = sddlh_tax_code
"
"                     AND tctype_bu(+) = tc_bu
"
"                     AND tctype_id(+) = tc_type_id
"
"                     AND suphdh_status = 'P'
"
"                     AND suphdh_bu = p_bu
"
"                     AND suphdh_doc_year = p_year
"
"                     AND tctype_type_id IN ('IGST',
"
"                                            'CGST',
"
"                                            'SGST',
"
"                                            'GSTC')
"
"                     AND sddlh_tax_code IS NOT NULL
"
"                     AND gstl_type IN ('CGSTR', 'SGSTR', 'IGSTR')
"
"            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date*/
"
"            UNION ALL
"
"            SELECT btrans_ord_pfx suphdh_pfx,
"
"                   btrans_ord_no suphdh_doc_no,
"
"                   btrans_trans_date suphdh_doc_date,
"
"                   SUM(CASE WHEN tctype_type_id IN ('IGST') THEN 1--bttc_tc_assbl_val
"
"                   ELSE 0 END)
"
"                   taxable_val,
"
"                   1--SUM (bttc_tax_amt)
"
"                   igst_tax_amt,
"
"                   0 cgst_tax_amt,
"
"                   0 sgst_tax_amt,
"
"                   0 cess_tax_amt
"
"              FROM bank_trans_hist_vw,
"
"                   --bank_trans_tax_charges,
"
"                   tax_charges,
"
"                   tax_charges_types
"
"             WHERE /*    btrans_bu = bttc_bu
"
"                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                   AND btrans_ord_no = bttc_ord_no
"
"                   AND tc_bu = bttc_bu
"
"                   AND tc_tc_id = bttc_tc_id
"
"                   AND */tctype_bu = tc_bu
"
"                   AND tctype_id = tc_type_id
"
"                   AND tctype_type_id IN ('IGST')
"
"                   AND btrans_status NOT IN ('N',
"
"                                             'X',
"
"                                             'V',
"
"                                             'O',
"
"                                             'D')
"
"                  -- AND bttc_pts_flag = 'N'
"
"                   /*AND btdln_gst_type = 'U'
"
"                   AND btdln_gst_rev_tax_flag = 'Y'
"
"                   AND btdln_cr_avl_status ='A' */
"
"                   --AND bttc_tax_pct > 0
"
"                   AND btrans_bu = p_bu
"
"                   AND btrans_trans_year= p_year
"
"                   GROUP BY btrans_ord_pfx,
"
"                            btrans_ord_no,
"
"                            btrans_trans_date
"
"            UNION ALL
"
"            SELECT suphdh_pfx,
"
"                   suphdh_doc_no,
"
"                   suphdh_doc_date,
"
"                   SUM(taxable_val) taxable_val,
"
"                   SUM(igst_tax_amt) igst_tax_amt,
"
"                   SUM(cgst_tax_amt) cgst_tax_amt,
"
"                   SUM(sgst_tax_amt) sgst_tax_amt,
"
"                   SUM(cess_tax_amt) cess_tax_amt
"
"              FROM (
"
"            SELECT  btrans_ord_pfx suphdh_pfx,
"
"                   btrans_ord_no suphdh_doc_no,
"
"                   btrans_trans_date suphdh_doc_date,
"
"                   SUM(CASE WHEN tctype_type_id IN ('CGST') THEN 1-- bttc_tc_assbl_val
"
"                    ELSE 0 END)
"
"                      taxable_val,
"
"                   0 igst_tax_amt,
"
"                   1--SUM(bttc_tax_amt)
"
"                   cgst_tax_amt,
"
"                   0 sgst_tax_amt,
"
"                   0 cess_tax_amt
"
"              FROM bank_trans_hist_vw,
"
"                   --bank_trans_tax_charges,
"
"                   tax_charges,
"
"                   tax_charges_types
"
"             WHERE  /*   btrans_bu = bttc_bu
"
"                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                   AND btrans_ord_no = bttc_ord_no
"
"                   AND tc_bu = bttc_bu
"
"                   AND tc_tc_id = bttc_tc_id
"
"                   AND*/ tctype_bu = tc_bu
"
"                   AND tctype_id = tc_type_id
"
"                   AND tctype_type_id IN ('CGST')
"
"                   AND btrans_status NOT IN ('N',
"
"                                             'X',
"
"                                             'V',
"
"                                             'O',
"
"                                             'D')
"
"                  -- AND bttc_pts_flag = 'N'
"
"                  /* AND btdln_gst_type = 'U'
"
"                   AND btdln_gst_rev_tax_flag = 'Y'
"
"                   AND btdln_cr_avl_status ='A' */
"
"                 --  AND bttc_tax_pct > 0
"
"                   AND btrans_bu = p_bu
"
"                   AND btrans_trans_year= p_year
"
"                  GROUP BY btrans_ord_pfx,
"
"                            btrans_ord_no,
"
"                            btrans_trans_date
"
"            UNION ALL
"
"            SELECT btrans_ord_pfx suphdh_pfx,
"
"                   btrans_ord_no suphdh_doc_no,
"
"                   btrans_trans_date suphdh_doc_date,
"
"                   0 taxable_val,
"
"                   0 igst_tax_amt,
"
"                   0 cgst_tax_amt,
"
"                   1--SUM(bttc_tax_amt)
"
"                   sgst_tax_amt,
"
"                   0 cess_tax_amt
"
"              FROM bank_trans_hist_vw,
"
"                  --bank_trans_tax_charges,
"
"                   tax_charges,
"
"                   tax_charges_types
"
"             WHERE  /*   btrans_bu = bttc_bu
"
"                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                   AND btrans_ord_no = bttc_ord_no
"
"                   AND tc_bu = bttc_bu
"
"                   AND tc_tc_id = bttc_tc_id
"
"                   AND*/ tctype_bu = tc_bu
"
"                   AND tctype_id = tc_type_id
"
"                   AND tctype_type_id IN ('SGST')
"
"                   AND btrans_status NOT IN ('N',
"
"                                             'X',
"
"                                             'V',
"
"                                             'O',
"
"                                             'D')
"
"                 --  AND bttc_pts_flag = 'N'
"
"                 /*  AND btdln_gst_type = 'U'
"
"                   AND btdln_gst_rev_tax_flag = 'Y'
"
"                   AND btdln_cr_avl_status ='A' */
"
"                 --  AND bttc_tax_pct > 0
"
"                   AND btrans_bu = p_bu
"
"                   AND btrans_trans_year= p_year
"
"                 /*  AND EXISTS
"
"                          (SELECT 1
"
"                             FROM gstr2_plant
"
"                            WHERE     g2p_bu = p_bu
"
"                                  AND g2p_sel_flag = 'Y'
"
"                                  AND g2p_doc_no = p_doc_no
"
"                                  AND g2p_plant = btrans_plant)*/
"
"                   GROUP BY btrans_ord_pfx,
"
"                            btrans_ord_no,
"
"                            btrans_trans_date )
"
"                   GROUP BY suphdh_pfx,
"
"                   suphdh_doc_no,
"
"                   suphdh_doc_date
"
"            UNION ALL
"
"            SELECT btrans_ord_pfx suphdh_pfx,
"
"                   btrans_ord_no suphdh_doc_no,
"
"                   btrans_trans_date suphdh_doc_date,
"
"                   0 taxable_val,
"
"                   0 igst_tax_amt,
"
"                   0 cgst_tax_amt,
"
"                   0 sgst_tax_amt,
"
"                  1-- SUM(bttc_tax_amt)
"
"                  cess_tax_amt
"
"              FROM bank_trans_hist_vw,
"
"                   --bank_trans_tax_charges,
"
"                   tax_charges,
"
"                   tax_charges_types
"
"             WHERE  /*   btrans_bu = bttc_bu
"
"                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                   AND btrans_ord_no = bttc_ord_no
"
"                   AND tc_bu = bttc_bu
"
"                   AND tc_tc_id = bttc_tc_id
"
"                   AND*/ tctype_bu = tc_bu
"
"                   AND tctype_id = tc_type_id
"
"                  /* AND btdln_gst_type = 'U'
"
"                   AND btdln_gst_rev_tax_flag = 'Y'
"
"                   AND btdln_cr_avl_status ='A' */
"
"                   AND tctype_type_id IN ('GSTC')
"
"                   AND btrans_status NOT IN ('N',
"
"                                             'X',
"
"                                             'V',
"
"                                             'O',
"
"                                             'D')
"
"                  -- AND bttc_pts_flag = 'N'
"
"                  -- AND bttc_tax_pct > 0
"
"                   AND btrans_bu = p_bu
"
"                   AND btrans_trans_year= p_year
"
"                   GROUP BY btrans_ord_pfx,
"
"                            btrans_ord_no,
"
"                            btrans_trans_date);
"
"  /* TYPE D - Inward supplies received from registered persons liable to reverse charge (other than B above) on which tax is paid and ITC availed*/
"
"
"
"   INSERT INTO GSTR9_678_DLTS_DRILL(g678dd_bu,
"
"                                    g678dd_doc_no,
"
"                                    g678dd_code_type,
"
"                                    g678dd_type,
"
"                                    g678dd_inv_pfx,
"
"                                    g678dd_inv_no,
"
"                                    g678dd_inv_date,
"
"                                    g678dd_tax_amt,
"
"                                    g678dd_cgst_amt,
"
"                                    g678dd_sgst_amt,
"
"                                    g678dd_igst_amt,
"
"                                    g678dd_cess_amt,
"
"                                    g678dd_cre_by,
"
"                                    g678dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'D',
"
"                             'ITC',
"
"                             suphdh_pfx,
"
"                             suphdh_doc_no,
"
"                             suphdh_doc_date,
"
"                             taxable_val,
"
"                             cgst_tax_amt,
"
"                             sgst_tax_amt,
"
"                             igst_tax_amt,
"
"                             cess_tax_amt,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                              SELECT suphdh_pfx,
"
"                                     suphdh_doc_no,
"
"                                     suphdh_doc_date,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_assess_val
"
"                                                 ELSE 1--sdlitch_assess_val
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        taxable_val,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'IGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                                 ELSE 1--sdlitch_tax_amt
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        igst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'CGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                                 ELSE 1--sdlitch_tax_amt
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'SGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                                 ELSE 1--sdlitch_tax_amt
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        sgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'GSTC'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sdlitch_tax_amt
"
"                                                 ELSE 1--sdlitch_tax_amt
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cess_tax_amt
"
"                                FROM suplr_doc_hd_hist,
"
"                                     suplr_doc_ln_hist,
"
"                                   --  suplr_doc_ln_inv_tc_hist,
"
"                                     tax_charges,
"
"                                     tax_charges_types
"
"                               WHERE     suphdh_bu = suplnh_bu
"
"                                --     AND suphdh_pfx = suplnh_pfx
"
"                                     AND suphdh_doc_no = suplnh_doc_no
"
"                                    AND tctype_bu(+) = tc_bu
"
"                                     AND tctype_id(+) = tc_type_id
"
"                                     AND suphdh_status = 'P'
"
"                                     AND suphdh_suplr_type = 'R'
"
"                                     AND suplnh_gst_rev_tax_flag = 'Y'
"
"                                     AND suphdh_bu = p_bu
"
"                                     AND suphdh_doc_year = p_year
"
"                                     AND tctype_type_id IN ('IGST',
"
"                                                            'CGST',
"
"                                                            'SGST',
"
"                                                            'GSTC')
"
"                                     AND suplnh_gst_rev_tax_flag = 'Y'
"
"                                     AND suphdh_currency = 'INR'
"
"                                   /*  AND EXISTS
"
"                                            (SELECT 1
"
"                                               FROM gstr2_plant
"
"                                              WHERE     g2p_bu = p_bu
"
"                                                    AND g2p_sel_flag = 'Y'
"
"                                                    AND g2p_doc_no = p_doc_no
"
"                                                    AND g2p_plant = suphdh_plant)*/
"
"                            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date
"
"                         /*   UNION ALL
"
"                              SELECT suphdh_pfx suphdh_pfx,
"
"                                     suphdh_doc_no suphdh_doc_no,
"
"                                     suphdh_doc_date suphdh_doc_date,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_inv_assess
"
"                                                 ELSE sdtch_inv_assess
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        taxable_val,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'IGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                                 ELSE sdtch_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        igst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'CGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                                 ELSE sdtch_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'SGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                                 ELSE sdtch_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        sgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'GSTC'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sdtch_amount
"
"                                                 ELSE sdtch_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cess_tax_amt
"
"                                FROM suplr_doc_hd_hist,
"
"                                     suplr_doc_tax_charges_hist,
"
"                                     tax_charges,
"
"                                     tax_charges_types
"
"                               WHERE     sdtch_bu(+) = suphdh_bu
"
"                                     AND sdtch_pfx(+) = suphdh_pfx
"
"                                     AND sdtch_doc_no(+) = suphdh_doc_no
"
"                                     AND tc_bu(+) = sdtch_bu
"
"                                     AND tc_tc_id(+) = sdtch_tc_id
"
"                                     AND tctype_bu(+) = tc_bu
"
"                                     AND tctype_id(+) = tc_type_id
"
"                                     AND suphdh_status = 'P'
"
"                                     AND sdtch_tc_pct <> 0
"
"                                     AND suphdh_bu = p_bu
"
"                                     AND suphdh_doc_year = p_year
"
"                                     AND tctype_type_id IN ('IGST',
"
"                                                            'CGST',
"
"                                                            'SGST',
"
"                                                            'GSTC')
"
"                                     AND supln_gst_rev_tax_flag = 'Y'
"
"                                     AND suphdh_currency = 'INR'
"
"                            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date*/
"
"                            UNION ALL
"
"                              SELECT suphdh_pfx,
"
"                                     suphdh_doc_no,
"
"                                     suphdh_doc_date,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_assbl_val
"
"                                                 ELSE 1--sddl_assbl_val
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        taxable_val,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'IGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                                 ELSE 1--sddl_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        igst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'CGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                                 ELSE 1--sddl_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'SGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                                 ELSE 1--sddl_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        sgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'GSTC'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * 1--sddl_sc_amount
"
"                                                 ELSE 1--sddl_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cess_tax_amt
"
"                                FROM suplr_doc_hd_hist,
"
"                                  --   suplr_doc_dist_ln,
"
"                                  --   gst_lvl_accounts,
"
"                                     tax_charges,
"
"                                     tax_charges_types
"
"                               WHERE     tctype_bu(+) = tc_bu
"
"                                     AND tctype_id(+) = tc_type_id
"
"                                     AND suphdh_status = 'P'
"
"                                     AND suphdh_suplr_type = 'R'
"
"                                      AND suphdh_bu = p_bu
"
"                                     AND suphdh_doc_year = p_year
"
"                                     AND tctype_type_id IN ('IGST',
"
"                                                            'CGST',
"
"                                                            'SGST',
"
"                                                            'GSTC')
"
"                                       --   AND gstl_type IN ('CGSTR', 'SGSTR', 'IGSTR')
"
"                                    /* AND EXISTS
"
"                                            (SELECT 1
"
"                                               FROM gstr2_plant
"
"                                              WHERE     g2p_bu = p_bu
"
"                                                    AND g2p_sel_flag = 'Y'
"
"                                                    AND g2p_doc_no = p_doc_no
"
"                                                    AND g2p_plant = suphdh_plant)*/
"
"                            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date
"
"                         /*   UNION ALL
"
"                              SELECT suphdh_pfx suphdh_pfx,
"
"                                     suphdh_doc_no suphdh_doc_no,
"
"                                     suphdh_doc_date suphdh_doc_date,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_assbl_val
"
"                                                 ELSE sddlh_assbl_val
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        taxable_val,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'IGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                                 ELSE sddlh_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        igst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'CGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                                 ELSE sddlh_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'SGST'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                                 ELSE sddlh_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        sgst_tax_amt,
"
"                                     SUM (
"
"                                        CASE
"
"                                           WHEN tctype_type_id = 'GSTC'
"
"                                           THEN
"
"                                              CASE
"
"                                                 WHEN suphdh_doc_type = 'DM' THEN -1 * sddlh_sc_amount
"
"                                                 ELSE sddlh_sc_amount
"
"                                              END
"
"                                           ELSE
"
"                                              0
"
"                                        END)
"
"                                        cess_tax_amt
"
"                                FROM suplr_doc_hd_hist,
"
"                                     suplr_doc_dist_ln_hist,
"
"                                     gst_lvl_accounts,
"
"                                     tax_charges,
"
"                                     tax_charges_types
"
"                               WHERE     suphdh_bu = sddlh_bu
"
"                                     AND suphdh_pfx = sddlh_pfx
"
"                                     AND suphdh_doc_no = sddlh_doc_no
"
"                                     AND sddlh_bu = gstl_bu
"
"                                     AND sddlh_acct = gstl_acct
"
"                                     AND tc_bu(+) = sddlh_bu
"
"                                     AND tc_tc_id(+) = sddlh_tax_code
"
"                                     AND tctype_bu(+) = tc_bu
"
"                                     AND tctype_id(+) = tc_type_id
"
"                                     AND suphdh_status = 'P'
"
"                                     AND suphdh_bu = p_bu
"
"                                     AND suphdh_doc_year = p_year
"
"                                     AND tctype_type_id IN ('IGST',
"
"                                                            'CGST',
"
"                                                            'SGST',
"
"                                                            'GSTC')
"
"                                     AND sddlh_tax_code IS NOT NULL
"
"                                     AND gstl_type IN ('CGSTR', 'SGSTR', 'IGSTR')
"
"                            GROUP BY suphdh_pfx, suphdh_doc_no, suphdh_doc_date*/
"
"                            UNION ALL
"
"                            SELECT btrans_ord_pfx suphdh_pfx,
"
"                                   btrans_ord_no suphdh_doc_no,
"
"                                   btrans_trans_date suphdh_doc_date,
"
"                                   SUM(CASE WHEN tctype_type_id IN ('IGST') THEN 1--bttc_tc_assbl_val
"
"                                       ELSE 0 END)
"
"                                      taxable_val,
"
"                                   1--SUM(bttc_tax_amt)
"
"                                   igst_tax_amt,
"
"                                   0 cgst_tax_amt,
"
"                                   0 sgst_tax_amt,
"
"                                   0 cess_tax_amt
"
"                              FROM bank_trans_hist_vw,
"
"                                --   bank_trans_tax_charges,
"
"                                   tax_charges,
"
"                                   tax_charges_types
"
"                             WHERE /*    btrans_bu = bttc_bu
"
"                                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                                   AND btrans_ord_no = bttc_ord_no
"
"                                   AND tc_bu = bttc_bu
"
"                                   AND tc_tc_id = bttc_tc_id
"
"                                   AND*/ tctype_bu = tc_bu
"
"                                   AND tctype_id = tc_type_id
"
"                                   AND tctype_type_id IN ('IGST')
"
"                                   AND btrans_status NOT IN ('N',
"
"                                                             'X',
"
"                                                             'V',
"
"                                                             'O',
"
"                                                             'D')
"
"                                 /*  AND bttc_pts_flag = 'N'
"
"                                   AND bttc_tax_pct > 0*/
"
"                                   AND btrans_bu = p_bu
"
"                                   AND btrans_trans_year= p_year
"
"                                  GROUP BY btrans_ord_pfx,
"
"                                           btrans_ord_no,
"
"                                           btrans_trans_date
"
"                            UNION ALL
"
"                            SELECT suphdh_pfx,
"
"                                   suphdh_doc_no,
"
"                                   suphdh_doc_date,
"
"                                   SUM(taxable_val) taxable_val,
"
"                                   SUM(igst_tax_amt) igst_tax_amt,
"
"                                   SUM(cgst_tax_amt) cgst_tax_amt,
"
"                                   SUM(sgst_tax_amt) sgst_tax_amt,
"
"                                   SUM(cess_tax_amt)
"
"                            FROM(
"
"                            SELECT btrans_ord_pfx suphdh_pfx,
"
"                                   btrans_ord_no suphdh_doc_no,
"
"                                   btrans_trans_date suphdh_doc_date,
"
"                                   SUM(CASE WHEN tctype_type_id IN ('CGST') THEN 1--bttc_tc_assbl_val
"
"                                      ELSE 0 END)
"
"                                      taxable_val,
"
"                                   0 igst_tax_amt,
"
"                                 1--  SUM(bttc_tax_amt)
"
"                                    cgst_tax_amt,
"
"                                   0 sgst_tax_amt,
"
"                                   0 cess_tax_amt
"
"                              FROM bank_trans_hist_vw,
"
"                                --   bank_trans_tax_charges,
"
"                                   tax_charges,
"
"                                   tax_charges_types
"
"                             WHERE   /*  btrans_bu = bttc_bu
"
"                                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                                   AND btrans_ord_no = bttc_ord_no
"
"                                   AND tc_bu = bttc_bu
"
"                                   AND tc_tc_id = bttc_tc_id
"
"                                   AND*/ tctype_bu = tc_bu
"
"                                   AND tctype_id = tc_type_id
"
"                                   AND tctype_type_id IN ('CGST')
"
"                                   AND btrans_status NOT IN ('N',
"
"                                                             'X',
"
"                                                             'V',
"
"                                                             'O',
"
"                                                             'D')
"
"                                   AND btrans_bu = p_bu
"
"                                   AND btrans_trans_year= p_year
"
"                                  GROUP BY btrans_ord_pfx,
"
"                                           btrans_ord_no,
"
"                                           btrans_trans_date
"
"                            UNION ALL
"
"                            SELECT btrans_ord_pfx suphdh_pfx,
"
"                                   btrans_ord_no suphdh_doc_no,
"
"                                   btrans_trans_date suphdh_doc_date,
"
"                                   0 taxable_val,
"
"                                   0 igst_tax_amt,
"
"                                   0 cgst_tax_amt,
"
"                                  1-- SUM(bttc_tax_amt)
"
"                                    sgst_tax_amt,
"
"                                   0 cess_tax_amt
"
"                              FROM bank_trans_hist_vw,
"
"                                 --  bank_trans_tax_charges,
"
"                                   tax_charges,
"
"                                   tax_charges_types
"
"                             WHERE  /*   btrans_bu = bttc_bu
"
"                                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                                   AND btrans_ord_no = bttc_ord_no
"
"                                   AND tc_bu = bttc_bu
"
"                                   AND tc_tc_id = bttc_tc_id
"
"                                   AND*/ tctype_bu = tc_bu
"
"                                   AND tctype_id = tc_type_id
"
"                                   AND tctype_type_id IN ('SGST')
"
"                                   AND btrans_status NOT IN ('N',
"
"                                                             'X',
"
"                                                             'V',
"
"                                                             'O',
"
"                                                             'D')
"
"                                   AND btrans_bu = p_bu
"
"                                   AND btrans_trans_year= p_year
"
"                                  GROUP BY btrans_ord_pfx,
"
"                                           btrans_ord_no,
"
"                                           btrans_trans_date)
"
"                                  GROUP BY suphdh_pfx,
"
"                                   suphdh_doc_no,
"
"                                   suphdh_doc_date
"
"                            UNION ALL
"
"                            SELECT btrans_ord_pfx suphdh_pfx,
"
"                                   btrans_ord_no suphdh_doc_no,
"
"                                   btrans_trans_date suphdh_doc_date,
"
"                                   0 taxable_val,
"
"                                   0 igst_tax_amt,
"
"                                   0 cgst_tax_amt,
"
"                                   0 sgst_tax_amt,
"
"                                  1-- SUM(bttc_tax_amt)
"
"                                   cess_tax_amt
"
"                              FROM bank_trans_hist_vw,
"
"                                 --  bank_trans_tax_charges,
"
"                                   tax_charges,
"
"                                   tax_charges_types
"
"                             WHERE  /*   btrans_bu = bttc_bu
"
"                                   AND btrans_ord_pfx = bttc_ord_pfx
"
"                                   AND btrans_ord_no = bttc_ord_no
"
"                                   AND tc_bu = bttc_bu
"
"                                   AND tc_tc_id = bttc_tc_id
"
"                                   AND*/ tctype_bu = tc_bu
"
"                                   AND tctype_id = tc_type_id
"
"                                   AND tctype_type_id IN ('GSTC')
"
"                                   AND btrans_status NOT IN ('N',
"
"                                                             'X',
"
"                                                             'V',
"
"                                                             'O',
"
"                                                             'D')
"
"                                  /* AND bttc_pts_flag = 'N'
"
"                                   AND bttc_tax_pct > 0*/
"
"                                   AND btrans_bu = p_bu
"
"                                   AND btrans_trans_year= p_year
"
"                                   GROUP BY btrans_ord_pfx,
"
"                                            btrans_ord_no,
"
"                                            btrans_trans_date);
"
"
"
"   /* TYPE E - Import of goods (including supplies from SEZ)*/
"
"
"
"   INSERT INTO GSTR9_678_DLTS_DRILL(g678dd_bu,
"
"                                    g678dd_doc_no,
"
"                                    g678dd_code_type,
"
"                                    g678dd_type,
"
"                                    g678dd_inv_pfx,
"
"                                    g678dd_inv_no,
"
"                                    g678dd_inv_date,
"
"                                    g678dd_tax_amt,
"
"                                    g678dd_cgst_amt,
"
"                                    g678dd_sgst_amt,
"
"                                    g678dd_igst_amt,
"
"                                    g678dd_cess_amt,
"
"                                    g678dd_cre_by,
"
"                                    g678dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             'E',
"
"                             'ITC',
"
"                             suphdh_pfx,
"
"                             suphdh_doc_no,
"
"                             suphdh_doc_date,
"
"                             taxable_val,
"
"                             cgst_tax_amt,
"
"                             sgst_tax_amt,
"
"                             igst_tax_amt,
"
"                             cess_tax_amt,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                          SELECT suphdh_pfx suphdh_pfx,
"
"                                 suphdh_doc_no suphdh_doc_no,
"
"                                 suphdh_doc_date suphdh_doc_date,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                                       THEN
"
"                                          1--sdtch_inv_assess
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    taxable_val,
"
"                                 SUM (CASE WHEN tctype_type_id = 'IGST' THEN 1--sdtch_amount
"
"                                 ELSE 0 END)
"
"                                    igst_tax_amt,
"
"                                 SUM (CASE WHEN tctype_type_id = 'CGST' THEN 1--sdtch_amount
"
"                                 ELSE 0 END)
"
"                                    cgst_tax_amt,
"
"                                 SUM (CASE WHEN tctype_type_id = 'SGST' THEN 1--sdtch_amount
"
"                                 ELSE 0 END)
"
"                                    sgst_tax_amt,
"
"                                 SUM (CASE WHEN tctype_type_id = 'GSTC' THEN 1--sdtch_amount
"
"                                 ELSE 0 END)
"
"                                    cess_tax_amt
"
"                            FROM suplr_doc_hd_hist,
"
"                               --  suplr_doc_tax_charges_hist,
"
"                                 tax_charges,
"
"                                 tax_charges_types
"
"                           WHERE  /*  sdtch_bu(+) = suphdh_bu
"
"                                 AND sdtch_pfx(+) = suphdh_pfx
"
"                                 AND sdtch_doc_no(+) = suphdh_doc_no
"
"                                 AND tc_bu(+) = sdtch_bu
"
"                                 AND tc_tc_id(+) = sdtch_tc_id
"
"                                 AND*/ tctype_bu(+) = tc_bu
"
"                                 AND tctype_id(+) = tc_type_id
"
"                                 AND suphdh_grn_refer = 'N'
"
"                                 AND suphdh_status = 'P'
"
"                               --  AND sdtch_pay_to_supplier = 'Y'
"
"                                 AND suphdh_currency <>func_find_base_currency(p_bu)
"
"                                 AND suphdh_bu = p_bu
"
"                                 AND suphdh_doc_year = p_year
"
"                                 AND tctype_type_id IN ('IGST',
"
"                                                        'CGST',
"
"                                                        'SGST',
"
"                                                        'GSTC')
"
"                                 AND suphdh_gst_class = 'M'
"
"                                /* AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no
"
"                                                AND g2p_plant = suphdh_plant)*/
"
"                        GROUP BY suphdh_pfx,
"
"                                 suphdh_doc_no,
"
"                                 suphdh_doc_date
"
"                         UNION ALL
"
"                          SELECT suphd_pfx,
"
"                                 suphd_doc_no,
"
"                                 suphd_doc_date,
"
"                                 SUM (
"
"                                    CASE
"
"                                       WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                                       THEN
"
"                                          1--sdlitc_assess_val
"
"                                       ELSE
"
"                                          0
"
"                                    END)
"
"                                    taxable_val,
"
"                                 SUM (CASE WHEN tctype_type_id = 'IGST' THEN 1--sdlitc_tax_amt
"
"                                 ELSE 0 END)
"
"                                    igst_tax_amt,
"
"                                 SUM (CASE WHEN tctype_type_id = 'CGST' THEN 1--sdlitc_tax_amt
"
"                                  ELSE 0 END)
"
"                                    cgst_tax_amt,
"
"                                 SUM (CASE WHEN tctype_type_id = 'SGST' THEN 1-- sdlitc_tax_amt
"
"                                 ELSE 0 END)
"
"                                    sgst_tax_amt,
"
"                                 SUM (CASE WHEN tctype_type_id = 'GSTC' THEN 1--sdlitc_tax_amt
"
"                                 ELSE 0 END)
"
"                                    cess_tax_amt
"
"                            FROM suplr_doc_hd_hist_vw1,
"
"                                 suplr_doc_ln_hist_vw1,
"
"                                 --suplr_doc_ln_inv_tc_hist_vw1,
"
"                                 tax_charges,
"
"                                 tax_charges_types
"
"                           WHERE     suphd_bu = supln_bu
"
"                                 --AND suphd_pfx = supln_pfx
"
"                                 AND suphd_doc_no = supln_doc_no
"
"                               /*  AND sdlitc_bu(+) = supln_bu
"
"                                 AND sdlitc_doc_pfx(+) = supln_pfx
"
"                                 AND sdlitc_doc_no(+) = supln_doc_no
"
"                                 AND sdlitc_seq_no(+) = supln_seq_no
"
"                                 AND tc_bu(+) = sdlitc_bu
"
"                                 AND tc_tc_id(+) = sdlitc_tc_id*/
"
"                                 AND tctype_bu(+) = tc_bu
"
"                                 AND tctype_id(+) = tc_type_id
"
"                                 AND suphd_currency <>func_find_base_currency(p_bu)
"
"                                 AND suphd_status = 'P'
"
"                                -- AND sdlitc_pay_suplr = 'Y'
"
"                                 AND suphd_bu = p_bu
"
"                                 AND suphd_doc_year = p_year
"
"                                 AND tctype_type_id IN ('IGST',
"
"                                                        'CGST',
"
"                                                        'SGST',
"
"                                                        'GSTC')
"
"                                 AND suphd_gst_class = 'M'
"
"                                /* AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no
"
"                                                AND g2p_plant = suphd_plant)*/
"
"                        GROUP BY suphd_pfx,
"
"                                 suphd_doc_no,
"
"                                 suphd_doc_date
"
"                        UNION ALL
"
"                        SELECT btrans_ord_pfx suphdh_pfx,
"
"                               btrans_ord_no suphdh_doc_no,
"
"                               btrans_trans_date suphdh_doc_date,
"
"                               SUM(CASE WHEN tctype_type_id IN ('IGST') THEN 1--bttc_tc_assbl_val
"
"                                ELSE 0 END)  taxable_val,
"
"                               1--SUM (bttc_tax_amt)
"
"                               igst_tax_amt,
"
"                               0 cgst_tax_amt,
"
"                               0 sgst_tax_amt,
"
"                               0 cess_tax_amt
"
"                          FROM bank_trans_hist_vw,
"
"                               --bank_trans_tax_charges,
"
"                               tax_charges,
"
"                               tax_charges_types
"
"                         WHERE  /*  btrans_bu = bttc_bu
"
"                               AND btrans_ord_pfx = bttc_ord_pfx
"
"                               AND btrans_ord_no = bttc_ord_no
"
"                               AND tc_bu = bttc_bu
"
"                               AND tc_tc_id = bttc_tc_id
"
"                               AND*/ tctype_bu = tc_bu
"
"                               AND tctype_id = tc_type_id
"
"                               AND tctype_type_id IN ('IGST')
"
"                               AND btrans_status NOT IN ('N',
"
"                                                         'X',
"
"                                                         'V',
"
"                                                         'O',
"
"                                                         'D')
"
"                                AND btrans_bu = p_bu
"
"                               AND btrans_trans_year= p_year
"
"                              /* AND EXISTS
"
"                                      (SELECT 1
"
"                                         FROM gstr2_plant
"
"                                        WHERE     g2p_bu = p_bu
"
"                                              AND g2p_sel_flag = 'Y'
"
"                                              AND g2p_doc_no = p_doc_no
"
"                                              AND g2p_plant = btrans_plant)*/
"
"                        GROUP BY    btrans_ord_pfx,
"
"                                    btrans_ord_no,
"
"                                    btrans_trans_date
"
"                        UNION ALL
"
"                        SELECT btrans_ord_pfx suphdh_pfx,
"
"                               btrans_ord_no suphdh_doc_no,
"
"                               btrans_trans_date suphdh_doc_date,
"
"                               SUM(CASE WHEN tctype_type_id IN ('CGST') THEN 1--bttc_tc_assbl_val
"
"                               ELSE 0 END)
"
"                                  taxable_val,
"
"                               0 igst_tax_amt,
"
"                               1--SUM(bttc_tax_amt)
"
"                               Cgst_tax_amt,
"
"                               0 sgst_tax_amt,
"
"                               0 cess_tax_amt
"
"                          FROM bank_trans_hist_vw,
"
"                              -- bank_trans_tax_charges,
"
"                               tax_charges,
"
"                               tax_charges_types
"
"                         WHERE /*    btrans_bu = bttc_bu
"
"                               AND btrans_ord_pfx = bttc_ord_pfx
"
"                               AND btrans_ord_no = bttc_ord_no
"
"                               AND tc_bu = bttc_bu
"
"                               AND tc_tc_id = bttc_tc_id
"
"                               AND*/ tctype_bu = tc_bu
"
"                               AND tctype_id = tc_type_id
"
"                               AND tctype_type_id IN ('CGST')
"
"                               AND btrans_status NOT IN ('N',
"
"                                                         'X',
"
"                                                         'V',
"
"                                                         'O',
"
"                                                         'D')
"
"                              /*AND bttc_lc_import_flag = 'Y'
"
"                               AND bttc_tax_pct > 0*/
"
"                               AND btrans_bu = p_bu
"
"                               AND btrans_trans_year= p_year
"
"                              /* AND EXISTS
"
"                                      (SELECT 1
"
"                                         FROM gstr2_plant
"
"                                        WHERE     g2p_bu = p_bu
"
"                                              AND g2p_sel_flag = 'Y'
"
"                                              AND g2p_doc_no = p_doc_no
"
"                                              AND g2p_plant = btrans_plant)*/
"
"                        GROUP BY btrans_ord_pfx,
"
"                                    btrans_ord_no,
"
"                                    btrans_trans_date
"
"                        UNION ALL
"
"                        SELECT btrans_ord_pfx suphdh_pfx,
"
"                               btrans_ord_no suphdh_doc_no,
"
"                               btrans_trans_date suphdh_doc_date,
"
"                               0 taxable_val,
"
"                               0 igst_tax_amt,
"
"                               0 cgst_tax_amt,
"
"                               1--SUM(bttc_tax_amt)
"
"                               sgst_tax_amt,
"
"                               0 cess_tax_amt
"
"                          FROM bank_trans_hist_vw,
"
"                              -- bank_trans_tax_charges,
"
"                               tax_charges,
"
"                               tax_charges_types
"
"                         WHERE   /*  btrans_bu = bttc_bu
"
"                               AND btrans_ord_pfx = bttc_ord_pfx
"
"                               AND btrans_ord_no = bttc_ord_no
"
"                               AND tc_bu = bttc_bu
"
"                               AND tc_tc_id = bttc_tc_id
"
"                               AND*/ tctype_bu = tc_bu
"
"                               AND tctype_id = tc_type_id
"
"                               AND tctype_type_id IN ('SGST')
"
"                               AND btrans_status NOT IN ('N',
"
"                                                         'X',
"
"                                                         'V',
"
"                                                         'O',
"
"                                                         'D')
"
"                               /*AND bttc_lc_import_flag = 'Y'
"
"                               AND bttc_tax_pct > 0*/
"
"                               AND btrans_bu = p_bu
"
"                               AND btrans_trans_year= p_year
"
"                              /* AND EXISTS
"
"                                      (SELECT 1
"
"                                         FROM gstr2_plant
"
"                                        WHERE     g2p_bu = p_bu
"
"                                              AND g2p_sel_flag = 'Y'
"
"                                              AND g2p_doc_no = p_doc_no
"
"                                              AND g2p_plant = btrans_plant)*/
"
"                        GROUP BY btrans_ord_pfx,
"
"                                btrans_ord_no,
"
"                                btrans_trans_date
"
"                        UNION ALL
"
"                          SELECT btrans_ord_pfx suphdh_pfx,
"
"                                 btrans_ord_no suphdh_doc_no,
"
"                                 btrans_trans_date suphdh_doc_date,
"
"                                 0 taxable_val,
"
"                                 0 igst_tax_amt,
"
"                                 0 cgst_tax_amt,
"
"                                 0 sgst_tax_amt,
"
"                                 1--SUM(bttc_tax_amt)
"
"                                 cess_tax_amt
"
"                            FROM bank_trans_hist_vw,
"
"                                -- bank_trans_tax_charges,
"
"                                 tax_charges,
"
"                                 tax_charges_types
"
"                           WHERE   /*  btrans_bu = bttc_bu
"
"                                 AND btrans_ord_pfx = bttc_ord_pfx
"
"                                 AND btrans_ord_no = bttc_ord_no
"
"                                 AND tc_bu = bttc_bu
"
"                                 AND tc_tc_id = bttc_tc_id
"
"                                 AND*/ tctype_bu = tc_bu
"
"                                 AND tctype_id = tc_type_id
"
"                                 AND tctype_type_id IN ('GSTC')
"
"                                 AND btrans_status NOT IN ('N',
"
"                                                           'X',
"
"                                                           'V',
"
"                                                           'O',
"
"                                                           'D')
"
"                               /*  AND bttc_lc_import_flag = 'Y'
"
"                                 AND bttc_tax_pct > 0*/
"
"                                 AND btrans_bu = p_bu
"
"                                 AND btrans_trans_year= p_year
"
"                                /* AND EXISTS
"
"                                        (SELECT 1
"
"                                           FROM gstr2_plant
"
"                                          WHERE     g2p_bu = p_bu
"
"                                                AND g2p_sel_flag = 'Y'
"
"                                                AND g2p_doc_no = p_doc_no
"
"                                                AND g2p_plant = btrans_plant)*/
"
"                        GROUP BY btrans_ord_pfx,
"
"                                 btrans_ord_no,
"
"                                 btrans_trans_date
"
"                        UNION ALL
"
"                        SELECT porhh_receipt_pfx suphdh_pfx,
"
"                               porhh_receipt_no suphdh_doc_no,
"
"                               porhh_receipt_date suphdh_doc_date,
"
"                               SUM (
"
"                                  CASE
"
"                                     WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                                     THEN
"
"                                        prlch_assbl_val
"
"                                     ELSE
"
"                                        0
"
"                                  END)
"
"                                  taxable_val,
"
"                               SUM (CASE WHEN tctype_type_id = 'IGST' THEN prlch_tc_amt ELSE 0 END)
"
"                                  igst_tax_amt,
"
"                               SUM (CASE WHEN tctype_type_id = 'CGST' THEN prlch_tc_amt ELSE 0 END)
"
"                                  cgst_tax_amt,
"
"                               SUM (CASE WHEN tctype_type_id = 'SGST' THEN prlch_tc_amt ELSE 0 END)
"
"                                  sgst_tax_amt,
"
"                               SUM (CASE WHEN tctype_type_id = 'GSTC' THEN prlch_tc_amt ELSE 0 END)
"
"                                  cess_tax_amt
"
"                          FROM pur_ord_receipt_hd_hist,
"
"                               pur_rcpt_land_costs_hist,
"
"                               tax_charges,
"
"                               tax_charges_types
"
"                         WHERE     prlch_bu = porhh_bu
"
"                               AND prlch_rcpt_pfx = porhh_receipt_pfx
"
"                               AND prlch_rcpt_no = porhh_receipt_no
"
"                               AND prlch_type = 'L'
"
"                               AND tc_bu(+) = prlch_bu
"
"                               AND tc_tc_id(+) = prlch_tc_id
"
"                               AND tctype_bu(+) = tc_bu
"
"                               AND tctype_id(+) = tc_type_id
"
"                               AND porhh_year= p_year
"
"                               AND tctype_type_id IN ('IGST',
"
"                                                      'CGST',
"
"                                                      'SGST',
"
"                                                      'GSTC')
"
"                               GROUP BY porhh_receipt_pfx,
"
"                                        porhh_receipt_no,
"
"                                        porhh_receipt_date);
"
"
"
"END proc_load_gstr9_6;
"
"   PROCEDURE proc_load_gstr9_16 (p_bu        gstr9_hd.g9h_bu%type,
"
"                                 p_year      gstr9_hd.g9h_year%type,
"
"                                 p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                 p_user      VARCHAR2)
"
"   IS
"
"   BEGIN
"
"   INSERT INTO gstr9_16_dlts_drill (g16dd_bu,
"
"                                    g16dd_doc_no,
"
"                                    g16dd_code_type,
"
"                                    G16DD_TYPE,
"
"                                    g16dd_inv_no,
"
"                                   -- g16dd_inv_pfx,
"
"                                    g16dd_inv_date,
"
"                                    g16dd_tax_amt,
"
"                                    g16dd_cgst_amt,
"
"                                    g16dd_sgst_amt,
"
"                                    g16dd_igst_amt,
"
"                                    g16dd_cess_amt,
"
"                                    g16dd_cre_by,
"
"                                    g16dd_cre_date)
"
"                               SELECT p_bu,
"
"                                      p_doc_no,
"
"                                      'A',
"
"                                      'ITC',
"
"                                      suphdh_doc_no,
"
"                                     -- suphdh_pfx,
"
"                                      suphdh_doc_date,
"
"                                      taxable_val,
"
"                                      cgst_tax_amt,
"
"                                      sgst_tax_amt,
"
"                                      igst_tax_amt,
"
"                                      cess_tax_amt,
"
"                                      p_user,
"
"                                      SYSDATE
"
"     FROM (  SELECT suphdh_bu,
"
"                    suphdh_doc_no,
"
"                    suphdh_doc_date,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_assess_val
"
"                                ELSE
"
"                                    1--sdlitch_assess_val
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_tax_amt
"
"                                ELSE
"
"                                    1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_tax_amt
"
"                                ELSE
"
"                                    1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_tax_amt
"
"                                ELSE
"
"                                    1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_tax_amt
"
"                                ELSE
"
"                                  1-- sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"               FROM suplr_doc_hd_hist,
"
"                    suplr_doc_ln_hist,
"
"                  --  suplr_doc_ln_inv_tc_hist,
"
"                    tax_charges,
"
"                    tax_charges_types
"
"              WHERE     suphdh_bu = suplnh_bu
"
"                    --AND suphdh_pfx = suplnh_pfx
"
"                    AND suphdh_doc_no = suplnh_doc_no
"
"                   /* AND sdlitch_bu(+) = suplnh_bu
"
"                    AND sdlitch_doc_pfx(+) = suplnh_pfx
"
"                    AND sdlitch_doc_no(+) = suplnh_doc_no
"
"                    AND sdlitch_seq_no(+) = suplnh_seq_no
"
"                    AND tc_bu(+) = sdlitch_bu
"
"                    AND tc_tc_id(+) = sdlitch_tc_id*/
"
"                    AND tctype_bu(+) = tc_bu
"
"                    AND tctype_id(+) = tc_type_id
"
"                    AND suphdh_status = 'P'
"
"                    AND suphdh_currency LIKE '%INR%'
"
"                    AND suplnh_tax_exmpt_flag = 'C'
"
"                    AND suphdh_gst_class IN ('I', 'L')
"
"                    AND suphdh_bu = p_bu
"
"                    AND suphdh_doc_year = p_year
"
"                  --  AND (sdlitch_tax_pct = 0 OR sdlitch_tax_pct IS NULL)
"
"                  --  AND sdlitch_pay_suplr = 'Y'
"
"                    AND suphdh_grn_refer NOT IN ('PR')
"
"                    /*AND EXISTS
"
"                           (SELECT 1
"
"                              FROM gstr2_plant
"
"                             WHERE     g2p_bu = p_bu
"
"                                   AND g2p_sel_flag = 'Y'
"
"                                   AND g2p_doc_no = p_doc_no
"
"                                   AND g2p_plant = suphdh_plant)*/
"
"           GROUP BY suphdh_bu,
"
"                    --suphdh_pfx,
"
"                    suphdh_doc_no,
"
"                    suphdh_doc_date
"
"           UNION ALL
"
"             SELECT suphdh_bu suphdh_bu,
"
"                     suphdh_doc_no suphdh_doc_no,
"
"                    suphdh_doc_date suphdh_doc_date,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_assess_val
"
"                                ELSE
"
"                                    1--sdlitch_assess_val
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_tax_amt
"
"                                ELSE
"
"                                    1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_tax_amt
"
"                                ELSE
"
"                                    1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 *  1--sdlitch_tax_amt
"
"                                ELSE
"
"                                   1-- sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdlitch_tax_amt
"
"                                ELSE
"
"                                   1-- sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"               FROM suplr_doc_hd_hist,
"
"                    suplr_doc_ln_hist,
"
"                    --suplr_doc_ln_inv_tc_hist,
"
"                    --suplr_doc_tax_charges_hist,
"
"                    tax_charges,
"
"                    tax_charges_types
"
"              WHERE     suphdh_bu = suplnh_bu
"
"                    --AND suphdh_pfx = suplnh_pfx
"
"                    AND suphdh_doc_no = suplnh_doc_no
"
"                 /*   AND sdlitch_bu(+) = suplnh_bu
"
"                    AND sdlitch_doc_pfx(+) = suplnh_pfx
"
"                    AND sdlitch_doc_no(+) = suplnh_doc_no
"
"                    AND sdlitch_seq_no(+) = suplnh_seq_no
"
"                    AND suphdh_bu = sdtch_bu(+)
"
"                    AND suphdh_pfx = sdtch_pfx(+)
"
"                    AND suphdh_doc_no = sdtch_doc_no(+)
"
"                    AND tc_bu(+) = sdlitch_bu
"
"                    AND tc_tc_id(+) = sdlitch_tc_id*/
"
"                    AND tctype_bu(+) = tc_bu
"
"                    AND tctype_id(+) = tc_type_id
"
"                    AND suphdh_status = 'P'
"
"                    AND suphdh_gst_class IN ('I', 'L')
"
"                    AND suphdh_currency LIKE '%INR%'
"
"                    AND suphdh_doc_type = 'I'
"
"                 --   AND suphdh_doc_mode = 'R'
"
"                   -- AND (sdtch_tc_pct IS NULL OR sdtch_tc_pct = 0)
"
"                    AND suphdh_bu = p_bu
"
"                    AND suphdh_doc_year = p_year
"
"                   -- AND sdlitch_tax_pct = 0
"
"                    AND suplnh_tax_exmpt_flag = 'C'
"
"                   -- AND sdlitch_pay_suplr = 'Y'
"
"                    AND suphdh_grn_refer NOT IN ('PR')
"
"                    /*AND EXISTS
"
"                           (SELECT 1
"
"                              FROM gstr2_plant
"
"                             WHERE     g2p_bu = p_bu
"
"                                   AND g2p_sel_flag = 'Y'
"
"                                   AND g2p_doc_no = p_doc_no
"
"                                   AND g2p_plant = suphdh_plant)*/
"
"           GROUP BY suphdh_bu,
"
"                    --suphdh_pfx,
"
"                    suphdh_doc_no,
"
"                    suphdh_doc_date
"
"           UNION ALL
"
"             SELECT suphdh_bu suphdh_bu,
"
"                   suphdh_doc_no suphdh_doc_no,
"
"                    suphdh_doc_date suphdh_doc_date,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdlitch_assess_val
"
"                                ELSE
"
"                                   1--sdlitch_assess_val
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdlitch_tax_amt
"
"                                ELSE
"
"                                   1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdlitch_tax_amt
"
"                                ELSE
"
"                                   1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdlitch_tax_amt
"
"                                ELSE
"
"                                   1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdlitch_tax_amt
"
"                                ELSE
"
"                                   1--sdlitch_tax_amt
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"               FROM suplr_doc_hd_hist,
"
"                    suplr_doc_ln_hist,
"
"                    --suplr_doc_ln_inv_tc_hist,
"
"                    --suplr_doc_tax_charges_hist,
"
"                    tax_charges,
"
"                    tax_charges_types
"
"              WHERE     suphdh_bu = suplnh_bu
"
"                    AND suphdh_doc_no = suplnh_doc_no
"
"                   /* AND sdlitch_bu(+) = suplnh_bu
"
"                    AND sdlitch_doc_pfx(+) = suplnh_pfx
"
"                    AND sdlitch_doc_no(+) = suplnh_doc_no
"
"                    AND sdlitch_seq_no(+) = suplnh_seq_no
"
"                    AND suphdh_bu = sdtch_bu(+)
"
"                    AND suphdh_pfx = sdtch_pfx(+)
"
"                    AND suphdh_doc_no = sdtch_doc_no(+)
"
"                    AND tc_bu(+) = sdlitch_bu
"
"                    AND tc_tc_id(+) = sdlitch_tc_id*/
"
"                    AND tctype_bu(+) = tc_bu
"
"                    AND tctype_id(+) = tc_type_id
"
"                    AND suphdh_status = 'P'
"
"                    AND suphdh_gst_class IN ('I', 'L')
"
"                    AND suphdh_currency LIKE '%INR%'
"
"                    AND suphdh_doc_type = 'DM'
"
"                  --  AND suphdh_doc_mode = 'I'
"
"                   -- AND (sdtch_tc_pct IS NULL OR sdtch_tc_pct = 0)
"
"                    AND suphdh_bu = p_bu
"
"                    --AND sddlh_gst_type = 'C'
"
"                    AND suphdh_doc_year = p_year
"
"                   -- AND sdlitch_tax_pct = 0
"
"                   -- AND sdlitch_pay_suplr = 'Y'
"
"                    AND suphdh_grn_refer IN ('PQD', 'PR')
"
"                   /* AND EXISTS
"
"                           (SELECT 1
"
"                              FROM gstr2_plant
"
"                             WHERE     g2p_bu = p_bu
"
"                                   AND g2p_sel_flag = 'Y'
"
"                                   AND g2p_doc_no = p_doc_no
"
"                                   AND g2p_plant = suphdh_plant)*/
"
"           GROUP BY suphdh_bu,
"
"                     suphdh_doc_no,
"
"                    suphdh_doc_date
"
"           UNION ALL
"
"             SELECT suphdh_bu suphdh_bu,
"
"                    suphdh_doc_no suphdh_doc_no,
"
"                    suphdh_doc_date suphdh_doc_date,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_inv_assess
"
"                                ELSE
"
"                                   1--sdtch_inv_assess
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                  1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"               FROM suplr_doc_hd_hist,
"
"                    --suplr_doc_dist_ln_hist,
"
"                    --suplr_doc_tax_charges_hist,
"
"                    bus_unit_plants,
"
"                    suplr_ship_loc,
"
"                    tax_charges,
"
"                    tax_charges_types
"
"              WHERE   /*  suphdh_bu = sddlh_bu(+)
"
"                    AND suphdh_pfx = sddlh_pfx(+)
"
"                    AND suphdh_doc_no = sddlh_doc_no(+)
"
"                    AND suphdh_bu = sdtch_bu(+)
"
"                    AND suphdh_pfx = sdtch_pfx(+)
"
"                    AND suphdh_doc_no = sdtch_doc_no(+)
"
"                    AND*/ bup_bu = suphdh_bu
"
"                    AND bup_plant_id = suphdh_plant
"
"                    --AND tc_bu(+) = sdtch_bu
"
"                    --AND tc_tc_id(+) = sdtch_tc_id
"
"                    AND tctype_bu(+) = tc_bu
"
"                    AND tctype_id(+) = tc_type_id
"
"                    AND ssl_bu = suphdh_bu
"
"                    AND ssl_suplr_id = suphdh_suplr_id
"
"                  --  AND ssl_loc_id = suphdh_bill_loc_id
"
"                    AND suphdh_status = 'P'
"
"                    AND suphdh_currency LIKE '%INR%'
"
"                    AND suphdh_gst_class IN ('I', 'L')
"
"                    AND suphdh_doc_type = 'I'
"
"                 --   AND suphdh_doc_mode = 'R'
"
"                    --AND sddlh_gst_type = 'C'
"
"                    --AND sddlh_dr_cr = 'DR'
"
"                   -- AND (sddlh_lgr_type IS NULL OR sddlh_lgr_type = 'N')
"
"                   --AND (sdtch_tc_pct IS NULL OR sdtch_tc_pct = 0)
"
"                    AND suphdh_bu = p_bu
"
"                    AND suphdh_grn_refer IN ('N')
"
"                  -- AND sddlh_contra_flag = 'N'
"
"                    AND suphdh_doc_year = p_year
"
"                   /* AND EXISTS
"
"                           (SELECT 1
"
"                              FROM gstr2_plant
"
"                             WHERE     g2p_bu = p_bu
"
"                                   AND g2p_sel_flag = 'Y'
"
"                                   AND g2p_doc_no = p_doc_no
"
"                                   AND g2p_plant = suphdh_plant)*/
"
"           GROUP BY suphdh_bu, suphdh_doc_no,suphdh_doc_date
"
"           UNION ALL
"
"             SELECT suphdh_bu suphdh_bu,
"
"                    suphdh_doc_no suphdh_doc_no,
"
"                    suphdh_doc_date suphdh_doc_date,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_inv_assess
"
"                                ELSE
"
"                                   1--sdtch_inv_assess
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"               FROM suplr_doc_hd_hist,
"
"                    --suplr_doc_dist_ln_hist,
"
"                    --suplr_doc_tax_charges_hist,
"
"                    bus_unit_plants,
"
"                    suplr_ship_loc,
"
"                    tax_charges,
"
"                    tax_charges_types
"
"              WHERE   /*  suphdh_bu = sddlh_bu(+)
"
"                    AND suphdh_pfx = sddlh_pfx(+)
"
"                    AND suphdh_doc_no = sddlh_doc_no(+)
"
"                    AND suphdh_bu = sdtch_bu(+)
"
"                    AND suphdh_pfx = sdtch_pfx(+)
"
"                    AND suphdh_doc_no = sdtch_doc_no(+)
"
"                    AND*/ bup_bu = suphdh_bu
"
"                    AND bup_plant_id = suphdh_plant
"
"                    AND ssl_bu = suphdh_bu
"
"                    AND ssl_suplr_id = suphdh_suplr_id
"
"                   -- AND ssl_loc_id = suphdh_bill_loc_id
"
"                   -- AND tc_bu(+) = sdtch_bu
"
"                    --AND tc_tc_id(+) = sdtch_tc_id
"
"                    AND tctype_bu(+) = tc_bu
"
"                    AND tctype_id(+) = tc_type_id
"
"                    AND suphdh_status = 'P'
"
"                    AND suphdh_currency LIKE '%INR%'
"
"                    AND suphdh_gst_class IN ('I', 'L')
"
"                    AND suphdh_doc_type = 'CM'
"
"                 --   AND suphdh_doc_mode = 'I'
"
"                    --AND sddlh_gst_type = 'C'
"
"                    AND suphdh_src_doc_pfx IS NULL
"
"                    AND suphdh_src_doc_no IS NULL
"
"                  --  AND (sdtch_tc_pct IS NULL OR sdtch_tc_pct = 0)
"
"                    AND suphdh_bu = p_bu
"
"                    AND suphdh_grn_refer IN ('N')
"
"                  --  AND sddlh_contra_flag = 'N'
"
"                    AND suphdh_doc_year = p_year
"
"                   /* AND EXISTS
"
"                           (SELECT 1
"
"                              FROM gstr2_plant
"
"                             WHERE     g2p_bu = p_bu
"
"                                   AND g2p_sel_flag = 'Y'
"
"                                   AND g2p_doc_no = p_doc_no
"
"                                   AND g2p_plant = suphdh_plant)*/
"
"           GROUP BY suphdh_bu, suphdh_doc_no,suphdh_doc_date
"
"           UNION ALL
"
"             SELECT suphdh_bu suphdh_bu,
"
"                    suphdh_doc_no suphdh_doc_no,
"
"                    suphdh_doc_date suphdh_doc_date,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_inv_assess
"
"                                ELSE
"
"                                   1--sdtch_inv_assess
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"               FROM suplr_doc_hd_hist,
"
"                    suplr_doc_ln_hist,
"
"                    --suplr_doc_tax_charges_hist,
"
"                    bus_unit_plants,
"
"                    suplr_ship_loc,
"
"                    tax_charges,
"
"                    tax_charges_types
"
"              WHERE     suphdh_bu = suplnh_bu(+)
"
"                    AND suphdh_doc_no = suplnh_doc_no(+)
"
"                   /* AND suphdh_bu = sdtch_bu(+)
"
"                    AND suphdh_pfx = sdtch_pfx(+)
"
"                    AND suphdh_doc_no = sdtch_doc_no(+)*/
"
"                    AND bup_bu = suphdh_bu
"
"                    AND bup_plant_id = suphdh_plant
"
"                    AND ssl_bu = suphdh_bu
"
"                    AND ssl_suplr_id = suphdh_suplr_id
"
"                   -- AND ssl_loc_id = suphdh_bill_loc_id
"
"                   /* AND tc_bu(+) = sdtch_bu
"
"                    AND tc_tc_id(+) = sdtch_tc_id*/
"
"                    AND tctype_bu(+) = tc_bu
"
"                    AND tctype_id(+) = tc_type_id
"
"                   /* AND NOT EXISTS
"
"                               (SELECT 1
"
"                                  FROM suplr_doc_ln_inv_tc_hist
"
"                                 WHERE     sdlitch_bu = suplnh_bu
"
"                                       AND sdlitch_doc_pfx = suplnh_pfx
"
"                                       AND sdlitch_doc_no = suplnh_doc_no
"
"                                       AND sdlitch_seq_no = suplnh_seq_no)*/
"
"                    AND suphdh_status = 'P'
"
"                    AND suphdh_currency LIKE '%INR%'
"
"                    AND suphdh_gst_class IN ('I', 'L')
"
"                    AND suphdh_doc_type = 'I'
"
"                  --  AND suphdh_doc_mode = 'R'
"
"                    AND suplnh_tax_exmpt_flag = 'C'
"
"                   -- AND (sdtch_tc_pct IS NULL OR sdtch_tc_pct = 0)
"
"                    AND suphdh_bu = p_bu
"
"                    AND suphdh_grn_refer NOT IN ('PR', 'N')
"
"                    AND suphdh_doc_year = p_year
"
"                  /*  AND EXISTS
"
"                           (SELECT 1
"
"                              FROM gstr2_plant
"
"                             WHERE     g2p_bu = p_bu
"
"                                   AND g2p_sel_flag = 'Y'
"
"                                   AND g2p_doc_no = p_doc_no
"
"                                   AND g2p_plant = suphdh_plant)*/
"
"           GROUP BY suphdh_bu, suphdh_doc_no,suphdh_doc_date
"
"           UNION ALL
"
"             SELECT suphdh_bu suphdh_bu,
"
"                    suphdh_doc_no suphdh_doc_no,
"
"                    suphdh_doc_date suphdh_doc_date,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_inv_assess
"
"                                ELSE
"
"                                   1--sdtch_inv_assess
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"               FROM suplr_doc_hd_hist,
"
"                    suplr_doc_ln_hist,
"
"                   --suplr_doc_tax_charges_hist,
"
"                    bus_unit_plants,
"
"                    suplr_ship_loc,
"
"                    tax_charges,
"
"                    tax_charges_types
"
"              WHERE     suphdh_bu = suplnh_bu(+)
"
"                    AND suphdh_doc_no = suplnh_doc_no(+)
"
"                 /*   AND suphdh_bu = sdtch_bu(+)
"
"                    AND suphdh_pfx = sdtch_pfx(+)
"
"                    AND suphdh_doc_no = sdtch_doc_no(+)*/
"
"                    AND bup_bu = suphdh_bu
"
"                    AND bup_plant_id = suphdh_plant
"
"                    AND ssl_bu = suphdh_bu
"
"                    AND ssl_suplr_id = suphdh_suplr_id
"
"                   -- AND ssl_loc_id = suphdh_bill_loc_id
"
"                    --AND tc_bu(+) = sdtch_bu
"
"                    --AND tc_tc_id(+) = sdtch_tc_id
"
"                    AND tctype_bu(+) = tc_bu
"
"                    AND tctype_id(+) = tc_type_id
"
"                   /* AND NOT EXISTS
"
"                               (SELECT 1
"
"                                  FROM suplr_doc_ln_inv_tc_hist
"
"                                 WHERE     sdlitch_bu = suplnh_bu
"
"                                       AND sdlitch_doc_pfx = suplnh_pfx
"
"                                       AND sdlitch_doc_no = suplnh_doc_no
"
"                                       AND sdlitch_seq_no = suplnh_seq_no)*/
"
"                    AND suphdh_status = 'P'
"
"                    AND suphdh_currency LIKE '%INR%'
"
"                    AND suphdh_gst_class IN ('I', 'L')
"
"                    AND suphdh_doc_type = 'DM'
"
"                 --   AND suphdh_doc_mode = 'I'
"
"                    AND suplnh_tax_exmpt_flag = 'C'
"
"                    --AND (sdtch_tc_pct IS NULL OR sdtch_tc_pct = 0)
"
"                    AND suphdh_bu = p_bu
"
"                    AND suphdh_grn_refer IN ('PQD')
"
"                    AND suphdh_doc_year = p_year
"
"                 /*   AND EXISTS
"
"                           (SELECT 1
"
"                              FROM gstr2_plant
"
"                             WHERE     g2p_bu = p_bu
"
"                                   AND g2p_sel_flag = 'Y'
"
"                                   AND g2p_doc_no = p_doc_no
"
"                                   AND g2p_plant = suphdh_plant)*/
"
"           GROUP BY suphdh_bu,  suphdh_doc_no,suphdh_doc_date
"
"           UNION ALL
"
"           SELECT suphdh_bu suphdh_bu,
"
"                  suphdh_doc_no suphdh_doc_no,
"
"                  suphdh_doc_date suphdh_doc_date,
"
"                  SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id IN ('IGST', 'CGST', 'GSTC')
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_inv_assess
"
"                                ELSE
"
"                                   1--sdtch_inv_assess
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       taxable_val,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'IGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       igst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'CGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'SGST'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       sgst_tax_amt,
"
"                    SUM (
"
"                       CASE
"
"                          WHEN tctype_type_id = 'GSTC'
"
"                          THEN
"
"                             CASE
"
"                                WHEN suphdh_doc_type = 'DM'
"
"                                THEN
"
"                                   -1 * 1--sdtch_amount
"
"                                ELSE
"
"                                   1--sdtch_amount
"
"                             END
"
"                          ELSE
"
"                             0
"
"                       END)
"
"                       cess_tax_amt
"
"             FROM suplr_doc_hd_hist,
"
"                  suplr_doc_ln_hist,
"
"                  --suplr_doc_tax_charges_hist,
"
"                  bus_unit_plants,
"
"                  suplr_ship_loc,
"
"                  tax_charges,
"
"                  tax_charges_types
"
"            WHERE     suphdh_bu = suplnh_bu(+)
"
"                 AND suphdh_doc_no = suplnh_doc_no(+)
"
"                 /* AND suphdh_bu = sdtch_bu(+)
"
"                  AND suphdh_pfx = sdtch_pfx(+)
"
"                  AND suphdh_doc_no = sdtch_doc_no(+)*/
"
"                  AND bup_bu = suphdh_bu
"
"                  AND bup_plant_id = suphdh_plant
"
"                  AND ssl_bu = suphdh_bu
"
"                  AND ssl_suplr_id = suphdh_suplr_id
"
"                 -- AND ssl_loc_id = suphdh_bill_loc_id
"
"                 -- AND tc_bu(+) = sdtch_bu
"
"                 -- AND tc_tc_id(+) = sdtch_tc_id
"
"                  AND tctype_bu(+) = tc_bu
"
"                  AND tctype_id(+) = tc_type_id
"
"                /*  AND NOT EXISTS
"
"                             (SELECT 1
"
"                                FROM suplr_doc_ln_inv_tc_hist
"
"                               WHERE     sdlitch_bu = suplnh_bu
"
"                                     AND sdlitch_doc_pfx = suplnh_pfx
"
"                                     AND sdlitch_doc_no = suplnh_doc_no
"
"                                     AND sdlitch_seq_no = suplnh_seq_no)*/
"
"                  AND suphdh_status = 'P'
"
"                  AND suphdh_currency LIKE '%INR%'
"
"                  AND suphdh_gst_class IN ('I', 'L')
"
"                  AND suphdh_doc_type = 'CM'
"
"               --   AND suphdh_doc_mode = 'I'
"
"                  AND suplnh_tax_exmpt_flag = 'C'
"
"               --   AND (sdtch_tc_pct IS NULL OR sdtch_tc_pct = 0)
"
"                  AND suphdh_bu = p_bu
"
"                  AND suphdh_grn_refer IN ('PQD')
"
"                  AND suphdh_doc_year = p_year
"
"                /*  AND EXISTS
"
"                         (SELECT 1
"
"                            FROM gstr2_plant
"
"                           WHERE     g2p_bu = p_bu
"
"                                 AND g2p_sel_flag = 'Y'
"
"                                 AND g2p_doc_no = p_doc_no
"
"                                 AND g2p_plant = suphdh_plant)*/
"
"                  GROUP BY suphdh_bu, suphdh_doc_no,suphdh_doc_date);
"
"   END proc_load_gstr9_16;
"
" /*
"
"   PROCEDURE proc_load_gstr9_17 (p_bu        gstr9_hd.g9h_bu%type,
"
"                                 p_year      gstr9_hd.g9h_year%type,
"
"                                 p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                 p_user      VARCHAR2)
"
"   IS
"
"   BEGIN
"
"   /* TYPE B - Inward supplies (other than imports and inward supplies liable to reverse charge but includes services received from SEZs)*/
"
"/*
"
"   INSERT INTO gstr9_17_dtls_drill (g7dd_bu,
"
"                                    g7dd_doc_no,
"
"                                    g7dd_inv_no,
"
"                                    g7dd_inv_pfx,
"
"                                    g7dd_inv_date,
"
"                                    g7dd_type,
"
"                                    g7dd_hsn_code,
"
"                                    g7dd_uqc,
"
"                                    g7dd_tot_qty,
"
"                                    g7dd_tax_rate,
"
"                                    g7dd_tax_amt,
"
"                                    g7dd_cgst_amt,
"
"                                    g7dd_sgst_amt,
"
"                                    g7dd_igst_amt,
"
"                                    g7dd_cess_amt,
"
"                                    g7dd_cre_by,
"
"                                    g7dd_cre_date)
"
"                      SELECT p_bu,
"
"                             p_doc_no,
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_exc_inv_date,
"
"                             'A',
"
"                             siln_hsn_code,
"
"                             NULL,
"
"                             siln_inv_qty,
"
"                             0,
"
"                             SILN_ASSBL_VAL,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_igst_amt,
"
"                             0,
"
"                             p_user,
"
"                             SYSDATE
"
"                        FROM (
"
"                        SELECT sihd_bu,
"
"                             sihd_doc_no,
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             trunc(sihd_exc_inv_date) sihd_exc_inv_date,
"
"                             siln_hsn_code,
"
"                             SUM(siln_inv_qty) siln_inv_qty,
"
"                             SUM(SILN_ASSBL_VAL) SILN_ASSBL_VAL,
"
"                             1--SUM (siltc_tc_pct)
"
"                             siltc_tc_pct,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt
"
"                        FROM sales_invoices_ln,
"
"                           --  sales_inv_line_tax_charges,
"
"                             tax_charges,
"
"                             tax_charges_types,
"
"                             sales_invoices_hd
"
"                       WHERE     sihd_bu = p_bu
"
"                             AND sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                            /* AND siltc_bu = siln_bu
"
"                             AND siltc_doc_no = siln_doc_no
"
"                             AND siltc_plnt = siln_plnt
"
"                             AND siltc_seq_no = siln_seq_no*/
"
"   /*                          AND sihd_status = 'I'
"
"                             -- AND SILN_CUST_TAX_CHARGE_FLAG = 'Y'
"
"                             AND tctype_bu = tc_bu
"
"                             AND tctype_id = tc_type_id
"
"                           --  AND siltc_bu = tc_bu
"
"                           --  AND siltc_tc_id = tc_tc_id
"
"                             AND sihd_year = p_year
"
"                             AND tctype_type_id LIKE '%GST'
"
"                             AND siln_hsn_code IS NOT NULL
"
"                             AND sihd_type IN ('SO',
"
"                                               'FA',
"
"                                               'SS',
"
"                                               'LO',
"
"                                               'SI',
"
"                                               'SU',
"
"                                               'FE',
"
"                                               'DE',
"
"                                                  ''''
"
"                                               || DECODE (
"
"                                                     (SELECT gh_si_type_st
"
"                                                        FROM gstr1_hd
"
"                                                       WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                     'Y', 'ST',
"
"                                                     NULL)
"
"                                               || '''',
"
"                                                  ''''
"
"                                               || DECODE (
"
"                                                     (SELECT gh_si_type_fs
"
"                                                        FROM gstr1_hd
"
"                                                       WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                     'Y', 'FS',
"
"                                                     NULL)
"
"                                               || '''')
"
"                          /*   AND sihd_plant IN (SELECT gp_plant
"
"                                                  FROM gstr9_plant
"
"                                                 WHERE     gp_bu = p_bu
"
"                                                       AND gp_sel_flag = 'Y'
"
"                                                       AND gp_doc_no = p_doc_no)*/
"
"   /*                 GROUP BY sihd_bu,
"
"                             sihd_doc_no,
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_exc_inv_date,
"
"                             siln_hsn_code
"
"                    UNION ALL
"
"                      SELECT sihd_bu,
"
"                             sihd_doc_no,
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             trunc(sihd_exc_inv_date) sihd_exc_inv_date,
"
"                             siln_hsn_code,
"
"                             SUM(-1 * siln_inv_qty) siln_inv_qty,
"
"                             SUM(-1 * SILN_ASSBL_VAL) SILN_ASSBL_VAL,
"
"                            1-- SUM (siltc_tc_pct)
"
"                            siltc_tc_pct,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      -1 * (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      -1 * (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      -1 * (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      -1 * (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt
"
"                        FROM sales_invoices_ln,
"
"                             --sales_inv_line_tax_charges,
"
"                             tax_charges,
"
"                             tax_charges_types,
"
"                             sales_invoices_hd
"
"                       WHERE     sihd_bu = p_bu
"
"                             AND sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                           /*  AND siltc_bu = siln_bu
"
"                             AND siltc_doc_no = siln_doc_no
"
"                             AND siltc_plnt = siln_plnt
"
"                             AND siltc_seq_no = siln_seq_no*/
"
"     /*                        AND sihd_status = 'I'
"
"                             -- AND SILN_CUST_TAX_CHARGE_FLAG = 'Y'
"
"                             AND sihd_year = p_year
"
"                             AND tctype_bu = tc_bu
"
"                             AND tctype_id = tc_type_id
"
"                            -- AND siltc_bu = tc_bu
"
"                            -- AND siltc_tc_id = tc_tc_id
"
"                             AND tctype_type_id LIKE '%GST'
"
"                             AND siln_hsn_code IS NOT NULL
"
"                             AND sihd_sal_ret_type <> 'DM'
"
"                             AND sihd_type IN ('DR',
"
"                                               'RL',
"
"                                               'RS',
"
"                                               'SR',
"
"                                               'LR',
"
"                                               'SN',
"
"                                               'RV',
"
"                                               'RY',
"
"                                               'RH',
"
"                                               'RU',
"
"                                               'CR',
"
"                                               'SU')
"
"                           /*  AND sihd_plant IN (SELECT gp_plant
"
"                                                  FROM gstr9_plant
"
"                                                 WHERE     gp_bu = p_bu
"
"                                                       AND gp_sel_flag = 'Y'
"
"                                                       AND gp_doc_no = p_doc_no)*/
"
"     /*               GROUP BY sihd_bu,
"
"                             sihd_doc_no,
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_exc_inv_date,
"
"                             siln_hsn_code
"
"                    UNION ALL
"
"                      SELECT sihd_bu,
"
"                             sihd_doc_no,
"
"                             sihd_inv_no,
"
"                             sihd_inv_pfx,
"
"                             trunc(sihd_exc_inv_date) sihd_exc_inv_date,
"
"                             siln_hsn_code,
"
"                             SUM(siln_inv_qty) siln_inv_qty,
"
"                             SUM(SILN_ASSBL_VAL) SILN_ASSBL_VAL,
"
"                             1--SUM (siltc_tc_pct)
"
"                             siltc_tc_pct,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'CGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_cgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'SGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_sgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'UTGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_utgst_amt,
"
"                             SUM (
"
"                                CASE
"
"                                   WHEN SILN_CUST_TAX_CHARGE_FLAG = 'Y' AND tctype_type_id = 'IGST'
"
"                                   THEN
"
"                                      (SIHD_TAX_AMT)
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                v_igst_amt
"
"                        FROM sales_invoices_ln,
"
"                           --  sales_inv_line_tax_charges,
"
"                             tax_charges,
"
"                             tax_charges_types,
"
"                             sales_invoices_hd
"
"                       WHERE     sihd_bu = p_bu
"
"                             AND sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                          /*   AND siltc_bu = siln_bu
"
"                            AND siltc_doc_no = siln_doc_no
"
"                             AND siltc_plnt = siln_plnt
"
"                             AND siltc_seq_no = siln_seq_no*/
"
"      /*                       AND sihd_status = 'I'
"
"                             -- AND SILN_CUST_TAX_CHARGE_FLAG = 'Y'
"
"                             AND tctype_bu = tc_bu
"
"                             AND tctype_id = tc_type_id
"
"                           /*  AND siltc_bu = tc_bu
"
"                             AND siltc_tc_id = tc_tc_id*/
"
"      /*                       AND tctype_type_id LIKE '%GST'
"
"                             AND siln_hsn_code IS NOT NULL
"
"                             AND sihd_year = p_year
"
"                             AND sihd_sal_ret_type = 'DM'
"
"                             AND sihd_type IN ('DR',
"
"                                               'RL',
"
"                                               'RS',
"
"                                               'SR',
"
"                                               'LR',
"
"                                               'SN',
"
"                                               'RV',
"
"                                               'RY',
"
"                                               'RH',
"
"                                               'RU',
"
"                                               'CR',
"
"                                               'SU')
"
"                          /*   AND sihd_plant IN (SELECT gp_plant
"
"                                                  FROM gstr9_plant
"
"                                                 WHERE     gp_bu = p_bu
"
"                                                       AND gp_sel_flag = 'Y'
"
"                                                       AND gp_doc_no = p_doc_no)*/
"
"      /*              GROUP BY sihd_bu,
"
"                             sihd_doc_no,
"
"                             sihd_inv_pfx,
"
"                             sihd_inv_no,
"
"                             sihd_exc_inv_date,
"
"                             siln_hsn_code
"
"                    UNION ALL
"
"                    SELECT sihd_bu,
"
"                           sihd_doc_no,
"
"                           sihd_inv_no,
"
"                           sihd_inv_pfx,
"
"                           trunc(sihd_exc_inv_date) sihd_exc_inv_date,
"
"                           siln_hsn_code,
"
"                           SUM(siln_inv_qty) siln_inv_qty,
"
"                           0 SILN_ASSBL_VAL,
"
"                           0 siltc_tc_pct,
"
"                           0 v_cgst_amt,
"
"                           0 v_sgst_amt,
"
"                           0 v_utgst_amt,
"
"                           0 v_igst_amt
"
"                      FROM sales_invoices_ln, sales_invoices_hd
"
"                     WHERE     sihd_bu = siln_bu
"
"                           AND sihd_bu = p_bu
"
"                           AND sihd_doc_no = siln_doc_no
"
"                           AND sihd_plant = siln_plnt
"
"                           AND sihd_status = 'I'
"
"                           AND sihd_type IN ('SO',
"
"                                             'FA',
"
"                                             'SS',
"
"                                             'LO',
"
"                                             'SI',
"
"                                             'SU',
"
"                                             'FE',
"
"                                             'DE',
"
"                                                ''''
"
"                                             || DECODE (
"
"                                                   (SELECT gh_si_type_st
"
"                                                      FROM gstr1_hd
"
"                                                     WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                   'Y', 'ST',
"
"                                                   NULL)
"
"                                             || '''',
"
"                                                ''''
"
"                                             || DECODE (
"
"                                                   (SELECT gh_si_type_fs
"
"                                                      FROM gstr1_hd
"
"                                                     WHERE gh_bu = p_bu AND gh_doc_no = p_doc_no),
"
"                                                   'Y', 'FS',
"
"                                                   NULL)
"
"                                             || '''')
"
"                           AND siln_hsn_code IS NOT NULL
"
"                           AND sihd_year = p_year
"
"                         /*  AND NOT EXISTS
"
"                                      (SELECT 1
"
"                                         FROM sales_inv_line_tax_charges
"
"                                        WHERE     siltc_bu = siln_bu
"
"                                              AND siltc_doc_no = siln_doc_no
"
"                                              AND siltc_plnt = siln_plnt
"
"                                              AND siltc_seq_no = siln_seq_no)*/
"
"                          /* AND sihd_plant IN (SELECT gp_plant
"
"                                                FROM gstr9_plant
"
"                                               WHERE     gp_bu = p_bu
"
"                                                     AND gp_sel_flag = 'Y'
"
"                                                     AND gp_doc_no = p_doc_no)*/
"
"          /*                GROUP BY sihd_bu,
"
"                           sihd_doc_no,
"
"                           sihd_inv_pfx,
"
"                           sihd_inv_no,
"
"                           sihd_exc_inv_date,
"
"                           siln_hsn_code);
"
"END proc_load_gstr9_17;
"
"*/
"
"   PROCEDURE proc_load_gstr9_18 (p_bu        gstr9_hd.g9h_bu%type,
"
"                                 p_year      gstr9_hd.g9h_year%type,
"
"                                 p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                 p_user      VARCHAR2)
"
"   IS
"
"   BEGIN
"
"   NULL;
"
"   END proc_load_gstr9_18;
"
"
"
"   PROCEDURE proc_load_gstr9     (p_bu        gstr9_hd.g9h_bu%type,
"
"                                 p_year      gstr9_hd.g9h_year%type,
"
"                                 p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                 p_user      VARCHAR2)
"
"   IS
"
"       BEGIN
"
"
"
"       DELETE FROM gstr9_45_dlts_drill
"
"       WHERE g45dd_bu = p_bu AND g45dd_doc_no = p_doc_no;
"
"
"
"       DELETE FROM gstr9_678_dlts_drill
"
"       WHERE g678dd_bu = p_bu AND g678dd_doc_no = p_doc_no;
"
"
"
"       DELETE FROM gstr9_16_dlts_drill
"
"       WHERE g16dd_bu = p_bu AND g16dd_doc_no = p_doc_no;
"
"
"
"      /* DELETE FROM gstr9_17_dtls_drill
"
"       WHERE g7dd_bu = p_bu AND g7dd_doc_no = p_doc_no;*/
"
"
"
"       proc_load_gstr9_4  (p_bu,
"
"                                     p_year,
"
"                                     p_doc_no,
"
"                                     p_user);
"
"
"
"       proc_load_gstr9_5  (p_bu,
"
"                                     p_year,
"
"                                     p_doc_no,
"
"                                     p_user);
"
"
"
"       proc_load_gstr9_6  (p_bu,
"
"                                     p_year,
"
"                                     p_doc_no,
"
"                                     p_user);
"
"
"
"       proc_load_gstr9_16 (p_bu,
"
"                                     p_year,
"
"                                     p_doc_no,
"
"                                     p_user);
"
"/*
"
"       proc_load_gstr9_17 (p_bu,
"
"                                     p_year,
"
"                                     p_doc_no,
"
"                                     p_user);
"
"*/
"
"       proc_load_gstr9_18 (p_bu,
"
"                                     p_year,
"
"                                     p_doc_no,
"
"                                     p_user);
"
"       COMMIT;
"
"   END proc_load_gstr9;
"
"END;"
/
