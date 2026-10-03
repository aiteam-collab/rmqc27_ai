CREATE OR REPLACE
"PACKAGE pkg_web_bank_ins_lc_acct
"
"AS
"
"
"
"  PROCEDURE proc_web_ins_lc_acct (p_bu                      IN     VARCHAR2,
"
"								  p_ord_pfx                 IN     VARCHAR2,
"
"								  p_ord_no                  IN     VARCHAR2,
"
"								  p_lc_type                 IN     VARCHAR2,
"
"								  p_lc_Amt                  IN     NUMBER,
"
"								  p_user                    IN     VARCHAR2,
"
"								  p_out_mgs                    OUT VARCHAR2);
"
"
"
"  PROCEDURE proc_web_load_grn_ln_acct(p_bu      VARCHAR2,
"
"                                p_ord_pfx   VARCHAR2,
"
"                                p_ord_no    VARCHAR2,
"
"                                p_user      VARCHAR2);
"
"
"
"  PROCEDURE proc_web_ins_lc_adjust (p_bu                      IN     VARCHAR2,
"
"								    p_ord_pfx                 IN     VARCHAR2,
"
"								    p_ord_no                  IN     VARCHAR2,
"
"								    p_lc_type                 IN     VARCHAR2,
"
"								    p_lc_Amt                  IN     NUMBER,
"
"								    p_user                    IN     VARCHAR2,
"
"								    p_out_mgs                    OUT VARCHAR2);
"
"
"
"  PROCEDURE proc_web_upd_grn_adj_lc_amt (p_bu      VARCHAR2,
"
"                                         p_ord_pfx VARCHAR,
"
"                                         p_ord_no  VARCHAR2);
"
"END;"
/
