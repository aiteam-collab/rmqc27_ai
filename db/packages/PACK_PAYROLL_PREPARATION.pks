CREATE OR REPLACE
"PACKAGE pack_payroll_preparation
"
"AS
"
"
"
"   PROCEDURE proc_load_unit_grp_dtls(p_bu                VARCHAR2,
"
"                      p_doc_no            VARCHAR2,
"
"                      p_user                VARCHAR2,
"
"                   p_res        OUT        VARCHAR2);
"
"
"
"   PROCEDURE proc_load_employee_dtls(p_bu                VARCHAR2,
"
"                       p_doc_no            VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                    p_res        OUT        VARCHAR2);
"
"
"
"   PROCEDURE proc_chk_pyrl_excep_dtls(p_bu                VARCHAR2,
"
"                       p_doc_no            VARCHAR2,
"
"                       p_user                VARCHAR2,
"
"                    p_res        OUT        VARCHAR2,
"
"                    p_emp_id            VARCHAR2    DEFAULT NULL);
"
"
"
"   PROCEDURE proc_del_prep_pyrl_dtls(p_bu                VARCHAR2,
"
"                          p_doc_no            VARCHAR2,
"
"                          p_user                VARCHAR2);
"
"
"
"   PROCEDURE proc_pyrl_type_prep_dtls(p_bu                VARCHAR2,
"
"                    p_doc_no            VARCHAR2,
"
"                    p_user                VARCHAR2,
"
"                    p_res        OUT        VARCHAR2,
"
"                    p_emp_id            VARCHAR2    DEFAULT NULL);
"
"
"
"   PROCEDURE proc_process_pyrl_dtls(p_bu                VARCHAR2,
"
"                      p_doc_no                VARCHAR2,
"
"                      p_user                VARCHAR2,
"
"                      p_res        OUT        VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_project_dtls(p_bu                VARCHAR2,
"
"                      p_doc_no                VARCHAR2,
"
"                      p_user                VARCHAR2,
"
"                      p_res        OUT        VARCHAR2);
"
"
"
"END pack_payroll_preparation;"
/
