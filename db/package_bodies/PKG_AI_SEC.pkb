CREATE OR REPLACE
"PACKAGE BODY           pkg_ai_sec AS
"
"
"
"    FUNCTION check_bu_exists( p_bu IN VARCHAR2 ) RETURN BOOLEAN
"
"    IS
"
"	l_cnt PLS_INTEGER;
"
"    BEGIN
"
"	SELECT COUNT(*) INTO l_cnt
"
"	  FROM business_units
"
"	 WHERE bu_id = p_bu;
"
"	RETURN ( l_cnt > 0 );
"
"    EXCEPTION
"
"	WHEN OTHERS THEN RETURN FALSE;
"
"    END check_bu_exists;
"
"
"
"    FUNCTION check_user_entitled( p_bu IN VARCHAR2 ) RETURN BOOLEAN
"
"    IS
"
"    BEGIN
"
"	IF NOT c_user_check_on THEN
"
"	    RETURN TRUE;
"
"	END IF;
"
"	RETURN TRUE;
"
"    EXCEPTION
"
"	WHEN OTHERS THEN RETURN FALSE;
"
"    END check_user_entitled;
"
"
"
"    FUNCTION is_bu_valid( p_bu IN VARCHAR2 ) RETURN BOOLEAN
"
"    IS
"
"    BEGIN
"
"	IF p_bu IS NULL OR p_bu = c_no_bu THEN
"
"	    RETURN FALSE;
"
"	END IF;
"
"	RETURN check_bu_exists( p_bu ) AND check_user_entitled( p_bu );
"
"    END is_bu_valid;
"
"
"
"    PROCEDURE init_session IS
"
"    BEGIN
"
"	NULL;
"
"    END init_session;
"
"
"
"    PROCEDURE cleanup_session IS
"
"    BEGIN
"
"	NULL;
"
"    END cleanup_session;
"
"
"
"    FUNCTION get_bu RETURN VARCHAR2
"
"    IS
"
"	l_bu VARCHAR2(30);
"
"    BEGIN
"
"	-- 1. MCP context check first (outside APEX session)
"
"	IF SYS_CONTEXT('APEX','APP_SESSION') IS NULL
"
"	   AND SYS_CONTEXT('RM_MCP_CTX','BU') IS NOT NULL
"
"	THEN
"
"	    RETURN SYS_CONTEXT('RM_MCP_CTX','BU');
"
"	END IF;
"
"
"
"	-- 2. APEX session check
"
"	l_bu := v('GLOBAL_BU');
"
"	IF l_bu IS NOT NULL THEN
"
"	    RETURN l_bu;
"
"	END IF;
"
"
"
"	RETURN NVL(SYS_CONTEXT( c_ctx, 'BU' ), c_no_bu);
"
"    END get_bu;
"
"
"
"    FUNCTION get_bu_name RETURN VARCHAR2
"
"    IS
"
"	l_name VARCHAR2(200);
"
"	l_bu   VARCHAR2(30) := get_bu;
"
"    BEGIN
"
"	IF l_bu IS NULL OR l_bu = c_no_bu THEN RETURN NULL; END IF;
"
"
"
"	SELECT bu_name1 INTO l_name
"
"	  FROM business_units
"
"	 WHERE bu_id = l_bu;
"
"	RETURN l_name;
"
"    EXCEPTION
"
"	WHEN OTHERS THEN RETURN l_bu;
"
"    END get_bu_name;
"
"
"
"    FUNCTION security_status RETURN VARCHAR2 IS
"
"    BEGIN
"
"	RETURN 'BU=' || get_bu
"
"	    || ' | user_entitlement_check='
"
"	    || CASE WHEN c_user_check_on THEN 'ON' ELSE 'OFF - NOT PRODUCTION READY' END;
"
"    END security_status;
"
"
"
"END pkg_ai_sec;"
/
