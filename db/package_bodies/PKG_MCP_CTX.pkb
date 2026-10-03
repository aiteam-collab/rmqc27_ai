CREATE OR REPLACE
"PACKAGE BODY pkg_mcp_ctx AS
"
"
"
"  c_ns CONSTANT VARCHAR2(30) := 'RM_MCP_CTX';
"
"
"
"  FUNCTION user_has_bu (p_erp_user IN VARCHAR2, p_bu IN VARCHAR2) RETURN BOOLEAN IS
"
"    l_cnt PLS_INTEGER;
"
"  BEGIN
"
"    SELECT COUNT(*)
"
"      INTO l_cnt
"
"      FROM mcp_user_bu
"
"     WHERE erp_user  = UPPER(p_erp_user)
"
"       AND bu_code   = UPPER(p_bu)
"
"       AND is_active = 'Y';
"
"    RETURN l_cnt > 0;
"
"  END user_has_bu;
"
"
"
"  PROCEDURE clear_context IS
"
"  BEGIN
"
"    dbms_session.clear_all_context(c_ns);
"
"    dbms_session.clear_identifier;
"
"  END clear_context;
"
"
"
"  PROCEDURE set_user_context (
"
"    p_erp_user   IN VARCHAR2,
"
"    p_bu         IN VARCHAR2,
"
"    p_client_id  IN VARCHAR2,
"
"    p_request_id IN VARCHAR2 )
"
"  IS
"
"  BEGIN
"
"    clear_context;
"
"
"
"    IF p_erp_user IS NULL OR p_bu IS NULL THEN
"
"      raise_application_error(-20401,
"
"        'MCP: an ERP user and a Business Unit are required for this call.');
"
"    END IF;
"
"
"
"    IF NOT user_has_bu(p_erp_user, p_bu) THEN
"
"      raise_application_error(-20403,
"
"        'MCP: user ' || UPPER(p_erp_user) || ' is not allowed to use the AI assistant for Business Unit '
"
"        || UPPER(p_bu) || '.');
"
"    END IF;
"
"
"
"    dbms_session.set_context(c_ns, 'ERP_USER',   UPPER(p_erp_user));
"
"    dbms_session.set_context(c_ns, 'BU',         UPPER(p_bu));
"
"    dbms_session.set_context(c_ns, 'CLIENT_ID',  p_client_id);
"
"    dbms_session.set_context(c_ns, 'REQUEST_ID', p_request_id);
"
"    dbms_session.set_identifier(SUBSTR(UPPER(p_erp_user) || '@MCP', 1, 64));  -- visible in V$SESSION
"
"  END set_user_context;
"
"
"
"END pkg_mcp_ctx;"
/
