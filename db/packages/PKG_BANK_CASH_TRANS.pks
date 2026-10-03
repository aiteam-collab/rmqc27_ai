CREATE OR REPLACE
"PACKAGE pkg_bank_cash_trans
"
"AS
"
"--|----Created By BalaMurali Created On - 25-AUG-2026----|--
"
"    PROCEDURE proc_cre_pending_payables (
"
"       p_bu            IN     business_units.bu_id%TYPE,
"
"       p_doc_type      IN     VARCHAR2,
"
"       p_bank_cash     IN     bank_trans.btrans_bank_id%TYPE,
"
"       p_trans_mode    IN     VARCHAR2 DEFAULT 'P',
"
"       p_pay_type      IN     VARCHAR2,
"
"       p_bs_lvl        IN     VARCHAR2,
"
"       p_trans_date    IN     DATE,
"
"       p_user          IN     appl_users.appluser_id%TYPE,
"
"       p_ord_no           OUT VARCHAR2,
"
"       p_pay_mode      IN     bank_trans.btrans_pay_mode%TYPE DEFAULT 'T',
"
"       p_fetch_line    IN     VARCHAR2 DEFAULT 'A',
"
"       p_dflt_unit     IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc_id   IN     VARCHAR DEFAULT NULL,
"
"       p_pfx_no           OUT VARCHAR2,
"
"       p_plnt          IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc      IN     VARCHAR2 DEFAULT NULL);
"
"    PROCEDURE proc_cre_pending_statoury (
"
"       p_bu            IN     business_units.bu_id%TYPE,
"
"       p_doc_type      IN     VARCHAR2,
"
"       p_bank_cash     IN     bank_trans.btrans_bank_id%TYPE,
"
"       p_trans_mode    IN     VARCHAR2 DEFAULT 'S',
"
"       p_pay_type      IN     VARCHAR2,
"
"       p_bs_lvl        IN     VARCHAR2,
"
"       p_trans_date    IN     DATE,
"
"       p_user          IN     appl_users.appluser_id%TYPE,
"
"       p_ord_no           OUT VARCHAR2,
"
"       p_pay_mode      IN     bank_trans.btrans_pay_mode%TYPE DEFAULT 'T',
"
"       p_fetch_line    IN     VARCHAR2 DEFAULT 'A',
"
"       p_dflt_unit     IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc_id   IN     VARCHAR DEFAULT NULL,
"
"       p_pfx_no           OUT VARCHAR2,
"
"       p_plnt          IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc      IN     VARCHAR2 DEFAULT NULL);
"
"
"
"    PROCEDURE proc_cre_pending_receivables (
"
"       p_bu            IN     business_units.bu_id%TYPE,
"
"       p_doc_type      IN     VARCHAR2,
"
"       p_bank_cash     IN     bank_trans.btrans_bank_id%TYPE,
"
"       p_trans_mode    IN     VARCHAR2 DEFAULT 'R',
"
"       p_pay_type      IN     VARCHAR2,
"
"       p_bs_lvl        IN     VARCHAR2,
"
"       p_trans_date    IN     DATE,
"
"       p_user          IN     appl_users.appluser_id%TYPE,
"
"       p_ord_no           OUT VARCHAR2,
"
"       p_pay_mode      IN     bank_trans.btrans_pay_mode%TYPE DEFAULT 'T',
"
"       p_fetch_line    IN     VARCHAR2 DEFAULT 'A',
"
"       p_dflt_unit     IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc_id   IN     VARCHAR DEFAULT NULL,
"
"       p_pfx_no           OUT VARCHAR2,
"
"       p_plnt          IN     VARCHAR2 DEFAULT NULL,
"
"       p_plnt_loc      IN     VARCHAR2 DEFAULT NULL);
"
"END;"
/
