CREATE OR REPLACE
"PACKAGE pkg_rfq
"
"AS
"
"  PROCEDURE proc_ins_rfq_suplr(p_bu		rfq_hd.rfqhd_bu%TYPE,
"
"			       p_rfq_pfx	rfq_hd.rfqhd_rfq_pfx%TYPE,
"
"			       p_rfq_no		rfq_hd.rfqhd_rfq_no%TYPE,
"
"			       p_user		rfq_hd.rfqhd_cre_by%TYPE
"
"			      );
"
"
"
"  PROCEDURE proc_can_rfq_frm_pq(p_bu		pur_qtn_hd.pqhd_bu%TYPE,
"
"			        p_quote_pfx	pur_qtn_hd.pqhd_quote_pfx%TYPE,
"
"			        p_quote_no	pur_qtn_hd.pqhd_quote_no%TYPE,
"
"				p_seq_no	pur_qtn_ln.pqln_seq_no%TYPE,
"
"				p_user		pur_qtn_ln.pqln_cre_by%TYPE
"
"			       );
"
"END pkg_rfq;"
/
