CREATE OR REPLACE
"PACKAGE pkg_apex_shft_wise_completion
"
"AS
"
"  PROCEDURE proc_apex_check_validation    (p_bu                    VARCHAR2,
"
"                                          p_plnt                VARCHAR2,
"
"                                          p_ord_no                VARCHAR2,
"
"                                          p_seq_no                VARCHAR2,
"
"                                          p_move_type            VARCHAR2,
"
"                                          p_oprn_id            VARCHAR2,
"
"                                          p_shift_id    OUT        VARCHAR2,
"
"                                          p_user                VARCHAR2
"
"                                         );
"
"  PROCEDURE proc_apex_cre_shft_wise_comp (p_bu                    VARCHAR2,
"
"                                          p_plnt                VARCHAR2,
"
"                                          p_ord_no                VARCHAR2,
"
"                                          p_oprn_id                VARCHAR2,
"
"                                          p_oprn_ln_seq            VARCHAR2,
"
"                                          p_shift_id            VARCHAR2,
"
"                                          p_date                DATE,
"
"                                          p_suprv_id            VARCHAR2,
"
"                                          p_casting_flag        VARCHAR2,
"
"                                          p_user                VARCHAR2,
"
"                                          p_shft_doc_no    OUT            VARCHAR2
"
"                                         );
"
"END pkg_apex_shft_wise_completion;"
/
