CREATE OR REPLACE
"PACKAGE pkg_ot_chrgs
"
"AS
"
"
"
"  PROCEDURE proc_ins_pr_oth_tax_chrgs(p_bu		VARCHAR2,
"
"                                      p_plnt		VARCHAR2,
"
"				      p_rcpt_pfx	VARCHAR2,
"
"                                      p_rcpt_no		VARCHAR2,
"
"				      p_user		VARCHAR2
"
"                                     );
"
"
"
"  PROCEDURE proc_del_pr_oth_tax_chrgs(p_bu		VARCHAR2,
"
"				      p_rcpt_pfx	VARCHAR2,
"
"                                      p_rcpt_no		VARCHAR2
"
"                                     );
"
"
"
"  PROCEDURE proc_ins_po_oth_tax_chrgs(p_bu		VARCHAR2,
"
"				      p_plnt		VARCHAR2,
"
"				      p_ord_no		VARCHAR2,
"
"				      p_user		VARCHAR2
"
"				      );
"
"
"
"  PROCEDURE proc_del_po_oth_tax_chrgs(p_bu		VARCHAR2,
"
"                                      p_ord_no		VARCHAR2
"
"				      );
"
"
"
"END pkg_ot_chrgs;"
/
