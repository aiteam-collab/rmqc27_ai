CREATE OR REPLACE
"PACKAGE pkg_budgeting AUTHID CURRENT_USER
"
"IS
"
"
"
" PROCEDURE proc_ins_budgeting_dtls(p_bu              VARCHAR2,
"
"                                   p_plnt            VARCHAR2,
"
"                                   p_doc_no          VARCHAR2,
"
"                                   p_doc_rev         NUMBER,
"
"                                   p_year            NUMBER,
"
"                                   p_user            VARCHAR2,
"
"                                   p_lang            VARCHAR2
"
"                                    );
"
"
"
"
"
"  PROCEDURE proc_ins_rm_cons_dtls(p_bu            VARCHAR2,
"
"                                  p_plnt            VARCHAR2,
"
"                                  p_doc_no        VARCHAR2,
"
"                                  p_doc_rev         NUMBER,
"
"                                  p_year          NUMBER,
"
"                                  p_user            VARCHAR2,
"
"                                  p_lang            VARCHAR2
"
"                                    );
"
"
"
" PROCEDURE proc_ins_sale_targ_dtls(p_bu            VARCHAR2,
"
"                                p_plnt            VARCHAR2,
"
"                                p_doc_no        VARCHAR2,
"
"                                p_doc_rev         NUMBER,
"
"                                p_year            VARCHAR2,
"
"                                p_user            VARCHAR2,
"
"                                p_lang             VARCHAR2
"
"                                );
"
"
"
" PROCEDURE proc_ins_segment_dtls(p_bu              VARCHAR2,
"
"                                 p_plnt            VARCHAR2,
"
"                                 p_doc_no          VARCHAR2,
"
"                                 p_doc_rev         NUMBER,
"
"                                 p_year            NUMBER,
"
"                                 p_user            VARCHAR2,
"
"                                 p_lang            VARCHAR2
"
"                                );
"
"
"
"
"
"
"
" END pkg_budgeting;
"
/
