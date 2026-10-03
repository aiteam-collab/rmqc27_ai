CREATE OR REPLACE
"PACKAGE BODY pkg_bank_cash_trans
"
"AS
"
"   TYPE t_dist_rows IS TABLE OF bank_trans_dist_ln%ROWTYPE INDEX BY PLS_INTEGER;
"
"   TYPE t_ref_rows  IS TABLE OF bank_trans_ref_det%ROWTYPE INDEX BY PLS_INTEGER;
"
"
"
"   PROCEDURE queue_bank_trans_dist_ln (
"
"      p_rows              IN OUT NOCOPY t_dist_rows,
"
"      p_idx               IN PLS_INTEGER,
"
"
"
"   p_bu               IN business_units.bu_id%TYPE,
"
"   p_ord_pfx          IN bank_trans.btrans_ord_pfx%TYPE,
"
"   p_ord_no           IN bank_trans.btrans_ord_no%TYPE,
"
"   p_seq_no           IN bank_trans_dist_ln.btdln_seq_no%TYPE,
"
"   p_plant            IN bus_unit_plants.bup_plant_id%TYPE,
"
"   p_ref_type         IN bank_trans_dist_ln.btdln_ref_type%TYPE,
"
"   p_acct_plnt        IN gl_lvl_accounts.glal_plant%TYPE,
"
"   p_lvl1             IN gl_lvl_accounts.glal_lvl1%TYPE,
"
"   p_lvl2             IN gl_lvl_accounts.glal_lvl2%TYPE,
"
"   p_lvl3             IN gl_lvl_accounts.glal_lvl3%TYPE,
"
"   p_lvl4             IN gl_lvl_accounts.glal_lvl4%TYPE,
"
"   p_lvl5             IN gl_lvl_accounts.glal_lvl5%TYPE,
"
"   p_lvl6             IN gl_lvl_accounts.glal_lvl6%TYPE,
"
"   p_lvl_prj          IN gl_lvl_accounts.glal_lvl_prj%TYPE,
"
"   p_cc_code          IN gl_lvl_accounts.glal_cc_code%TYPE,
"
"   p_acct             IN gl_lvl_accounts.glal_acct%TYPE,
"
"   p_dist_amt         IN bank_trans_dist_ln.btdln_dist_amt%TYPE,
"
"   p_bc_amt           IN bank_trans_dist_ln.btdln_dist_amt%TYPE,
"
"   p_reference        IN bank_trans_dist_ln.btdln_reference%TYPE,
"
"   p_dr_cr            IN bank_trans_dist_ln.btdln_dr_cr%TYPE,
"
"   p_bfcry_id         IN bank_trans_dist_ln.btdln_bfcry_id%TYPE,
"
"   p_chrg_flag        IN bank_trans_dist_ln.btdln_chrg_flag%TYPE,
"
"   p_src_bfcry_id     IN bank_trans_dist_ln.btdln_src_bfcry_id%TYPE,
"
"   p_curr             IN bank_trans_dist_ln.btdln_curr%TYPE,
"
"   p_ex_rate          IN bank_trans_dist_ln.btln_exrate%TYPE,
"
"   p_asses_val        IN bank_trans_dist_ln.btdln_assess_val%TYPE,
"
"   p_pct              IN bank_trans_dist_ln.btdln_pct%TYPE,
"
"   p_cre_by           IN appl_users.appluser_id%TYPE,
"
"   p_cre_date         IN DATE,
"
"   p_bfcry_type       IN bank_trans_dist_ln.btdln_bfcry_type%TYPE,
"
"   p_lgr_bfcry_id     IN bank_trans_dist_ln.btdln_lgr_bfcry_id%TYPE DEFAULT NULL,
"
"   p_src_bfcry_type   IN bank_trans_dist_ln.btdln_src_bfcry_type%TYPE DEFAULT 'N',
"
"   p_location_id      IN bank_trans_dist_ln.btdln_loc_name%TYPE DEFAULT NULL,
"
"   p_hsn_sac          IN VARCHAR2 DEFAULT NULL,
"
"   p_bfcry_desc       IN VARCHAR2 DEFAULT NULL,
"
"   p_loc_id           IN VARCHAR2 DEFAULT NULL,
"
"   p_tax_assble       IN NUMBER DEFAULT 0,
"
"   p_tax_hsn_code     IN VARCHAR2 DEFAULT NULL,
"
"   p_igst_amt         IN NUMBER DEFAULT 0,
"
"   p_cgst_amt         IN NUMBER DEFAULT 0,
"
"   p_sgst_amt         IN NUMBER DEFAULT 0,
"
"   p_utgst_amt        IN NUMBER DEFAULT 0,
"
"   p_cess_amt         IN NUMBER DEFAULT 0,
"
"   p_cess_pct         IN NUMBER DEFAULT 0,
"
"   p_tax_pct          IN NUMBER DEFAULT 0
"
"   )
"
"   IS
"
"   v_state_code      VARCHAR2(5);
"
"   v_gst_no          VARCHAR2(15);
"
"   v_gst_type        VARCHAR2(1) := 'U';
"
"   v_type            VARCHAR2(2) := 'L';
"
"   v_dairy_type      VARCHAR2(2);
"
"   v_gst_suplr_name  VARCHAR2(150);
"
"BEGIN
"
"   IF p_lgr_bfcry_id IS NOT NULL THEN
"
"       BEGIN
"
"          SELECT ssl_state_code,
"
"                 ssl_gst_no,
"
"                 ssl_gst_type,
"
"                 ssl_type,
"
"                 FUNC_FIND_PARTY_NAME(p_bu,ssl_suplr_id,1)
"
"            INTO v_state_code,
"
"                 v_gst_no,
"
"                 v_gst_type,
"
"                 v_type,
"
"                 v_gst_suplr_name
"
"            FROM suplr_ship_loc
"
"           WHERE ssl_bu = p_bu
"
"             AND ssl_suplr_id = p_lgr_bfcry_id
"
"             AND ssl_dflt_flg IN ('B','S','D')
"
"             AND EXISTS(SELECT 1 FROM SUPPLIERS
"
"                        WHERE SUPLR_BU = p_bu
"
"                          AND SUPLR_SUPLR_ID = ssl_suplr_id
"
"                          AND SUPLR_STATUS = 'A'
"
"                          AND suplr_party_type NOT in ('T','E','V','L','R','U'));
"
"        EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN
"
"              NULL;
"
"            WHEN TOO_MANY_ROWS THEN
"
"              NULL;
"
"        END;
"
"
"
"          BEGIN
"
"             SELECT DECODE(SUPLR_DAIRY_TYPE,'F','F','A','A','R','R','I','I','S')
"
"               INTO v_dairy_type
"
"               FROM suppliers
"
"               WHERE suplr_bu = p_bu
"
"                 AND suplr_suplr_id = p_lgr_bfcry_id;
"
"               EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN
"
"              NULL;
"
"         END;
"
"
"
"    END IF;
"
"
"
"   p_rows(p_idx).btdln_bu := p_bu;
"
"   p_rows(p_idx).btdln_ref_bu := p_bu;
"
"   p_rows(p_idx).btdln_ord_no := p_ord_no;
"
"   p_rows(p_idx).btdln_plant := p_plant;
"
"   p_rows(p_idx).btdln_seq_no := p_seq_no;
"
"   p_rows(p_idx).btdln_ref_type := p_ref_type;
"
"   p_rows(p_idx).btdln_acct_plant := p_acct_plnt;
"
"   p_rows(p_idx).btdln_lvl1 := p_lvl1;
"
"   p_rows(p_idx).btdln_lvl2 := p_lvl2;
"
"   p_rows(p_idx).btdln_lvl3 := p_lvl3;
"
"   p_rows(p_idx).btdln_lvl4 := p_lvl4;
"
"   p_rows(p_idx).btdln_lvl5 := p_lvl5;
"
"   p_rows(p_idx).btdln_lvl6 := p_lvl6;
"
"   p_rows(p_idx).btdln_lvl_prj := p_lvl_prj;
"
"   p_rows(p_idx).btdln_cc_code := p_cc_code;
"
"   p_rows(p_idx).btdln_acct := p_acct;
"
"   p_rows(p_idx).btdln_dist_amt := p_dist_amt;
"
"   p_rows(p_idx).btdln_bc_amt := p_bc_amt;
"
"   p_rows(p_idx).btdln_reference := p_reference;
"
"   p_rows(p_idx).btdln_dr_cr := p_dr_cr;
"
"   p_rows(p_idx).btdln_bfcry_id := p_bfcry_id;
"
"   p_rows(p_idx).btdln_chrg_flag := p_chrg_flag;
"
"   p_rows(p_idx).btdln_src_bfcry_id := p_src_bfcry_id;
"
"   p_rows(p_idx).btdln_bfcry_type := p_src_bfcry_type;
"
"   p_rows(p_idx).btdln_lgr_bfcry_id := p_lgr_bfcry_id;
"
"   p_rows(p_idx).btdln_curr := p_curr;
"
"   p_rows(p_idx).btln_exrate := p_ex_rate;
"
"   p_rows(p_idx).btdln_cre_by := p_cre_by;
"
"   p_rows(p_idx).btdln_cre_date := p_cre_date;
"
"   p_rows(p_idx).btdln_assess_val := p_asses_val;
"
"   p_rows(p_idx).btdln_pct := p_pct;
"
"   p_rows(p_idx).btdln_src_plnt := p_acct_plnt;
"
"   p_rows(p_idx).btdln_src_bfcry_type := p_bfcry_type;
"
"   p_rows(p_idx).btdln_acct_type := func_find_party_acct_type (p_bu,
"
"                                           p_acct,
"
"                                           p_src_bfcry_type,
"
"                                           p_lgr_bfcry_id);
"
"   p_rows(p_idx).btdln_loc_name := p_location_id;
"
"   p_rows(p_idx).btdln_hsn_code := p_hsn_sac;
"
"   p_rows(p_idx).BTDLN_BFCRY_DESC := CASE WHEN p_src_bfcry_type ='E' THEN func_find_employee_desc1(p_bu,p_lgr_bfcry_id,1)--(  SELECT emp_first_name1 FROM employees WHERE emp_bu = p_bu AND emp_emp_id =p_lgr_bfcry_id )
"
"                  ELSE func_find_party_name(p_bu,p_lgr_bfcry_id,1) END;
"
"   p_rows(p_idx).btdln_plnt_loc_id := p_loc_id;
"
"   p_rows(p_idx).btdln_state_code := v_state_code;
"
"   p_rows(p_idx).btdln_gstin_no := v_gst_no;
"
"   p_rows(p_idx).btdln_gst_type := v_gst_type;
"
"   p_rows(p_idx).btdln_suplr_type := v_type;
"
"   p_rows(p_idx).btdln_gst_sulr_name := v_gst_suplr_name;
"
"   p_rows(p_idx).btdln_cess_amt := p_cess_amt;
"
"   p_rows(p_idx).btdln_cess_pct := p_cess_pct;
"
"   p_rows(p_idx).btdln_utgst_amt := p_utgst_amt;
"
"   p_rows(p_idx).btdln_cgst_amt := p_cgst_amt;
"
"   p_rows(p_idx).btdln_sgst_amt := p_sgst_amt;
"
"   p_rows(p_idx).btdln_igst_amt := p_igst_amt;
"
"   p_rows(p_idx).btdln_tax_pct := p_tax_pct;
"
"   p_rows(p_idx).btdln_tax_hsn_code := p_tax_hsn_code;
"
"   p_rows(p_idx).btdln_tax_assess_val := p_dist_amt;
"
"   p_rows(p_idx).btdln_acct_desc := func_find_gl_acct_qry_desc(p_bu,p_acct,1);
"
"   p_rows(p_idx).btdln_cc_desc := func_find_cost_center_qry_desc(p_bu,
"
"                                           p_lvl1,
"
"                                           p_lvl2,
"
"                                           p_lvl3,
"
"                                           p_lvl4,
"
"                                           p_lvl5,
"
"                                           p_lvl6,
"
"                                           p_lvl_prj,
"
"                                           p_acct_plnt,-- p_plant,
"
"                                           p_location_id,
"
"                                           1);
"
"   p_rows(p_idx).btdln_gst_pan_avail := CASE WHEN v_gst_no IS NOT NULL THEN 'W' ELSE 'O' END;
"
"   p_rows(p_idx).btdln_gst_pan_no := CASE WHEN v_gst_no IS NOT NULL THEN SUBSTR(v_gst_no,3,10) ELSE NULL END;
"
"   END queue_bank_trans_dist_ln;
"
"
"
"   PROCEDURE queue_bank_trans_ref_det (
"
"      p_rows              IN OUT NOCOPY t_ref_rows,
"
"      p_idx               IN PLS_INTEGER,
"
"
"
"   p_bu                   VARCHAR2,
"
"   p_ord_pfx              VARCHAR2,
"
"   p_ord_no               VARCHAR2,
"
"   p_plant                VARCHAR2,
"
"   p_seq_no               NUMBER,
"
"   p_sub_seq_no           NUMBER,
"
"   p_doc_date             DATE,
"
"   p_doc_pfx              VARCHAR2,
"
"   p_doc_no               VARCHAR2,
"
"   p_doc_plant            VARCHAR2,
"
"   p_bfcry_type           VARCHAR2,
"
"   p_bfcry_id             VARCHAR2,
"
"   p_due_no               NUMBER,
"
"   p_due_date             DATE,
"
"   p_aged_days            NUMBER,
"
"   p_doc_amt              NUMBER,
"
"   p_trans_amt            NUMBER,
"
"   p_lgr_type             VARCHAR2,
"
"   p_dr_cr                VARCHAR2,
"
"   p_curr                 VARCHAR2,
"
"   p_exrate               NUMBER,
"
"   p_narr                 VARCHAR2,
"
"   p_bill_date            DATE,
"
"   p_bill_no              VARCHAR2,
"
"   p_doc_type             VARCHAR2,
"
"   p_cre_by               VARCHAR2,
"
"   p_cre_date             DATE,
"
"   p_loc_id               VARCHAR2 DEFAULT NULL,
"
"   p_suplr_ref_bu         VARCHAR2 DEFAULT NULL,
"
"   p_suphd_ref_inv_pfx    VARCHAR2 DEFAULT NULL,
"
"   p_suphd_ref_inv_no     VARCHAR2 DEFAULT NULL,
"
"   p_suphd_ref_plnt       VARCHAR2 DEFAULT NULL,
"
"   p_bill_amt             NUMBER DEFAULT NULL,
"
"   p_bill_tax_amt         NUMBER DEFAULT 0,
"
"   p_proj_id              VARCHAR2 DEFAULT NULL,
"
"   p_plnt_loc_id          VARCHAR2 DEFAULT NULL,
"
"   p_pay_adv_flag         VARCHAR2 DEFAULT 'N'
"
"
"
"   )
"
"   IS
"
"BEGIN
"
"   p_rows(p_idx).btr_bu := p_bu;
"
"   p_rows(p_idx).btr_ref_bu := p_bu;
"
"   p_rows(p_idx).btr_ord_no := p_ord_no;
"
"   p_rows(p_idx).btr_plant := p_plant;
"
"   p_rows(p_idx).btr_seq_no := p_seq_no;
"
"   p_rows(p_idx).btr_sub_seq_no := p_sub_seq_no;
"
"   p_rows(p_idx).btr_agnt_ref := 'I';
"
"   p_rows(p_idx).btr_doc_date := p_doc_date;
"
"   p_rows(p_idx).btr_doc_pfx := p_doc_pfx;
"
"   p_rows(p_idx).btr_doc_no := p_doc_no;
"
"   p_rows(p_idx).btr_pct := 0;
"
"   p_rows(p_idx).btr_org_plnt := p_doc_plant;
"
"   p_rows(p_idx).btr_org_bfcry_type := p_bfcry_type;
"
"   p_rows(p_idx).btr_org_bcfry_id := p_bfcry_id;
"
"   p_rows(p_idx).btr_due_no := p_due_no;
"
"   p_rows(p_idx).btr_due_date := p_due_date;
"
"   p_rows(p_idx).btr_aged_days := p_aged_days;
"
"   p_rows(p_idx).btr_doc_amt := p_doc_amt;
"
"   p_rows(p_idx).btr_trans_amt := p_trans_amt;
"
"   p_rows(p_idx).btr_lgr_type := p_lgr_type;
"
"   p_rows(p_idx).btr_dr_cr_type := p_dr_cr;
"
"   p_rows(p_idx).btr_currency := p_curr;
"
"   p_rows(p_idx).btr_exchange_rate := p_exrate;
"
"   p_rows(p_idx).btr_doc_narration := p_narr;
"
"   p_rows(p_idx).btr_bfcry_doc_date := p_bill_date;
"
"   p_rows(p_idx).btr_bfcry_doc_no := p_bill_no;
"
"   p_rows(p_idx).btr_off_bal_amt := p_trans_amt;
"
"   p_rows(p_idx).btr_cre_by := p_cre_by;
"
"   p_rows(p_idx).btr_cre_date := p_cre_date;
"
"   p_rows(p_idx).btr_upd_by := NULL;
"
"   p_rows(p_idx).btr_upd_date := NULL;
"
"   p_rows(p_idx).btr_doc_type := p_doc_type;
"
"   p_rows(p_idx).btr_usn_amt := 0;
"
"   p_rows(p_idx).btr_loc_name := p_loc_id;
"
"   p_rows(p_idx).btr_ref_bill_bu := p_suplr_ref_bu;
"
"   p_rows(p_idx).btr_ref_bill_inv_pfx := p_suphd_ref_inv_pfx;
"
"   p_rows(p_idx).btr_ref_bill_inv_no := p_suphd_ref_inv_no;
"
"   p_rows(p_idx).btr_ref_bill_plnt := p_suphd_ref_plnt;
"
"   p_rows(p_idx).btr_tax_amt := p_bill_tax_amt;
"
"   p_rows(p_idx).btr_proj_id := p_proj_id;
"
"   p_rows(p_idx).btr_tds_assbl_val := p_trans_amt;
"
"   p_rows(p_idx).btr_plnt_loc_id := p_plnt_loc_id;
"
"   p_rows(p_idx).btr_pay_adv_flag := p_pay_adv_flag;
"
"   END queue_bank_trans_ref_det;
"
"
"
"   PROCEDURE flush_bank_trans_dist_ln (p_rows IN OUT NOCOPY t_dist_rows)
"
"   IS
"
"   BEGIN
"
"      IF p_rows.COUNT > 0 THEN
"
"         FORALL i IN INDICES OF p_rows
"
"            INSERT INTO bank_trans_dist_ln (
"
"      btdln_bu,
"
"      btdln_ref_bu,
"
"      btdln_ord_no,
"
"      btdln_plant,
"
"      btdln_seq_no,
"
"      btdln_ref_type,
"
"      btdln_acct_plant,
"
"      btdln_lvl1,
"
"      btdln_lvl2,
"
"      btdln_lvl3,
"
"      btdln_lvl4,
"
"      btdln_lvl5,
"
"      btdln_lvl6,
"
"      btdln_lvl_prj,
"
"      btdln_cc_code,
"
"      btdln_acct,
"
"      btdln_dist_amt,
"
"      btdln_bc_amt,
"
"      btdln_reference,
"
"      btdln_dr_cr,
"
"      btdln_bfcry_id,
"
"      btdln_chrg_flag,
"
"      btdln_src_bfcry_id,
"
"      btdln_bfcry_type,
"
"      btdln_lgr_bfcry_id,
"
"      btdln_curr,
"
"      btln_exrate,
"
"      btdln_cre_by,
"
"      btdln_cre_date,
"
"      btdln_assess_val,
"
"      btdln_pct,
"
"      btdln_src_plnt,
"
"      btdln_src_bfcry_type,
"
"      btdln_acct_type,
"
"      btdln_loc_name,
"
"      btdln_hsn_code,
"
"      BTDLN_BFCRY_DESC,
"
"      btdln_plnt_loc_id,
"
"      btdln_state_code,
"
"      btdln_gstin_no,
"
"      btdln_gst_type,
"
"      btdln_suplr_type,
"
"      btdln_gst_sulr_name,
"
"      btdln_cess_amt,
"
"      btdln_cess_pct,
"
"      btdln_utgst_amt,
"
"      btdln_cgst_amt,
"
"      btdln_sgst_amt,
"
"      btdln_igst_amt,
"
"      btdln_tax_pct,
"
"      btdln_tax_hsn_code,
"
"      btdln_tax_assess_val,
"
"      btdln_acct_desc,
"
"      btdln_cc_desc,
"
"      btdln_gst_pan_avail,
"
"      btdln_gst_pan_no
"
"            )
"
"            VALUES (
"
"      p_rows(i).btdln_bu,
"
"      p_rows(i).btdln_ref_bu,
"
"      p_rows(i).btdln_ord_no,
"
"      p_rows(i).btdln_plant,
"
"      p_rows(i).btdln_seq_no,
"
"      p_rows(i).btdln_ref_type,
"
"      p_rows(i).btdln_acct_plant,
"
"      p_rows(i).btdln_lvl1,
"
"      p_rows(i).btdln_lvl2,
"
"      p_rows(i).btdln_lvl3,
"
"      p_rows(i).btdln_lvl4,
"
"      p_rows(i).btdln_lvl5,
"
"      p_rows(i).btdln_lvl6,
"
"      p_rows(i).btdln_lvl_prj,
"
"      p_rows(i).btdln_cc_code,
"
"      p_rows(i).btdln_acct,
"
"      p_rows(i).btdln_dist_amt,
"
"      p_rows(i).btdln_bc_amt,
"
"      p_rows(i).btdln_reference,
"
"      p_rows(i).btdln_dr_cr,
"
"      p_rows(i).btdln_bfcry_id,
"
"      p_rows(i).btdln_chrg_flag,
"
"      p_rows(i).btdln_src_bfcry_id,
"
"      p_rows(i).btdln_bfcry_type,
"
"      p_rows(i).btdln_lgr_bfcry_id,
"
"      p_rows(i).btdln_curr,
"
"      p_rows(i).btln_exrate,
"
"      p_rows(i).btdln_cre_by,
"
"      p_rows(i).btdln_cre_date,
"
"      p_rows(i).btdln_assess_val,
"
"      p_rows(i).btdln_pct,
"
"      p_rows(i).btdln_src_plnt,
"
"      p_rows(i).btdln_src_bfcry_type,
"
"      p_rows(i).btdln_acct_type,
"
"      p_rows(i).btdln_loc_name,
"
"      p_rows(i).btdln_hsn_code,
"
"      p_rows(i).BTDLN_BFCRY_DESC,
"
"      p_rows(i).btdln_plnt_loc_id,
"
"      p_rows(i).btdln_state_code,
"
"      p_rows(i).btdln_gstin_no,
"
"      p_rows(i).btdln_gst_type,
"
"      p_rows(i).btdln_suplr_type,
"
"      p_rows(i).btdln_gst_sulr_name,
"
"      p_rows(i).btdln_cess_amt,
"
"      p_rows(i).btdln_cess_pct,
"
"      p_rows(i).btdln_utgst_amt,
"
"      p_rows(i).btdln_cgst_amt,
"
"      p_rows(i).btdln_sgst_amt,
"
"      p_rows(i).btdln_igst_amt,
"
"      p_rows(i).btdln_tax_pct,
"
"      p_rows(i).btdln_tax_hsn_code,
"
"      p_rows(i).btdln_tax_assess_val,
"
"      p_rows(i).btdln_acct_desc,
"
"      p_rows(i).btdln_cc_desc,
"
"      p_rows(i).btdln_gst_pan_avail,
"
"      p_rows(i).btdln_gst_pan_no
"
"            );
"
"         p_rows.DELETE;
"
"      END IF;
"
"   END flush_bank_trans_dist_ln;
"
"
"
"   PROCEDURE flush_bank_trans_ref_det (p_rows IN OUT NOCOPY t_ref_rows)
"
"   IS
"
"   BEGIN
"
"      IF p_rows.COUNT > 0 THEN
"
"         FORALL i IN INDICES OF p_rows
"
"            INSERT INTO bank_trans_ref_det (
"
"      btr_bu,
"
"      btr_ref_bu,
"
"      btr_ord_no,
"
"      btr_plant,
"
"      btr_seq_no,
"
"      btr_sub_seq_no,
"
"      btr_agnt_ref,
"
"      btr_doc_date,
"
"      btr_doc_pfx,
"
"      btr_doc_no,
"
"      btr_pct,
"
"      btr_org_plnt,
"
"      btr_org_bfcry_type,
"
"      btr_org_bcfry_id,
"
"      btr_due_no,
"
"      btr_due_date,
"
"      btr_aged_days,
"
"      btr_doc_amt,
"
"      btr_trans_amt,
"
"      btr_lgr_type,
"
"      btr_dr_cr_type,
"
"      btr_currency,
"
"      btr_exchange_rate,
"
"      btr_doc_narration,
"
"      btr_bfcry_doc_date,
"
"      btr_bfcry_doc_no,
"
"      btr_off_bal_amt,
"
"      btr_cre_by,
"
"      btr_cre_date,
"
"      btr_upd_by,
"
"      btr_upd_date,
"
"      btr_doc_type,
"
"      btr_usn_amt,
"
"      btr_loc_name,
"
"      btr_ref_bill_bu,
"
"      btr_ref_bill_inv_pfx,
"
"      btr_ref_bill_inv_no,
"
"      btr_ref_bill_plnt,
"
"      btr_tax_amt,
"
"      btr_proj_id,
"
"      btr_tds_assbl_val,
"
"      btr_plnt_loc_id,
"
"      btr_pay_adv_flag
"
"            )
"
"            VALUES (
"
"      p_rows(i).btr_bu,
"
"      p_rows(i).btr_ref_bu,
"
"      p_rows(i).btr_ord_no,
"
"      p_rows(i).btr_plant,
"
"      p_rows(i).btr_seq_no,
"
"      p_rows(i).btr_sub_seq_no,
"
"      p_rows(i).btr_agnt_ref,
"
"      p_rows(i).btr_doc_date,
"
"      p_rows(i).btr_doc_pfx,
"
"      p_rows(i).btr_doc_no,
"
"      p_rows(i).btr_pct,
"
"      p_rows(i).btr_org_plnt,
"
"      p_rows(i).btr_org_bfcry_type,
"
"      p_rows(i).btr_org_bcfry_id,
"
"      p_rows(i).btr_due_no,
"
"      p_rows(i).btr_due_date,
"
"      p_rows(i).btr_aged_days,
"
"      p_rows(i).btr_doc_amt,
"
"      p_rows(i).btr_trans_amt,
"
"      p_rows(i).btr_lgr_type,
"
"      p_rows(i).btr_dr_cr_type,
"
"      p_rows(i).btr_currency,
"
"      p_rows(i).btr_exchange_rate,
"
"      p_rows(i).btr_doc_narration,
"
"      p_rows(i).btr_bfcry_doc_date,
"
"      p_rows(i).btr_bfcry_doc_no,
"
"      p_rows(i).btr_off_bal_amt,
"
"      p_rows(i).btr_cre_by,
"
"      p_rows(i).btr_cre_date,
"
"      p_rows(i).btr_upd_by,
"
"      p_rows(i).btr_upd_date,
"
"      p_rows(i).btr_doc_type,
"
"      p_rows(i).btr_usn_amt,
"
"      p_rows(i).btr_loc_name,
"
"      p_rows(i).btr_ref_bill_bu,
"
"      p_rows(i).btr_ref_bill_inv_pfx,
"
"      p_rows(i).btr_ref_bill_inv_no,
"
"      p_rows(i).btr_ref_bill_plnt,
"
"      p_rows(i).btr_tax_amt,
"
"      p_rows(i).btr_proj_id,
"
"      p_rows(i).btr_tds_assbl_val,
"
"      p_rows(i).btr_plnt_loc_id,
"
"      p_rows(i).btr_pay_adv_flag
"
"            );
"
"         p_rows.DELETE;
"
"      END IF;
"
"   END flush_bank_trans_ref_det;
"
"
"
"----Create Payables Documents-----
"
"    PROCEDURE proc_cre_pending_payables (
"
"       p_bu            IN     business_units.bu_id%TYPE,
"
"       p_doc_type      IN     VARCHAR2,                 --- BT - BANK, 'CT' - CASH
"
"       p_bank_cash     IN     bank_trans.btrans_bank_id%TYPE,
"
"       p_trans_mode    IN     VARCHAR2, --- P - Payables, R - Receivables,S - Statutory
"
"       p_pay_type      IN     VARCHAR2,                  --- S - Single, M - Merge
"
"       p_bs_lvl        IN     VARCHAR2,                   --- E - Entity, U - Unit
"
"       p_trans_date    IN     DATE,
"
"       p_user          IN     appl_users.appluser_id%TYPE,
"
"       p_ord_no           OUT VARCHAR2,
"
"       p_pay_mode      IN     bank_trans.btrans_pay_mode%TYPE DEFAULT 'T',
"
"       p_fetch_line    IN     VARCHAR2 DEFAULT 'A',
"
"       p_dflt_unit     IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc_id   IN     VARCHAR DEFAULT NULL,
"
"       p_pfx_no           OUT VARCHAR2,
"
"       p_plnt          IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc      IN     VARCHAR2 DEFAULT NULL)
"
"    IS
"
"
"
"      l_dist_rows t_dist_rows;
"
"      l_ref_rows  t_ref_rows;
"
"       v_plnt_loc               bus_unit_plants_loc_dtls.bupld_loc_id%TYPE
"
"                                   := func_find_dflt_plnt_loc (p_bu, p_dflt_unit);
"
"       v_base_curr              VARCHAR2 (5) := func_find_base_currency (p_bu);
"
"       v_apm_prj_req            VARCHAR2 (5) := func_find_apm_prj_req_flag (p_bu);
"
"       v_arm_prj_req            VARCHAR2 (5) := func_find_arm_prj_req_flag (p_bu);
"
"
"
"       /****************** This cursor is for single Payment/Receipt header records **************/
"
"                                                          /* Sub Ledger Concept */
"
"       CURSOR c1
"
"       IS
"
"        WITH suplr_dtls AS (SELECT suplr_bu,suplr_suplr_id FROM suppliers WHERE suplr_bu = p_bu AND suplr_status = 'A'),
"
"             suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code
"
"                              FROM suplr_cust_ledger_vw_rev
"
"                             WHERE glal_bu = p_bu)
"
"            SELECT SUM (db_amt) db_amt,
"
"                   SUM (cr_amt) cr_amt,
"
"                   SUM (db_amt_bc) db_amt_bc,
"
"                   SUM (cr_amt_bc) cr_amt_bc,
"
"                   par_currency,
"
"                   par_suplr_id,
"
"                   par_bfcry_type
"
"              FROM (  SELECT  (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'DR' THEN pdd_pay_amt
"
"                                   ELSE 0
"
"                                END)
"
"                                db_amt,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'CR' THEN pdd_pay_amt
"
"                                   ELSE 0
"
"                                END)
"
"                                cr_amt,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'DR'
"
"                                   THEN
"
"                                      pdd_pay_amt * par_exchange_rate
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                db_amt_bc,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'CR'
"
"                                   THEN
"
"                                      pdd_pay_amt * par_exchange_rate
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                cr_amt_bc,
"
"                             par_currency,
"
"                             par_suplr_id,
"
"                             par_bfcry_type
"
"                        FROM pending_payables_vw_hist_rev,
"
"                             suplr_ldgr,
"
"                             acct_type_codes acct_type_codes_temp,
"
"                             suplr_dtls
"
"                       WHERE     par_bu = glal_bu
"
"                             AND atc_bu = par_bu
"
"                             AND atc_code = par_acct_type
"
"                             AND par_bu = suplr_bu
"
"                             AND ( (    glal_plant = par_plant
"
"                                    AND p_bs_lvl = 'U'
"
"                                    AND glal_party_plant = par_plant)
"
"                                  OR p_bs_lvl = 'E')
"
"                             AND ( (    glal_suplr_id = par_suplr_id
"
"                                    AND suplr_suplr_id = glal_suplr_id
"
"                                    AND par_bfcry_type = 'S')
"
"                                  OR (    glal_cust_id = par_suplr_id
"
"                                      AND suplr_suplr_id = glal_cust_id
"
"                                      AND par_bfcry_type = 'C'))
"
"                             AND ( (par_acct_type IN ('AP', 'AR')
"
"                                    AND par_bfcry_type IN ('S', 'C')
"
"                                    AND gacl_lgr_sub_cls_type IN
"
"                                           ('SAP',
"
"                                            'TDS',
"
"                                            'TCS',
"
"                                            'SVT',
"
"                                            'ESI',
"
"                                            'CASH',
"
"                                            'IMP',
"
"                                            'CAR',
"
"                                            'PF'))
"
"                                  OR (par_acct_type IN ('CAD', 'SAD')
"
"                                      AND par_bfcry_type IN ('S', 'C')
"
"                                      AND gacl_lgr_sub_cls_type IN
"
"                                             ('TDS',
"
"                                              'TCS',
"
"                                              'SVT',
"
"                                              'ESI',
"
"                                              'CASH',
"
"                                              'IMP',
"
"                                              'CAD',
"
"                                              'PF'))
"
"                                  OR (    par_acct_type IN ('SSD')
"
"                                      AND par_bfcry_type IN ('S', 'C')
"
"                                      AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                                  OR ( (par_bfcry_type IN ('S')
"
"                                        AND ( (par_acct_type = 'SAD'
"
"                                               AND ( (gacl_lgr_sub_cls_type IN
"
"                                                         ('SAP', 'CAR')
"
"                                                      AND atc_rqrd_type = 'N')
"
"                                                    OR (gacl_lgr_sub_cls_type IN
"
"                                                           ('SAD', 'CAD')
"
"                                                        AND glac_acct_type_code =
"
"                                                               atc_code
"
"                                                        AND atc_rqrd_type <> 'N')))
"
"                                             OR (par_acct_type = 'SSD'
"
"                                                 AND ( (gacl_lgr_sub_cls_type IN
"
"                                                           ('SAP', 'CAR')
"
"                                                        AND atc_rqrd_type = 'N')
"
"                                                      OR (gacl_lgr_sub_cls_type IN
"
"                                                             ('SSD', 'CSD')
"
"                                                          AND glac_acct_type_code =
"
"                                                                 atc_code
"
"                                                          AND atc_rqrd_type <> 'N'))))
"
"                                        OR (par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                            AND par_acct_type = atc_code
"
"                                            AND atc_sup_cust_type = 'S'
"
"                                            AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                                   AND atc_rqrd_type = 'N')
"
"                                                 OR (atc_rqrd_type <> 'N'
"
"                                                     AND glac_acct_type_code =
"
"                                                            atc_code))))
"
"                                      OR ( (par_bfcry_type IN ('C')
"
"                                            AND ( (par_acct_type = 'CAD'
"
"                                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                                             ('SAP', 'CAR')
"
"                                                          AND atc_rqrd_type = 'N')
"
"                                                        OR (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAD', 'CAD')
"
"                                                            AND glac_acct_type_code =
"
"                                                                   atc_code
"
"                                                            AND atc_rqrd_type <> 'N')))
"
"                                                 OR (par_acct_type = 'CSD'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SSD', 'CSD')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N')))
"
"                                                 OR (par_acct_type = 'EMD'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SEMD', 'CEMD')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N')))
"
"                                                 OR (par_acct_type = 'PBG'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SPBG', 'CPBG')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N')))
"
"                                                 OR (par_acct_type = 'RET'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SRET', 'CRET')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N'))))
"
"                                            OR (par_acct_type NOT IN
"
"                                                   ('AR',
"
"                                                    'CAD',
"
"                                                    'CSD',
"
"                                                    'EMD',
"
"                                                    'PBG',
"
"                                                    'RET')
"
"                                                AND par_acct_type = atc_code
"
"                                                AND atc_sup_cust_type = 'C'
"
"                                                AND ( (gacl_lgr_sub_cls_type IN
"
"                                                          ('CAR')
"
"                                                       AND atc_rqrd_type = 'N')
"
"                                                     OR (atc_rqrd_type <> 'N'
"
"                                                         AND glac_acct_type_code =
"
"                                                                atc_code)))))))
"
"                             AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                             AND par_hold_pay = 'N'
"
"                             AND par_hold_party = 'N'
"
"                             AND pdd_check_flag = 'Y'
"
"                             AND par_status = 'P'
"
"                             AND par_bu = p_bu
"
"                             AND pdd_user = p_user
"
"                             AND p_trans_mode = 'P'
"
"                             AND ( (par_bfcry_type IN ('C', 'S')
"
"                                    AND p_fetch_line IN ('F', 'N'))
"
"                                  OR ( ( (par_bfcry_type IN ('C')
"
"                                          AND par_doc_type IN ('SB', 'SI'))
"
"                                        OR par_bfcry_type IN ('S'))
"
"                                      OR (p_fetch_line = 'A')))
"
"                             AND (p_doc_type = 'BT'
"
"                                  OR (p_doc_type = 'CT'
"
"                                      AND par_currency = v_base_curr)
"
"                                  OR p_doc_type = 'AD')
"
"                    --GROUP BY par_currency, par_suplr_id, par_bfcry_type
"
"                    )
"
"          GROUP BY par_currency, par_suplr_id, par_bfcry_type
"
"            HAVING (SUM (cr_amt) - SUM (db_amt)) > 0;
"
"
"
"       /****************** This cursor is for merge Payment/Receipt header records **************/
"
"       CURSOR c2
"
"       IS
"
"       WITH suplr_dtls AS (SELECT suplr_bu,suplr_suplr_id FROM suppliers WHERE suplr_bu = p_bu AND suplr_status = 'A'),
"
"            suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                  glal_party_plant,glal_plant,glac_acct_type_code
"
"                             FROM suplr_cust_ledger_vw_rev
"
"                            WHERE glal_bu = p_bu)
"
"            SELECT SUM(db_amt)db_amt,SUM(cr_amt)cr_amt,SUM(db_amt_bc)db_amt_bc,SUM(cr_amt_bc)cr_amt_bc,par_currency
"
"              FROM(
"
"            SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency
"
"              FROM pending_payables_vw_hist_rev,
"
"                   suplr_ldgr,
"
"                   acct_type_codes acct_type_codes_temp,
"
"                   suplr_dtls
"
"             WHERE     par_bu = glal_bu
"
"                   AND atc_bu = par_bu
"
"                   AND suplr_bu = par_bu
"
"                   AND atc_code = par_acct_type
"
"                   AND ( (    glal_plant = par_plant
"
"                          AND p_bs_lvl = 'U'
"
"                          AND glal_party_plant = par_plant)
"
"                        OR p_bs_lvl = 'E')
"
"                   AND ( (    glal_suplr_id = par_suplr_id
"
"                          AND suplr_suplr_id = glal_suplr_id
"
"                          AND par_bfcry_type = 'S')
"
"                        OR (    glal_cust_id = par_suplr_id
"
"                            AND suplr_suplr_id = glal_cust_id
"
"                            AND par_bfcry_type = 'C'))
"
"                   AND ( (par_acct_type IN ('AP', 'AR')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND gacl_lgr_sub_cls_type IN
"
"                                 ('SAP',
"
"                                  'TDS',
"
"                                  'TCS',
"
"                                  'SVT',
"
"                                  'ESI',
"
"                                  'CASH',
"
"                                  'IMP',
"
"                                  'CAR',
"
"                                  'PF'))
"
"                        OR (par_acct_type IN ('CAD', 'SAD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN
"
"                                   ('TDS',
"
"                                    'TCS',
"
"                                    'SVT',
"
"                                    'ESI',
"
"                                    'CASH',
"
"                                    'IMP',
"
"                                    'CAD',
"
"                                    'PF'))
"
"                        OR (    par_acct_type IN ('SSD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                        OR ( (par_bfcry_type IN ('S')
"
"                              AND ( (par_acct_type = 'SAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code = atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'SSD'
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
"                                                AND glac_acct_type_code = atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'S'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code))))
"
"                            OR ( (par_bfcry_type IN ('C')
"
"                                  AND ( (par_acct_type = 'CAD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAD', 'CAD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'CSD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SSD', 'CSD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'EMD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SEMD', 'CEMD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'PBG'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SPBG', 'CPBG')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'RET'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SRET', 'CRET')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N'))))
"
"                                  OR (par_acct_type NOT IN
"
"                                         ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                      AND par_acct_type = atc_code
"
"                                      AND atc_sup_cust_type = 'C'
"
"                                      AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                             AND atc_rqrd_type = 'N')
"
"                                           OR (atc_rqrd_type <> 'N'
"
"                                               AND glac_acct_type_code = atc_code)))))))
"
"                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND par_hold_pay = 'N'
"
"                   AND par_hold_party = 'N'
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND p_trans_mode = 'P'
"
"                   AND ( (par_bfcry_type IN ('C', 'S')
"
"                          AND p_fetch_line IN ('F', 'N'))
"
"                        OR ( ( (par_bfcry_type IN ('C')
"
"                                AND par_doc_type IN ('SB', 'SI'))
"
"                              OR par_bfcry_type IN ('S'))
"
"                            OR (p_fetch_line = 'A')))
"
"                   AND (   p_doc_type = 'BT'
"
"                        OR p_doc_type = 'AD'
"
"                        OR (p_doc_type = 'CT' AND par_currency = v_base_curr)))
"
"            GROUP BY par_currency HAVING SUM(db_amt - cr_amt) <> 0;
"
"
"
"       /*********************** This cursor is for  payment / receipt distribution Lines *********/
"
"
"
"       CURSOR c3 (
"
"          c_currency      VARCHAR2,
"
"          c_suplr_id      VARCHAR2,
"
"          c_bfcry_type    VARCHAR2)
"
"       IS
"
"        WITH suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code,
"
"                                   glal_acct,glal_lvl1,glal_lvl2,glal_lvl3,glal_lvl4,glal_lvl5,glal_lvl6,glal_lvl_prj,glal_plnt_loc_id,glal_cc_code
"
"                              FROM suplr_cust_ledger_vw_rev
"
"                             WHERE glal_bu = p_bu),
"
"             profit_cpc AS (SELECT * FROM profit_cost_centers WHERE pcc_bu = p_bu AND pcc_active_flag = 'Y'),
"
"             pendp_hist AS (SELECT * FROM pending_payables_vw_hist_rev
"
"                               WHERE par_bu = p_bu AND (par_sc_bal_amt - par_sc_proc_amt) > 0 AND (pdd_bal_amt - pdd_in_progress) > 0)
"
"            SELECT SUM (db_amt) db_amt,
"
"                   SUM (cr_amt) cr_amt,
"
"                   SUM (db_amt_bc) db_amt_bc,
"
"                   SUM (cr_amt_bc) cr_amt_bc,
"
"                   par_currency,
"
"                   AVG (par_exchange_rate) par_exchange_rate,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   par_acct_type
"
"              FROM(
"
"            SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency,
"
"                   (par_exchange_rate) par_exchange_rate,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   DECODE (p_bs_lvl,
"
"                           'E', v_plnt_loc,
"
"                            (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                      glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   DECODE (p_bs_lvl, 'E', p_dflt_unit, glal_plant) glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   DECODE (atc_rqrd_type, 'S', par_acct_type, NULL) par_acct_type
"
"              FROM pendp_hist,
"
"                   suplr_ldgr,
"
"                   acct_type_codes acct_type_codes_temp
"
"             WHERE     par_bu = glal_bu
"
"                   AND atc_bu = par_bu
"
"                   AND atc_code = par_acct_type
"
"                   AND ( (    glal_plant = par_plant
"
"                          AND p_bs_lvl = 'U'
"
"                          AND glal_party_plant = par_plant)
"
"                        OR p_bs_lvl = 'E')
"
"                   AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                        OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                   AND ( (par_acct_type IN ('AP', 'AR')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND gacl_lgr_sub_cls_type IN
"
"                                 ('SAP',
"
"                                  'TDS',
"
"                                  'TCS',
"
"                                  'SVT',
"
"                                  'ESI',
"
"                                  'CASH',
"
"                                  'IMP',
"
"                                  'CAR',
"
"                                  'PF'))
"
"                        OR (par_acct_type IN ('CAD', 'SAD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN
"
"                                   ('TDS',
"
"                                    'TCS',
"
"                                    'SVT',
"
"                                    'ESI',
"
"                                    'CASH',
"
"                                    'IMP',
"
"                                    'CAD',
"
"                                    'PF'))
"
"                        OR (    par_acct_type IN ('SSD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                        OR ( (par_bfcry_type IN ('S')
"
"                              AND ( (par_acct_type = 'SAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code = atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'SSD'
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
"                                                AND glac_acct_type_code = atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'S'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code))))
"
"                            OR ( (par_bfcry_type IN ('C')
"
"                                  AND ( (par_acct_type = 'CAD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAD', 'CAD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'CSD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SSD', 'CSD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'EMD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SEMD', 'CEMD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'PBG'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SPBG', 'CPBG')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'RET'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SRET', 'CRET')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N'))))
"
"                                  OR (par_acct_type NOT IN
"
"                                         ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                      AND par_acct_type = atc_code
"
"                                      AND atc_sup_cust_type = 'C'
"
"                                      AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                             AND atc_rqrd_type = 'N')
"
"                                           OR (atc_rqrd_type <> 'N'
"
"                                               AND glac_acct_type_code = atc_code)))))))
"
"                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND par_hold_pay = 'N'
"
"                   AND par_hold_party = 'N'
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND par_proj_id IS NOT NULL
"
"                   AND p_trans_mode = 'P'
"
"                   AND ( (par_bfcry_type IN ('C', 'S')
"
"                          AND p_fetch_line IN ('F', 'N'))
"
"                        OR ( ( (par_bfcry_type IN ('C')
"
"                                AND par_doc_type IN ('SB', 'SI'))
"
"                              OR par_bfcry_type IN ('S'))
"
"                            OR (p_fetch_line = 'A')))
"
"                   AND (   p_doc_type = 'BT'
"
"                        OR p_doc_type = 'AD'
"
"                        OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                   AND par_currency = c_currency
"
"                   AND ( ( (par_suplr_id = c_suplr_id OR c_suplr_id IS NULL)
"
"                          AND (par_bfcry_type = c_bfcry_type
"
"                               OR c_bfcry_type IS NULL)
"
"                          AND v_apm_prj_req = 'N'))
"
"            UNION                              /*Project Required - C*/
"
"            SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency,
"
"                   (par_exchange_rate) par_exchange_rate,
"
"                   pcc_ac_lvl1 glal_lvl1,
"
"                   pcc_ac_lvl2 glal_lvl2,
"
"                   pcc_ac_lvl3 glal_lvl3,
"
"                   pcc_ac_lvl4 glal_lvl4,
"
"                   pcc_ac_lvl5 glal_lvl5,
"
"                   pcc_ac_lvl6 glal_lvl6,
"
"                   pcc_ac_lvl_prj glal_lvl_prj,
"
"                   DECODE (p_bs_lvl,
"
"                           'E', v_plnt_loc,
"
"                            (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                      glal_plnt_loc_id,
"
"                   pcc_cc_code glal_cc_code,
"
"                   glal_acct,
"
"                   DECODE (p_bs_lvl, 'E', p_dflt_unit, pcc_ac_plnt) glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   DECODE (atc_rqrd_type, 'S', par_acct_type, NULL) par_acct_type
"
"              FROM pendp_hist,
"
"                   suplr_ldgr,
"
"                   acct_type_codes acct_type_codes_temp,
"
"                   profit_cpc
"
"             WHERE par_bu = glal_bu
"
"               AND atc_bu = par_bu
"
"               AND atc_code = par_acct_type
"
"               AND par_bu = pcc_bu
"
"               AND par_proj_id = pcc_cc_code
"
"               AND pcc_ac_plnt = par_plant
"
"               AND par_plant = pcc_ac_plnt
"
"               AND ( (    glal_plant = par_plant
"
"                      AND p_bs_lvl = 'U'
"
"                      AND glal_party_plant = par_plant)
"
"                    OR p_bs_lvl = 'E')
"
"               AND ( (    glal_suplr_id = par_suplr_id
"
"                      AND par_bfcry_type = 'S'
"
"                      AND v_apm_prj_req = 'C')
"
"                    OR (    glal_cust_id = par_suplr_id
"
"                        AND par_bfcry_type = 'C'
"
"                        AND v_arm_prj_req = 'C'))
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
"                              'CAR',
"
"                              'PF'))
"
"                    OR (par_acct_type IN ('CAD', 'SAD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND gacl_lgr_sub_cls_type IN
"
"                               ('TDS',
"
"                                'TCS',
"
"                                'SVT',
"
"                                'ESI',
"
"                                'CASH',
"
"                                'IMP',
"
"                                'CAD',
"
"                                'PF'))
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
"               AND par_hold_pay = 'N'
"
"               AND par_hold_party = 'N'
"
"               AND pdd_check_flag = 'Y'
"
"               AND par_status = 'P'
"
"               AND par_bu = p_bu
"
"               AND pdd_user = p_user
"
"               AND par_proj_id IS NOT NULL
"
"               AND p_trans_mode = 'P'
"
"               AND ( (par_bfcry_type IN ('C', 'S')
"
"                      AND p_fetch_line IN ('F', 'N'))
"
"                    OR ( ( (par_bfcry_type IN ('C')
"
"                            AND par_doc_type IN ('SB', 'SI'))
"
"                          OR par_bfcry_type IN ('S'))
"
"                        OR (p_fetch_line = 'A')))
"
"               AND (   p_doc_type = 'BT'
"
"                    OR p_doc_type = 'AD'
"
"                    OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"               AND par_currency = c_currency
"
"               AND ( ( (par_suplr_id = c_suplr_id OR c_suplr_id IS NULL)
"
"                      AND (par_bfcry_type = c_bfcry_type
"
"                           OR c_bfcry_type IS NULL))))
"
"          GROUP BY par_currency,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   par_acct_type;
"
"
"
"       /***************** This cursor is for bill details *************************/
"
"
"
"       CURSOR c4 (
"
"          c_plant          VARCHAR2,
"
"          c_lvl1           VARCHAR2,
"
"          c_lvl2           VARCHAR2,
"
"          c_lvl3           VARCHAR2,
"
"          c_lvl4           VARCHAR2,
"
"          c_lvl5           VARCHAR2,
"
"          c_lvl6           VARCHAR2,
"
"          c_lvl_prj        VARCHAR2,
"
"          c_plnt_loc_id    VARCHAR2,
"
"          c_acct           VARCHAR2,
"
"          c_curr           VARCHAR2,
"
"          c_suplr_id       VARCHAR2,
"
"          c_bfcry_type     VARCHAR2,
"
"          c_acct_class     VARCHAR2)
"
"       IS
"
"        WITH suplr_dtls AS (SELECT suplr_bu,suplr_suplr_id,suplr_party_type FROM suppliers WHERE suplr_bu = p_bu AND suplr_status = 'A'),
"
"             suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code,glal_acct,
"
"                                   glal_lvl1,glal_lvl2,glal_lvl3,glal_lvl4,glal_lvl5,glal_lvl6,glal_lvl_prj,glal_plnt_loc_id,glal_cc_code
"
"                              FROM suplr_cust_ledger_vw_rev
"
"                             WHERE glal_bu = p_bu),
"
"             profit_cpc AS (SELECT * FROM profit_cost_centers WHERE pcc_bu = p_bu AND pcc_active_flag = 'Y'),
"
"             acct_type_codes_temp AS (SELECT atc_bu,atc_code,atc_sup_cust_type,atc_rqrd_type FROM acct_type_codes WHERE atc_bu = p_bu)
"
"          SELECT par_doc_date,
"
"                 par_pfx,
"
"                 par_doc_no,
"
"                 DECODE (p_bs_lvl, 'E', p_dflt_unit, par_plant) par_plant,
"
"                 par_bfcry_type,
"
"                 par_suplr_id,
"
"                 pdd_seq_no,
"
"                 pdd_due_date,
"
"                 par_aged_days,
"
"                 pdd_due_amt,
"
"                 pdd_pay_amt,
"
"                 par_acct_type,
"
"                 par_currency,
"
"                 par_exchange_rate,
"
"                 par_suplr_reference,
"
"                 par_suplr_doc_date,
"
"                 par_suplr_doc_no,
"
"                 par_doc_type,
"
"                 par_ref_bu,
"
"                 par_ref_inv_pfx,
"
"                 par_ref_inv_no,
"
"                 par_ref_plnt,
"
"                 par_bill_amt,
"
"                 par_tax_amt,
"
"                 par_dr_cr,
"
"                 par_proj_id,
"
"                 DECODE (p_bs_lvl,
"
"                         'E', v_plnt_loc,
"
"                         (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                    par_plnt_loc_id,
"
"                 par_loc_name
"
"            FROM pending_payables_vw_hist_rev,
"
"                 suplr_ldgr,
"
"                 acct_type_codes_temp,
"
"                 suplr_dtls
"
"           WHERE     par_bu = glal_bu
"
"                 AND atc_bu = par_bu
"
"                 AND suplr_bu = par_bu
"
"                 AND atc_code = par_acct_type
"
"                 AND (par_acct_type = c_acct_class OR c_acct_class IS NULL)
"
"                 AND ( (    glal_plant = par_plant
"
"                        AND p_bs_lvl = 'U'
"
"                        AND glal_party_plant = par_plant)
"
"                      OR p_bs_lvl = 'E')
"
"                 AND ( (    glal_suplr_id = par_suplr_id
"
"                        AND suplr_suplr_id = glal_suplr_id
"
"                        AND par_bfcry_type = 'S')
"
"                      OR (    glal_cust_id = par_suplr_id
"
"                          AND suplr_suplr_id = glal_cust_id
"
"                          AND par_bfcry_type = 'C'))
"
"                 AND ( (par_acct_type IN ('AP', 'AR')
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
"                                        ('SAP',
"
"                                         'TDS',
"
"                                         'TCS',
"
"                                         'SVT',
"
"                                         'ESI',
"
"                                         'CASH',
"
"                                         'CAR',
"
"                                         'PF'))))
"
"                      OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND ( (suplr_party_type = 'I'
"
"                                   AND gacl_lgr_sub_cls_type = 'IMP')
"
"                                 OR (suplr_party_type = 'P'
"
"                                     AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                                 OR (suplr_party_type NOT IN ('P', 'I')
"
"                                     AND gacl_lgr_sub_cls_type IN
"
"                                            ('TDS',
"
"                                             'TCS',
"
"                                             'SVT',
"
"                                             'ESI',
"
"                                             'CASH',
"
"                                             'IMP',
"
"                                             'CAD',
"
"                                             'PF')))))
"
"                      OR (    par_acct_type IN ('SSD')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                      OR ( (par_bfcry_type IN ('S')
"
"                            AND ( (par_acct_type = 'SAD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SAD', 'CAD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'SSD'
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
"                                              AND glac_acct_type_code = atc_code
"
"                                              AND atc_rqrd_type <> 'N'))))
"
"                            OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                AND par_acct_type = atc_code
"
"                                AND atc_sup_cust_type = 'S'
"
"                                AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                       AND atc_rqrd_type = 'N')
"
"                                     OR (atc_rqrd_type <> 'N'
"
"                                         AND glac_acct_type_code = atc_code))))
"
"                          OR ( (par_bfcry_type IN ('C')
"
"                                AND ( (par_acct_type = 'CAD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAD', 'CAD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'CSD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SSD', 'CSD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'EMD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SEMD', 'CEMD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'PBG'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SPBG', 'CPBG')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'RET'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SRET', 'CRET')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N'))))
"
"                                OR (par_acct_type NOT IN
"
"                                       ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                    AND par_acct_type = atc_code
"
"                                    AND atc_sup_cust_type = 'C'
"
"                                    AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                           AND atc_rqrd_type = 'N')
"
"                                         OR (atc_rqrd_type <> 'N'
"
"                                             AND glac_acct_type_code = atc_code)))))))
"
"                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                 AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                 AND par_hold_pay = 'N'
"
"                 AND par_hold_party = 'N'
"
"                 AND pdd_check_flag = 'Y'
"
"                 AND par_status = 'P'
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 -- AND par_proj_id IS NULL
"
"                 AND p_trans_mode = 'P'
"
"                 AND ( (par_bfcry_type IN ('C', 'S')
"
"                        AND p_fetch_line IN ('F', 'N'))
"
"                      OR ( ( (par_bfcry_type IN ('C')
"
"                              AND par_doc_type IN ('SB', 'SI'))
"
"                            OR par_bfcry_type IN ('S'))
"
"                          OR (p_fetch_line = 'A')))
"
"                 AND (   p_doc_type = 'BT'
"
"                      OR p_doc_type = 'AD'
"
"                      OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND par_suplr_id = c_suplr_id
"
"                 AND par_bfcry_type = c_bfcry_type
"
"                 AND ( (v_apm_prj_req = 'N' AND c_bfcry_type = 'S')
"
"                      OR (v_arm_prj_req = 'N' AND c_bfcry_type = 'C'))
"
"                 AND glal_plant = c_plant
"
"                 AND glal_lvl1 = c_lvl1
"
"                 AND glal_lvl2 = c_lvl2
"
"                 AND glal_lvl3 = c_lvl3
"
"                 AND glal_lvl4 = c_lvl4
"
"                 AND glal_lvl5 = c_lvl5
"
"                 AND glal_lvl6 = c_lvl6
"
"                 AND glal_lvl_prj = c_lvl_prj
"
"                 --AND par_plnt_loc_id = c_plnt_loc_id
"
"                 AND glal_acct = c_acct
"
"                 AND par_currency = c_curr
"
"          UNION --ALL                                      /* Project Required - C*/
"
"          SELECT par_doc_date,
"
"                 par_pfx,
"
"                 par_doc_no,
"
"                 DECODE (p_bs_lvl, 'E', p_dflt_unit, par_plant) par_plant,
"
"                 par_bfcry_type,
"
"                 par_suplr_id,
"
"                 pdd_seq_no,
"
"                 pdd_due_date,
"
"                 par_aged_days,
"
"                 pdd_due_amt,
"
"                 pdd_pay_amt,
"
"                 par_acct_type,
"
"                 par_currency,
"
"                 par_exchange_rate,
"
"                 par_suplr_reference,
"
"                 par_suplr_doc_date,
"
"                 par_suplr_doc_no,
"
"                 par_doc_type,
"
"                 --par_doc_mode,
"
"                 --par_loc_id,
"
"                 par_ref_bu,
"
"                 par_ref_inv_pfx,
"
"                 par_ref_inv_no,
"
"                 par_ref_plnt,
"
"                 par_bill_amt,
"
"                 par_tax_amt,
"
"                 par_dr_cr,
"
"                 par_proj_id,
"
"                 DECODE (p_bs_lvl,
"
"                         'E', v_plnt_loc,
"
"                         (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                    par_plnt_loc_id,
"
"                 par_loc_name
"
"            FROM pending_payables_vw_hist_rev,
"
"                 suplr_ldgr,
"
"                 acct_type_codes_temp,
"
"                 profit_cpc,
"
"                 suplr_dtls
"
"           WHERE     par_bu = glal_bu
"
"                 AND atc_bu = par_bu
"
"                 AND atc_bu = suplr_bu
"
"                 AND atc_code = par_acct_type
"
"                 AND (par_acct_type = c_acct_class OR c_acct_class IS NULL)
"
"                 AND par_bu = pcc_bu
"
"                 AND par_proj_id = pcc_cc_code
"
"                 AND par_plant = pcc_ac_plnt
"
"                 AND ( (    glal_plant = par_plant
"
"                        AND p_bs_lvl = 'U'
"
"                        AND glal_party_plant = par_plant)
"
"                      OR p_bs_lvl = 'E')
"
"                 AND ( (    glal_suplr_id = par_suplr_id
"
"                        AND suplr_suplr_id = glal_suplr_id
"
"                        AND par_bfcry_type = 'S'
"
"                        AND v_apm_prj_req = 'C')
"
"                      OR (    glal_cust_id = par_suplr_id
"
"                          AND suplr_suplr_id = glal_cust_id
"
"                          AND par_bfcry_type = 'C'
"
"                          AND v_arm_prj_req = 'C'))
"
"                 AND ( (par_acct_type IN ('AP', 'AR')
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
"                                        ('SAP',
"
"                                         'TDS',
"
"                                         'TCS',
"
"                                         'SVT',
"
"                                         'ESI',
"
"                                         'CASH',
"
"                                         'CAR',
"
"                                         'PF'))))
"
"                      OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND ( (suplr_party_type = 'I'
"
"                                   AND gacl_lgr_sub_cls_type = 'IMP')
"
"                                 OR (suplr_party_type = 'P'
"
"                                     AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                                 OR (suplr_party_type NOT IN ('P', 'I')
"
"                                     AND gacl_lgr_sub_cls_type IN
"
"                                            ('TDS',
"
"                                             'TCS',
"
"                                             'SVT',
"
"                                             'ESI',
"
"                                             'CASH',
"
"                                             'IMP',
"
"                                             'CAD',
"
"                                             'PF')))))
"
"                      OR (    par_acct_type IN ('SSD')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                      OR ( (par_bfcry_type IN ('S')
"
"                            AND ( (par_acct_type = 'SAD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SAD', 'CAD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'SSD'
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
"                                              AND glac_acct_type_code = atc_code
"
"                                              AND atc_rqrd_type <> 'N'))))
"
"                            OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                AND par_acct_type = atc_code
"
"                                AND atc_sup_cust_type = 'S'
"
"                                AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                       AND atc_rqrd_type = 'N')
"
"                                     OR (atc_rqrd_type <> 'N'
"
"                                         AND glac_acct_type_code = atc_code))))
"
"                          OR ( (par_bfcry_type IN ('C')
"
"                                AND ( (par_acct_type = 'CAD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAD', 'CAD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'CSD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SSD', 'CSD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'EMD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SEMD', 'CEMD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'PBG'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SPBG', 'CPBG')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'RET'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SRET', 'CRET')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N'))))
"
"                                OR (par_acct_type NOT IN
"
"                                       ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                    AND par_acct_type = atc_code
"
"                                    AND atc_sup_cust_type = 'C'
"
"                                    AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                           AND atc_rqrd_type = 'N')
"
"                                         OR (atc_rqrd_type <> 'N'
"
"                                             AND glac_acct_type_code = atc_code)))))))
"
"                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                 AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                 AND par_hold_pay = 'N'
"
"                 AND par_hold_party = 'N'
"
"                 AND pdd_check_flag = 'Y'
"
"                 AND par_status = 'P'
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND p_trans_mode = 'P'
"
"                 AND ( (par_bfcry_type IN ('C', 'S')
"
"                        AND p_fetch_line IN ('F', 'N'))
"
"                      OR ( ( (par_bfcry_type IN ('C')
"
"                              AND par_doc_type IN ('SB', 'SI'))
"
"                            OR par_bfcry_type IN ('S'))
"
"                          OR (p_fetch_line = 'A')))
"
"                 AND (   p_doc_type = 'BT'
"
"                      OR p_doc_type = 'AD'
"
"                      OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND par_suplr_id = c_suplr_id
"
"                 AND par_bfcry_type = c_bfcry_type
"
"                 AND pcc_ac_plnt = c_plant
"
"                 AND pcc_ac_lvl1 = c_lvl1
"
"                 AND pcc_ac_lvl2 = c_lvl2
"
"                 AND pcc_ac_lvl3 = c_lvl3
"
"                 AND pcc_ac_lvl4 = c_lvl4
"
"                 AND pcc_ac_lvl5 = c_lvl5
"
"                 AND pcc_ac_lvl6 = c_lvl6
"
"                 AND pcc_ac_lvl_prj = c_lvl_prj
"
"                 AND glal_acct = c_acct
"
"                 AND par_currency = c_curr;
"
"
"
"       CURSOR c5 (c_vou_pfx VARCHAR2, c_vou_no VARCHAR2)
"
"       IS
"
"          SELECT *
"
"            FROM bank_trans_dist_ln
"
"           WHERE btdln_bu = p_bu --   AND btdln_ord_pfx = c_vou_pfx
"
"                 AND btdln_ord_no = c_vou_no AND btdln_dist_amt = 0;
"
"
"
"       CURSOR c6 (
"
"          c_bfcry_type    VARCHAR2,
"
"          c_bfcry_id      VARCHAR2)
"
"       IS
"
"          SELECT spbd_pay_acct_type,
"
"                 spbd_bank_acc_no,
"
"                 spbd_bank_ifsc_code,
"
"                 spbd_pay_bank_name,
"
"                 spbd_branch_desc,
"
"                 spbd_pay_to_name
"
"            FROM suplr_pay_bank_dtls
"
"           WHERE     spbd_bu = p_bu
"
"                 AND c_bfcry_type = 'S'
"
"                 AND spbd_suplr_id = c_bfcry_id
"
"                 AND spbd_dflt_flag = 'Y'
"
"          UNION ALL
"
"          SELECT spbd_pay_acct_type,
"
"                 spbd_bank_acc_no,
"
"                 spbd_bank_ifsc_code,
"
"                 spbd_pay_bank_name,
"
"                 spbd_branch_desc,
"
"                 spbd_pay_to_name
"
"            FROM suplr_pay_bank_dtls
"
"           WHERE spbd_bu = p_bu
"
"             AND c_bfcry_type = 'C'
"
"             AND spbd_suplr_id = c_bfcry_id
"
"             AND spbd_dflt_flag = 'Y';
"
"
"
"       CURSOR c7 (c_bfcry_id VARCHAR2)
"
"       IS
"
"          SELECT suplr_collect_id,
"
"                 suplr_route_id,
"
"                 suplr_dairy_can_id,
"
"                 suplr_party_type,
"
"                 suplr_dairy_type
"
"            FROM suppliers
"
"           WHERE suplr_bu = p_bu AND suplr_suplr_id = c_bfcry_id;
"
"
"
"       cr6                      c6%ROWTYPE;
"
"       cr7                      c7%ROWTYPE;
"
"       v_first_no               VARCHAR2 (1000);
"
"       v_bank_curcy             VARCHAR2 (5);
"
"       v_base_curcy             VARCHAR2 (5);
"
"       v_pfx                    VARCHAR2 (5) := NULL;
"
"       v_pfx_no                 VARCHAR2 (30) := NULL;
"
"       v_bank_unit              VARCHAR2 (20);
"
"       v_dr_cr                  VARCHAR2 (2);
"
"       v_chq_no                 bank_check_book_ln.bcbln_chq_no%TYPE;
"
"       v_bank_loc               banks.bank_plnt_loc_id%TYPE;
"
"       v_forwd_contrct_exrate   exc_contr_hd.ech_fc_ex_rate%TYPE;
"
"       v_ln_seq_no              bank_trans_dist_ln.btdln_seq_no%TYPE;
"
"       v_grn_refer              suplr_doc_hd_hist.suphdh_grn_refer%TYPE;
"
"       v_bank_ex_rate           NUMBER;
"
"       v_trans_ex_rate          NUMBER;
"
"    BEGIN
"
"
"
"       v_base_curcy := func_find_base_currency (p_bu);
"
"
"
"       IF p_doc_type = 'BT'
"
"       THEN
"
"          v_bank_curcy := func_find_bank_currency (p_bu, p_bank_cash);
"
"          v_bank_unit := func_find_bank_unit (p_bu, p_bank_cash);
"
"          v_bank_loc := func_find_bank_loc (p_bu, p_bank_cash);
"
"       ELSIF p_doc_type = 'CT'
"
"       THEN
"
"          v_bank_curcy := v_base_curcy;
"
"          v_bank_unit := func_find_cash_unit (p_bu, p_bank_cash);
"
"          v_bank_loc := func_find_cash_loc (p_bu, p_bank_cash);
"
"       ELSIF p_doc_type = 'AD'
"
"       THEN
"
"          v_bank_curcy := func_find_base_currency (p_bu);
"
"       END IF;
"
"
"
"       v_bank_ex_rate :=
"
"          func_find_exchange_rate (p_bu,
"
"                                   v_bank_curcy,
"
"                                   v_base_curcy,
"
"                                   p_trans_date,
"
"                                   'PO');
"
"
"
"       /* PAYMENT PROCESS STARTS HERE */
"
"       IF p_trans_mode IN ('P', 'S')
"
"       THEN
"
"          /* Bank Payment */
"
"          IF p_doc_type = 'BT'
"
"          THEN
"
"             /* Single Payment */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'P',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      v_chq_no := func_find_next_chq_num (p_bu, p_bank_cash, 1);
"
"                   ELSE
"
"                      v_chq_no := NULL;
"
"                   END IF;
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt),
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'BPV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      proc_upd_chq_no (p_bu,
"
"                                       v_pfx,
"
"                                       v_pfx_no,
"
"                                       p_bank_cash,
"
"                                       v_chq_no,
"
"                                       p_trans_date,
"
"                                       NULL,
"
"                                       ABS (cr1.cr_amt - cr1.db_amt),
"
"                                       'PAYMENT AGAINST ',
"
"                                       'N',
"
"                                       p_user,
"
"                                       SYSDATE,
"
"                                       1);
"
"                   END IF;
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'DR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         v_ln_seq_no := c3%ROWCOUNT;
"
"                         v_forwd_contrct_exrate :=
"
"                            func_find_frwd_cntrct_exrate (p_bu,
"
"                                                          p_bank_cash,
"
"                                                          cr4.par_suplr_id,
"
"                                                          cr4.par_suplr_doc_no,
"
"                                                          cr4.par_suplr_doc_date,
"
"                                                          cr4.par_currency,
"
"                                                          cr4.pdd_pay_amt,
"
"                                                          v_bank_curcy,
"
"                                                          v_base_curcy,
"
"                                                          p_trans_date,
"
"                                                          cr4.par_pfx,
"
"                                                          cr4.par_doc_no,
"
"                                                          cr4.par_exchange_rate);
"
"                         --proc_debug_proc(v_forwd_contrct_exrate||' v_forwd_contrct_exrate');
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            --v_forwd_contrct_exrate,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END ,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE     sddh_bu = p_bu
"
"                                AND sddh_doc_no = cr4.par_doc_no
"
"                                AND sddh_seq_no = cr4.pdd_seq_no;
"
"
"
"                         UPDATE bank_trans
"
"                            SET btrans_trans_base_exrate = v_forwd_contrct_exrate,
"
"                                btrans_trans_base_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate,
"
"                                btrans_trans_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate,
"
"                                btrans_bank_rgl_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate
"
"                          WHERE btrans_bu = p_bu
"
"                            AND btrans_ord_pfx = v_pfx
"
"                            AND btrans_ord_no = v_pfx_no;
"
"
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BPV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                      proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                            WHERE btr_bu = p_bu
"
"							  AND btr_ord_no = cr5.btdln_ord_no
"
"							  AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                            WHERE btdln_bu = p_bu
"
"							  AND btdln_ord_no = cr5.btdln_ord_no
"
"							  AND btdln_seq_no = cr5.btdln_seq_no;
"
"
"
"                   END LOOP;
"
"                     proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"
"
"                END LOOP;
"
"             /* MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'P',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      v_chq_no := func_find_next_chq_num (p_bu, p_bank_cash, 1);
"
"                   ELSE
"
"                      v_chq_no := NULL;
"
"                   END IF;
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt),
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'BPV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      proc_upd_chq_no (p_bu,
"
"                                       v_pfx,
"
"                                       v_pfx_no,
"
"                                       p_bank_cash,
"
"                                       v_chq_no,
"
"                                       p_trans_date,
"
"                                       NULL,
"
"                                       ABS (cr2.cr_amt - cr2.db_amt),
"
"                                       'PAYMENT AGAINST ',
"
"                                       'N',
"
"                                       p_user,
"
"                                       SYSDATE,
"
"                                       1);
"
"                   END IF;
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         -- 1,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"							AND sddh_doc_no = cr4.par_doc_no
"
"							AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BPV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                      proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"					     AND btr_ord_no = cr5.btdln_ord_no
"
"						 AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no, p_user);
"
"                END LOOP;
"
"             END IF;
"
"          /*ADVICE */
"
"          ELSIF p_doc_type = 'AD'
"
"          THEN
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_dflt_pfx (p_bu,
"
"                                          p_dflt_unit,
"
"                                          p_user,
"
"                                          'PA',
"
"                                          'FIN');
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      p_dflt_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      'T',
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt),
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'PA',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => p_plnt_loc_id);
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         p_dflt_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'DR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         v_ln_seq_no := c3%ROWCOUNT;
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            p_dflt_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            --v_forwd_contrct_exrate,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"
"
"                      END LOOP;
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                   flush_bank_trans_dist_ln (l_dist_rows);
"
"                   flush_bank_trans_ref_det (l_ref_rows);
"
"END LOOP;
"
"             /* MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_dflt_pfx (p_bu,
"
"                                          p_plnt,
"
"                                          p_user,
"
"                                          'PA',
"
"                                          'FIN');
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      p_plnt,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt),
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'PA',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => p_plnt_loc);
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         p_plnt,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         -- 1,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            p_plnt,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                flush_bank_trans_dist_ln (l_dist_rows);
"
"                flush_bank_trans_ref_det (l_ref_rows);
"
"          END LOOP;
"
"             END IF;
"
"          /* CASH PAYMENT */
"
"          ELSIF p_doc_type = 'CT'
"
"          THEN
"
"             /* SINGLE CASH PAYMENT*/
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   IF cr1.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'P',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c1%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr1.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         'P',
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr1.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt),
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'PAYMENT AGAINST ',
"
"                         'CPV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3
"
"                         IN c3 (cr1.par_currency,
"
"                                cr1.par_suplr_id,
"
"                                cr1.par_bfcry_type)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.cr_amt - cr3.db_amt),
"
"                            ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,                                       --'DR',
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'S',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CPV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"
"
"                         proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* CASH MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   IF cr2.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'P',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c2%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr2.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         'P',
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr2.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt),
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'PAYMENT AGAINST ',
"
"                         'CPV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                      LOOP
"
"                         --raise_application_error(-20999,'HRM');
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.cr_amt - cr3.db_amt),
"
"                            ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'S',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               TO_NUMBER (c3%ROWCOUNT),
"
"                               TO_NUMBER (c4%ROWCOUNT),
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CPV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            TO_NUMBER (c3%ROWCOUNT),
"
"                                            p_user,
"
"                                            1);
"
"						proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"
"
"             END IF;
"
"          END IF;
"
"       /* PAYMENT PROCESS ENDS  HERE */
"
"
"
"       /* RECEIPT  PROCESS STARTS HERE */
"
"       ELSIF p_trans_mode = 'R'
"
"       THEN
"
"          IF p_doc_type = 'BT'
"
"          THEN
"
"             /* Single Receipt */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'R',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      p_trans_mode,
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt),
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'RECEIPT AGAINST INVOICES',
"
"                      'BRV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.db_amt - cr3.cr_amt),
"
"                         ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'CR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr3.par_bfcry_type,
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BRV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"					  proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* MERGE RECEIPT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'R',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_bank_curcy||'~'||v_base_curcy||'~'||p_trans_date||'~'||cr2.par_currency);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      p_trans_mode,
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt),
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'RECEIPT AGAINST INVOICES',
"
"                      'BRV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.db_amt - cr3.cr_amt),
"
"                         ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr3.par_bfcry_type,
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BRV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"					  proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             END IF;
"
"          /* CASH RECEIPT */
"
"          ELSIF p_doc_type = 'CT'
"
"          THEN
"
"             /* SINGLE CASH RECEIPT*/
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"
"
"                   IF cr1.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'R',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"
"
"                      IF c1%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr1.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         p_trans_mode,
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr1.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_bank_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt),
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'RECEIPT AGAINST ',
"
"                         'CRV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3
"
"                         IN c3 (cr1.par_currency,
"
"                                cr1.par_suplr_id,
"
"                                cr1.par_bfcry_type)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.db_amt - cr3.cr_amt),
"
"                            ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,                                       --'CR',
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'C',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CRV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"						 proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                     proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* CASH MERGE RECEIPT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   IF cr2.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'R',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c2%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr2.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         p_trans_mode,
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr2.par_currency,
"
"                         v_base_curcy,
"
"                         v_trans_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt),
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'RECEIPT AGAINST ',
"
"                         'CRV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.db_amt - cr3.cr_amt),
"
"                            ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'C',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE     sddh_bu = p_bu
"
"                                   --   AND sddh_pfx = cr4.par_pfx
"
"                                   AND sddh_doc_no = cr4.par_doc_no
"
"                                   AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CRV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"						 proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                            WHERE     btr_bu = p_bu
"
"                                  --   AND btr_ord_pfx = cr5.btdln_ord_pfx
"
"                                  AND btr_ord_no = cr5.btdln_ord_no
"
"                                  AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                            WHERE     btdln_bu = p_bu
"
"                                  --   AND btdln_ord_pfx = cr5.btdln_ord_pfx
"
"                                  AND btdln_ord_no = cr5.btdln_ord_no
"
"                                  AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,
"
"                                                          v_pfx,
"
"                                                          v_pfx_no,
"
"                                                          p_user);
"
"                END LOOP;
"
"             END IF;
"
"          END IF;
"
"       END IF;
"
"
"
"       /* RECEIPT  PROCESS ENDS HERE */
"
"       IF v_pfx || v_pfx_no IS NOT NULL
"
"       THEN
"
"          IF v_first_no = v_pfx_no
"
"          THEN
"
"             p_ord_no := '-' || v_first_no;
"
"          ELSE
"
"             p_ord_no := ' from ' || v_first_no || ' to ' || v_pfx_no;
"
"          END IF;
"
"       ELSIF v_pfx || v_pfx_no IS NULL
"
"       THEN
"
"          p_ord_no := 'NO_DOC';
"
"       END IF;
"
"
"
"       p_pfx_no := v_pfx || v_pfx_no;
"
"    END;
"
"    ----Create Statutory Documents-----
"
"    PROCEDURE proc_cre_pending_statoury (
"
"       p_bu            IN     business_units.bu_id%TYPE,
"
"       p_doc_type      IN     VARCHAR2,                 --- BT - BANK, 'CT' - CASH
"
"       p_bank_cash     IN     bank_trans.btrans_bank_id%TYPE,
"
"       p_trans_mode    IN     VARCHAR2, --- P - Payables, R - Receivables,S - Statutory
"
"       p_pay_type      IN     VARCHAR2,                  --- S - Single, M - Merge
"
"       p_bs_lvl        IN     VARCHAR2,                   --- E - Entity, U - Unit
"
"       p_trans_date    IN     DATE,
"
"       p_user          IN     appl_users.appluser_id%TYPE,
"
"       p_ord_no           OUT VARCHAR2,
"
"       p_pay_mode      IN     bank_trans.btrans_pay_mode%TYPE DEFAULT 'T',
"
"       p_fetch_line    IN     VARCHAR2 DEFAULT 'A',
"
"       p_dflt_unit     IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc_id   IN     VARCHAR DEFAULT NULL,
"
"       p_pfx_no           OUT VARCHAR2,
"
"       p_plnt          IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc      IN     VARCHAR2 DEFAULT NULL)
"
"    IS
"
"
"
"      l_dist_rows t_dist_rows;
"
"      l_ref_rows  t_ref_rows;
"
"       v_plnt_loc               bus_unit_plants_loc_dtls.bupld_loc_id%TYPE
"
"                                   := func_find_dflt_plnt_loc (p_bu, p_dflt_unit);
"
"       v_base_curr              VARCHAR2 (5) := func_find_base_currency (p_bu);
"
"       v_apm_prj_req            VARCHAR2 (5) := func_find_apm_prj_req_flag (p_bu);
"
"       v_arm_prj_req            VARCHAR2 (5) := func_find_arm_prj_req_flag (p_bu);
"
"
"
"       /****************** This cursor is for single Payment/Receipt header records **************/
"
"                                                          /* Sub Ledger Concept */
"
"       CURSOR c1
"
"       IS
"
"        WITH suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code
"
"                              FROM suplr_cust_ledger_vw_rev
"
"                             WHERE glal_bu = p_bu)
"
"            SELECT SUM (db_amt) db_amt,
"
"                   SUM (cr_amt) cr_amt,
"
"                   SUM (db_amt_bc) db_amt_bc,
"
"                   SUM (cr_amt_bc) cr_amt_bc,
"
"                   par_currency,
"
"                   par_suplr_id,
"
"                   par_bfcry_type
"
"              FROM (  SELECT  (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'DR' THEN pdd_pay_amt
"
"                                   ELSE 0
"
"                                END)
"
"                                db_amt,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'CR' THEN pdd_pay_amt
"
"                                   ELSE 0
"
"                                END)
"
"                                cr_amt,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'DR'
"
"                                   THEN
"
"                                      pdd_pay_amt * par_exchange_rate
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                db_amt_bc,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'CR'
"
"                                   THEN
"
"                                      pdd_pay_amt * par_exchange_rate
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                cr_amt_bc,
"
"                             par_currency,
"
"                             par_bfcry_type,
"
"                             par_suplr_id
"
"                        FROM pending_payables_stat_vw_hist, suplr_ldgr
"
"                       WHERE par_bu = glal_bu
"
"                             AND ( (    glal_plant = par_plant
"
"                                    AND p_bs_lvl = 'U'
"
"                                    AND glal_party_plant = par_plant)
"
"                                  OR (p_bs_lvl = 'E'))
"
"                             AND ( (glal_suplr_id = par_suplr_id
"
"                                    AND par_bfcry_type = 'S')
"
"                                  OR (glal_cust_id = par_suplr_id
"
"                                      AND par_bfcry_type = 'C'))
"
"                             AND gacl_lgr_sub_cls_type IN
"
"                                    ('TDS', 'TCS', 'SVT', 'ESI', 'PF')
"
"                             AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                             AND pdd_check_flag = 'Y'
"
"                             AND par_status = 'P'
"
"                             AND par_bu = p_bu
"
"                             AND pdd_user = p_user
"
"                             AND p_trans_mode = 'S'
"
"                             AND (p_doc_type = 'BT'
"
"                                  OR (p_doc_type = 'CT'
"
"                                      AND par_currency = v_base_curr)
"
"                                  OR p_doc_type = 'AD')
"
"                    )
"
"          GROUP BY par_currency, par_suplr_id, par_bfcry_type
"
"            HAVING (SUM (cr_amt) - SUM (db_amt)) > 0;
"
"
"
"       /****************** This cursor is for merge Payment/Receipt header records **************/
"
"       CURSOR c2
"
"       IS
"
"       WITH suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                  glal_party_plant,glal_plant,glac_acct_type_code
"
"                             FROM suplr_cust_ledger_vw_rev WHERE glal_bu = p_bu)
"
"            SELECT SUM(db_amt)db_amt,SUM(cr_amt)cr_amt,SUM(db_amt_bc)db_amt_bc,SUM(cr_amt_bc)cr_amt_bc,par_currency
"
"              FROM(SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency
"
"              FROM pending_payables_stat_vw_hist, suplr_ldgr
"
"             WHERE par_bu = glal_bu
"
"                   AND ( (    glal_plant = par_plant
"
"                          AND p_bs_lvl = 'U'
"
"                          AND glal_party_plant = par_plant)
"
"                        OR (p_bs_lvl = 'E'))
"
"                   AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                        OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                   AND gacl_lgr_sub_cls_type IN ('TDS', 'TCS', 'SVT', 'ESI', 'PF')
"
"                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND p_trans_mode = 'S'
"
"                   AND (   p_doc_type = 'BT'
"
"                        OR p_doc_type = 'AD'
"
"                        OR (p_doc_type = 'CT' AND par_currency = v_base_curr)))
"
"            GROUP BY par_currency HAVING SUM(db_amt - cr_amt) <> 0;
"
"
"
"       /*********************** This cursor is for  payment / receipt distribution Lines *********/
"
"
"
"       CURSOR c3 (
"
"          c_currency      VARCHAR2,
"
"          c_suplr_id      VARCHAR2,
"
"          c_bfcry_type    VARCHAR2)
"
"       IS
"
"        WITH suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code,
"
"                                   glal_acct,glal_lvl1,glal_lvl2,glal_lvl3,glal_lvl4,glal_lvl5,glal_lvl6,glal_lvl_prj,glal_plnt_loc_id,glal_cc_code
"
"                              FROM suplr_cust_ledger_vw_rev WHERE glal_bu = p_bu),
"
"             profit_cpc AS (SELECT * FROM profit_cost_centers WHERE pcc_bu = p_bu AND pcc_active_flag = 'Y')
"
"            SELECT SUM (db_amt) db_amt,
"
"                   SUM (cr_amt) cr_amt,
"
"                   SUM (db_amt_bc) db_amt_bc,
"
"                   SUM (cr_amt_bc) cr_amt_bc,
"
"                   par_currency,
"
"                   AVG (par_exchange_rate) par_exchange_rate,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   par_acct_type
"
"              FROM(
"
"            SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency,
"
"                    (par_exchange_rate) par_exchange_rate,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   DECODE (p_bs_lvl,
"
"                           'E', v_plnt_loc,
"
"                           (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                      glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   DECODE (p_bs_lvl, 'E', p_dflt_unit, glal_plant) glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   NULL par_acct_type
"
"              FROM pending_payables_stat_vw_hist, suplr_ldgr
"
"             WHERE par_bu = glal_bu
"
"                   AND ( (    glal_plant = par_plant
"
"                          AND glal_party_plant = par_plant
"
"                          AND p_bs_lvl = 'U')
"
"                        OR (p_bs_lvl = 'E'))
"
"                   AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                        OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                   AND gacl_lgr_sub_cls_type IN ('TDS', 'TCS', 'SVT', 'ESI', 'PF')
"
"                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND p_trans_mode = 'S'
"
"                   AND (   p_doc_type = 'BT'
"
"                        OR p_doc_type = 'AD'
"
"                        OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                   AND par_currency = c_currency
"
"                   AND ( ( (par_suplr_id = c_suplr_id OR c_suplr_id IS NULL)
"
"                          AND (par_bfcry_type = c_bfcry_type
"
"                               OR c_bfcry_type IS NULL)))
"
"                  AND v_apm_prj_req <> 'C'
"
"           UNION --ALL     /*Project Required - C*/
"
"           SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency,
"
"                    (par_exchange_rate) par_exchange_rate,
"
"                   pcc_ac_lvl1 glal_lvl1,
"
"                   pcc_ac_lvl2 glal_lvl2,
"
"                   pcc_ac_lvl3 glal_lvl3,
"
"                   pcc_ac_lvl4 glal_lvl4,
"
"                   pcc_ac_lvl5 glal_lvl5,
"
"                   pcc_ac_lvl6 glal_lvl6,
"
"                   pcc_ac_lvl_prj glal_lvl_prj,
"
"                   DECODE (p_bs_lvl,
"
"                           'E', v_plnt_loc,
"
"                            (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                      glal_plnt_loc_id,
"
"                    pcc_cc_code glal_cc_code,
"
"                   glal_acct,
"
"                   DECODE (p_bs_lvl, 'E', p_dflt_unit, glal_plant) glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   NULL par_acct_type
"
"              FROM pending_payables_stat_vw_hist,
"
"                   suplr_ldgr,
"
"                   profit_cpc
"
"             WHERE par_bu = glal_bu
"
"                   AND ( (    glal_plant = par_plant
"
"                          AND glal_party_plant = par_plant
"
"                          AND p_bs_lvl = 'U')
"
"                        OR (p_bs_lvl = 'E'))
"
"                   AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                        OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                   AND gacl_lgr_sub_cls_type IN ('TDS', 'TCS', 'SVT', 'ESI', 'PF')
"
"                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND p_trans_mode = 'S'
"
"                   AND (   p_doc_type = 'BT'
"
"                        OR p_doc_type = 'AD'
"
"                        OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                   AND par_currency = c_currency
"
"                   AND ( ( (par_suplr_id = c_suplr_id OR c_suplr_id IS NULL)
"
"                          AND (par_bfcry_type = c_bfcry_type
"
"                               OR c_bfcry_type IS NULL)))
"
"                   AND v_apm_prj_req = 'C'
"
"                   AND par_bu = pcc_bu
"
"                   AND par_proj_id = pcc_cc_code
"
"                   AND par_plant = pcc_ac_plnt
"
"                   )
"
"          GROUP BY par_currency,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   par_acct_type;
"
"
"
"       /***************** This cursor is for bill details *************************/
"
"
"
"       CURSOR c4 (
"
"          c_plant          VARCHAR2,
"
"          c_lvl1           VARCHAR2,
"
"          c_lvl2           VARCHAR2,
"
"          c_lvl3           VARCHAR2,
"
"          c_lvl4           VARCHAR2,
"
"          c_lvl5           VARCHAR2,
"
"          c_lvl6           VARCHAR2,
"
"          c_lvl_prj        VARCHAR2,
"
"          c_plnt_loc_id    VARCHAR2,
"
"          c_acct           VARCHAR2,
"
"          c_curr           VARCHAR2,
"
"          c_suplr_id       VARCHAR2,
"
"          c_bfcry_type     VARCHAR2,
"
"          c_acct_class     VARCHAR2)
"
"       IS
"
"        WITH suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code,
"
"                                   glal_acct,glal_lvl1,glal_lvl2,glal_lvl3,glal_lvl4,glal_lvl5,glal_lvl6,glal_lvl_prj,glal_plnt_loc_id,glal_cc_code
"
"                              FROM suplr_cust_ledger_vw_rev WHERE glal_bu = p_bu),
"
"             profit_cpc AS (SELECT * FROM profit_cost_centers WHERE pcc_bu = p_bu AND pcc_active_flag = 'Y'),
"
"             acct_type_codes_temp AS (SELECT atc_bu,atc_code,atc_sup_cust_type,atc_rqrd_type FROM acct_type_codes WHERE atc_bu = p_bu)
"
"          SELECT par_doc_date,
"
"                 par_pfx,
"
"                 par_doc_no,
"
"                 DECODE (p_bs_lvl, 'E', p_dflt_unit, par_plant) par_plant,
"
"                 par_bfcry_type,
"
"                 par_suplr_id,
"
"                 pdd_seq_no,
"
"                 pdd_due_date,
"
"                 par_aged_days,
"
"                 pdd_due_amt,
"
"                 pdd_pay_amt,
"
"                 par_acct_type,
"
"                 par_currency,
"
"                 par_exchange_rate,
"
"                 par_suplr_reference,
"
"                 par_suplr_doc_date,
"
"                 par_suplr_doc_no,
"
"                 par_doc_type,
"
"                 par_ref_bu,
"
"                 par_ref_inv_pfx,
"
"                 par_ref_inv_no,
"
"                 par_ref_plnt,
"
"                 par_bill_amt,
"
"                 par_tax_amt,
"
"                 par_dr_cr,
"
"                 par_proj_id,
"
"                 DECODE (p_bs_lvl,
"
"                         'E', v_plnt_loc,
"
"                         (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                    par_plnt_loc_id,
"
"                 par_loc_name
"
"            FROM pending_payables_stat_vw_hist,
"
"                 suplr_ldgr
"
"           WHERE par_bu = glal_bu
"
"                 AND ( (    glal_plant = par_plant
"
"                        AND p_bs_lvl = 'U'
"
"                        AND glal_party_plant = par_plant-- AND glal_plnt_loc_id = par_plnt_loc_id
"
"                      )
"
"                      OR (p_bs_lvl = 'E'))
"
"                 AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                      OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                 AND gacl_lgr_sub_cls_type IN ('TDS', 'TCS', 'SVT', 'ESI', 'PF')
"
"                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                 AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                 AND pdd_check_flag = 'Y'
"
"                 AND par_status = 'P'
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND p_trans_mode = 'S'
"
"                 AND (   p_doc_type = 'BT'
"
"                      OR p_doc_type = 'AD'
"
"                      OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND par_suplr_id = c_suplr_id
"
"                 AND par_bfcry_type = c_bfcry_type
"
"                 AND glal_plant = c_plant
"
"                 AND glal_lvl1 = c_lvl1
"
"                 AND glal_lvl2 = c_lvl2
"
"                 AND glal_lvl3 = c_lvl3
"
"                 AND glal_lvl4 = c_lvl4
"
"                 AND glal_lvl5 = c_lvl5
"
"                 AND glal_lvl6 = c_lvl6
"
"                 AND glal_lvl_prj = c_lvl_prj
"
"                 --AND par_plnt_loc_id = c_plnt_loc_id
"
"                 AND glal_acct = c_acct
"
"                 AND par_currency = c_curr
"
"                 AND v_apm_prj_req <> 'C'
"
"          UNION --ALL   /* Project Required - C*/
"
"     SELECT par_doc_date,
"
"                 par_pfx,
"
"                 par_doc_no,
"
"                 DECODE (p_bs_lvl, 'E', p_dflt_unit, par_plant) par_plant,
"
"                 par_bfcry_type,
"
"                 par_suplr_id,
"
"                 pdd_seq_no,
"
"                 pdd_due_date,
"
"                 par_aged_days,
"
"                 pdd_due_amt,
"
"                 pdd_pay_amt,
"
"                 par_acct_type,
"
"                 par_currency,
"
"                 par_exchange_rate,
"
"                 par_suplr_reference,
"
"                 par_suplr_doc_date,
"
"                 par_suplr_doc_no,
"
"                 par_doc_type,
"
"                 par_ref_bu,
"
"                 par_ref_inv_pfx,
"
"                 par_ref_inv_no,
"
"                 par_ref_plnt,
"
"                 par_bill_amt,
"
"                 par_tax_amt,
"
"                 par_dr_cr,
"
"                 par_proj_id,
"
"                 DECODE (p_bs_lvl,
"
"                         'E', v_plnt_loc,
"
"                        (SELECT bupld_loc_id
"
"                           FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                            AND bupld_plnt = glal_plant
"
"                            AND bupld_dflt_loc_flag = 'Y'
"
"                            AND bupld_actv_loc_flag = 'Y'))
"
"                    par_plnt_loc_id,
"
"                 par_loc_name
"
"            FROM pending_payables_stat_vw_hist,
"
"                 suplr_ldgr,
"
"                 profit_cpc
"
"           WHERE par_bu = glal_bu
"
"                 AND ( (    glal_plant = par_plant
"
"                        AND p_bs_lvl = 'U'
"
"                        AND glal_party_plant = par_plant-- AND glal_plnt_loc_id = par_plnt_loc_id
"
"                      )
"
"                      OR (p_bs_lvl = 'E'))
"
"                 AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                      OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                 AND gacl_lgr_sub_cls_type IN ('TDS', 'TCS', 'SVT', 'ESI', 'PF')
"
"                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                 AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                 AND pdd_check_flag = 'Y'
"
"                 AND par_status = 'P'
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND p_trans_mode = 'S'
"
"                 AND (   p_doc_type = 'BT'
"
"                      OR p_doc_type = 'AD'
"
"                      OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND par_bu = pcc_bu
"
"                 AND par_proj_id = pcc_cc_code
"
"                 AND par_plant = pcc_ac_plnt
"
"                 AND par_suplr_id = c_suplr_id
"
"                 AND par_bfcry_type = c_bfcry_type
"
"                 AND pcc_ac_plnt = c_plant
"
"                 AND pcc_ac_lvl1 = c_lvl1
"
"                 AND pcc_ac_lvl2 = c_lvl2
"
"                 AND pcc_ac_lvl3 = c_lvl3
"
"                 AND pcc_ac_lvl4 = c_lvl4
"
"                 AND pcc_ac_lvl5 = c_lvl5
"
"                 AND pcc_ac_lvl6 = c_lvl6
"
"                 AND pcc_ac_lvl_prj = c_lvl_prj
"
"                 AND glal_acct = c_acct
"
"                 AND par_currency = c_curr
"
"                 AND v_apm_prj_req = 'C';
"
"
"
"       CURSOR c5 (c_vou_pfx VARCHAR2, c_vou_no VARCHAR2)
"
"       IS
"
"          SELECT *
"
"            FROM bank_trans_dist_ln
"
"           WHERE btdln_bu = p_bu --   AND btdln_ord_pfx = c_vou_pfx
"
"                 AND btdln_ord_no = c_vou_no AND btdln_dist_amt = 0;
"
"
"
"       CURSOR c6 (
"
"          c_bfcry_type    VARCHAR2,
"
"          c_bfcry_id      VARCHAR2)
"
"       IS
"
"          SELECT spbd_pay_acct_type,
"
"                 spbd_bank_acc_no,
"
"                 spbd_bank_ifsc_code,
"
"                 spbd_pay_bank_name,
"
"                 spbd_branch_desc,
"
"                 spbd_pay_to_name
"
"            FROM suplr_pay_bank_dtls
"
"           WHERE     spbd_bu = p_bu
"
"                 AND c_bfcry_type = 'S'
"
"                 AND spbd_suplr_id = c_bfcry_id
"
"                 AND spbd_dflt_flag = 'Y'
"
"          UNION ALL
"
"          SELECT spbd_pay_acct_type,
"
"                 spbd_bank_acc_no,
"
"                 spbd_bank_ifsc_code,
"
"                 spbd_pay_bank_name,
"
"                 spbd_branch_desc,
"
"                 spbd_pay_to_name
"
"            FROM suplr_pay_bank_dtls
"
"           WHERE     spbd_bu = p_bu
"
"                 AND c_bfcry_type = 'C'
"
"                 AND spbd_suplr_id = c_bfcry_id
"
"                 AND spbd_dflt_flag = 'Y';
"
"
"
"       CURSOR c7 (c_bfcry_id VARCHAR2)
"
"       IS
"
"          SELECT suplr_collect_id,
"
"                 suplr_route_id,
"
"                 suplr_dairy_can_id,
"
"                 suplr_party_type,
"
"                 suplr_dairy_type
"
"            FROM suppliers
"
"           WHERE suplr_bu = p_bu AND suplr_suplr_id = c_bfcry_id;
"
"
"
"       cr6                      c6%ROWTYPE;
"
"       cr7                      c7%ROWTYPE;
"
"       v_first_no               VARCHAR2 (20);
"
"       v_bank_curcy             VARCHAR2 (5);
"
"       v_base_curcy             VARCHAR2 (5);
"
"       v_pfx                    VARCHAR2 (5) := NULL;
"
"       v_pfx_no                 VARCHAR2 (20) := NULL;
"
"       v_bank_unit              VARCHAR2 (20);
"
"       v_dr_cr                  VARCHAR2 (2);
"
"       v_chq_no                 bank_check_book_ln.bcbln_chq_no%TYPE;
"
"       v_bank_loc               banks.bank_plnt_loc_id%TYPE;
"
"       v_forwd_contrct_exrate   exc_contr_hd.ech_fc_ex_rate%TYPE;
"
"       v_ln_seq_no              bank_trans_dist_ln.btdln_seq_no%TYPE;
"
"       v_grn_refer              suplr_doc_hd_hist.suphdh_grn_refer%TYPE;
"
"       v_bank_ex_rate           NUMBER;
"
"       v_trans_ex_rate          NUMBER;
"
"    BEGIN
"
"       v_base_curcy := func_find_base_currency (p_bu);
"
"
"
"       IF p_doc_type = 'BT'
"
"       THEN
"
"          v_bank_curcy := func_find_bank_currency (p_bu, p_bank_cash);
"
"          v_bank_unit := func_find_bank_unit (p_bu, p_bank_cash);
"
"          v_bank_loc := func_find_bank_loc (p_bu, p_bank_cash);
"
"       ELSIF p_doc_type = 'CT'
"
"       THEN
"
"          v_bank_curcy := v_base_curcy;
"
"          v_bank_unit := func_find_cash_unit (p_bu, p_bank_cash);
"
"          v_bank_loc := func_find_cash_loc (p_bu, p_bank_cash);
"
"       ELSIF p_doc_type = 'AD'
"
"       THEN
"
"          v_bank_curcy := func_find_base_currency (p_bu);
"
"       END IF;
"
"
"
"       v_bank_ex_rate :=
"
"          func_find_exchange_rate (p_bu,
"
"                                   v_bank_curcy,
"
"                                   v_base_curcy,
"
"                                   p_trans_date,
"
"                                   'PO');
"
"
"
"       /* PAYMENT PROCESS STARTS HERE */
"
"       IF p_trans_mode IN ('P', 'S')
"
"       THEN
"
"          /* Bank Payment */
"
"          IF p_doc_type = 'BT'
"
"          THEN
"
"             /* Single Payment */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                --raise_application_error(-20999,'GLM');
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   --raise_application_error(-20999,'GLM');
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'P',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      v_chq_no := func_find_next_chq_num (p_bu, p_bank_cash, 1);
"
"                   ELSE
"
"                      v_chq_no := NULL;
"
"                   END IF;
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt),
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'BPV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      proc_upd_chq_no (p_bu,
"
"                                       v_pfx,
"
"                                       v_pfx_no,
"
"                                       p_bank_cash,
"
"                                       v_chq_no,
"
"                                       p_trans_date,
"
"                                       NULL,
"
"                                       ABS (cr1.cr_amt - cr1.db_amt),
"
"                                       'PAYMENT AGAINST ',
"
"                                       'N',
"
"                                       p_user,
"
"                                       SYSDATE,
"
"                                       1);
"
"                   END IF;
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'DR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         v_ln_seq_no := c3%ROWCOUNT;
"
"                         v_forwd_contrct_exrate :=
"
"                            func_find_frwd_cntrct_exrate (p_bu,
"
"                                                          p_bank_cash,
"
"                                                          cr4.par_suplr_id,
"
"                                                          cr4.par_suplr_doc_no,
"
"                                                          cr4.par_suplr_doc_date,
"
"                                                          cr4.par_currency,
"
"                                                          cr4.pdd_pay_amt,
"
"                                                          v_bank_curcy,
"
"                                                          v_base_curcy,
"
"                                                          p_trans_date,
"
"                                                          cr4.par_pfx,
"
"                                                          cr4.par_doc_no,
"
"                                                          cr4.par_exchange_rate);
"
"
"
"						 queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            --v_forwd_contrct_exrate,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END ,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE     sddh_bu = p_bu
"
"                                AND sddh_doc_no = cr4.par_doc_no
"
"                                AND sddh_seq_no = cr4.pdd_seq_no;
"
"
"
"                         UPDATE bank_trans
"
"                            SET btrans_trans_base_exrate = v_forwd_contrct_exrate,
"
"                                btrans_trans_base_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate,
"
"                                btrans_trans_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate,
"
"                                btrans_bank_rgl_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate
"
"                          WHERE     btrans_bu = p_bu
"
"                                AND btrans_ord_pfx = v_pfx
"
"                                AND btrans_ord_no = v_pfx_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BPV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                     proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"
"
"                --raise_application_error(-20999,'HRM');
"
"
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'P',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      v_chq_no := func_find_next_chq_num (p_bu, p_bank_cash, 1);
"
"                   ELSE
"
"                      v_chq_no := NULL;
"
"                   END IF;
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt),
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'BPV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      proc_upd_chq_no (p_bu,
"
"                                       v_pfx,
"
"                                       v_pfx_no,
"
"                                       p_bank_cash,
"
"                                       v_chq_no,
"
"                                       p_trans_date,
"
"                                       NULL,
"
"                                       ABS (cr2.cr_amt - cr2.db_amt),
"
"                                       'PAYMENT AGAINST ',
"
"                                       'N',
"
"                                       p_user,
"
"                                       SYSDATE,
"
"                                       1);
"
"                   END IF;
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         -- 1,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BPV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             END IF;
"
"          /*ADVICE */
"
"          ELSIF p_doc_type = 'AD'
"
"          THEN
"
"             /* Single Payment */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_dflt_pfx (p_bu,
"
"                                          p_dflt_unit,
"
"                                          p_user,
"
"                                          'PA',
"
"                                          'FIN');
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      p_dflt_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      'T',
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt),
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'PA',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => p_plnt_loc_id);
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         p_dflt_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'DR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         v_ln_seq_no := c3%ROWCOUNT;
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            p_dflt_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            --v_forwd_contrct_exrate,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                   flush_bank_trans_dist_ln (l_dist_rows);
"
"                   flush_bank_trans_ref_det (l_ref_rows);
"
"            END LOOP;
"
"             /* MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_dflt_pfx (p_bu,
"
"                                          p_plnt,
"
"                                          p_user,
"
"                                          'PA',
"
"                                          'FIN');
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      p_plnt,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt),
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'PA',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => p_plnt_loc);
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         p_plnt,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         -- 1,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            p_plnt,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                flush_bank_trans_dist_ln (l_dist_rows);
"
"                flush_bank_trans_ref_det (l_ref_rows);
"
"          END LOOP;
"
"             END IF;
"
"          /* CASH PAYMENT */
"
"          ELSIF p_doc_type = 'CT'
"
"          THEN
"
"             /* SINGLE CASH PAYMENT*/
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   IF cr1.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'P',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c1%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr1.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         'P',
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr1.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt),
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'PAYMENT AGAINST ',
"
"                         'CPV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3
"
"                         IN c3 (cr1.par_currency,
"
"                                cr1.par_suplr_id,
"
"                                cr1.par_bfcry_type)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.cr_amt - cr3.db_amt),
"
"                            ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,                                       --'DR',
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'S',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CPV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"
"
"
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* CASH MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   IF cr2.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'P',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c2%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr2.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         'P',
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr2.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt),
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'PAYMENT AGAINST ',
"
"                         'CPV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                      LOOP
"
"                         --raise_application_error(-20999,'HRM');
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.cr_amt - cr3.db_amt),
"
"                            ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'S',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               TO_NUMBER (c3%ROWCOUNT),
"
"                               TO_NUMBER (c4%ROWCOUNT),
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CPV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            TO_NUMBER (c3%ROWCOUNT),
"
"                                            p_user,
"
"                                            1);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"
"
"             END IF;
"
"          END IF;
"
"       /* PAYMENT PROCESS ENDS  HERE */
"
"
"
"       /* RECEIPT  PROCESS STARTS HERE */
"
"       ELSIF p_trans_mode = 'R'
"
"       THEN
"
"          IF p_doc_type = 'BT'
"
"          THEN
"
"             /* Single Receipt */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'R',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      p_trans_mode,
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt),
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'RECEIPT AGAINST INVOICES',
"
"                      'BRV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   --     RAISE_APPLICATION_ERROR(-20999,'HRM'||cr1.par_currency||cr1.par_suplr_id||cr1.par_bfcry_type);
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      --  RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.db_amt - cr3.cr_amt),
"
"                         ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'CR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr3.par_bfcry_type,
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BRV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* MERGE RECEIPT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'R',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_bank_curcy||'~'||v_base_curcy||'~'||p_trans_date||'~'||cr2.par_currency);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      p_trans_mode,
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt),
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'RECEIPT AGAINST INVOICES',
"
"                      'BRV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.db_amt - cr3.cr_amt),
"
"                         ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr3.par_bfcry_type,
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BRV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             END IF;
"
"          /* CASH RECEIPT */
"
"          ELSIF p_doc_type = 'CT'
"
"          THEN
"
"            /* SINGLE CASH RECEIPT*/
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"
"
"                   IF cr1.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'R',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"
"
"                      IF c1%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr1.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         p_trans_mode,
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr1.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_bank_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt),
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'RECEIPT AGAINST ',
"
"                         'CRV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3
"
"                         IN c3 (cr1.par_currency,
"
"                                cr1.par_suplr_id,
"
"                                cr1.par_bfcry_type)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.db_amt - cr3.cr_amt),
"
"                            ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,                                       --'CR',
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'C',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE     sddh_bu = p_bu
"
"                                   --  AND sddh_pfx = cr4.par_pfx
"
"                                   AND sddh_doc_no = cr4.par_doc_no
"
"                                   AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CRV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                     proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* CASH MERGE RECEIPT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   IF cr2.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'R',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c2%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr2.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         p_trans_mode,
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr2.par_currency,
"
"                         v_base_curcy,
"
"                         v_trans_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt),
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'RECEIPT AGAINST ',
"
"                         'CRV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.db_amt - cr3.cr_amt),
"
"                            ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'C',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CRV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             END IF;
"
"          END IF;
"
"       END IF;
"
"
"
"       /* RECEIPT  PROCESS ENDS HERE */
"
"       IF v_pfx || v_pfx_no IS NOT NULL
"
"       THEN
"
"          IF v_first_no = v_pfx_no
"
"          THEN
"
"             p_ord_no := '-' || v_first_no;
"
"          ELSE
"
"             p_ord_no := ' from ' || v_first_no || ' to ' || v_pfx_no;
"
"          END IF;
"
"       ELSIF v_pfx || v_pfx_no IS NULL
"
"       THEN
"
"          p_ord_no := 'NO_DOC';
"
"       END IF;
"
"
"
"       p_pfx_no := v_pfx || v_pfx_no;
"
"    END;
"
"    --------Create Receivables Documents--------
"
"    PROCEDURE proc_cre_pending_receivables (
"
"       p_bu            IN     business_units.bu_id%TYPE,
"
"       p_doc_type      IN     VARCHAR2,                 --- BT - BANK, 'CT' - CASH
"
"       p_bank_cash     IN     bank_trans.btrans_bank_id%TYPE,
"
"       p_trans_mode    IN     VARCHAR2, --- P - Payables, R - Receivables,S - Statutory
"
"       p_pay_type      IN     VARCHAR2,                  --- S - Single, M - Merge
"
"       p_bs_lvl        IN     VARCHAR2,                   --- E - Entity, U - Unit
"
"       p_trans_date    IN     DATE,
"
"       p_user          IN     appl_users.appluser_id%TYPE,
"
"       p_ord_no           OUT VARCHAR2,
"
"       p_pay_mode      IN     bank_trans.btrans_pay_mode%TYPE DEFAULT 'T',
"
"       p_fetch_line    IN     VARCHAR2 DEFAULT 'A',
"
"       p_dflt_unit     IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc_id   IN     VARCHAR DEFAULT NULL,
"
"       p_pfx_no           OUT VARCHAR2,
"
"       p_plnt          IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc      IN     VARCHAR2 DEFAULT NULL)
"
"    IS
"
"
"
"      l_dist_rows t_dist_rows;
"
"      l_ref_rows  t_ref_rows;
"
"       v_plnt_loc               bus_unit_plants_loc_dtls.bupld_loc_id%TYPE
"
"                                   := func_find_dflt_plnt_loc (p_bu, p_dflt_unit);
"
"       v_base_curr              VARCHAR2 (5) := func_find_base_currency (p_bu);
"
"       v_apm_prj_req            VARCHAR2 (5) := func_find_apm_prj_req_flag (p_bu);
"
"       v_arm_prj_req            VARCHAR2 (5) := func_find_arm_prj_req_flag (p_bu);
"
"
"
"       /****************** This cursor is for single Payment/Receipt header records **************/
"
"                                                          /* Sub Ledger Concept */
"
"       CURSOR c1
"
"       IS
"
"        WITH suplr_dtls AS (SELECT suplr_bu,suplr_suplr_id FROM suppliers WHERE suplr_bu = p_bu AND suplr_status = 'A'),
"
"             suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code
"
"                              FROM suplr_cust_ledger_vw_rev
"
"                             WHERE glal_bu = p_bu)
"
"            SELECT SUM (db_amt) db_amt,
"
"                   SUM (cr_amt) cr_amt,
"
"                   SUM (db_amt_bc) db_amt_bc,
"
"                   SUM (cr_amt_bc) cr_amt_bc,
"
"                   par_currency,
"
"                   par_suplr_id,
"
"                   par_bfcry_type
"
"              FROM (  SELECT  (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'DR' THEN pdd_pay_amt
"
"                                   ELSE 0
"
"                                END)
"
"                                db_amt,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'CR' THEN pdd_pay_amt
"
"                                   ELSE 0
"
"                                END)
"
"                                cr_amt,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'DR'
"
"                                   THEN
"
"                                      pdd_pay_amt * par_exchange_rate
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                db_amt_bc,
"
"                              (
"
"                                CASE
"
"                                   WHEN par_dr_cr = 'CR'
"
"                                   THEN
"
"                                      pdd_pay_amt * par_exchange_rate
"
"                                   ELSE
"
"                                      0
"
"                                END)
"
"                                cr_amt_bc,
"
"                             par_currency,
"
"                             par_bfcry_type,
"
"                             par_suplr_id
"
"                        FROM pending_receivable_vw_hist_rev,
"
"                             suplr_ldgr,
"
"                             acct_type_codes acct_type_codes_temp,
"
"                             suplr_dtls
"
"                       WHERE     par_bu = glal_bu
"
"                             AND atc_bu = par_bu
"
"                             AND atc_code = par_acct_type
"
"                             AND suplr_bu = par_bu
"
"                             AND ( (    glal_plant = par_plant
"
"                                    AND p_bs_lvl = 'U'
"
"                                    AND glal_party_plant = par_plant)
"
"                                  OR p_bs_lvl = 'E')
"
"                             AND ( (    glal_suplr_id = par_suplr_id
"
"                                    AND suplr_suplr_id = glal_suplr_id
"
"                                    AND par_bfcry_type = 'S')
"
"                                  OR (    glal_cust_id = par_suplr_id
"
"                                      AND suplr_suplr_id = glal_cust_id
"
"                                      AND par_bfcry_type = 'C'))
"
"                             AND ( (par_acct_type IN ('AP', 'AR')
"
"                                    AND par_bfcry_type IN ('S', 'C')
"
"                                    AND gacl_lgr_sub_cls_type IN
"
"                                           ('SAP',
"
"                                            'TDS',
"
"                                            'TCS',
"
"                                            'SVT',
"
"                                            'ESI',
"
"                                            'CASH',
"
"                                            'IMP',
"
"                                            'CAR',
"
"                                            'PF'))
"
"                                  OR (par_acct_type IN ('CAD', 'SAD')
"
"                                      AND par_bfcry_type IN ('S', 'C')
"
"                                      AND gacl_lgr_sub_cls_type IN
"
"                                             ('TDS',
"
"                                              'TCS',
"
"                                              'SVT',
"
"                                              'ESI',
"
"                                              'CASH',
"
"                                              'IMP',
"
"                                              'CAD',
"
"                                              'PF'))
"
"                                  OR (    par_acct_type IN ('SSD')
"
"                                      AND par_bfcry_type IN ('S', 'C')
"
"                                      AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                                  OR ( (par_bfcry_type IN ('S')
"
"                                        AND ( (par_acct_type = 'SAD'
"
"                                               AND ( (gacl_lgr_sub_cls_type IN
"
"                                                         ('SAP', 'CAR')
"
"                                                      AND atc_rqrd_type = 'N')
"
"                                                    OR (gacl_lgr_sub_cls_type IN
"
"                                                           ('SAD', 'CAD')
"
"                                                        AND glac_acct_type_code =
"
"                                                               atc_code
"
"                                                        AND atc_rqrd_type <> 'N')))
"
"                                             OR (par_acct_type = 'SSD'
"
"                                                 AND ( (gacl_lgr_sub_cls_type IN
"
"                                                           ('SAP', 'CAR')
"
"                                                        AND atc_rqrd_type = 'N')
"
"                                                      OR (gacl_lgr_sub_cls_type IN
"
"                                                             ('SSD', 'CSD')
"
"                                                          AND glac_acct_type_code =
"
"                                                                 atc_code
"
"                                                          AND atc_rqrd_type <> 'N'))))
"
"                                        OR (par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                            AND par_acct_type = atc_code
"
"                                            AND atc_sup_cust_type = 'S'
"
"                                            AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                                   AND atc_rqrd_type = 'N')
"
"                                                 OR (atc_rqrd_type <> 'N'
"
"                                                     AND glac_acct_type_code =
"
"                                                            atc_code))))
"
"                                      OR ( (par_bfcry_type IN ('C')
"
"                                            AND ( (par_acct_type = 'CAD'
"
"                                                   AND ( (gacl_lgr_sub_cls_type IN
"
"                                                             ('SAP', 'CAR')
"
"                                                          AND atc_rqrd_type = 'N')
"
"                                                        OR (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAD', 'CAD')
"
"                                                            AND glac_acct_type_code =
"
"                                                                   atc_code
"
"                                                            AND atc_rqrd_type <> 'N')))
"
"                                                 OR (par_acct_type = 'CSD'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SSD', 'CSD')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N')))
"
"                                                 OR (par_acct_type = 'EMD'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SEMD', 'CEMD')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N')))
"
"                                                 OR (par_acct_type = 'PBG'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SPBG', 'CPBG')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N')))
"
"                                                 OR (par_acct_type = 'RET'
"
"                                                     AND ( (gacl_lgr_sub_cls_type IN
"
"                                                               ('SAP', 'CAR')
"
"                                                            AND atc_rqrd_type = 'N')
"
"                                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                                 ('SRET', 'CRET')
"
"                                                              AND glac_acct_type_code =
"
"                                                                     atc_code
"
"                                                              AND atc_rqrd_type <>
"
"                                                                     'N'))))
"
"                                            OR (par_acct_type NOT IN
"
"                                                   ('AR',
"
"                                                    'CAD',
"
"                                                    'CSD',
"
"                                                    'EMD',
"
"                                                    'PBG',
"
"                                                    'RET')
"
"                                                AND par_acct_type = atc_code
"
"                                                AND atc_sup_cust_type = 'C'
"
"                                                AND ( (gacl_lgr_sub_cls_type IN
"
"                                                          ('CAR')
"
"                                                       AND atc_rqrd_type = 'N')
"
"                                                     OR (atc_rqrd_type <> 'N'
"
"                                                         AND glac_acct_type_code =
"
"                                                                atc_code)))))))
"
"                             AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                             AND pdd_check_flag = 'Y'
"
"                             AND par_status = 'P'
"
"                             AND par_bu = p_bu
"
"                             AND pdd_user = p_user
"
"                             AND p_trans_mode = 'R'
"
"                             AND (p_doc_type = 'BT'
"
"                                  OR (p_doc_type = 'CT'
"
"                                      AND par_currency = v_base_curr)
"
"                                  OR p_doc_type = 'AD')
"
"                    )
"
"          GROUP BY par_currency, par_suplr_id, par_bfcry_type
"
"            HAVING (SUM (db_amt) - SUM (cr_amt)) <> 0;
"
"
"
"       /****************** This cursor is for merge Payment/Receipt header records **************/
"
"       CURSOR c2
"
"       IS
"
"       WITH suplr_dtls AS (SELECT suplr_bu,suplr_suplr_id FROM suppliers WHERE suplr_bu = p_bu AND suplr_status = 'A'),
"
"            suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                  glal_party_plant,glal_plant,glac_acct_type_code
"
"                             FROM suplr_cust_ledger_vw_rev
"
"                            WHERE glal_bu = p_bu)
"
"            SELECT SUM(db_amt)db_amt,SUM(cr_amt)cr_amt,SUM(db_amt_bc)db_amt_bc,SUM(cr_amt_bc)cr_amt_bc,par_currency
"
"              FROM(
"
"            SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency
"
"              FROM pending_receivable_vw_hist_rev,
"
"                   suplr_ldgr,
"
"                   acct_type_codes acct_type_codes_temp
"
"             WHERE     par_bu = glal_bu
"
"                   AND atc_bu = par_bu
"
"                   AND atc_code = par_acct_type
"
"                   AND ( (    glal_plant = par_plant
"
"                          AND p_bs_lvl = 'U'
"
"                          AND glal_party_plant = par_plant)
"
"                        OR p_bs_lvl = 'E')
"
"                   AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                        OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                   AND ( (par_acct_type IN ('AP', 'AR')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND gacl_lgr_sub_cls_type IN
"
"                                 ('SAP',
"
"                                  'TDS',
"
"                                  'TCS',
"
"                                  'SVT',
"
"                                  'ESI',
"
"                                  'CASH',
"
"                                  'IMP',
"
"                                  'CAR',
"
"                                  'PF'))
"
"                        OR (par_acct_type IN ('CAD', 'SAD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN
"
"                                   ('TDS',
"
"                                    'TCS',
"
"                                    'SVT',
"
"                                    'ESI',
"
"                                    'CASH',
"
"                                    'IMP',
"
"                                    'CAD',
"
"                                    'PF'))
"
"                        OR (    par_acct_type IN ('SSD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                        OR ( (par_bfcry_type IN ('S')
"
"                              AND ( (par_acct_type = 'SAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code = atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'SSD'
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
"                                                AND glac_acct_type_code = atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'S'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code))))
"
"                            OR ( (par_bfcry_type IN ('C')
"
"                                  AND ( (par_acct_type = 'CAD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAD', 'CAD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'CSD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SSD', 'CSD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'EMD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SEMD', 'CEMD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'PBG'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SPBG', 'CPBG')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'RET'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SRET', 'CRET')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N'))))
"
"                                  OR (par_acct_type NOT IN
"
"                                         ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                      AND par_acct_type = atc_code
"
"                                      AND atc_sup_cust_type = 'C'
"
"                                      AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                             AND atc_rqrd_type = 'N')
"
"                                           OR (atc_rqrd_type <> 'N'
"
"                                               AND glac_acct_type_code = atc_code)))))))
"
"                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND p_trans_mode = 'R'
"
"                   AND (   p_doc_type = 'BT'
"
"                        OR p_doc_type = 'AD'
"
"                        OR (p_doc_type = 'CT' AND par_currency = v_base_curr)))
"
"            GROUP BY par_currency HAVING SUM(db_amt - cr_amt) <> 0;
"
"
"
"       /*********************** This cursor is for  payment / receipt distribution Lines *********/
"
"
"
"       CURSOR c3 (
"
"          c_currency      VARCHAR2,
"
"          c_suplr_id      VARCHAR2,
"
"          c_bfcry_type    VARCHAR2)
"
"       IS
"
"        WITH suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code,
"
"                                   glal_acct,glal_lvl1,glal_lvl2,glal_lvl3,glal_lvl4,glal_lvl5,glal_lvl6,glal_lvl_prj,glal_plnt_loc_id,glal_cc_code
"
"                               FROM suplr_cust_ledger_vw_rev WHERE glal_bu = p_bu),
"
"             profit_cpc AS (SELECT * FROM profit_cost_centers WHERE pcc_bu = p_bu AND pcc_active_flag = 'Y')
"
"            SELECT SUM (db_amt) db_amt,
"
"                   SUM (cr_amt) cr_amt,
"
"                   SUM (db_amt_bc) db_amt_bc,
"
"                   SUM (cr_amt_bc) cr_amt_bc,
"
"                   par_currency,
"
"                   AVG (par_exchange_rate) par_exchange_rate,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   par_acct_type
"
"              FROM(
"
"            SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency,
"
"                    (par_exchange_rate) par_exchange_rate,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   DECODE (p_bs_lvl,
"
"                           'E', v_plnt_loc,
"
"                            (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                      glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   DECODE (p_bs_lvl, 'E', p_dflt_unit, glal_plant)glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   DECODE (atc_rqrd_type, 'S', par_acct_type, NULL) par_acct_type
"
"              FROM pending_receivable_vw_hist_rev,
"
"                   suplr_ldgr,
"
"                   acct_type_codes acct_type_codes_temp
"
"             WHERE     par_bu = glal_bu
"
"                   AND atc_bu = par_bu
"
"                   AND atc_code = par_acct_type
"
"                   AND ( (    glal_plant = par_plant
"
"                          AND p_bs_lvl = 'U'
"
"                          AND glal_party_plant = par_plant)
"
"                        OR p_bs_lvl = 'E')
"
"                   AND ( (glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                        OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"                   AND ( (par_acct_type IN ('AP', 'AR')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND gacl_lgr_sub_cls_type IN
"
"                                 ('SAP',
"
"                                  'TDS',
"
"                                  'TCS',
"
"                                  'SVT',
"
"                                  'ESI',
"
"                                  'CASH',
"
"                                  'IMP',
"
"                                  'CAR',
"
"                                  'PF'))
"
"                        OR (par_acct_type IN ('CAD', 'SAD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN
"
"                                   ('TDS',
"
"                                    'TCS',
"
"                                    'SVT',
"
"                                    'ESI',
"
"                                    'CASH',
"
"                                    'IMP',
"
"                                    'CAD',
"
"                                    'PF'))
"
"                        OR (    par_acct_type IN ('SSD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                        OR ( (par_bfcry_type IN ('S')
"
"                              AND ( (par_acct_type = 'SAD'
"
"                                     AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                            AND atc_rqrd_type = 'N')
"
"                                          OR (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAD', 'CAD')
"
"                                              AND glac_acct_type_code = atc_code
"
"                                              AND atc_rqrd_type <> 'N')))
"
"                                   OR (par_acct_type = 'SSD'
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
"                                                AND glac_acct_type_code = atc_code
"
"                                                AND atc_rqrd_type <> 'N'))))
"
"                              OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                  AND par_acct_type = atc_code
"
"                                  AND atc_sup_cust_type = 'S'
"
"                                  AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                         AND atc_rqrd_type = 'N')
"
"                                       OR (atc_rqrd_type <> 'N'
"
"                                           AND glac_acct_type_code = atc_code))))
"
"                            OR ( (par_bfcry_type IN ('C')
"
"                                  AND ( (par_acct_type = 'CAD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAD', 'CAD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'CSD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SSD', 'CSD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'EMD'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SEMD', 'CEMD')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'PBG'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SPBG', 'CPBG')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N')))
"
"                                       OR (par_acct_type = 'RET'
"
"                                           AND ( (gacl_lgr_sub_cls_type IN
"
"                                                     ('SAP', 'CAR')
"
"                                                  AND atc_rqrd_type = 'N')
"
"                                                OR (gacl_lgr_sub_cls_type IN
"
"                                                       ('SRET', 'CRET')
"
"                                                    AND glac_acct_type_code =
"
"                                                           atc_code
"
"                                                    AND atc_rqrd_type <> 'N'))))
"
"                                  OR (par_acct_type NOT IN
"
"                                         ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                      AND par_acct_type = atc_code
"
"                                      AND atc_sup_cust_type = 'C'
"
"                                      AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                             AND atc_rqrd_type = 'N')
"
"                                           OR (atc_rqrd_type <> 'N'
"
"                                               AND glac_acct_type_code = atc_code)))))))
"
"                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND p_trans_mode = 'R'
"
"                   AND (   p_doc_type = 'BT'
"
"                        OR p_doc_type = 'AD'
"
"                        OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                   AND par_currency = c_currency
"
"                   AND ( ( (par_suplr_id = c_suplr_id OR c_suplr_id IS NULL)
"
"                          AND (par_bfcry_type = c_bfcry_type
"
"                               OR c_bfcry_type IS NULL)
"
"                          AND v_arm_prj_req = 'N'))
"
"            UNION                            /* Project Required - C*/
"
"            SELECT  (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt ELSE 0 END)
"
"                      db_amt,
"
"                    (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt ELSE 0 END)
"
"                      cr_amt,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'DR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      db_amt_bc,
"
"                    (
"
"                      CASE
"
"                         WHEN par_dr_cr = 'CR' THEN pdd_pay_amt * par_exchange_rate
"
"                         ELSE 0
"
"                      END)
"
"                      cr_amt_bc,
"
"                   par_currency,
"
"                    (par_exchange_rate) par_exchange_rate,
"
"                   pcc_ac_lvl1 glal_lvl1,
"
"                   pcc_ac_lvl2 glal_lvl2,
"
"                   pcc_ac_lvl3 glal_lvl3,
"
"                   pcc_ac_lvl4 glal_lvl4,
"
"                   pcc_ac_lvl5 glal_lvl5,
"
"                   pcc_ac_lvl6 glal_lvl6,
"
"                   pcc_ac_lvl_prj glal_lvl_prj,
"
"                   DECODE (p_bs_lvl,
"
"                           'E', v_plnt_loc,
"
"                           (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                      glal_plnt_loc_id,
"
"                   pcc_cc_code glal_cc_code,
"
"                   glal_acct,
"
"                   DECODE (p_bs_lvl, 'E', p_dflt_unit, pcc_ac_plnt) glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   DECODE (atc_rqrd_type, 'S', par_acct_type, NULL) par_acct_type
"
"              FROM pending_receivable_vw_hist_rev,
"
"                   suplr_ldgr,
"
"                   acct_type_codes acct_type_codes_temp,
"
"                   profit_cpc
"
"             WHERE par_bu = glal_bu
"
"               AND atc_bu = par_bu
"
"               AND atc_code = par_acct_type
"
"               AND par_bu = pcc_bu
"
"               AND par_proj_id = pcc_cc_code
"
"               AND par_plant = pcc_ac_plnt
"
"               AND ( (    glal_plant = par_plant
"
"                      AND p_bs_lvl = 'U'
"
"                      AND glal_party_plant = par_plant)
"
"                    OR p_bs_lvl = 'E')
"
"               AND ( (    glal_suplr_id = par_suplr_id
"
"                      AND par_bfcry_type = 'S'
"
"                      AND v_apm_prj_req = 'C')
"
"                    OR (    glal_cust_id = par_suplr_id
"
"                        AND par_bfcry_type = 'C'
"
"                        AND v_arm_prj_req = 'C'))
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
"                              'CAR',
"
"                              'PF'))
"
"                    OR (par_acct_type IN ('CAD', 'SAD')
"
"                        AND par_bfcry_type IN ('S', 'C')
"
"                        AND gacl_lgr_sub_cls_type IN
"
"                               ('TDS',
"
"                                'TCS',
"
"                                'SVT',
"
"                                'ESI',
"
"                                'CASH',
"
"                                'IMP',
"
"                                'CAD',
"
"                                'PF'))
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
"               AND p_trans_mode = 'R'
"
"               AND (   p_doc_type = 'BT'
"
"                    OR p_doc_type = 'AD'
"
"                    OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"               AND par_currency = c_currency
"
"               AND ( ( (par_suplr_id = c_suplr_id OR c_suplr_id IS NULL)
"
"                      AND (par_bfcry_type = c_bfcry_type
"
"                           OR c_bfcry_type IS NULL))))
"
"          GROUP BY par_currency,
"
"                   glal_lvl1,
"
"                   glal_lvl2,
"
"                   glal_lvl3,
"
"                   glal_lvl4,
"
"                   glal_lvl5,
"
"                   glal_lvl6,
"
"                   glal_lvl_prj,
"
"                   glal_plnt_loc_id,
"
"                   glal_cc_code,
"
"                   glal_acct,
"
"                   glal_plant,
"
"                   par_suplr_id,
"
"                   par_bfcry_type,
"
"                   par_acct_type;
"
"
"
"       /***************** This cursor is for bill details *************************/
"
"
"
"       CURSOR c4 (
"
"          c_plant          VARCHAR2,
"
"          c_lvl1           VARCHAR2,
"
"          c_lvl2           VARCHAR2,
"
"          c_lvl3           VARCHAR2,
"
"          c_lvl4           VARCHAR2,
"
"          c_lvl5           VARCHAR2,
"
"          c_lvl6           VARCHAR2,
"
"          c_lvl_prj        VARCHAR2,
"
"          c_plnt_loc_id    VARCHAR2,
"
"          c_acct           VARCHAR2,
"
"          c_curr           VARCHAR2,
"
"          c_suplr_id       VARCHAR2,
"
"          c_bfcry_type     VARCHAR2,
"
"          c_acct_class     VARCHAR2)
"
"       IS
"
"        WITH suplr_dtls AS (SELECT suplr_bu,suplr_suplr_id,suplr_party_type FROM suppliers WHERE suplr_bu = p_bu AND suplr_status = 'A'),
"
"             suplr_ldgr AS (SELECT glal_bu,glal_suplr_id,glal_cust_id,gacl_lgr_sub_cls_type,
"
"                                   glal_party_plant,glal_plant,glac_acct_type_code,
"
"                                   glal_acct,glal_lvl1,glal_lvl2,glal_lvl3,glal_lvl4,glal_lvl5,glal_lvl6,glal_lvl_prj,glal_plnt_loc_id,glal_cc_code
"
"                               FROM suplr_cust_ledger_vw_rev WHERE glal_bu = p_bu),
"
"             profit_cpc AS (SELECT * FROM profit_cost_centers WHERE pcc_bu = p_bu AND pcc_active_flag = 'Y'),
"
"             acct_type_codes_temp AS (SELECT atc_bu,atc_code,atc_sup_cust_type,atc_rqrd_type FROM acct_type_codes WHERE atc_bu = p_bu)
"
"          SELECT par_doc_date,
"
"                 par_pfx,
"
"                 par_doc_no,
"
"                 DECODE (p_bs_lvl, 'E', p_dflt_unit, par_plant) par_plant,
"
"                 par_bfcry_type,
"
"                 par_suplr_id,
"
"                 pdd_seq_no,
"
"                 pdd_due_date,
"
"                 par_aged_days,
"
"                 pdd_due_amt,
"
"                 pdd_pay_amt,
"
"                 par_acct_type,
"
"                 par_currency,
"
"                 par_exchange_rate,
"
"                 par_suplr_reference,
"
"                 par_suplr_doc_date,
"
"                 par_suplr_doc_no,
"
"                 par_doc_type,
"
"                 --par_doc_mode,
"
"                 --par_loc_id,
"
"                 par_ref_bu,
"
"                 par_ref_inv_pfx,
"
"                 par_ref_inv_no,
"
"                 par_ref_plnt,
"
"                 par_bill_amt,
"
"                 par_tax_amt,
"
"                 par_dr_cr,
"
"                 par_proj_id,
"
"                 DECODE (p_bs_lvl,
"
"                         'E', v_plnt_loc,
"
"                        (SELECT bupld_loc_id
"
"                           FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                            AND bupld_plnt = glal_plant
"
"                            AND bupld_dflt_loc_flag = 'Y'
"
"                            AND bupld_actv_loc_flag = 'Y'))
"
"                    par_plnt_loc_id,
"
"                 par_loc_name
"
"            FROM pending_receivable_vw_hist_rev,
"
"                 suplr_ldgr,
"
"                 acct_type_codes_temp,
"
"                 suplr_dtls
"
"           WHERE     par_bu = glal_bu
"
"                 AND atc_bu = par_bu
"
"                 AND atc_bu = suplr_bu
"
"                 AND atc_code = par_acct_type
"
"                 AND (par_acct_type = c_acct_class OR c_acct_class IS NULL)
"
"                 --AND glac_acct_type_code = atc_code
"
"                 AND ( (    glal_plant = par_plant
"
"                        AND p_bs_lvl = 'U'
"
"                        AND glal_party_plant = par_plant)
"
"                      OR p_bs_lvl = 'E')
"
"                 AND ( (    glal_suplr_id = par_suplr_id
"
"                        AND suplr_suplr_id = glal_suplr_id
"
"                        AND par_bfcry_type = 'S')
"
"                      OR (    glal_cust_id = par_suplr_id
"
"                          AND suplr_suplr_id = glal_cust_id
"
"                          AND par_bfcry_type = 'C'))
"
"                 AND ( (par_acct_type IN ('AP', 'AR')
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
"                                        ('SAP',
"
"                                         'TDS',
"
"                                         'TCS',
"
"                                         'SVT',
"
"                                         'ESI',
"
"                                         'CASH',
"
"                                         'CAR',
"
"                                         'PF'))))
"
"                      OR ( (par_acct_type IN ('CAD', 'SAD')
"
"                            AND par_bfcry_type IN ('S', 'C')
"
"                            AND ( (suplr_party_type = 'I'
"
"                                   AND gacl_lgr_sub_cls_type = 'IMP')
"
"                                 OR (suplr_party_type = 'P'
"
"                                     AND gacl_lgr_sub_cls_type IN ('CASH'))
"
"                                 OR (suplr_party_type NOT IN ('P', 'I')
"
"                                     AND gacl_lgr_sub_cls_type IN
"
"                                            ('TDS',
"
"                                             'TCS',
"
"                                             'SVT',
"
"                                             'ESI',
"
"                                             'CASH',
"
"                                             'IMP',
"
"                                             'CAD',
"
"                                             'PF')))))
"
"                      OR (    par_acct_type IN ('SSD')
"
"                          AND par_bfcry_type IN ('S', 'C')
"
"                          AND gacl_lgr_sub_cls_type IN ('SSD')) /*Changes By Dinesh*/
"
"                      OR ( (par_bfcry_type IN ('S')
"
"                            AND ( (par_acct_type = 'SAD'
"
"                                   AND ( (gacl_lgr_sub_cls_type IN ('SAP', 'CAR')
"
"                                          AND atc_rqrd_type = 'N')
"
"                                        OR (gacl_lgr_sub_cls_type IN
"
"                                               ('SAD', 'CAD')
"
"                                            AND glac_acct_type_code = atc_code
"
"                                            AND atc_rqrd_type <> 'N')))
"
"                                 OR (par_acct_type = 'SSD'
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
"                                              AND glac_acct_type_code = atc_code
"
"                                              AND atc_rqrd_type <> 'N'))))
"
"                            OR (    par_acct_type NOT IN ('AP', 'SAD', 'SSD')
"
"                                AND par_acct_type = atc_code
"
"                                AND atc_sup_cust_type = 'S'
"
"                                AND ( (gacl_lgr_sub_cls_type IN ('SAP')
"
"                                       AND atc_rqrd_type = 'N')
"
"                                     OR (atc_rqrd_type <> 'N'
"
"                                         AND glac_acct_type_code = atc_code))))
"
"                          OR ( (par_bfcry_type IN ('C')
"
"                                AND ( (par_acct_type = 'CAD'
"
"                                       AND ( (gacl_lgr_sub_cls_type IN
"
"                                                 ('SAP', 'CAR')
"
"                                              AND atc_rqrd_type = 'N')
"
"                                            OR (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAD', 'CAD')
"
"                                                AND glac_acct_type_code =
"
"                                                       atc_code
"
"                                                AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'CSD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SSD', 'CSD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'EMD'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SEMD', 'CEMD')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'PBG'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SPBG', 'CPBG')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N')))
"
"                                     OR (par_acct_type = 'RET'
"
"                                         AND ( (gacl_lgr_sub_cls_type IN
"
"                                                   ('SAP', 'CAR')
"
"                                                AND atc_rqrd_type = 'N')
"
"                                              OR (gacl_lgr_sub_cls_type IN
"
"                                                     ('SRET', 'CRET')
"
"                                                  AND glac_acct_type_code =
"
"                                                         atc_code
"
"                                                  AND atc_rqrd_type <> 'N'))))
"
"                                OR (par_acct_type NOT IN
"
"                                       ('AR', 'CAD', 'CSD', 'EMD', 'PBG', 'RET')
"
"                                    AND par_acct_type = atc_code
"
"                                    AND atc_sup_cust_type = 'C'
"
"                                    AND ( (gacl_lgr_sub_cls_type IN ('CAR')
"
"                                           AND atc_rqrd_type = 'N')
"
"                                         OR (atc_rqrd_type <> 'N'
"
"                                             AND glac_acct_type_code = atc_code)))))))
"
"                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                 AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                 AND pdd_check_flag = 'Y'
"
"                 AND par_status = 'P'
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND ( (v_apm_prj_req = 'N' AND c_bfcry_type = 'S')
"
"                      OR (v_arm_prj_req = 'N' AND c_bfcry_type = 'C'))
"
"                 AND p_trans_mode = 'R'
"
"                 AND (   p_doc_type = 'BT'
"
"                      OR p_doc_type = 'AD'
"
"                      OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user
"
"                 AND par_suplr_id = c_suplr_id
"
"                 AND par_bfcry_type = c_bfcry_type
"
"                 AND glal_plant = c_plant
"
"                 AND glal_lvl1 = c_lvl1
"
"                 AND glal_lvl2 = c_lvl2
"
"                 AND glal_lvl3 = c_lvl3
"
"                 AND glal_lvl4 = c_lvl4
"
"                 AND glal_lvl5 = c_lvl5
"
"                 AND glal_lvl6 = c_lvl6
"
"                 AND glal_lvl_prj = c_lvl_prj
"
"                 AND glal_acct = c_acct
"
"                 AND par_currency = c_curr
"
"          UNION --ALL                                      /* Project Required - C*/
"
"          SELECT par_doc_date,
"
"                 par_pfx,
"
"                 par_doc_no,
"
"                 DECODE (p_bs_lvl, 'E', p_dflt_unit, par_plant) par_plant,
"
"                 par_bfcry_type,
"
"                 par_suplr_id,
"
"                 pdd_seq_no,
"
"                 pdd_due_date,
"
"                 par_aged_days,
"
"                 pdd_due_amt,
"
"                 pdd_pay_amt,
"
"                 par_acct_type,
"
"                 par_currency,
"
"                 par_exchange_rate,
"
"                 par_suplr_reference,
"
"                 par_suplr_doc_date,
"
"                 par_suplr_doc_no,
"
"                 par_doc_type,
"
"                 par_ref_bu,
"
"                 par_ref_inv_pfx,
"
"                 par_ref_inv_no,
"
"                 par_ref_plnt,
"
"                 par_bill_amt,
"
"                 par_tax_amt,
"
"                 par_dr_cr,
"
"                 par_proj_id,
"
"                 DECODE (p_bs_lvl,
"
"                         'E', v_plnt_loc,
"
"                            (SELECT bupld_loc_id
"
"                               FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu
"
"                                AND bupld_plnt = glal_plant
"
"                                AND bupld_dflt_loc_flag = 'Y'
"
"                                AND bupld_actv_loc_flag = 'Y'))
"
"                    par_plnt_loc_id,
"
"                 par_loc_name
"
"            FROM pending_receivable_vw_hist_rev,
"
"                 suplr_ldgr,
"
"                 acct_type_codes_temp,
"
"                 profit_cpc,
"
"                 suplr_dtls
"
"           WHERE par_bu = glal_bu
"
"             AND atc_bu = par_bu
"
"             AND atc_bu = suplr_bu
"
"             AND atc_code = par_acct_type
"
"             AND (par_acct_type = c_acct_class OR c_acct_class IS NULL)
"
"             AND par_bu = pcc_bu
"
"             AND par_proj_id = pcc_cc_code
"
"             AND par_plant = pcc_ac_plnt
"
"             AND ( (    glal_plant = par_plant
"
"                    AND p_bs_lvl = 'U'
"
"                    AND glal_party_plant = par_plant)
"
"                  OR p_bs_lvl = 'E')
"
"             AND ( (    glal_suplr_id = par_suplr_id
"
"                    AND suplr_suplr_id = glal_suplr_id
"
"                    AND par_bfcry_type = 'S'
"
"                    AND v_apm_prj_req = 'C')
"
"                  OR (    glal_cust_id = par_suplr_id
"
"                      AND suplr_suplr_id = glal_cust_id
"
"                      AND par_bfcry_type = 'C'
"
"                      AND v_arm_prj_req = 'C'))
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
"             --  AND func_find_arm_prj_req_flag(par_bu) = 'Y'
"
"             AND p_trans_mode = 'R'
"
"             AND (   p_doc_type = 'BT'
"
"                  OR p_doc_type = 'AD'
"
"                  OR (p_doc_type = 'CT' AND par_currency = v_base_curr))
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND par_suplr_id = c_suplr_id
"
"             AND par_bfcry_type = c_bfcry_type
"
"             AND pcc_ac_plnt = c_plant
"
"             AND pcc_ac_lvl1 = c_lvl1
"
"             AND pcc_ac_lvl2 = c_lvl2
"
"             AND pcc_ac_lvl3 = c_lvl3
"
"             AND pcc_ac_lvl4 = c_lvl4
"
"             AND pcc_ac_lvl5 = c_lvl5
"
"             AND pcc_ac_lvl6 = c_lvl6
"
"             AND pcc_ac_lvl_prj = c_lvl_prj
"
"             AND glal_acct = c_acct
"
"             AND par_currency = c_curr;
"
"
"
"       CURSOR c5 (c_vou_pfx VARCHAR2, c_vou_no VARCHAR2)
"
"       IS
"
"          SELECT *
"
"            FROM bank_trans_dist_ln
"
"           WHERE btdln_bu = p_bu
"
"             AND btdln_ord_no = c_vou_no
"
"             AND btdln_dist_amt = 0;
"
"
"
"       CURSOR c6 (
"
"          c_bfcry_type    VARCHAR2,
"
"          c_bfcry_id      VARCHAR2)
"
"       IS
"
"          SELECT spbd_pay_acct_type,
"
"                 spbd_bank_acc_no,
"
"                 spbd_bank_ifsc_code,
"
"                 spbd_pay_bank_name,
"
"                 spbd_branch_desc,
"
"                 spbd_pay_to_name
"
"            FROM suplr_pay_bank_dtls
"
"           WHERE     spbd_bu = p_bu
"
"                 AND c_bfcry_type = 'S'
"
"                 AND spbd_suplr_id = c_bfcry_id
"
"                 AND spbd_dflt_flag = 'Y'
"
"          UNION ALL
"
"          SELECT spbd_pay_acct_type,
"
"                 spbd_bank_acc_no,
"
"                 spbd_bank_ifsc_code,
"
"                 spbd_pay_bank_name,
"
"                 spbd_branch_desc,
"
"                 spbd_pay_to_name
"
"            FROM suplr_pay_bank_dtls
"
"           WHERE     spbd_bu = p_bu
"
"                 AND c_bfcry_type = 'C'
"
"                 AND spbd_suplr_id = c_bfcry_id
"
"                 AND spbd_dflt_flag = 'Y';
"
"
"
"       CURSOR c7 (c_bfcry_id VARCHAR2)
"
"       IS
"
"          SELECT suplr_collect_id,
"
"                 suplr_route_id,
"
"                 suplr_dairy_can_id,
"
"                 suplr_party_type,
"
"                 suplr_dairy_type
"
"            FROM suppliers
"
"           WHERE suplr_bu = p_bu AND suplr_suplr_id = c_bfcry_id;
"
"
"
"       cr6                      c6%ROWTYPE;
"
"       cr7                      c7%ROWTYPE;
"
"       v_first_no               VARCHAR2 (100);
"
"       v_bank_curcy             VARCHAR2 (5);
"
"       v_base_curcy             VARCHAR2 (5);
"
"       v_pfx                    VARCHAR2 (5) := NULL;
"
"       v_pfx_no                 VARCHAR2 (30) := NULL;
"
"       v_bank_unit              VARCHAR2 (20);
"
"       v_dr_cr                  VARCHAR2 (2);
"
"       v_chq_no                 bank_check_book_ln.bcbln_chq_no%TYPE;
"
"       v_bank_loc               banks.bank_plnt_loc_id%TYPE;
"
"       v_forwd_contrct_exrate   exc_contr_hd.ech_fc_ex_rate%TYPE;
"
"       v_ln_seq_no              bank_trans_dist_ln.btdln_seq_no%TYPE;
"
"       v_grn_refer              suplr_doc_hd_hist.suphdh_grn_refer%TYPE;
"
"       v_bank_ex_rate           NUMBER;
"
"       v_trans_ex_rate          NUMBER;
"
"    BEGIN
"
"       v_base_curcy := func_find_base_currency (p_bu);
"
"
"
"       IF p_doc_type = 'BT'
"
"       THEN
"
"          v_bank_curcy := func_find_bank_currency (p_bu, p_bank_cash);
"
"          v_bank_unit := func_find_bank_unit (p_bu, p_bank_cash);
"
"          v_bank_loc := func_find_bank_loc (p_bu, p_bank_cash);
"
"       ELSIF p_doc_type = 'CT'
"
"       THEN
"
"          v_bank_curcy := v_base_curcy;
"
"          v_bank_unit := func_find_cash_unit (p_bu, p_bank_cash);
"
"          v_bank_loc := func_find_cash_loc (p_bu, p_bank_cash);
"
"       ELSIF p_doc_type = 'AD'
"
"       THEN
"
"          v_bank_curcy := func_find_base_currency (p_bu);
"
"       --   v_bank_unit := func_find_cash_unit (p_bu, p_bank_cash);
"
"       --   v_bank_loc := func_find_cash_loc (p_bu, p_bank_cash);
"
"       END IF;
"
"
"
"       v_bank_ex_rate :=
"
"          func_find_exchange_rate (p_bu,
"
"                                   v_bank_curcy,
"
"                                   v_base_curcy,
"
"                                   p_trans_date,
"
"                                   'PO');
"
"
"
"       /* PAYMENT PROCESS STARTS HERE */
"
"       IF p_trans_mode IN ('P', 'S')
"
"       THEN
"
"          /* Bank Payment */
"
"          IF p_doc_type = 'BT'
"
"          THEN
"
"             /* Single Payment */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                --raise_application_error(-20999,'GLM');
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   --raise_application_error(-20999,'GLM');
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'P',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      v_chq_no := func_find_next_chq_num (p_bu, p_bank_cash, 1);
"
"                   ELSE
"
"                      v_chq_no := NULL;
"
"                   END IF;
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt),
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'BPV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      proc_upd_chq_no (p_bu,
"
"                                       v_pfx,
"
"                                       v_pfx_no,
"
"                                       p_bank_cash,
"
"                                       v_chq_no,
"
"                                       p_trans_date,
"
"                                       NULL,
"
"                                       ABS (cr1.cr_amt - cr1.db_amt),
"
"                                       'PAYMENT AGAINST ',
"
"                                       'N',
"
"                                       p_user,
"
"                                       SYSDATE,
"
"                                       1);
"
"                   END IF;
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'DR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         v_ln_seq_no := c3%ROWCOUNT;
"
"                         v_forwd_contrct_exrate :=
"
"                            func_find_frwd_cntrct_exrate (p_bu,
"
"                                                          p_bank_cash,
"
"                                                          cr4.par_suplr_id,
"
"                                                          cr4.par_suplr_doc_no,
"
"                                                          cr4.par_suplr_doc_date,
"
"                                                          cr4.par_currency,
"
"                                                          cr4.pdd_pay_amt,
"
"                                                          v_bank_curcy,
"
"                                                          v_base_curcy,
"
"                                                          p_trans_date,
"
"                                                          cr4.par_pfx,
"
"                                                          cr4.par_doc_no,
"
"                                                          cr4.par_exchange_rate);
"
"                         --proc_debug_proc(v_forwd_contrct_exrate||' v_forwd_contrct_exrate');
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            --v_forwd_contrct_exrate,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END ,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"							AND sddh_doc_no = cr4.par_doc_no
"
"							AND sddh_seq_no = cr4.pdd_seq_no;
"
"
"
"                         UPDATE bank_trans
"
"                            SET btrans_trans_base_exrate = v_forwd_contrct_exrate,
"
"                                btrans_trans_base_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate,
"
"                                btrans_trans_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate,
"
"                                btrans_bank_rgl_amt =
"
"                                   ABS (cr1.cr_amt - cr1.db_amt)
"
"                                   * v_forwd_contrct_exrate
"
"                          WHERE     btrans_bu = p_bu
"
"                                AND btrans_ord_pfx = v_pfx
"
"                                AND btrans_ord_no = v_pfx_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BPV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                     proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'P',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      v_chq_no := func_find_next_chq_num (p_bu, p_bank_cash, 1);
"
"                   ELSE
"
"                      v_chq_no := NULL;
"
"                   END IF;
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt),
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'BPV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   IF p_pay_mode = 'Q'
"
"                   THEN
"
"                      proc_upd_chq_no (p_bu,
"
"                                       v_pfx,
"
"                                       v_pfx_no,
"
"                                       p_bank_cash,
"
"                                       v_chq_no,
"
"                                       p_trans_date,
"
"                                       NULL,
"
"                                       ABS (cr2.cr_amt - cr2.db_amt),
"
"                                       'PAYMENT AGAINST ',
"
"                                       'N',
"
"                                       p_user,
"
"                                       SYSDATE,
"
"                                       1);
"
"                   END IF;
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         -- 1,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BPV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             END IF;
"
"          /*ADVICE */
"
"          ELSIF p_doc_type = 'AD'
"
"          THEN
"
"             /* Single Payment */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_dflt_pfx (p_bu,
"
"                                          p_dflt_unit,
"
"                                          p_user,
"
"                                          'PA',
"
"                                          'FIN');
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      p_dflt_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      'T',
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt),
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'PA',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => p_plnt_loc_id);
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         p_dflt_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'DR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         v_ln_seq_no := c3%ROWCOUNT;
"
"                         --proc_debug_proc(v_forwd_contrct_exrate||' v_forwd_contrct_exrate');
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            p_dflt_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            --v_forwd_contrct_exrate,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                   flush_bank_trans_dist_ln (l_dist_rows);
"
"                   flush_bank_trans_ref_det (l_ref_rows);
"
"            END LOOP;
"
"             /* MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   --RAISE_APPLICATION_ERROR(-20999,p_dflt_unit);
"
"                   v_pfx :=
"
"                      func_find_dflt_pfx (p_bu,
"
"                                          p_plnt,
"
"                                          p_user,
"
"                                          'PA',
"
"                                          'FIN');
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      p_plnt,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      'P',
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      v_chq_no,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt),
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'PAYMENT AGAINST ',
"
"                      'PA',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => p_plnt_loc);
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         p_plnt,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.cr_amt - cr3.db_amt),
"
"                         ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         -- 1,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         'S',
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            p_plnt,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                flush_bank_trans_dist_ln (l_dist_rows);
"
"                flush_bank_trans_ref_det (l_ref_rows);
"
"          END LOOP;
"
"          END IF;
"
"          /* CASH PAYMENT */
"
"          ELSIF p_doc_type = 'CT'
"
"          THEN
"
"             /* SINGLE CASH PAYMENT*/
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   IF cr1.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'P',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c1%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr1.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         'P',
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr1.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_bank_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt),
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.cr_amt - cr1.db_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'PAYMENT AGAINST ',
"
"                         'CPV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3
"
"                         IN c3 (cr1.par_currency,
"
"                                cr1.par_suplr_id,
"
"                                cr1.par_bfcry_type)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.cr_amt - cr3.db_amt),
"
"                            ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,                                       --'DR',
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'S',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"                         proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CPV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"
"
"
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* CASH MERGE PAYMENT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   IF cr2.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'P',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c2%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr2.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         'P',
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr2.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_bank_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt),
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.cr_amt - cr2.db_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'PAYMENT AGAINST ',
"
"                         'CPV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                      LOOP
"
"                         --raise_application_error(-20999,'HRM');
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.cr_amt - cr3.db_amt),
"
"                            ABS (cr3.cr_amt_bc - cr3.db_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'S',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               TO_NUMBER (c3%ROWCOUNT),
"
"                               TO_NUMBER (c4%ROWCOUNT),
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"                         proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CPV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            TO_NUMBER (c3%ROWCOUNT),
"
"                                            p_user,
"
"                                            1);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"
"
"             END IF;
"
"          END IF;
"
"       /* PAYMENT PROCESS ENDS  HERE */
"
"
"
"       /* RECEIPT  PROCESS STARTS HERE */
"
"       ELSIF p_trans_mode = 'R'
"
"       THEN
"
"          IF p_doc_type = 'BT'
"
"          THEN
"
"             /* Single Receipt */
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'R',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c1%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr1.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      p_trans_mode,
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr1.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_bank_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt),
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'RECEIPT AGAINST INVOICES',
"
"                      'BRV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   --     RAISE_APPLICATION_ERROR(-20999,'HRM'||cr1.par_currency||cr1.par_suplr_id||cr1.par_bfcry_type);
"
"
"
"                   FOR cr3
"
"                      IN c3 (cr1.par_currency,
"
"                             cr1.par_suplr_id,
"
"                             cr1.par_bfcry_type)
"
"                   LOOP
"
"                      --  RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.db_amt - cr3.cr_amt),
"
"                         ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,                                          --'CR',
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr3.par_bfcry_type,
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE sddh_bu = p_bu
"
"                            AND sddh_doc_no = cr4.par_doc_no
"
"                            AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"                      proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BRV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* MERGE RECEIPT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   v_pfx :=
"
"                      func_find_bank_pfx (p_bu,
"
"                                          p_bank_cash,
"
"                                          'R',
"
"                                          p_user);
"
"                   v_pfx_no :=
"
"                      func_find_pfx_nextno (p_bu,
"
"                                            p_trans_date,
"
"                                            v_pfx,
"
"                                            p_user);
"
"
"
"                   IF c2%ROWCOUNT = 1
"
"                   THEN
"
"                      v_first_no := v_pfx_no;
"
"                   END IF;
"
"
"
"                   v_trans_ex_rate :=
"
"                      func_find_exchange_rate (p_bu,
"
"                                               cr2.par_currency,
"
"                                               v_base_curcy,
"
"                                               p_trans_date,
"
"                                               'PO');
"
"                   --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_bank_curcy||'~'||v_base_curcy||'~'||p_trans_date||'~'||cr2.par_currency);
"
"                   proc_ins_bank_trans (
"
"                      p_bu,
"
"                      v_pfx,
"
"                      v_pfx_no,
"
"                      v_bank_unit,
"
"                      p_trans_date,
"
"                      p_doc_type,
"
"                      p_bank_cash,
"
"                      p_trans_mode,
"
"                      p_pay_mode,
"
"                      p_trans_date,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      v_bank_curcy,
"
"                      cr2.par_currency,
"
"                      v_base_curcy,
"
"                      v_bank_ex_rate,
"
"                      v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_bank_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt),
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                      'N',
"
"                      'RECEIPT AGAINST INVOICES',
"
"                      'BRV',
"
"                      p_user,
"
"                      SYSDATE,
"
"                      p_loc_id   => v_bank_loc);
"
"
"
"                   FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                   LOOP
"
"                      IF cr3.cr_amt - cr3.db_amt > 0
"
"                      THEN
"
"                         v_dr_cr := 'DR';
"
"                      ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                      THEN
"
"                         v_dr_cr := 'CR';
"
"                      END IF;
"
"
"
"                      queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         c3%ROWCOUNT,
"
"                         v_bank_unit,
"
"                         'R',
"
"                         cr3.glal_plant,
"
"                         cr3.glal_lvl1,
"
"                         cr3.glal_lvl2,
"
"                         cr3.glal_lvl3,
"
"                         cr3.glal_lvl4,
"
"                         cr3.glal_lvl5,
"
"                         cr3.glal_lvl6,
"
"                         cr3.glal_lvl_prj,
"
"                         cr3.glal_cc_code,
"
"                         cr3.glal_acct,
"
"                         ABS (cr3.db_amt - cr3.cr_amt),
"
"                         ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                         NULL,
"
"                         v_dr_cr,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         cr3.par_currency,
"
"                         cr3.par_exchange_rate,
"
"                         0,
"
"                         0,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         cr3.par_bfcry_type,
"
"                         cr3.par_suplr_id,
"
"                         cr3.par_bfcry_type,
"
"                         --cr3.par_loc_id
"
"                         NULL,
"
"                         p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                      FOR cr4 IN c4 (cr3.glal_plant,
"
"                                     cr3.glal_lvl1,
"
"                                     cr3.glal_lvl2,
"
"                                     cr3.glal_lvl3,
"
"                                     cr3.glal_lvl4,
"
"                                     cr3.glal_lvl5,
"
"                                     cr3.glal_lvl6,
"
"                                     cr3.glal_lvl_prj,
"
"                                     cr3.glal_plnt_loc_id,
"
"                                     cr3.glal_acct,
"
"                                     cr3.par_currency,
"
"                                     cr3.par_suplr_id,
"
"                                     cr3.par_bfcry_type,
"
"                                     cr3.par_acct_type)
"
"                      LOOP
"
"                         IF cr4.par_dr_cr = 'DR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                         ELSIF cr4.par_dr_cr = 'CR'
"
"                         THEN
"
"                            v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                         END IF;
"
"
"
"                         queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            v_bank_unit,
"
"                            c3%ROWCOUNT,
"
"                            c4%ROWCOUNT,
"
"                            cr4.par_doc_date,
"
"                            cr4.par_pfx,
"
"                            cr4.par_doc_no,
"
"                            cr4.par_plant,
"
"                            cr4.par_bfcry_type,
"
"                            cr4.par_suplr_id,
"
"                            cr4.pdd_seq_no,
"
"                            cr4.pdd_due_date,
"
"                            cr4.par_aged_days,
"
"                            cr4.pdd_due_amt,
"
"                            cr4.pdd_pay_amt,
"
"                            cr4.par_acct_type,
"
"                            v_dr_cr,
"
"                            cr4.par_currency,
"
"                            cr4.par_exchange_rate,
"
"                            cr4.par_suplr_reference,
"
"                            cr4.par_suplr_doc_date,
"
"                            cr4.par_suplr_doc_no,
"
"                            cr4.par_doc_type,
"
"                            --cr4.par_doc_mode,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            --cr4.par_loc_id,
"
"                            cr4.par_loc_name,
"
"                            cr4.par_ref_bu,
"
"                            cr4.par_ref_inv_pfx,
"
"                            cr4.par_ref_inv_no,
"
"                            cr4.par_ref_plnt,
"
"                            cr4.par_bill_amt,
"
"                            p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                            p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                            p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                         UPDATE suplr_doc_disc_hist
"
"                            SET sddh_check_flag = 'N', sddh_user = NULL
"
"                          WHERE     sddh_bu = p_bu
"
"                                --   AND sddh_pfx = cr4.par_pfx
"
"                                AND sddh_doc_no = cr4.par_doc_no
"
"                                AND sddh_seq_no = cr4.pdd_seq_no;
"
"                      END LOOP;
"
"                      proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      flush_bank_trans_dist_ln (l_dist_rows);
"
"                      flush_bank_trans_ref_det (l_ref_rows);
"
"                      proc_adjust_bills (p_bu,
"
"                                         'BRV',
"
"                                         v_pfx,
"
"                                         v_pfx_no,
"
"                                         c3%ROWCOUNT,
"
"                                         p_user,
"
"                                         1);
"
"                   END LOOP;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             END IF;
"
"          /* CASH RECEIPT */
"
"          ELSIF p_doc_type = 'CT'
"
"          THEN
"
"             /* SINGLE CASH RECEIPT*/
"
"             IF p_pay_type = 'S'
"
"             THEN
"
"                FOR cr1 IN c1
"
"                LOOP
"
"
"
"                   IF cr1.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'R',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"
"
"                      IF c1%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr1.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         p_trans_mode,
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr1.par_currency,
"
"                         v_base_curcy,
"
"                         v_bank_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_bank_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt),
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr1.db_amt - cr1.cr_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'RECEIPT AGAINST ',
"
"                         'CRV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3
"
"                         IN c3 (cr1.par_currency,
"
"                                cr1.par_suplr_id,
"
"                                cr1.par_bfcry_type)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.db_amt - cr3.cr_amt),
"
"                            ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,                                       --'CR',
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'C',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CRV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"						 proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                     proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             /* CASH MERGE RECEIPT */
"
"             ELSIF p_pay_type = 'M'
"
"             THEN
"
"                FOR cr2 IN c2
"
"                LOOP
"
"                   IF cr2.par_currency = v_base_curcy
"
"                   THEN
"
"                      v_pfx :=
"
"                         func_find_cash_pfx (p_bu,
"
"                                             p_bank_cash,
"
"                                             'R',
"
"                                             p_user);
"
"                      v_pfx_no :=
"
"                         func_find_pfx_nextno (p_bu,
"
"                                               p_trans_date,
"
"                                               v_pfx,
"
"                                               p_user);
"
"
"
"                      IF c2%ROWCOUNT = 1
"
"                      THEN
"
"                         v_first_no := v_pfx_no;
"
"                      END IF;
"
"
"
"                      v_trans_ex_rate :=
"
"                         func_find_exchange_rate (p_bu,
"
"                                                  cr2.par_currency,
"
"                                                  v_base_curcy,
"
"                                                  p_trans_date,
"
"                                                  'PO');
"
"                      proc_ins_bank_trans (
"
"                         p_bu,
"
"                         v_pfx,
"
"                         v_pfx_no,
"
"                         v_bank_unit,
"
"                         p_trans_date,
"
"                         p_doc_type,
"
"                         p_bank_cash,
"
"                         p_trans_mode,
"
"                         'C',
"
"                         p_trans_date,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_bank_curcy,
"
"                         cr2.par_currency,
"
"                         v_base_curcy,
"
"                         v_trans_ex_rate,
"
"                         v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt),
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         ABS (cr2.db_amt - cr2.cr_amt) * v_trans_ex_rate,
"
"                         'N',
"
"                         'RECEIPT AGAINST ',
"
"                         'CRV',
"
"                         p_user,
"
"                         SYSDATE,
"
"                         p_loc_id   => v_bank_loc);
"
"
"
"                      FOR cr3 IN c3 (cr2.par_currency, NULL, NULL)
"
"                      LOOP
"
"                         IF cr3.cr_amt - cr3.db_amt > 0
"
"                         THEN
"
"                            v_dr_cr := 'DR';
"
"                         ELSIF cr3.cr_amt - cr3.db_amt < 0
"
"                         THEN
"
"                            v_dr_cr := 'CR';
"
"                         END IF;
"
"
"
"                         queue_bank_trans_dist_ln (l_dist_rows,
"
"                             l_dist_rows.COUNT + 1,
"
"                            p_bu,
"
"                            v_pfx,
"
"                            v_pfx_no,
"
"                            c3%ROWCOUNT,
"
"                            v_bank_unit,
"
"                            'R',
"
"                            cr3.glal_plant,
"
"                            cr3.glal_lvl1,
"
"                            cr3.glal_lvl2,
"
"                            cr3.glal_lvl3,
"
"                            cr3.glal_lvl4,
"
"                            cr3.glal_lvl5,
"
"                            cr3.glal_lvl6,
"
"                            cr3.glal_lvl_prj,
"
"                            cr3.glal_cc_code,
"
"                            cr3.glal_acct,
"
"                            ABS (cr3.db_amt - cr3.cr_amt),
"
"                            ABS (cr3.db_amt_bc - cr3.cr_amt_bc),
"
"                            NULL,
"
"                            v_dr_cr,
"
"                            NULL,
"
"                            'N',
"
"                            NULL,
"
"                            cr3.par_currency,
"
"                            cr3.par_exchange_rate,
"
"                            0,
"
"                            0,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'C',
"
"                            cr3.par_suplr_id,
"
"                            cr3.par_bfcry_type,
"
"                            --cr3.par_loc_id,
"
"                            NULL,
"
"                            p_loc_id   => cr3.glal_plnt_loc_id);
"
"
"
"                         FOR cr4 IN c4 (cr3.glal_plant,
"
"                                        cr3.glal_lvl1,
"
"                                        cr3.glal_lvl2,
"
"                                        cr3.glal_lvl3,
"
"                                        cr3.glal_lvl4,
"
"                                        cr3.glal_lvl5,
"
"                                        cr3.glal_lvl6,
"
"                                        cr3.glal_lvl_prj,
"
"                                        cr3.glal_plnt_loc_id,
"
"                                        cr3.glal_acct,
"
"                                        cr3.par_currency,
"
"                                        cr3.par_suplr_id,
"
"                                        cr3.par_bfcry_type,
"
"                                        cr3.par_acct_type)
"
"                         LOOP
"
"                            IF cr4.par_dr_cr = 'DR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'DR', 'CR');
"
"                            ELSIF cr4.par_dr_cr = 'CR'
"
"                            THEN
"
"                               v_dr_cr := TRANSLATE (cr4.par_dr_cr, 'CR', 'DR');
"
"                            END IF;
"
"
"
"                            queue_bank_trans_ref_det (l_ref_rows, l_ref_rows.COUNT + 1,
"
"                               p_bu,
"
"                               v_pfx,
"
"                               v_pfx_no,
"
"                               v_bank_unit,
"
"                               c3%ROWCOUNT,
"
"                               c4%ROWCOUNT,
"
"                               cr4.par_doc_date,
"
"                               cr4.par_pfx,
"
"                               cr4.par_doc_no,
"
"                               cr4.par_plant,
"
"                               cr4.par_bfcry_type,
"
"                               cr4.par_suplr_id,
"
"                               cr4.pdd_seq_no,
"
"                               cr4.pdd_due_date,
"
"                               cr4.par_aged_days,
"
"                               cr4.pdd_due_amt,
"
"                               cr4.pdd_pay_amt,
"
"                               cr4.par_acct_type,
"
"                               v_dr_cr,
"
"                               cr4.par_currency,
"
"                               cr4.par_exchange_rate,
"
"                               cr4.par_suplr_reference,
"
"                               cr4.par_suplr_doc_date,
"
"                               cr4.par_suplr_doc_no,
"
"                               cr4.par_doc_type,
"
"                               --cr4.par_doc_mode,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               --cr4.par_loc_id,
"
"                               cr4.par_loc_name,
"
"                               cr4.par_ref_bu,
"
"                               cr4.par_ref_inv_pfx,
"
"                               cr4.par_ref_inv_no,
"
"                               cr4.par_ref_plnt,
"
"                               cr4.par_bill_amt,
"
"                               p_bill_tax_amt   => NVL (cr4.par_tax_amt, 0),
"
"                               p_proj_id        => CASE WHEN v_arm_prj_req='C' THEN cr3.glal_cc_code ELSE cr4.par_proj_id END,
"
"                               p_plnt_loc_id    => cr4.par_plnt_loc_id);
"
"
"
"                            UPDATE suplr_doc_disc_hist
"
"                               SET sddh_check_flag = 'N', sddh_user = NULL
"
"                             WHERE sddh_bu = p_bu
"
"                               AND sddh_doc_no = cr4.par_doc_no
"
"                               AND sddh_seq_no = cr4.pdd_seq_no;
"
"                         END LOOP;
"
"
"
"                         flush_bank_trans_dist_ln (l_dist_rows);
"
"                         flush_bank_trans_ref_det (l_ref_rows);
"
"                         proc_adjust_bills (p_bu,
"
"                                            'CRV',
"
"                                            v_pfx,
"
"                                            v_pfx_no,
"
"                                            c3%ROWCOUNT,
"
"                                            p_user,
"
"                                            1);
"
"						 proc_web_commit_ref_det (p_bu,v_pfx,v_pfx_no,c3%ROWCOUNT);
"
"                      END LOOP;
"
"                   END IF;
"
"
"
"                   FOR cr5 IN c5 (v_pfx, v_pfx_no)
"
"                   LOOP
"
"                      DELETE FROM bank_trans_ref_det
"
"                       WHERE btr_bu = p_bu
"
"                         AND btr_ord_no = cr5.btdln_ord_no
"
"                         AND btr_seq_no = cr5.btdln_seq_no;
"
"
"
"                      DELETE FROM bank_trans_dist_ln
"
"                       WHERE btdln_bu = p_bu
"
"                         AND btdln_ord_no = cr5.btdln_ord_no
"
"                         AND btdln_seq_no = cr5.btdln_seq_no;
"
"                   END LOOP;
"
"                   proc_upd_btrans_ref_bill_det(p_bu,v_pfx,v_pfx_no,p_user);
"
"                END LOOP;
"
"             END IF;
"
"          END IF;
"
"       END IF;
"
"
"
"       /* RECEIPT  PROCESS ENDS HERE */
"
"       IF v_pfx || v_pfx_no IS NOT NULL
"
"       THEN
"
"          IF v_first_no = v_pfx_no
"
"          THEN
"
"             p_ord_no := '-' || v_first_no;
"
"          ELSE
"
"             p_ord_no := ' from ' || v_first_no || ' to ' || v_pfx_no;
"
"          END IF;
"
"       ELSIF v_pfx || v_pfx_no IS NULL
"
"       THEN
"
"          p_ord_no := 'NO_DOC';
"
"       END IF;
"
"
"
"       p_pfx_no := v_pfx || v_pfx_no;
"
"    END;
"
"END;"
/
