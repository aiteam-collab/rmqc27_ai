CREATE OR REPLACE
"PACKAGE        cryptit AS
"
"     FUNCTION encrypt(
"
"          str     VARCHAR2
"
"     )
"
"          RETURN RAW;
"
"
"
"     FUNCTION decrypt(
"
"          xcrypt     VARCHAR2
"
"     )
"
"          RETURN VARCHAR2;
"
"END cryptit;"
/
