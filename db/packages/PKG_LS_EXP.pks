CREATE OR REPLACE
"PACKAGE pkg_ls_exp
"
"AS
"
"
"
"  PROCEDURE proc_load_exp_ls_frm_ls_stk(p_bu		VARCHAR2,
"
"			                p_plnt		VARCHAR2,
"
"				        p_doc_no	VARCHAR2,
"
"				        p_user		VARCHAR2
"
"			               );
"
"
"
"  PROCEDURE proc_ins_ls_frm_ls_exp(p_bu		VARCHAR2,
"
"			           p_plnt	VARCHAR2,
"
"				   p_doc_no	VARCHAR2,
"
"				   p_user	VARCHAR2
"
"			          );
"
"
"
"  PROCEDURE proc_upd_ls_frm_ls_exp(p_bu		VARCHAR2,
"
"			           p_plnt	VARCHAR2,
"
"				   p_doc_no	VARCHAR2,
"
"				   p_user	VARCHAR2
"
"			          );
"
"
"
"
"
"END pkg_ls_exp;"
/
