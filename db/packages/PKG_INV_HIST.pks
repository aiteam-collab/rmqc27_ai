CREATE OR REPLACE
"PACKAGE pkg_inv_hist
"
"AS
"
"
"
"  /*Material Request*/
"
"  PROCEDURE proc_ins_mr_hist(p_bu		inv_material_request_hd.imrhd_bu%TYPE,
"
"			     p_rqst_no		inv_material_request_hd.imrhd_rqst_no%TYPE
"
"			    );
"
"
"
"  /*Material Request - Rev*/
"
"  PROCEDURE proc_rev_mr_hist(p_bu		inv_material_request_hd.imrhd_bu%TYPE,
"
"			     p_rqst_no		inv_material_request_hd.imrhd_rqst_no%TYPE
"
"			    );
"
"
"
"  /*Material Issuance*/
"
"  PROCEDURE proc_ins_mi_hist(p_bu		inv_stock_trans_hd.isthd_bu%TYPE,
"
"			     p_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE
"
"			    );
"
"
"
"  PROCEDURE proc_rev_mi_hist(p_bu		inv_stock_trans_hd.isthd_bu%TYPE,
"
"			     p_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE
"
"			    );
"
"
"
"  /*Material Return*/
"
"  PROCEDURE proc_ins_mat_ret_hist(p_bu		store_stock_trans_hd.ssthd_bu%TYPE,
"
"  				  p_doc_no	store_stock_trans_hd.ssthd_doc_no%TYPE
"
"  				 );
"
"
"
"  PROCEDURE proc_rev_mat_ret_hist(p_bu		store_stock_trans_hd.ssthd_bu%TYPE,
"
"  				  p_doc_no	store_stock_trans_hd.ssthd_doc_no%TYPE
"
"  				 );
"
"
"
"  /*CMR Receipts*/
"
"  /*PROCEDURE proc_ins_cmr_rcpt_hist(p_bu		cust_mat_trans_hd.cmthd_bu%TYPE,
"
"  				   p_plnt	cust_mat_trans_hd.cmthd_plnt%TYPE,
"
"  				   p_doc_no	cust_mat_trans_hd.cmthd_doc_no%TYPE
"
"  				  );*/
"
"
"
"  /*CMR Return*/
"
"  /*PROCEDURE proc_ins_cmr_return_hist(p_bu	cust_mat_trans_return_hd.cmtrhd_bu%TYPE,
"
"  				     p_plnt	cust_mat_trans_return_hd.cmtrhd_plnt%TYPE,
"
"  				     p_doc_no	cust_mat_trans_return_hd.cmtrhd_doc_no%TYPE
"
"  				    );*/
"
"
"
"END pkg_inv_hist;"
/
