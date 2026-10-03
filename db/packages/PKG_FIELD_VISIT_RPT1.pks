CREATE OR REPLACE
"PACKAGE pkg_field_visit_rpt1
"
"IS
"
"   PROCEDURE proc_ins_iss_doc1 (p_bu                VARCHAR2,
"
"                               p_plnt               VARCHAR2,
"
"                               p_plnt_loc           VARCHAR2,
"
"                               p_plnt_loc_name      VARCHAR2,
"
"                               p_date               DATE,
"
"                               p_to_plnt            VARCHAR2,
"
"                               p_doc_no             VARCHAR2,
"
"                               p_frm_store_id       VARCHAR2,
"
"                               p_lang               NUMBER,
"
"                               p_user               VARCHAR2,
"
"                               p_res            OUT VARCHAR2
"
"			       );
"
"
"
"   PROCEDURE proc_ins_cmt_hist1 (p_bu              VARCHAR2,
"
"                                p_doc_no           VARCHAR2,
"
"                                p_date             DATE,
"
"                                p_store_id         VARCHAR2,
"
"                                p_prod_id          VARCHAR2,
"
"                                p_prod_rev         NUMBER,
"
"                                p_ser_no           VARCHAR2,
"
"                                p_csr_id           VARCHAR2,
"
"                                p_wo_no            VARCHAR2,
"
"                                p_wo_unit          VARCHAR2,
"
"                                p_csr_no           VARCHAR2,
"
"                                p_trans_qty        NUMBER,
"
"                                p_transit_qty      NUMBER,
"
"                                p_wo_qty           NUMBER,
"
"                                p_buf_stk_qty      NUMBER,
"
"                                p_rpr_comp_flag    VARCHAR2,
"
"                                p_user             VARCHAR2,
"
"                                p_sys_ls_no        VARCHAR2,
"
"                                p_source_type      VARCHAR2,
"
"                                p_source_id        VARCHAR2,
"
"                                p_batch_no         VARCHAR2,
"
"                                p_bucket_type      VARCHAR2,
"
"                                p_fvr_no           VARCHAR2,
"
"                                p_fvr_seq_no       NUMBER,
"
"                                p_rwk_ord_no       VARCHAR2,
"
"                                p_type             VARCHAR2,
"
"                                p_status           VARCHAR2,
"
"                                p_ref              VARCHAR2,
"
"                                p_unit_cost        NUMBER,
"
"                                p_branch_miv_no    VARCHAR2,
"
"				p_sou_plnt         VARCHAR2,
"
"				p_fv_type 	   VARCHAR2,
"
"				p_cust_id	   VARCHAR2
"
"				);
"
"END pkg_field_visit_rpt1;"
/
