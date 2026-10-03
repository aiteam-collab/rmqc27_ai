CREATE OR REPLACE
"PACKAGE pkg_mat_iss
"
"AS
"
"  PROCEDURE proc_rev_mat_frm_mi(p_bu		business_units.bu_id%TYPE,
"
"                                p_plnt		inv_stock_trans_hd.isthd_plnt%TYPE,
"
"				p_mi_doc_no	inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                p_user		appl_users.appluser_id%TYPE,
"
"				p_lang		NUMBER
"
"			       );
"
"
"
"  PROCEDURE proc_load_mat_frm_mi(p_bu			VARCHAR2,
"
"                                 p_plnt			VARCHAR2,
"
"				 p_plnt_loc_id		VARCHAR2,
"
"				 p_mi_doc_no		VARCHAR2,
"
"				 p_fetch_opt		VARCHAR2,
"
"				 p_gen_type		VARCHAR2,
"
"				 p_prod_id		VARCHAR2,
"
"				 p_prod_rev		NUMBER,
"
"				 p_trans_qty		NUMBER,
"
"				 p_so_type		VARCHAR2,
"
"                                 p_so_pfx		VARCHAR2,
"
"                                 p_so_no		VARCHAR2,
"
"                                 p_so_seq_no		NUMBER,
"
"                                 p_so_sub_seq_no	NUMBER,
"
"                                 p_proj_id		VARCHAR2,
"
"                                 p_task_id		VARCHAR2,
"
"				 p_so_prj_ref		VARCHAR2,
"
"				 p_cust_id		VARCHAR2,
"
"				 p_tool_chrt_no		VARCHAR2,
"
"				 p_miv_no		VARCHAR2,
"
"                                 p_user			VARCHAR2,
"
"				 p_lang			NUMBER
"
"			        );
"
"
"
"  PROCEDURE proc_ins_mat_frm_mi_load(p_bu		VARCHAR2,
"
"				     p_mi_doc_no	VARCHAR2,
"
"				     p_user		VARCHAR2
"
"				    );
"
"
"
"  PROCEDURE proc_load_stk_frm_mi(p_bu			VARCHAR2,
"
"                                 p_plnt                 VARCHAR2,
"
"				 p_mi_doc_no		VARCHAR2,
"
"				 p_mi_issueto_type    VARCHAR2,
"
"				 p_store_id		VARCHAR2,
"
"                                 p_user			VARCHAR2
"
"			        );
"
"
"
"  PROCEDURE proc_ins_stk_mat_frm_mi(p_bu		VARCHAR2,
"
"				    p_mi_doc_no		VARCHAR2,
"
"				    p_user		VARCHAR2
"
"				   );
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_pur_rcpt(p_bu			VARCHAR2,
"
"				          p_rcpt_no		VARCHAR2,
"
"				          p_user		VARCHAR2,
"
"					  p_user_emp		VARCHAR2,
"
"					  p_lang		NUMBER,
"
"					  p_mi_doc_no	OUT	VARCHAR2
"
"				         );
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_qc_compl(p_bu			VARCHAR2,
"
"				          p_qc_no		VARCHAR2,
"
"				          p_user		VARCHAR2,
"
"					  p_user_emp		VARCHAR2,
"
"					  p_lang		NUMBER,
"
"					  p_mi_doc_no	OUT	VARCHAR2
"
"				         );
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_mrv(p_bu			VARCHAR2,
"
"				     p_rcpt_no			VARCHAR2,
"
"				     p_user			VARCHAR2,
"
"				     p_user_emp		VARCHAR2,
"
"				     p_lang			NUMBER,
"
"				     p_mi_doc_no	OUT	VARCHAR2
"
"				    );
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_cmr(p_bu			VARCHAR2,
"
"				     p_plnt			VARCHAR2,
"
"				     p_doc_no			VARCHAR2,
"
"				     p_user			VARCHAR2,
"
"				     p_user_emp		VARCHAR2,
"
"				     p_lang			NUMBER,
"
"				     p_mi_doc_no	OUT	VARCHAR2
"
"				    );
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_mat_rtn(p_bu			VARCHAR2,
"
"				         p_plnt			VARCHAR2,
"
"				         p_doc_no		VARCHAR2,
"
"				         p_user			VARCHAR2,
"
"				         p_user_emp		VARCHAR2,
"
"				         p_lang			NUMBER,
"
"				         p_mi_doc_no	OUT	VARCHAR2
"
"				        );
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_qc_rqst(p_bu			VARCHAR2,
"
"				         p_pln_no		VARCHAR2,
"
"				         p_user			VARCHAR2,
"
"					 p_user_emp		VARCHAR2,
"
"					 p_lang			NUMBER,
"
"					 p_mi_doc_no	OUT	VARCHAR2
"
"				        );
"
"
"
"END pkg_mat_iss;"
/
