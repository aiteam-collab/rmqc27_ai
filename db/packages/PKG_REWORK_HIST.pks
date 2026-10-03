CREATE OR REPLACE
"PACKAGE pkg_rework_hist
"
"IS
"
"    PROCEDURE proc_ins_rework_order_hist(p_bu             VARCHAR2,
"
"                         p_plnt            VARCHAR2,
"
"                         p_doc_no         VARCHAR2,
"
"                         p_user            VARCHAR2,
"
"                         p_res    OUT        VARCHAR2
"
"                         );
"
"
"
"    PROCEDURE proc_ins_rework_comp_hist(p_bu            VARCHAR2,
"
"                        p_plnt        VARCHAR2,
"
"                        p_doc_no      VARCHAR2,
"
"                        p_user        VARCHAR2,
"
"                        p_res    OUT        VARCHAR2
"
"                        );
"
"END pkg_rework_hist;"
/
