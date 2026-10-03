CREATE OR REPLACE
"PACKAGE pkg_sso_cs
"
"AS
"
"  PROCEDURE proc_load_sso_cs(p_bu		VARCHAR2,
"
"			     p_plnt		VARCHAR2,
"
"			     p_plnt_loc_id	VARCHAR2,
"
"			     p_suplr_id         VARCHAR2,
"
"			     p_doc_no		VARCHAR2,
"
"			     p_sso_no		VARCHAR2,
"
"			     p_fr_date		DATE,
"
"			     p_to_date		DATE,
"
"			     p_user		VARCHAR2,
"
"			     p_res	OUT	VARCHAR2
"
"			     );
"
"
"
"  PROCEDURE proc_ins_sso_cs_line(p_bu		VARCHAR2,
"
"                                 p_doc_no	VARCHAR2,
"
"			         p_user		VARCHAR2
"
"			         );
"
"
"
"  PROCEDURE proc_cre_sso_cs(p_bu		VARCHAR2,
"
"                            p_doc_no 		VARCHAR2,
"
"			    p_user		VARCHAR2
"
"			   );
"
"END pkg_sso_cs;"
/
