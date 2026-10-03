CREATE OR REPLACE
"PACKAGE pack_emp_increment_mig_range
"
"IS
"
" PROCEDURE proc_upload_emp_incre_mig(p_bu                VARCHAR2,
"
"                          p_doc_no                VARCHAR2,
"
"                          p_dir                VARCHAR2,
"
"                          p_file_name                VARCHAR2,
"
"                          p_user                VARCHAR2,
"
"                          p_res             OUT        VARCHAR2);
"
"
"
"PROCEDURE proc_ins_range_elmnts(p_bu            VARCHAR2,
"
"                 p_doc_no        VARCHAR2,
"
"                 p_user            VARCHAR2,
"
"                 p_res        OUT    VARCHAR2);
"
"
"
"PROCEDURE proc_emp_incre_mig_excep(p_bu                    VARCHAR2,
"
"                         p_doc_no                VARCHAR2,
"
"                         p_date_to                DATE,
"
"                         p_date_from                DATE,
"
"                         p_user                VARCHAR2,
"
"                         p_res        OUT        VARCHAR2);
"
"
"
"PROCEDURE proc_post_emp_incre_mig(p_bu        VARCHAR2,
"
"                    p_doc_no        VARCHAR2,
"
"                    p_date_from        DATE,
"
"                    p_user        VARCHAR2,
"
"                    p_res    OUT    VARCHAR2);
"
"END pack_emp_increment_mig_range;"
/
