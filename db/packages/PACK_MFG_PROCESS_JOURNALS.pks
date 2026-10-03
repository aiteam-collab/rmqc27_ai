CREATE OR REPLACE
"PACKAGE pack_mfg_process_journals
"
"IS
"
"
"
"    PROCEDURE proc_cre_oprn_comp_wh_jrnls(
"
"                    p_bu        VARCHAR2,
"
"                    p_plnt        VARCHAR2,
"
"                    p_comp_doc_no    VARCHAR2,
"
"                    p_trans_no    VARCHAR2,
"
"                    p_trans_date    DATE,
"
"                    p_prod_ord_no    VARCHAR2,
"
"                    p_bom_no    VARCHAR,
"
"                    p_prod_id    VARCHAR2,
"
"                    p_prod_rev    NUMBER,
"
"                    p_comp_qty    NUMBER,
"
"                    p_unit_cost    NUMBER,
"
"                    p_lang        NUMBER,
"
"                    p_user        VARCHAR2
"
"                    );
"
"
"
"    PROCEDURE proc_cre_labour_oprn_comp_jrnl(
"
"                    p_bu        VARCHAR2,
"
"                    p_plnt        VARCHAR2,
"
"                    p_comp_doc_no    VARCHAR2,
"
"                    p_trans_no    VARCHAR2,
"
"                    p_trans_date    DATE,
"
"                    p_prod_ord_no    VARCHAR2,
"
"                    p_bom_no    VARCHAR,
"
"                    p_prod_id    VARCHAR2,
"
"                    p_prod_rev    NUMBER,
"
"                    p_comp_qty    NUMBER,
"
"                    p_unit_cost    NUMBER,
"
"                    p_lang        NUMBER,
"
"                    p_user        VARCHAR2
"
"                    );
"
"
"
"    PROCEDURE proc_cre_jrnl_ocw_to_poins_wh(
"
"                        p_bu        VARCHAR2,
"
"                        p_plnt        VARCHAR2,
"
"                        p_comp_doc_no    VARCHAR2,
"
"                        p_trans_no    VARCHAR2,
"
"                        p_trans_date    DATE,
"
"                        p_prod_ord_no    VARCHAR2,
"
"                        p_bom_no    VARCHAR,
"
"                        p_prod_id    VARCHAR2,
"
"                        p_prod_rev    NUMBER,
"
"                        p_comp_qty    NUMBER,
"
"                        p_unit_cost    NUMBER,
"
"                        p_sf_code    VARCHAR2,
"
"                        p_sys_ls_no    NUMBER,
"
"                        p_lang        NUMBER,
"
"                        p_user        VARCHAR2
"
"                        );
"
"
"
"
"
"     PROCEDURE proc_cre_jrnl_nqc_ocw_to_rcpt(
"
"                                            p_bu        VARCHAR2,
"
"                                            p_plnt        VARCHAR2,
"
"                                            p_plnt_loc_id    VARCHAR2,
"
"                                            p_comp_doc_no    VARCHAR2,
"
"                                            p_trans_no    VARCHAR2,
"
"                                            p_trans_date    DATE,
"
"                                            p_prod_ord_no    VARCHAR2,
"
"                                            p_bom_no    VARCHAR,
"
"                                            p_prod_id    VARCHAR2,
"
"                                            p_prod_rev    NUMBER,
"
"                                            p_comp_qty    NUMBER,
"
"                                            p_accept_qty    NUMBER,
"
"                                            p_rej_qty    NUMBER,
"
"                                            p_rcpt_store_id    VARCHAR2,
"
"                                            p_rej_store_id    VARCHAR2,
"
"                                            p_unit_cost    NUMBER,
"
"                                            p_sf_code    VARCHAR2,
"
"                                            p_sys_ls_no    NUMBER,
"
"                                            p_lang        NUMBER,
"
"                                            p_user        VARCHAR2
"
"                                            );
"
"
"
"
"
"
"
"      PROCEDURE proc_cre_jrnl_bq(
"
"                                p_bu        VARCHAR2,
"
"                                p_plnt        VARCHAR2,
"
"                                p_comp_doc_no    VARCHAR2,
"
"                                p_trans_no    VARCHAR2,
"
"                                p_trans_date    DATE,
"
"                                p_prod_ord_no    VARCHAR2,
"
"                                p_bom_no    VARCHAR2,
"
"                                p_prod_id    VARCHAR2,
"
"                                p_prod_rev    NUMBER,
"
"                                p_proc_qty    NUMBER,
"
"                                p_unit_cost    NUMBER,
"
"                                p_sf_code    VARCHAR2,
"
"                                p_sys_ls_no    NUMBER,
"
"                                p_lang        NUMBER,
"
"                                p_user        VARCHAR2
"
"                                );
"
"
"
"
"
"    PROCEDURE proc_cre_jrnl_aq(
"
"                                p_bu        VARCHAR2,
"
"                                p_plnt        VARCHAR2,
"
"                                p_comp_doc_no    VARCHAR2,
"
"                                p_trans_no    VARCHAR2,
"
"                                p_trans_date    DATE,
"
"                                p_prod_ord_no    VARCHAR2,
"
"                                p_qc_pfx    VARCHAR2,
"
"                                p_qc_no        VARCHAR2,
"
"                                p_qc_line    NUMBER,
"
"                                p_prod_id    VARCHAR2,
"
"                                p_prod_rev    NUMBER,
"
"                                p_accept_qty    NUMBER,
"
"                                p_reject_qty    NUMBER,
"
"                                p_unit_cost    NUMBER,
"
"                                p_sf_code    VARCHAR2,
"
"                                p_sys_ls_no    NUMBER,
"
"                                p_lang        NUMBER,
"
"                                p_user        VARCHAR2
"
"                                );
"
"
"
"
"
"PROCEDURE proc_cre_jrnl_aq_partial(
"
"                                    p_bu        VARCHAR2,
"
"                                    p_plnt        VARCHAR2,
"
"                                    p_comp_doc_no    VARCHAR2,
"
"                                    p_trans_no    VARCHAR2,
"
"                                    p_trans_date    DATE,
"
"                                    p_prod_ord_no    VARCHAR2,
"
"                                    p_qc_pfx    VARCHAR2,
"
"                                    p_qc_no        VARCHAR2,
"
"                                    p_rcpt_store    VARCHAR2,
"
"                                    p_prod_id    VARCHAR2,
"
"                                    p_prod_rev    NUMBER,
"
"                                    p_accept_qty    NUMBER,
"
"                                    p_unit_cost    NUMBER,
"
"                                    p_sf_code    VARCHAR2,
"
"                                    p_sys_ls_no    NUMBER,
"
"                                    p_lang        NUMBER,
"
"                                    p_user        VARCHAR2
"
"                                    );
"
"
"
"
"
"     PROCEDURE proc_cre_jrnl_from_cre_fpi(
"
"                                            p_bu        VARCHAR2,
"
"                                            p_plnt        VARCHAR2,
"
"                                            p_trans_no    VARCHAR2,
"
"                                            p_trans_date    DATE,
"
"                                            p_prod_ord_no    VARCHAR2,
"
"                                            p_qc_pfx    VARCHAR2,
"
"                                            p_qc_no        VARCHAR2,
"
"                                            p_from_store    VARCHAR2,
"
"                                            p_prod_id    VARCHAR2,
"
"                                            p_prod_rev    NUMBER,
"
"                                            p_proc_qty    NUMBER,
"
"                                            p_unit_cost    NUMBER,
"
"                                            p_sf_code    VARCHAR2,
"
"                                            p_sys_ls_no    NUMBER,
"
"                                            p_lang        NUMBER,
"
"                                            p_user        VARCHAR2
"
"                                                 );
"
"
"
"
"
"        PROCEDURE proc_cre_jrnl_from_upd_fpi(
"
"                                            p_bu        VARCHAR2,
"
"                                            p_plnt        VARCHAR2,
"
"                                            p_trans_no    VARCHAR2,
"
"                                            p_trans_date    DATE,
"
"                                            p_prod_ord_no    VARCHAR2,
"
"                                            p_qc_pfx    VARCHAR2,
"
"                                            p_qc_no        VARCHAR2,
"
"                                            p_to_store    VARCHAR2,
"
"                                            p_prod_id    VARCHAR2,
"
"                                            p_prod_rev    NUMBER,
"
"                                            p_accept_qty    NUMBER,
"
"                                            p_reject_qty    NUMBER,
"
"                                            p_unit_cost    NUMBER,
"
"                                            p_sf_code    VARCHAR2,
"
"                                            p_sys_ls_no    NUMBER,
"
"                                            p_lang        NUMBER,
"
"                                            p_user        VARCHAR2
"
"                                            );
"
"
"
"
"
"PROCEDURE proc_cre_jrnl_from_rwk_cre_fpi(
"
"                                            p_bu        VARCHAR2,
"
"                                            p_plnt        VARCHAR2,
"
"                                            p_trans_no    VARCHAR2,
"
"                                            p_trans_date    DATE,
"
"                                            p_prod_ord_no    VARCHAR2,
"
"                                            p_qc_pfx    VARCHAR2,
"
"                                            p_qc_no        VARCHAR2,
"
"                                            p_from_store    VARCHAR2,
"
"                                            p_prod_id    VARCHAR2,
"
"                                            p_prod_rev    NUMBER,
"
"                                            p_proc_qty    NUMBER,
"
"                                            p_unit_cost    NUMBER,
"
"                                            p_sf_code    VARCHAR2,
"
"                                            p_sys_ls_no    NUMBER,
"
"                                            p_lang        NUMBER,
"
"                                            p_user        VARCHAR2
"
"                                                 );
"
"
"
"
"
"        /*PROCEDURE proc_cre_jrnl_from_rwk_upd_fpi(
"
"                                            p_bu        VARCHAR2,
"
"                                            p_plnt        VARCHAR2,
"
"                                            p_trans_no    VARCHAR2,
"
"                                            p_trans_date    DATE,
"
"                                            p_prod_ord_no    VARCHAR2,
"
"                                            p_qc_pfx    VARCHAR2,
"
"                                            p_qc_no        VARCHAR2,
"
"                                            p_to_store    VARCHAR2,
"
"                                            p_prod_id    VARCHAR2,
"
"                                            p_prod_rev    NUMBER,
"
"                                            p_accept_qty    NUMBER,
"
"                                            p_reject_qty    NUMBER,
"
"                                            p_unit_cost    NUMBER,
"
"                                            p_sf_code    VARCHAR2,
"
"                                            p_sys_ls_no    NUMBER,
"
"                                            p_lang        NUMBER,
"
"                                            p_user        VARCHAR2
"
"                                            );*/
"
"
"
"    PROCEDURE proc_cre_jrnl_from_cancel_insp(
"
"                                            p_bu        VARCHAR2,
"
"                                            p_plnt        VARCHAR2,
"
"                                            p_trans_no    VARCHAR2,
"
"                                            p_trans_date    DATE,
"
"                                            p_prod_ord_no    VARCHAR2,
"
"                                            p_qc_pfx    VARCHAR2,
"
"                                            p_qc_no        VARCHAR2,
"
"                                            p_prod_id    VARCHAR2,
"
"                                            p_prod_rev    NUMBER,
"
"                                            p_proc_qty    NUMBER,
"
"                                            p_unit_cost    NUMBER,
"
"                                            p_sf_code    VARCHAR2,
"
"                                            p_sys_ls_no    NUMBER,
"
"                                            p_lang        NUMBER,
"
"                                            p_user        VARCHAR2
"
"                                             );
"
"
"
"    PROCEDURE proc_cre_pprej_comp_wh_jrnls(
"
"                                            p_bu            VARCHAR2,
"
"                                            p_plnt            VARCHAR2,
"
"                                            p_comp_doc_no    VARCHAR2,
"
"                                            p_trans_no        VARCHAR2,
"
"                                            p_trans_date    DATE,
"
"                                            p_prod_ord_no    VARCHAR2,
"
"                                            p_bom_no        VARCHAR,
"
"                                            p_prod_id        VARCHAR2,
"
"                                            p_prod_rev        NUMBER,
"
"                                            p_comp_qty        NUMBER,
"
"                                            p_unit_cost        NUMBER,
"
"                                            p_lang            NUMBER,
"
"                                            p_user            VARCHAR2
"
"                                            );
"
"
"
"END pack_mfg_process_journals;"
/
