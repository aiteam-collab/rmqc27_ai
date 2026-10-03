CREATE OR REPLACE
"package body process_pkg
"
"as
"
"function proces_val(p_bu varchar2, p_plnt varchar2)
"
"return process_cursor as
"
"
"
"proc_cur process_cursor;
"
"
"
"begin
"
"open proc_cur for select *from processes where process_bu=p_bu
"
"and process_plnt=p_plnt;
"
"return proc_cur;
"
"end proces_val;
"
"end process_pkg;"
/
