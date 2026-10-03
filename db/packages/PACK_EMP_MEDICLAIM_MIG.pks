CREATE OR REPLACE
"PACKAGE pack_emp_mediclaim_mig
"
"AS
"
"
"
"  PROCEDURE proc_upload_emp_mediclaim_mig(p_bu                          VARCHAR2,
"
"                                          p_plcy_no                     VARCHAR2,
"
"                                          p_dir                         VARCHAR2,
"
"                                          p_file_name                   VARCHAR2,
"
"                                          p_user                        VARCHAR2,
"
"                                          p_res         OUT             VARCHAR2);
"
"
"
"  PROCEDURE proc_emp_mediclaim_mig_excep(p_bu                          VARCHAR2,
"
"                                         p_plcy_no                     VARCHAR2,
"
"                                         p_user                        VARCHAR2,
"
"                                         p_res         OUT             VARCHAR2);
"
"
"
"  PROCEDURE proc_post_emp_mediclaim_mig(p_bu                           VARCHAR2,
"
"                                        p_plcy_no                      VARCHAR2,
"
"                                        p_user                         VARCHAR2,
"
"                                        p_res          OUT             VARCHAR2);
"
"
"
"
"
"END pack_emp_mediclaim_mig;"
/
