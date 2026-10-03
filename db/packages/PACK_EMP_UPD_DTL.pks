CREATE OR REPLACE
"PACKAGE        pack_emp_upd_dtl
"
"IS
"
"
"
"  PROCEDURE proc_upd_emp_dtl(p_bu        VARCHAR2,
"
"                             p_type        VARCHAR2,
"
"                             p_emp_id        VARCHAR2,
"
"                             p_user        VARCHAR2,
"
"                             p_doc_no    OUT    VARCHAR2);
"
"
"
"  PROCEDURE proc_upd_emp_depent_dtl(p_bu        VARCHAR2,
"
"                                    p_type        VARCHAR2,
"
"                                    p_emp_id        VARCHAR2,
"
"                                    p_user        VARCHAR2,
"
"                                    p_doc_no    OUT    VARCHAR2);
"
"
"
"  PROCEDURE proc_upd_emp_con_dtl(p_bu        VARCHAR2,
"
"                                 p_type        VARCHAR2,
"
"                                 p_emp_id        VARCHAR2,
"
"                                 p_user        VARCHAR2,
"
"                                 p_doc_no    OUT    VARCHAR2);
"
"
"
"  PROCEDURE proc_upd_emp_qual_dtl(p_bu        VARCHAR2,
"
"                                  p_type        VARCHAR2,
"
"                                  p_emp_id    VARCHAR2,
"
"                                  p_user        VARCHAR2,
"
"                                  p_doc_no OUT    VARCHAR2);
"
"
"
"  PROCEDURE proc_upd_emp_skill_dtl(p_bu        VARCHAR2,
"
"                                   p_type        VARCHAR2,
"
"                                   p_emp_id    VARCHAR2,
"
"                                   p_user        VARCHAR2,
"
"                                   p_doc_no  OUT    VARCHAR2);
"
"
"
"  PROCEDURE proc_upd_emp_emp_proj(p_bu        VARCHAR2,
"
"                                  p_type        VARCHAR2,
"
"                                  p_emp_id        VARCHAR2,
"
"                                  p_user        VARCHAR2,
"
"                                  p_doc_no    OUT    VARCHAR2);
"
"
"
"  v_ip_addr        VARCHAR2(20) := Audit_Info.GET_IP_ADDRESS;
"
"  v_os_user        VARCHAR2(50) := Audit_Info.GET_OS_USER;
"
"
"
"END;
"
/
