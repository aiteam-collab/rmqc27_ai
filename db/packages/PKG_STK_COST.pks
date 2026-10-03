CREATE OR REPLACE
"PACKAGE pkg_stk_cost
"
"AS
"
"
"
"  PROCEDURE proc_upd_cost_frm_stk_trans(p_bu		IN	business_units.bu_id%TYPE,
"
"					p_start_dt	IN	DATE,
"
"                                        p_limit		IN	NUMBER,
"
"                                        p_user		IN	appl_users.appluser_id%TYPE
"
"				       );
"
"
"
"  PROCEDURE proc_upd_mac_frm_std_stk_trans(p_bu		VARCHAR2,
"
"                                           p_store_id	VARCHAR2,
"
"                                           p_prod_id	VARCHAR2,
"
"                                           p_prod_rev	NUMBER,
"
"                                           p_start_dt	DATE,
"
"					   p_end_dt	DATE,
"
"                                           p_limit	NUMBER,
"
"                                           p_user	VARCHAR2
"
"                                          );
"
"
"
"  PROCEDURE proc_upd_mac_frm_sf_stk_trans(p_bu		VARCHAR2,
"
"				          p_store_id	VARCHAR2,
"
"				          p_prod_id	VARCHAR2,
"
"				          p_prod_rev	NUMBER,
"
"				          p_prod_ord_no	VARCHAR2,
"
"				          p_sf_code	VARCHAR2,
"
"					  p_sys_ls_no	VARCHAR2,
"
"				          p_start_dt	DATE,
"
"					  p_end_dt	DATE,
"
"				          p_limit	NUMBER,
"
"			                  p_user	VARCHAR2
"
"				         );
"
"
"
"  PROCEDURE proc_upd_bc_frm_std_stk_trans(p_bu		VARCHAR2,
"
"                                          p_store_id	VARCHAR2,
"
"                                          p_prod_id	VARCHAR2,
"
"                                          p_prod_rev	NUMBER,
"
"                                          p_cost_method	VARCHAR2,
"
"					  p_start_dt	DATE,
"
"                                          p_user	VARCHAR2
"
"                                         );
"
"
"
"  PROCEDURE proc_upd_cost_frm_form(p_bu		VARCHAR2,
"
"                                   p_start_dt	DATE,
"
"                                   p_user	VARCHAR2
"
"				  );
"
"
"
"END pkg_stk_cost;"
/
