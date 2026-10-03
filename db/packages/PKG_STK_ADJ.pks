CREATE OR REPLACE
"PACKAGE pkg_stk_adj
"
"AS
"
"
"
"  PROCEDURE proc_gen_sc_mat_req_frm_osa
"
"  (p_bu		VARCHAR2,
"
"   p_plnt	VARCHAR2,
"
"   p_doc_no	VARCHAR2,
"
"   p_user	VARCHAR2
"
"  );
"
"
"
"  PROCEDURE proc_cre_sco_frm_osa
"
"  (p_bu			VARCHAR2,
"
"   p_plnt		VARCHAR2,
"
"   p_plnt_loc_id	VARCHAR2,
"
"   p_doc_no		VARCHAR2,
"
"   p_user		VARCHAR2
"
"  );
"
"
"
"  PROCEDURE proc_cre_sa_frm_osa
"
"  (p_bu		VARCHAR2,
"
"   p_plnt	VARCHAR2,
"
"   p_doc_no	VARCHAR2,
"
"   p_user	VARCHAR2
"
"  );
"
"
"
"END pkg_stk_adj;"
/
