CREATE OR REPLACE
"PACKAGE        PKG_SI_INVOICE_WEB_SOM1090 AS
"
"  PROCEDURE proc_si_pick_det_web (p_bu             VARCHAR2,
"
"                        p_user           VARCHAR2,
"
"                        p_sihd_plant     VARCHAR2,
"
"                        p_sihd_doc_no    VARCHAR2);
"
"
"
"
"
"  PROCEDURE proc_si_cre_inv_web (p_bu             VARCHAR2,
"
"                       p_sihd_plant     VARCHAR2,
"
"                       p_sihd_doc_no    VARCHAR2,
"
"                       p_user           VARCHAR2);
"
"
"
" PROCEDURE proc_si_journal_web (
"
"   p_bu                      VARCHAR2,
"
"   p_sihd_cust_id            VARCHAR2,
"
"   p_sihd_jrnl_flag   IN OUT VARCHAR2,
"
"   p_sihd_plant              VARCHAR2,
"
"   p_sihd_doc_no             VARCHAR2,
"
"   p_user                    VARCHAR2,
"
"   p_lang                    NUMBER);
"
"
"
"PROCEDURE  proc_si_post_web (
"
"   p_bu            VARCHAR2,
"
"   p_user          VARCHAR2,
"
"   p_plnt          VARCHAR2,
"
"   p_doc_no        VARCHAR2,
"
"   p_lang          VARCHAR2,
"
"   p_wf_type   OUT VARCHAR2);
"
"
"
"end PKG_SI_INVOICE_WEB_SOM1090;"
/
