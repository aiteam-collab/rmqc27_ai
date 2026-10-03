CREATE OR REPLACE
"PACKAGE pkg_inv_aging
"
"AS
"
"
"
"PROCEDURE proc_ins_inv_aging(p_bu		IN	VARCHAR2,
"
"			     p_doc_no		IN	VARCHAR2,
"
"			     p_date		IN	DATE,
"
"			     p_user		IN	VARCHAR2
"
"			    );
"
"
"
"PROCEDURE proc_ins_batch_inv_aging(p_bu		IN	VARCHAR2,
"
"			           p_doc_no	IN	VARCHAR2,
"
"			           p_date	IN	DATE,
"
"			           p_user	IN	VARCHAR2
"
"			          );
"
"
"
"PROCEDURE proc_ins_so_inv_aging(p_bu		IN	VARCHAR2,
"
"			        p_doc_no	IN	VARCHAR2,
"
"			        p_date		IN	DATE,
"
"			        p_user		IN	VARCHAR2
"
"			       );
"
"
"
"PROCEDURE proc_ins_ls_inv_aging(p_bu		IN	VARCHAR2,
"
"			        p_doc_no	IN	VARCHAR2,
"
"			        p_date		IN	DATE,
"
"			        p_user		IN	VARCHAR2
"
"			       );
"
"
"
"/*PROCEDURE proc_ins_fsn_analy(p_bu		IN	VARCHAR2,
"
"			     p_doc_no		IN	VARCHAR2,
"
"			     p_date		IN	DATE,
"
"			     p_user		IN	VARCHAR2
"
"			    );*/
"
"
"
"END pkg_inv_aging;"
/
