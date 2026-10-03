CREATE OR REPLACE
"PACKAGE pkg_po_amend
"
"AS
"
"
"
"  PROCEDURE proc_load_multi_cs_frm_pend_po(p_bu			VARCHAR2,
"
"					   p_plnt		VARCHAR2,
"
"					   p_plnt_loc_id	VARCHAR2,
"
"					   p_doc_no		VARCHAR2,
"
"					   p_suplr_id	        VARCHAR2,
"
"					   p_fr_date		DATE,
"
"					   p_to_date		DATE,
"
"					   p_user		VARCHAR2,
"
"					   p_mode		VARCHAR2	DEFAULT 'PO',
"
"					   p_res	OUT	VARCHAR2
"
"					  );
"
"
"
"  PROCEDURE proc_cre_cs_doc_frm_multi_cs(p_bu		VARCHAR2,
"
"                                         p_plnt		VARCHAR2,
"
"					 p_doc_no	VARCHAR2,
"
"					 p_user		VARCHAR2
"
"					);
"
"
"
"END pkg_po_amend;"
/
