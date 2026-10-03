CREATE OR REPLACE
"PACKAGE pkg_landed_cost
"
"AS
"
"
"
"  PROCEDURE proc_chk_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			             p_rcpt_pfx		pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			             p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"				    );
"
"
"
"  PROCEDURE proc_load_lc_frm_bill(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			          p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			          p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				  p_user	pur_ord_receipt_hd.porh_cre_by%TYPE
"
"				 );
"
"
"
"  PROCEDURE proc_del_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			             p_rcpt_pfx		pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			             p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			            );
"
"
"
"  PROCEDURE proc_ins_prod_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			                  p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				          p_user	pur_ord_receipt_hd.porh_cre_by%TYPE
"
"			                 );
"
"
"
"  PROCEDURE proc_del_prod_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			                  p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			                 );
"
"END pkg_landed_cost;"
/
