CREATE OR REPLACE
"PACKAGE pkg_pur_rcpt
"
"AS
"
"
"
"  PROCEDURE proc_valid_frm_pur_rcpt(p_bu	pur_ord_receipt_hd.porh_bu%TYPE,
"
"	                            p_plnt	pur_ord_receipt_hd.porh_plnt%TYPE,
"
"	                            p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                                    p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				    p_user	pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                                   );
"
"
"
"  PROCEDURE proc_can_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                              p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"			      p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"			      p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			     );
"
"
"
"  PROCEDURE proc_corr_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                               p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"			       p_rcpt_no	pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"			       p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			      );
"
"
"
"  PROCEDURE proc_upd_grn_lm_disc_amt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                                     p_rcpt_pfx		VARCHAR2 DEFAULT NULL,
"
"			             p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"			             p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			            );
"
"
"
"  PROCEDURE proc_corr_qc_frm_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                                      p_plnt		pur_ord_receipt_ln.porl_plnt%TYPE,
"
"				      p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"			              p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"				      p_rcpt_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"			              p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			             );
"
"
"
"  PROCEDURE proc_gen_coil_frm_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"				       p_plnt		pur_ord_receipt_ln.porl_plnt%TYPE,
"
"				       p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"                                       p_rcpt_no	pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"				       p_prod_id	pur_ord_receipt_ln.porl_prod_id%TYPE,
"
"				       p_prod_rev	pur_ord_receipt_ln.porl_prod_rev%TYPE,
"
"				       p_heat_no	pur_receipt_lot.prlt_heat_no%TYPE,
"
"				       p_test_no	pur_receipt_lot.prlt_test_no%TYPE,
"
"				       p_lot_no		pur_receipt_lot.prlt_lot_no%TYPE,
"
"				       p_coil_no	pur_receipt_lot.prlt_coil_no%TYPE,
"
"				       p_ls_qty		pur_receipt_lot.prlt_lot_qty%TYPE,
"
"				       p_no_of_coil	pur_receipt_lot.prlt_no_of_bale%TYPE,
"
"                                       p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"				      );
"
"
"
"END pkg_pur_rcpt;"
/
