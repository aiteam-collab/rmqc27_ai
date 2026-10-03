CREATE OR REPLACE
"PACKAGE pkg_cost_estimation
"
"AS
"
"  PROCEDURE proc_ins_mat_cost_frm_bom(p_bu		VARCHAR2,
"
"                                      p_plnt		VARCHAR2,
"
"				      p_doc_no		VARCHAR2,
"
"				      p_par_prod_id	VARCHAR2,
"
"				      p_par_prod_rev	NUMBER,
"
"				      p_trans_qty	NUMBER,
"
"				      p_bom_lvl		VARCHAR2,
"
"				      p_udp_flag	VARCHAR2,
"
"				      p_fgp_flag	VARCHAR2,
"
"				      p_pur_flag	VARCHAR2,
"
"				      p_pur_price_basis	VARCHAR2,
"
"				      p_user		VARCHAR2
"
"				     );
"
"END pkg_cost_estimation;"
/
