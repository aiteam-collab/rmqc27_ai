CREATE OR REPLACE
"PACKAGE pkg_perpetual_journals
"
"AS
"
"
"
"  FUNCTION func_get_inv_method(p_bu	business_units.bu_id%TYPE)
"
"  RETURN appl_control.applctrl_inv_method%TYPE;
"
"
"
"  PROCEDURE proc_find_store_gl_accts(p_bu		IN	business_units.bu_id%TYPE,
"
"                                     p_plnt		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"				     p_plnt_loc		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"                                     p_benf_type	IN	VARCHAR2,
"
"                                     p_benf_id		IN	VARCHAR2,
"
"                                     p_terr_id		IN	sales_area_terr.sat_terr_id%TYPE,
"
"                                     p_cls_id		IN	products.prod_cls%TYPE,
"
"                                     p_sub_cls_id	IN	products.prod_sub_cls%TYPE,
"
"                                     p_tcf_id		IN	VARCHAR2,
"
"                                     p_acct_plnt	OUT	profit_cost_centers.pcc_ac_plnt%TYPE,
"
"				     p_acct_plnt_loc	OUT	profit_cost_centers.pcc_ac_plnt_loc_id%TYPE,
"
"                                     p_acct_lvl1	OUT	profit_cost_centers.pcc_ac_lvl1%TYPE,
"
"                                     p_acct_lvl2	OUT	profit_cost_centers.pcc_ac_lvl2%TYPE,
"
"                                     p_acct_lvl3	OUT	profit_cost_centers.pcc_ac_lvl3%TYPE,
"
"                                     p_acct_lvl4	OUT	profit_cost_centers.pcc_ac_lvl4%TYPE,
"
"				     p_acct_lvl5	OUT	profit_cost_centers.pcc_ac_lvl5%TYPE,
"
"				     p_acct_lvl6	OUT	profit_cost_centers.pcc_ac_lvl6%TYPE,
"
"                                     p_acct_lvl_prj	OUT	profit_cost_centers.pcc_ac_lvl_prj%TYPE,
"
"				     p_acct_cc_code	OUT	profit_cost_centers.pcc_cc_code%TYPE,
"
"                                     p_acct		OUT	gl_accts.glac_acct%TYPE,
"
"                                     p_acct_inv_type	IN	VARCHAR2 DEFAULT 'I',
"
"				     p_sub_plnt		IN	VARCHAR2 DEFAULT NULL,
"
"				     p_tax_pct		IN	NUMBER		DEFAULT NULL,
"
"				     p_gst_supply	IN	VARCHAR2	DEFAULT 'A',
"
"				     p_gst_type		IN	VARCHAR2	DEFAULT 'L',
"
"				     p_prod_id		IN	VARCHAR2	DEFAULT	NULL,
"
"				     p_prod_rev		IN	VARCHAR2	DEFAULT NULL
"
"                                    );
"
"
"
"  /* **********************************Purchase / Subcontract******************************* */
"
"  PROCEDURE proc_ins_inward_jrnl_frm_grn(p_bu		IN	business_units.bu_id%TYPE,
"
"				         p_plnt		IN	bus_unit_plants.bup_plant_id%TYPE,
"
"				         p_vou_pfx	IN	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				         p_vou_no	IN	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				         p_vou_seq_no	IN	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				         p_user		IN	VARCHAR2,
"
"				         p_lang		NUMBER,
"
"					 p_res		OUT	VARCHAR2
"
"				        );
"
"
"
"  PROCEDURE proc_ins_insp_jrnl_frm_grn(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				       p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				       p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      );
"
"
"
"  PROCEDURE proc_ins_insp_jrnl_frm_tqm(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"				       p_vou_no		tqm_qc_hd.tqhd_qc_no%TYPE,
"
"				       p_vou_rev	tqm_qc_hd.tqhd_qc_rev%TYPE,
"
"				       p_vou_seq_no	tqm_qc_ln.tqln_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      );
"
"
"
"  PROCEDURE proc_ins_rcpt_jrnl_frm_grn(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				       p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				       p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      );
"
"
"
"  PROCEDURE proc_can_insp_jrnl_frm_tqm(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"				       p_vou_no		tqm_qc_hd.tqhd_qc_no%TYPE,
"
"				       p_vou_seq_no	tqm_qc_ln.tqln_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      );
"
"
"
"  PROCEDURE proc_can_insp_jrnl_frm_grn(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				       p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				       p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      );
"
"
"
"  PROCEDURE proc_can_rcpt_jrnl_frm_grn(p_bu		business_units.bu_id%TYPE,
"
"				       p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				       p_vou_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"				       p_vou_no		pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				       p_vou_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"				       p_user		VARCHAR2,
"
"				       p_lang		NUMBER
"
"				      );
"
"
"
"  PROCEDURE proc_ins_inward_jrnl_frm_mr(p_bu			business_units.bu_id%TYPE,
"
"				        p_plnt			bus_unit_plants.bup_plant_id%TYPE,
"
"				        p_vou_no		store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				        p_vou_seq_no		store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				        p_user			VARCHAR2,
"
"				        p_lang			NUMBER,
"
"					p_post_jrnl_flag	VARCHAR2	DEFAULT 'Y'
"
"				       );
"
"
"
"  PROCEDURE proc_ins_insp_jrnl_frm_mr(p_bu		business_units.bu_id%TYPE,
"
"				      p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				      p_vou_no		store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				      p_vou_seq_no	store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				      p_user		VARCHAR2,
"
"				      p_lang		NUMBER
"
"				     );
"
"
"
"  PROCEDURE proc_ins_mr_insp_jrnl_frm_tqm(p_bu		business_units.bu_id%TYPE,
"
"				          p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				       	  p_vou_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"				   	  p_vou_no	tqm_qc_hd.tqhd_qc_no%TYPE,
"
"				   	  p_vou_rev	tqm_qc_hd.tqhd_qc_rev%TYPE,
"
"				   	  p_vou_seq_no	tqm_qc_ln.tqln_seq_no%TYPE,
"
"				   	  p_user	VARCHAR2,
"
"				   	  p_lang	NUMBER
"
"				  	 );
"
"
"
"  PROCEDURE proc_ins_mat_ret_jrnl(p_bu			business_units.bu_id%TYPE,
"
"				  p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				  p_vou_no		store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				  p_vou_seq_no		store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				  p_user		VARCHAR2,
"
"				  p_lang		NUMBER,
"
"				  p_date		DATE DEFAULT SYSDATE
"
"				 );
"
"
"
"  PROCEDURE proc_ins_can_insp_jrnl_frm_mr(p_bu		business_units.bu_id%TYPE,
"
"				          p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				          p_vou_no	store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				          p_vou_seq_no	store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				          p_user	VARCHAR2,
"
"				          p_lang	NUMBER
"
"				         );
"
"
"
"  PROCEDURE proc_recre_insp_jrnl_frm_mr(p_bu		business_units.bu_id%TYPE,
"
"				        p_plnt		bus_unit_plants.bup_plant_id%TYPE,
"
"				        p_vou_no	store_stock_trans_hd.ssthd_doc_no%TYPE,
"
"				        p_vou_seq_no	store_stock_trans_ln.sstln_seq_no%TYPE,
"
"				        p_user		VARCHAR2,
"
"				        p_lang		NUMBER
"
"				       );
"
"
"
"  PROCEDURE proc_ins_stk_cnt_jrnl(p_bu		business_units.bu_id%TYPE,
"
"				  p_plnt	bus_unit_plants.bup_plant_id%TYPE,
"
"				  p_vou_no	stock_count_hd.schd_ord_no%TYPE,
"
"				  p_user	VARCHAR2,
"
"				  p_lang	NUMBER
"
"				 );
"
"
"
"END pkg_perpetual_journals;"
/
