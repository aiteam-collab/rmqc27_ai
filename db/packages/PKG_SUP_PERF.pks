CREATE OR REPLACE
"PACKAGE pkg_sup_perf
"
"AS
"
"  PROCEDURE proc_ins_serv_scr_card(p_bu		VARCHAR2,
"
"                                   p_plnt	VARCHAR2,
"
"				   p_doc_no	VARCHAR2,
"
"				   p_user	VARCHAR2
"
"				  );
"
"
"
"  PROCEDURE proc_upd_scr_frm_serv(p_bu		VARCHAR2,
"
"                                  p_plnt	VARCHAR2,
"
"				  p_doc_no	VARCHAR2,
"
"				  p_user	VARCHAR2
"
"				 );
"
"END pkg_sup_perf;"
/
