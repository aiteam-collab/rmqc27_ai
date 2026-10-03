CREATE OR REPLACE
"PACKAGE pkg_rework_mat_cons_ln
"
"AS
"
"    PROCEDURE proc_delete_exceptions_ln(p_bu          VARCHAR2,
"
"                                 p_plnt        VARCHAR2,
"
"                                 p_doc_no       VARCHAR2
"
"                                );
"
"PROCEDURE proc_cre_mr_frm_rwk_comp_ln(
"
"                                    p_bu          VARCHAR2,
"
"                                    p_plnt        VARCHAR2,
"
"                                    p_ord_no      VARCHAR2,
"
"                                    p_ord_date    DATE,
"
"                                    p_user        VARCHAR2,
"
"                                    p_lang        NUMBER,
"
"                                    p_mr_no   OUT VARCHAR2,
"
"                                    p_mi_no   OUT VARCHAR2
"
"                                    );
"
"
"
"PROCEDURE proc_ins_mat_req_ln(p_bu          VARCHAR2,
"
"                           p_plnt        VARCHAR2,
"
"                           p_doc_no         VARCHAR2,
"
"                           p_user         VARCHAR2
"
"                       );
"
"PROCEDURE proc_chk_exception_ln(p_bu          VARCHAR2,
"
"                             p_plnt        VARCHAR2,
"
"                             p_doc_no       VARCHAR2,
"
"                             p_user           VARCHAR2
"
"                             );
"
"PROCEDURE proc_alloc_rwk_mat_cons_ln(p_bu                VARCHAR2,
"
"                                  p_plnt            VARCHAR2,
"
"                                  p_doc_no            VARCHAR2,
"
"                                  p_doc_date        DATE,
"
"                                  p_lang            NUMBER,
"
"                                  p_type            VARCHAR2,
"
"                                  p_user            VARCHAR2,
"
"                                  p_res        OUT        VARCHAR2
"
"                                  )  ;
"
"END pkg_rework_mat_cons_ln;"
/
