CREATE OR REPLACE
"PACKAGE xlsx_writer_arrays
"
"IS
"
"   TYPE t_bill_ac_rec IS RECORD(f_inv_pfx   bill_reg_ln.brln_inv_pfx%TYPE,
"
"                                f_inv_no    bill_reg_ln.brln_inv_no%TYPE,
"
"                                f_acct_desc gl_accts.glac_acct_desc1%TYPE,
"
"                                f_acct_amt  bill_reg_acct.bract_amt%TYPE);
"
"
"
"   TYPE t_bill_ac_amt IS TABLE OF t_bill_ac_rec INDEX BY PLS_INTEGER;
"
"END;"
/
