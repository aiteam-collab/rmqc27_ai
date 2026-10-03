CREATE OR REPLACE
"PACKAGE pkg_Journal_vou_trans
"
"AS
"
"
"
"    PROCEDURE proc_cre_pending_payable_mn_jv (
"
"        p_bu              IN     business_units.bu_id%TYPE,
"
"        p_doc_type        IN     VARCHAR2,                      --- JT - Jrnl vouch
"
"        p_plnt            IN     bank_trans.btrans_plant%TYPE,               --Unit
"
"        p_trans_mode      IN     VARCHAR2,        --- P - Payables, R - Receivables
"
"        p_bs_lvl          IN     VARCHAR2,                 --- E - Entity, U - Unit
"
"        p_trans_date      IN     DATE,
"
"        p_user            IN     appl_users.appluser_id%TYPE,
"
"        p_jv_pfx          IN     VARCHAR2,
"
"        p_plnt_loc_id     IN     VARCHAR2,
"
"        p_base_cur_flag      OUT NUMBER,
"
"        p_oth_cur_flag       OUT NUMBER,
"
"        p_ord_no             OUT VARCHAR2);
"
"END pkg_Journal_vou_trans;"
/
