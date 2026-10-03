CREATE OR REPLACE
"PACKAGE pkg_mat_rtn
"
"AS
"
"  PROCEDURE proc_load_doc_frm_mrtn(p_bu			VARCHAR2,
"
"                                   p_doc_no		VARCHAR2,
"
"				   p_frm_wh_type	VARCHAR2,
"
"				   p_frm_wh_id		VARCHAR2,
"
"				   p_sou_type		VARCHAR2,
"
"				   p_matl_type		VARCHAR2,
"
"				   p_mi_doc_no		VARCHAR2,
"
"				   p_prod_ord_no	VARCHAR2,
"
"				   p_lot_no		VARCHAR2,
"
"				   p_ser_no		VARCHAR2,
"
"				   p_res_id		VARCHAR2,
"
"				   p_user		VARCHAR2
"
"				  );
"
"
"
"  PROCEDURE proc_ins_mat_rtn_frm_load(p_bu	VARCHAR2,
"
"				      p_plnt	VARCHAR2,
"
"				      p_doc_no	VARCHAR2,
"
"				      p_user	VARCHAR2
"
"				     );
"
"
"
"  PROCEDURE proc_ins_insp_stk_frm_mr(p_bu	VARCHAR2,
"
"				     p_plnt	VARCHAR2,
"
"				     p_doc_no	VARCHAR2,
"
"				     p_user	VARCHAR2
"
"				    );
"
"END;"
/
