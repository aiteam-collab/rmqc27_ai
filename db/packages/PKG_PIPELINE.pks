CREATE OR REPLACE
"PACKAGE pkg_pipeline
"
"AS
"
"  PROCEDURE proc_cre_po_frm_pipeline(p_bu		VARCHAR2,
"
"                                     p_date		DATE,
"
"				     p_trf_plnt		VARCHAR2,
"
"				     p_user		VARCHAR2,
"
"				     p_lang		NUMBER,
"
"				     p_po_no	OUT	VARCHAR2
"
"				    );
"
"
"
"  PROCEDURE proc_cre_sso_frm_pipeline(p_bu		VARCHAR2,
"
"				      p_plnt		VARCHAR2,
"
"				      p_user		VARCHAR2,
"
"				      p_ss_no	OUT	VARCHAR2
"
"				    );
"
"END pkg_pipeline;"
/
