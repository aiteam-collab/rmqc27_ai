CREATE OR REPLACE
"PACKAGE pack_emp_pt_lwf_mig
"
"AUTHID CURRENT_USER
"
"AS
"
"   PROCEDURE proc_upload_emp_pt_lwf_mig(p_bu				VARCHAR2,
"
"   			      		p_type				VARCHAR2,
"
"			      		p_dir				VARCHAR2,
"
"			      		p_file_name			VARCHAR2,
"
"			      		p_user				VARCHAR2,
"
"			      		p_res	     	OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_chk_emp_pt_lwf_excep(p_bu				VARCHAR2,
"
"   				       p_type				VARCHAR2,
"
"   				       p_user				VARCHAR2,
"
"   				       p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_ins_emp_pt_lwf_dtls(p_bu				VARCHAR2,
"
"   				      p_type				VARCHAR2,
"
"   				      p_user				VARCHAR2,
"
"   				      p_res		OUT		VARCHAR2);
"
"END;"
/
