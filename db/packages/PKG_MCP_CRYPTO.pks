CREATE OR REPLACE
"PACKAGE           pkg_mcp_crypto AUTHID DEFINER AS
"
"  FUNCTION sha256 (p_clob IN CLOB) RETURN VARCHAR2;
"
"  FUNCTION sha256_raw (p_raw IN RAW) RETURN VARCHAR2;
"
"  FUNCTION random_token (p_bytes IN PLS_INTEGER DEFAULT 24) RETURN VARCHAR2;
"
"END pkg_mcp_crypto;"
/
