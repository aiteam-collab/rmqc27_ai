CREATE OR REPLACE
"PACKAGE BODY pkg_si_reg
"
"AS
"
"   PROCEDURE proc_ins_si_type (p_bu             VARCHAR2,
"
"                               p_doc_no         VARCHAR2,
"
"                               p_from_date      DATE,
"
"                               p_to_date        DATE,
"
"                               p_user           VARCHAR2,
"
"                               p_lang           NUMBER,
"
"                               p_shw_can_doc    VARCHAR2 DEFAULT 'N')
"
"   AS
"
"      CURSOR c_typ
"
"      IS
"
"           SELECT sihd_sub_vou_type
"
"             FROM sales_invoices_hd
"
"            WHERE sihd_bu = p_bu
"
"                  AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                       OR (    p_shw_can_doc = 'Y'
"
"                           AND sihd_status IN ('I', 'C')
"
"                           AND sihd_inv_no IS NOT NULL))
"
"                  AND (TRUNC (sihd_inv_date) >= p_from_date
"
"                       OR p_from_date IS NULL)
"
"                  AND (TRUNC (sihd_inv_date) <= p_to_date OR p_to_date IS NULL)
"
"                  AND NOT EXISTS (SELECT *
"
"                                    FROM sales_reg_parameter
"
"                                   WHERE srp_bu = p_bu AND srp_doc_no = p_doc_no AND srp_vou_type = sihd_sub_vou_type)
"
"         GROUP BY sihd_sub_vou_type;
"
"
"
"      v_seq_no   NUMBER;
"
"      var_cnt    NUMBER;
"
"   BEGIN
"
"      SELECT COUNT (*)
"
"        INTO var_cnt
"
"        FROM sales_reg_parameter
"
"       WHERE srp_bu = p_bu AND srp_doc_no = p_doc_no AND srp_sel_flg = 'N';
"
"
"
"         FOR r_typ IN c_typ
"
"         LOOP
"
"            SELECT NVL (MAX (srp_seq_no), 0) + 1
"
"              INTO v_seq_no
"
"              FROM sales_reg_parameter
"
"             WHERE srp_bu = p_bu AND srp_doc_no = p_doc_no;
"
"
"
"            INSERT INTO sales_reg_parameter (srp_bu,
"
"                                             srp_doc_no,
"
"                                             srp_vou_type,
"
"                                             srp_seq_no,
"
"                                             srp_cre_by,
"
"                                             srp_cre_date,
"
"                                             srp_sel_flg)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         r_typ.sihd_sub_vou_type,
"
"                         v_seq_no,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'Y'); /*
"
"                     LOG ERRORS INTO ERR$_SALES_REG_PARAMETER
"
"                            ('INSERT NO-APPEND')
"
"                            REJECT LIMIT UNLIMITED;*/
"
"         END LOOP c_typ;
"
"   END proc_ins_si_type;
"
"
"
"   PROCEDURE proc_ins_si_plnt (p_bu             VARCHAR2,
"
"                               p_doc_no         VARCHAR2,
"
"                               p_from_date      DATE,
"
"                               p_to_date        DATE,
"
"                               p_user           VARCHAR2,
"
"                               p_lang           NUMBER,
"
"                               p_shw_can_doc    VARCHAR2 DEFAULT 'N')
"
"   AS
"
"      CURSOR c_plnt
"
"      IS
"
"           SELECT sihd_plant, sihd_plnt_loc_id, sihd_plnt_loc_name
"
"             FROM sales_invoices_hd
"
"            WHERE sihd_bu = p_bu
"
"                  AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                       OR (    p_shw_can_doc = 'Y'
"
"                           AND sihd_status IN ('I', 'C')
"
"                           AND sihd_inv_no IS NOT NULL))
"
"                  AND (TRUNC (sihd_inv_date) >= p_from_date
"
"                       OR p_from_date IS NULL)
"
"                  AND (TRUNC (sihd_inv_date) <= p_to_date OR p_to_date IS NULL)
"
"                  AND NOT EXISTS (SELECT *
"
"                                    FROM sales_reg_plant
"
"                                   WHERE srpnt_bu = p_bu AND srpnt_doc_no = p_doc_no
"
"                                     AND srpnt_plant = sihd_plant
"
"                                     AND srpnt_plnt_loc_id = sihd_plnt_loc_id)
"
"         GROUP BY sihd_plant, sihd_plnt_loc_id, sihd_plnt_loc_name;
"
"
"
"      var_cnt   NUMBER;
"
"   BEGIN
"
"      SELECT COUNT (*)
"
"        INTO var_cnt
"
"        FROM sales_reg_plant
"
"       WHERE     srpnt_bu = p_bu
"
"             AND srpnt_doc_no = p_doc_no
"
"             AND srpnt_sel_flg = 'N';
"
"
"
"         FOR r_plnt IN c_plnt
"
"         LOOP
"
"            INSERT INTO sales_reg_plant (srpnt_bu,
"
"                                         srpnt_doc_no,
"
"                                         srpnt_plant,
"
"                                         srpnt_sel_flg,
"
"                                         srpnt_cre_by,
"
"                                         srpnt_cre_date,
"
"                                         srpnt_plnt_loc_id,
"
"                                         srpnt_plnt_loc_name)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         r_plnt.sihd_plant,
"
"                         'Y',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         r_plnt.sihd_plnt_loc_id,
"
"                         r_plnt.sihd_plnt_loc_name);
"
"         END LOOP c_plnt;
"
"   END proc_ins_si_plnt;
"
"
"
"   PROCEDURE proc_gen_si_reg (p_bu             VARCHAR2,
"
"                              p_doc_no         VARCHAR2,
"
"                              p_from_date      DATE,
"
"                              p_to_date        DATE,
"
"                              p_user           VARCHAR2,
"
"                              p_lang           NUMBER,
"
"                              p_shw_can_doc    VARCHAR2 DEFAULT 'N')
"
"   AS
"
"      TYPE typ_sir IS TABLE OF sales_reg_ln%ROWTYPE
"
"                         INDEX BY PLS_INTEGER;
"
"
"
"      r_sir      typ_sir;
"
"
"
"      TYPE typ_sir_ln IS TABLE OF sales_reg_ln_dtls%ROWTYPE
"
"                            INDEX BY PLS_INTEGER;
"
"
"
"      r_sir_ln   typ_sir_ln;
"
"
"
"      TYPE typ_sir_tax IS TABLE OF sales_reg_tax%ROWTYPE
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      r_sirt     typ_sir_tax;
"
"
"
"      TYPE typ_sir_acct IS TABLE OF sales_reg_acct%ROWTYPE
"
"                              INDEX BY PLS_INTEGER;
"
"
"
"      r_sira     typ_sir_acct;
"
"   BEGIN
"
"      /*Delete Sales Temporary Table*/
"
"
"
"      DELETE FROM sales_reg_ln_dtls
"
"            WHERE srld_bu = p_bu AND srld_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_reg_ln
"
"            WHERE srln_bu = p_bu AND srln_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_reg_tax
"
"            WHERE srt_bu = p_bu AND srt_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_reg_acct
"
"            WHERE sra_bu = p_bu AND sra_doc_no = p_doc_no;
"
"
"
"      /*Delete Sales Temporary Table*/
"
"
"
"      /*Start Invoice Wise Sales Details*/
"
"      SELECT sihd_bu,
"
"             p_doc_no,
"
"             sihd_plant,
"
"             sihd_doc_no,
"
"             sihd_ref_plnt,
"
"             sihd_doc_date,
"
"             sihd_type,
"
"             sihd_exc_inv_pfx,
"
"             sihd_exc_inv_no,
"
"             sihd_exc_inv_date,
"
"             sihd_comm_inv_pfx,
"
"             sihd_comm_inv_no,
"
"             sihd_comm_inv_date,
"
"             sihd_inv_pfx,
"
"             sihd_inv_no,
"
"             sihd_inv_date,
"
"             NULL,
"
"             NULL,
"
"             NULL,
"
"             sihd_year,
"
"             sihd_period,
"
"             sihd_partner_type,
"
"             sihd_cust_id,
"
"             sihd_cust_name,
"
"             sihd_currency,
"
"             sihd_exchange_rate,
"
"             sihd_dom_val,
"
"             sihd_imp_val,
"
"             sihd_tax_val,
"
"             sihd_gross_sc_val,
"
"             sihd_gross_bc_val,
"
"             0 sihd_ded_amt,
"
"             sihd_disc_val,
"
"             sihd_tot_amt,
"
"             sihd_promotion_val,
"
"             sihd_rnd_off,
"
"             sihd_cust_dc_no,
"
"             sihd_cust_dc_date,
"
"             sihd_cust_inv_no,
"
"             sihd_cust_inv_date,
"
"             sihd_sales_area,
"
"             sihd_terr_id,
"
"             sihd_sub_terr_id,
"
"             sihd_sales_person,
"
"             sihd_gst_cust_type,
"
"             sihd_gst_reg_type,
"
"             sihd_gst_w_wo_pay_flag,
"
"             sihd_gst_rcm_flag,
"
"             sihd_gst_e_oe_type,
"
"             sisa_billto_state,
"
"             state_code,
"
"             state_name,
"
"             cust_gst_no,
"
"             sihd_status,
"
"             sihd_disc2_val,
"
"             sihd_disc3_val,
"
"             sihd_disc4_val,
"
"             sihd_disc5_val,
"
"             sihd_ref2,
"
"             sihd_rlz_ex_rate,
"
"             sihd_rlz_amt,
"
"             sihd_rlz_date,
"
"             srln_rtn_doc_type,
"
"             srln_cre_by,
"
"             srln_cre_ip_addr,
"
"             srln_cre_os_user,
"
"             srln_cre_date,
"
"             srln_upd_by,
"
"             srln_upd_ip_addr,
"
"             srln_upd_os_user,
"
"             srln_upd_date,
"
"             srln_cre_emp_id,
"
"             srln_upd_emp_id,
"
"             srln_pan_no,
"
"             srln_aadhar_no,
"
"             srln_pan_avail_type,
"
"             srln_tcs_pct,
"
"             srln_tcs_amt,
"
"             srln_tcs_access_val,
"
"             srln_tcs_sec_id,
"
"             sihd_plnt_loc_id,
"
"             sihd_plnt_loc_name,
"
"             NULL,
"
"             NULL,
"
"             sihd_billto_loc_name,
"
"             sihd_shipto_loc_name,
"
"             NULL,
"
"             sihd_billfrm_loc_name,
"
"             NULL,
"
"             sihd_shipfrm_loc_name,
"
"             sihd_einv_arn_no,
"
"             sihd_einv_irn_no,
"
"             sihd_einv_ack_date,
"
"             srln_shipto_addr,
"
"             sisa_shipto_postal_code,
"
"             sisa_shipto_city,
"
"             sisa_shipto_state,
"
"             sisa_shipto_cntry,
"
"             sisa_shipto_gst_no,
"
"             sisa_shipto_state_code,
"
"             srln_billto_addr,
"
"             sisa_billto_postal_code,
"
"             sisa_billto_city,
"
"             sisa_billto_cntry,
"
"             sisa_billto_gst_no,
"
"             sisa_billto_state_code,
"
"             srln_billfrm_addr,
"
"             sisa_billfrm_postal_code,
"
"             sisa_billfrm_city,
"
"             sisa_billfrm_state,
"
"             sisa_billfrm_cntry,
"
"             sisa_billfrm_gst_no,
"
"             sisa_billfrm_state_code,
"
"             srln_shipfrm_addr,
"
"             sisa_shipfrm_postal_code,
"
"             sisa_shipfrm_city,
"
"             sisa_shipfrm_state,
"
"             sisa_shipfrm_cntry,
"
"             sisa_shipfrm_gst_no,
"
"             sisa_shipfrm_state_code,
"
"             sihd_cust_grp_id,
"
"             sihd_rtn_opt,
"
"             sihd_vou_type,
"
"             sihd_sub_vou_type,
"
"             siln_sal_acct_id,
"
"             siln_sal_acct_desc,
"
"             sihd_cust_grn_no,
"
"             sihd_cust_grn_date,
"
"             sihd_cust_asn_no,
"
"             sihd_cust_asn_date ,
"
"                     sihd_docket_no,
"
"                     sihd_pod_date,
"
"                     sihd_prf_of_deliv_date
"
"        BULK COLLECT INTO r_sir
"
"        FROM (  SELECT sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_no,
"
"                       sihd_plant sihd_ref_plnt,
"
"                       sihd_doc_date,
"
"                       sihd_type,
"
"                       sihd_exc_inv_pfx,
"
"                       sihd_exc_inv_no,
"
"                       sihd_exc_inv_date,
"
"                       sihd_comm_inv_pfx,
"
"                       sihd_comm_inv_no,
"
"                       sihd_comm_inv_date,
"
"                       sihd_inv_pfx,
"
"                       sihd_inv_no,
"
"                       sihd_inv_date,
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       sihd_year,
"
"                       sihd_period,
"
"                       func_find_party_type (sihd_bu, sihd_cust_id, p_lang)
"
"                          sihd_partner_type,
"
"                       sihd_cust_id,
"
"                       sihd_cust_name,
"
"                       sihd_currency,
"
"                       sihd_exchange_rate,
"
"                       (CASE
"
"                           WHEN sihd_currency =
"
"                                   func_find_base_currency (sihd_bu)
"
"                           THEN
"
"                              CASE WHEN sihd_vou_type = 'CN' THEN -sihd_net_amt ELSE sihd_net_amt END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                          sihd_dom_val,
"
"                       (CASE
"
"                           WHEN sihd_currency =
"
"                                   func_find_base_currency (sihd_bu)
"
"                           THEN
"
"                              0
"
"                           ELSE
"
"                              CASE WHEN sihd_vou_type = 'CN' THEN -ROUND((sihd_net_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu))
"
"                              ELSE ROUND((sihd_net_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu)) END
"
"                        END)
"
"                          sihd_imp_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -sihd_tax_amt ELSE sihd_tax_amt END sihd_tax_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -(sihd_net_amt + sihd_tax_amt) ELSE (sihd_net_amt + sihd_tax_amt) END sihd_gross_sc_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -(ROUND ( (sihd_net_amt) * sihd_exchange_rate,
"
"                               func_find_appl_rnddigit (sihd_bu))
"
"                        + sihd_tax_amt) ELSE (ROUND ( (sihd_net_amt) * sihd_exchange_rate,
"
"                               func_find_appl_rnddigit (sihd_bu))
"
"                        + sihd_tax_amt) END
"
"                          sihd_gross_bc_val,
"
"                       0 sihd_ded_amt,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -sihd_disc_amt ELSE sihd_disc_amt END sihd_disc_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -ROUND((sihd_tot_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu))
"
"                       ELSE ROUND((sihd_tot_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu)) END sihd_tot_amt,
"
"                       (SELECT SUM (siln_inv_qty * siln_price)
"
"                          FROM sales_invoices_ln bcd
"
"                         WHERE     bcd.siln_bu = sihd_bu
"
"                               AND bcd.siln_plnt = sihd_plant
"
"                               AND bcd.siln_doc_no = sihd_doc_no
"
"                               AND bcd.siln_promotion_flag = 'Y')
"
"                          sihd_promotion_val,
"
"                       sihd_rnd_off sihd_rnd_off,
"
"                       sihd_cust_dc_no,
"
"                       sihd_cust_dc_date,
"
"                       sihd_cust_inv_no,
"
"                       sihd_cust_inv_date,
"
"                       sihd_sales_area,
"
"                       sihd_terr_id,
"
"                       sihd_sub_terr_id,
"
"                       sihd_sales_person,
"
"                       sihd_gst_cust_type,
"
"                       sihd_gst_reg_type,
"
"                       sihd_gst_w_wo_pay_flag,
"
"                       sihd_gst_rcm_flag,
"
"                       sihd_gst_e_oe_type,
"
"                       sisa_billto_state,
"
"                       sisa_billto_state_code state_code,
"
"                       (SELECT state_name1
"
"                          FROM states
"
"                         WHERE state_bu = sihd_bu
"
"                           AND state_id = sisa_billto_state)
"
"                          state_name,
"
"                       sisa_billto_gst_no cust_gst_no,
"
"                       sihd_status,
"
"                       0 sihd_disc2_val,
"
"                       0 sihd_disc3_val,
"
"                       0 sihd_disc4_val,
"
"                       0 sihd_disc5_val,
"
"                       sihd_ref2,
"
"                       NULL/*(SELECT (listagg (ex_rate, '/')
"
"                                   WITHIN GROUP (ORDER BY ex_rate))
"
"                          FROM (  SELECT ex_rate
"
"                                    FROM adj_det_view
"
"                                   WHERE     bu = sihd_bu
"
"                                         AND doc_pfx = sihd_inv_pfx
"
"                                         AND doc_no = sihd_inv_no
"
"                                GROUP BY ex_rate))*/
"
"                          sihd_rlz_ex_rate,
"
"                       /*NVL (
"
"                          (SELECT ROUND (NVL (SUM (ex_rate * offset_amt), 0),
"
"                                         func_find_appl_rnddigit (sihd_bu))
"
"                             FROM adj_det_view
"
"                            WHERE     bu = sihd_bu
"
"                                  AND doc_pfx = sihd_inv_pfx
"
"                                  AND doc_no = sihd_inv_no),
"
"                          0)*/
"
"                          0 sihd_rlz_amt,
"
"                      NULL/* (SELECT (listagg (doc_date, '/')
"
"                                   WITHIN GROUP (ORDER BY doc_date))
"
"                          FROM (  SELECT doc_date
"
"                                    FROM adj_det_view
"
"                                   WHERE     bu = sihd_bu
"
"                                         AND doc_pfx = sihd_inv_pfx
"
"                                         AND doc_no = sihd_inv_no
"
"                                GROUP BY doc_date))*/
"
"                          sihd_rlz_date,
"
"                       sihd_sal_ret_type srln_rtn_doc_type,
"
"                       sihd_cre_by srln_cre_by,
"
"                       sihd_cre_ip_addr srln_cre_ip_addr,
"
"                       sihd_cre_os_user srln_cre_os_user,
"
"                       sihd_cre_date srln_cre_date,
"
"                       sihd_upd_by srln_upd_by,
"
"                       sihd_upd_ip_addr srln_upd_ip_addr,
"
"                       sihd_upd_os_user srln_upd_os_user,
"
"                       sihd_upd_date srln_upd_date,
"
"                       sihd_cre_emp_id srln_cre_emp_id,
"
"                       sihd_upd_emp_id srln_upd_emp_id,
"
"                       sihd_pan_no srln_pan_no,
"
"                       sihd_aadhaar_no srln_aadhar_no,
"
"                       sihd_pan_avail_type srln_pan_avail_type,
"
"                       sihd_tcs_pct srln_tcs_pct,
"
"                       SUM(siln_tcs_amt) srln_tcs_amt,
"
"                       SUM(siln_tcs_access_val) srln_tcs_access_val,
"
"                       sihd_tcs_sec_id srln_tcs_sec_id,
"
"                       sihd_plnt_loc_id,
"
"                       sihd_plnt_loc_name,
"
"                       NULL,
"
"                       NULL,
"
"                       sihd_billto_loc_name,
"
"                       sihd_shipto_loc_name,
"
"                       NULL,
"
"                       sihd_billfrm_loc_name,
"
"                       NULL,
"
"                       sihd_shipfrm_loc_name,
"
"                       sihd_einv_arn_no,
"
"                       sihd_einv_irn_no,
"
"                       sihd_einv_ack_date,
"
"                       TRIM (
"
"                             sisa_shipto_addr1
"
"                          || ' '
"
"                          || sisa_shipto_addr2
"
"                          || ' '
"
"                          || sisa_shipto_addr3
"
"                          || ' '
"
"                          || sisa_shipto_addr4
"
"                          || ' '
"
"                          || sisa_shipto_addr5)
"
"                          srln_shipto_addr,
"
"                       sisa_shipto_postal_code,
"
"                       sisa_shipto_city,
"
"                       sisa_shipto_state,
"
"                       sisa_shipto_cntry,
"
"                       sisa_shipto_gst_no,
"
"                       NVL(sisa_shipto_state_code,(SELECT state_code FROM states WHERE state_bu = sihd_bu AND state_id = sisa_shipto_state)) sisa_shipto_state_code,
"
"                       TRIM (
"
"                             sisa_billto_addr1
"
"                          || ' '
"
"                          || sisa_billto_addr2
"
"                          || ' '
"
"                          || sisa_billto_addr3
"
"                          || ' '
"
"                          || sisa_billto_addr4
"
"                          || ' '
"
"                          || sisa_billto_addr5)
"
"                          srln_billto_addr,
"
"                       sisa_billto_postal_code,
"
"                       sisa_billto_city,
"
"                       sisa_billto_cntry,
"
"                       sisa_billto_gst_no,
"
"                       NVL(sisa_billto_state_code,(SELECT state_code FROM states WHERE state_bu = sihd_bu AND state_id = sisa_billto_state)) sisa_billto_state_code,
"
"                       TRIM (
"
"                             sisa_billfrm_addr1
"
"                          || ' '
"
"                          || sisa_billfrm_addr2
"
"                          || ' '
"
"                          || sisa_billfrm_addr3)
"
"                          srln_billfrm_addr,
"
"                       sisa_billfrm_postal_code,
"
"                       sisa_billfrm_city,
"
"                       sisa_billfrm_state,
"
"                       sisa_billfrm_cntry,
"
"                       sisa_billfrm_gst_no,
"
"                       NVL(sisa_billfrm_state_code,(SELECT state_code FROM states WHERE state_bu = sihd_bu AND state_id = sisa_billfrm_state)) sisa_billfrm_state_code,
"
"                       TRIM (
"
"                             sisa_shipfrm_addr1
"
"                          || ' '
"
"                          || sisa_shipfrm_addr2
"
"                          || ' '
"
"                          || sisa_shipfrm_addr3)
"
"                          srln_shipfrm_addr,
"
"                       sisa_shipfrm_postal_code,
"
"                       sisa_shipfrm_city,
"
"                       sisa_shipfrm_state,
"
"                       sisa_shipfrm_cntry,
"
"                       sisa_shipfrm_gst_no,
"
"                       NVL(sisa_shipfrm_state_code,(SELECT state_code FROM states WHERE state_bu = sihd_bu AND state_id = sisa_shipfrm_state)) sisa_shipfrm_state_code,
"
"                       (SELECT suplr_group_id
"
"                          FROM suppliers
"
"                         WHERE suplr_bu = sihd_bu
"
"                               AND suplr_suplr_id = sihd_cust_id)
"
"                          sihd_cust_grp_id,
"
"                       sihd_rtn_opt,
"
"                       sihd_vou_type,
"
"                       sihd_sub_vou_type,
"
"                       NULL siln_sal_acct_id,
"
"                       NULL siln_sal_acct_desc,
"
"                       sihd_cust_grn_no,
"
"                       sihd_cust_grn_date,
"
"                       sihd_cust_asn_no,
"
"                       sihd_cust_asn_date ,
"
"                     sihd_docket_no,
"
"                     sihd_pod_date,
"
"                     sihd_prf_of_deliv_date
"
"                  FROM sales_invoices_hd,
"
"                       sales_invoices_ln abc,
"
"                       sales_inv_ship_addr
"
"                 WHERE     sihd_bu = abc.siln_bu
"
"                       AND sihd_plant = abc.siln_plnt
"
"                       AND sihd_doc_no = abc.siln_doc_no
"
"                       AND sisa_bu(+) = sihd_bu
"
"                       AND sisa_plnt(+) = sihd_plant
"
"                       AND sisa_doc_no(+) = sihd_doc_no
"
"                       AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                            OR (    p_shw_can_doc = 'Y'
"
"                                AND sihd_status IN ('I', 'C')
"
"                                AND sihd_inv_no IS NOT NULL))
"
"                       AND sihd_bu = p_bu
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_reg_parameter
"
"                                WHERE     srp_bu = p_bu
"
"                                      AND srp_doc_no = p_doc_no
"
"                                      AND srp_vou_type = sihd_sub_vou_type
"
"                                      AND srp_sel_flg = 'Y')
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_reg_plant
"
"                                WHERE     srpnt_bu = p_bu
"
"                                      AND srpnt_doc_no = p_doc_no
"
"                                      AND srpnt_plant = sihd_plant
"
"                                      AND srpnt_plnt_loc_id = sihd_plnt_loc_id
"
"                                      AND srpnt_sel_flg = 'Y')
"
"                       AND (TRUNC (sihd_inv_date) >= TRUNC (p_from_date)
"
"                            OR TRUNC (p_from_date) IS NULL)
"
"                       AND (TRUNC (sihd_inv_date) <= TRUNC (p_to_date)
"
"                            OR TRUNC (p_to_date) IS NULL)
"
"              GROUP BY sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_date,
"
"                       sihd_doc_no,
"
"                       sihd_type,
"
"                       sihd_cust_id,
"
"                       sihd_exc_inv_pfx,
"
"                       sihd_exc_inv_no,
"
"                       sihd_exc_inv_date,
"
"                       sihd_comm_inv_pfx,
"
"                       sihd_comm_inv_no,
"
"                       sihd_comm_inv_date,
"
"                       sihd_inv_pfx,
"
"                       sihd_inv_no,
"
"                       sihd_inv_date,
"
"                       sihd_year,
"
"                       sihd_period,
"
"                       sihd_currency,
"
"                       sihd_status,
"
"                       sihd_tot_amt,
"
"                       sihd_exchange_rate,
"
"                       sihd_cust_dc_no,
"
"                       sihd_cust_dc_date,
"
"                       sihd_cust_inv_no,
"
"                       sihd_cust_inv_date,
"
"                       sihd_deduction_amt,
"
"                       sihd_rnd_off,
"
"                       sihd_sales_person,
"
"                       sihd_terr_id,
"
"                       sihd_sub_terr_id,
"
"                       sihd_sales_area,
"
"                       sihd_gst_cust_type,
"
"                       sihd_gst_reg_type,
"
"                       sihd_gst_w_wo_pay_flag,
"
"                       sihd_gst_rcm_flag,
"
"                       sihd_gst_e_oe_type,
"
"                       sisa_billto_state,
"
"                       sihd_ref2,
"
"                       sihd_sal_ret_type,
"
"                       sihd_cre_by,
"
"                       sihd_cre_ip_addr,
"
"                       sihd_cre_os_user,
"
"                       sihd_cre_date,
"
"                       sihd_upd_by,
"
"                       sihd_upd_ip_addr,
"
"                       sihd_upd_os_user,
"
"                       sihd_upd_date,
"
"                       sihd_cre_emp_id,
"
"                       sihd_upd_emp_id,
"
"                       sihd_pan_no,
"
"                       sihd_aadhaar_no,
"
"                       sihd_pan_avail_type,
"
"                       sihd_tcs_pct,
"
"                       sihd_tcs_sec_id,
"
"                       sihd_plnt_loc_id,
"
"                       sihd_plnt_loc_name,
"
"                       sihd_billto_loc_name,
"
"                       sihd_shipto_loc_name,
"
"                       sihd_billfrm_loc_name,
"
"                       sihd_shipfrm_loc_name,
"
"                       sihd_einv_arn_no,
"
"                       sihd_einv_irn_no,
"
"                       sihd_einv_ack_date,
"
"                       TRIM (
"
"                             sisa_shipto_addr1
"
"                          || ' '
"
"                          || sisa_shipto_addr2
"
"                          || ' '
"
"                          || sisa_shipto_addr3
"
"                          || ' '
"
"                          || sisa_shipto_addr4
"
"                          || ' '
"
"                          || sisa_shipto_addr5),
"
"                       sisa_shipto_postal_code,
"
"                       sisa_shipto_city,
"
"                       sisa_shipto_state,
"
"                       sisa_shipto_cntry,
"
"                       sisa_shipto_gst_no,
"
"                       sisa_shipto_state_code,
"
"                       TRIM (
"
"                             sisa_billto_addr1
"
"                          || ' '
"
"                          || sisa_billto_addr2
"
"                          || ' '
"
"                          || sisa_billto_addr3
"
"                          || ' '
"
"                          || sisa_billto_addr4
"
"                          || ' '
"
"                          || sisa_billto_addr5),
"
"                       sisa_billto_postal_code,
"
"                       sisa_billto_city,
"
"                       sisa_billto_cntry,
"
"                       sisa_billto_gst_no,
"
"                       sisa_billto_state_code,
"
"                       TRIM (
"
"                             sisa_billfrm_addr1
"
"                          || ' '
"
"                          || sisa_billfrm_addr2
"
"                          || ' '
"
"                          || sisa_billfrm_addr3),
"
"                       sisa_billfrm_postal_code,
"
"                       sisa_billfrm_city,
"
"                       sisa_billfrm_state,
"
"                       sisa_billfrm_cntry,
"
"                       sisa_billfrm_gst_no,
"
"                       sisa_billfrm_state_code,
"
"                       TRIM (
"
"                             sisa_shipfrm_addr1
"
"                          || ' '
"
"                          || sisa_shipfrm_addr2
"
"                          || ' '
"
"                          || sisa_shipfrm_addr3),
"
"                       sisa_shipfrm_postal_code,
"
"                       sisa_shipfrm_city,
"
"                       sisa_shipfrm_state,
"
"                       sisa_shipfrm_cntry,
"
"                       sisa_shipfrm_gst_no,
"
"                       sisa_shipfrm_state_code,
"
"                       sihd_cust_name,
"
"                       sihd_net_amt,
"
"                       sihd_tax_amt,
"
"                       sihd_disc_amt,
"
"                       sihd_rtn_opt,
"
"                       sihd_vou_type,
"
"                       sihd_sub_vou_type,
"
"                       sihd_cust_grn_no,
"
"                       sihd_cust_grn_date,
"
"                       sihd_cust_asn_no,
"
"                       sihd_cust_asn_date ,
"
"                     sihd_docket_no,
"
"                     sihd_pod_date,
"
"                     sihd_prf_of_deliv_date);
"
"
"
"      /*Insert Invoice Wise sales Details into Temp. Table*/
"
"      FORALL rec IN 1 .. r_sir.COUNT
"
"         INSERT INTO sales_reg_ln
"
"              VALUES r_sir (rec);
"
"
"
"      /*End Invoice Wise Sales Details*/
"
"
"
"
"
"      SELECT sihd_bu,
"
"             sihd_plant,
"
"             p_doc_no,
"
"             srld_inv_doc_no,
"
"             srld_inv_doc_seq_no,
"
"             srld_prod_id,
"
"             srld_prod_rev,
"
"             srld_prod_desc1,
"
"             srld_uom,
"
"             srld_inv_qty,
"
"             srld_inv_price,
"
"             srld_dom_val,
"
"             srld_imp_val,
"
"             srld_tax_pct,
"
"             srld_tax_val,
"
"             srld_gross_sc_val,
"
"             srld_gross_bc_val,
"
"             srld_ded_val,
"
"             srld_disc_val,
"
"             srld_net_val,
"
"             srld_group_id,
"
"             srld_group_desc,
"
"             srld_sub_group_id,
"
"             srld_sub_group_desc,
"
"             srld_cust_prod_id,
"
"             srld_cust_prod_desc,
"
"             srld_cust_po_no,
"
"             srld_cust_po_date,
"
"             srld_hsn_code,
"
"             srld_unit_cost,
"
"             srld_disc2_val,
"
"             srld_disc3_val,
"
"             srld_disc4_val,
"
"             srld_disc5_val,
"
"             srld_prod_cls,
"
"             srld_prod_subcls,
"
"             srld_so_pfx,
"
"             srld_so_no,
"
"             srld_so_seq_no,
"
"             srld_so_sub_seq_no,
"
"             srld_so_schld_desc,
"
"             srld_cust_doc_no,
"
"             srld_cust_doc_rev,
"
"             srld_cust_ln_seq_no,
"
"             srld_price_class,
"
"             srld_tcs_pct,
"
"             srld_tcs_access_val,
"
"             srld_tcs_amt,
"
"             srld_tcs_sec_id,
"
"             srld_proj_lvl_id,
"
"             srld_proj_lvl_desc,
"
"             srld_cre_by,
"
"             srld_cre_ip_addr,
"
"             srld_cre_os_user,
"
"             srld_cre_date,
"
"             srld_cre_emp_id,
"
"             srld_upd_by,
"
"             srld_upd_ip_addr,
"
"             srld_upd_os_user,
"
"             srld_upd_date,
"
"             srld_upd_emp_id,
"
"             siln_rqrd_date,
"
"             siln_desp_date,
"
"             srld_cat_id,
"
"             srld_grade_id,
"
"             srld_size,
"
"             srld_pack_size,
"
"             srld_grain_type,
"
"             srld_gsm,
"
"             srld_prod_ext_desc,
"
"             srld_sales_manager,
"
"             srld_terr_manager,
"
"             srld_sub_terr_manager,
"
"             srld_oem,
"
"             srld_ewb_bill_no,
"
"             srld_vehicle_no,
"
"             srld_ewb_dist_km,
"
"             srld_trans_name,
"
"             srld_ref,
"
"             srld_lr_no,
"
"             srld_lr_date,
"
"             srld_buy_back_val,
"
"             srld_amc_frm_date,
"
"             srld_amc_to_date,
"
"             srld_amc_dur,
"
"             srld_amc_freq,
"
"             srld_sales_price_class,
"
"             siln_cr_dr,
"
"             siln_trd_assbl_val,
"
"             siln_spl_assbl_val,
"
"             siln_spl_disc_pct,
"
"             siln_spl_disc_amt,
"
"             siln_cash_assbl_val,
"
"             siln_cash_disc_pct,
"
"             siln_cash_disc_amt,
"
"             siln_tot_disc_pct,
"
"             siln_tot_disc_amt,
"
"             siln_cgst_pct,
"
"             siln_sgst_pct,
"
"             siln_utgst_pct,
"
"             siln_cust_tax_charge_flag,
"
"             siln_igst_amt,
"
"             siln_sgst_amt,
"
"             siln_cgst_amt,
"
"             siln_utgst_amt,
"
"             siln_cess_pct,
"
"             siln_cess_amt,
"
"             siln_assbl_val,
"
"             cust_group,
"
"             cust_group_desc,
"
"             cust_sub_group,
"
"             cust_sub_group_desc ,
"
"             siln_sal_acct_id,
"
"             siln_sal_acct_desc,
"
"             siln_sal_cc_id,
"
"             siln_matl_type,
"
"             siln_no_of_packs
"
"        BULK COLLECT INTO r_sir_ln
"
"        FROM (SELECT sihd_bu,
"
"                     sihd_plant,
"
"                     sihd_doc_no srld_inv_doc_no,
"
"                     siln_seq_no srld_inv_doc_seq_no,
"
"                     siln_prod_id srld_prod_id,
"
"                     siln_prod_rev srld_prod_rev,
"
"                     siln_prod_desc1 srld_prod_desc1,
"
"                     siln_uom srld_uom,
"
"                     siln_inv_qty srld_inv_qty,
"
"                     siln_price srld_inv_price,
"
"                     (CASE
"
"                         WHEN sihd_currency =
"
"                                 func_find_base_currency (sihd_bu)
"
"                         THEN
"
"                            siln_gross_amt
"
"                         ELSE
"
"                            0
"
"                      END)
"
"                        srld_dom_val,
"
"                     (CASE
"
"                         WHEN sihd_currency =
"
"                                 func_find_base_currency (sihd_bu)
"
"                         THEN
"
"                            0
"
"                         ELSE
"
"                            ROUND((siln_gross_amt * sihd_exchange_rate),2)
"
"                      END)
"
"                        srld_imp_val,
"
"                     siln_tax_pct srld_tax_pct,
"
"                     siln_tax_amt srld_tax_val,
"
"                     siln_gross_amt srld_gross_sc_val,
"
"                     (siln_gross_amt * sihd_exchange_rate) srld_gross_bc_val,
"
"                     0 srld_ded_val,
"
"                     siln_tot_disc_amt srld_disc_val,
"
"                     siln_net_amt srld_net_val,
"
"                     siln_prod_grp srld_group_id,
"
"                     siln_prod_grp_desc srld_group_desc,
"
"                     siln_prod_subgrp srld_sub_group_id,
"
"                     siln_prod_subgrp_desc srld_sub_group_desc,
"
"                     siln_cust_prod_id srld_cust_prod_id,
"
"                     siln_cust_prod_desc srld_cust_prod_desc,
"
"                     siln_cust_po_no srld_cust_po_no,
"
"                     siln_cust_po_date srld_cust_po_date,
"
"                     siln_hsn_code srld_hsn_code,
"
"                     siln_unit_cost srld_unit_cost,
"
"                     0 srld_disc2_val,
"
"                     0 srld_disc3_val,
"
"                     0 srld_disc4_val,
"
"                     0 srld_disc5_val,
"
"                     siln_class srld_prod_cls,
"
"                     siln_sub_cls srld_prod_subcls,
"
"                     NULL srld_so_pfx,
"
"                     siln_so_no srld_so_no,
"
"                     siln_so_seq_no srld_so_seq_no,
"
"                     1 srld_so_sub_seq_no,
"
"                     siln_so_schld_desc srld_so_schld_desc,
"
"                     siln_cust_doc_no srld_cust_doc_no,
"
"                     siln_cust_doc_rev srld_cust_doc_rev,
"
"                     siln_cust_ln_seq_no srld_cust_ln_seq_no,
"
"                     siln_sales_price_class srld_price_class,
"
"                     siln_tcs_pct srld_tcs_pct,
"
"                     siln_tcs_access_val srld_tcs_access_val,
"
"                     siln_tcs_amt srld_tcs_amt,
"
"                     siln_tcs_sec_id srld_tcs_sec_id,
"
"                     siln_proj_lvl_id srld_proj_lvl_id,
"
"                     siln_proj_lvl_name srld_proj_lvl_desc,
"
"                     siln_cre_by srld_cre_by,
"
"                     siln_cre_ip_addr srld_cre_ip_addr,
"
"                     siln_cre_os_user srld_cre_os_user,
"
"                     siln_cre_date srld_cre_date,
"
"                     siln_cre_emp_id srld_cre_emp_id,
"
"                     siln_upd_by srld_upd_by,
"
"                     siln_upd_ip_addr srld_upd_ip_addr,
"
"                     siln_upd_os_user srld_upd_os_user,
"
"                     siln_upd_date srld_upd_date,
"
"                     siln_upd_emp_id srld_upd_emp_id,
"
"                     siln_rqrd_date,
"
"                     siln_desp_date,
"
"                     siln_rg_cat_id srld_cat_id,
"
"                     siln_rg_grade_id srld_grade_id,
"
"                     siln_rg_size srld_size,
"
"                     siln_rg_pack_size srld_pack_size,
"
"                     'LG' srld_grain_type,
"
"                     0 srld_gsm,
"
"                     siln_prod_ext_desc srld_prod_ext_desc,
"
"                     (SELECT func_find_employee_desc1 (sa_bu,
"
"                                                       sa_resp_emp_id,
"
"                                                       1)
"
"                        FROM sales_areas
"
"                       WHERE sa_bu = sihd_bu AND sa_area = sihd_sales_area)
"
"                        srld_sales_manager,
"
"                     (SELECT func_find_employee_desc1 (sat_bu,
"
"                                                       sat_resp_emp_id,
"
"                                                       1)
"
"                        FROM sales_area_terr
"
"                       WHERE sat_bu = sihd_bu AND sat_terr_id = sihd_terr_id)
"
"                        srld_terr_manager,
"
"                     (SELECT func_find_employee_desc1 (sst_bu,
"
"                                                       sst_resp_emp_id,
"
"                                                       1)
"
"                        FROM sales_sub_terr
"
"                       WHERE sst_bu = sihd_bu
"
"                             AND sst_sub_terr_id = sihd_sub_terr_id)
"
"                        srld_sub_terr_manager,
"
"                     'NO' srld_oem,
"
"                     sibol_ewb_bill_no srld_ewb_bill_no,
"
"                     sibol_vehicle_no srld_vehicle_no,
"
"                     NVL (sibol_ewb_dist_km, 0) srld_ewb_dist_km,
"
"                     sibol_trans_name srld_trans_name,
"
"                     siln_ref srld_ref,
"
"                     sibol_lr_no srld_lr_no,
"
"                     sibol_lr_date srld_lr_date,
"
"                     0 srld_buy_back_val,
"
"                     siln_amc_frm_date srld_amc_frm_date,
"
"                     siln_amc_to_date srld_amc_to_date,
"
"                     NVL (siln_amc_dur, 0) srld_amc_dur,
"
"                     siln_amc_freq srld_amc_freq,
"
"                     siln_sales_price_class srld_sales_price_class,
"
"                     siln_cr_dr,
"
"                     siln_trd_assbl_val,
"
"                     siln_spl_assbl_val,
"
"                     siln_spl_disc_pct,
"
"                     siln_spl_disc_amt,
"
"                     siln_cash_assbl_val,
"
"                     siln_cash_disc_pct,
"
"                     siln_cash_disc_amt,
"
"                     siln_tot_disc_pct,
"
"                     siln_tot_disc_amt,
"
"                     siln_cgst_pct,
"
"                     siln_sgst_pct,
"
"                     siln_utgst_pct,
"
"                     siln_cust_tax_charge_flag,
"
"                     siln_igst_amt,
"
"                     siln_sgst_amt,
"
"                     siln_cgst_amt,
"
"                     siln_utgst_amt,
"
"                     siln_cess_pct,
"
"                     siln_cess_amt,
"
"                     NVL(siln_assbl_val,0) siln_assbl_val,
"
"                        (SELECT DISTINCT supgrp_group_id
"
"            FROM supplier_groups, suppliers
"
"           WHERE supgrp_bu = sihd_bu
"
"             AND supgrp_group_id = suplr_group_id
"
"             AND supgrp_bu = suplr_bu
"
"             AND suplr_bu = sihd_bu
"
"             AND suplr_suplr_id = sihd_cust_id) Cust_Group,
"
"                  (SELECT DISTINCT supgrp_desc1
"
"            FROM supplier_groups, suppliers
"
"           WHERE supgrp_bu = sihd_bu
"
"             AND supgrp_group_id = suplr_group_id
"
"             AND supgrp_bu = suplr_bu
"
"             AND suplr_bu = sihd_bu
"
"             AND suplr_suplr_id = sihd_cust_id) Cust_Group_desc,
"
"         (SELECT DISTINCT supsubgroup_type_id
"
"            FROM supplier_subgroup, suppliers
"
"           WHERE supsubgroup_bu = sihd_bu
"
"                 AND supsubgroup_type_id = suplr_subgroup
"
"                 AND supsubgroup_bu = suplr_bu
"
"                 AND suplr_bu = sihd_bu
"
"                 AND suplr_suplr_id = sihd_cust_id) cust_Sub_Group,
"
"        (SELECT DISTINCT supsubgroup_desc1
"
"            FROM supplier_subgroup, suppliers
"
"           WHERE supsubgroup_bu = sihd_bu
"
"                 AND supsubgroup_type_id = suplr_subgroup
"
"                 AND supsubgroup_bu = suplr_bu
"
"                 AND suplr_bu = sihd_bu
"
"                 AND suplr_suplr_id = sihd_cust_id) cust_Sub_Group_desc ,
"
"                 siln_sal_acct_id,
"
"                 (SELECT glac_acct_desc1
"
"                FROM gl_accts
"
"               WHERE glac_bu = siln_bu
"
"                 AND glac_acct = siln_sal_acct_id) siln_sal_acct_desc,
"
"                 siln_sal_cc_id,
"
"                 siln_matl_type,
"
"                 siln_no_of_packs
"
"                FROM sales_invoices_hd,
"
"                     sales_invoices_ln,
"
"                     sales_inv_bill_of_lading
"
"               WHERE     sihd_bu = siln_bu
"
"                     AND sihd_plant = siln_plnt
"
"                     AND sihd_doc_no = siln_doc_no
"
"                     AND sihd_bu = sibol_bu(+)
"
"                     AND sihd_plant = sibol_plnt(+)
"
"                     AND sihd_doc_no = sibol_doc_no(+)
"
"                     AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                          OR (    p_shw_can_doc = 'Y'
"
"                              AND sihd_status IN ('I', 'C')
"
"                              AND sihd_inv_no IS NOT NULL))
"
"                     AND sihd_bu = p_bu
"
"                     AND EXISTS
"
"                            (SELECT 1
"
"                               FROM sales_reg_parameter
"
"                              WHERE     srp_bu = p_bu
"
"                                    AND srp_doc_no = p_doc_no
"
"                                    AND srp_vou_type = sihd_sub_vou_type
"
"                                    AND srp_sel_flg = 'Y')
"
"                     AND EXISTS
"
"                            (SELECT 1
"
"                               FROM sales_reg_plant
"
"                              WHERE     srpnt_bu = p_bu
"
"                                    AND srpnt_doc_no = p_doc_no
"
"                                    AND srpnt_plant = sihd_plant
"
"                                    AND srpnt_plnt_loc_id = sihd_plnt_loc_id
"
"                                    AND srpnt_sel_flg = 'Y')
"
"                     AND (TRUNC (sihd_inv_date) >= TRUNC (p_from_date)
"
"                          OR TRUNC (p_from_date) IS NULL)
"
"                     AND (TRUNC (sihd_inv_date) <= TRUNC (p_to_date)
"
"                          OR TRUNC (p_to_date) IS NULL));
"
"
"
"      FORALL rec IN 1 .. r_sir_ln.COUNT
"
"         INSERT INTO sales_reg_ln_dtls
"
"              VALUES r_sir_ln (rec);
"
"
"
"
"
"      /*Start Account Wise Sales Details*/
"
"      SELECT sihd_bu,
"
"             p_doc_no,
"
"             sihd_plant,
"
"             sihd_doc_no,
"
"             ajh_gl_acct,
"
"             ajh_gl_acct_desc,
"
"             ajh_bc_db_amt,
"
"             -ajh_bc_cr_amt,
"
"             p_user,
"
"             NULL,
"
"             NULL,
"
"             SYSDATE,
"
"             upd_by,
"
"             NULL,
"
"             NULL,
"
"             upd_date,
"
"             NULL,
"
"             NULL
"
"        BULK COLLECT INTO r_sira
"
"        FROM (  SELECT sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_no,
"
"                       ajh_gl_acct,
"
"                       ajh_gl_acct_desc,
"
"                       SUM (ajh_bc_db_amt) ajh_bc_db_amt,
"
"                       SUM (ajh_bc_cr_amt) ajh_bc_cr_amt,
"
"                       SYSDATE,
"
"                       NULL upd_by,
"
"                       NULL upd_date
"
"                  FROM sales_invoices_hd, appl_journals_hist
"
"                 WHERE     sihd_bu = ajh_bu
"
"                       AND sihd_inv_pfx = ajh_vou_pfx
"
"                       AND sihd_inv_no = ajh_vou_no
"
"                       AND ajh_appl = 'SOM'
"
"                       AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                            OR (    p_shw_can_doc = 'Y'
"
"                                AND sihd_status IN ('I', 'C')
"
"                                AND sihd_inv_no IS NOT NULL))/*
"
"                       AND NOT EXISTS
"
"                                  (SELECT *
"
"                                     FROM fin_mgmt_control
"
"                                    WHERE     fmc_bu = sihd_bu
"
"                                          AND fmc_acct_type = 'RO'
"
"                                          AND fmc_acct = ajh_gl_acct)*/
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM gl_accts
"
"                                WHERE glac_bu = sihd_bu
"
"                                      AND glac_acct = ajh_gl_acct
"
"                                      AND glac_sub_grp_type NOT IN
"
"                                             ('SAP',
"
"                                              'SAD',
"
"                                              'SAC',
"
"                                              'SSD',
"
"                                              'CAR',
"
"                                              'CAD',
"
"                                              'CPBG',
"
"                                              'CSD',
"
"                                              'CRET',
"
"                                              'CEMD'))
"
"                       AND sihd_bu = p_bu
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_reg_parameter
"
"                                WHERE     srp_bu = p_bu
"
"                                      AND srp_doc_no = p_doc_no
"
"                                      AND srp_vou_type = sihd_sub_vou_type
"
"                                      AND srp_sel_flg = 'Y')
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_reg_plant
"
"                                WHERE     srpnt_bu = p_bu
"
"                                      AND srpnt_doc_no = p_doc_no
"
"                                      AND srpnt_plant = sihd_plant
"
"                                      AND srpnt_plnt_loc_id = sihd_plnt_loc_id
"
"                                      AND srpnt_sel_flg = 'Y')
"
"                       AND (TRUNC (sihd_inv_date) >= p_from_date
"
"                            OR p_from_date IS NULL)
"
"                       AND (TRUNC (sihd_inv_date) <= p_to_date
"
"                            OR p_to_date IS NULL)
"
"              GROUP BY sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_no,
"
"                       ajh_gl_acct,
"
"                       ajh_gl_acct_desc,
"
"                       sihd_plnt_loc_id);
"
"
"
"      /*Insert Account Wise Sales Details into Temp. table*/
"
"      FORALL rec IN 1 .. r_sira.COUNT
"
"         INSERT INTO sales_reg_acct
"
"              VALUES r_sira (rec);
"
"   /*End Account Wise Sales Details*/
"
"
"
"   END proc_gen_si_reg;
"
"
"
"   PROCEDURE proc_ins_dn_cn_type (p_bu             VARCHAR2,
"
"                               p_doc_no         VARCHAR2,
"
"                               p_vou_type       VARCHAR2,
"
"                               p_from_date      DATE,
"
"                               p_to_date        DATE,
"
"                               p_user           VARCHAR2,
"
"                               p_lang           NUMBER,
"
"                               p_shw_can_doc    VARCHAR2 DEFAULT 'N')
"
"   AS
"
"      CURSOR c_typ
"
"      IS
"
"           SELECT sihd_sub_vou_type
"
"             FROM sales_invoices_hd
"
"            WHERE sihd_bu = p_bu
"
"              AND sihd_vou_type = p_vou_type
"
"                  AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                       OR (    p_shw_can_doc = 'Y'
"
"                           AND sihd_status IN ('I', 'C')
"
"                           AND sihd_inv_no IS NOT NULL))
"
"                  AND (TRUNC (sihd_inv_date) >= p_from_date
"
"                       OR p_from_date IS NULL)
"
"                  AND (TRUNC (sihd_inv_date) <= p_to_date OR p_to_date IS NULL)
"
"                  AND NOT EXISTS (SELECT *
"
"                                    FROM sales_dn_cn_parameter
"
"                                   WHERE sdcp_bu = p_bu AND sdcp_doc_no = p_doc_no AND sdcp_vou_type = p_vou_type AND sdcp_sub_vou_type = sihd_sub_vou_type)
"
"         GROUP BY sihd_sub_vou_type;
"
"
"
"      v_seq_no   NUMBER;
"
"      var_cnt    NUMBER;
"
"   BEGIN
"
"
"
"   --Raise_Application_Error(-20999,'HRM');
"
"      SELECT COUNT (*)
"
"        INTO var_cnt
"
"        FROM sales_dn_cn_parameter
"
"       WHERE sdcp_bu = p_bu AND sdcp_doc_no = p_doc_no AND sdcp_sel_flg = 'N';
"
"
"
"         FOR r_typ IN c_typ
"
"         LOOP
"
"            SELECT NVL (MAX (sdcp_seq_no), 0) + 1
"
"              INTO v_seq_no
"
"              FROM sales_dn_cn_parameter
"
"             WHERE sdcp_bu = p_bu AND sdcp_doc_no = p_doc_no AND sdcp_vou_type = p_vou_type AND sdcp_vou_type = p_vou_type;
"
"
"
"            INSERT INTO sales_dn_cn_parameter (sdcp_bu,
"
"                                             sdcp_doc_no,
"
"                                             sdcp_vou_type,
"
"                                             sdcp_sub_vou_type,
"
"                                             sdcp_seq_no,
"
"                                             sdcp_cre_by,
"
"                                             sdcp_cre_date,
"
"                                             sdcp_sel_flg)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         p_vou_type,
"
"                         r_typ.sihd_sub_vou_type,
"
"                         v_seq_no,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'Y'); /*
"
"                     LOG ERRORS INTO ERR$_SALES_REG_PARAMETER
"
"                            ('INSERT NO-APPEND')
"
"                            REJECT LIMIT UNLIMITED;*/
"
"         END LOOP c_typ;
"
"     -- END IF;
"
"   END proc_ins_dn_cn_type;
"
"
"
"   PROCEDURE proc_ins_dn_cn_plnt (p_bu             VARCHAR2,
"
"                               p_doc_no         VARCHAR2,
"
"                               p_vou_type       VARCHAR2,
"
"                               p_from_date      DATE,
"
"                               p_to_date        DATE,
"
"                               p_user           VARCHAR2,
"
"                               p_lang           NUMBER,
"
"                               p_shw_can_doc    VARCHAR2 DEFAULT 'N')
"
"   AS
"
"      CURSOR c_plnt
"
"      IS
"
"           SELECT sihd_plant, sihd_plnt_loc_id, sihd_plnt_loc_name
"
"             FROM sales_invoices_hd
"
"            WHERE sihd_bu = p_bu
"
"              AND sihd_vou_type = p_vou_type
"
"                  AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                       OR (    p_shw_can_doc = 'Y'
"
"                           AND sihd_status IN ('I', 'C')
"
"                           AND sihd_inv_no IS NOT NULL))
"
"                  AND (TRUNC (sihd_inv_date) >= p_from_date
"
"                       OR p_from_date IS NULL)
"
"                  AND (TRUNC (sihd_inv_date) <= p_to_date OR p_to_date IS NULL)
"
"                  AND NOT EXISTS (SELECT *
"
"                                    FROM sales_dn_cn_plant
"
"                                   WHERE sdcpnt_bu = p_bu AND sdcpnt_doc_no = p_doc_no
"
"                                     AND sdcpnt_plant = sihd_plant
"
"                                     AND sdcpnt_plnt_loc_id = sihd_plnt_loc_id
"
"                                     AND sdcpnt_vou_type =p_vou_type )
"
"         GROUP BY sihd_plant, sihd_plnt_loc_id, sihd_plnt_loc_name;
"
"
"
"      var_cnt   NUMBER;
"
"   BEGIN
"
"      SELECT COUNT (*)
"
"        INTO var_cnt
"
"        FROM sales_dn_cn_plant
"
"       WHERE     sdcpnt_bu = p_bu
"
"             AND sdcpnt_doc_no = p_doc_no
"
"             AND sdcpnt_vou_type = p_vou_type
"
"             AND sdcpnt_sel_flg = 'N';
"
"
"
"           --RAISE_APPLICATION_eRROR(-20999,p_vou_type||'/'||p_doc_no||'/'||p_from_date||'/'||p_to_date||'/'||p_shw_can_doc);
"
"         FOR r_plnt IN c_plnt
"
"         LOOP
"
"
"
"
"
"
"
"            INSERT INTO sales_dn_cn_plant (sdcpnt_bu,
"
"                                         sdcpnt_doc_no,
"
"                                         sdcpnt_plant,
"
"                                         sdcpnt_vou_type,
"
"                                         sdcpnt_sel_flg,
"
"                                         sdcpnt_cre_by,
"
"                                         sdcpnt_cre_date,
"
"                                         sdcpnt_plnt_loc_id,
"
"                                         sdcpnt_plnt_loc_name)
"
"                 VALUES (p_bu,
"
"                         p_doc_no,
"
"                         r_plnt.sihd_plant,
"
"                         p_vou_type,
"
"                         'Y',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         r_plnt.sihd_plnt_loc_id,
"
"                         r_plnt.sihd_plnt_loc_name);
"
"         END LOOP c_plnt;
"
"      --END IF;
"
"   END proc_ins_dn_cn_plnt;
"
"
"
"   PROCEDURE proc_gen_dn_cn_reg (p_bu             VARCHAR2,
"
"                              p_doc_no         VARCHAR2,
"
"                              p_vou_type       VARCHAR2,
"
"                              p_from_date      DATE,
"
"                              p_to_date        DATE,
"
"                              p_user           VARCHAR2,
"
"                              p_lang           NUMBER,
"
"                              p_shw_can_doc    VARCHAR2 DEFAULT 'N')
"
"   AS
"
"      TYPE typ_sir IS TABLE OF sales_dn_cn_ln%ROWTYPE
"
"                         INDEX BY PLS_INTEGER;
"
"
"
"      r_sir      typ_sir;
"
"
"
"      TYPE typ_sir_ln IS TABLE OF sales_dn_cn_ln_dtls%ROWTYPE
"
"                            INDEX BY PLS_INTEGER;
"
"
"
"      r_sir_ln   typ_sir_ln;
"
"
"
"      TYPE typ_sir_tax IS TABLE OF sales_dn_cn_tax%ROWTYPE
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      r_sirt     typ_sir_tax;
"
"
"
"      TYPE typ_sir_acct IS TABLE OF sales_dn_cn_acct%ROWTYPE
"
"                              INDEX BY PLS_INTEGER;
"
"
"
"      r_sira     typ_sir_acct;
"
"   BEGIN
"
"      /*Delete Sales Temporary Table*/
"
"
"
"      DELETE FROM sales_dn_cn_ln_dtls
"
"            WHERE sdcld_bu = p_bu AND sdcld_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_dn_cn_ln
"
"            WHERE sdcln_bu = p_bu AND sdcln_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_dn_cn_tax
"
"            WHERE sdct_bu = p_bu AND sdct_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_dn_cn_acct
"
"            WHERE sdca_bu = p_bu AND sdca_doc_no = p_doc_no;
"
"
"
"      /*Delete Sales Temporary Table*/
"
"
"
"      /*Start Invoice Wise Sales Details*/
"
"      SELECT sihd_bu,
"
"             p_doc_no,
"
"             sihd_plant,
"
"             sihd_doc_no,
"
"             sihd_ref_plnt,
"
"             sihd_doc_date,
"
"             sihd_type,
"
"             sihd_exc_inv_pfx,
"
"             sihd_exc_inv_no,
"
"             sihd_exc_inv_date,
"
"             sihd_comm_inv_pfx,
"
"             sihd_comm_inv_no,
"
"             sihd_comm_inv_date,
"
"             sihd_inv_pfx,
"
"             sihd_inv_no,
"
"             sihd_inv_date,
"
"             NULL,
"
"             NULL,
"
"             NULL,
"
"             sihd_year,
"
"             sihd_period,
"
"             sihd_partner_type,
"
"             sihd_cust_id,
"
"             sihd_cust_name,
"
"             sihd_currency,
"
"             sihd_exchange_rate,
"
"             sihd_dom_val,
"
"             sihd_imp_val,
"
"             sihd_tax_val,
"
"             sihd_gross_sc_val,
"
"             sihd_gross_bc_val,
"
"             0 sihd_ded_amt,
"
"             sihd_disc_val,
"
"             sihd_tot_amt,
"
"             sihd_promotion_val,
"
"             sihd_rnd_off,
"
"             sihd_cust_dc_no,
"
"             sihd_cust_dc_date,
"
"             sihd_cust_inv_no,
"
"             sihd_cust_inv_date,
"
"             sihd_sales_area,
"
"             sihd_terr_id,
"
"             sihd_sub_terr_id,
"
"             sihd_sales_person,
"
"             sihd_gst_cust_type,
"
"             sihd_gst_reg_type,
"
"             sihd_gst_w_wo_pay_flag,
"
"             sihd_gst_rcm_flag,
"
"             sihd_gst_e_oe_type,
"
"             sisa_billto_state,
"
"             state_code,
"
"             state_name,
"
"             cust_gst_no,
"
"             sihd_status,
"
"             sihd_disc2_val,
"
"             sihd_disc3_val,
"
"             sihd_disc4_val,
"
"             sihd_disc5_val,
"
"             sihd_ref2,
"
"             sihd_rlz_ex_rate,
"
"             sihd_rlz_amt,
"
"             sihd_rlz_date,
"
"             srln_rtn_doc_type,
"
"             srln_cre_by,
"
"             srln_cre_ip_addr,
"
"             srln_cre_os_user,
"
"             srln_cre_date,
"
"             srln_upd_by,
"
"             srln_upd_ip_addr,
"
"             srln_upd_os_user,
"
"             srln_upd_date,
"
"             srln_cre_emp_id,
"
"             srln_upd_emp_id,
"
"             srln_pan_no,
"
"             srln_aadhar_no,
"
"             srln_pan_avail_type,
"
"             srln_tcs_pct,
"
"             srln_tcs_amt,
"
"             srln_tcs_access_val,
"
"             srln_tcs_sec_id,
"
"             sihd_plnt_loc_id,
"
"             sihd_plnt_loc_name,
"
"             NULL,
"
"             NULL,
"
"             sihd_billto_loc_name,
"
"             sihd_shipto_loc_name,
"
"             NULL,
"
"             sihd_billfrm_loc_name,
"
"             NULL,
"
"             sihd_shipfrm_loc_name,
"
"             sihd_einv_arn_no,
"
"             sihd_einv_irn_no,
"
"             sihd_einv_ack_date,
"
"             srln_shipto_addr,
"
"             sisa_shipto_postal_code,
"
"             sisa_shipto_city,
"
"             sisa_shipto_state,
"
"             sisa_shipto_cntry,
"
"             sisa_shipto_gst_no,
"
"             sisa_shipto_state_code,
"
"             srln_billto_addr,
"
"             sisa_billto_postal_code,
"
"             sisa_billto_city,
"
"             sisa_billto_cntry,
"
"             sisa_billto_gst_no,
"
"             sisa_billto_state_code,
"
"             srln_billfrm_addr,
"
"             sisa_billfrm_postal_code,
"
"             sisa_billfrm_city,
"
"             sisa_billfrm_state,
"
"             sisa_billfrm_cntry,
"
"             sisa_billfrm_gst_no,
"
"             sisa_billfrm_state_code,
"
"             srln_shipfrm_addr,
"
"             sisa_shipfrm_postal_code,
"
"             sisa_shipfrm_city,
"
"             sisa_shipfrm_state,
"
"             sisa_shipfrm_cntry,
"
"             sisa_shipfrm_gst_no,
"
"             sisa_shipfrm_state_code,
"
"             sihd_cust_grp_id,
"
"             sihd_rtn_opt,
"
"             sihd_vou_type,
"
"             sihd_sub_vou_type,
"
"             siln_sal_acct_id,
"
"             siln_sal_acct_desc,
"
"             sihd_cust_grn_no,
"
"             sihd_cust_grn_date,
"
"             sihd_cust_asn_no,
"
"             sihd_cust_asn_date ,
"
"                     sihd_docket_no,
"
"                     sihd_pod_date,
"
"                     sihd_prf_of_deliv_date
"
"        BULK COLLECT INTO r_sir
"
"        FROM (  SELECT sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_no,
"
"                       sihd_plant sihd_ref_plnt,
"
"                       sihd_doc_date,
"
"                       sihd_type,
"
"                       sihd_exc_inv_pfx,
"
"                       sihd_exc_inv_no,
"
"                       sihd_exc_inv_date,
"
"                       sihd_comm_inv_pfx,
"
"                       sihd_comm_inv_no,
"
"                       sihd_comm_inv_date,
"
"                       sihd_inv_pfx,
"
"                       sihd_inv_no,
"
"                       sihd_inv_date,
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       sihd_year,
"
"                       sihd_period,
"
"                       func_find_party_type (sihd_bu, sihd_cust_id, p_lang)
"
"                          sihd_partner_type,
"
"                       sihd_cust_id,
"
"                       sihd_cust_name,
"
"                       sihd_currency,
"
"                       sihd_exchange_rate,
"
"                       (CASE
"
"                           WHEN sihd_currency =
"
"                                   func_find_base_currency (sihd_bu)
"
"                           THEN
"
"                              CASE WHEN sihd_vou_type = 'CN' THEN -sihd_net_amt ELSE sihd_net_amt END
"
"                           ELSE
"
"                              0
"
"                        END)
"
"                          sihd_dom_val,
"
"                       (CASE
"
"                           WHEN sihd_currency =
"
"                                   func_find_base_currency (sihd_bu)
"
"                           THEN
"
"                              0
"
"                           ELSE
"
"                              CASE WHEN sihd_vou_type = 'CN' THEN -ROUND((sihd_net_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu))
"
"                              ELSE ROUND((sihd_net_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu)) END
"
"                        END)
"
"                          sihd_imp_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -sihd_tax_amt ELSE sihd_tax_amt END sihd_tax_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -(sihd_net_amt + sihd_tax_amt) ELSE (sihd_net_amt + sihd_tax_amt) END sihd_gross_sc_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -(ROUND ( (sihd_net_amt) * sihd_exchange_rate,
"
"                               func_find_appl_rnddigit (sihd_bu))
"
"                        + sihd_tax_amt) ELSE (ROUND ( (sihd_net_amt) * sihd_exchange_rate,
"
"                               func_find_appl_rnddigit (sihd_bu))
"
"                        + sihd_tax_amt) END
"
"                          sihd_gross_bc_val,
"
"                       0 sihd_ded_amt,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -sihd_disc_amt ELSE sihd_disc_amt END sihd_disc_val,
"
"                       CASE WHEN sihd_vou_type = 'CN' THEN -ROUND((sihd_tot_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu))
"
"                       ELSE ROUND((sihd_tot_amt * sihd_exchange_rate),func_find_appl_rnddigit (sihd_bu)) END sihd_tot_amt,
"
"                       (SELECT SUM (siln_inv_qty * siln_price)
"
"                          FROM sales_invoices_ln bcd
"
"                         WHERE     bcd.siln_bu = sihd_bu
"
"                               AND bcd.siln_plnt = sihd_plant
"
"                               AND bcd.siln_doc_no = sihd_doc_no
"
"                               AND bcd.siln_promotion_flag = 'Y')
"
"                          sihd_promotion_val,
"
"                       sihd_rnd_off sihd_rnd_off,
"
"                       sihd_cust_dc_no,
"
"                       sihd_cust_dc_date,
"
"                       sihd_cust_inv_no,
"
"                       sihd_cust_inv_date,
"
"                       sihd_sales_area,
"
"                       sihd_terr_id,
"
"                       sihd_sub_terr_id,
"
"                       sihd_sales_person,
"
"                       sihd_gst_cust_type,
"
"                       sihd_gst_reg_type,
"
"                       sihd_gst_w_wo_pay_flag,
"
"                       sihd_gst_rcm_flag,
"
"                       sihd_gst_e_oe_type,
"
"                       sisa_billto_state,
"
"                       sisa_billto_state_code state_code,
"
"                       (SELECT state_name1
"
"                          FROM states
"
"                         WHERE state_bu = sihd_bu
"
"                           AND state_id = sisa_billto_state)
"
"                          state_name,
"
"                       sisa_billto_gst_no cust_gst_no,
"
"                       sihd_status,
"
"                       0 sihd_disc2_val,
"
"                       0 sihd_disc3_val,
"
"                       0 sihd_disc4_val,
"
"                       0 sihd_disc5_val,
"
"                       sihd_ref2,
"
"                       NULL/*(SELECT (listagg (ex_rate, '/')
"
"                                   WITHIN GROUP (ORDER BY ex_rate))
"
"                          FROM (  SELECT ex_rate
"
"                                    FROM adj_det_view
"
"                                   WHERE     bu = sihd_bu
"
"                                         AND doc_pfx = sihd_inv_pfx
"
"                                         AND doc_no = sihd_inv_no
"
"                                GROUP BY ex_rate))*/
"
"                          sihd_rlz_ex_rate,
"
"                       /*NVL (
"
"                          (SELECT ROUND (NVL (SUM (ex_rate * offset_amt), 0),
"
"                                         func_find_appl_rnddigit (sihd_bu))
"
"                             FROM adj_det_view
"
"                            WHERE     bu = sihd_bu
"
"                                  AND doc_pfx = sihd_inv_pfx
"
"                                  AND doc_no = sihd_inv_no),
"
"                          0)*/
"
"                          0 sihd_rlz_amt,
"
"                      NULL/* (SELECT (listagg (doc_date, '/')
"
"                                   WITHIN GROUP (ORDER BY doc_date))
"
"                          FROM (  SELECT doc_date
"
"                                    FROM adj_det_view
"
"                                   WHERE     bu = sihd_bu
"
"                                         AND doc_pfx = sihd_inv_pfx
"
"                                         AND doc_no = sihd_inv_no
"
"                                GROUP BY doc_date))*/
"
"                          sihd_rlz_date,
"
"                       sihd_sal_ret_type srln_rtn_doc_type,
"
"                       sihd_cre_by srln_cre_by,
"
"                       sihd_cre_ip_addr srln_cre_ip_addr,
"
"                       sihd_cre_os_user srln_cre_os_user,
"
"                       sihd_cre_date srln_cre_date,
"
"                       sihd_upd_by srln_upd_by,
"
"                       sihd_upd_ip_addr srln_upd_ip_addr,
"
"                       sihd_upd_os_user srln_upd_os_user,
"
"                       sihd_upd_date srln_upd_date,
"
"                       sihd_cre_emp_id srln_cre_emp_id,
"
"                       sihd_upd_emp_id srln_upd_emp_id,
"
"                       sihd_pan_no srln_pan_no,
"
"                       sihd_aadhaar_no srln_aadhar_no,
"
"                       sihd_pan_avail_type srln_pan_avail_type,
"
"                       sihd_tcs_pct srln_tcs_pct,
"
"                       SUM(siln_tcs_amt) srln_tcs_amt,
"
"                       SUM(siln_tcs_access_val) srln_tcs_access_val,
"
"                       sihd_tcs_sec_id srln_tcs_sec_id,
"
"                       sihd_plnt_loc_id,
"
"                       sihd_plnt_loc_name,
"
"                       NULL,
"
"                       NULL,
"
"                       sihd_billto_loc_name,
"
"                       sihd_shipto_loc_name,
"
"                       NULL,
"
"                       sihd_billfrm_loc_name,
"
"                       NULL,
"
"                       sihd_shipfrm_loc_name,
"
"                       sihd_einv_arn_no,
"
"                       sihd_einv_irn_no,
"
"                       sihd_einv_ack_date,
"
"                       TRIM (
"
"                             sisa_shipto_addr1
"
"                          || ' '
"
"                          || sisa_shipto_addr2
"
"                          || ' '
"
"                          || sisa_shipto_addr3
"
"                          || ' '
"
"                          || sisa_shipto_addr4
"
"                          || ' '
"
"                          || sisa_shipto_addr5)
"
"                          srln_shipto_addr,
"
"                       sisa_shipto_postal_code,
"
"                       sisa_shipto_city,
"
"                       sisa_shipto_state,
"
"                       sisa_shipto_cntry,
"
"                       sisa_shipto_gst_no,
"
"                       sisa_shipto_state_code,
"
"                       TRIM (
"
"                             sisa_billto_addr1
"
"                          || ' '
"
"                          || sisa_billto_addr2
"
"                          || ' '
"
"                          || sisa_billto_addr3
"
"                          || ' '
"
"                          || sisa_billto_addr4
"
"                          || ' '
"
"                          || sisa_billto_addr5)
"
"                          srln_billto_addr,
"
"                       sisa_billto_postal_code,
"
"                       sisa_billto_city,
"
"                       sisa_billto_cntry,
"
"                       sisa_billto_gst_no,
"
"                       sisa_billto_state_code,
"
"                       TRIM (
"
"                             sisa_billfrm_addr1
"
"                          || ' '
"
"                          || sisa_billfrm_addr2
"
"                          || ' '
"
"                          || sisa_billfrm_addr3)
"
"                          srln_billfrm_addr,
"
"                       sisa_billfrm_postal_code,
"
"                       sisa_billfrm_city,
"
"                       sisa_billfrm_state,
"
"                       sisa_billfrm_cntry,
"
"                       sisa_billfrm_gst_no,
"
"                       sisa_billfrm_state_code,
"
"                       TRIM (
"
"                             sisa_shipfrm_addr1
"
"                          || ' '
"
"                          || sisa_shipfrm_addr2
"
"                          || ' '
"
"                          || sisa_shipfrm_addr3)
"
"                          srln_shipfrm_addr,
"
"                       sisa_shipfrm_postal_code,
"
"                       sisa_shipfrm_city,
"
"                       sisa_shipfrm_state,
"
"                       sisa_shipfrm_cntry,
"
"                       sisa_shipfrm_gst_no,
"
"                       sisa_shipfrm_state_code,
"
"                       (SELECT suplr_group_id
"
"                          FROM suppliers
"
"                         WHERE suplr_bu = sihd_bu
"
"                               AND suplr_suplr_id = sihd_cust_id)
"
"                          sihd_cust_grp_id,
"
"                       sihd_rtn_opt,
"
"                       sihd_vou_type,
"
"                       sihd_sub_vou_type,
"
"                       NULL siln_sal_acct_id,
"
"                       NULL siln_sal_acct_desc,
"
"                       sihd_cust_grn_no,
"
"                       sihd_cust_grn_date,
"
"                       sihd_cust_asn_no,
"
"                       sihd_cust_asn_date ,
"
"                     sihd_docket_no,
"
"                     sihd_pod_date,
"
"                     sihd_prf_of_deliv_date
"
"                  FROM sales_invoices_hd,
"
"                       sales_invoices_ln abc,
"
"                       sales_inv_ship_addr
"
"                 WHERE     sihd_bu = abc.siln_bu
"
"                       AND sihd_plant = abc.siln_plnt
"
"                       AND sihd_doc_no = abc.siln_doc_no
"
"                       AND sisa_bu(+) = sihd_bu
"
"                       AND sisa_plnt(+) = sihd_plant
"
"                       AND sisa_doc_no(+) = sihd_doc_no
"
"                       AND sihd_vou_type = p_vou_type
"
"                       AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                            OR (    p_shw_can_doc = 'Y'
"
"                                AND sihd_status IN ('I', 'C')
"
"                                AND sihd_inv_no IS NOT NULL))
"
"                       AND sihd_bu = p_bu
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_dn_cn_parameter
"
"                                WHERE     sdcp_bu = p_bu
"
"                                      AND sdcp_doc_no = p_doc_no
"
"                                      AND sdcp_vou_type = sihd_vou_type
"
"                                      AND sdcp_sub_vou_type = sihd_sub_vou_type
"
"                                      AND sdcp_sel_flg = 'Y')
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_dn_cn_plant
"
"                                WHERE     sdcpnt_bu = p_bu
"
"                                      AND sdcpnt_doc_no = p_doc_no
"
"                                      AND sdcpnt_vou_type = sihd_vou_type
"
"                                      AND sdcpnt_plant = sihd_plant
"
"                                      AND sdcpnt_plnt_loc_id = sihd_plnt_loc_id
"
"                                      AND sdcpnt_sel_flg = 'Y')
"
"                       AND (TRUNC (sihd_inv_date) >= TRUNC (p_from_date)
"
"                            OR TRUNC (p_from_date) IS NULL)
"
"                       AND (TRUNC (sihd_inv_date) <= TRUNC (p_to_date)
"
"                            OR TRUNC (p_to_date) IS NULL)
"
"              GROUP BY sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_date,
"
"                       sihd_doc_no,
"
"                       sihd_type,
"
"                       sihd_cust_id,
"
"                       sihd_exc_inv_pfx,
"
"                       sihd_exc_inv_no,
"
"                       sihd_exc_inv_date,
"
"                       sihd_comm_inv_pfx,
"
"                       sihd_comm_inv_no,
"
"                       sihd_comm_inv_date,
"
"                       sihd_inv_pfx,
"
"                       sihd_inv_no,
"
"                       sihd_inv_date,
"
"                       sihd_year,
"
"                       sihd_period,
"
"                       sihd_currency,
"
"                       sihd_status,
"
"                       sihd_tot_amt,
"
"                       sihd_exchange_rate,
"
"                       sihd_cust_dc_no,
"
"                       sihd_cust_dc_date,
"
"                       sihd_cust_inv_no,
"
"                       sihd_cust_inv_date,
"
"                       sihd_deduction_amt,
"
"                       sihd_rnd_off,
"
"                       sihd_sales_person,
"
"                       sihd_terr_id,
"
"                       sihd_sub_terr_id,
"
"                       sihd_sales_area,
"
"                       sihd_gst_cust_type,
"
"                       sihd_gst_reg_type,
"
"                       sihd_gst_w_wo_pay_flag,
"
"                       sihd_gst_rcm_flag,
"
"                       sihd_gst_e_oe_type,
"
"                       sisa_billto_state,
"
"                       sihd_ref2,
"
"                       sihd_sal_ret_type,
"
"                       sihd_cre_by,
"
"                       sihd_cre_ip_addr,
"
"                       sihd_cre_os_user,
"
"                       sihd_cre_date,
"
"                       sihd_upd_by,
"
"                       sihd_upd_ip_addr,
"
"                       sihd_upd_os_user,
"
"                       sihd_upd_date,
"
"                       sihd_cre_emp_id,
"
"                       sihd_upd_emp_id,
"
"                       sihd_pan_no,
"
"                       sihd_aadhaar_no,
"
"                       sihd_pan_avail_type,
"
"                       sihd_tcs_pct,
"
"                       sihd_tcs_sec_id,
"
"                       sihd_plnt_loc_id,
"
"                       sihd_plnt_loc_name,
"
"                       sihd_billto_loc_name,
"
"                       sihd_shipto_loc_name,
"
"                       sihd_billfrm_loc_name,
"
"                       sihd_shipfrm_loc_name,
"
"                       sihd_einv_arn_no,
"
"                       sihd_einv_irn_no,
"
"                       sihd_einv_ack_date,
"
"                       TRIM (
"
"                             sisa_shipto_addr1
"
"                          || ' '
"
"                          || sisa_shipto_addr2
"
"                          || ' '
"
"                          || sisa_shipto_addr3
"
"                          || ' '
"
"                          || sisa_shipto_addr4
"
"                          || ' '
"
"                          || sisa_shipto_addr5),
"
"                       sisa_shipto_postal_code,
"
"                       sisa_shipto_city,
"
"                       sisa_shipto_state,
"
"                       sisa_shipto_cntry,
"
"                       sisa_shipto_gst_no,
"
"                       sisa_shipto_state_code,
"
"                       TRIM (
"
"                             sisa_billto_addr1
"
"                          || ' '
"
"                          || sisa_billto_addr2
"
"                          || ' '
"
"                          || sisa_billto_addr3
"
"                          || ' '
"
"                          || sisa_billto_addr4
"
"                          || ' '
"
"                          || sisa_billto_addr5),
"
"                       sisa_billto_postal_code,
"
"                       sisa_billto_city,
"
"                       sisa_billto_cntry,
"
"                       sisa_billto_gst_no,
"
"                       sisa_billto_state_code,
"
"                       TRIM (
"
"                             sisa_billfrm_addr1
"
"                          || ' '
"
"                          || sisa_billfrm_addr2
"
"                          || ' '
"
"                          || sisa_billfrm_addr3),
"
"                       sisa_billfrm_postal_code,
"
"                       sisa_billfrm_city,
"
"                       sisa_billfrm_state,
"
"                       sisa_billfrm_cntry,
"
"                       sisa_billfrm_gst_no,
"
"                       sisa_billfrm_state_code,
"
"                       TRIM (
"
"                             sisa_shipfrm_addr1
"
"                          || ' '
"
"                          || sisa_shipfrm_addr2
"
"                          || ' '
"
"                          || sisa_shipfrm_addr3),
"
"                       sisa_shipfrm_postal_code,
"
"                       sisa_shipfrm_city,
"
"                       sisa_shipfrm_state,
"
"                       sisa_shipfrm_cntry,
"
"                       sisa_shipfrm_gst_no,
"
"                       sisa_shipfrm_state_code,
"
"                       sihd_cust_name,
"
"                       sihd_net_amt,
"
"                       sihd_tax_amt,
"
"                       sihd_disc_amt,
"
"                       sihd_rtn_opt,
"
"                       sihd_vou_type,
"
"                       sihd_sub_vou_type,
"
"                       sihd_cust_grn_no,
"
"                       sihd_cust_grn_date,
"
"                       sihd_cust_asn_no,
"
"                       sihd_cust_asn_date ,
"
"                     sihd_docket_no,
"
"                     sihd_pod_date,
"
"                     sihd_prf_of_deliv_date);
"
"
"
"      /*Insert Invoice Wise sales Details into Temp. Table*/
"
"      FORALL rec IN 1 .. r_sir.COUNT
"
"         INSERT INTO sales_dn_cn_ln
"
"              VALUES r_sir (rec);
"
"
"
"      /*End Invoice Wise Sales Details*/
"
"
"
"
"
"      SELECT sihd_bu,
"
"             sihd_plant,
"
"             p_doc_no,
"
"             srld_inv_doc_no,
"
"             srld_inv_doc_seq_no,
"
"             srld_prod_id,
"
"             srld_prod_rev,
"
"             srld_prod_desc1,
"
"             srld_uom,
"
"             srld_inv_qty,
"
"             srld_inv_price,
"
"             srld_dom_val,
"
"             srld_imp_val,
"
"             srld_tax_pct,
"
"             srld_tax_val,
"
"             srld_gross_sc_val,
"
"             srld_gross_bc_val,
"
"             srld_ded_val,
"
"             srld_disc_val,
"
"             srld_net_val,
"
"             srld_group_id,
"
"             srld_group_desc,
"
"             srld_sub_group_id,
"
"             srld_sub_group_desc,
"
"             srld_cust_prod_id,
"
"             srld_cust_prod_desc,
"
"             srld_cust_po_no,
"
"             srld_cust_po_date,
"
"             srld_hsn_code,
"
"             srld_unit_cost,
"
"             srld_disc2_val,
"
"             srld_disc3_val,
"
"             srld_disc4_val,
"
"             srld_disc5_val,
"
"             srld_prod_cls,
"
"             srld_prod_subcls,
"
"             srld_so_pfx,
"
"             srld_so_no,
"
"             srld_so_seq_no,
"
"             srld_so_sub_seq_no,
"
"             srld_so_schld_desc,
"
"             srld_cust_doc_no,
"
"             srld_cust_doc_rev,
"
"             srld_cust_ln_seq_no,
"
"             srld_price_class,
"
"             srld_tcs_pct,
"
"             srld_tcs_access_val,
"
"             srld_tcs_amt,
"
"             srld_tcs_sec_id,
"
"             srld_proj_lvl_id,
"
"             srld_proj_lvl_desc,
"
"             srld_cre_by,
"
"             srld_cre_ip_addr,
"
"             srld_cre_os_user,
"
"             srld_cre_date,
"
"             srld_cre_emp_id,
"
"             srld_upd_by,
"
"             srld_upd_ip_addr,
"
"             srld_upd_os_user,
"
"             srld_upd_date,
"
"             srld_upd_emp_id,
"
"             siln_rqrd_date,
"
"             siln_desp_date,
"
"             srld_cat_id,
"
"             srld_grade_id,
"
"             srld_size,
"
"             srld_pack_size,
"
"             srld_grain_type,
"
"             srld_gsm,
"
"             srld_prod_ext_desc,
"
"             srld_sales_manager,
"
"             srld_terr_manager,
"
"             srld_sub_terr_manager,
"
"             srld_oem,
"
"             srld_ewb_bill_no,
"
"             srld_vehicle_no,
"
"             srld_ewb_dist_km,
"
"             srld_trans_name,
"
"             srld_ref,
"
"             srld_lr_no,
"
"             srld_lr_date,
"
"             srld_buy_back_val,
"
"             srld_amc_frm_date,
"
"             srld_amc_to_date,
"
"             srld_amc_dur,
"
"             srld_amc_freq,
"
"             srld_sales_price_class,
"
"             siln_cr_dr,
"
"             siln_trd_assbl_val,
"
"             siln_spl_assbl_val,
"
"             siln_spl_disc_pct,
"
"             siln_spl_disc_amt,
"
"             siln_cash_assbl_val,
"
"             siln_cash_disc_pct,
"
"             siln_cash_disc_amt,
"
"             siln_tot_disc_pct,
"
"             siln_tot_disc_amt,
"
"             siln_cgst_pct,
"
"             siln_sgst_pct,
"
"             siln_utgst_pct,
"
"             siln_cust_tax_charge_flag,
"
"             siln_igst_amt,
"
"             siln_sgst_amt,
"
"             siln_cgst_amt,
"
"             siln_utgst_amt,
"
"             siln_cess_pct,
"
"             siln_cess_amt,
"
"             siln_assbl_val,
"
"             cust_group,
"
"             cust_group_desc,
"
"             cust_sub_group,
"
"             cust_sub_group_desc ,
"
"             siln_sal_acct_id,
"
"             siln_sal_acct_desc,
"
"             siln_sal_cc_id,
"
"             siln_matl_type,
"
"             siln_no_of_packs
"
"        BULK COLLECT INTO r_sir_ln
"
"        FROM (SELECT sihd_bu,
"
"                     sihd_plant,
"
"                     sihd_doc_no srld_inv_doc_no,
"
"                     siln_seq_no srld_inv_doc_seq_no,
"
"                     siln_prod_id srld_prod_id,
"
"                     siln_prod_rev srld_prod_rev,
"
"                     siln_prod_desc1 srld_prod_desc1,
"
"                     siln_uom srld_uom,
"
"                     siln_inv_qty srld_inv_qty,
"
"                     siln_price srld_inv_price,
"
"                     (CASE
"
"                         WHEN sihd_currency =
"
"                                 func_find_base_currency (sihd_bu)
"
"                         THEN
"
"                            siln_gross_amt
"
"                         ELSE
"
"                            0
"
"                      END)
"
"                        srld_dom_val,
"
"                     (CASE
"
"                         WHEN sihd_currency =
"
"                                 func_find_base_currency (sihd_bu)
"
"                         THEN
"
"                            0
"
"                         ELSE
"
"                            ROUND((siln_gross_amt * sihd_exchange_rate),2)
"
"                      END)
"
"                        srld_imp_val,
"
"                     siln_tax_pct srld_tax_pct,
"
"                     siln_tax_amt srld_tax_val,
"
"                     siln_gross_amt srld_gross_sc_val,
"
"                     (siln_gross_amt * sihd_exchange_rate) srld_gross_bc_val,
"
"                     0 srld_ded_val,
"
"                     siln_tot_disc_amt srld_disc_val,
"
"                     siln_net_amt srld_net_val,
"
"                     siln_prod_grp srld_group_id,
"
"                     siln_prod_grp_desc srld_group_desc,
"
"                     siln_prod_subgrp srld_sub_group_id,
"
"                     siln_prod_subgrp_desc srld_sub_group_desc,
"
"                     siln_cust_prod_id srld_cust_prod_id,
"
"                     siln_cust_prod_desc srld_cust_prod_desc,
"
"                     siln_cust_po_no srld_cust_po_no,
"
"                     siln_cust_po_date srld_cust_po_date,
"
"                     siln_hsn_code srld_hsn_code,
"
"                     siln_unit_cost srld_unit_cost,
"
"                     0 srld_disc2_val,
"
"                     0 srld_disc3_val,
"
"                     0 srld_disc4_val,
"
"                     0 srld_disc5_val,
"
"                     siln_class srld_prod_cls,
"
"                     siln_sub_cls srld_prod_subcls,
"
"                     NULL srld_so_pfx,
"
"                     siln_so_no srld_so_no,
"
"                     siln_so_seq_no srld_so_seq_no,
"
"                     1 srld_so_sub_seq_no,
"
"                     siln_so_schld_desc srld_so_schld_desc,
"
"                     siln_cust_doc_no srld_cust_doc_no,
"
"                     siln_cust_doc_rev srld_cust_doc_rev,
"
"                     siln_cust_ln_seq_no srld_cust_ln_seq_no,
"
"                     siln_sales_price_class srld_price_class,
"
"                     siln_tcs_pct srld_tcs_pct,
"
"                     siln_tcs_access_val srld_tcs_access_val,
"
"                     siln_tcs_amt srld_tcs_amt,
"
"                     siln_tcs_sec_id srld_tcs_sec_id,
"
"                     siln_proj_lvl_id srld_proj_lvl_id,
"
"                     siln_proj_lvl_name srld_proj_lvl_desc,
"
"                     siln_cre_by srld_cre_by,
"
"                     siln_cre_ip_addr srld_cre_ip_addr,
"
"                     siln_cre_os_user srld_cre_os_user,
"
"                     siln_cre_date srld_cre_date,
"
"                     siln_cre_emp_id srld_cre_emp_id,
"
"                     siln_upd_by srld_upd_by,
"
"                     siln_upd_ip_addr srld_upd_ip_addr,
"
"                     siln_upd_os_user srld_upd_os_user,
"
"                     siln_upd_date srld_upd_date,
"
"                     siln_upd_emp_id srld_upd_emp_id,
"
"                     siln_rqrd_date,
"
"                     siln_desp_date,
"
"                     siln_rg_cat_id srld_cat_id,
"
"                     siln_rg_grade_id srld_grade_id,
"
"                     siln_rg_size srld_size,
"
"                     siln_rg_pack_size srld_pack_size,
"
"                     'LG' srld_grain_type,
"
"                     0 srld_gsm,
"
"                     siln_prod_ext_desc srld_prod_ext_desc,
"
"                     (SELECT func_find_employee_desc1 (sa_bu,
"
"                                                       sa_resp_emp_id,
"
"                                                       1)
"
"                        FROM sales_areas
"
"                       WHERE sa_bu = sihd_bu AND sa_area = sihd_sales_area)
"
"                        srld_sales_manager,
"
"                     (SELECT func_find_employee_desc1 (sat_bu,
"
"                                                       sat_resp_emp_id,
"
"                                                       1)
"
"                        FROM sales_area_terr
"
"                       WHERE sat_bu = sihd_bu AND sat_terr_id = sihd_terr_id)
"
"                        srld_terr_manager,
"
"                     (SELECT func_find_employee_desc1 (sst_bu,
"
"                                                       sst_resp_emp_id,
"
"                                                       1)
"
"                        FROM sales_sub_terr
"
"                       WHERE sst_bu = sihd_bu
"
"                             AND sst_sub_terr_id = sihd_sub_terr_id)
"
"                        srld_sub_terr_manager,
"
"                     'NO' srld_oem,
"
"                     sibol_ewb_bill_no srld_ewb_bill_no,
"
"                     sibol_vehicle_no srld_vehicle_no,
"
"                     NVL (sibol_ewb_dist_km, 0) srld_ewb_dist_km,
"
"                     sibol_trans_name srld_trans_name,
"
"                     siln_ref srld_ref,
"
"                     sibol_lr_no srld_lr_no,
"
"                     sibol_lr_date srld_lr_date,
"
"                     0 srld_buy_back_val,
"
"                     siln_amc_frm_date srld_amc_frm_date,
"
"                     siln_amc_to_date srld_amc_to_date,
"
"                     NVL (siln_amc_dur, 0) srld_amc_dur,
"
"                     siln_amc_freq srld_amc_freq,
"
"                     siln_sales_price_class srld_sales_price_class,
"
"                     siln_cr_dr,
"
"                     siln_trd_assbl_val,
"
"                     siln_spl_assbl_val,
"
"                     siln_spl_disc_pct,
"
"                     siln_spl_disc_amt,
"
"                     siln_cash_assbl_val,
"
"                     siln_cash_disc_pct,
"
"                     siln_cash_disc_amt,
"
"                     siln_tot_disc_pct,
"
"                     siln_tot_disc_amt,
"
"                     siln_cgst_pct,
"
"                     siln_sgst_pct,
"
"                     siln_utgst_pct,
"
"                     siln_cust_tax_charge_flag,
"
"                     siln_igst_amt,
"
"                     siln_sgst_amt,
"
"                     siln_cgst_amt,
"
"                     siln_utgst_amt,
"
"                     siln_cess_pct,
"
"                     siln_cess_amt,
"
"                     NVL(siln_assbl_val,0) siln_assbl_val,
"
"                        (SELECT DISTINCT supgrp_group_id
"
"            FROM supplier_groups, suppliers
"
"           WHERE supgrp_bu = sihd_bu
"
"             AND supgrp_group_id = suplr_group_id
"
"             AND supgrp_bu = suplr_bu
"
"             AND suplr_bu = sihd_bu
"
"             AND suplr_suplr_id = sihd_cust_id) Cust_Group,
"
"                  (SELECT DISTINCT supgrp_desc1
"
"            FROM supplier_groups, suppliers
"
"           WHERE supgrp_bu = sihd_bu
"
"             AND supgrp_group_id = suplr_group_id
"
"             AND supgrp_bu = suplr_bu
"
"             AND suplr_bu = sihd_bu
"
"             AND suplr_suplr_id = sihd_cust_id) Cust_Group_desc,
"
"         (SELECT DISTINCT supsubgroup_type_id
"
"            FROM supplier_subgroup, suppliers
"
"           WHERE supsubgroup_bu = sihd_bu
"
"                 AND supsubgroup_type_id = suplr_subgroup
"
"                 AND supsubgroup_bu = suplr_bu
"
"                 AND suplr_bu = sihd_bu
"
"                 AND suplr_suplr_id = sihd_cust_id) cust_Sub_Group,
"
"        (SELECT DISTINCT supsubgroup_desc1
"
"            FROM supplier_subgroup, suppliers
"
"           WHERE supsubgroup_bu = sihd_bu
"
"                 AND supsubgroup_type_id = suplr_subgroup
"
"                 AND supsubgroup_bu = suplr_bu
"
"                 AND suplr_bu = sihd_bu
"
"                 AND suplr_suplr_id = sihd_cust_id) cust_Sub_Group_desc ,
"
"                 siln_sal_acct_id,
"
"                 (SELECT glac_acct_desc1
"
"                FROM gl_accts
"
"               WHERE glac_bu = siln_bu
"
"                 AND glac_acct = siln_sal_acct_id) siln_sal_acct_desc,
"
"                 siln_sal_cc_id,
"
"                 siln_matl_type,
"
"                 siln_no_of_packs
"
"                FROM sales_invoices_hd,
"
"                     sales_invoices_ln,
"
"                     sales_inv_bill_of_lading
"
"               WHERE     sihd_bu = siln_bu
"
"                     AND sihd_plant = siln_plnt
"
"                     AND sihd_doc_no = siln_doc_no
"
"                     AND sihd_bu = sibol_bu(+)
"
"                     AND sihd_plant = sibol_plnt(+)
"
"                     AND sihd_doc_no = sibol_doc_no(+)
"
"                     AND sihd_vou_type = p_vou_type
"
"                     AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                          OR (    p_shw_can_doc = 'Y'
"
"                              AND sihd_status IN ('I', 'C')
"
"                              AND sihd_inv_no IS NOT NULL))
"
"                     AND sihd_bu = p_bu
"
"                     AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_dn_cn_parameter
"
"                                WHERE     sdcp_bu = p_bu
"
"                                      AND sdcp_doc_no = p_doc_no
"
"                                      AND sdcp_vou_type = sihd_vou_type
"
"                                      AND sdcp_sub_vou_type = sihd_sub_vou_type
"
"                                      AND sdcp_sel_flg = 'Y')
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_dn_cn_plant
"
"                                WHERE     sdcpnt_bu = p_bu
"
"                                      AND sdcpnt_doc_no = p_doc_no
"
"                                      AND sdcpnt_vou_type = sihd_vou_type
"
"                                      AND sdcpnt_plant = sihd_plant
"
"                                      AND sdcpnt_plnt_loc_id = sihd_plnt_loc_id
"
"                                      AND sdcpnt_sel_flg = 'Y')
"
"                     AND (TRUNC (sihd_inv_date) >= TRUNC (p_from_date)
"
"                          OR TRUNC (p_from_date) IS NULL)
"
"                     AND (TRUNC (sihd_inv_date) <= TRUNC (p_to_date)
"
"                          OR TRUNC (p_to_date) IS NULL));
"
"
"
"      FORALL rec IN 1 .. r_sir_ln.COUNT
"
"         INSERT INTO sales_dn_cn_ln_dtls
"
"              VALUES r_sir_ln (rec);
"
"
"
"
"
"      /*Start Account Wise Sales Details*/
"
"      SELECT sihd_bu,
"
"             p_doc_no,
"
"             sihd_plant,
"
"             sihd_doc_no,
"
"             ajh_gl_acct,
"
"             ajh_gl_acct_desc,
"
"             ajh_bc_db_amt,
"
"             -ajh_bc_cr_amt,
"
"             p_user,
"
"             NULL,
"
"             NULL,
"
"             SYSDATE,
"
"             upd_by,
"
"             NULL,
"
"             NULL,
"
"             upd_date,
"
"             NULL,
"
"             NULL
"
"        BULK COLLECT INTO r_sira
"
"        FROM (  SELECT sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_no,
"
"                       ajh_gl_acct,
"
"                       ajh_gl_acct_desc,
"
"                       SUM (ajh_bc_db_amt) ajh_bc_db_amt,
"
"                       SUM (ajh_bc_cr_amt) ajh_bc_cr_amt,
"
"                       SYSDATE,
"
"                       NULL upd_by,
"
"                       NULL upd_date
"
"                  FROM sales_invoices_hd, appl_journals_hist
"
"                 WHERE     sihd_bu = ajh_bu
"
"                       AND sihd_inv_pfx = ajh_vou_pfx
"
"                       AND sihd_inv_no = ajh_vou_no
"
"                       AND ajh_appl = 'SOM'
"
"                       AND sihd_vou_type = p_vou_type
"
"                       AND ( (p_shw_can_doc = 'N' AND sihd_status = 'I')
"
"                            OR (    p_shw_can_doc = 'Y'
"
"                                AND sihd_status IN ('I', 'C')
"
"                                AND sihd_inv_no IS NOT NULL))
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM gl_accts
"
"                                WHERE glac_bu = sihd_bu
"
"                                      AND glac_acct = ajh_gl_acct
"
"                                      AND glac_sub_grp_type NOT IN
"
"                                             ('SAP',
"
"                                              'SAD',
"
"                                              'SAC',
"
"                                              'SSD',
"
"                                              'CAR',
"
"                                              'CAD',
"
"                                              'CPBG',
"
"                                              'CSD',
"
"                                              'CRET',
"
"                                              'CEMD'))
"
"                       AND sihd_bu = p_bu
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_dn_cn_parameter
"
"                                WHERE     sdcp_bu = p_bu
"
"                                      AND sdcp_doc_no = p_doc_no
"
"                                      AND sdcp_vou_type = sihd_vou_type
"
"                                      AND sdcp_sub_vou_type = sihd_sub_vou_type
"
"                                      AND sdcp_sel_flg = 'Y')
"
"                       AND EXISTS
"
"                              (SELECT 1
"
"                                 FROM sales_dn_cn_plant
"
"                                WHERE     sdcpnt_bu = p_bu
"
"                                      AND sdcpnt_doc_no = p_doc_no
"
"                                      AND sdcpnt_vou_type = sihd_vou_type
"
"                                      AND sdcpnt_plant = sihd_plant
"
"                                      AND sdcpnt_plnt_loc_id = sihd_plnt_loc_id
"
"                                      AND sdcpnt_sel_flg = 'Y')
"
"                       AND (TRUNC (sihd_inv_date) >= p_from_date
"
"                            OR p_from_date IS NULL)
"
"                       AND (TRUNC (sihd_inv_date) <= p_to_date
"
"                            OR p_to_date IS NULL)
"
"              GROUP BY sihd_bu,
"
"                       sihd_plant,
"
"                       sihd_doc_no,
"
"                       ajh_gl_acct,
"
"                       ajh_gl_acct_desc,
"
"                       sihd_plnt_loc_id);
"
"
"
"      /*Insert Account Wise Sales Details into Temp. table*/
"
"      FORALL rec IN 1 .. r_sira.COUNT
"
"         INSERT INTO sales_dn_cn_acct
"
"              VALUES r_sira (rec);
"
"   /*End Account Wise Sales Details*/
"
"
"
"   END proc_gen_dn_cn_reg;
"
"
"
"END pkg_si_reg;"
/
