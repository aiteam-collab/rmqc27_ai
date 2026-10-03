CREATE OR REPLACE
"PACKAGE pkg_stk_count
"
"AS
"
"  PROCEDURE proc_ins_rec_frm_stk_count(
"
"					p_bu		VARCHAR2,
"
"                                        p_doc_no	VARCHAR2,
"
"				        p_store_id	VARCHAR2,
"
"				        p_ason_date	DATE,
"
"				        p_user		VARCHAR2,
"
"				        p_loc_grp	VARCHAR2	DEFAULT NULL
"
"				      );
"
"
"
"  PROCEDURE proc_ins_rec_frm_stk_count_temp(
"
"					    p_bu		VARCHAR2,
"
"					    p_doc_no		VARCHAR2,
"
"					    p_plnt              VARCHAR2,
"
"					    p_store_id		VARCHAR2,
"
"					    p_user		VARCHAR2
"
"				            );
"
"
"
"  PROCEDURE proc_ins_rec_frm_stk_count_trans(
"
"					    p_bu		VARCHAR2,
"
"					    p_doc_no		VARCHAR2,
"
"					    p_user 		VARCHAR2
"
"				            );
"
"
"
"  PROCEDURE proc_upd_sys_stk_frm_stk_count(p_bu		VARCHAR2,
"
"                                           p_doc_no	VARCHAR2,
"
"                                           p_user	VARCHAR2,
"
"					   p_user_emp	VARCHAR2,
"
"					   p_date       DATE
"
"					  );
"
"
"
"  PROCEDURE proc_post_stk_frm_stk_count(p_bu		VARCHAR2,
"
"                                        p_doc_no	VARCHAR2,
"
"                                        p_user		VARCHAR2,
"
"                                        p_user_emp	VARCHAR2
"
"                                       );
"
"
"
"END;"
/
