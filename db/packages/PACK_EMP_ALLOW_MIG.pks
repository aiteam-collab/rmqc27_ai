CREATE OR REPLACE
"PACKAGE pack_emp_allow_mig
"
"AUTHID CURRENT_USER
"
"AS
"
"
"
"   PROCEDURE proc_upload_emp_allow_mig(p_bu				VARCHAR2,
"
"                                       p_doc_no				VARCHAR2,
"
"      			       	       p_dir				VARCHAR2,
"
"      			    	       p_file_name			VARCHAR2,
"
"       			    	       p_user				VARCHAR2,
"
"			    	       p_res	     	OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_emp_allow_mig_excep(p_bu				VARCHAR2,
"
"   				      p_doc_no				VARCHAR2,
"
"   				      p_user				VARCHAR2,
"
"   				      p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_post_emp_allow_mig(p_bu				VARCHAR2,
"
"   			             p_doc_no				VARCHAR2,
"
"   				     p_user				VARCHAR2,
"
"   				     p_res		OUT		VARCHAR2);
"
"
"
"END;"
/
