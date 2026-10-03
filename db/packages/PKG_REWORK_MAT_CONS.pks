CREATE OR REPLACE
"PACKAGE pkg_rework_mat_cons
"
"IS
"
"	PROCEDURE proc_ins_mat_req(p_bu          VARCHAR2,
"
"							   p_plnt        VARCHAR2,
"
"							   p_doc_no		 VARCHAR2,
"
"							   p_rwk_ord_no	 VARCHAR2,
"
"							   p_user		 VARCHAR2
"
"							   );
"
"
"
"	PROCEDURE proc_cre_mr_frm_rwk_comp(
"
"									   p_bu          VARCHAR2,
"
"									   p_plnt        VARCHAR2,
"
"									   p_ord_no  VARCHAR2,
"
"									   p_ord_date    DATE,
"
"									   p_user        VARCHAR2,
"
"									   p_lang        NUMBER,
"
"									   p_mr_no   OUT VARCHAR2,
"
"									   p_mi_no   OUT VARCHAR2
"
"									   );
"
"
"
"	PROCEDURE proc_delete_exceptions(p_bu          VARCHAR2,
"
"									 p_plnt        VARCHAR2,
"
"									 p_doc_no	   VARCHAR2
"
"									);
"
"
"
"	PROCEDURE proc_chk_exception(p_bu          VARCHAR2,
"
"							     p_plnt        VARCHAR2,
"
"							     p_rwk_ord_no  VARCHAR2,
"
"								 p_doc_no	   VARCHAR2,
"
"								 p_user		   VARCHAR2
"
"								 );
"
"
"
"	PROCEDURE proc_alloc_rwk_mat_cons(p_bu				VARCHAR2,
"
"									  p_plnt			VARCHAR2,
"
"									  p_doc_no			VARCHAR2,
"
"									  p_doc_date		DATE,
"
"									  p_order_no		VARCHAR2,
"
"									  p_lang			NUMBER,
"
"									  p_type			VARCHAR2,
"
"									  p_user			VARCHAR2,
"
"									  p_res		OUT		VARCHAR2
"
"									  );
"
"
"
"	PROCEDURE proc_dec_rwk_mat_cons(p_bu			VARCHAR2,
"
"									p_plnt			VARCHAR2,
"
"									p_doc_no		VARCHAR2,
"
"									p_doc_date		DATE,
"
"									p_order_no		VARCHAR2,
"
"									p_lang			NUMBER,
"
"									p_user			VARCHAR2
"
"									);
"
"
"
"END pkg_rework_mat_cons;"
/
