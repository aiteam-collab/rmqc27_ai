CREATE OR REPLACE
"PACKAGE pkg_hert
"
"AS
"
"  PROCEDURE proc_cre_pur_rcpt_frm_hert(p_bu		VARCHAR2,
"
"                                       p_plnt		VARCHAR2,
"
"				       p_doc_no		VARCHAR2,
"
"				       p_user		VARCHAR2,
"
"				       p_res	OUT	VARCHAR2
"
"				      );
"
"
"
"  PROCEDURE proc_cre_pur_rcpt_frm_hert_adj(p_bu			VARCHAR2,
"
"                                           p_plnt		VARCHAR2,
"
"				           p_doc_no		VARCHAR2,
"
"				           p_user		VARCHAR2,
"
"				           p_res	OUT	VARCHAR2
"
"				          );
"
"END pkg_hert;"
/
