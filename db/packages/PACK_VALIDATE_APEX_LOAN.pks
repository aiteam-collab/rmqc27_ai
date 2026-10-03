CREATE OR REPLACE
"PACKAGE        pack_validate_apex_loan
"
"AS
"
"
"
"   PROCEDURE proc_chk_emp_last_proc_pyrl(p_bu                VARCHAR2,
"
"                            p_rqst_no            VARCHAR2,
"
"                            p_emp_id            VARCHAR2,
"
"                              p_user                VARCHAR2);
"
"
"
"   PROCEDURE proc_chk_loan_criteria(p_bu                VARCHAR2,
"
"                       p_rqst_no                VARCHAR2,
"
"                       p_emp_id                VARCHAR2,
"
"                       p_loan_id                VARCHAR2,
"
"                       p_rqst_amt                NUMBER,
"
"                       p_rqst_date                DATE,
"
"                       p_rqst_year                NUMBER,
"
"                    p_user                VARCHAR2);
"
"
"
"END;"
/
