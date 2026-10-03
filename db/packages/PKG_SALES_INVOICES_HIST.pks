CREATE OR REPLACE
"PACKAGE pkg_sales_invoices_hist
"
"AS
"
"
"
"        PROCEDURE proc_ins_sal_inv_hist(p_bu		sales_invoices_hd.sihd_bu%TYPE,
"
"  					p_plnt		sales_invoices_hd.sihd_plant%TYPE,
"
"  					p_doc_no	sales_invoices_hd.sihd_doc_no%TYPE
"
"  				       );
"
"
"
"        PROCEDURE proc_del_sal_inv_hist(p_bu		sales_invoices_hd.sihd_bu%TYPE,
"
"  					p_plnt		sales_invoices_hd.sihd_plant%TYPE,
"
"  					p_doc_no	sales_invoices_hd.sihd_doc_no%TYPE
"
"  				       );
"
"END pkg_sales_invoices_hist;"
/
