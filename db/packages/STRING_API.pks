CREATE OR REPLACE
"PACKAGE string_api AS
"
"-- --------------------------------------------------------------------------
"
"-- Name         : https://oracle-base.com/dba/miscellaneous/string_api.sql
"
"-- Author       : Tim Hall
"
"-- Description  : A package to hold string utilities.
"
"-- Requirements :
"
"-- Amendments   :
"
"--   When         Who       What
"
"--   ===========  ========  =================================================
"
"--   02-DEC-2004  Tim Hall  Initial Creation
"
"-- --------------------------------------------------------------------------
"
"
"
"-- Public types
"
"TYPE t_split_array IS TABLE OF VARCHAR2(4000);
"
"
"
"FUNCTION split_text (p_text       IN  CLOB,
"
"                     p_delimeter  IN  VARCHAR2 DEFAULT ',')
"
"  RETURN t_split_array;
"
"
"
"PROCEDURE print_clob (p_clob  IN  CLOB);
"
"PROCEDURE print_clob_old (p_clob  IN  CLOB);
"
"
"
"PROCEDURE print_clob_htp (p_clob  IN  CLOB);
"
"PROCEDURE print_clob_htp_old (p_clob  IN  CLOB);
"
"
"
"END string_api;"
/
