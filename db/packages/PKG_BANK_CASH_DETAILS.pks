CREATE OR REPLACE
"PACKAGE        pkg_bank_cash_details
"
"AS
"
"   PROCEDURE proc_account_bank_details (
"
"      p_bu                      IN     VARCHAR2,
"
"      p_btdln_acct              IN     VARCHAR2,
"
"      p_btdln_acct_desc            OUT VARCHAR2,
"
"      p_lgr_bfcry_id               OUT VARCHAR2,
"
"      p_btdln_bfcry_id             OUT VARCHAR2,
"
"      p_btdln_ref_bu               OUT VARCHAR2,
"
"      p_btdln_bfcry_type           OUT VARCHAR2,
"
"      p_lgr_bfcry_desc             OUT VARCHAR2,
"
"      p_btdln_acct_type            OUT VARCHAR2,
"
"      p_btdln_gstin_no             OUT VARCHAR2,
"
"      p_btdln_state_code           OUT VARCHAR2,
"
"      p_btdln_gst_type             OUT VARCHAR2,
"
"      p_btdln_suplr_type           OUT VARCHAR2,
"
"      p_btrans_trans_curcy      IN     VARCHAR2,
"
"      p_btrans_trs_bse_exrate   IN     NUMBER,
"
"      p_btdln_ref_type             OUT VARCHAR2,
"
"      p_btdln_curr                 OUT VARCHAR2,
"
"      p_btln_exrate                OUT NUMBER,
"
"      p_btdln_dist_amt             OUT NUMBER,
"
"      p_btdln_lvl1                 OUT VARCHAR2,
"
"      p_btdln_lvl2                 OUT VARCHAR2,
"
"      p_btdln_lvl3                 OUT VARCHAR2,
"
"      p_btdln_lvl4                 OUT VARCHAR2,
"
"      p_btdln_lvl5                 OUT VARCHAR2,
"
"      p_btdln_lvl6                 OUT VARCHAR2,
"
"      p_btdln_cc_code              OUT VARCHAR2,
"
"      p_btdln_lvl_prj              OUT VARCHAR2,
"
"      p_btdln_acct_plant           OUT VARCHAR2,
"
"      p_cost_cen_desc              OUT VARCHAR2,
"
"      p_plnt_loc_id                OUT VARCHAR2,
"
"      p_btdln_cwp_asset_id         OUT VARCHAR2,
"
"      p_btdln_gst_sulr_name        OUT VARCHAR2,
"
"      p_btdln_gst_pan_no           OUT VARCHAR2,
"
"      p_btdln_gst_pan_avail        OUT VARCHAR2,
"
"      p_btdln_hsn_code             OUT VARCHAR2,
"
"      p_btrans_plant             IN    VARCHAR2 DEFAULT NULL);
"
"
"
"
"
"   PROCEDURE proc_cash_assign_party(p_bu                      VARCHAR2,
"
"                                    p_user                    VARCHAR2,
"
"                                    p_btdln_acct     IN       VARCHAR2,
"
"                                    p_bfcry_type     IN       VARCHAR2,
"
"                                    p_lgr_bfcry_id   OUT      VARCHAR2,
"
"                                    p_lgr_desc       IN       VARCHAR2,
"
"                                    p_acct_type      OUT      VARCHAR2,
"
"                                    p_ref_bu         IN       VARCHAR2,
"
"                                    p_lvl1           OUT      VARCHAR2,
"
"                                    p_lvl2           OUT      VARCHAR2,
"
"                                    p_lvl3           OUT      VARCHAR2,
"
"                                    p_lvl4           OUT      VARCHAR2,
"
"                                    p_lvl5           OUT      VARCHAR2,
"
"                                    p_lvl6           OUT      VARCHAR2,
"
"                                    p_lvl_prj        OUT      VARCHAR2,
"
"                                    p_acct_plant     OUT      VARCHAR2,
"
"                                    p_cost_desc      OUT      VARCHAR2,
"
"                                    p_cc_code        OUT      VARCHAR2,
"
"                                    p_plnt_loc_id    OUT      VARCHAR2,
"
"                                    p_state_code     OUT      VARCHAR2,
"
"                                    p_gstin_no       OUT      VARCHAR2,
"
"                                    p_gst_type       OUT      VARCHAR2,
"
"                                    p_suplr_type     OUT      VARCHAR2,
"
"                                    p_gst_sulr_name  OUT      VARCHAR2,
"
"                                    p_gst_pan_no     OUT      VARCHAR2,
"
"                                    p_gst_pan_avail  OUT      VARCHAR2,
"
"                                    p_lang                    NUMBER
"
"                                    );
"
"
"
"    PROCEDURE proc_cash_rcpt_acc_asgn(p_bu                              VARCHAR2,
"
"                                      p_btdln_acct              IN OUT  VARCHAR2,
"
"                                      p_btdln_acct_desc         OUT     VARCHAR2,
"
"                                         p_lgr_bfcry_id            OUT     VARCHAR2,
"
"                                      p_hsn_code                OUT     VARCHAR2,
"
"                                      p_bfcry_id                OUT     VARCHAR2,
"
"                                      p_ref_bu                  OUT     VARCHAR2,
"
"                                      p_bfcry_type              OUT     VARCHAR2,
"
"                                      p_lgr_bfcry_desc          OUT     VARCHAR2,
"
"                                      p_acct_type               OUT     VARCHAR2,
"
"                                      p_btdln_gstin_no          OUT     VARCHAR2,
"
"                                      p_btdln_state_code        OUT     VARCHAR2,
"
"                                      p_btdln_gst_type          OUT     VARCHAR2,
"
"                                      p_btdln_suplr_type        OUT     VARCHAR2,
"
"                                      p_btrans_trans_curcy              VARCHAR2,
"
"                                      p_trans_base_exrate               NUMBER,
"
"                                      p_btdln_ref_type          OUT     VARCHAR2,
"
"                                      p_btdln_curr              OUT     VARCHAR2,
"
"                                      p_btln_exrate             OUT     NUMBER,
"
"                                      p_btdln_dist_amt          OUT     NUMBER,
"
"                                      p_btdln_lvl1              OUT     VARCHAR2,
"
"                                      p_btdln_lvl2              OUT     VARCHAR2,
"
"                                      p_btdln_lvl3              OUT     VARCHAR2,
"
"                                      p_btdln_lvl4              OUT     VARCHAR2,
"
"                                      p_btdln_lvl5              OUT     VARCHAR2,
"
"                                      p_btdln_lvl6              OUT     VARCHAR2,
"
"                                      p_btdln_cc_code           OUT     VARCHAR2,
"
"                                      p_btdln_lvl_prj           OUT     VARCHAR2,
"
"                                      p_btdln_acct_plant        OUT     VARCHAR2,
"
"                                      p_cost_cen_desc           OUT     VARCHAR2,
"
"                                      p_cwp_asset_id            OUT     VARCHAR2,
"
"                                      p_btdln_gst_sulr_name     OUT     VARCHAR2,
"
"                                      p_btdln_gst_pan_no        OUT     VARCHAR2,
"
"                                      p_btdln_gst_pan_avail     OUT     VARCHAR2
"
"                                     );
"
"
"
"
"
"PROCEDURE proc_ins_ref_dtls(p_bu                         VARCHAR2,
"
"                            p_ord_pfx                    VARCHAR2,
"
"                            p_ord_no                     VARCHAR2,
"
"                            p_seq_no                     VARCHAR2,
"
"                            p_fmt_mask                   VARCHAR2,
"
"                            p_btr_agnt_ref               VARCHAR2,
"
"                            p_btr_trans_amt              VARCHAR2,
"
"                            p_btr_doc_pfx                VARCHAR2,
"
"                            p_btr_doc_no                 VARCHAR2,
"
"                            p_btr_adv_doc_no             VARCHAR2,
"
"                            p_btr_due_no                 VARCHAR2,
"
"                            p_btr_doc_tds_amt            VARCHAR2,
"
"                            p_btr_dr_cr_type               VARCHAR2,
"
"                            p_btr_doc_amt       IN  OUT  VARCHAR2,
"
"                            p_btr_currency          OUT  VARCHAR2,
"
"                            p_btr_exchange_rate     OUT  VARCHAR2,
"
"                            p_btr_org_bfcry_type    OUT  VARCHAR2,
"
"                            p_btr_org_bcfry_id      OUT  VARCHAR2,
"
"                            p_btr_lgr_type          OUT  VARCHAR2,
"
"                            p_btr_plnt_loc_id       OUT  VARCHAR2,
"
"                            p_btr_proj_id           OUT  VARCHAR2,
"
"                            p_btr_off_bal_amt       OUT  VARCHAR2,
"
"                            p_btr_doc_amt_bfr_tds   OUT  VARCHAR2,
"
"                            p_pay_amt_bc            OUT  VARCHAR2,
"
"                            p_btr_tds_assbl_val     OUT  VARCHAR2,
"
"                            p_trans_amt_dummy     IN OUT VARCHAR2,
"
"                            p_btr_sub_seq_no        IN     NUMBER DEFAULT NULL,
"
"                            p_btr_off_bal_amt1      IN     NUMBER   DEFAULT 0,
"
"                            p_btr_doc_amt1          IN     NUMBER   DEFAULT 0
"
"                            );
"
"
"
"PROCEDURE proc_upd_gst_dtls(p_bu                         VARCHAR2,
"
"                            p_ord_pfx                    VARCHAR2,
"
"                            p_ord_no                     VARCHAR2,
"
"                            p_seq_no                     VARCHAR2,
"
"                            p_btdln_state_code           VARCHAR2,
"
"                            p_btdln_gst_suplr            VARCHAR2,
"
"                            p_btdln_gstin_no             VARCHAR2,
"
"                            p_btdln_gst_pan_avail        VARCHAR2,
"
"                            p_btdln_gst_pan_no           VARCHAR2,
"
"                            p_btdln_suplr_bill_no        VARCHAR2,
"
"                            p_btdln_suplr_bill_date      DATE,
"
"                            p_btdln_gst_type             VARCHAR2,
"
"                            p_btdln_suplr_type           VARCHAR2,
"
"                            p_btdln_supply_type          VARCHAR2,
"
"                            p_btdln_input_type           VARCHAR2,
"
"                            p_btdln_gst_rev_tax_cat      VARCHAR2,
"
"                            p_btdln_gst_rev_tax_flag     VARCHAR2,
"
"                            p_btdln_port_code            VARCHAR2,
"
"                            p_btdln_boe_date             DATE,
"
"                            p_btdln_boe_no               VARCHAR2,
"
"                            p_btdln_lc_po_pfx            VARCHAR2,
"
"                            p_btdln_lc_po_no             VARCHAR2,
"
"                            p_btdln_gst_supply           VARCHAR2,
"
"                            p_btdln_hsn_code             VARCHAR2 DEFAULT NULL,
"
"                            p_btdln_commodity_code  VARCHAR2 DEFAULT NULL
"
"                            );
"
"
"
"  PROCEDURE proc_web_pay_acct_party_dtls (p_bu                   IN VARCHAR2,
"
"                                          p_user                 IN VARCHAR2,
"
"                                          p_btrans_ord_pfx       IN VARCHAR2,
"
"                                          p_btrans_ord_no        IN VARCHAR2,
"
"                                          p_btdln_acct           IN VARCHAR2,
"
"                                          p_btdln_acct_desc      OUT VARCHAR2,
"
"                                          p_btdln_lgr_bfcry_id   IN OUT VARCHAR2,
"
"                                          p_btdln_hsn_code       OUT VARCHAR2,
"
"                                          p_btdln_acct_no        OUT VARCHAR2,
"
"                                          p_btdln_ref_bu         OUT VARCHAR2,
"
"                                          p_btdln_curr           OUT VARCHAR2,
"
"                                          p_btln_exrate          OUT VARCHAR2,
"
"                                          p_btdln_bfcry_type     IN OUT VARCHAR2,
"
"                                          p_btdln_branch_desc    OUT VARCHAR2,
"
"                                          p_btdln_lgr_bfcry_desc OUT VARCHAR2,
"
"                                          p_btdln_ifsc_code      OUT VARCHAR2,
"
"                                          p_btdln_bnk_acct_type  OUT VARCHAR2,
"
"                                          p_btdln_pay_to_name    OUT VARCHAR2,
"
"                                          p_btdln_ref_type       OUT VARCHAR2,
"
"                                          p_btdln_lvl1           OUT VARCHAR2,
"
"                                          p_btdln_lvl2           OUT VARCHAR2,
"
"                                          p_btdln_lvl3           OUT VARCHAR2,
"
"                                          p_btdln_lvl4           OUT VARCHAR2,
"
"                                          p_btdln_lvl5           OUT VARCHAR2,
"
"                                          p_btdln_lvl6           OUT VARCHAR2,
"
"                                          p_btdln_cc_code        OUT VARCHAR2,
"
"                                          p_btdln_cc_name        OUT VARCHAR2,
"
"                                          p_btdln_lvl_prj        OUT VARCHAR2,
"
"                                          p_btdln_acct_plant     OUT VARCHAR2,
"
"                                          p_btdln_plnt_loc_id    OUT VARCHAR2,
"
"                                          p_btdln_acct_type      OUT VARCHAR2,
"
"                                          p_btdln_pay_bank_name  OUT VARCHAR2,
"
"                                          p_btdln_state_code     OUT VARCHAR2,
"
"                                          p_btdln_gstin_no       OUT VARCHAR2,
"
"                                          p_btdln_gst_type       OUT VARCHAR2,
"
"                                          p_btdln_suplr_type     OUT VARCHAR2,
"
"                                          p_btdln_gst_sulr_name  OUT VARCHAR2,
"
"                                          p_btdln_gst_pan_avail  OUT VARCHAR2,
"
"                                          p_btdln_gst_pan_no     OUT VARCHAR2,
"
"                                          p_cur_bal_bu           OUT VARCHAR2,
"
"                                          p_btdln_cfc_code       OUT VARCHAR2,
"
"                                          p_btdln_cfc_desc       OUT VARCHAR2,
"
"                                          p_btdln_xpnse_code     OUT VARCHAR2,
"
"                                          p_btdln_xpnse_desc     OUT VARCHAR2);
"
"
"
"   PROCEDURE proc_assign_tax_dtls(p_bu                   IN  VARCHAR2,
"
"                                  p_ord_no               IN  VARCHAR2,
"
"                                  p_seq_no               IN  NUMBER,
"
"                                  p_btdln_hsn_code       IN  VARCHAR2,
"
"                                  p_btdln_suplr_type     IN  VARCHAR2,
"
"                                  p_btdln_tax_assess_val IN  NUMBER,
"
"                                  p_btdln_tax_pct        OUT NUMBER,
"
"                                  p_btdln_cgst_amt       OUT NUMBER,
"
"                                  p_btdln_sgst_amt       OUT NUMBER,
"
"                                  p_btdln_igst_amt       OUT NUMBER,
"
"                                  p_btdln_utgst_amt      OUT NUMBER,
"
"                                  p_btdln_cess_pct       OUT NUMBER,
"
"                                  p_btdln_cess_amt       OUT NUMBER);
"
"
"
"    PROCEDURE proc_dill_down(p_bu           VARCHAR2,
"
"                             p_doc_pfx      VARCHAR2,
"
"                             p_doc_no       VARCHAR2,
"
"                             p_where        VARCHAR2,
"
"                             p_session      VARCHAR2,
"
"                             p_global_user   VARCHAR2,
"
"                             p_global_p      VARCHAR2,
"
"                             p_global_schema VARCHAR2,
"
"                             p_url       OUT VARCHAR2,
"
"                             p_bank          VARCHAR2 DEFAULT NULL,
"
"                             p_plnt          VARCHAR2 DEFAULT NULL);
"
"
"
"    PROCEDURE proc_valid_hsn(p_bu           VARCHAR2,
"
"                             p_doc_pfx      VARCHAR2,
"
"                             p_doc_no       VARCHAR2);
"
"    PROCEDURE proc_valid_rj (p_bu           VARCHAR2,
"
"                             p_doc_pfx      VARCHAR2,
"
"                             p_doc_no       VARCHAR2);
"
"
"
"    PROCEDURE proc_valid_min_max_exrate(p_bu      VARCHAR2,
"
"                                        p_curr_id VARCHAR2,
"
"                                        p_ex_rate NUMBER);
"
"
"
"    PROCEDURE proc_valid_pymnl_dist_ln (p_bu             VARCHAR2,
"
"                                        p_btrans_ord_pfx VARCHAR2,
"
"                                        p_btrans_ord_no  VARCHAR2);
"
"
"
"    FUNCTION func_valid_min_max_exrate(p_bu      VARCHAR2,
"
"                                        p_curr_id VARCHAR2,
"
"                                        p_ex_rate NUMBER)
"
"    RETURN VARCHAR2;
"
"   PROCEDURE proc_valid_bank_pymnt(p_bu VARCHAR2,p_ord_no VARCHAR2);
"
"END;"
/
