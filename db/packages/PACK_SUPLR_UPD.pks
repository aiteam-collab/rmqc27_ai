CREATE OR REPLACE
"PACKAGE        pack_suplr_upd
"
"AS
"
"  PROCEDURE proc_ins_upd_addr(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_loc (p_bu         VARCHAR2,
"
"                               p_party_type VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"   PROCEDURE proc_ins_upd_gl_grp (p_bu         VARCHAR2,
"
"                                 p_suplr_id   VARCHAR,
"
"                                 p_user       VARCHAR2,
"
"                                 p_party_type VARCHAR2,
"
"                                 p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_gl_acct(p_bu         VARCHAR2,
"
"                                 p_suplr_id   VARCHAR,
"
"                                 p_user       VARCHAR2,
"
"                                 p_party_type VARCHAR2,
"
"                                 p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_curr(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_bnk_acct(p_bu         VARCHAR2,
"
"                                  p_suplr_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_party_type VARCHAR2,
"
"                                  p_upd_type   VARCHAR2);
"
"  PROCEDURE proc_ins_upd_contact (p_bu         VARCHAR2,
"
"                                  p_suplr_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_party_type VARCHAR2,
"
"                                  p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_others  (p_bu         VARCHAR2,
"
"                                  p_suplr_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_party_type VARCHAR2,
"
"                                  p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_msme(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"   PROCEDURE proc_ins_upd_credit(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"    PROCEDURE proc_ins_upd_ITR(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_upd_unit(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"   PROCEDURE proc_ins_upd_unit_loc(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"      PROCEDURE proc_ins_upd_T_C (p_bu         VARCHAR2,
"
"                               p_party_type VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"PROCEDURE proc_ins_suplr_edit_temp(p_bu          VARCHAR2,
"
"                                     p_suplr_id    VARCHAR2,
"
"                                     p_doc_no      VARCHAR2,
"
"                                     p_user        VARCHAR2,
"
"                                     p_lang        VARCHAR2,
"
"                                     p_user_sid    NUMBER,
"
"                                     p_particular  VARCHAR2,
"
"                                     p_select      VARCHAR2,
"
"                                     p_unit        VARCHAR2);
"
"  PROCEDURE proc_upd_is_vaid(p_bu         VARCHAR2,
"
"                             p_suplr_id   VARCHAR2,
"
"                             p_user       VARCHAR2,
"
"                             p_session    VARCHAR2,
"
"                             p_upd_type   VARCHAR2,
"
"                             p_party_type VARCHAR2,
"
"                             p_search     VARCHAR2,
"
"                             p_doc_no OUT VARCHAR2);
"
"
"
"    PROCEDURE proc_ins_upd_stat_athu(p_bu         VARCHAR2,
"
"                                      p_suplr_id   VARCHAR,
"
"                                      p_user       VARCHAR2,
"
"                                      p_party_type VARCHAR2,
"
"                                      p_upd_type   VARCHAR2);
"
"
"
"    PROCEDURE proc_ins_upd_esi (p_bu         VARCHAR2,
"
"                               p_party_type VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"    PROCEDURE proc_ins_upd_tds (p_bu         VARCHAR2,
"
"                               p_party_type VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2);
"
"
"
"END pack_suplr_upd;"
/
