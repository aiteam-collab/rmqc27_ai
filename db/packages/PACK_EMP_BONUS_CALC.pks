CREATE OR REPLACE
"PACKAGE pack_emp_bonus_calc
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
"   PROCEDURE proc_prep_emp_bonus(p_bu				VARCHAR2,
"
"   				 p_doc_no			VARCHAR2,
"
"   				 p_user				VARCHAR2,
"
"   				 p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_post_emp_bonus(p_bu				VARCHAR2,
"
"   				 p_doc_no			VARCHAR2,
"
"   				 p_pymnt_type			VARCHAR2,
"
"   				 p_user				VARCHAR2,
"
"   				 p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_reverse_emp_bonus(p_bu			VARCHAR2,
"
"   				    p_doc_no			VARCHAR2,
"
"   				    p_user			VARCHAR2,
"
"   				    p_res	    OUT		VARCHAR2);
"
"
"
"END pack_emp_bonus_calc;
"
/
