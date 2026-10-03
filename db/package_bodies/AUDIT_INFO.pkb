CREATE OR REPLACE
"PACKAGE BODY        audit_info
"
"AS
"
"
"
"    FUNCTION get_ip_address
"
"      RETURN VARCHAR2
"
"    AS
"
"        v_sid    NUMBER;
"
"        ip_addr    VARCHAR2(50);
"
"    BEGIN
"
"        SELECT SYS_CONTEXT ('userenv', 'SID')
"
"          INTO v_sid
"
"          FROM DUAL;
"
"
"
"        BEGIN
"
"           SELECT NVL(SUBSTR(CLIENT_INFO,INSTR(CLIENT_INFO,'->',1)+2,INSTR(CLIENT_INFO,'->',1,2)-INSTR(CLIENT_INFO,'->',1,1)-2),
"
"                      SYS_CONTEXT('USERENV','IP_ADDRESS')) ip_addr
"
"             INTO ip_addr
"
"             FROM v$session
"
"            WHERE sid = v_sid;
"
"        EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN
"
"                ip_addr    := SYS_CONTEXT('USERENV','IP_ADDRESS');
"
"        END;
"
"
"
"        RETURN    ip_addr;
"
"    END;
"
"
"
"    FUNCTION get_os_user
"
"      RETURN VARCHAR2
"
"    AS
"
"        v_sid    NUMBER;
"
"        os_user    VARCHAR2(50);
"
"    BEGIN
"
"
"
"        SELECT SYS_CONTEXT ('userenv', 'SID')
"
"          INTO v_sid
"
"          FROM DUAL;
"
"
"
"
"
"
"
"
"
"        BEGIN
"
"           SELECT NVL(SUBSTR(CLIENT_INFO,INSTR(CLIENT_INFO,'->',1,2)+2,INSTR(CLIENT_INFO,'->',1,3)-INSTR(CLIENT_INFO,'->',1,2)-2),
"
"                      SYS_CONTEXT('USERENV','OS_USER')) os_user
"
"             INTO os_user
"
"             FROM v$session
"
"            WHERE sid = v_sid;
"
"        EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN
"
"                os_user    := SYS_CONTEXT('USERENV','OS_USER');
"
"        END;
"
"
"
"        RETURN    os_user;
"
"    END;
"
"
"
"BEGIN
"
"    v_ip_address    := get_ip_address;
"
"    v_os_user        := get_os_user;
"
"END;"
/
