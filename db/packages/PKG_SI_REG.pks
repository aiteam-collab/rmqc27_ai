CREATE OR REPLACE
"PACKAGE pkg_si_reg
"
"AS
"
"PROCEDURE proc_ins_si_type (p_bu    VARCHAR2,
"
"                            p_doc_no    VARCHAR2,
"
"                            p_from_date    DATE,
"
"                            p_to_date    DATE,
"
"                            p_user    VARCHAR2,
"
"                            p_lang    NUMBER,
"
"                            p_shw_can_doc VARCHAR2    DEFAULT 'N');
"
"
"
"PROCEDURE proc_ins_si_plnt (p_bu    VARCHAR2,
"
"                            p_doc_no    VARCHAR2,
"
"                            p_from_date    DATE,
"
"                            p_to_date    DATE,
"
"                            p_user    VARCHAR2,
"
"                            p_lang    NUMBER,
"
"                            p_shw_can_doc VARCHAR2    DEFAULT 'N');
"
"
"
"PROCEDURE proc_gen_si_reg (p_bu        VARCHAR2,
"
"                           p_doc_no    VARCHAR2,
"
"                           p_from_date    DATE,
"
"                           p_to_date    DATE,
"
"                           p_user    VARCHAR2,
"
"                           p_lang    NUMBER,
"
"                           p_shw_can_doc VARCHAR2    DEFAULT 'N');
"
"
"
"PROCEDURE proc_ins_dn_cn_type (p_bu    VARCHAR2,
"
"                            p_doc_no    VARCHAR2,
"
"                            p_vou_type       VARCHAR2,
"
"                            p_from_date    DATE,
"
"                            p_to_date    DATE,
"
"                            p_user    VARCHAR2,
"
"                            p_lang    NUMBER,
"
"                            p_shw_can_doc VARCHAR2    DEFAULT 'N');
"
"
"
"PROCEDURE proc_ins_dn_cn_plnt (p_bu    VARCHAR2,
"
"                            p_doc_no    VARCHAR2,
"
"                            p_vou_type       VARCHAR2,
"
"                            p_from_date    DATE,
"
"                            p_to_date    DATE,
"
"                            p_user    VARCHAR2,
"
"                            p_lang    NUMBER,
"
"                            p_shw_can_doc VARCHAR2    DEFAULT 'N');
"
"
"
"PROCEDURE proc_gen_dn_cn_reg (p_bu        VARCHAR2,
"
"                           p_doc_no    VARCHAR2,
"
"                           p_vou_type       VARCHAR2,
"
"                           p_from_date    DATE,
"
"                           p_to_date    DATE,
"
"                           p_user    VARCHAR2,
"
"                           p_lang    NUMBER,
"
"                           p_shw_can_doc VARCHAR2    DEFAULT 'N');
"
"
"
"END pkg_si_reg;"
/
