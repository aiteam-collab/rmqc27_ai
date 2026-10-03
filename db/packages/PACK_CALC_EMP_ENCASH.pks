CREATE OR REPLACE
"PACKAGE pack_calc_emp_encash
"
"AS
"
"
"
"   PROCEDURE proc_load_unit_cat(p_bu				VARCHAR2,
"
"   				p_doc_no			VARCHAR2,
"
"   				p_user				VARCHAR2,
"
"   				p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_load_emp_dtls(p_bu				VARCHAR2,
"
"   				p_doc_no			VARCHAR2,
"
"   				p_user				VARCHAR2,
"
"   				p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_encash_amt(p_bu				VARCHAR2,
"
"   				 p_doc_no			VARCHAR2,
"
"   				 p_user				VARCHAR2,
"
"   				 p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_process_leave_encash(p_bu				VARCHAR2,
"
"   				       p_doc_no				VARCHAR2,
"
"   				       p_user				VARCHAR2,
"
"   				       p_pyrl_type			VARCHAR2,
"
"   				       p_res		OUT		VARCHAR2);
"
"
"
"END pack_calc_emp_encash;
"
/
