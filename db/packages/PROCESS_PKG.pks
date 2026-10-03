CREATE OR REPLACE
"package process_pkg
"
"as
"
"type process_cursor is ref cursor;
"
"
"
"function proces_val(p_bu varchar2,p_plnt varchar2)
"
"return process_cursor;
"
"end process_pkg;"
/
