CREATE OR REPLACE
"PACKAGE pkg_ins_frm_hist
"
"IS
"
"
"
"	PROCEDURE proc_cre_oprn_comp_wh_jrnls(
"
"					p_bu		VARCHAR2,
"
"					p_plnt		VARCHAR2,
"
"					p_comp_doc_no	VARCHAR2,
"
"					p_trans_no	VARCHAR2,
"
"					p_trans_date	DATE,
"
"					p_prod_ord_no	VARCHAR2,
"
"					p_bom_no	VARCHAR,
"
"					p_prod_id	VARCHAR2,
"
"					p_prod_rev	NUMBER,
"
"					p_comp_qty	NUMBER,
"
"					p_unit_cost	NUMBER,
"
"					p_lang		NUMBER,
"
"					p_user		VARCHAR2
"
"					);
"
"
"
"	PROCEDURE proc_cre_jrnl_nqc_ocw_to_rcpt(
"
"											p_bu		VARCHAR2,
"
"											p_plnt		VARCHAR2,
"
"											p_comp_doc_no	VARCHAR2,
"
"											p_trans_no	VARCHAR2,
"
"											p_trans_date	DATE,
"
"											p_prod_ord_no	VARCHAR2,
"
"											p_bom_no	VARCHAR,
"
"											p_prod_id	VARCHAR2,
"
"											p_prod_rev	NUMBER,
"
"											p_comp_qty	NUMBER,
"
"											p_accept_qty	NUMBER,
"
"											p_rej_qty	NUMBER,
"
"											p_rcpt_store_id	VARCHAR2,
"
"											p_rej_store_id	VARCHAR2,
"
"											p_unit_cost	NUMBER,
"
"											p_sf_code	VARCHAR2,
"
"											p_sys_ls_no	NUMBER,
"
"											p_lang		NUMBER,
"
"											p_user		VARCHAR2
"
"	 					 					 );
"
"END 	pkg_ins_frm_hist;"
/
