CREATE OR REPLACE
"PACKAGE pack_emp_tds_hist
"
"AS
"
"
"
"   PROCEDURE proc_insert_emp_tds_hist(p_bu				VARCHAR2,
"
"     				      p_emp_id				VARCHAR2,
"
"     				      p_year				NUMBER,
"
"     				      p_period				NUMBER,
"
"   				      p_user				VARCHAR2);
"
"
"
"   PROCEDURE proc_reverse_emp_tds_hist(p_bu				VARCHAR2,
"
"     				       p_emp_id				VARCHAR2,
"
"     				       p_year				NUMBER,
"
"     				       p_period				NUMBER,
"
"   				       p_user				VARCHAR2);
"
"
"
"END;"
/
