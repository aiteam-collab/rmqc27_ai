CREATE OR REPLACE
"PACKAGE pkg_mcp_tools AUTHID DEFINER AS
"
"
"
"  -- Who am I / which BU / today / current financial period
"
"  FUNCTION erp_context (p_args IN CLOB, p_mode IN VARCHAR2 DEFAULT 'EXECUTE') RETURN CLOB;
"
"
"
"  -- Sales KPIs for the caller's BU (same logic as the get_sales_summary agent tool)
"
"  FUNCTION sales_summary (p_args IN CLOB, p_mode IN VARCHAR2 DEFAULT 'EXECUTE') RETURN CLOB;
"
"
"
"  -- Create a draft Purchase Request (write tool - requires confirmation)
"
"  FUNCTION purchase_request_create (p_args IN CLOB, p_mode IN VARCHAR2 DEFAULT 'EXECUTE') RETURN CLOB;
"
"
"
"END pkg_mcp_tools;"
/
