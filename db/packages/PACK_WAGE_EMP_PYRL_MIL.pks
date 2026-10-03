CREATE OR REPLACE
"PACKAGE        pack_wage_emp_pyrl_mil
"
"AS
"
"
"
"   PROCEDURE proc_prepare_emp_monthly_wage(p_bu                            VARCHAR2,
"
"                                             p_doc_no                        VARCHAR2,
"
"                                           p_seq_no                        NUMBER,
"
"                                           p_emp_id                        VARCHAR2,
"
"                                          p_user                        VARCHAR2,
"
"                                          p_res            OUT            VARCHAR2);
"
"
"
"   PROCEDURE proc_process_emp_monthly_wage(p_bu                            VARCHAR2,
"
"                                           p_doc_no                        VARCHAR2,
"
"                                          p_user                        VARCHAR2,
"
"                                          p_res            OUT            VARCHAR2);
"
"
"
"END;"
/
