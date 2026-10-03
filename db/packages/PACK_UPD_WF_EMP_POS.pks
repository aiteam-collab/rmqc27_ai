CREATE OR REPLACE
"PACKAGE         pack_upd_wf_emp_pos
"
"AS
"
"
"
"   PROCEDURE proc_upd_wf_pos(p_bu                VARCHAR2,
"
"                       p_emp_id                VARCHAR2,
"
"                       p_old_pos_id            VARCHAR2,
"
"                       p_new_pos_id            VARCHAR2,
"
"                    p_user                VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_wf_emp(p_bu                VARCHAR2,
"
"                    p_user_id                VARCHAR2,
"
"                    p_old_emp_id            VARCHAR2,
"
"                    p_new_emp_id            VARCHAR2,
"
"                    p_upd_opt                VARCHAR2    DEFAULT 'U',     --'U' User and Workflow only, 'A' - User and Workflow and other module access table.
"
"                    p_user                VARCHAR2);
"
"
"
"   PROCEDURE proc_upd_wf_user(p_bu                VARCHAR2,
"
"                     p_frm_user_id            VARCHAR2,
"
"                     p_to_user_id            VARCHAR2,
"
"                     p_user                VARCHAR2);
"
"
"
"   PROCEDURE proc_cre_wf_user(p_bu                VARCHAR2,
"
"                     p_frm_user_id            VARCHAR2,
"
"                     p_to_user_id            VARCHAR2,
"
"                     p_user                VARCHAR2);
"
"
"
"END pack_upd_wf_emp_pos;"
/
