CREATE OR REPLACE
"PACKAGE pkg_rework_serial_comp_ln
"
"AS
"
"    /*PROCEDURE proc_cre_rework_frm_rej_ln(p_bu                VARCHAR2,
"
"                                      p_doc_date        DATE,
"
"                                      p_user            VARCHAR2,
"
"                                      p_rwo_res        OUT    VARCHAR2,
"
"                                      p_rwc_res        OUT    VARCHAR2,
"
"                                      p_check        OUT    VARCHAR2
"
"                                      );
"
"    PROCEDURE proc_cre_rework_frm_line_rej_ln(p_bu                VARCHAR2,
"
"                                      p_doc_date        DATE,
"
"                                      p_user            VARCHAR2,
"
"                                      p_rwo_res        OUT    VARCHAR2,
"
"                                      p_rwc_res        OUT    VARCHAR2,
"
"                                      p_check        OUT    VARCHAR2
"
"                                      );
"
"                                       */
"
"
"
"    PROCEDURE proc_cre_ser_rwk_comp_rec_ln(p_bu             VARCHAR2,
"
"                                        p_doc_no        VARCHAR2,
"
"                                        p_doc_date        DATE,
"
"                                        p_user           VARCHAR2,
"
"                                        p_res       OUT    VARCHAR2,
"
"                                        p_result    OUT    VARCHAR2,
"
"                                        p_check        OUT VARCHAR
"
"                                        );
"
"END pkg_rework_serial_comp_ln;"
/
