CREATE OR REPLACE
"PACKAGE audit_info
"
"AS
"
"    FUNCTION get_ip_address RETURN VARCHAR2;
"
"    FUNCTION get_os_user RETURN VARCHAR2;
"
"
"
"	v_ip_address	VARCHAR2(100);
"
"	v_os_user		VARCHAR2(100);
"
"
"
"END audit_info;"
/
