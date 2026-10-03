CREATE OR REPLACE
"PACKAGE pkg_mcp_ctx AUTHID DEFINER AS
"
"  -- Validates the user/BU pair and sets RM_MCP_CTX. Raises -20401 / -20403.
"
"  PROCEDURE set_user_context (
"
"    p_erp_user   IN VARCHAR2,
"
"    p_bu         IN VARCHAR2,
"
"    p_client_id  IN VARCHAR2,
"
"    p_request_id IN VARCHAR2 );
"
"
"
"  -- Always call at the end of every MCP request (ORDS reuses sessions).
"
"  PROCEDURE clear_context;
"
"
"
"  FUNCTION user_has_bu (p_erp_user IN VARCHAR2, p_bu IN VARCHAR2) RETURN BOOLEAN;
"
"END pkg_mcp_ctx;"
/
