CREATE OR REPLACE
"PACKAGE        pack_bank_upd
"
"AS
"
"  PROCEDURE proc_ins_upd_addr(p_bu         VARCHAR2,
"
"                              p_bank_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_contact (p_bu         VARCHAR2,
"
"                                  p_bank_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_upd_type   VARCHAR2);
"
"
"
"   PROCEDURE proc_ins_upd_Prefix (p_bu         VARCHAR2,
"
"                                  p_bank_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_gl_acct(p_bu         VARCHAR2,
"
"                                 p_bank_id   VARCHAR,
"
"                                 p_user       VARCHAR2,
"
"                                 p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_Credit_Limit (p_bu         VARCHAR2,
"
"                                  p_bank_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_upd_type   VARCHAR2);
"
"
"
" PROCEDURE proc_ins_upd_CHEQ (p_bu         VARCHAR2,
"
"                                  p_bank_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_upd_type   VARCHAR2);
"
"
"
" PROCEDURE proc_ins_bank_edit_temp(p_bu          VARCHAR2,
"
"                                   p_bank_id    VARCHAR2,
"
"                                   p_doc_no      VARCHAR2,
"
"                                   p_user        VARCHAR2,
"
"                                   p_lang        VARCHAR2,
"
"                                   p_user_sid    NUMBER,
"
"                                   p_particular  VARCHAR2,
"
"                                   p_select      VARCHAR2,
"
"                                   p_unit        VARCHAR2);
"
"
"
"  PROCEDURE proc_upd_is_vaid(p_bu         VARCHAR2,
"
"                             p_BANK_id   VARCHAR2,
"
"                             p_user       VARCHAR2,
"
"                             p_session    VARCHAR2,
"
"                             p_upd_type   VARCHAR2,
"
"                             p_search     VARCHAR2,
"
"                             p_doc_no OUT VARCHAR2);
"
"
"
"END pack_bank_upd;"
/
