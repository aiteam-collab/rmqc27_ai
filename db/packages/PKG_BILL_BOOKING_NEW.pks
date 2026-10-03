CREATE OR REPLACE
"PACKAGE pkg_bill_booking_new
"
"AS
"
"   PROCEDURE proc_load_bill_reg_new (
"
"                                  p_bu           bill_reg_hd.brhd_bu%TYPE,
"
"                                  p_doc_no       bill_reg_hd.brhd_doc_no%TYPE,
"
"                                  p_from_date    bill_reg_hd.brhd_date_from%TYPE,
"
"                                  p_to_date      bill_reg_hd.brhd_date_to%TYPE,
"
"                                  p_status       bill_reg_hd.brhd_status%TYPE,
"
"                                  p_type         bill_reg_hd.brhd_acct_type%TYPE,
"
"                                  p_user         appl_users.appluser_id%TYPE);
"
"END pkg_bill_booking_new;"
/
