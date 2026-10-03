CREATE OR REPLACE
"PACKAGE pkg_dc
"
"AS
"
"  PROCEDURE proc_alloc_bin_frm_dc_mat_rcpt(p_bu			VARCHAR2,
"
"                                           p_plnt		VARCHAR2,
"
"					   p_doc_no		VARCHAR2,
"
"					   p_seq_no		NUMBER,
"
"                                           p_user		VARCHAR2,
"
"					   p_res	OUT	VARCHAR2
"
"				          );
"
"
"
"  PROCEDURE proc_alloc_bin_frm_dc_mt_rcpt1(p_bu			VARCHAR2,
"
"					   p_lr_no		VARCHAR2,
"
"                                           p_user		VARCHAR2,
"
"					   p_res	OUT	VARCHAR2
"
"				          );
"
"END pkg_dc;"
/
