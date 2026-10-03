CREATE OR REPLACE
"PACKAGE pkg_mcp_client AUTHID DEFINER AS
"
"
"
"  -- <<< CHANGE per environment (or move to an app setting / config table) >>>
"
"  c_endpoint   CONSTANT VARCHAR2(300) := 'http://192.168.0.28:8080/ords/rm_mcp/v1/mcp';
"
"  c_token_url  CONSTANT VARCHAR2(300) := 'http://192.168.0.28:8080/ords/rm_mcp/oauth/token';
"
"  c_credential CONSTANT VARCHAR2(100) := 'RM_MCP_OAUTH';
"
"  c_protocol   CONSTANT VARCHAR2(20)  := '2025-06-18';
"
"
"
"  -- Low level: send one JSON-RPC request, return the parsed response
"
"  FUNCTION rpc (p_method IN VARCHAR2, p_params IN json_object_t) RETURN json_object_t;
"
"
"
"  -- Call a tool as the logged-in APEX user / BU. Returns text for the LLM.
"
"  FUNCTION call_tool (p_tool_name IN VARCHAR2, p_arguments IN CLOB DEFAULT '{}') RETURN CLOB;
"
"
"
"  -- Catalogue as plain text (cached 10 minutes per DB session)
"
"  FUNCTION list_tools_text RETURN CLOB;
"
"
"
"END pkg_mcp_client;"
/
