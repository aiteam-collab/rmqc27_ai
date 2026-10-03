CREATE OR REPLACE
"PACKAGE pkg_sal_bud
"
"AS
"
"
"
"  PROCEDURE proc_load_cust_frm_sal_bud(p_bu           VARCHAR2,
"
"                                       p_doc_no        VARCHAR2,
"
"                                       p_rev_no     NUMBER,
"
"                                       p_user        VARCHAR2,
"
"                                       p_user_emp    VARCHAR2
"
"                                      );
"
"
"
"  PROCEDURE proc_load_sales_frm_sal_bud(p_bu        VARCHAR2,
"
"                                        p_doc_no    VARCHAR2,
"
"                                        p_rev_no     NUMBER,
"
"                                        p_fr_date    DATE,
"
"                                        p_to_date    DATE,
"
"                                        p_user        VARCHAR2,
"
"                                        p_user_emp    VARCHAR2
"
"                                       );
"
"
"
"  PROCEDURE proc_load_plan_frm_sal_bud(p_bu        VARCHAR2,
"
"                                       p_doc_no        VARCHAR2,
"
"                                       p_rev_no     NUMBER,
"
"                                       p_user        VARCHAR2,
"
"                                       p_user_emp    VARCHAR2
"
"                                      );
"
"
"
"  PROCEDURE proc_load_prod_frm_sal_bud(p_bu            VARCHAR2,
"
"                                       p_doc_no            VARCHAR2,
"
"                                       p_rev_no     NUMBER,
"
"                                       p_user            VARCHAR2,
"
"                                       p_user_emp       VARCHAR2
"
"                                      );
"
"
"
"  PROCEDURE proc_load_rm_frm_sal_bud(p_bu            VARCHAR2,
"
"                                     p_doc_no            VARCHAR2,
"
"                                     p_rev_no     NUMBER,
"
"                                     p_user            VARCHAR2,
"
"                                     p_user_emp       VARCHAR2
"
"                                    );
"
"
"
"END pkg_sal_bud;"
/
