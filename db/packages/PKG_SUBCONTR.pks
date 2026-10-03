CREATE OR REPLACE
"PACKAGE pkg_subcontr
"
"AS
"
"
"
"PROCEDURE proc_cre_scv_frm_sa
"
"(p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_ord_no 		VARCHAR2,
"
" p_user   		VARCHAR2,
"
" p_lang			NUMBER,
"
" p_sc_ord_no	OUT	VARCHAR2
"
");
"
"
"
"PROCEDURE proc_cre_sco_frm_sa
"
"(p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_ord_no 		VARCHAR2,
"
" p_user   		VARCHAR2,
"
" p_lang			NUMBER,
"
" p_sc_ord_no	OUT	VARCHAR2
"
");
"
"
"
"PROCEDURE proc_cre_sco_frm_sa_sf_mat
"
"(p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_ord_no 		VARCHAR2,
"
" p_user   		VARCHAR2,
"
" p_lang			NUMBER,
"
" p_sc_ord_no	OUT	VARCHAR2
"
");
"
"
"
"END pkg_subcontr;"
/
