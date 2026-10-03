CREATE OR REPLACE
"PACKAGE pkg_stk
"
"AS
"
"  PROCEDURE proc_gen_stk_stmt(p_bu	VARCHAR2,
"
"			      p_fr_date	DATE,
"
"			      p_to_date	DATE,
"
"			      p_user	VARCHAR2
"
"			     );
"
"
"
"  PROCEDURE proc_gen_stk_stmt1(p_bu		VARCHAR2,
"
"                               p_plnt		VARCHAR2,
"
"			       p_fr_date	DATE,
"
"			       p_to_date	DATE,
"
"			       p_user		VARCHAR2
"
"			      );
"
"
"
"  PROCEDURE proc_gen_stk_ledger(p_bu		VARCHAR2,
"
"                                p_plnt		VARCHAR2,
"
"                                p_store_id	VARCHAR2,
"
"                                p_prod_id	VARCHAR2,
"
"                                p_prod_rev	NUMBER,
"
"                                p_cls_id	VARCHAR2,
"
"                                p_subcls_id	VARCHAR2,
"
"                                p_date_from	DATE,
"
"                                p_date_to	DATE,
"
"                                p_mat_type	VARCHAR2,
"
"                                p_user		VARCHAR2
"
"			       );
"
"
"
"  PROCEDURE proc_gen_stmt_frm_stk_jrnl(p_bu		VARCHAR2,
"
"			               p_plnt		VARCHAR2,
"
"			               p_gl_acct	VARCHAR2,
"
"                                       p_date_from	DATE,
"
"                                       p_date_to	DATE,
"
"                                       p_user		VARCHAR2,
"
"				       p_user_emp	VARCHAR2
"
"			              );
"
"
"
"  PROCEDURE proc_gen_doc_stmt_frm_stk_jrnl(p_bu		VARCHAR2,
"
"			                   p_plnt	VARCHAR2,
"
"			                   p_gl_acct	VARCHAR2,
"
"                                           p_date_from	DATE,
"
"                                           p_date_to	DATE,
"
"                                           p_user	VARCHAR2,
"
"					   p_user_emp	VARCHAR2
"
"			                  );
"
"
"
"END pkg_stk;"
/
