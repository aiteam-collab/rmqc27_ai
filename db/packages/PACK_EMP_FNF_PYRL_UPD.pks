CREATE OR REPLACE
"PACKAGE pack_emp_fnf_pyrl_upd
"
"AS
"
"
"
"   PROCEDURE proc_cre_emp_fnf_pyrl(p_bu                        VARCHAR2,
"
"                      p_doc_no                    VARCHAR2,
"
"                      p_quest_id                    VARCHAR2,
"
"                      p_user                    VARCHAR2,
"
"                      p_res        OUT            VARCHAR2);
"
"
"
"   PROCEDURE proc_prep_fnf_pyrl_emp(p_bu                    VARCHAR2,
"
"                       p_doc_no                    VARCHAR2,
"
"                       p_user                    VARCHAR2,
"
"                       p_res        OUT            VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_leave_encash(p_bu                    VARCHAR2,
"
"                       p_doc_no                    VARCHAR2,
"
"                       p_user                    VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_imprest_cash(p_bu                    VARCHAR2,
"
"                          p_doc_no                    VARCHAR2,
"
"                          p_emp_id                    VARCHAR2,
"
"                          p_year                    NUMBER,
"
"                       p_user                    VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_gratuity(p_bu                    VARCHAR2,
"
"                       p_doc_no                    VARCHAR2,
"
"                       p_emp_id                    VARCHAR2,
"
"                       p_basic_sal                    NUMBER,
"
"                       p_serv_yrs                    NUMBER,
"
"                       p_date_from                    DATE,
"
"                       p_date_to                    DATE,
"
"                       p_emp_pay_basis                VARCHAR2,
"
"                       p_user                    VARCHAR2,
"
"                       p_grat_amt        OUT            NUMBER);
"
"
"
"   PROCEDURE proc_calc_emp_bonus(p_bu                        VARCHAR2,
"
"                       p_doc_no                    VARCHAR2,
"
"                       p_emp_id                    VARCHAR2,
"
"                       p_year                        NUMBER,
"
"                       p_period                    NUMBER,
"
"                       p_bonus_year                    NUMBER,
"
"                       p_bonus_period                    NUMBER,
"
"                    p_user                        VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_fnf_pt_tax(p_bu                        VARCHAR2,
"
"                         p_doc_no                    VARCHAR2,
"
"                           p_emp_id                    VARCHAR2,
"
"                           p_year                    NUMBER,
"
"                           p_period                    NUMBER,
"
"                           p_user                    VARCHAR2);
"
"
"
"   PROCEDURE proc_chk_fnf_pyrl_excep(p_bu                    VARCHAR2,
"
"                     p_doc_no                    VARCHAR2,
"
"                     p_emp_id                    VARCHAR2,
"
"                     p_user                    VARCHAR2,
"
"                     p_res            OUT            VARCHAR2);
"
"
"
"   PROCEDURE proc_post_fnf_pyrl(p_bu                        VARCHAR2,
"
"                   p_doc_no                    VARCHAR2,
"
"                   p_user                        VARCHAR2,
"
"                   p_res            OUT            VARCHAR2);
"
"
"
"   PROCEDURE proc_post_fnf_serv_bnft(p_bu                        VARCHAR2,
"
"                        p_doc_no                        VARCHAR2,
"
"                        p_user                        VARCHAR2,
"
"                        p_res            OUT            VARCHAR2);
"
"
"
"END;"
/
