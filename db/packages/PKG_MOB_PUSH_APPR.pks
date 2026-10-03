CREATE OR REPLACE
"PACKAGE pkg_mob_push_appr
"
"AS
"
"   PROCEDURE proc_register_user_token (p_bu        VARCHAR2,
"
"                                       p_plnt      VARCHAR2,
"
"                                       p_user      VARCHAR2,
"
"                                       p_emp_id    VARCHAR2,
"
"                                       p_token     VARCHAR2);
"
"
"
"   PROCEDURE proc_send_notification (p_bu        VARCHAR2,
"
"                                     p_emp_id    VARCHAR2,
"
"                                     p_title     VARCHAR2,
"
"                                     p_msg       VARCHAR2,
"
"                                     p_source VARCHAR2 DEFAULT 'MOBILE',
"
"									 p_app_id     VARCHAR2,
"
"									 p_file_path  VARCHAR2);
"
"END;"
/
