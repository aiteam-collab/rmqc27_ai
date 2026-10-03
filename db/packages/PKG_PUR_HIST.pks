CREATE OR REPLACE
"PACKAGE pkg_pur_hist
"
"AS
"
"
"
"  PROCEDURE proc_ins_grn_hist(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			      p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			      p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			     );
"
"
"
"  PROCEDURE proc_rev_grn_hist(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			      p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			      p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			     );
"
"
"
"  PROCEDURE proc_ins_po_hist(p_bu		pur_order_hd.poh_bu%TYPE,
"
"			     p_ord_pfx		pur_order_hd.poh_order_pfx%TYPE,
"
"			     p_ord_no		pur_order_hd.poh_order_no%TYPE
"
"			    );
"
"
"
"  PROCEDURE proc_rev_po_hist(p_bu		pur_order_hd.poh_bu%TYPE,
"
"			     p_ord_pfx		pur_order_hd.poh_order_pfx%TYPE,
"
"			     p_ord_no		pur_order_hd.poh_order_no%TYPE
"
"			    );
"
"
"
"  /*PROCEDURE proc_ins_pr_hist(p_bu		pur_req_hd.prh_bu%TYPE,
"
"			     p_rqst_pfx		pur_req_hd.prh_rqst_pfx%TYPE,
"
"			     p_rqst_no		pur_req_hd.prh_rqst_no%TYPE
"
"			    );*/
"
"
"
"END pkg_pur_hist;"
/
