CREATE OR REPLACE
"PACKAGE pkg_pend_bank_cash AS
"
"    PROCEDURE proc_get_pend_rec(p_bu           VARCHAR2,
"
"                                p_user         VARCHAR2,
"
"                                p_doc_gen_flag VARCHAR2,
"
"                                p_vou_type     VARCHAR2,
"
"                                p_suphd_type   VARCHAR2,
"
"                                p_ord_pfx      VARCHAR2,
"
"                                p_ord_no       VARCHAR2,
"
"                                p_seq_no       VARCHAR2);
"
"
"
"    PROCEDURE proc_get_pend_pay(p_bu            VARCHAR2,
"
"                                p_user          VARCHAR2,
"
"                                p_doc_gen_flag  VARCHAR2,
"
"                                p_ord_pfx       VARCHAR2,
"
"                                p_ord_no        VARCHAR2,
"
"                                p_seq_no        VARCHAR2,
"
"                                p_trans_curr    VARCHAR2,
"
"                                p_due_date_from DATE,
"
"                                p_due_date_to   DATE,
"
"                                p_vou_type      VARCHAR2,
"
"                                p_show_my_doc   VARCHAR2,
"
"                                p_fetch_line    VARCHAR2,
"
"                                p_type_param    VARCHAR2);
"
"   PROCEDURE proc_get_pend_rec_adv( p_bu               VARCHAR2,
"
"                                    P_user             VARCHAR2,
"
"                                    p_ord_pfx          VARCHAR2,
"
"                                    p_ord_no           VARCHAR2,
"
"                                    p_btdln_seq_no     NUMBER,
"
"                                    p_fetch_line       VARCHAR2);
"
"
"
"    PROCEDURE proc_valid_pay_stat(p_bu         VARCHAR2,
"
"                                  p_user       VARCHAR2,
"
"                                  p_suphd_type VARCHAR2,
"
"                                  p_bank_id    VARCHAR2,
"
"                                  p_unit       VARCHAR2,
"
"                                  p_unit_loc   VARCHAR2,
"
"                                  p_date       DATE,
"
"                                  p_screen     VARCHAr2,
"
"                                  p_rowid      OUT VARCHAR2,
"
"                                  p_doc_no     OUT VARCHAR2);
"
"
"
"   PROCEDURE proc_check_pay_stat(p_bu          VARCHAR2,
"
"                                 p_user        VARCHAR2);
"
"
"
"   PROCEDURE proc_valid_prnd_payabl(p_bu          VARCHAR2,
"
"                                    p_user        VARCHAR2,
"
"                                    p_ord_pfx          VARCHAR2,
"
"                                    p_ord_no           VARCHAR2,
"
"                                    p_fetch_line  VARCHAR2,
"
"                                    p_seq_no      NUMBER,
"
"                                    p_trans_curr  VARCHAR2,
"
"                                    p_vou_type      VARCHAR2);
"
"
"
"END;"
/
