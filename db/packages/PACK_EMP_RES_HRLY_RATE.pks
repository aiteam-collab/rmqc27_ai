CREATE OR REPLACE
"PACKAGE pack_emp_res_hrly_rate
"
"AS
"
"   PROCEDURE proc_upd_emp_hrly_rate_lp(p_bu                VARCHAR2,
"
"                            p_plnt                VARCHAR2,
"
"                          p_emp_id                VARCHAR2,
"
"                          p_date_from            DATE,
"
"                          p_date_to            DATE,
"
"                          p_user                VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_emp_hrly_rate_prf(p_bu                VARCHAR2,
"
"                         p_plnt                VARCHAR2,
"
"                       p_emp_id            VARCHAR2,
"
"                       p_eff_from            DATE,
"
"                       p_new_basic_sal            NUMBER,
"
"                       p_user                VARCHAR2);
"
"END;"
/
