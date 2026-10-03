CREATE OR REPLACE
"PACKAGE pkg_cast_alloy_cost
"
"AS
"
"
"
"PROCEDURE proc_ins_cast_alloy_cost(p_bu		VARCHAR2,
"
"                                   p_doc_no	VARCHAR2,
"
"				   p_date_from	DATE,
"
"				   p_date_to	DATE,
"
"				   p_user	VARCHAR2
"
"				  );
"
"
"
"PROCEDURE proc_ins_cast_alloy_dtls(p_bu		VARCHAR2,
"
"                                   p_doc_no	VARCHAR2,
"
"				   p_date_from	DATE,
"
"				   p_date_to	DATE,
"
"				   p_user	VARCHAR2
"
"				  );
"
"
"
"END pkg_cast_alloy_cost;"
/
