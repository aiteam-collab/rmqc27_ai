CREATE OR REPLACE
"PACKAGE pkg_mat_rcpt
"
"AS
"
"
"
"  PROCEDURE proc_cre_ge_frm_mat_trf_dc(p_bu        IN    business_units.bu_id%TYPE,
"
"                                       p_date         IN     DATE,
"
"                                       p_user        IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                       p_res        OUT    VARCHAR2
"
"                      );
"
"
"
"  PROCEDURE proc_cre_mrv_frm_miv(p_bu        IN    business_units.bu_id%TYPE,
"
"                                 p_date        IN     DATE,
"
"                                 p_user        IN    appl_users.appluser_id%TYPE,
"
"                 p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                                 p_res        OUT    VARCHAR2,
"
"                 p_mi_doc_no    IN    VARCHAR2    DEFAULT NULL
"
"                                );
"
"
"
"  PROCEDURE proc_cre_mrv_frm_sa(p_bu        IN    business_units.bu_id%TYPE,
"
"                                 p_date        IN     DATE,
"
"                                 p_user        IN    appl_users.appluser_id%TYPE,
"
"                 p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                                 p_res        OUT    VARCHAR2
"
"                                );
"
"
"
"  PROCEDURE proc_cre_mr_frm_mat_trf_dc(p_bu        IN    business_units.bu_id%TYPE,
"
"                       p_date         IN     DATE,
"
"                                       p_user        IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                       p_res        OUT    VARCHAR2
"
"                      );
"
"
"
"  PROCEDURE proc_cre_mr_frm_mat_trf_ge(p_bu        IN    business_units.bu_id%TYPE,
"
"                       p_date         IN     DATE,
"
"                                       p_user        IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                       p_res        OUT    VARCHAR2
"
"                      );
"
"
"
"  PROCEDURE proc_recv_rcpt_frm_mat_rcpt(p_bu        IN    business_units.bu_id%TYPE,
"
"                                        p_doc_no    IN    inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                        p_user        IN    appl_users.appluser_id%TYPE,
"
"                    p_user_emp    IN    employees.emp_emp_id%TYPE
"
"                       );
"
"
"
"
"
"  PROCEDURE proc_alloc_bin_frm_mat_rcpt(p_bu        IN    business_units.bu_id%TYPE,
"
"                                        p_doc_no    IN    inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                        p_user        IN    appl_users.appluser_id%TYPE,
"
"                    p_res        OUT    VARCHAR2
"
"                       );
"
"
"
"  PROCEDURE proc_rev_rcpt_frm_mat_rcpt(p_bu        IN    business_units.bu_id%TYPE,
"
"                                       p_doc_no        IN    inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                       p_user        IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE
"
"                      );
"
"
"
"  /*PROCEDURE proc_rev_rcpt_frm_mat_rcpt1(p_bu        IN    business_units.bu_id%TYPE,
"
"                                        p_doc_no    IN    inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                        p_user        IN    appl_users.appluser_id%TYPE
"
"                       );*/
"
"END pkg_mat_rcpt;"
/
