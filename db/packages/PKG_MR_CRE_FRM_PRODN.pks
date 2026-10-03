CREATE OR REPLACE
"PACKAGE pkg_mr_cre_frm_prodn
"
"IS
"
"	PROCEDURE proc_cre_mr_frm_prod_comp(p_bu			VARCHAR2,
"
"										p_date			DATE,
"
"										p_user			VARCHAR2,
"
"										p_res		OUT	VARCHAR2,
"
"										p_queue		OUT	VARCHAR2
"
"										);
"
"
"
"	PROCEDURE proc_upd_ins_proc_qty(
"
"								    p_bu			VARCHAR2,
"
"								    p_plnt			VARCHAR2,
"
"								    p_ord_no		VARCHAR2,
"
"								    p_seq_no		NUMBER,
"
"								    p_oprn_id		VARCHAR2,
"
"								    p_oprn_no		NUMBER,
"
"								    p_sf_code		VARCHAR2,
"
"								    p_out_proc		NUMBER,
"
"								    p_ins_proc		NUMBER,
"
"								    p_comp_qty		NUMBER,
"
"								    p_sel_flag		VARCHAR2,
"
"								    p_lot_no		VARCHAR2,
"
"								    p_ser_no 		VARCHAR2,
"
"								    p_user			VARCHAR2
"
"								    );
"
"
"
"	PROCEDURE proc_cre_mr_eqm_ser_nos(
"
"									  p_bu				VARCHAR2,
"
"									  p_plnt			VARCHAR2,
"
"									  p_date			DATE,
"
"									  p_prod_ord_no		VARCHAR2,
"
"									  p_process_id		VARCHAR2,
"
"									  p_prod_id			VARCHAR2,
"
"									  p_prod_rev		NUMBER,
"
"									  p_sf_code			VARCHAR2,
"
"									  p_ser_no			VARCHAR2,
"
"									  p_sys_ls_no		NUMBER,
"
"									  p_comp_qty		NUMBER,
"
"									  p_so_pfx			VARCHAR2,
"
"									  p_so_no			VARCHAR2,
"
"									  p_so_seq_no		NUMBER,
"
"									  p_so_sub_seq_no	NUMBER,
"
"									  p_so_schld_desc	VARCHAR2,
"
"									  p_user			VARCHAR2,
"
"									  p_lang			NUMBER,
"
"									  p_mr_no		OUT	VARCHAR2,
"
"									  p_comp_res	OUT	VARCHAR2,
"
"									  p_lot_no   VARCHAR2 DEFAULT NULL ,
"
"									  p_process_ln_seq   NUMBER DEFAULT NULL,
"
"                                       p_loc_id  VARCHAR2  DEFAULT  NULL
"
"									  );
"
"
"
"END	pkg_mr_cre_frm_prodn;"
/
