CREATE OR REPLACE
"PACKAGE pkg_gl_acct_stat_dill_down
"
"AS
"
"     PROCEDURE proc_gl_acct_dill_down(p_bu           VARCHAR2,
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
"                             p_url       OUT VARCHAR2);
"
"
"
"END;"
/
