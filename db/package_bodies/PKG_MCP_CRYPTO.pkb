CREATE OR REPLACE
"PACKAGE BODY           pkg_mcp_crypto AS
"
"  FUNCTION sha256 (p_clob IN CLOB) RETURN VARCHAR2 IS
"
"  BEGIN
"
"    RETURN RAWTOHEX(sys.dbms_crypto.hash(p_clob, sys.dbms_crypto.hash_sh256));
"
"  END sha256;
"
"
"
"  FUNCTION sha256_raw (p_raw IN RAW) RETURN VARCHAR2 IS
"
"  BEGIN
"
"    RETURN RAWTOHEX(sys.dbms_crypto.hash(p_raw, sys.dbms_crypto.hash_sh256));
"
"  END sha256_raw;
"
"
"
"  FUNCTION random_token (p_bytes IN PLS_INTEGER DEFAULT 24) RETURN VARCHAR2 IS
"
"  BEGIN
"
"    RETURN LOWER(RAWTOHEX(sys.dbms_crypto.randombytes(p_bytes)));
"
"  END random_token;
"
"END pkg_mcp_crypto;"
/
