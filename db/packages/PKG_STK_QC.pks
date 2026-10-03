CREATE OR REPLACE
"PACKAGE pkg_stk_qc
"
"AS
"
"
"
"  PROCEDURE proc_load_stk_frm_insp_rqst(p_bu		VARCHAR2,
"
"                                        p_pln_no	VARCHAR2,
"
"				        p_store_id	VARCHAR2,
"
"				        p_ason_date	DATE,
"
"				        p_user		VARCHAR2,
"
"					p_user_emp	VARCHAR2
"
"				       );
"
"
"
"  PROCEDURE proc_ins_rqst_frm_insp_rqst(p_bu		VARCHAR2,
"
"                                        p_pln_no	VARCHAR2,
"
"				        p_user		VARCHAR2,
"
"					p_user_emp	VARCHAR2
"
"				       );
"
"
"
"  PROCEDURE proc_can_rqst_frm_insp_rqst(p_bu		VARCHAR2,
"
"                                        p_pln_no	VARCHAR2,
"
"					p_pln_seq	NUMBER,
"
"				        p_user		VARCHAR2,
"
"					p_user_emp	VARCHAR2
"
"				       );
"
"
"
"END pkg_stk_qc;"
/
