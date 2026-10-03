CREATE OR REPLACE
"PACKAGE pkg_rdc
"
"AS
"
"  PROCEDURE proc_fetch_rdc_frm_ge(p_bu		VARCHAR2,
"
"                                  p_plnt	VARCHAR2,
"
"				  p_doc_no	VARCHAR2,
"
"				  p_user	VARCHAR2
"
"				 );
"
"
"
"  PROCEDURE proc_ins_rdc_frm_ge(p_bu		VARCHAR2,
"
"                                p_plnt		VARCHAR2,
"
"				p_doc_no	VARCHAR2,
"
"				p_user		VARCHAR2
"
"			       );
"
"END pkg_rdc;"
/
