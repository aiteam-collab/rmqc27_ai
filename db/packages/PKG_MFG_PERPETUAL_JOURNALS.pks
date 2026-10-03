CREATE OR REPLACE
"PACKAGE pkg_mfg_perpetual_journals
"
"AS
"
"
"
"	PROCEDURE proc_delete_journals(p_bu			VARCHAR2,
"
"								   p_plnt		VARCHAR2,
"
"								   p_trans_no	VARCHAR2,
"
"								   p_vou_type	VARCHAR2,
"
"								   p_appl		VARCHAR2
"
"								   );
"
"
"
"	PROCEDURE proc_ins_oprn_comp_wh(
"
"								    p_bu			VARCHAR2,
"
"								    p_plnt			VARCHAR2,
"
"								    p_plnt_loc_id		VARCHAR2,
"
"								    p_trans_no		VARCHAR2,
"
"								    p_doc_date		DATE,
"
"								    p_prod_id		VARCHAR2,
"
"								    p_prod_rev		NUMBER,
"
"								    p_prod_ord_no		VARCHAR2,
"
"								    p_comp_qty		NUMBER,
"
"								    p_user			VARCHAR2,
"
"								    p_lang			NUMBER
"
"								    );
"
"
"
"	PROCEDURE proc_ins_opcinsp_jrnl(
"
"									p_bu				VARCHAR2,
"
"									p_plnt				VARCHAR2,
"
"									p_plnt_loc_id			VARCHAR2,
"
"									p_trans_no			VARCHAR2,
"
"									p_doc_date			DATE,
"
"									p_prod_id			VARCHAR2,
"
"									p_prod_rev			NUMBER,
"
"									p_prod_ord_no		VARCHAR2,
"
"									p_comp_qty			NUMBER,
"
"									p_tarsf_code		VARCHAR2,
"
"									p_user				VARCHAR2,
"
"									p_lang				NUMBER
"
"									);
"
"
"
"	PROCEDURE proc_ins_opcrcpt_jrnl(
"
"									p_bu				VARCHAR2,
"
"									p_plnt				VARCHAR2,
"
"									p_plnt_loc_id			VARCHAR2,
"
"									p_trans_no			VARCHAR2,
"
"									p_doc_date			DATE,
"
"									p_prod_id			VARCHAR2,
"
"									p_prod_rev			NUMBER,
"
"									p_prod_ord_no		VARCHAR2,
"
"									p_comp_qty			NUMBER,
"
"									p_tarsf_code		VARCHAR2,
"
"									p_user				VARCHAR2,
"
"									p_lang				NUMBER
"
"									);
"
"
"
"	PROCEDURE proc_ins_insp_postinsp_jrnl(
"
"										  p_bu				VARCHAR2,
"
"										  p_plnt			VARCHAR2,
"
"										  p_plnt_loc_id			VARCHAR2,
"
"										  p_trans_no		VARCHAR2,
"
"										  p_doc_date		DATE,
"
"										  p_prod_id			VARCHAR2,
"
"										  p_prod_rev		NUMBER,
"
"										  p_prod_ord_no		VARCHAR2,
"
"										  p_comp_qty		NUMBER,
"
"										  p_tarsf_code		VARCHAR2,
"
"										  p_qc_pfx			VARCHAR2,
"
"										  p_qc_no			VARCHAR2,
"
"										  p_qc_rev			NUMBER,
"
"										  p_qc_line			NUMBER,
"
"										  p_user			VARCHAR2,
"
"										  p_lang			NUMBER
"
"										  );
"
"
"
"	PROCEDURE proc_ins_postinsp_rcpt_jrnl(
"
"										  p_bu			VARCHAR2,
"
"										  p_plnt		VARCHAR2,
"
"										  p_plnt_loc_id		VARCHAR2,
"
"										  p_trans_no		VARCHAR2,
"
"										  p_doc_date		DATE,
"
"										  p_prod_id		VARCHAR2,
"
"										  p_prod_rev		NUMBER,
"
"										  p_prod_ord_no		VARCHAR2,
"
"										  p_qc_pfx		VARCHAR2,
"
"										  p_qc_no		VARCHAR2,
"
"										  p_qc_rev		NUMBER,
"
"										  p_qc_line		NUMBER,
"
"										  p_comp_qty		NUMBER,
"
"										  p_tarsf_code		VARCHAR2,
"
"										  p_user		VARCHAR2,
"
"										  p_lang		NUMBER
"
"										  );
"
"
"
"	PROCEDURE proc_post_journals(p_bu			VARCHAR2,
"
"								 p_plnt			VARCHAR2,
"
"								 p_trans_no		VARCHAR2,
"
"								 p_trans_date	DATE	,
"
"								 p_user			VARCHAR2
"
"								 );
"
"
"
"END pkg_mfg_perpetual_journals;"
/
