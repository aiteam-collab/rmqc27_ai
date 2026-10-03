CREATE OR REPLACE
"PACKAGE pkg_mfg_rwk_perpetual_journals
"
"IS
"
"    PROCEDURE proc_rw_cal_cost_hist (p_bu                  VARCHAR2,
"
"                                   p_plnt              VARCHAR2,
"
"                                   p_doc_no            VARCHAR2,
"
"                                   p_prod_id           VARCHAR2,
"
"                                   p_prod_rev          NUMBER,
"
"                                   p_comp_qty          NUMBER,
"
"                                   p_dm_cost     OUT   NUMBER,
"
"                                   p_dl_cost     OUT   NUMBER,
"
"                                   p_oh_cost     OUT   NUMBER,
"
"                                   p_unit_cost   OUT   NUMBER);
"
"
"
"
"
"    PROCEDURE proc_delete_journals(p_bu            VARCHAR2,
"
"                                   p_plnt        VARCHAR2,
"
"                                   p_trans_no    VARCHAR2,
"
"                                   p_vou_type    VARCHAR2,
"
"                                   p_appl        VARCHAR2
"
"                                   );
"
"
"
"    PROCEDURE proc_ins_repair_jrnls(p_bu            VARCHAR2,
"
"                                    p_plnt            VARCHAR2,
"
"                                    p_trans_no        VARCHAR2,
"
"                                    p_trans_date    DATE,
"
"                                    p_prod_ord_no    VARCHAR2,
"
"                                    p_prod_id        VARCHAR2,
"
"                                    p_prod_rev        NUMBER,
"
"                                    p_comp_qty        NUMBER,
"
"                                    p_lang            NUMBER,
"
"                                    p_user            VARCHAR2
"
"                                    );
"
"
"
"	PROCEDURE proc_calc_cost (
"
"							   p_bu                VARCHAR2,
"
"							   p_plnt              VARCHAR2,
"
"							   p_doc_no            VARCHAR2,
"
"							   p_prod_id           VARCHAR2,
"
"							   p_prod_rev          NUMBER,
"
"							   p_comp_qty          NUMBER,
"
"							   p_dm_cost     OUT   NUMBER,
"
"							   p_dl_cost     OUT   NUMBER,
"
"							   p_oh_cost     OUT   NUMBER,
"
"							   p_unit_cost   OUT   NUMBER
"
"							 );
"
"
"
"	PROCEDURE proc_ins_crm_repair_jrnls(p_bu            VARCHAR2,
"
"										p_plnt            VARCHAR2,
"
"										p_trans_no        VARCHAR2,
"
"										p_trans_date    DATE,
"
"										p_prod_ord_no    VARCHAR2,
"
"										p_prod_id        VARCHAR2,
"
"										p_prod_rev        NUMBER,
"
"										p_comp_qty        NUMBER,
"
"										p_lang            NUMBER,
"
"										p_user            VARCHAR2
"
"										);
"
"
"
"    PROCEDURE proc_ins_disassemble_jrnls(p_bu            VARCHAR2,
"
"                                         p_plnt            VARCHAR2,
"
"                                         p_trans_no        VARCHAR2,
"
"                                         p_trans_date    DATE,
"
"                                         p_prod_ord_no    VARCHAR2,
"
"                                         p_prod_id        VARCHAR2,
"
"                                         p_prod_rev        NUMBER,
"
"                                         p_comp_qty        NUMBER,
"
"                                         p_lang            NUMBER,
"
"                                         p_user            VARCHAR2
"
"                                         );
"
"
"
"    PROCEDURE proc_ins_scrap_jrnls(p_bu                VARCHAR2,
"
"                                   p_plnt            VARCHAR2,
"
"                                   p_trans_no        VARCHAR2,
"
"                                   p_trans_date        DATE,
"
"                                   p_prod_ord_no    VARCHAR2,
"
"                                   p_prod_id        VARCHAR2,
"
"                                   p_prod_rev        NUMBER,
"
"                                   p_comp_qty        NUMBER,
"
"                                   p_lang            NUMBER,
"
"                                   p_user            VARCHAR2
"
"                                   );
"
"
"
"    PROCEDURE proc_ins_disass_scr_jrnls(p_bu                VARCHAR2,
"
"                                        p_plnt                VARCHAR2,
"
"                                        p_trans_no            VARCHAR2,
"
"                                        p_trans_date        DATE,
"
"                                        p_prod_ord_no        VARCHAR2,
"
"                                        p_prod_id            VARCHAR2,
"
"                                        p_prod_rev            NUMBER,
"
"                                        p_comp_qty            NUMBER,
"
"                                        p_lang                NUMBER,
"
"                                        p_user                VARCHAR2
"
"                                        );
"
"
"
"    PROCEDURE proc_ins_rpr_disass_scr_jrnls(p_bu                VARCHAR2,
"
"                                            p_plnt                VARCHAR2,
"
"                                            p_trans_no            VARCHAR2,
"
"                                            p_trans_date        DATE,
"
"                                            p_prod_ord_no        VARCHAR2,
"
"                                            p_prod_id            VARCHAR2,
"
"                                            p_prod_rev            NUMBER,
"
"                                            p_comp_qty            NUMBER,
"
"                                            p_lang                NUMBER,
"
"                                            p_user                VARCHAR2
"
"                                            );
"
"
"
"    PROCEDURE proc_ins_repair_jrnls_hist(p_bu            VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_trans_no        VARCHAR2,
"
"                                        p_trans_date    DATE,
"
"                                        p_prod_ord_no    VARCHAR2,
"
"                                        p_prod_id        VARCHAR2,
"
"                                        p_prod_rev        NUMBER,
"
"                                        p_comp_qty        NUMBER,
"
"                                        p_lang            NUMBER,
"
"                                        p_user            VARCHAR2
"
"                                    );
"
"
"
"END    pkg_mfg_rwk_perpetual_journals;
"
/
