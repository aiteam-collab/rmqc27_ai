CREATE OR REPLACE
"PACKAGE pack_emp_inc_bulk_mig_grade
"
"AUTHID CURRENT_USER
"
"AS
"
"
"
"   PROCEDURE proc_upload_emp_inc_ctc(p_bu						VARCHAR2,
"
"				     p_doc_no						VARCHAR2,
"
"				     p_dir_name						VARCHAR2,
"
"				     p_file_name					VARCHAR2,
"
"				     p_user						VARCHAR2,
"
"				     p_res			OUT			VARCHAR2);
"
"
"
"   PROCEDURE proc_chk_exp_emp_inc_ctc(p_bu						VARCHAR2,
"
"				      p_doc_no						VARCHAR2,
"
"				      p_user						VARCHAR2,
"
"				      p_res			OUT			VARCHAR2);
"
"
"
"   PROCEDURE proc_post_emp_inc_ctc(p_bu							VARCHAR2,
"
"				   p_doc_no						VARCHAR2,
"
"				   p_user						VARCHAR2,
"
"				   p_res			OUT			VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_bulk_inc_ctc(p_bu						VARCHAR2,
"
"   			  	    p_doc_no						VARCHAR2,
"
"   				    p_emp_id						VARCHAR2,
"
"   				    p_sal_type						VARCHAR2,
"
"   				    p_calc_elmnt_id					VARCHAR2,
"
"   				    p_gross_amt						NUMBER,
"
"   				    p_seq_no						NUMBER,
"
"   				    p_user						VARCHAR2,
"
"   				    p_res			OUT			VARCHAR2);
"
"
"
"END pack_emp_inc_bulk_mig_grade;"
/
