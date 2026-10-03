CREATE OR REPLACE
"PACKAGE pkg_migration_som
"
"AUTHID CURRENT_USER
"
"AS
"
"PROCEDURE proc_ins_sal_inv_mig(p_bu            business_units.bu_id%TYPE,
"
"                               p_doc_no        sales_invoice_mig_hd.simh_doc_no%TYPE,
"
"                               p_fname        sales_invoice_mig_hd.simh_file_name%TYPE,
"
"                               p_sep          VARCHAR2,
"
"                               p_user        sales_invoice_mig_hd.simh_cre_by%TYPE
"
"                              ); -- Sales Invoices
"
"
"
"PROCEDURE proc_ins_si_mig_excep(p_bu        business_units.bu_id%TYPE,
"
"                                p_doc_no    sales_invoice_mig_hd.simh_doc_no%TYPE,
"
"                                p_user        sales_invoice_mig_hd.simh_cre_by%TYPE
"
"                               ); -- Sales Invoices Exception
"
"
"
"END pkg_migration_som;"
/
