CREATE OR REPLACE
"PACKAGE pack_upload_gst_rtn2b_old
"
"   AUTHID CURRENT_USER
"
"AS
"
"   PROCEDURE proc_upload_gst_rtn2b (p_bu                VARCHAR2,
"
"                                    p_doc_no            VARCHAR2,
"
"                                    p_dir               VARCHAR2,
"
"                                    p_file_name         VARCHAR2,
"
"                                    p_user              VARCHAR2,
"
"                                    p_prev_record       VARCHAR2,
"
"                                    p_res           OUT VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gst_b2b (p_bu             VARCHAR2,
"
"                                  p_doc_no         VARCHAR2,
"
"                                  p_gstin_no       VARCHAR2,
"
"                                  p_type           VARCHAR2,
"
"                                  p_dir            VARCHAR2,
"
"                                  p_file_name      VARCHAR2,
"
"                                  p_user           VARCHAR2,
"
"                                  p_prev_record    VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gst_b2ba (p_bu             VARCHAR2,
"
"                                   p_doc_no         VARCHAR2,
"
"                                   p_gstin_no       VARCHAR2,
"
"                                   p_dir            VARCHAR2,
"
"                                   p_file_name      VARCHAR2,
"
"                                   p_user           VARCHAR2,
"
"                                   p_prev_record    VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gst_cdnr (p_bu             VARCHAR2,
"
"                                   p_doc_no         VARCHAR2,
"
"                                   p_gstin_no       VARCHAR2,
"
"                                   p_type           VARCHAR2,
"
"                                   p_dir            VARCHAR2,
"
"                                   p_file_name      VARCHAR2,
"
"                                   p_user           VARCHAR2,
"
"                                   p_prev_record    VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gst_cdnra (p_bu             VARCHAR2,
"
"                                    p_doc_no         VARCHAR2,
"
"                                    p_gstin_no       VARCHAR2,
"
"                                    p_type           VARCHAR2,
"
"                                    p_dir            VARCHAR2,
"
"                                    p_file_name      VARCHAR2,
"
"                                    p_user           VARCHAR2,
"
"                                    p_prev_record    VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gst_impg (p_bu             VARCHAR2,
"
"                                   p_doc_no         VARCHAR2,
"
"                                   p_gstin_no       VARCHAR2,
"
"                                   p_dir            VARCHAR2,
"
"                                   p_file_name      VARCHAR2,
"
"                                   p_user           VARCHAR2,
"
"                                   p_prev_record    VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gst_isd (p_bu             VARCHAR2,
"
"                                  p_doc_no         VARCHAR2,
"
"                                  p_type           VARCHAR2,
"
"                                  p_dir            VARCHAR2,
"
"                                  p_file_name      VARCHAR2,
"
"                                  p_user           VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gst_isda (p_bu           VARCHAR2,
"
"                                   p_doc_no       VARCHAR2,
"
"                                   p_type         VARCHAR2,
"
"                                   p_dir          VARCHAR2,
"
"                                   p_file_name    VARCHAR2,
"
"                                   p_user         VARCHAR2);
"
"END;"
/
