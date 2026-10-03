CREATE OR REPLACE
"package pkg_bone_wash_prdn as
"
"function func_find_washsoda_cons
"
"(p_bu varchar2,
"
"p_plnt varchar2,
"
"p_date date) return number;
"
"
"
"function func_find_bne_qty(p_bu varchar2,
"
"                                             p_plnt varchar2,
"
"					     p_batch varchar2,
"
"					     p_date date) return number;
"
"
"
"function func_find_chrg_qty(p_bu varchar2,
"
"                                             p_plnt varchar2,
"
"					     p_batch varchar2,
"
"					     p_date date) return number;
"
"end;"
/
