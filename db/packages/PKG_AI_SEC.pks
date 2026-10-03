CREATE OR REPLACE
"PACKAGE pkg_ai_sec AUTHID DEFINER AS
"
"
"
"    c_ctx    CONSTANT VARCHAR2(30) := 'RM_AI_CTX';
"
"    c_no_bu  CONSTANT VARCHAR2(30) := '~*NO_BU*~';
"
"
"
"    -- Leave FALSE until check_user_entitled() has the real login rule.
"
"    c_user_check_on CONSTANT BOOLEAN := FALSE;
"
"
"
"    PROCEDURE init_session;
"
"    PROCEDURE cleanup_session;
"
"
"
"    FUNCTION get_bu          RETURN VARCHAR2;
"
"    FUNCTION get_bu_name     RETURN VARCHAR2;
"
"    FUNCTION is_bu_valid( p_bu IN VARCHAR2 ) RETURN BOOLEAN;
"
"    FUNCTION security_status RETURN VARCHAR2;
"
"
"
"END pkg_ai_sec;"
/
