CREATE OR REPLACE
"PACKAGE pack_auto_cre_leave_credit
"
"AS
"
"
"
"   PROCEDURE proc_upd_ftc_emp_doj(p_bu						VARCHAR2,
"
"			          p_emp_id					VARCHAR2,
"
"			          p_emp_doj					DATE,
"
"			          p_prob_eff_from				DATE,
"
"			          p_prob_eff_to					DATE,
"
"			          p_cat_id					VARCHAR2			DEFAULT NULL,
"
"				  p_user					VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_ftc_emp_prob_comp(p_bu					VARCHAR2,
"
"			         	p_emp_id				VARCHAR2,
"
"				 	p_user					VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_ftc_emp_year_comp(p_bu					VARCHAR2,
"
"			         	p_emp_id				VARCHAR2,
"
"			         	p_year					NUMBER,
"
"			         	p_period				NUMBER,
"
"				 	p_user					VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_mon_crdt_emp(p_bu						VARCHAR2,
"
"   			     	   p_year					NUMBER,
"
"   			     	   p_period					NUMBER,
"
"   			     	   p_emp_id					VARCHAR2,
"
"   			     	   p_user					VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_emp_max_carry_days(p_bu					VARCHAR2,
"
"   					 p_emp_id				VARCHAR2,
"
"   					 p_leave_id				VARCHAR2,
"
"   					 p_year					NUMBER,
"
"   					 p_period				NUMBER,
"
"   					 p_user					VARCHAR2);
"
"
"
"END pack_auto_cre_leave_credit;"
/
