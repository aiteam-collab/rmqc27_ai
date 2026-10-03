CREATE OR REPLACE
"PACKAGE pkg_gstr9
"
"AS
"
"   PROCEDURE proc_load_gstr9     (p_bu        gstr9_hd.g9h_bu%type,
"
"                                 p_year      gstr9_hd.g9h_year%type,
"
"                                 p_doc_no    gstr9_hd.g9h_doc_no%type,
"
"                                 p_user      VARCHAR2);
"
"END pkg_gstr9;"
/
