CREATE OR REPLACE
"PACKAGE pkg_suplr_bills
"
"AS
"
"     PROCEDURE proc_upd_gl_acct_cc  (p_bu  VARCHAR2,p_doc_pfx  VARCHAR2,p_doc_no    VARCHAR2);
"
"
"
"     PROCEDURE proc_upd_tds_src_dtls(p_bu  VARCHAR2,p_doc_pfx  VARCHAR2,p_doc_no    VARCHAR2);
"
"
"
"     PROCEDURE proc_upd_tcs_src_dtls(p_bu  VARCHAR2,p_doc_pfx  VARCHAR2,p_doc_no    VARCHAR2);
"
"
"
"     PROCEDURE proc_chk_hsn_sac_code(p_bu  VARCHAR2,p_doc_no   VARCHAR2,p_grn_refer VARCHAR2);
"
"
"
"     PROCEDURE proc_upd_sub_amt(p_bu  VARCHAR2,p_doc_pfx   VARCHAR2,p_doc_no  VARCHAR2,p_seq_no NUMBER);
"
"
"
"	 PROCEDURE proc_validate_bills(p_bu   VARCHAR2,p_doc_pfx   VARCHAR2,p_doc_no  VARCHAR2);
"
"
"
"	 PROCEDURE proc_suphd_po_grn_det (p_bu      VARCHAR2,p_doc_pfx VARCHAR2,p_doc_no  VARCHAR2);
"
"
"
"     PROCEDURE proc_cre_tds (p_bu                VARCHAR2,
"
"                             p_user              VARCHAR2,
"
"                             p_doc_no            VARCHAR2,
"
"                             p_doc_pfx           VARCHAR2,
"
"                             p_plnt              VARCHAR2,
"
"                             p_tds_flag   IN OUT VARCHAR2,
"
"							 p_adv_tds           VARCHAR2 DEFAULT NULL);
"
"
"
"     PROCEDURE proc_cre_jrnl(p_bu                 VARCHAR2,
"
"                             p_user               VARCHAR2,
"
"                             p_doc_no             VARCHAR2,
"
"                             p_doc_pfx            VARCHAR2,
"
"                             p_plnt               VARCHAR2,
"
"                             p_jrnl_flag   IN OUT VARCHAR2,
"
"							 p_adv_tds            VARCHAR2 DEFAULT NULL);
"
"END;"
/
