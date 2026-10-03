CREATE OR REPLACE
"PACKAGE pkg_sercomp_jrnls
"
" AS
"
" PROCEDURE proc_cre_oprn_comp_jrnl(
"
" p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_trans_no		VARCHAR2,
"
" p_doc_date		DATE,
"
" p_prod_id		VARCHAR2,
"
" p_prod_rev		NUMBER,
"
" p_prod_ord_no		VARCHAR2,
"
" p_comp_qty		NUMBER,
"
" p_user			VARCHAR2,
"
" p_lang			NUMBER
"
" );
"
"
"
"  PROCEDURE proc_cre_labor_oprn_comp_jrnl(
"
" p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_trans_no		VARCHAR2,
"
" p_doc_date		DATE,
"
" p_prod_id		VARCHAR2,
"
" p_prod_rev		NUMBER,
"
" p_prod_ord_no		VARCHAR2,
"
" p_comp_qty		NUMBER,
"
" p_user			VARCHAR2,
"
" p_lang			NUMBER
"
" );
"
"
"
" PROCEDURE proc_cre_opc_insp_jrnl(
"
" p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_trans_no		VARCHAR2,
"
" p_doc_date		DATE,
"
" p_prod_id		VARCHAR2,
"
" p_prod_rev		NUMBER,
"
" p_prod_ord_no		VARCHAR2,
"
" p_comp_qty		NUMBER,
"
" p_tarsf_code		VARCHAR2,
"
" p_user			VARCHAR2,
"
" p_lang			NUMBER
"
" );
"
"
"
" PROCEDURE proc_cre_opc_rcpt_jrnl(
"
" p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_trans_no		VARCHAR2,
"
" p_doc_date		DATE,
"
" p_prod_id		VARCHAR2,
"
" p_prod_rev		NUMBER,
"
" p_prod_ord_no		VARCHAR2,
"
" p_comp_qty		NUMBER,
"
" p_acpt_qty		NUMBER,
"
" p_rej_qty		NUMBER,
"
" p_tarsf_code		VARCHAR2,
"
" p_user			VARCHAR2,
"
" p_lang			NUMBER
"
" );
"
"
"
" PROCEDURE proc_cre_insp_postinsp_jrnl(
"
" p_bu		VARCHAR2,
"
" p_plnt		VARCHAR2,
"
" p_trans_no	VARCHAR2,
"
" p_doc_date	DATE,
"
" p_prod_id	VARCHAR2,
"
" p_prod_rev	NUMBER,
"
" p_prod_ord_no	VARCHAR2,
"
" p_comp_qty	NUMBER,
"
" p_tarsf_code	VARCHAR2,
"
" p_qc_pfx	VARCHAR2,
"
" p_qc_no	VARCHAR2,
"
" p_qc_line	NUMBER,
"
" p_user		VARCHAR2,
"
" p_lang		NUMBER
"
" );
"
"
"
" PROCEDURE proc_cre_postinsp_rcpt_jrnl(
"
" p_bu		VARCHAR2,
"
" p_plnt		VARCHAR2,
"
" p_trans_no	VARCHAR2,
"
" p_doc_date	DATE,
"
" p_prod_id	VARCHAR2,
"
" p_prod_rev	NUMBER,
"
" p_prod_ord_no	VARCHAR2,
"
" p_qc_pfx	VARCHAR2,
"
" p_qc_no	VARCHAR2,
"
" p_qc_line	NUMBER,
"
" p_comp_qty	NUMBER,
"
" p_tarsf_code	VARCHAR2,
"
" p_user		VARCHAR2,
"
" p_lang		NUMBER
"
" );
"
"
"
" END pkg_sercomp_jrnls;"
/
