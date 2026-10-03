CREATE OR REPLACE
"PACKAGE pack_prepare_payroll
"
"AS
"
"
"
"   PROCEDURE proc_load_unit_grp(p_bu				VARCHAR2,
"
"      				p_doc_no			VARCHAR2,
"
"      				p_user				VARCHAR2,
"
"   				p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_load_employees(p_bu				VARCHAR2,
"
"      				 p_doc_no			VARCHAR2,
"
"      				 p_user				VARCHAR2,
"
"   				 p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_chk_pyrl_excep(p_bu				VARCHAR2,
"
"      				 p_doc_no			VARCHAR2,
"
"      				 p_user				VARCHAR2,
"
"   				 p_res		OUT		VARCHAR2,
"
"   				 p_emp_id			VARCHAR2	DEFAULT NULL);
"
"
"
"   PROCEDURE proc_del_prep_pyrl(p_bu				VARCHAR2,
"
"      			    	p_doc_no			VARCHAR2,
"
"      			    	p_user				VARCHAR2);
"
"
"
"   PROCEDURE proc_pyrl_type_prep(p_bu				VARCHAR2,
"
"   				 p_doc_no			VARCHAR2,
"
"   				 p_user				VARCHAR2,
"
"   				 p_res		OUT		VARCHAR2,
"
"   				 p_emp_id			VARCHAR2	DEFAULT NULL);
"
"
"
"   PROCEDURE proc_process_pyrl(p_bu				VARCHAR2,
"
"   			       p_doc_no				VARCHAR2,
"
"   			       p_user				VARCHAR2,
"
"   			       p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_prj_dtls(p_bu				VARCHAR2,
"
"   			       p_doc_no				VARCHAR2,
"
"   			       p_user				VARCHAR2,
"
"   			       p_res		OUT		VARCHAR2);
"
"
"
"  /* PROCEDURE proc_upd_hist_prj_dtls(p_bu				VARCHAR2,
"
"   			            p_doc_no				VARCHAR2,
"
"   			            p_user				VARCHAR2,
"
"   			            p_res		OUT		VARCHAR2);   	*/
"
"
"
"END pack_prepare_payroll;"
/
