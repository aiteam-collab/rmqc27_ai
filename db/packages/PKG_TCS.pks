CREATE OR REPLACE
"PACKAGE pkg_tcs
"
"AS
"
"
"
"  FUNCTION func_find_tcs_pct(p_bu		VARCHAR2,
"
"                             p_tcs_sec_id	VARCHAR2,
"
"                             p_doc_date		DATE
"
"                            ) RETURN NUMBER;
"
"
"
"  PROCEDURE proc_upd_tcs_amt_frm_po(p_bu		VARCHAR2,
"
"                                    p_ord_pfx		VARCHAR2,
"
"                                    p_ord_no		VARCHAR2,
"
"                                    p_user		VARCHAR2
"
"				   );
"
"
"
"  PROCEDURE proc_del_tcs_amt_frm_po(p_bu		VARCHAR2,
"
"                                    p_ord_pfx		VARCHAR2,
"
"                                    p_ord_no		VARCHAR2,
"
"                                    p_user		VARCHAR2
"
"				   );
"
"
"
"  PROCEDURE proc_upd_tcs_amt_frm_po_amend(p_bu		VARCHAR2,
"
"                                          p_plnt	VARCHAR2,
"
"                                          p_doc_no	VARCHAR2,
"
"                                          p_user	VARCHAR2
"
"				         );
"
"
"
"  PROCEDURE proc_del_tcs_amt_frm_po_amend(p_bu		VARCHAR2,
"
"                                          p_plnt	VARCHAR2,
"
"                                          p_doc_no	VARCHAR2,
"
"                                          p_user	VARCHAR2
"
"				         );
"
"
"
"  PROCEDURE proc_upd_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                     p_rcpt_pfx		VARCHAR2,
"
"                                     p_rcpt_no		VARCHAR2,
"
"                                     p_user		VARCHAR2
"
"				    );
"
"
"
"  PROCEDURE proc_del_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                     p_rcpt_pfx		VARCHAR2,
"
"                                     p_rcpt_no		VARCHAR2,
"
"                                     p_user		VARCHAR2
"
"				    );
"
"
"
"  PROCEDURE proc_recv_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                      p_rcpt_pfx	VARCHAR2,
"
"                                      p_rcpt_no		VARCHAR2,
"
"                                      p_user		VARCHAR2
"
"				     );
"
"
"
"  PROCEDURE proc_can_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                     p_rcpt_pfx		VARCHAR2,
"
"                                     p_rcpt_no		VARCHAR2,
"
"                                     p_user		VARCHAR2
"
"				    );
"
"
"
"END;"
/
