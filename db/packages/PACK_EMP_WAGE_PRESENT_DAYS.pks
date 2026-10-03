CREATE OR REPLACE
"PACKAGE pack_emp_wage_present_days
"
"AS
"
"   PROCEDURE proc_upload_emp_prsnt_days(p_bu                		VARCHAR2,
"
"                                        p_dir                		VARCHAR2,
"
"                                        p_file_name            		VARCHAR2,
"
"                                        p_user                		VARCHAR2,
"
"                                        p_res             OUT        	VARCHAR2);
"
"
"
"   PROCEDURE proc_emp_prsnt_days_excep(p_bu                		VARCHAR2,
"
"                                       p_user                		VARCHAR2,
"
"                                       p_res        	OUT        	VARCHAR2);
"
"
"
"   PROCEDURE proc_ins_emp_prsnt_days(p_bu                		VARCHAR2,
"
"                                     p_user                		VARCHAR2,
"
"                                     p_res        	OUT        	VARCHAR2);
"
"END pack_emp_wage_present_days;"
/
