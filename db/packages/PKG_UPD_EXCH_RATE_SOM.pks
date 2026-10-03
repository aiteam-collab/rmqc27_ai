CREATE OR REPLACE
"PACKAGE pkg_upd_exch_rate_som
"
"AS
"
"PROCEDURE proc_upd_exch_rate_so(p_bu        VARCHAR2,
"
"                                p_ord_no    VARCHAR2,
"
"                                p_user        VARCHAR2);
"
"
"
"
"
"PROCEDURE proc_upd_exch_rate_si(p_bu        VARCHAR2,
"
"                                p_plnt        VARCHAR2,
"
"                                p_doc_no    VARCHAR2,
"
"                                p_date        DATE,
"
"                                p_user        VARCHAR2);
"
"END pkg_upd_exch_rate_som;"
/
