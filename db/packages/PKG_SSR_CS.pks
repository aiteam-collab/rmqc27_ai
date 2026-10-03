CREATE OR REPLACE
"PACKAGE pkg_ssr_cs
"
"AS
"
"  PROCEDURE proc_load_ssr_cs(p_bu		VARCHAR2,
"
"			     p_plnt		VARCHAR2,
"
"			     p_plnt_loc_id	VARCHAR2,
"
"			     p_doc_no		VARCHAR2,
"
"			     p_ssr_no	        VARCHAR2,
"
"			     p_fr_date		DATE,
"
"			     p_to_date		DATE,
"
"			     p_user		VARCHAR2,
"
"			     p_res	OUT	VARCHAR2
"
"			    );
"
"
"
"  PROCEDURE proc_cre_ssr_cs(p_bu		VARCHAR2,
"
"                            p_doc_no 		VARCHAR2,
"
"			    p_user		VARCHAR2
"
"			   );
"
"END pkg_ssr_cs;"
/
