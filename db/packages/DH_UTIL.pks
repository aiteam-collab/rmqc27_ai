CREATE OR REPLACE
"package dh_util is
"
"   function spell (x in number) return varchar2;
"
"   function check_protect (x in number) return varchar2;
"
"   pragma restrict_references(spell,WNDS);
"
"   pragma restrict_references(check_protect,WNDS);
"
"end;"
/
