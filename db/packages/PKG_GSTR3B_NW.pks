CREATE OR REPLACE
"PACKAGE pkg_gstr3b_nw
"
"AS
"
"   PROCEDURE proc_ins_gstr2_plnts (p_bu        VARCHAR2,
"
"                                   p_doc_no    VARCHAR2,
"
"                                   p_user      VARCHAR2);
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
"      p_user       appl_users.appluser_id%TYPE);
"
"END pkg_gstr3b_nw;"
/
