CREATE OR REPLACE
"PACKAGE BODY pkg_pur_hist
"
"AS
"
"  PROCEDURE proc_ins_grn_hist(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			      p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			      p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			     )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO pur_ord_receipt_hd_hist(porhh_bu,
"
"                                        porhh_receipt_pfx,
"
"                                        porhh_receipt_no,
"
"                                        porhh_mode,
"
"                                        porhh_suplr_id,
"
"                                        porhh_receipt_type,
"
"                                        porhh_order_pfx,
"
"                                        porhh_order_no,
"
"                                        porhh_receipt_date,
"
"                                        porhh_year,
"
"                                        porhh_period,
"
"                                        porhh_currency,
"
"                                        porhh_exchange_rate,
"
"                                        porhh_status,
"
"                                        porhh_dc_no,
"
"                                        porhh_dc_date,
"
"                                        porhh_inv_pfx,
"
"                                        porhh_inv_no,
"
"                                        porhh_inv_flag,
"
"                                        porhh_inv_date,
"
"                                        porhh_tax_flag,
"
"                                        porhh_suplr_doc_date,
"
"                                        porhh_suplr_doc_no,
"
"                                        porhh_grn_date,
"
"                                        porhh_type,
"
"                                        porhh_gp_flag,
"
"                                        porhh_gp_date,
"
"                                        porhh_gate_doc_no,
"
"                                        porhh_ge_chk_flag,
"
"                                        porhh_lc_chk_flag,
"
"                                        porhh_lc_chk_acc_flag,
"
"                                        porhh_alloc_flag,
"
"                                        porhh_plnt,
"
"                                        porhh_user,
"
"                                        porhh_inspn_flag,
"
"                                        porhh_cre_by,
"
"					porhh_cre_emp_id,
"
"					porhh_cre_ip_addr,
"
"					porhh_cre_os_user,
"
"                                        porhh_cre_date,
"
"                                        porhh_upd_by,
"
"					porhh_upd_emp_id,
"
"					porhh_upd_ip_addr,
"
"					porhh_upd_os_user,
"
"                                        porhh_upd_date,
"
"                                        porhh_grn_type,
"
"                                        porhh_shipvia_id,
"
"                                        porhh_term_id,
"
"                                        porhh_price_term,
"
"                                        porhh_lcg_doc_type,
"
"                                        porhh_lcg_base_flag,
"
"                                        porhh_grn_source,
"
"                                        porhh_ref_unit,
"
"                                        porhh_jrnl_flag,
"
"                                        porhh_indir_mvmt_flag,
"
"                                        porhh_bol_date,
"
"                                        porhh_fin_status,
"
"                                        porhh_terr_id,
"
"                                        porhh_ins_pay_flag,
"
"                                        porhh_dc_cre_flag,
"
"                                        porhh_dc_cre_user,
"
"                                        porhh_out_dc_no,
"
"                                        porhh_trans_no,
"
"                                        porhh_narr1,
"
"                                        porhh_so_ref,
"
"                                        porhh_mov_to_fin_date,
"
"                                        porhh_wvd_flag,
"
"                                        porhh_rev_flag,
"
"                                        porhh_suplr_edc_date,
"
"                                        porhh_transp_id,
"
"                                        porhh_suplr_bill_qty,
"
"                                        porhh_diff_wvd_qty,
"
"                                        porhh_allwd_wvd_qty,
"
"                                        porhh_shrt_wvd_qty,
"
"                                        porhh_frt_scope,
"
"                                        porhh_frt_act,
"
"                                        porhh_trns_suplr_id,
"
"                                        porhh_trns_edd,
"
"                                        porhh_delay_dm_flag,
"
"                                        porhh_delay_dm_doc_pfx,
"
"                                        porhh_delay_dm_doc_no,
"
"                                        porhh_ar3a_no,
"
"                                        porhh_jrnl_wn_ent_req_flag,
"
"                                        porhh_rg23_type,
"
"                                        porhh_veh_no,
"
"                                        porhh_rcpt_rev_flag,
"
"                                        porhh_gk_name,
"
"                                        porhh_trip_sheet_no,
"
"                                        porhh_sample_fin_rqrd_flag,
"
"                                        porhh_corp_ord_type,
"
"                                        porhh_driver_mob_no,
"
"                                        porhh_driver_name,
"
"                                        porhh_fin_flag,
"
"                                        porhh_rnd_off,
"
"                                        porhh_veh_in,
"
"                                        porhh_for_type,
"
"                                        porhh_pack_list_no,
"
"                                        porhh_pack_list_date,
"
"                                        porhh_weigh_bridge_wt,
"
"                                        porhh_sc_proc_flag,
"
"                                        porhh_gst_flag,
"
"                                        porhh_net_wgt,
"
"                                        porhh_gross_wgt,
"
"                                        porhh_tare_wgt,
"
"                                        porhh_clearn_bill_no,
"
"                                        porhh_clearn_bill_date,
"
"                                        porhh_trip_sht_no,
"
"                                        porhh_trip_date,
"
"                                        porhh_no_bundle,
"
"                                        porhh_press_mark_no,
"
"                                        porhh_press_run_no1_from,
"
"                                        porhh_press_run_no1_to,
"
"                                        porhh_press_run_no2_from,
"
"                                        porhh_press_run_no2_to,
"
"                                        porhh_courier_name,
"
"                                        porhh_courier_docket_no,
"
"                                        porhh_wb_ser_date,
"
"                                        porhh_lr_no,
"
"                                        porhh_wb_ser_no,
"
"                                        porhh_spn_frght_amt,
"
"                                        porhh_spn_frght_vou_pfx,
"
"                                        porhh_spn_frght_vou_no,
"
"                                        porhh_spn_frght_sel_flag,
"
"                                        porhh_spn_frght_sel_user,
"
"					porhh_gst_type,
"
"					porhh_gstn_no,
"
"					porhh_inv_pack_list_no,
"
"					porhh_insurance_no,
"
"					porhh_engine_no,
"
"					porhh_chassis_no,
"
"					porhh_vessel_no,
"
"					porhh_bol_no,
"
"					porhh_lm_disc_amt,
"
"					porhh_rej_exists_flag,
"
"					porhh_rej_rtn_flag,
"
"					porhh_ewb_trnsp_mode,
"
"					porhh_ewb_trnsp_id,
"
"					porhh_ewb_trnsp_name,
"
"					porhh_ewb_trnsp_doc_date,
"
"					porhh_ewb_dist_km,
"
"					porhh_ewb_bill_no,
"
"					porhh_load_lc_flag,
"
"					porhh_lc_exmpt_flag,
"
"					porhh_memo_no,
"
"					porhh_memo_date,
"
"					porhh_memo_name,
"
"					porhh_veh_name,
"
"					porhh_veh_id,
"
"					porhh_brch_rcpt_flag,
"
"					porhh_plnt_loc_id,
"
"					porhh_tot_rcpt_amt,
"
"					porhh_lc_apport_basis,
"
"					porhh_rr_flag,
"
"					porhh_rr_no,
"
"					porhh_wf_status,
"
"					porhh_tolr_flag,
"
"					porhh_dflt_pay_thru,
"
"					porhh_adv_lic1_doc_no,
"
"					porhh_adv_lic1_adj_qty,
"
"					porhh_adv_lic1_adj_amt,
"
"					porhh_adv_lic2_doc_no,
"
"					porhh_adv_lic2_adj_qty,
"
"					porhh_adv_lic2_adj_amt,
"
"					porhh_lc_tax_set_id,
"
"					porhh_lc_inc_tax_flag,
"
"					porhh_custom_val,
"
"					porhh_vat_class,
"
"					porhh_vat_type,
"
"					porhh_pin_no,
"
"					porhh_rebate_dbn_flag,
"
"					porhh_qlty_incharge,
"
"					porhh_qlty_compl_date,
"
"					porhh_vou_pfx,
"
"                                        porhh_vou_no,
"
"                                        porhh_spn_brkr_comm_basis,
"
"                                        porhh_spn_brkr_comm_amt,
"
"                                        porhh_spn_brkr_comm_payble,
"
"                                        porhh_dflt_inv_pfx,
"
"                                        porhh_cr_avl_flag,
"
"                                        porhh_cr_avl_no,
"
"                                        porhh_cr_avl_date,
"
"                                        porhh_cr_avl_status,
"
"					porhh_import_flag,
"
"					porhh_vertical_type,
"
"					porhh_src_bus_fun,
"
"					porhh_cancel_reason,
"
"					porhh_cv_ins_pct,
"
"					porhh_form_a,
"
"					porhh_pre_appr_status,
"
"					porhh_form_27c,
"
"					porhh_doc_trans_ref_no,
"
"					porhh_proj_id,
"
"					porhh_tcs_amt,
"
"					porhh_org_cpy_flag,
"
"					porhh_shipto_type ,
"
"					porhh_cust_id    ,
"
"					porhh_gst_clf_type,
"
"					porhh_plnt_loc_name,
"
"					porhh_csr_doc_no,
"
"					porhh_shipto_loc_name,
"
"					porhh_billto_loc_name,
"
"					porhh_shipfr_loc_name,
"
"					porhh_billfr_loc_name,
"
"					porhh_appr_by,
"
"					porhh_appr_emp_id,
"
"					porhh_appr_ip_addr,
"
"					porhh_appr_os_user,
"
"					porhh_appr_date,
"
"					porhh_billfr_clf_type,
"
"					porhh_chrg_apport_basis,
"
"					porhh_billto_gst_type,
"
"					porhh_ewb_bill_date
"
"				       )
"
"    SELECT porh_bu,
"
"	   porh_receipt_pfx,
"
"	   porh_receipt_no,
"
"	   porh_mode,
"
"	   porh_suplr_id,
"
"	   porh_receipt_type,
"
"	   porh_order_pfx,
"
"	   porh_order_no,
"
"	   porh_receipt_date,
"
"	   porh_year,
"
"	   porh_period,
"
"	   porh_currency,
"
"	   porh_exchange_rate,
"
"	   porh_status,
"
"	   porh_dc_no,
"
"	   porh_dc_date,
"
"	   porh_inv_pfx,
"
"	   porh_inv_no,
"
"	   porh_inv_flag,
"
"	   porh_inv_date,
"
"	   porh_tax_flag,
"
"	   porh_suplr_doc_date,
"
"	   porh_suplr_doc_no,
"
"	   porh_grn_date,
"
"	   porh_type,
"
"	   porh_gp_flag,
"
"	   porh_gp_date,
"
"	   porh_gate_doc_no,
"
"	   porh_ge_chk_flag,
"
"	   porh_lc_chk_flag,
"
"	   porh_lc_chk_acc_flag,
"
"	   porh_alloc_flag,
"
"	   porh_plnt,
"
"	   porh_user,
"
"	   porh_inspn_flag,
"
"	   porh_cre_by,
"
"	   porh_cre_emp_id,
"
"	   porh_cre_ip_addr,
"
"	   porh_cre_os_user,
"
"	   porh_cre_date,
"
"	   porh_upd_by,
"
"	   porh_upd_emp_id,
"
"	   porh_upd_ip_addr,
"
"	   porh_upd_os_user,
"
"	   porh_upd_date,
"
"	   porh_grn_type,
"
"	   porh_shipvia_id,
"
"	   porh_term_id,
"
"	   porh_price_term,
"
"	   porh_lcg_doc_type,
"
"	   porh_lcg_base_flag,
"
"	   porh_grn_source,
"
"	   porh_ref_unit,
"
"	   porh_jrnl_flag,
"
"	   porh_indir_mvmt_flag,
"
"	   porh_bol_date,
"
"	   porh_fin_status,
"
"	   porh_terr_id,
"
"	   porh_ins_pay_flag,
"
"	   porh_dc_cre_flag,
"
"	   porh_dc_cre_user,
"
"	   porh_out_dc_no,
"
"	   porh_trans_no,
"
"	   porh_narr1,
"
"	   porh_so_ref,
"
"	   porh_mov_to_fin_date,
"
"	   porh_wvd_flag,
"
"	   porh_rev_flag,
"
"	   porh_suplr_edc_date,
"
"	   porh_transp_id,
"
"	   porh_suplr_bill_qty,
"
"	   porh_diff_wvd_qty,
"
"	   porh_allwd_wvd_qty,
"
"	   porh_shrt_wvd_qty,
"
"	   porh_frt_scope,
"
"	   porh_frt_act,
"
"	   porh_trns_suplr_id,
"
"	   porh_trns_edd,
"
"	   porh_delay_dm_flag,
"
"	   porh_delay_dm_doc_pfx,
"
"	   porh_delay_dm_doc_no,
"
"	   porh_ar3a_no,
"
"	   porh_jrnl_wn_ent_req_flag,
"
"	   porh_rg23_type,
"
"	   porh_veh_no,
"
"	   porh_rcpt_rev_flag,
"
"	   porh_gk_name,
"
"	   porh_trip_sheet_no,
"
"	   porh_sample_fin_rqrd_flag,
"
"	   porh_corp_ord_type,
"
"	   porh_driver_mob_no,
"
"	   porh_driver_name,
"
"	   porh_fin_flag,
"
"	   porh_rnd_off,
"
"	   porh_veh_in,
"
"	   porh_for_type,
"
"	   porh_pack_list_no,
"
"	   porh_pack_list_date,
"
"	   porh_weigh_bridge_wt,
"
"	   porh_sc_proc_flag,
"
"	   porh_gst_flag,
"
"	   porh_net_wgt,
"
"	   porh_gross_wgt,
"
"	   porh_tare_wgt,
"
"	   porh_clearn_bill_no,
"
"	   porh_clearn_bill_date,
"
"	   porh_trip_sht_no,
"
"	   porh_trip_date,
"
"	   porh_no_bundle,
"
"	   porh_press_mark_no,
"
"	   porh_press_run_no1_from,
"
"	   porh_press_run_no1_to,
"
"	   porh_press_run_no2_from,
"
"	   porh_press_run_no2_to,
"
"	   porh_courier_name,
"
"	   porh_courier_docket_no,
"
"	   porh_wb_ser_date,
"
"	   porh_lr_no,
"
"	   porh_wb_ser_no,
"
"	   porh_spn_frght_amt,
"
"	   porh_spn_frght_vou_pfx,
"
"	   porh_spn_frght_vou_no,
"
"	   porh_spn_frght_sel_flag,
"
"	   porh_spn_frght_sel_user,
"
"	   porh_gst_type,
"
"	   porh_gstn_no,
"
"	   porh_inv_pack_list_no,
"
"	   porh_insurance_no,
"
"	   porh_engine_no,
"
"	   porh_chassis_no,
"
"	   porh_vessel_no,
"
"	   porh_bol_no,
"
"	   porh_lm_disc_amt,
"
"	   porh_rej_exists_flag,
"
"	   porh_rej_rtn_flag,
"
"	   porh_ewb_trnsp_mode,
"
"	   porh_ewb_trnsp_id,
"
"	   porh_ewb_trnsp_name,
"
"	   porh_ewb_trnsp_doc_date,
"
"	   porh_ewb_dist_km,
"
"	   porh_ewb_bill_no,
"
"	   porh_load_lc_flag,
"
"	   porh_lc_exmpt_flag,
"
"	   porh_memo_no,
"
"	   porh_memo_date,
"
"	   porh_memo_name,
"
"	   porh_veh_name,
"
"	   porh_veh_id,
"
"	   porh_brch_rcpt_flag,
"
"	   porh_plnt_loc_id,
"
"	   porh_tot_rcpt_amt,
"
"	   porh_lc_apport_basis,
"
"	   porh_rr_flag,
"
"	   porh_rr_no,
"
"	   porh_wf_status,
"
"	   porh_tolr_flag,
"
"	   porh_dflt_pay_thru,
"
"	   porh_adv_lic1_doc_no,
"
"	   porh_adv_lic1_adj_qty,
"
"	   porh_adv_lic1_adj_amt,
"
"	   porh_adv_lic2_doc_no,
"
"	   porh_adv_lic2_adj_qty,
"
"	   porh_adv_lic2_adj_amt,
"
"	   porh_lc_tax_set_id,
"
"	   porh_lc_inc_tax_flag,
"
"	   porh_custom_val,
"
"	   porh_vat_class,
"
"	   porh_vat_type,
"
"	   porh_pin_no,
"
"	   porh_rebate_dbn_flag,
"
"	   porh_qlty_incharge,
"
"	   porh_qlty_compl_date,
"
"	   porh_vou_pfx,
"
"           porh_vou_no,
"
"           porh_spn_brkr_comm_basis,
"
"           porh_spn_brkr_comm_amt,
"
"           porh_spn_brkr_comm_payble,
"
"           porh_dflt_inv_pfx,
"
"           porh_cr_avl_flag,
"
"           porh_cr_avl_no,
"
"           porh_cr_avl_date,
"
"           porh_cr_avl_status,
"
"           porh_import_flag,
"
"           porh_vertical_type,
"
"           porh_src_bus_fun,
"
"           porh_cancel_reason,
"
"           porh_cv_ins_pct,
"
"           porh_form_a,
"
"           porh_pre_appr_status,
"
"           porh_form_27c,
"
"           porh_doc_trans_ref_no,
"
"	   porh_proj_id,
"
"           porh_tcs_amt,
"
"           porh_org_cpy_flag,
"
"	   porh_shipto_type,
"
"	   porh_cust_id,
"
"	   porh_gst_clf_type,
"
"	   porh_plnt_loc_name,
"
"	   porh_csr_doc_no,
"
"	   porh_shipto_loc_name,
"
"	   porh_billto_loc_name,
"
"	   porh_shipfr_loc_name,
"
"	   porh_billfr_loc_name,
"
"	   porh_appr_by,
"
"	   porh_appr_emp_id,
"
"	   porh_appr_ip_addr,
"
"	   porh_appr_os_user,
"
"	   porh_appr_date,
"
"	   porh_billfr_clf_type,
"
"	   porh_chrg_apport_basis,
"
"	   porh_billto_gst_type,
"
"	   porh_ewb_bill_date
"
"      FROM pur_ord_receipt_hd
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_ord_receipt_ln_hist(porlh_bu,
"
"                                        porlh_receipt_no,
"
"                                        porlh_seq_no,
"
"					porlh_po_type,
"
"                                        porlh_po_pfx,
"
"                                        porlh_po_no,
"
"                                        porlh_po_seq_no,
"
"                                        porlh_po_sub_seq_no,
"
"                                        porlh_sc_unit_cost,
"
"                                        porlh_disc_pct,
"
"                                        porlh_bc_land_cost,
"
"                                        porlh_sc_chrg_amt,
"
"                                        porlh_sc_non_chrg_amt,
"
"                                        porlh_sc_lm_disc_amt,
"
"                                        porlh_scon_mat_unit_cost,
"
"                                        porlh_receipt_qty,
"
"                                        porlh_accepted_qty,
"
"                                        porlh_rejected_qty,
"
"                                        porlh_qc_qty,
"
"                                        porlh_rtnto_suplr_qty,
"
"                                        porlh_inv_qty,
"
"                                        porlh_rtnd_doc_qty,
"
"                                        porlh_net_disc_flag,
"
"                                        porlh_rev_cip_no,
"
"                                        porlh_status,
"
"                                        porlh_qc_sel_flag,
"
"                                        porlh_qc_doc_no,
"
"                                        porlh_qc_doc_pfx,
"
"                                        porlh_accpt_rtnto_suplr_qty,
"
"                                        porlh_bc_nchrg_land_cost,
"
"                                        porlh_session_id,
"
"                                        porlh_bom_no,
"
"                                        porlh_plnt,
"
"                                        porlh_storage_store_id,
"
"                                        porlh_storage_store_name,
"
"                                        porlh_stk_trn_so_pfx,
"
"                                        porlh_stk_trn_so_no,
"
"                                        porlh_stk_trn_inv_pfx,
"
"                                        porlh_stk_trn_inv_no,
"
"                                        porlh_tot_accepted_qty,
"
"                                        porlh_tot_rejected_qty,
"
"                                        porlh_conv_factor,
"
"                                        porlh_lvl_prod_id,
"
"                                        porlh_lvl_prod_rev,
"
"                                        porlh_stock_receipt_qty,
"
"                                        porlh_upd_ref2,
"
"                                        porlh_upd_ref1,
"
"                                        porlh_sc_suplr_flag,
"
"                                        porlh_stk_upd_qty,
"
"                                        porlh_so_qty,
"
"                                        porlh_so_inv_qty,
"
"                                        porlh_acc_value,
"
"                                        porlh_tqm_rev,
"
"                                        porlh_temp_inv_qty,
"
"                                        porlh_temp_in_progress,
"
"                                        porlh_so_upd_qty,
"
"                                        porlh_rework_qty,
"
"                                        porlh_inv_activity,
"
"                                        porlh_dmi_doc_pfx,
"
"                                        porlh_dmi_doc_no,
"
"                                        porlh_tmp_rtn_qty,
"
"                                        porlh_tmp_rwk_qty,
"
"                                        porlh_sel_flag,
"
"                                        porlh_excess_qty,
"
"                                        porlh_stk_accepted_qty,
"
"                                        porlh_stk_rejected_qty,
"
"                                        porlh_excss_rtnto_suplr_qty,
"
"                                        porlh_rtn_inproc_qty,
"
"                                        porlh_rwk_inproc_qty,
"
"                                        porlh_volume,
"
"                                        porlh_prim_rej_qty,
"
"                                        porlh_sec_rej_qty,
"
"                                        porlh_cartons_nos,
"
"                                        porlh_stk_trn_inv_seq_no,
"
"                                        porlh_prim_rtnprcs_qty,
"
"                                        porlh_prim_rtninprcs_qty,
"
"                                        porlh_prim_ret_qty,
"
"                                        porlh_sec_rtnprcs_qty,
"
"                                        porlh_sec_rtninprcs_qty,
"
"                                        porlh_sec_ret_qty,
"
"                                        porlh_prim_ret_suplr,
"
"                                        porlh_sec_ret_suplr,
"
"                                        porlh_prim_rwk_inside,
"
"                                        porlh_prim_rwk_outside,
"
"                                        porlh_prim_rwk_supplier,
"
"                                        porlh_secon_rwk_inside,
"
"                                        porlh_secon_rwk_outside,
"
"                                        porlh_secon_rwk_supplier,
"
"                                        porlh_prim_rwk_in_proc_qty,
"
"                                        porlh_secon_rwk_in_proc_qty,
"
"                                        porlh_prim_rwk_qty,
"
"                                        porlh_sec_rwk_qty,
"
"                                        porlh_fa_inprcs_qty,
"
"                                        porlh_fa_prcs_qty,
"
"                                        porlh_fa_rcpt_qty,
"
"                                        porlh_fa_sel_flag,
"
"                                        porlh_tg_sel_flag,
"
"                                        porlh_tg_inprcs_qty,
"
"                                        porlh_tg_prcs_qty,
"
"                                        porlh_tg_inv_qty,
"
"                                        porlh_tg_cust_id,
"
"                                        porlh_bc_oh_cost,
"
"                                        porlh_sup_inproc_qty,
"
"                                        porlh_sup_compl_qty,
"
"                                        porlh_cre_by,
"
"					porlh_cre_emp_id,
"
"					porlh_cre_ip_addr,
"
"					porlh_cre_os_user,
"
"                                        porlh_cre_date,
"
"                                        porlh_upd_by,
"
"					porlh_upd_emp_id,
"
"					porlh_upd_ip_addr,
"
"					porlh_upd_os_user,
"
"                                        porlh_upd_date,
"
"                                        porlh_prod_id,
"
"                                        porlh_prod_rev,
"
"                                        porlh_prod_uom,
"
"                                        porlh_suplr_uom,
"
"                                        porlh_scrap_qty,
"
"                                        porlh_tolr_qty,
"
"                                        porlh_ss_doc_pfx,
"
"                                        porlh_ss_doc_no,
"
"                                        porlh_ss_seq_no,
"
"                                        porlh_contr_pfx,
"
"                                        porlh_contr_no,
"
"                                        porlh_amd_no,
"
"                                        porlh_prod_ord_no,
"
"                                        porlh_sf_code,
"
"                                        porlh_prod_desc1,
"
"                                        porlh_amd_date,
"
"                                        porlh_bom_avail_flag,
"
"                                        porlh_excess_sel_flag,
"
"                                        porlh_excess_inproc_qty,
"
"                                        porlh_excess_proc_qty,
"
"                                        porlh_ins_plan_no,
"
"                                        porlh_ins_plan_rev,
"
"                                        porlh_test_req_flag,
"
"                                        porlh_cert_id,
"
"                                        porlh_matl_type,
"
"                                        porlh_tax_set_id,
"
"                                        porlh_prim_rej_dm_qty,
"
"                                        porlh_sec_rej_dm_qty,
"
"                                        porlh_cls_id,
"
"                                        porlh_po_unit_cost,
"
"                                        porlh_buyer_id,
"
"                                        porlh_sub_cls_id,
"
"                                        porlh_sec_dm_proc_qty,
"
"                                        porlh_sec_dm_flag,
"
"                                        porlh_sec_dm_user,
"
"                                        porlh_prim_dm_proc_qty,
"
"                                        porlh_prim_dm_flag,
"
"                                        porlh_prim_dm_user,
"
"                                        porlh_receive_flag,
"
"                                        porlh_receive_user,
"
"                                        porlh_inv_proc_qty,
"
"                                        porlh_tolr_pct,
"
"                                        porlh_rcpt_tolr_qty,
"
"                                        porlh_required_date,
"
"                                        porlh_required_qty,
"
"                                        porlh_promise_date,
"
"                                        porlh_ss_sub_seq_no,
"
"                                        porlh_prim_dm_inproc_qty,
"
"                                        porlh_sec_dm_inproc_qty,
"
"                                        porlh_prim_dmi_activity,
"
"                                        porlh_sec_dmi_activity,
"
"                                        porlh_prim_dmi_active_reason,
"
"                                        porlh_sec_dmi_active_reason,
"
"                                        porlh_work_ord_no,
"
"                                        porlh_fa_flag,
"
"                                        porlh_ref,
"
"                                        porlh_trans_no,
"
"                                        porlh_prim_no_action_qty,
"
"                                        porlh_sec_no_action_qty,
"
"                                        porlh_tcf_id,
"
"                                        porlh_prod_ext_desc,
"
"                                        porlh_disc_amt,
"
"                                        porlh_ut_dc_flag,
"
"                                        porlh_ge_doc_no,
"
"                                        porlh_task_oprn_id,
"
"                                        porlh_maint_flag,
"
"                                        porlh_maint_user,
"
"                                        porlh_comp_flag,
"
"                                        porlh_drawing_no,
"
"                                        porlh_drawing_rev,
"
"                                        porlh_ap_lc_chrg_amt,
"
"                                        porlh_upd_uc_ap_rq_flag,
"
"                                        porlh_upd_uc_ap_fin_flag,
"
"                                        porlh_wvd_flag,
"
"                                        porlh_suplr_bill_qty,
"
"                                        porlh_diff_qty,
"
"                                        porlh_wvd_qty,
"
"                                        porlh_suplr_wvd_qty,
"
"                                        porlh_prim_incent_amt,
"
"                                        porlh_sec_incent_amt,
"
"                                        porlh_prov_acct_flag,
"
"                                        porlh_prov_acct_user,
"
"                                        porlh_inc_doc_no,
"
"                                        porlh_spr_type,
"
"                                        porlh_foc_flag,
"
"                                        porlh_inv_sel_flag,
"
"                                        porlh_ctn_req_flag,
"
"                                        porlh_ctn_doc_no,
"
"                                        porlh_ctn_sel_flag,
"
"                                        porlh_ctn_sel_user,
"
"                                        porlh_tar_sf_code,
"
"                                        porlh_pr_pfx,
"
"                                        porlh_pr_no,
"
"                                        porlh_pr_seq_no,
"
"                                        porlh_pr_sub_seq_no,
"
"                                        porlh_po_date,
"
"                                        porlh_delay_ncr_no,
"
"                                        porlh_delay_ncr_cre_flag,
"
"                                        porlh_rg23d_qty,
"
"                                        porlh_rg23d_inproc_qty,
"
"                                        porlh_rg23d_proc_qty,
"
"                                        porlh_rg23d_sel_flag,
"
"                                        porlh_rg23d_user,
"
"                                        porlh_im_suplr_id,
"
"                                        porlh_im_doc_no,
"
"                                        porlh_im_sel_flag,
"
"                                        porlh_im_sel_user,
"
"                                        porlh_tax_acd_type,
"
"                                        porlh_ge_seq_no,
"
"                                        porlh_ge_sub_seq_no,
"
"                                        porlh_rec_repair_qty,
"
"                                        porlh_rec_rtrn_qty,
"
"                                        porlh_frt_inproc_qty,
"
"                                        porlh_frt_comp_qty,
"
"                                        porlh_frt_sel_flag,
"
"                                        porlh_frt_sel_user,
"
"                                        porlh_frt_process_qty,
"
"                                        porlh_prim_os_rwk_qty,
"
"                                        porlh_secon_os_rwk_qty,
"
"                                        porlh_prim_rwk_os_inproc_qty,
"
"                                        porlh_secon_rwk_os_inproc_qty,
"
"                                        porlh_sou_mat_weight,
"
"                                        porlh_tar_mat_weight,
"
"                                        porlh_plnd_scrap_weight,
"
"                                        porlh_plnd_hr_unit,
"
"                                        porlh_act_sou_mat_weight,
"
"                                        porlh_act_tar_mat_weight,
"
"                                        porlh_act_plnd_scrap_weight,
"
"                                        porlh_act_plnd_hr_unit,
"
"                                        porlh_dept_id,
"
"                                        porlh_suplr_dc_inv_qty,
"
"                                        porlh_idm_dc_doc_no,
"
"                                        porlh_idm_dc_no,
"
"                                        porlh_idm_dc_seq_no,
"
"                                        porlh_dim_req_flag,
"
"                                        porlh_thickness,
"
"                                        porlh_length,
"
"                                        porlh_width,
"
"                                        porlh_so_type,
"
"                                        porlh_so_pfx,
"
"                                        porlh_so_no,
"
"                                        porlh_so_seq_no,
"
"                                        porlh_so_sub_seq_no,
"
"                                        porlh_proj_id,
"
"                                        porlh_task_id,
"
"                                        porlh_vis_insp_flag,
"
"                                        porlh_scr_qty,
"
"                                        porlh_scr_inproc_qty,
"
"                                        porlh_scr_recvd_qty,
"
"                                        porlh_qty_in_nos,
"
"                                        porlh_po_sys_ls_no,
"
"                                        porlh_po_lot_no,
"
"                                        porlh_po_ser_no,
"
"                                        porlh_im_benf_type,
"
"                                        porlh_aod_qty,
"
"                                        porlh_stk_aod_qty,
"
"                                        porlh_stk_prim_rej_qty,
"
"                                        porlh_stk_sec_rej_qty,
"
"                                        porlh_tot_aod_qty,
"
"                                        porlh_rej_dm_flag,
"
"                                        porlh_po_amd_no,
"
"                                        porlh_cls_qty,
"
"                                        porlh_rcpt_rev_flag,
"
"                                        porlh_rwk_rtn_user,
"
"                                        porlh_serv_prod_id,
"
"                                        porlh_serv_io_type,
"
"                                        porlh_amc_start_date,
"
"                                        porlh_amc_end_date,
"
"                                        porlh_dc_short_flag,
"
"                                        porlh_cut_blank_qty,
"
"                                        porlh_serv_prod_desc,
"
"                                        porlh_scr_cls_short_qty,
"
"                                        porlh_scr_sel_flag,
"
"                                        porlh_scr_sel_user,
"
"                                        porlh_scr_proc_qty,
"
"                                        porlh_test_cert_no,
"
"                                        porlh_cert_rcvd_flag,
"
"                                        porlh_pack_mat_prod_id,
"
"                                        porlh_pack_mat_prod_rev,
"
"                                        porlh_pack_mat_qty,
"
"                                        porlh_br_suplr_id,
"
"                                        porlh_br_status,
"
"                                        porlh_sou_po_plnt,
"
"                                        porlh_install_req_flag,
"
"                                        porlh_installed_flag,
"
"                                        porlh_install_date,
"
"                                        porlh_ins_sel_flag,
"
"                                        porlh_ins_sel_user,
"
"                                        porlh_pla_no,
"
"                                        porlh_tool_wo_no,
"
"                                        porlh_qty_phy_count_by,
"
"                                        porlh_grn_cone_weight,
"
"                                        porlh_grn_act_cone_weight,
"
"                                        porlh_cone_ap_doc_pfx,
"
"                                        porlh_cone_ap_doc_no,
"
"                                        porlh_cone_inv_sel_flag,
"
"                                        porlh_cone_wght_hdl_type,
"
"                                        porlh_mov_ncr_doc_flag,
"
"                                        porlh_rg23_no,
"
"                                        porlh_scr_pct,
"
"                                        porlh_act_scr_weight,
"
"                                        porlh_alow_scr_qty,
"
"                                        porlh_capex_bud_no,
"
"                                        porlh_phy_cnt_qty,
"
"                                        porlh_cone_dmi_cmpl_flag,
"
"                                        porlh_qty_phy_count_by_name,
"
"                                        porlh_fsi_flag,
"
"                                        porlh_scr_dmi_qty,
"
"                                        porlh_ls_uom_gen_type,
"
"                                        porlh_so_schld_desc,
"
"                                        porlh_tax_exc_reason,
"
"                                        porlh_ctrl_set_no,
"
"                                        porlh_spec_doc_no,
"
"                                        porlh_spec_doc_rev,
"
"                                        porlh_cap_asset_id,
"
"                                        porlh_fa_type,
"
"                                        porlh_qc_doc_date,
"
"                                        porlh_grn_recv_date,
"
"                                        porlh_hsn_code,
"
"                                        porlh_no_of_bale,
"
"                                        porlh_avg_bale_weight,
"
"                                        porlh_allow_amt,
"
"                                        porlh_gst_rev_tax_cat_id,
"
"                                        porlh_catalog_no,
"
"                                        porlh_mchn_id,
"
"                                        porlh_sub_dept_id,
"
"                                        porlh_sco_mtrl_rqrd_flag,
"
"                                        porlh_std_cost,
"
"                                        porlh_spn_ord_upd_flag,
"
"                                        porlh_fcm_bl_id,
"
"                                        porlh_fcm_proj_no,
"
"                                        porlh_mftr_id,
"
"                                        porlh_mftr_part_no,
"
"					porlh_category_id,
"
"					porlh_gst_exempt_flag,
"
"					porlh_tc_chrg_flag,
"
"					porlh_st_so_pfx,
"
"					porlh_st_so_no,
"
"					porlh_st_so_seq_no,
"
"					porlh_st_so_sub_seq_no,
"
"					porlh_st_cs_doc_no,
"
"					porlh_st_cs_doc_rev,
"
"					porlh_st_cs_schld_no,
"
"					porlh_buyer_emp_id,
"
"					porlh_cost_basis,
"
"					porlh_full_rej_acpt_flag,
"
"					porlh_cd_expmt_flag,
"
"					porlh_annex_no,
"
"					porlh_annex_date,
"
"					porlh_rebate_unit_cost,
"
"					porlh_rebate_prim_val,
"
"					porlh_rebate_cut_val,
"
"					porlh_bond_no,
"
"					porlh_fnl_disc_amt,
"
"					porlh_fnl_unit_disc_amt,
"
"					porlh_moist_pct,
"
"					porlh_st_inv_bu,
"
"					porlh_st_inv_plnt,
"
"					porlh_st_inv_seq_no,
"
"					porlh_st_inv_no,
"
"					porlh_st_inv_pfx,
"
"					porlh_wvd_basis,
"
"					porlh_wvd_shrt_type,
"
"					porlh_wvd_excs_type,
"
"					porlh_gross_amt,
"
"					porlh_tax_amt,
"
"					porlh_net_amt,
"
"					porlh_prod_cls_desc,
"
"					porlh_prod_subcls_desc,
"
"					porlh_prod_grp,
"
"					porlh_prod_grp_desc,
"
"					porlh_prod_subgrp,
"
"					porlh_prod_subgrp_desc,
"
"					porlh_custom_val,
"
"	                                porlh_hs_tariff_code,
"
"	                                porlh_suplr_bill_amt,
"
"					porlh_vat_exempt_flag,
"
"					porlh_bag_cost,
"
"					porlh_bag_chrg_amt,
"
"                                        porlh_no_of_pcs,
"
"					porlh_rebate_cost_type,
"
"					porlh_cash_disc_pct,
"
"					porlh_cc_plnt,
"
"					porlh_cc_lvl1,
"
"					porlh_cc_lvl2,
"
"					porlh_cc_lvl3,
"
"					porlh_cc_lvl4,
"
"                                        porlh_cc_prj_lvl,
"
"					porlh_prod_outer_dia,
"
"					porlh_gst_input_type,
"
"					porlh_si_price,
"
"					porlh_boq_ref_no,
"
"					porlh_boq_seq_no,
"
"					porlh_boq_sub_seq_no,
"
"					porlh_boq_inproc_qty,
"
"					porlh_boq_comp_qty,
"
"					porlh_gst_rev_tax_cat,
"
"					porlh_gst_rev_tax_flag,
"
"					porlh_crate_sel_flag,
"
"                                        porlh_crate_sel_user,
"
"                                        porlh_crate_proc_qty,
"
"                                        porlh_crate_iss_qty,
"
"					porlh_vehicle_no,
"
"					porlh_lc_rqrd_flag,
"
"					porlh_aen_type,
"
"					porlh_bak_qty,
"
"					porlh_stk_bak_qty,
"
"					porlh_tot_bak_qty,
"
"					porlh_no_of_bags,
"
"					porlh_delay_reason,
"
"					porlh_adv_lic_doc_no,
"
"					porlh_adv_lic_adj_qty,
"
"					porlh_adv_lic_adj_amt,
"
"	                                porlh_dry_lr_pct,
"
"	                                porlh_dry_qty_kgs,
"
"	                                porlh_dry_fat_pct,
"
"	                                porlh_dry_snf_pct,
"
"	                                porlh_dry_fat_kgs,
"
"	                                porlh_dry_snf_kgs,
"
"                                        porlh_batch_no,
"
"                                        porlh_expiry_date,
"
"                                        porlh_mfg_date,
"
"					porlh_tcs_sec_id,
"
"					porlh_tcs_acces_val,
"
"					porlh_tcs_pct,
"
"					porlh_tcs_amt,
"
"					porlh_dc_no,
"
"					porlh_dc_doc_no,
"
"					porlh_dc_seq_no,
"
"					porlh_dc_proc_qty,
"
"					porlh_dc_cons_qty,
"
"					porlh_ins_policy_no,
"
"					porlh_iss_code,
"
"					porlh_unload_qty,
"
"					porlh_moist_qty,
"
"					porlh_shrt_qty,
"
"					porlh_shrt_amt,
"
"					porlh_adv_lic_no,
"
"					porlh_tot_stk_acpt_qty,
"
"					porlh_tot_stk_aod_qty,
"
"					porlh_tot_stk_rej_qty,
"
"					porlh_mill_suplr_name,
"
"					porlh_height,
"
"					porlh_inner_dia,
"
"					porlh_density,
"
"					porlh_pur_acct,
"
"					porlh_cc_code,
"
"					porlh_smpl_qty,
"
"					porlh_stk_smpl_qty,
"
"					porlh_tot_smpl_qty,
"
"					porlh_tot_stk_smpl_qty,
"
"					porlh_fab_item_type,
"
"					porlh_plnt_loc_id,
"
"					porlh_gla_fxd_flag,
"
"					porlh_cpc_fxd_flag,
"
"					porlh_st_oprn_ln_seq_no,
"
"					porlh_st_comp_oprn_id,
"
"					porlh_po_plnt,
"
"					porlh_po_plnt_loc_id,
"
"					porlh_sou_oprn_seq,
"
"					porlh_sou_proc_id,
"
"					porlh_tar_oprn_seq,
"
"					porlh_tar_proc_id,
"
"					porlh_qc_comp_date,
"
"					porlh_asn_no,
"
"					porlh_ts_rate,
"
"					porlh_ts_rate_fr,
"
"					porlh_tax_pct,
"
"                                        porlh_igst_amt,
"
"                                        porlh_sgst_amt,
"
"                                        porlh_cgst_amt,
"
"                                        porlh_utgst_amt,
"
"                                        porlh_cess_pct,
"
"                                        porlh_cess_amt,
"
"					porlh_suplr_chrg_flag,
"
"					porlh_trd_disc_pct,
"
"					porlh_trd_disc_amt,
"
"					porlh_spl_disc_pct,
"
"					porlh_spl_disc_amt,
"
"					porlh_cash_disc_amt,
"
"					porlh_cgst_pct,
"
"	                                porlh_sgst_pct,
"
"	                                porlh_utgst_pct,
"
"					porlh_trd_assbl_val,
"
"					porlh_spl_assbl_val,
"
"					porlh_cash_assbl_val,
"
"					porlh_rcm_flag,
"
"					porlh_rcm_cat_id,
"
"					porlh_ge_doc_date,
"
"					porlh_cess_rate,
"
"					porlh_warr_date,
"
"					porlh_kbl_dev_remark ,
"
"					porlh_chem_comp,
"
"					porlh_basis,
"
"					porlh_tool_wrk_ord_no
"
"                                       )
"
"    SELECT porl_bu,
"
"	   porl_receipt_no,
"
"	   porl_seq_no,
"
"	   porl_po_type,
"
"	   porl_po_pfx,
"
"	   porl_po_no,
"
"	   porl_po_seq_no,
"
"	   porl_po_sub_seq_no,
"
"	   porl_sc_unit_cost,
"
"	   porl_disc_pct,
"
"	   porl_bc_land_cost,
"
"	   porl_sc_chrg_amt,
"
"	   porl_sc_non_chrg_amt,
"
"	   porl_sc_lm_disc_amt,
"
"	   porl_scon_mat_unit_cost,
"
"	   porl_receipt_qty,
"
"	   porl_accepted_qty,
"
"	   porl_rejected_qty,
"
"	   porl_qc_qty,
"
"	   porl_rtnto_suplr_qty,
"
"	   porl_inv_qty,
"
"	   porl_rtnd_doc_qty,
"
"	   porl_net_disc_flag,
"
"	   porl_rev_cip_no,
"
"	   porl_status,
"
"	   porl_qc_sel_flag,
"
"	   porl_qc_doc_no,
"
"	   porl_qc_doc_pfx,
"
"	   porl_accpt_rtnto_suplr_qty,
"
"	   porl_bc_nchrg_land_cost,
"
"	   porl_session_id,
"
"	   porl_bom_no,
"
"	   porl_plnt,
"
"	   porl_storage_store_id,
"
"	   porl_storage_store_name,
"
"	   porl_stk_trn_so_pfx,
"
"	   porl_stk_trn_so_no,
"
"	   porl_stk_trn_inv_pfx,
"
"	   porl_stk_trn_inv_no,
"
"	   porl_tot_accepted_qty,
"
"	   porl_tot_rejected_qty,
"
"	   porl_conv_factor,
"
"	   porl_lvl_prod_id,
"
"	   porl_lvl_prod_rev,
"
"	   porl_stock_receipt_qty,
"
"	   porl_upd_ref2,
"
"	   porl_upd_ref1,
"
"	   porl_sc_suplr_flag,
"
"	   porl_stk_upd_qty,
"
"	   porl_so_qty,
"
"	   porl_so_inv_qty,
"
"	   porl_acc_value,
"
"	   porl_tqm_rev,
"
"	   porl_temp_inv_qty,
"
"	   porl_temp_in_progress,
"
"	   porl_so_upd_qty,
"
"	   porl_rework_qty,
"
"	   porl_inv_activity,
"
"	   porl_dmi_doc_pfx,
"
"	   porl_dmi_doc_no,
"
"	   porl_tmp_rtn_qty,
"
"	   porl_tmp_rwk_qty,
"
"	   porl_sel_flag,
"
"	   porl_excess_qty,
"
"	   porl_stk_accepted_qty,
"
"	   porl_stk_rejected_qty,
"
"	   porl_excss_rtnto_suplr_qty,
"
"	   porl_rtn_inproc_qty,
"
"	   porl_rwk_inproc_qty,
"
"	   porl_volume,
"
"	   porl_prim_rej_qty,
"
"	   porl_sec_rej_qty,
"
"	   porl_cartons_nos,
"
"	   porl_stk_trn_inv_seq_no,
"
"	   porl_prim_rtnprcs_qty,
"
"	   porl_prim_rtninprcs_qty,
"
"	   porl_prim_ret_qty,
"
"	   porl_sec_rtnprcs_qty,
"
"	   porl_sec_rtninprcs_qty,
"
"	   porl_sec_ret_qty,
"
"	   porl_prim_ret_suplr,
"
"	   porl_sec_ret_suplr,
"
"	   porl_prim_rwk_inside,
"
"	   porl_prim_rwk_outside,
"
"	   porl_prim_rwk_supplier,
"
"	   porl_secon_rwk_inside,
"
"	   porl_secon_rwk_outside,
"
"	   porl_secon_rwk_supplier,
"
"	   porl_prim_rwk_in_proc_qty,
"
"	   porl_secon_rwk_in_proc_qty,
"
"	   porl_prim_rwk_qty,
"
"	   porl_sec_rwk_qty,
"
"	   porl_fa_inprcs_qty,
"
"	   porl_fa_prcs_qty,
"
"	   porl_fa_rcpt_qty,
"
"	   porl_fa_sel_flag,
"
"	   porl_tg_sel_flag,
"
"	   porl_tg_inprcs_qty,
"
"	   porl_tg_prcs_qty,
"
"	   porl_tg_inv_qty,
"
"	   porl_tg_cust_id,
"
"	   porl_bc_oh_cost,
"
"	   porl_sup_inproc_qty,
"
"	   porl_sup_compl_qty,
"
"	   porl_cre_by,
"
"	   porl_cre_emp_id,
"
"	   porl_cre_ip_addr,
"
"	   porl_cre_os_user,
"
"	   porl_cre_date,
"
"	   porl_upd_by,
"
"	   porl_upd_emp_id,
"
"	   porl_upd_ip_addr,
"
"	   porl_upd_os_user,
"
"	   porl_upd_date,
"
"	   porl_prod_id,
"
"	   porl_prod_rev,
"
"	   porl_prod_uom,
"
"	   porl_suplr_uom,
"
"	   porl_scrap_qty,
"
"	   porl_tolr_qty,
"
"	   porl_ss_doc_pfx,
"
"	   porl_ss_doc_no,
"
"	   porl_ss_seq_no,
"
"	   porl_contr_pfx,
"
"	   porl_contr_no,
"
"	   porl_amd_no,
"
"	   porl_prod_ord_no,
"
"	   porl_sf_code,
"
"	   porl_prod_desc1,
"
"	   porl_amd_date,
"
"	   porl_bom_avail_flag,
"
"	   porl_excess_sel_flag,
"
"	   porl_excess_inproc_qty,
"
"	   porl_excess_proc_qty,
"
"	   porl_ins_plan_no,
"
"	   porl_ins_plan_rev,
"
"	   porl_test_req_flag,
"
"	   porl_cert_id,
"
"	   porl_matl_type,
"
"	   porl_tax_set_id,
"
"	   porl_prim_rej_dm_qty,
"
"	   porl_sec_rej_dm_qty,
"
"	   porl_cls_id,
"
"	   porl_po_unit_cost,
"
"	   porl_buyer_id,
"
"	   porl_sub_cls_id,
"
"	   porl_sec_dm_proc_qty,
"
"	   porl_sec_dm_flag,
"
"	   porl_sec_dm_user,
"
"	   porl_prim_dm_proc_qty,
"
"	   porl_prim_dm_flag,
"
"	   porl_prim_dm_user,
"
"	   porl_receive_flag,
"
"	   porl_receive_user,
"
"	   porl_inv_proc_qty,
"
"	   porl_tolr_pct,
"
"	   porl_rcpt_tolr_qty,
"
"	   porl_required_date,
"
"	   porl_required_qty,
"
"	   porl_promise_date,
"
"	   porl_ss_sub_seq_no,
"
"	   porl_prim_dm_inproc_qty,
"
"	   porl_sec_dm_inproc_qty,
"
"	   porl_prim_dmi_activity,
"
"	   porl_sec_dmi_activity,
"
"	   porl_prim_dmi_active_reason,
"
"	   porl_sec_dmi_active_reason,
"
"	   porl_work_ord_no,
"
"	   porl_fa_flag,
"
"	   porl_ref,
"
"	   porl_trans_no,
"
"	   porl_prim_no_action_qty,
"
"	   porl_sec_no_action_qty,
"
"	   porl_tcf_id,
"
"	   porl_prod_ext_desc,
"
"	   porl_disc_amt,
"
"	   porl_ut_dc_flag,
"
"	   porl_ge_doc_no,
"
"	   porl_task_oprn_id,
"
"	   porl_maint_flag,
"
"	   porl_maint_user,
"
"	   porl_comp_flag,
"
"	   porl_drawing_no,
"
"	   porl_drawing_rev,
"
"	   porl_ap_lc_chrg_amt,
"
"	   porl_upd_uc_ap_rq_flag,
"
"	   porl_upd_uc_ap_fin_flag,
"
"	   porl_wvd_flag,
"
"	   porl_suplr_bill_qty,
"
"	   porl_diff_qty,
"
"	   porl_wvd_qty,
"
"	   porl_suplr_wvd_qty,
"
"	   porl_prim_incent_amt,
"
"	   porl_sec_incent_amt,
"
"	   porl_prov_acct_flag,
"
"	   porl_prov_acct_user,
"
"	   porl_inc_doc_no,
"
"	   porl_spr_type,
"
"	   porl_foc_flag,
"
"	   porl_inv_sel_flag,
"
"	   porl_ctn_req_flag,
"
"	   porl_ctn_doc_no,
"
"	   porl_ctn_sel_flag,
"
"	   porl_ctn_sel_user,
"
"	   porl_tar_sf_code,
"
"	   porl_pr_pfx,
"
"	   porl_pr_no,
"
"	   porl_pr_seq_no,
"
"	   porl_pr_sub_seq_no,
"
"	   porl_po_date,
"
"	   porl_delay_ncr_no,
"
"	   porl_delay_ncr_cre_flag,
"
"	   porl_rg23d_qty,
"
"	   porl_rg23d_inproc_qty,
"
"	   porl_rg23d_proc_qty,
"
"	   porl_rg23d_sel_flag,
"
"	   porl_rg23d_user,
"
"	   porl_im_suplr_id,
"
"	   porl_im_doc_no,
"
"	   porl_im_sel_flag,
"
"	   porl_im_sel_user,
"
"	   porl_tax_acd_type,
"
"	   porl_ge_seq_no,
"
"	   porl_ge_sub_seq_no,
"
"	   porl_rec_repair_qty,
"
"	   porl_rec_rtrn_qty,
"
"	   porl_frt_inproc_qty,
"
"	   porl_frt_comp_qty,
"
"	   porl_frt_sel_flag,
"
"	   porl_frt_sel_user,
"
"	   porl_frt_process_qty,
"
"	   porl_prim_os_rwk_qty,
"
"	   porl_secon_os_rwk_qty,
"
"	   porl_prim_rwk_os_inproc_qty,
"
"	   porl_secon_rwk_os_inproc_qty,
"
"	   porl_sou_mat_weight,
"
"	   porl_tar_mat_weight,
"
"	   porl_plnd_scrap_weight,
"
"	   porl_plnd_hr_unit,
"
"	   porl_act_sou_mat_weight,
"
"	   porl_act_tar_mat_weight,
"
"	   porl_act_plnd_scrap_weight,
"
"	   porl_act_plnd_hr_unit,
"
"	   porl_dept_id,
"
"	   porl_suplr_dc_inv_qty,
"
"	   porl_idm_dc_doc_no,
"
"	   porl_idm_dc_no,
"
"	   porl_idm_dc_seq_no,
"
"	   porl_dim_req_flag,
"
"	   porl_thickness,
"
"	   porl_length,
"
"	   porl_width,
"
"	   porl_so_type,
"
"	   porl_so_pfx,
"
"	   porl_so_no,
"
"	   porl_so_seq_no,
"
"	   porl_so_sub_seq_no,
"
"	   porl_proj_id,
"
"	   porl_task_id,
"
"	   porl_vis_insp_flag,
"
"	   porl_scr_qty,
"
"	   porl_scr_inproc_qty,
"
"	   porl_scr_recvd_qty,
"
"	   porl_qty_in_nos,
"
"	   porl_po_sys_ls_no,
"
"	   porl_po_lot_no,
"
"	   porl_po_ser_no,
"
"	   porl_im_benf_type,
"
"	   porl_aod_qty,
"
"	   porl_stk_aod_qty,
"
"	   porl_stk_prim_rej_qty,
"
"	   porl_stk_sec_rej_qty,
"
"	   porl_tot_aod_qty,
"
"	   porl_rej_dm_flag,
"
"	   porl_po_amd_no,
"
"	   porl_cls_qty,
"
"	   porl_rcpt_rev_flag,
"
"	   porl_rwk_rtn_user,
"
"	   porl_serv_prod_id,
"
"	   porl_serv_io_type,
"
"	   porl_amc_start_date,
"
"	   porl_amc_end_date,
"
"	   porl_dc_short_flag,
"
"	   porl_cut_blank_qty,
"
"	   porl_serv_prod_desc,
"
"	   porl_scr_cls_short_qty,
"
"	   porl_scr_sel_flag,
"
"	   porl_scr_sel_user,
"
"	   porl_scr_proc_qty,
"
"	   porl_test_cert_no,
"
"	   porl_cert_rcvd_flag,
"
"	   porl_pack_mat_prod_id,
"
"	   porl_pack_mat_prod_rev,
"
"	   porl_pack_mat_qty,
"
"	   porl_br_suplr_id,
"
"	   porl_br_status,
"
"	   porl_sou_po_plnt,
"
"	   porl_install_req_flag,
"
"	   porl_installed_flag,
"
"	   porl_install_date,
"
"	   porl_ins_sel_flag,
"
"	   porl_ins_sel_user,
"
"	   porl_pla_no,
"
"	   porl_tool_wo_no,
"
"	   porl_qty_phy_count_by,
"
"	   porl_grn_cone_weight,
"
"	   porl_grn_act_cone_weight,
"
"	   porl_cone_ap_doc_pfx,
"
"	   porl_cone_ap_doc_no,
"
"	   porl_cone_inv_sel_flag,
"
"	   porl_cone_wght_hdl_type,
"
"	   porl_mov_ncr_doc_flag,
"
"	   porl_rg23_no,
"
"	   porl_scr_pct,
"
"	   porl_act_scr_weight,
"
"	   porl_alow_scr_qty,
"
"	   porl_capex_bud_no,
"
"	   porl_phy_cnt_qty,
"
"	   porl_cone_dmi_cmpl_flag,
"
"	   porl_qty_phy_count_by_name,
"
"	   porl_fsi_flag,
"
"	   porl_scr_dmi_qty,
"
"	   porl_ls_uom_gen_type,
"
"	   porl_so_schld_desc,
"
"	   porl_tax_exc_reason,
"
"	   porl_ctrl_set_no,
"
"	   porl_spec_doc_no,
"
"	   porl_spec_doc_rev,
"
"	   porl_cap_asset_id,
"
"	   porl_fa_type,
"
"	   porl_qc_doc_date,
"
"	   porl_grn_recv_date,
"
"	   porl_hsn_code,
"
"	   porl_no_of_bale,
"
"	   porl_avg_bale_weight,
"
"	   porl_allow_amt,
"
"	   porl_gst_rev_tax_cat_id,
"
"	   porl_catalog_no,
"
"	   porl_mchn_id,
"
"	   porl_sub_dept_id,
"
"	   porl_sco_mtrl_rqrd_flag,
"
"	   porl_std_cost,
"
"	   porl_spn_ord_upd_flag,
"
"	   porl_fcm_bl_id,
"
"	   porl_fcm_proj_no,
"
"	   porl_mftr_id,
"
"	   porl_mftr_part_no,
"
"	   porl_category_id,
"
"	   porl_gst_exempt_flag,
"
"	   porl_tc_chrg_flag,
"
"	   porl_st_so_pfx,
"
"	   porl_st_so_no,
"
"	   porl_st_so_seq_no,
"
"	   porl_st_so_sub_seq_no,
"
"	   porl_st_cs_doc_no,
"
"	   porl_st_cs_doc_rev,
"
"	   porl_st_cs_schld_no,
"
"	   porl_buyer_emp_id,
"
"	   porl_cost_basis,
"
"	   porl_full_rej_acpt_flag,
"
"	   porl_cd_expmt_flag,
"
"	   porl_annex_no,
"
"	   porl_annex_date,
"
"	   porl_rebate_unit_cost,
"
"	   porl_rebate_prim_val,
"
"	   porl_rebate_cut_val,
"
"	   porl_bond_no,
"
"	   porl_fnl_disc_amt,
"
"	   porl_fnl_unit_disc_amt,
"
"	   porl_moist_pct,
"
"	   porl_st_inv_bu,
"
"	   porl_st_inv_plnt,
"
"	   porl_st_inv_seq_no,
"
"	   porl_st_inv_no,
"
"	   porl_st_inv_pfx,
"
"	   porl_wvd_basis,
"
"	   porl_wvd_shrt_type,
"
"	   porl_wvd_excs_type,
"
"	   porl_gross_amt,
"
"	   porl_tax_amt,
"
"	   porl_net_amt,
"
"	   porl_prod_cls_desc,
"
"	   porl_prod_subcls_desc,
"
"	   porl_prod_grp,
"
"	   porl_prod_grp_desc,
"
"	   porl_prod_subgrp,
"
"	   porl_prod_subgrp_desc,
"
"	   porl_custom_val,
"
"	   porl_hs_tariff_code,
"
"	   porl_suplr_bill_amt,
"
"	   porl_vat_exempt_flag,
"
"	   porl_bag_cost,
"
"	   porl_bag_chrg_amt,
"
"	   porl_no_of_pcs,
"
"	   porl_rebate_cost_type,
"
"	   porl_cash_disc_pct,
"
"	   porl_cc_plnt,
"
"	   porl_cc_lvl1,
"
"	   porl_cc_lvl2,
"
"	   porl_cc_lvl3,
"
"	   porl_cc_lvl4,
"
"           porl_cc_prj_lvl,
"
"	   porl_prod_outer_dia,
"
"	   porl_gst_input_type,
"
"	   porl_si_price,
"
"	   porl_boq_ref_no,
"
"	   porl_boq_seq_no,
"
"	   porl_boq_sub_seq_no,
"
"	   porl_boq_inproc_qty,
"
"	   porl_boq_comp_qty,
"
"	   porl_gst_rev_tax_cat,
"
"	   porl_gst_rev_tax_flag,
"
"	   porl_crate_sel_flag,
"
"           porl_crate_sel_user,
"
"           porl_crate_proc_qty,
"
"           porl_crate_iss_qty,
"
"	   porl_vehicle_no,
"
"	   porl_lc_rqrd_flag,
"
"	   porl_aen_type,
"
"	   porl_bak_qty,
"
"	   porl_stk_bak_qty,
"
"	   porl_tot_bak_qty,
"
"	   porl_no_of_bags,
"
"	   porl_delay_reason,
"
"	   porl_adv_lic_doc_no,
"
"	   porl_adv_lic_adj_qty,
"
"	   porl_adv_lic_adj_amt,
"
"	   porl_dry_lr_pct,
"
"	   porl_dry_qty_kgs,
"
"	   porl_dry_fat_pct,
"
"	   porl_dry_snf_pct,
"
"	   porl_dry_fat_kgs,
"
"	   porl_dry_snf_kgs,
"
"           porl_batch_no,
"
"           porl_expiry_date,
"
"           porl_mfg_date,
"
"	   porl_tcs_sec_id,
"
"	   porl_tcs_acces_val,
"
"	   porl_tcs_pct,
"
"	   porl_tcs_amt,
"
"	   porl_dc_no,
"
"           porl_dc_doc_no,
"
"           porl_dc_seq_no,
"
"           porl_dc_proc_qty,
"
"           porl_dc_cons_qty,
"
"           porl_ins_policy_no,
"
"	   porl_iss_code,
"
"	   porl_unload_qty,
"
"	   porl_moist_qty,
"
"	   porl_shrt_qty,
"
"	   porl_shrt_amt,
"
"	   porl_adv_lic_no,
"
"	   porl_tot_stk_acpt_qty,
"
"	   porl_tot_stk_aod_qty,
"
"	   porl_tot_stk_rej_qty,
"
"	   porl_mill_suplr_name,
"
"	   porl_height,
"
"	   porl_inner_dia,
"
"	   porl_density,
"
"	   porl_pur_acct,
"
"	   porl_cc_code,
"
"	   porl_smpl_qty,
"
"	   porl_stk_smpl_qty,
"
"	   porl_tot_smpl_qty,
"
"	   porl_tot_stk_smpl_qty,
"
"	   porl_fab_item_type,
"
"	   porl_plnt_loc_id,
"
"	   porl_gla_fxd_flag,
"
"	   porl_cpc_fxd_flag,
"
"	   porl_st_oprn_ln_seq_no,
"
"	   porl_st_comp_oprn_id,
"
"	   porl_po_plnt,
"
"	   porl_po_plnt_loc_id,
"
"           porl_sou_oprn_seq,
"
"           porl_sou_proc_id,
"
"           porl_tar_oprn_seq,
"
"           porl_tar_proc_id,
"
"	   porl_qc_comp_date,
"
"	   porl_asn_no,
"
"	   porl_ts_rate,
"
"	   porl_ts_rate_fr,
"
"	   porl_tax_pct,
"
"           porl_igst_amt,
"
"           porl_sgst_amt,
"
"           porl_cgst_amt,
"
"           porl_utgst_amt,
"
"           porl_cess_pct,
"
"           porl_cess_amt,
"
"	   porl_suplr_chrg_flag,
"
"	   porl_trd_disc_pct,
"
"	   porl_trd_disc_amt,
"
"	   porl_spl_disc_pct,
"
"	   porl_spl_disc_amt,
"
"	   porl_cash_disc_amt,
"
"	   porl_cgst_pct,
"
"	   porl_sgst_pct,
"
"	   porl_utgst_pct,
"
"	   porl_trd_assbl_val,
"
"	   porl_spl_assbl_val,
"
"           porl_cash_assbl_val,
"
"	   porl_rcm_flag,
"
"	   porl_rcm_cat_id,
"
"	   porl_ge_doc_date,
"
"	   porl_cess_rate,
"
"	   porl_warr_date,
"
"	   porl_kbl_dev_remark ,
"
"	   porl_chem_comp,
"
"	   porl_basis,
"
"	   porl_tool_wrk_ord_no
"
"      FROM pur_ord_receipt_ln
"
"     WHERE porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_rcpt_land_costs_hist(prlch_bu,
"
"                                         prlch_rcpt_no,
"
"                                         prlch_seq_no,
"
"					 prlch_tc_type,
"
"                                         prlch_tc_id,
"
"					 prlch_tc_rev,
"
"                                         prlch_assbl_val,
"
"                                         prlch_tc_pct,
"
"                                         prlch_tc_amt,
"
"                                         prlch_suplr_id,
"
"                                         prlch_chrg_flag,
"
"                                         prlch_ref_no,
"
"                                         prlch_ref_date,
"
"                                         prlch_doc_pfx,
"
"                                         prlch_doc_no,
"
"                                         prlch_sel_flag,
"
"                                         prlch_sel_user,
"
"                                         prlch_pts_flag,
"
"                                         prlch_type,
"
"                                         prlch_pur_acct,
"
"                                         prlch_offset_acct,
"
"                                         prlch_hsn_code,
"
"                                         prlch_cre_by,
"
"					 prlch_cre_emp_id,
"
"					 prlch_cre_ip_addr,
"
"					 prlch_cre_os_user,
"
"                                         prlch_cre_date,
"
"                                         prlch_upd_by,
"
"					 prlch_upd_emp_id,
"
"					 prlch_upd_ip_addr,
"
"					 prlch_upd_os_user,
"
"                                         prlch_upd_date,
"
"					 prlch_suplr_doc_no,
"
"					 prlch_suplr_doc_date,
"
"					 prlch_rec_source,
"
"					 prlch_meis_doc_no,
"
"					 prlch_meis_lic_no,
"
"					 prlch_lc_import_flag,
"
"                                         prlch_bt_doc_pfx,
"
"                                         prlch_bt_doc_no,
"
"                                         prlch_bt_doc_seq_no,
"
"					 prlch_currency,
"
"					 prlch_exchange_rate,
"
"					 prlch_tax_type,
"
"					 prlch_sub_seq_no,
"
"					 prlch_annex_no,
"
"					 prlch_annex_date,
"
"					 prlch_po_pfx,
"
"					 prlch_po_no,
"
"					 prlch_po_seq_no,
"
"					 prlch_igst_pct,
"
"                                         prlch_igst_amt,
"
"                                         prlch_cgst_pct,
"
"                                         prlch_cgst_amt,
"
"                                         prlch_sgst_pct,
"
"                                         prlch_sgst_amt,
"
"					 prlch_utgst_pct,
"
"					 prlch_utgst_amt,
"
"					 prlch_cess_pct,
"
"					 prlch_cess_amt,
"
"					 prlch_state_code,
"
"					 prlch_gst_type,
"
"					 prlch_gst_clf_type,
"
"					 prlch_billfr_loc,
"
"					 prlch_gst_exempt_type
"
"					)
"
"    SELECT prlc_bu,
"
"           prlc_rcpt_no,
"
"           prlc_seq_no,
"
"	   prlc_tc_type,
"
"           prlc_tc_id,
"
"	   prlc_tc_rev,
"
"           prlc_assbl_val,
"
"           prlc_tc_pct,
"
"           prlc_tc_amt,
"
"           prlc_suplr_id,
"
"           prlc_chrg_flag,
"
"           prlc_ref_no,
"
"           prlc_ref_date,
"
"           prlc_doc_pfx,
"
"           prlc_doc_no,
"
"           prlc_sel_flag,
"
"           prlc_sel_user,
"
"           prlc_pts_flag,
"
"           prlc_type,
"
"           prlc_pur_acct,
"
"           prlc_offset_acct,
"
"           prlc_hsn_code,
"
"           prlc_cre_by,
"
"	   prlc_cre_emp_id,
"
"	   prlc_cre_ip_addr,
"
"	   prlc_cre_os_user,
"
"           prlc_cre_date,
"
"           prlc_upd_by,
"
"	   prlc_upd_emp_id,
"
"	   prlc_upd_ip_addr,
"
"	   prlc_upd_os_user,
"
"           prlc_upd_date,
"
"	   prlc_suplr_doc_no,
"
"	   prlc_suplr_doc_date,
"
"	   prlc_rec_source,
"
"	   prlc_meis_doc_no,
"
"           prlc_meis_lic_no,
"
"	   prlc_lc_import_flag,
"
"           prlc_bt_doc_pfx,
"
"           prlc_bt_doc_no,
"
"           prlc_bt_doc_seq_no,
"
"	   prlc_currency,
"
"	   prlc_exchange_rate,
"
"	   prlc_tax_type,
"
"	   prlc_sub_seq_no,
"
"	   prlc_annex_no,
"
"	   prlc_annex_date,
"
"	   prlc_po_pfx,
"
"	   prlc_po_no,
"
"	   prlc_po_seq_no,
"
"	   prlc_igst_pct,
"
"           prlc_igst_amt,
"
"           prlc_cgst_pct,
"
"           prlc_cgst_amt,
"
"           prlc_sgst_pct,
"
"           prlc_sgst_amt,
"
"	   prlc_utgst_pct,
"
"	   prlc_utgst_amt,
"
"	   prlc_cess_pct,
"
"	   prlc_cess_amt,
"
"	   prlc_state_code,
"
"           prlc_gst_type,
"
"           prlc_gst_clf_type,
"
"	   prlc_billfr_loc,
"
"	   prlc_gst_exempt_type
"
"      FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_receipt_lot_hist(prlth_bu,
"
"                                     prlth_receipt_no,
"
"                                     prlth_prod_id,
"
"                                     prlth_prod_rev,
"
"                                     prlth_lot_no,
"
"                                     prlth_lot_qty,
"
"                                     prlth_type,
"
"                                     prlth_cre_by,
"
"				     prlth_cre_emp_id,
"
"				     prlth_cre_ip_addr,
"
"				     prlth_cre_os_user,
"
"                                     prlth_cre_date,
"
"                                     prlth_upd_by,
"
"				     prlth_upd_emp_id,
"
"				     prlth_upd_ip_addr,
"
"				     prlth_upd_os_user,
"
"                                     prlth_upd_date,
"
"                                     prlth_start_ser_no,
"
"                                     prlth_alloc_qty,
"
"                                     prlth_mfg_date,
"
"                                     prlth_seq_no,
"
"                                     prlth_expiry_date,
"
"                                     prlth_ln_seq_no,
"
"                                     prlth_no_of_bale,
"
"                                     prlth_conv_factor,
"
"				     prlth_tdc,
"
"                                     prlth_uts,
"
"                                     prlth_ys,
"
"                                     prlth_hrb,
"
"                                     prlth_elo,
"
"				     prlth_gsm,
"
"				     prlth_passivation,
"
"				     prlth_thickness,
"
"				     prlth_width,
"
"				     prlth_length,
"
"				     prlth_temper,
"
"				     prlth_coating,
"
"				     prlth_yield_pct,
"
"				     prlth_noof_comp_per_sht,
"
"				     prlth_wght_of_sht,
"
"				     prlth_no_of_sht,
"
"				     prlth_cost_of_sht,
"
"				     prlth_no_of_output,
"
"				     prlth_prod_outer_dia,
"
"				     prlth_crate_id,
"
"				     prlth_heat_no,
"
"				     prlth_test_no,
"
"				     prlth_tl_est_life,
"
"				     prlth_coil_no
"
"				    )
"
"    SELECT prlt_bu,
"
"           prlt_receipt_no,
"
"           prlt_prod_id,
"
"           prlt_prod_rev,
"
"           prlt_lot_no,
"
"           prlt_lot_qty,
"
"           prlt_type,
"
"           prlt_cre_by,
"
"	   prlt_cre_emp_id,
"
"	   prlt_cre_ip_addr,
"
"	   prlt_cre_os_user,
"
"           prlt_cre_date,
"
"           prlt_upd_by,
"
"	   prlt_upd_emp_id,
"
"	   prlt_upd_ip_addr,
"
"	   prlt_upd_os_user,
"
"           prlt_upd_date,
"
"           prlt_start_ser_no,
"
"           prlt_alloc_qty,
"
"           prlt_mfg_date,
"
"           prlt_seq_no,
"
"           prlt_expiry_date,
"
"           prlt_ln_seq_no,
"
"           prlt_no_of_bale,
"
"           prlt_conv_factor,
"
"	   prlt_tdc,
"
"           prlt_uts,
"
"           prlt_ys,
"
"           prlt_hrb,
"
"           prlt_elo,
"
"	   prlt_gsm,
"
"	   prlt_passivation,
"
"	   prlt_thickness,
"
"	   prlt_width,
"
"	   prlt_length,
"
"	   prlt_temper,
"
"	   prlt_coating,
"
"	   prlt_yield_pct,
"
"	   prlt_noof_comp_per_sht,
"
"	   prlt_wght_of_sht,
"
"	   prlt_no_of_sht,
"
"	   prlt_cost_of_sht,
"
"	   prlt_no_of_output,
"
"	   prlt_prod_outer_dia,
"
"	   prlt_crate_id,
"
"	   prlt_heat_no,
"
"	   prlt_test_no,
"
"	   prlt_tl_est_life,
"
"	   prlt_coil_no
"
"      FROM pur_receipt_lot
"
"     WHERE prlt_bu = p_bu
"
"       AND prlt_receipt_no = p_rcpt_no;
"
"
"
"    /*INSERT INTO pur_ord_fa_receipts_hist(pofrh_bu,
"
"                                         pofrh_receipt_no,
"
"                                         pofrh_rcpt_seq_no,
"
"                                         pofrh_asset_id,
"
"                                         pofrh_asset_status,
"
"                                         pofrh_asset_desc1,
"
"                                         pofrh_asset_desc2,
"
"                                         pofrh_group_id,
"
"                                         pofrh_dept_id,
"
"                                         pofrh_cat_id,
"
"                                         pofrh_purchase_date,
"
"                                         pofrh_depr_active_date,
"
"                                         pofrh_depr_method_id,
"
"                                         pofrh_prod_id,
"
"                                         pofrh_prod_rev,
"
"                                         pofrh_suplr_id,
"
"                                         pofrh_loc_id,
"
"                                         pofrh_active_year,
"
"                                         pofrh_active_period,
"
"                                         pofrh_last_proc_year,
"
"                                         pofrh_last_proc_period,
"
"                                         pofrh_sel_flag,
"
"                                         pofrh_cre_by,
"
"					 pofrh_cre_emp_id,
"
"					 pofrh_cre_ip_addr,
"
"					 pofrh_cre_os_user,
"
"                                         pofrh_cre_date,
"
"                                         pofrh_upd_by,
"
"					 pofrh_upd_emp_id,
"
"					 pofrh_upd_ip_addr,
"
"					 pofrh_upd_os_user,
"
"                                         pofrh_upd_date,
"
"                                         pofrh_sub_group_id,
"
"					 pofrh_emp_id
"
"					)
"
"    SELECT pofr_bu,
"
"	   pofr_receipt_no,
"
"	   pofr_rcpt_seq_no,
"
"	   pofr_asset_id,
"
"	   pofr_asset_status,
"
"	   pofr_asset_desc1,
"
"	   pofr_asset_desc2,
"
"	   pofr_group_id,
"
"	   pofr_dept_id,
"
"	   pofr_cat_id,
"
"	   pofr_purchase_date,
"
"	   pofr_depr_active_date,
"
"	   pofr_depr_method_id,
"
"	   pofr_prod_id,
"
"	   pofr_prod_rev,
"
"	   pofr_suplr_id,
"
"	   pofr_loc_id,
"
"	   pofr_active_year,
"
"	   pofr_active_period,
"
"	   pofr_last_proc_year,
"
"	   pofr_last_proc_period,
"
"	   pofr_sel_flag,
"
"	   pofr_cre_by,
"
"	   pofr_cre_emp_id,
"
"	   pofr_cre_ip_addr,
"
"	   pofr_cre_os_user,
"
"	   pofr_cre_date,
"
"	   pofr_upd_by,
"
"	   pofr_upd_emp_id,
"
"	   pofr_upd_ip_addr,
"
"	   pofr_upd_os_user,
"
"	   pofr_upd_date,
"
"	   pofr_sub_group_id,
"
"	   pofr_emp_id
"
"      FROM pur_ord_fa_receipts
"
"     WHERE pofr_bu = p_bu
"
"       AND pofr_receipt_no = p_rcpt_no;*/
"
"
"
"    INSERT INTO sub_contr_rcpt_process_hist(scrph_bu,
"
"					    scrph_rcpt_no,
"
"					    scrph_seq_no,
"
"					    scrph_sub_seq_no,
"
"					    scrph_process,
"
"					    scrph_oprn_seq_no,
"
"					    scrph_proc_cost,
"
"					    scrph_proc_flag,
"
"					    scrph_ls_req_flag,
"
"					    scrph_prod_id,
"
"					    scrph_prod_rev,
"
"					    scrph_hsn_code,
"
"					    scrph_sc_chrg_amt,
"
"					    scrph_sc_nchrg_amt,
"
"					    scrph_bc_lc_chrg_amt,
"
"					    scrph_bc_lc_nchrg_amt,
"
"					    scrph_uom,
"
"					    scrph_batch_qty,
"
"					    scrph_batch_cost,
"
"					    scrph_conv_factor,
"
"					    scrph_price_opt,
"
"					    scrph_min_flag,
"
"					    scrph_ir_flag,
"
"					    scrph_oprn_ln_seq_no,
"
"					    scrph_cre_by,
"
"					    scrph_cre_ip_addr,
"
"					    scrph_cre_os_user,
"
"					    scrph_cre_date,
"
"					    scrph_upd_by,
"
"					    scrph_upd_ip_addr,
"
"					    scrph_upd_os_user,
"
"					    scrph_upd_date,
"
"					    scrph_cre_emp_id,
"
"					    scrph_upd_emp_id,
"
"					    scrph_pur_acct,
"
"					    scrph_cc_code,
"
"					    scrph_disc_amt,
"
"					    scrph_igst_pct,
"
"					    scrph_sgst_pct,
"
"					    scrph_cgst_pct,
"
"					    scrph_utgst_pct,
"
"					    scrph_cess_pct,
"
"					    scrph_igst_amt,
"
"					    scrph_sgst_amt,
"
"					    scrph_cgst_amt,
"
"					    scrph_utgst_amt,
"
"					    scrph_cess_amt,
"
"					    scrph_assbl_val,
"
"					    scrph_proc_qty,
"
"					    scrph_temp_inv_qty,
"
"					    scrph_temp_in_progress,
"
"					    scrph_inv_qty,
"
"					    scrph_close_qty,
"
"					    scrph_inv_proc_qty,
"
"					    scrph_cpc_fxd_flag,
"
"                                            scrph_gla_fxd_flag
"
"					   )
"
"    SELECT scrp_bu,
"
"           scrp_rcpt_no,
"
"           scrp_seq_no,
"
"           scrp_sub_seq_no,
"
"           scrp_process,
"
"           scrp_oprn_seq_no,
"
"           scrp_proc_cost,
"
"           scrp_proc_flag,
"
"           scrp_ls_req_flag,
"
"           scrp_prod_id,
"
"           scrp_prod_rev,
"
"           scrp_hsn_code,
"
"           scrp_sc_chrg_amt,
"
"           scrp_sc_nchrg_amt,
"
"           scrp_bc_lc_chrg_amt,
"
"           scrp_bc_lc_nchrg_amt,
"
"           scrp_uom,
"
"           scrp_batch_qty,
"
"           scrp_batch_cost,
"
"           scrp_conv_factor,
"
"           scrp_price_opt,
"
"           scrp_min_flag,
"
"           scrp_ir_flag,
"
"           scrp_oprn_ln_seq_no,
"
"           scrp_cre_by,
"
"           scrp_cre_ip_addr,
"
"           scrp_cre_os_user,
"
"           scrp_cre_date,
"
"           scrp_upd_by,
"
"           scrp_upd_ip_addr,
"
"           scrp_upd_os_user,
"
"           scrp_upd_date,
"
"           scrp_cre_emp_id,
"
"           scrp_upd_emp_id,
"
"           scrp_pur_acct,
"
"           scrp_cc_code,
"
"           scrp_disc_amt,
"
"           scrp_igst_pct,
"
"           scrp_sgst_pct,
"
"           scrp_cgst_pct,
"
"           scrp_utgst_pct,
"
"           scrp_cess_pct,
"
"           scrp_igst_amt,
"
"           scrp_sgst_amt,
"
"           scrp_cgst_amt,
"
"           scrp_utgst_amt,
"
"           scrp_cess_amt,
"
"           scrp_assbl_val,
"
"           scrp_proc_qty,
"
"           scrp_temp_inv_qty,
"
"           scrp_temp_in_progress,
"
"           scrp_inv_qty,
"
"           scrp_close_qty,
"
"	   scrp_inv_proc_qty,
"
"	   scrp_cpc_fxd_flag,
"
"           scrp_gla_fxd_flag
"
"      FROM sub_contr_rcpt_process
"
"     WHERE scrp_bu = p_bu
"
"       AND scrp_rcpt_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_rcpt_lot_serial_hist(prclsh_bu,
"
"                                         prclsh_doc_no,
"
"                                         prclsh_doc_seq_no,
"
"                                         prclsh_seq_no,
"
"                                         prclsh_lot_no,
"
"                                         prclsh_serial_no,
"
"                                         prclsh_lot_qty,
"
"                                         prclsh_qty_accepted,
"
"                                         prclsh_tot_accepted,
"
"                                         prclsh_tot_rejected,
"
"                                         prclsh_qty_rejected,
"
"                                         prclsh_expiry_date,
"
"                                         prclsh_type,
"
"                                         prclsh_accept_flag,
"
"                                         prclsh_status,
"
"                                         prclsh_so_upd_qty,
"
"                                         prclsh_rework_qty,
"
"                                         prclsh_return_qty,
"
"                                         prclsh_tmp_rtn_qty,
"
"                                         prclsh_tmp_rwk_qty,
"
"                                         prclsh_rtn_inproc_qty,
"
"                                         prclsh_rwk_inproc_qty,
"
"                                         prclsh_prim_rej_qty,
"
"                                         prclsh_sec_rej_qty,
"
"                                         prclsh_apply_type,
"
"                                         prclsh_prim_rtnprcs_qty,
"
"                                         prclsh_prim_rtninprcs_qty,
"
"                                         prclsh_prim_ret_qty,
"
"                                         prclsh_sec_rtnprcs_qty,
"
"                                         prclsh_sec_rtninprcs_qty,
"
"                                         prclsh_sec_ret_qty,
"
"                                         prclsh_prim_rwk_inside,
"
"                                         prclsh_prim_rwk_outside,
"
"                                         prclsh_secon_rwk_inside,
"
"                                         prclsh_secon_rwk_outside,
"
"                                         prclsh_fa_inprcs_qty,
"
"                                         prclsh_fa_prcs_qty,
"
"                                         prclsh_fa_rcpt_qty,
"
"                                         prclsh_tg_inprcs_qty,
"
"                                         prclsh_tg_prcs_qty,
"
"                                         prclsh_tg_inv_qty,
"
"                                         prclsh_warr_date,
"
"                                         prclsh_cre_by,
"
"					 prclsh_cre_emp_id,
"
"					 prclsh_cre_ip_addr,
"
"					 prclsh_cre_os_user,
"
"                                         prclsh_cre_date,
"
"                                         prclsh_upd_by,
"
"					 prclsh_upd_emp_id,
"
"					 prclsh_upd_ip_addr,
"
"					 prclsh_upd_os_user,
"
"                                         prclsh_upd_date,
"
"                                         prclsh_rwk_flag,
"
"                                         prclsh_sys_ls_no,
"
"                                         prclsh_mfg_date,
"
"                                         prclsh_prim_rwk_is_inproc_qty,
"
"                                         prclsh_secon_rwk_is_inproc_qty,
"
"                                         prclsh_prim_rwk_os_inproc_qty,
"
"                                         prclsh_secon_rwk_os_inproc_qty,
"
"                                         prclsh_prim_is_rwk_qty,
"
"                                         prclsh_secon_is_rwk_qty,
"
"                                         prclsh_prim_os_rwk_qty,
"
"                                         prclsh_secon_os_rwk_qty,
"
"                                         prclsh_rec_pri_is_repair_qty,
"
"                                         prclsh_rec_pri_os_repair_qty,
"
"                                         prclsh_rec_pri_scrap_qty,
"
"                                         prclsh_rec_pri_dis_ass_qty,
"
"                                         prclsh_rec_pri_rtrn_qty,
"
"                                         prclsh_rec_sec_is_repair_qty,
"
"                                         prclsh_rec_sec_os_repair_qty,
"
"                                         prclsh_rec_sec_scrap_qty,
"
"                                         prclsh_rec_sec_dis_ass_qty,
"
"                                         prclsh_rec_sec_rtrn_qty,
"
"                                         prclsh_prim_rtn_suplr,
"
"                                         prclsh_sec_rtn_suplr,
"
"                                         prclsh_prim_rwk_suplr,
"
"                                         prclsh_sec_rwk_suplr,
"
"                                         prclsh_rwk_rtn_sel_flag,
"
"                                         prclsh_rwk_rtn_user,
"
"                                         prclsh_rwk_rtn_ref,
"
"                                         prclsh_route_card_no,
"
"                                         prclsh_sou_type,
"
"                                         prclsh_sou_id,
"
"                                         prclsh_old_ls_flag,
"
"                                         prclsh_old_ls_ref,
"
"                                         prclsh_aod_qty,
"
"                                         prclsh_tot_aod_qty,
"
"                                         prclsh_test_no,
"
"                                         prclsh_no_of_coils,
"
"                                         prclsh_heat_no,
"
"                                         prclsh_coil_gr_wgt,
"
"                                         prclsh_coil_tr_wgt,
"
"                                         prclsh_col_nt_wgt,
"
"                                         prclsh_press_mark_no,
"
"                                         prclsh_press_run_no,
"
"                                         prclsh_org_lot_no,
"
"					 prclsh_tdc,
"
"					 prclsh_uts,
"
"					 prclsh_ys,
"
"					 prclsh_hrb,
"
"					 prclsh_elo,
"
"					 prclsh_gsm,
"
"					 prclsh_passivation,
"
"					 prclsh_thickness,
"
"					 prclsh_width,
"
"					 prclsh_length,
"
"					 prclsh_temper,
"
"					 prclsh_coating,
"
"					 prclsh_yield_pct,
"
"					 prclsh_mix_lot_no,
"
"					 prclsh_test_cert_no,
"
"					 prclsh_noof_comp_per_sht,
"
"					 prclsh_wght_of_sht,
"
"					 prclsh_no_of_sht,
"
"					 prclsh_cost_of_sht,
"
"					 prclsh_no_of_output,
"
"					 prclsh_cut_blank_qty,
"
"					 prclsh_prod_outer_dia,
"
"					 prclsh_crate_id,
"
"					 prclsh_mix_id,
"
"					 prclsh_mix_rev,
"
"					 prclsh_remark,
"
"					 prclsh_stk_rcpt_qty,
"
"					 prclsh_stk_acpt_qty,
"
"					 prclsh_stk_aod_qty,
"
"					 prclsh_stk_rej_qty,
"
"					 prclsh_stk_prim_rej_qty,
"
"					 prclsh_stk_sec_rej_qty,
"
"					 prclsh_bak_qty,
"
"					 prclsh_stk_bak_qty,
"
"					 prclsh_tot_bak_qty,
"
"					 prclsh_tot_stk_acpt_qty,
"
"					 prclsh_tot_stk_aod_qty,
"
"					 prclsh_tot_stk_rej_qty,
"
"					 prclsh_tl_est_life,
"
"					 prclsh_powder_batch_no,
"
"					 prclsh_weld_wire_no
"
"					)
"
"    SELECT prcls_bu,
"
"	   prcls_doc_no,
"
"	   prcls_doc_seq_no,
"
"	   prcls_seq_no,
"
"	   prcls_lot_no,
"
"	   prcls_serial_no,
"
"	   prcls_lot_qty,
"
"	   prcls_qty_accepted,
"
"	   prcls_tot_accepted,
"
"	   prcls_tot_rejected,
"
"	   prcls_qty_rejected,
"
"	   prcls_expiry_date,
"
"	   prcls_type,
"
"	   prcls_accept_flag,
"
"	   prcls_status,
"
"	   prcls_so_upd_qty,
"
"	   prcls_rework_qty,
"
"	   prcls_return_qty,
"
"	   prcls_tmp_rtn_qty,
"
"	   prcls_tmp_rwk_qty,
"
"	   prcls_rtn_inproc_qty,
"
"	   prcls_rwk_inproc_qty,
"
"	   prcls_prim_rej_qty,
"
"	   prcls_sec_rej_qty,
"
"	   prcls_apply_type,
"
"	   prcls_prim_rtnprcs_qty,
"
"	   prcls_prim_rtninprcs_qty,
"
"	   prcls_prim_ret_qty,
"
"	   prcls_sec_rtnprcs_qty,
"
"	   prcls_sec_rtninprcs_qty,
"
"	   prcls_sec_ret_qty,
"
"	   prcls_prim_rwk_inside,
"
"	   prcls_prim_rwk_outside,
"
"	   prcls_secon_rwk_inside,
"
"	   prcls_secon_rwk_outside,
"
"	   prcls_fa_inprcs_qty,
"
"	   prcls_fa_prcs_qty,
"
"	   prcls_fa_rcpt_qty,
"
"	   prcls_tg_inprcs_qty,
"
"	   prcls_tg_prcs_qty,
"
"	   prcls_tg_inv_qty,
"
"	   prcls_warr_date,
"
"	   prcls_cre_by,
"
"	   prcls_cre_emp_id,
"
"	   prcls_cre_ip_addr,
"
"	   prcls_cre_os_user,
"
"	   prcls_cre_date,
"
"	   prcls_upd_by,
"
"	   prcls_upd_emp_id,
"
"	   prcls_upd_ip_addr,
"
"	   prcls_upd_os_user,
"
"	   prcls_upd_date,
"
"	   prcls_rwk_flag,
"
"	   prcls_sys_ls_no,
"
"	   prcls_mfg_date,
"
"	   prcls_prim_rwk_is_inproc_qty,
"
"	   prcls_secon_rwk_is_inproc_qty,
"
"	   prcls_prim_rwk_os_inproc_qty,
"
"	   prcls_secon_rwk_os_inproc_qty,
"
"	   prcls_prim_is_rwk_qty,
"
"	   prcls_secon_is_rwk_qty,
"
"	   prcls_prim_os_rwk_qty,
"
"	   prcls_secon_os_rwk_qty,
"
"	   prcls_rec_pri_is_repair_qty,
"
"	   prcls_rec_pri_os_repair_qty,
"
"	   prcls_rec_pri_scrap_qty,
"
"	   prcls_rec_pri_dis_ass_qty,
"
"	   prcls_rec_pri_rtrn_qty,
"
"	   prcls_rec_sec_is_repair_qty,
"
"	   prcls_rec_sec_os_repair_qty,
"
"	   prcls_rec_sec_scrap_qty,
"
"	   prcls_rec_sec_dis_ass_qty,
"
"	   prcls_rec_sec_rtrn_qty,
"
"	   prcls_prim_rtn_suplr,
"
"	   prcls_sec_rtn_suplr,
"
"	   prcls_prim_rwk_suplr,
"
"	   prcls_sec_rwk_suplr,
"
"	   prcls_rwk_rtn_sel_flag,
"
"	   prcls_rwk_rtn_user,
"
"	   prcls_rwk_rtn_ref,
"
"	   prcls_route_card_no,
"
"	   prcls_sou_type,
"
"	   prcls_sou_id,
"
"	   prcls_old_ls_flag,
"
"	   prcls_old_ls_ref,
"
"	   prcls_aod_qty,
"
"	   prcls_tot_aod_qty,
"
"	   prcls_test_no,
"
"	   prcls_no_of_coils,
"
"	   prcls_heat_no,
"
"	   prcls_coil_gr_wgt,
"
"	   prcls_coil_tr_wgt,
"
"	   prcls_col_nt_wgt,
"
"	   prcls_press_mark_no,
"
"	   prcls_press_run_no,
"
"	   prcls_org_lot_no,
"
"	   prcls_tdc,
"
"	   prcls_uts,
"
"	   prcls_ys,
"
"	   prcls_hrb,
"
"	   prcls_elo,
"
"	   prcls_gsm,
"
"	   prcls_passivation,
"
"           prcls_thickness,
"
"           prcls_width,
"
"           prcls_length,
"
"           prcls_temper,
"
"           prcls_coating,
"
"           prcls_yield_pct,
"
"	   prcls_mix_lot_no,
"
"	   prcls_test_cert_no,
"
"	   prcls_noof_comp_per_sht,
"
"	   prcls_wght_of_sht,
"
"	   prcls_no_of_sht,
"
"	   prcls_cost_of_sht,
"
"	   prcls_no_of_output,
"
"	   prcls_cut_blank_qty,
"
"	   prcls_prod_outer_dia,
"
"	   prcls_crate_id,
"
"	   prcls_mix_id,
"
"	   prcls_mix_rev,
"
"	   prcls_remark,
"
"	   prcls_stk_rcpt_qty,
"
"	   prcls_stk_acpt_qty,
"
"	   prcls_stk_aod_qty,
"
"	   prcls_stk_rej_qty,
"
"	   prcls_stk_prim_rej_qty,
"
"	   prcls_stk_sec_rej_qty,
"
"           prcls_bak_qty,
"
"           prcls_stk_bak_qty,
"
"           prcls_tot_bak_qty,
"
"	   prcls_tot_stk_acpt_qty,
"
"	   prcls_tot_stk_aod_qty,
"
"	   prcls_tot_stk_rej_qty,
"
"	   prcls_tl_est_life,
"
"	   prcls_powder_batch_no,
"
"	   prcls_weld_wire_no
"
"      FROM pur_rcpt_lot_serial
"
"     WHERE prcls_bu = p_bu
"
"       AND prcls_doc_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_rcpt_addr_hist(prah_bu,
"
"				   prah_rcpt_no,
"
"				   prah_shipfr_addr1,
"
"				   prah_shipfr_addr2,
"
"				   prah_shipfr_addr3,
"
"				   prah_shipfr_postal_code,
"
"				   prah_shipfr_city,
"
"				   prah_shipfr_state,
"
"				   prah_shipfr_state_code,
"
"				   prah_shipfr_cntry,
"
"				   prah_shipfr_tele1,
"
"				   prah_shipfr_fax1,
"
"				   prah_shipfr_email1,
"
"				   prah_shipfr_mobno,
"
"				   prah_shipfr_zip_code,
"
"				   prah_shipfr_gst_no,
"
"				   prah_billfr_addr1,
"
"				   prah_billfr_addr2,
"
"				   prah_billfr_addr3,
"
"				   prah_billfr_postal_code,
"
"				   prah_billfr_city,
"
"				   prah_billfr_state,
"
"				   prah_billfr_state_code,
"
"				   prah_billfr_cntry,
"
"				   prah_billfr_tele1,
"
"				   prah_billfr_fax1,
"
"				   prah_billfr_email1,
"
"				   prah_billfr_mobno,
"
"				   prah_billfr_zip_code,
"
"				   prah_billfr_gst_no,
"
"				   prah_billto_addr1,
"
"				   prah_billto_addr2,
"
"				   prah_billto_addr3,
"
"				   prah_billto_postal_code,
"
"				   prah_billto_tele1,
"
"				   prah_billto_fax1,
"
"				   prah_billto_email1,
"
"				   prah_billto_mobno,
"
"				   prah_billto_zip_code,
"
"				   prah_billto_city,
"
"				   prah_billto_state,
"
"				   prah_billto_state_code,
"
"				   prah_billto_cntry,
"
"				   prah_billto_gst_no,
"
"				   prah_shipto_addr1,
"
"				   prah_shipto_addr2,
"
"				   prah_shipto_addr3,
"
"				   prah_shipto_postal_code,
"
"				   prah_shipto_tele1,
"
"				   prah_shipto_fax1,
"
"				   prah_shipto_email1,
"
"				   prah_shipto_mobno,
"
"				   prah_shipto_zip_code,
"
"				   prah_shipto_city,
"
"				   prah_shipto_state,
"
"				   prah_shipto_state_code,
"
"				   prah_shipto_cntry,
"
"				   prah_shipto_gst_no,
"
"				   prah_cre_by,
"
"				   prah_cre_emp_id,
"
"				   prah_cre_ip_addr,
"
"				   prah_cre_os_user,
"
"				   prah_cre_date,
"
"				   prah_upd_by,
"
"				   prah_upd_emp_id,
"
"				   prah_upd_ip_addr,
"
"				   prah_upd_os_user,
"
"				   prah_upd_date
"
"				  )
"
"    SELECT pra_bu,
"
"	   pra_rcpt_no,
"
"	   pra_shipfr_addr1,
"
"	   pra_shipfr_addr2,
"
"	   pra_shipfr_addr3,
"
"	   pra_shipfr_postal_code,
"
"	   pra_shipfr_city,
"
"	   pra_shipfr_state,
"
"	   pra_shipfr_state_code,
"
"	   pra_shipfr_cntry,
"
"	   pra_shipfr_tele1,
"
"	   pra_shipfr_fax1,
"
"	   pra_shipfr_email1,
"
"	   pra_shipfr_mobno,
"
"	   pra_shipfr_zip_code,
"
"	   pra_shipfr_gst_no,
"
"	   pra_billfr_addr1,
"
"	   pra_billfr_addr2,
"
"	   pra_billfr_addr3,
"
"	   pra_billfr_postal_code,
"
"	   pra_billfr_city,
"
"	   pra_billfr_state,
"
"	   pra_billfr_state_code,
"
"	   pra_billfr_cntry,
"
"	   pra_billfr_tele1,
"
"	   pra_billfr_fax1,
"
"	   pra_billfr_email1,
"
"	   pra_billfr_mobno,
"
"	   pra_billfr_zip_code,
"
"	   pra_billfr_gst_no,
"
"	   pra_billto_addr1,
"
"	   pra_billto_addr2,
"
"	   pra_billto_addr3,
"
"	   pra_billto_postal_code,
"
"	   pra_billto_tele1,
"
"	   pra_billto_fax1,
"
"	   pra_billto_email1,
"
"	   pra_billto_mobno,
"
"	   pra_billto_zip_code,
"
"	   pra_billto_city,
"
"	   pra_billto_state,
"
"	   pra_billto_state_code,
"
"	   pra_billto_cntry,
"
"	   pra_billto_gst_no,
"
"	   pra_shipto_addr1,
"
"	   pra_shipto_addr2,
"
"	   pra_shipto_addr3,
"
"	   pra_shipto_postal_code,
"
"	   pra_shipto_tele1,
"
"	   pra_shipto_fax1,
"
"	   pra_shipto_email1,
"
"	   pra_shipto_mobno,
"
"	   pra_shipto_zip_code,
"
"	   pra_shipto_city,
"
"	   pra_shipto_state,
"
"	   pra_shipto_state_code,
"
"	   pra_shipto_cntry,
"
"	   pra_shipto_gst_no,
"
"	   pra_cre_by,
"
"	   pra_cre_emp_id,
"
"	   pra_cre_ip_addr,
"
"	   pra_cre_os_user,
"
"	   pra_cre_date,
"
"	   pra_upd_by,
"
"	   pra_upd_emp_id,
"
"	   pra_upd_ip_addr,
"
"	   pra_upd_os_user,
"
"	   pra_upd_date
"
"      FROM pur_rcpt_addr
"
"     WHERE pra_bu = p_bu
"
"       AND pra_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_rcpt_lot_serial
"
"     WHERE prcls_bu = p_bu
"
"       AND prcls_doc_no = p_rcpt_no;
"
"
"
"    DELETE FROM sub_contr_rcpt_process
"
"     WHERE scrp_bu = p_bu
"
"       AND scrp_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_receipt_lot
"
"     WHERE prlt_bu = p_bu
"
"       AND prlt_receipt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_ord_receipt_ln
"
"     WHERE porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_rcpt_addr
"
"     WHERE pra_bu = p_bu
"
"       AND pra_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_ord_receipt_hd
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_no = p_rcpt_no;
"
"
"
"  END proc_ins_grn_hist;
"
"
"
"  PROCEDURE proc_rev_grn_hist(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			      p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			      p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			     )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO pur_ord_receipt_hd(porh_bu,
"
"                                   porh_receipt_pfx,
"
"                                   porh_receipt_no,
"
"                                   porh_mode,
"
"                                   porh_suplr_id,
"
"                                   porh_receipt_type,
"
"                                   porh_order_pfx,
"
"                                   porh_order_no,
"
"                                   porh_receipt_date,
"
"                                   porh_year,
"
"                                   porh_period,
"
"                                   porh_currency,
"
"                                   porh_exchange_rate,
"
"                                   porh_status,
"
"                                   porh_dc_no,
"
"                                   porh_dc_date,
"
"                                   porh_inv_pfx,
"
"                                   porh_inv_no,
"
"                                   porh_inv_flag,
"
"                                   porh_inv_date,
"
"                                   porh_tax_flag,
"
"                                   porh_suplr_doc_date,
"
"                                   porh_suplr_doc_no,
"
"                                   porh_grn_date,
"
"                                   porh_type,
"
"                                   porh_gp_flag,
"
"                                   porh_gp_date,
"
"                                   porh_gate_doc_no,
"
"                                   porh_ge_chk_flag,
"
"                                   porh_lc_chk_flag,
"
"                                   porh_lc_chk_acc_flag,
"
"                                   porh_alloc_flag,
"
"                                   porh_plnt,
"
"                                   porh_user,
"
"                                   porh_inspn_flag,
"
"                                   porh_cre_by,
"
"				   porh_cre_emp_id,
"
"				   porh_cre_ip_addr,
"
"				   porh_cre_os_user,
"
"                                   porh_cre_date,
"
"                                   porh_upd_by,
"
"				   porh_upd_emp_id,
"
"				   porh_upd_ip_addr,
"
"				   porh_upd_os_user,
"
"                                   porh_upd_date,
"
"                                   porh_grn_type,
"
"                                   porh_shipvia_id,
"
"                                   porh_term_id,
"
"                                   porh_price_term,
"
"                                   porh_lcg_doc_type,
"
"                                   porh_lcg_base_flag,
"
"                                   porh_grn_source,
"
"                                   porh_ref_unit,
"
"                                   porh_jrnl_flag,
"
"                                   porh_indir_mvmt_flag,
"
"                                   porh_bol_date,
"
"                                   porh_fin_status,
"
"                                   porh_terr_id,
"
"                                   porh_ins_pay_flag,
"
"                                   porh_dc_cre_flag,
"
"                                   porh_dc_cre_user,
"
"                                   porh_out_dc_no,
"
"                                   porh_trans_no,
"
"                                   porh_narr1,
"
"                                   porh_so_ref,
"
"                                   porh_mov_to_fin_date,
"
"                                   porh_wvd_flag,
"
"                                   porh_rev_flag,
"
"                                   porh_suplr_edc_date,
"
"                                   porh_transp_id,
"
"                                   porh_suplr_bill_qty,
"
"                                   porh_diff_wvd_qty,
"
"                                   porh_allwd_wvd_qty,
"
"                                   porh_shrt_wvd_qty,
"
"                                   porh_frt_scope,
"
"                                   porh_frt_act,
"
"                                   porh_trns_suplr_id,
"
"                                   porh_trns_edd,
"
"                                   porh_delay_dm_flag,
"
"                                   porh_delay_dm_doc_pfx,
"
"                                   porh_delay_dm_doc_no,
"
"                                   porh_ar3a_no,
"
"                                   porh_jrnl_wn_ent_req_flag,
"
"                                   porh_rg23_type,
"
"                                   porh_veh_no,
"
"                                   porh_rcpt_rev_flag,
"
"                                   porh_gk_name,
"
"                                   porh_trip_sheet_no,
"
"                                   porh_sample_fin_rqrd_flag,
"
"                                   porh_corp_ord_type,
"
"                                   porh_driver_mob_no,
"
"                                   porh_driver_name,
"
"                                   porh_fin_flag,
"
"                                   porh_rnd_off,
"
"                                   porh_veh_in,
"
"                                   porh_for_type,
"
"                                   porh_pack_list_no,
"
"                                   porh_pack_list_date,
"
"                                   porh_weigh_bridge_wt,
"
"                                   porh_sc_proc_flag,
"
"                                   porh_gst_flag,
"
"                                   porh_net_wgt,
"
"                                   porh_gross_wgt,
"
"                                   porh_tare_wgt,
"
"                                   porh_clearn_bill_no,
"
"                                   porh_clearn_bill_date,
"
"                                   porh_trip_sht_no,
"
"                                   porh_trip_date,
"
"                                   porh_no_bundle,
"
"                                   porh_press_mark_no,
"
"                                   porh_press_run_no1_from,
"
"                                   porh_press_run_no1_to,
"
"                                   porh_press_run_no2_from,
"
"                                   porh_press_run_no2_to,
"
"                                   porh_courier_name,
"
"                                   porh_courier_docket_no,
"
"                                   porh_wb_ser_date,
"
"                                   porh_lr_no,
"
"                                   porh_wb_ser_no,
"
"                                   porh_spn_frght_amt,
"
"                                   porh_spn_frght_vou_pfx,
"
"                                   porh_spn_frght_vou_no,
"
"                                   porh_spn_frght_sel_flag,
"
"                                   porh_spn_frght_sel_user,
"
"				   porh_gst_type,
"
"				   porh_gstn_no,
"
"				   porh_inv_pack_list_no,
"
"				   porh_insurance_no,
"
"				   porh_engine_no,
"
"				   porh_chassis_no,
"
"				   porh_vessel_no,
"
"				   porh_bol_no,
"
"				   porh_lm_disc_amt,
"
"				   porh_rej_exists_flag,
"
"				   porh_rej_rtn_flag,
"
"				   porh_ewb_trnsp_mode,
"
"				   porh_ewb_trnsp_id,
"
"				   porh_ewb_trnsp_name,
"
"				   porh_ewb_trnsp_doc_date,
"
"				   porh_ewb_dist_km,
"
"				   porh_ewb_bill_no,
"
"				   porh_load_lc_flag,
"
"				   porh_lc_exmpt_flag,
"
"				   porh_brch_rcpt_flag,
"
"				   porh_plnt_loc_id,
"
"				   porh_tot_rcpt_amt,
"
"				   porh_lc_apport_basis,
"
"				   porh_rr_flag,
"
"				   porh_rr_no,
"
"				   porh_wf_status,
"
"				   porh_tolr_flag,
"
"				   porh_dflt_pay_thru,
"
"	                           porh_adv_lic1_doc_no,
"
"	                           porh_adv_lic1_adj_qty,
"
"	                           porh_adv_lic1_adj_amt,
"
"	                           porh_adv_lic2_doc_no,
"
"	                           porh_adv_lic2_adj_qty,
"
"	                           porh_adv_lic2_adj_amt,
"
"	                           porh_lc_tax_set_id,
"
"	                           porh_lc_inc_tax_flag,
"
"				   porh_custom_val,
"
"				   porh_vat_class,
"
"				   porh_vat_type,
"
"				   porh_pin_no,
"
"				   porh_rebate_dbn_flag,
"
"				   porh_qlty_incharge,
"
"				   porh_qlty_compl_date,
"
"	                           porh_vou_pfx,
"
"                                   porh_vou_no,
"
"                                   porh_spn_brkr_comm_basis,
"
"                                   porh_spn_brkr_comm_amt,
"
"                                   porh_spn_brkr_comm_payble,
"
"                                   porh_dflt_inv_pfx,
"
"                                   porh_cr_avl_flag,
"
"                                   porh_cr_avl_no,
"
"                                   porh_cr_avl_date,
"
"                                   porh_cr_avl_status,
"
"                                   porh_import_flag,
"
"                                   porh_vertical_type,
"
"                                   porh_src_bus_fun,
"
"                                   porh_cancel_reason,
"
"				   porh_cv_ins_pct,
"
"				   porh_form_a,
"
"				   porh_pre_appr_status,
"
"				   porh_proj_id,
"
"                                   porh_tcs_amt,
"
"                                   porh_org_cpy_flag,
"
"				   porh_shipto_type,
"
"				   porh_cust_id,
"
"				   porh_gst_clf_type,
"
"				   porh_plnt_loc_name,
"
"				   porh_csr_doc_no,
"
"				   porh_shipfr_loc_name,
"
"                                   porh_billfr_loc_name,
"
"                                   porh_billto_loc_name,
"
"                                   porh_shipto_loc_name,
"
"				   porh_billfr_clf_type,
"
"				   porh_chrg_apport_basis,
"
"				   porh_billto_gst_type,
"
"				   porh_ewb_bill_date
"
"				  )
"
"    SELECT porhh_bu,
"
"	   porhh_receipt_pfx,
"
"	   porhh_receipt_no,
"
"	   porhh_mode,
"
"	   porhh_suplr_id,
"
"	   porhh_receipt_type,
"
"	   porhh_order_pfx,
"
"	   porhh_order_no,
"
"	   porhh_receipt_date,
"
"	   porhh_year,
"
"	   porhh_period,
"
"	   porhh_currency,
"
"	   porhh_exchange_rate,
"
"	   porhh_status,
"
"	   porhh_dc_no,
"
"	   porhh_dc_date,
"
"	   porhh_inv_pfx,
"
"	   porhh_inv_no,
"
"	   porhh_inv_flag,
"
"	   porhh_inv_date,
"
"	   porhh_tax_flag,
"
"	   porhh_suplr_doc_date,
"
"	   porhh_suplr_doc_no,
"
"	   porhh_grn_date,
"
"	   porhh_type,
"
"	   porhh_gp_flag,
"
"	   porhh_gp_date,
"
"	   porhh_gate_doc_no,
"
"	   porhh_ge_chk_flag,
"
"	   porhh_lc_chk_flag,
"
"	   porhh_lc_chk_acc_flag,
"
"	   porhh_alloc_flag,
"
"	   porhh_plnt,
"
"	   porhh_user,
"
"	   porhh_inspn_flag,
"
"	   porhh_cre_by,
"
"	   porhh_cre_emp_id,
"
"	   porhh_cre_ip_addr,
"
"	   porhh_cre_os_user,
"
"	   porhh_cre_date,
"
"	   porhh_upd_by,
"
"	   porhh_upd_emp_id,
"
"	   porhh_upd_ip_addr,
"
"	   porhh_upd_os_user,
"
"	   porhh_upd_date,
"
"	   porhh_grn_type,
"
"	   porhh_shipvia_id,
"
"	   porhh_term_id,
"
"	   porhh_price_term,
"
"	   porhh_lcg_doc_type,
"
"	   porhh_lcg_base_flag,
"
"	   porhh_grn_source,
"
"	   porhh_ref_unit,
"
"	   porhh_jrnl_flag,
"
"	   porhh_indir_mvmt_flag,
"
"	   porhh_bol_date,
"
"	   porhh_fin_status,
"
"	   porhh_terr_id,
"
"	   porhh_ins_pay_flag,
"
"	   porhh_dc_cre_flag,
"
"	   porhh_dc_cre_user,
"
"	   porhh_out_dc_no,
"
"	   porhh_trans_no,
"
"	   porhh_narr1,
"
"	   porhh_so_ref,
"
"	   porhh_mov_to_fin_date,
"
"	   porhh_wvd_flag,
"
"	   porhh_rev_flag,
"
"	   porhh_suplr_edc_date,
"
"	   porhh_transp_id,
"
"	   porhh_suplr_bill_qty,
"
"	   porhh_diff_wvd_qty,
"
"	   porhh_allwd_wvd_qty,
"
"	   porhh_shrt_wvd_qty,
"
"	   porhh_frt_scope,
"
"	   porhh_frt_act,
"
"	   porhh_trns_suplr_id,
"
"	   porhh_trns_edd,
"
"	   porhh_delay_dm_flag,
"
"	   porhh_delay_dm_doc_pfx,
"
"	   porhh_delay_dm_doc_no,
"
"	   porhh_ar3a_no,
"
"	   porhh_jrnl_wn_ent_req_flag,
"
"	   porhh_rg23_type,
"
"	   porhh_veh_no,
"
"	   porhh_rcpt_rev_flag,
"
"	   porhh_gk_name,
"
"	   porhh_trip_sheet_no,
"
"	   porhh_sample_fin_rqrd_flag,
"
"	   porhh_corp_ord_type,
"
"	   porhh_driver_mob_no,
"
"	   porhh_driver_name,
"
"	   porhh_fin_flag,
"
"	   porhh_rnd_off,
"
"	   porhh_veh_in,
"
"	   porhh_for_type,
"
"	   porhh_pack_list_no,
"
"	   porhh_pack_list_date,
"
"	   porhh_weigh_bridge_wt,
"
"	   porhh_sc_proc_flag,
"
"	   porhh_gst_flag,
"
"	   porhh_net_wgt,
"
"	   porhh_gross_wgt,
"
"	   porhh_tare_wgt,
"
"	   porhh_clearn_bill_no,
"
"	   porhh_clearn_bill_date,
"
"	   porhh_trip_sht_no,
"
"	   porhh_trip_date,
"
"	   porhh_no_bundle,
"
"	   porhh_press_mark_no,
"
"	   porhh_press_run_no1_from,
"
"	   porhh_press_run_no1_to,
"
"	   porhh_press_run_no2_from,
"
"	   porhh_press_run_no2_to,
"
"	   porhh_courier_name,
"
"	   porhh_courier_docket_no,
"
"	   porhh_wb_ser_date,
"
"	   porhh_lr_no,
"
"	   porhh_wb_ser_no,
"
"	   porhh_spn_frght_amt,
"
"	   porhh_spn_frght_vou_pfx,
"
"	   porhh_spn_frght_vou_no,
"
"	   porhh_spn_frght_sel_flag,
"
"	   porhh_spn_frght_sel_user,
"
"	   porhh_gst_type,
"
"	   porhh_gstn_no,
"
"	   porhh_inv_pack_list_no,
"
"	   porhh_insurance_no,
"
"	   porhh_engine_no,
"
"	   porhh_chassis_no,
"
"	   porhh_vessel_no,
"
"	   porhh_bol_no,
"
"	   porhh_lm_disc_amt,
"
"	   porhh_rej_exists_flag,
"
"	   porhh_rej_rtn_flag,
"
"	   porhh_ewb_trnsp_mode,
"
"	   porhh_ewb_trnsp_id,
"
"	   porhh_ewb_trnsp_name,
"
"	   porhh_ewb_trnsp_doc_date,
"
"	   porhh_ewb_dist_km,
"
"	   porhh_ewb_bill_no,
"
"	   porhh_load_lc_flag,
"
"	   porhh_lc_exmpt_flag,
"
"	   porhh_brch_rcpt_flag,
"
"	   porhh_plnt_loc_id,
"
"	   porhh_tot_rcpt_amt,
"
"	   porhh_lc_apport_basis,
"
"	   porhh_rr_flag,
"
"	   porhh_rr_no,
"
"	   porhh_wf_status,
"
"	   porhh_tolr_flag,
"
"	   porhh_dflt_pay_thru,
"
"	   porhh_adv_lic1_doc_no,
"
"	   porhh_adv_lic1_adj_qty,
"
"	   porhh_adv_lic1_adj_amt,
"
"	   porhh_adv_lic2_doc_no,
"
"	   porhh_adv_lic2_adj_qty,
"
"	   porhh_adv_lic2_adj_amt,
"
"	   porhh_lc_tax_set_id,
"
"	   porhh_lc_inc_tax_flag,
"
"	   porhh_custom_val,
"
"	   porhh_vat_class,
"
"	   porhh_vat_type,
"
"	   porhh_pin_no,
"
"	   porhh_rebate_dbn_flag,
"
"	   porhh_qlty_incharge,
"
"	   porhh_qlty_compl_date,
"
"	   porhh_vou_pfx,
"
"           porhh_vou_no,
"
"           porhh_spn_brkr_comm_basis,
"
"           porhh_spn_brkr_comm_amt,
"
"           porhh_spn_brkr_comm_payble,
"
"           porhh_dflt_inv_pfx,
"
"           porhh_cr_avl_flag,
"
"           porhh_cr_avl_no,
"
"           porhh_cr_avl_date,
"
"           porhh_cr_avl_status,
"
"	   porhh_import_flag,
"
"	   porhh_vertical_type,
"
"	   porhh_src_bus_fun,
"
"	   porhh_cancel_reason,
"
"	   porhh_cv_ins_pct,
"
"	   porhh_form_a,
"
"	   porhh_pre_appr_status,
"
"	   porhh_proj_id,
"
"           porhh_tcs_amt,
"
"           porhh_org_cpy_flag,
"
"	   porhh_shipto_type,
"
"	   porhh_cust_id,
"
"	   porhh_gst_clf_type,
"
"	   porhh_plnt_loc_name,
"
"	   porhh_csr_doc_no,
"
"           porhh_shipfr_loc_name,
"
"	   porhh_billfr_loc_name,
"
"	   porhh_billto_loc_name,
"
"	   porhh_shipto_loc_name,
"
"	   porhh_billfr_clf_type,
"
"	   porhh_chrg_apport_basis,
"
"	   porhh_billto_gst_type,
"
"	   porhh_ewb_bill_date
"
"      FROM pur_ord_receipt_hd_hist
"
"     WHERE porhh_bu = p_bu
"
"       AND porhh_receipt_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_ord_receipt_ln(porl_bu,
"
"                                   porl_receipt_no,
"
"                                   porl_seq_no,
"
"                                   porl_po_type,
"
"				   porl_po_pfx,
"
"                                   porl_po_no,
"
"                                   porl_po_seq_no,
"
"                                   porl_po_sub_seq_no,
"
"                                   porl_sc_unit_cost,
"
"                                   porl_disc_pct,
"
"                                   porl_bc_land_cost,
"
"                                   porl_sc_chrg_amt,
"
"                                   porl_sc_non_chrg_amt,
"
"                                   porl_sc_lm_disc_amt,
"
"                                   porl_scon_mat_unit_cost,
"
"                                   porl_receipt_qty,
"
"                                   porl_accepted_qty,
"
"                                   porl_rejected_qty,
"
"                                   porl_qc_qty,
"
"                                   porl_rtnto_suplr_qty,
"
"                                   porl_inv_qty,
"
"                                   porl_rtnd_doc_qty,
"
"                                   porl_net_disc_flag,
"
"                                   porl_rev_cip_no,
"
"                                   porl_status,
"
"                                   porl_qc_sel_flag,
"
"                                   porl_qc_doc_no,
"
"                                   porl_qc_doc_pfx,
"
"                                   porl_accpt_rtnto_suplr_qty,
"
"                                   porl_bc_nchrg_land_cost,
"
"                                   porl_session_id,
"
"                                   porl_bom_no,
"
"                                   porl_plnt,
"
"                                   porl_storage_store_id,
"
"                                   porl_storage_store_name,
"
"                                   porl_stk_trn_so_pfx,
"
"                                   porl_stk_trn_so_no,
"
"                                   porl_stk_trn_inv_pfx,
"
"                                   porl_stk_trn_inv_no,
"
"                                   porl_tot_accepted_qty,
"
"                                   porl_tot_rejected_qty,
"
"                                   porl_conv_factor,
"
"                                   porl_lvl_prod_id,
"
"                                   porl_lvl_prod_rev,
"
"                                   porl_stock_receipt_qty,
"
"                                   porl_upd_ref2,
"
"                                   porl_upd_ref1,
"
"                                   porl_sc_suplr_flag,
"
"                                   porl_stk_upd_qty,
"
"                                   porl_so_qty,
"
"                                   porl_so_inv_qty,
"
"                                   porl_acc_value,
"
"                                   porl_tqm_rev,
"
"                                   porl_temp_inv_qty,
"
"                                   porl_temp_in_progress,
"
"                                   porl_so_upd_qty,
"
"                                   porl_rework_qty,
"
"                                   porl_inv_activity,
"
"                                   porl_dmi_doc_pfx,
"
"                                   porl_dmi_doc_no,
"
"                                   porl_tmp_rtn_qty,
"
"                                   porl_tmp_rwk_qty,
"
"                                   porl_sel_flag,
"
"                                   porl_excess_qty,
"
"                                   porl_stk_accepted_qty,
"
"                                   porl_stk_rejected_qty,
"
"                                   porl_excss_rtnto_suplr_qty,
"
"                                   porl_rtn_inproc_qty,
"
"                                   porl_rwk_inproc_qty,
"
"                                   porl_volume,
"
"                                   porl_prim_rej_qty,
"
"                                   porl_sec_rej_qty,
"
"                                   porl_cartons_nos,
"
"                                   porl_stk_trn_inv_seq_no,
"
"                                   porl_prim_rtnprcs_qty,
"
"                                   porl_prim_rtninprcs_qty,
"
"                                   porl_prim_ret_qty,
"
"                                   porl_sec_rtnprcs_qty,
"
"                                   porl_sec_rtninprcs_qty,
"
"                                   porl_sec_ret_qty,
"
"                                   porl_prim_ret_suplr,
"
"                                   porl_sec_ret_suplr,
"
"                                   porl_prim_rwk_inside,
"
"                                   porl_prim_rwk_outside,
"
"                                   porl_prim_rwk_supplier,
"
"                                   porl_secon_rwk_inside,
"
"                                   porl_secon_rwk_outside,
"
"                                   porl_secon_rwk_supplier,
"
"                                   porl_prim_rwk_in_proc_qty,
"
"                                   porl_secon_rwk_in_proc_qty,
"
"                                   porl_prim_rwk_qty,
"
"                                   porl_sec_rwk_qty,
"
"                                   porl_fa_inprcs_qty,
"
"                                   porl_fa_prcs_qty,
"
"                                   porl_fa_rcpt_qty,
"
"                                   porl_fa_sel_flag,
"
"                                   porl_tg_sel_flag,
"
"                                   porl_tg_inprcs_qty,
"
"                                   porl_tg_prcs_qty,
"
"                                   porl_tg_inv_qty,
"
"                                   porl_tg_cust_id,
"
"                                   porl_bc_oh_cost,
"
"                                   porl_sup_inproc_qty,
"
"                                   porl_sup_compl_qty,
"
"                                   porl_cre_by,
"
"				   porl_cre_emp_id,
"
"				   porl_cre_ip_addr,
"
"				   porl_cre_os_user,
"
"                                   porl_cre_date,
"
"                                   porl_upd_by,
"
"				   porl_upd_emp_id,
"
"				   porl_upd_ip_addr,
"
"				   porl_upd_os_user,
"
"                                   porl_upd_date,
"
"                                   porl_prod_id,
"
"                                   porl_prod_rev,
"
"                                   porl_prod_uom,
"
"                                   porl_suplr_uom,
"
"                                   porl_scrap_qty,
"
"                                   porl_tolr_qty,
"
"                                   porl_ss_doc_pfx,
"
"                                   porl_ss_doc_no,
"
"                                   porl_ss_seq_no,
"
"                                   porl_contr_pfx,
"
"                                   porl_contr_no,
"
"                                   porl_amd_no,
"
"                                   porl_prod_ord_no,
"
"                                   porl_sf_code,
"
"                                   porl_prod_desc1,
"
"                                   porl_amd_date,
"
"                                   porl_bom_avail_flag,
"
"                                   porl_excess_sel_flag,
"
"                                   porl_excess_inproc_qty,
"
"                                   porl_excess_proc_qty,
"
"                                   porl_ins_plan_no,
"
"                                   porl_ins_plan_rev,
"
"                                   porl_test_req_flag,
"
"                                   porl_cert_id,
"
"                                   porl_matl_type,
"
"                                   porl_tax_set_id,
"
"                                   porl_prim_rej_dm_qty,
"
"                                   porl_sec_rej_dm_qty,
"
"                                   porl_cls_id,
"
"                                   porl_po_unit_cost,
"
"                                   porl_buyer_id,
"
"                                   porl_sub_cls_id,
"
"                                   porl_sec_dm_proc_qty,
"
"                                   porl_sec_dm_flag,
"
"                                   porl_sec_dm_user,
"
"                                   porl_prim_dm_proc_qty,
"
"                                   porl_prim_dm_flag,
"
"                                   porl_prim_dm_user,
"
"                                   porl_receive_flag,
"
"                                   porl_receive_user,
"
"                                   porl_inv_proc_qty,
"
"                                   porl_tolr_pct,
"
"                                   porl_rcpt_tolr_qty,
"
"                                   porl_required_date,
"
"                                   porl_required_qty,
"
"                                   porl_promise_date,
"
"                                   porl_ss_sub_seq_no,
"
"                                   porl_prim_dm_inproc_qty,
"
"                                   porl_sec_dm_inproc_qty,
"
"                                   porl_prim_dmi_activity,
"
"                                   porl_sec_dmi_activity,
"
"                                   porl_prim_dmi_active_reason,
"
"                                   porl_sec_dmi_active_reason,
"
"                                   porl_work_ord_no,
"
"                                   porl_fa_flag,
"
"                                   porl_ref,
"
"                                   porl_trans_no,
"
"                                   porl_prim_no_action_qty,
"
"                                   porl_sec_no_action_qty,
"
"                                   porl_tcf_id,
"
"                                   porl_prod_ext_desc,
"
"                                   porl_disc_amt,
"
"                                   porl_ut_dc_flag,
"
"                                   porl_ge_doc_no,
"
"                                   porl_task_oprn_id,
"
"                                   porl_maint_flag,
"
"                                   porl_maint_user,
"
"                                   porl_comp_flag,
"
"                                   porl_drawing_no,
"
"                                   porl_drawing_rev,
"
"                                   porl_ap_lc_chrg_amt,
"
"                                   porl_upd_uc_ap_rq_flag,
"
"                                   porl_upd_uc_ap_fin_flag,
"
"                                   porl_wvd_flag,
"
"                                   porl_suplr_bill_qty,
"
"                                   porl_diff_qty,
"
"                                   porl_wvd_qty,
"
"                                   porl_suplr_wvd_qty,
"
"                                   porl_prim_incent_amt,
"
"                                   porl_sec_incent_amt,
"
"                                   porl_prov_acct_flag,
"
"                                   porl_prov_acct_user,
"
"                                   porl_inc_doc_no,
"
"                                   porl_spr_type,
"
"                                   porl_foc_flag,
"
"                                   porl_inv_sel_flag,
"
"                                   porl_ctn_req_flag,
"
"                                   porl_ctn_doc_no,
"
"                                   porl_ctn_sel_flag,
"
"                                   porl_ctn_sel_user,
"
"                                   porl_tar_sf_code,
"
"                                   porl_pr_pfx,
"
"                                   porl_pr_no,
"
"                                   porl_pr_seq_no,
"
"                                   porl_pr_sub_seq_no,
"
"                                   porl_po_date,
"
"                                   porl_delay_ncr_no,
"
"                                   porl_delay_ncr_cre_flag,
"
"                                   porl_rg23d_qty,
"
"                                   porl_rg23d_inproc_qty,
"
"                                   porl_rg23d_proc_qty,
"
"                                   porl_rg23d_sel_flag,
"
"                                   porl_rg23d_user,
"
"                                   porl_im_suplr_id,
"
"                                   porl_im_doc_no,
"
"                                   porl_im_sel_flag,
"
"                                   porl_im_sel_user,
"
"                                   porl_tax_acd_type,
"
"                                   porl_ge_seq_no,
"
"                                   porl_ge_sub_seq_no,
"
"                                   porl_rec_repair_qty,
"
"                                   porl_rec_rtrn_qty,
"
"                                   porl_frt_inproc_qty,
"
"                                   porl_frt_comp_qty,
"
"                                   porl_frt_sel_flag,
"
"                                   porl_frt_sel_user,
"
"                                   porl_frt_process_qty,
"
"                                   porl_prim_os_rwk_qty,
"
"                                   porl_secon_os_rwk_qty,
"
"                                   porl_prim_rwk_os_inproc_qty,
"
"                                   porl_secon_rwk_os_inproc_qty,
"
"                                   porl_sou_mat_weight,
"
"                                   porl_tar_mat_weight,
"
"                                   porl_plnd_scrap_weight,
"
"                                   porl_plnd_hr_unit,
"
"                                   porl_act_sou_mat_weight,
"
"                                   porl_act_tar_mat_weight,
"
"                                   porl_act_plnd_scrap_weight,
"
"                                   porl_act_plnd_hr_unit,
"
"                                   porl_dept_id,
"
"                                   porl_suplr_dc_inv_qty,
"
"                                   porl_idm_dc_doc_no,
"
"                                   porl_idm_dc_no,
"
"                                   porl_idm_dc_seq_no,
"
"                                   porl_dim_req_flag,
"
"                                   porl_thickness,
"
"                                   porl_length,
"
"                                   porl_width,
"
"                                   porl_so_type,
"
"                                   porl_so_pfx,
"
"                                   porl_so_no,
"
"                                   porl_so_seq_no,
"
"                                   porl_so_sub_seq_no,
"
"                                   porl_proj_id,
"
"                                   porl_task_id,
"
"                                   porl_vis_insp_flag,
"
"                                   porl_scr_qty,
"
"                                   porl_scr_inproc_qty,
"
"                                   porl_scr_recvd_qty,
"
"                                   porl_qty_in_nos,
"
"                                   porl_po_sys_ls_no,
"
"                                   porl_po_lot_no,
"
"                                   porl_po_ser_no,
"
"                                   porl_im_benf_type,
"
"                                   porl_aod_qty,
"
"                                   porl_stk_aod_qty,
"
"                                   porl_stk_prim_rej_qty,
"
"                                   porl_stk_sec_rej_qty,
"
"                                   porl_tot_aod_qty,
"
"                                   porl_rej_dm_flag,
"
"                                   porl_po_amd_no,
"
"                                   porl_cls_qty,
"
"                                   porl_rcpt_rev_flag,
"
"                                   porl_rwk_rtn_user,
"
"                                   porl_serv_prod_id,
"
"                                   porl_serv_io_type,
"
"                                   porl_amc_start_date,
"
"                                   porl_amc_end_date,
"
"                                   porl_dc_short_flag,
"
"                                   porl_cut_blank_qty,
"
"                                   porl_serv_prod_desc,
"
"                                   porl_scr_cls_short_qty,
"
"                                   porl_scr_sel_flag,
"
"                                   porl_scr_sel_user,
"
"                                   porl_scr_proc_qty,
"
"                                   porl_test_cert_no,
"
"                                   porl_cert_rcvd_flag,
"
"                                   porl_pack_mat_prod_id,
"
"                                   porl_pack_mat_prod_rev,
"
"                                   porl_pack_mat_qty,
"
"                                   porl_br_suplr_id,
"
"                                   porl_br_status,
"
"                                   porl_sou_po_plnt,
"
"                                   porl_install_req_flag,
"
"                                   porl_installed_flag,
"
"                                   porl_install_date,
"
"                                   porl_ins_sel_flag,
"
"                                   porl_ins_sel_user,
"
"                                   porl_pla_no,
"
"                                   porl_tool_wo_no,
"
"                                   porl_qty_phy_count_by,
"
"                                   porl_grn_cone_weight,
"
"                                   porl_grn_act_cone_weight,
"
"                                   porl_cone_ap_doc_pfx,
"
"                                   porl_cone_ap_doc_no,
"
"                                   porl_cone_inv_sel_flag,
"
"                                   porl_cone_wght_hdl_type,
"
"                                   porl_mov_ncr_doc_flag,
"
"                                   porl_rg23_no,
"
"                                   porl_scr_pct,
"
"                                   porl_act_scr_weight,
"
"                                   porl_alow_scr_qty,
"
"                                   porl_capex_bud_no,
"
"                                   porl_phy_cnt_qty,
"
"                                   porl_cone_dmi_cmpl_flag,
"
"                                   porl_qty_phy_count_by_name,
"
"                                   porl_fsi_flag,
"
"                                   porl_scr_dmi_qty,
"
"                                   porl_ls_uom_gen_type,
"
"                                   porl_so_schld_desc,
"
"                                   porl_tax_exc_reason,
"
"                                   porl_ctrl_set_no,
"
"                                   porl_spec_doc_no,
"
"                                   porl_spec_doc_rev,
"
"                                   porl_cap_asset_id,
"
"                                   porl_fa_type,
"
"                                   porl_qc_doc_date,
"
"                                   porl_grn_recv_date,
"
"                                   porl_hsn_code,
"
"                                   porl_no_of_bale,
"
"                                   porl_avg_bale_weight,
"
"                                   porl_allow_amt,
"
"                                   porl_gst_rev_tax_cat_id,
"
"                                   porl_catalog_no,
"
"                                   porl_mchn_id,
"
"                                   porl_sub_dept_id,
"
"                                   porl_sco_mtrl_rqrd_flag,
"
"                                   porl_std_cost,
"
"                                   porl_spn_ord_upd_flag,
"
"                                   porl_fcm_bl_id,
"
"                                   porl_fcm_proj_no,
"
"                                   porl_mftr_id,
"
"                                   porl_mftr_part_no,
"
"				   porl_category_id,
"
"				   porl_gst_exempt_flag,
"
"				   porl_tc_chrg_flag,
"
"				   porl_st_so_pfx,
"
"				   porl_st_so_no,
"
"				   porl_st_so_seq_no,
"
"				   porl_st_so_sub_seq_no,
"
"				   porl_st_cs_doc_no,
"
"				   porl_st_cs_doc_rev,
"
"				   porl_st_cs_schld_no,
"
"				   porl_buyer_emp_id,
"
"				   porl_cost_basis,
"
"				   porl_full_rej_acpt_flag,
"
"				   porl_cd_expmt_flag,
"
"				   porl_annex_no,
"
"				   porl_annex_date,
"
"				   porl_rebate_unit_cost,
"
"				   porl_rebate_prim_val,
"
"				   porl_rebate_cut_val,
"
"				   porl_bond_no,
"
"				   porl_fnl_disc_amt,
"
"				   porl_fnl_unit_disc_amt,
"
"				   porl_moist_pct,
"
"				   porl_wvd_basis,
"
"				   porl_wvd_shrt_type,
"
"				   porl_wvd_excs_type,
"
"				   porl_gross_amt,
"
"				   porl_tax_amt,
"
"				   porl_net_amt,
"
"				   porl_prod_cls_desc,
"
"				   porl_prod_subcls_desc,
"
"				   porl_prod_grp,
"
"				   porl_prod_grp_desc,
"
"				   porl_prod_subgrp,
"
"				   porl_prod_subgrp_desc,
"
"				   porl_custom_val,
"
"				   porl_hs_tariff_code,
"
"				   porl_suplr_bill_amt,
"
"				   porl_vat_exempt_flag,
"
"				   porl_bag_cost,
"
"				   porl_bag_chrg_amt,
"
"				   porl_no_of_pcs,
"
"				   porl_rebate_cost_type,
"
"				   porl_cash_disc_pct,
"
"				   porl_prod_outer_dia,
"
"				   porl_gst_input_type,
"
"				   porl_si_price,
"
"				   porl_st_inv_pfx,
"
"				   porl_st_inv_no,
"
"				   porl_st_inv_seq_no,
"
"				   porl_st_inv_bu,
"
"				   porl_st_inv_plnt,
"
"				   porl_cc_lvl1,
"
"				   porl_cc_lvl2,
"
"				   porl_cc_lvl3,
"
"				   porl_cc_lvl4,
"
"                                   porl_cc_prj_lvl,
"
"				   porl_boq_ref_no,
"
"				   porl_boq_seq_no,
"
"				   porl_boq_sub_seq_no,
"
"				   porl_boq_inproc_qty,
"
"				   porl_boq_comp_qty,
"
"				   porl_gst_rev_tax_cat,
"
"				   porl_gst_rev_tax_flag,
"
"				   porl_crate_sel_flag,
"
"                                   porl_crate_sel_user,
"
"                                   porl_crate_proc_qty,
"
"                                   porl_crate_iss_qty,
"
"				   porl_vehicle_no,
"
"				   porl_lc_rqrd_flag,
"
"				   porl_aen_type,
"
"				   porl_bak_qty,
"
"				   porl_stk_bak_qty,
"
"				   porl_tot_bak_qty,
"
"				   porl_no_of_bags,
"
"				   porl_delay_reason,
"
"				   porl_adv_lic_doc_no,
"
"				   porl_adv_lic_adj_qty,
"
"				   porl_adv_lic_adj_amt,
"
"	                           porl_dry_lr_pct,
"
"	                           porl_dry_qty_kgs,
"
"	                           porl_dry_fat_pct,
"
"	                           porl_dry_snf_pct,
"
"	                           porl_dry_fat_kgs,
"
"	                           porl_dry_snf_kgs,
"
"                                   porl_batch_no,
"
"                                   porl_expiry_date,
"
"                                   porl_mfg_date,
"
"				   porl_tcs_sec_id,
"
"				   porl_tcs_acces_val,
"
"				   porl_tcs_pct,
"
"				   porl_tcs_amt,
"
"				   porl_dc_no,
"
"				   porl_dc_doc_no,
"
"				   porl_dc_seq_no,
"
"				   porl_dc_proc_qty,
"
"				   porl_dc_cons_qty,
"
"				   porl_ins_policy_no,
"
"				   porl_iss_code,
"
"				   porl_unload_qty,
"
"				   porl_moist_qty,
"
"				   porl_shrt_qty,
"
"				   porl_shrt_amt,
"
"				   porl_adv_lic_no,
"
"				   porl_tot_stk_acpt_qty,
"
"				   porl_tot_stk_aod_qty,
"
"				   porl_tot_stk_rej_qty,
"
"				   porl_mill_suplr_name,
"
"				   porl_height,
"
"				   porl_inner_dia,
"
"				   porl_density,
"
"				   porl_pur_acct,
"
"				   porl_cc_code,
"
"				   porl_smpl_qty,
"
"				   porl_stk_smpl_qty,
"
"				   porl_tot_smpl_qty,
"
"				   porl_tot_stk_smpl_qty,
"
"				   porl_fab_item_type,
"
"				   porl_plnt_loc_id,
"
"				   porl_gla_fxd_flag,
"
"				   porl_cpc_fxd_flag,
"
"				   porl_st_oprn_ln_seq_no,
"
"				   porl_st_comp_oprn_id,
"
"				   porl_po_plnt,
"
"				   porl_po_plnt_loc_id,
"
"				   porl_sou_oprn_seq,
"
"				   porl_sou_proc_id,
"
"				   porl_tar_oprn_seq,
"
"				   porl_tar_proc_id,
"
"				   porl_asn_no,
"
"				   porl_ts_rate,
"
"				   porl_ts_rate_fr,
"
"				   porl_tax_pct,
"
"                                   porl_igst_amt,
"
"                                   porl_sgst_amt,
"
"                                   porl_cgst_amt,
"
"                                   porl_utgst_amt,
"
"                                   porl_cess_pct,
"
"                                   porl_cess_amt,
"
"				   porl_suplr_chrg_flag,
"
"				   porl_trd_disc_pct,
"
"                                   porl_trd_disc_amt,
"
"                                   porl_spl_disc_pct,
"
"                                   porl_spl_disc_amt,
"
"                                   porl_cash_disc_amt,
"
"				   porl_assbl_val,
"
"				   porl_trd_assbl_val,
"
"	                           porl_spl_assbl_val,
"
"                                   porl_cash_assbl_val,
"
"				   porl_rcm_flag,
"
"				   porl_rcm_cat_id,
"
"				   porl_ge_doc_date,
"
"				   porl_cess_rate,
"
"				   porl_warr_date,
"
"				   porl_kbl_dev_remark ,
"
"				   porl_chem_comp,
"
"				   porl_basis,
"
"				   porl_tool_wrk_ord_no
"
"                                  )
"
"    SELECT porlh_bu,
"
"	   porlh_receipt_no,
"
"	   porlh_seq_no,
"
"	   porlh_po_type,
"
"	   porlh_po_pfx,
"
"	   porlh_po_no,
"
"	   porlh_po_seq_no,
"
"	   porlh_po_sub_seq_no,
"
"	   porlh_sc_unit_cost,
"
"	   porlh_disc_pct,
"
"	   porlh_bc_land_cost,
"
"	   porlh_sc_chrg_amt,
"
"	   porlh_sc_non_chrg_amt,
"
"	   porlh_sc_lm_disc_amt,
"
"	   porlh_scon_mat_unit_cost,
"
"	   porlh_receipt_qty,
"
"	   porlh_accepted_qty,
"
"	   porlh_rejected_qty,
"
"	   porlh_qc_qty,
"
"	   porlh_rtnto_suplr_qty,
"
"	   porlh_inv_qty,
"
"	   porlh_rtnd_doc_qty,
"
"	   porlh_net_disc_flag,
"
"	   porlh_rev_cip_no,
"
"	   porlh_status,
"
"	   porlh_qc_sel_flag,
"
"	   porlh_qc_doc_no,
"
"	   porlh_qc_doc_pfx,
"
"	   porlh_accpt_rtnto_suplr_qty,
"
"	   porlh_bc_nchrg_land_cost,
"
"	   porlh_session_id,
"
"	   porlh_bom_no,
"
"	   porlh_plnt,
"
"	   porlh_storage_store_id,
"
"	   porlh_storage_store_name,
"
"	   porlh_stk_trn_so_pfx,
"
"	   porlh_stk_trn_so_no,
"
"	   porlh_stk_trn_inv_pfx,
"
"	   porlh_stk_trn_inv_no,
"
"	   porlh_tot_accepted_qty,
"
"	   porlh_tot_rejected_qty,
"
"	   porlh_conv_factor,
"
"	   porlh_lvl_prod_id,
"
"	   porlh_lvl_prod_rev,
"
"	   porlh_stock_receipt_qty,
"
"	   porlh_upd_ref2,
"
"	   porlh_upd_ref1,
"
"	   porlh_sc_suplr_flag,
"
"	   porlh_stk_upd_qty,
"
"	   porlh_so_qty,
"
"	   porlh_so_inv_qty,
"
"	   porlh_acc_value,
"
"	   porlh_tqm_rev,
"
"	   porlh_temp_inv_qty,
"
"	   porlh_temp_in_progress,
"
"	   porlh_so_upd_qty,
"
"	   porlh_rework_qty,
"
"	   porlh_inv_activity,
"
"	   porlh_dmi_doc_pfx,
"
"	   porlh_dmi_doc_no,
"
"	   porlh_tmp_rtn_qty,
"
"	   porlh_tmp_rwk_qty,
"
"	   porlh_sel_flag,
"
"	   porlh_excess_qty,
"
"	   porlh_stk_accepted_qty,
"
"	   porlh_stk_rejected_qty,
"
"	   porlh_excss_rtnto_suplr_qty,
"
"	   porlh_rtn_inproc_qty,
"
"	   porlh_rwk_inproc_qty,
"
"	   porlh_volume,
"
"	   porlh_prim_rej_qty,
"
"	   porlh_sec_rej_qty,
"
"	   porlh_cartons_nos,
"
"	   porlh_stk_trn_inv_seq_no,
"
"	   porlh_prim_rtnprcs_qty,
"
"	   porlh_prim_rtninprcs_qty,
"
"	   porlh_prim_ret_qty,
"
"	   porlh_sec_rtnprcs_qty,
"
"	   porlh_sec_rtninprcs_qty,
"
"	   porlh_sec_ret_qty,
"
"	   porlh_prim_ret_suplr,
"
"	   porlh_sec_ret_suplr,
"
"	   porlh_prim_rwk_inside,
"
"	   porlh_prim_rwk_outside,
"
"	   porlh_prim_rwk_supplier,
"
"	   porlh_secon_rwk_inside,
"
"	   porlh_secon_rwk_outside,
"
"	   porlh_secon_rwk_supplier,
"
"	   porlh_prim_rwk_in_proc_qty,
"
"	   porlh_secon_rwk_in_proc_qty,
"
"	   porlh_prim_rwk_qty,
"
"	   porlh_sec_rwk_qty,
"
"	   porlh_fa_inprcs_qty,
"
"	   porlh_fa_prcs_qty,
"
"	   porlh_fa_rcpt_qty,
"
"	   porlh_fa_sel_flag,
"
"	   porlh_tg_sel_flag,
"
"	   porlh_tg_inprcs_qty,
"
"	   porlh_tg_prcs_qty,
"
"	   porlh_tg_inv_qty,
"
"	   porlh_tg_cust_id,
"
"	   porlh_bc_oh_cost,
"
"	   porlh_sup_inproc_qty,
"
"	   porlh_sup_compl_qty,
"
"	   porlh_cre_by,
"
"	   porlh_cre_emp_id,
"
"	   porlh_cre_ip_addr,
"
"	   porlh_cre_os_user,
"
"	   porlh_cre_date,
"
"	   porlh_upd_by,
"
"	   porlh_upd_emp_id,
"
"	   porlh_upd_ip_addr,
"
"	   porlh_upd_os_user,
"
"	   porlh_upd_date,
"
"	   porlh_prod_id,
"
"	   porlh_prod_rev,
"
"	   porlh_prod_uom,
"
"	   porlh_suplr_uom,
"
"	   porlh_scrap_qty,
"
"	   porlh_tolr_qty,
"
"	   porlh_ss_doc_pfx,
"
"	   porlh_ss_doc_no,
"
"	   porlh_ss_seq_no,
"
"	   porlh_contr_pfx,
"
"	   porlh_contr_no,
"
"	   porlh_amd_no,
"
"	   porlh_prod_ord_no,
"
"	   porlh_sf_code,
"
"	   porlh_prod_desc1,
"
"	   porlh_amd_date,
"
"	   porlh_bom_avail_flag,
"
"	   porlh_excess_sel_flag,
"
"	   porlh_excess_inproc_qty,
"
"	   porlh_excess_proc_qty,
"
"	   porlh_ins_plan_no,
"
"	   porlh_ins_plan_rev,
"
"	   porlh_test_req_flag,
"
"	   porlh_cert_id,
"
"	   porlh_matl_type,
"
"	   porlh_tax_set_id,
"
"	   porlh_prim_rej_dm_qty,
"
"	   porlh_sec_rej_dm_qty,
"
"	   porlh_cls_id,
"
"	   porlh_po_unit_cost,
"
"	   porlh_buyer_id,
"
"	   porlh_sub_cls_id,
"
"	   porlh_sec_dm_proc_qty,
"
"	   porlh_sec_dm_flag,
"
"	   porlh_sec_dm_user,
"
"	   porlh_prim_dm_proc_qty,
"
"	   porlh_prim_dm_flag,
"
"	   porlh_prim_dm_user,
"
"	   porlh_receive_flag,
"
"	   porlh_receive_user,
"
"	   porlh_inv_proc_qty,
"
"	   porlh_tolr_pct,
"
"	   porlh_rcpt_tolr_qty,
"
"	   porlh_required_date,
"
"	   porlh_required_qty,
"
"	   porlh_promise_date,
"
"	   porlh_ss_sub_seq_no,
"
"	   porlh_prim_dm_inproc_qty,
"
"	   porlh_sec_dm_inproc_qty,
"
"	   porlh_prim_dmi_activity,
"
"	   porlh_sec_dmi_activity,
"
"	   porlh_prim_dmi_active_reason,
"
"	   porlh_sec_dmi_active_reason,
"
"	   porlh_work_ord_no,
"
"	   porlh_fa_flag,
"
"	   porlh_ref,
"
"	   porlh_trans_no,
"
"	   porlh_prim_no_action_qty,
"
"	   porlh_sec_no_action_qty,
"
"	   porlh_tcf_id,
"
"	   porlh_prod_ext_desc,
"
"	   porlh_disc_amt,
"
"	   porlh_ut_dc_flag,
"
"	   porlh_ge_doc_no,
"
"	   porlh_task_oprn_id,
"
"	   porlh_maint_flag,
"
"	   porlh_maint_user,
"
"	   porlh_comp_flag,
"
"	   porlh_drawing_no,
"
"	   porlh_drawing_rev,
"
"	   porlh_ap_lc_chrg_amt,
"
"	   porlh_upd_uc_ap_rq_flag,
"
"	   porlh_upd_uc_ap_fin_flag,
"
"	   porlh_wvd_flag,
"
"	   porlh_suplr_bill_qty,
"
"	   porlh_diff_qty,
"
"	   porlh_wvd_qty,
"
"	   porlh_suplr_wvd_qty,
"
"	   porlh_prim_incent_amt,
"
"	   porlh_sec_incent_amt,
"
"	   porlh_prov_acct_flag,
"
"	   porlh_prov_acct_user,
"
"	   porlh_inc_doc_no,
"
"	   porlh_spr_type,
"
"	   porlh_foc_flag,
"
"	   porlh_inv_sel_flag,
"
"	   porlh_ctn_req_flag,
"
"	   porlh_ctn_doc_no,
"
"	   porlh_ctn_sel_flag,
"
"	   porlh_ctn_sel_user,
"
"	   porlh_tar_sf_code,
"
"	   porlh_pr_pfx,
"
"	   porlh_pr_no,
"
"	   porlh_pr_seq_no,
"
"	   porlh_pr_sub_seq_no,
"
"	   porlh_po_date,
"
"	   porlh_delay_ncr_no,
"
"	   porlh_delay_ncr_cre_flag,
"
"	   porlh_rg23d_qty,
"
"	   porlh_rg23d_inproc_qty,
"
"	   porlh_rg23d_proc_qty,
"
"	   porlh_rg23d_sel_flag,
"
"	   porlh_rg23d_user,
"
"	   porlh_im_suplr_id,
"
"	   porlh_im_doc_no,
"
"	   porlh_im_sel_flag,
"
"	   porlh_im_sel_user,
"
"	   porlh_tax_acd_type,
"
"	   porlh_ge_seq_no,
"
"	   porlh_ge_sub_seq_no,
"
"	   porlh_rec_repair_qty,
"
"	   porlh_rec_rtrn_qty,
"
"	   porlh_frt_inproc_qty,
"
"	   porlh_frt_comp_qty,
"
"	   porlh_frt_sel_flag,
"
"	   porlh_frt_sel_user,
"
"	   porlh_frt_process_qty,
"
"	   porlh_prim_os_rwk_qty,
"
"	   porlh_secon_os_rwk_qty,
"
"	   porlh_prim_rwk_os_inproc_qty,
"
"	   porlh_secon_rwk_os_inproc_qty,
"
"	   porlh_sou_mat_weight,
"
"	   porlh_tar_mat_weight,
"
"	   porlh_plnd_scrap_weight,
"
"	   porlh_plnd_hr_unit,
"
"	   porlh_act_sou_mat_weight,
"
"	   porlh_act_tar_mat_weight,
"
"	   porlh_act_plnd_scrap_weight,
"
"	   porlh_act_plnd_hr_unit,
"
"	   porlh_dept_id,
"
"	   porlh_suplr_dc_inv_qty,
"
"	   porlh_idm_dc_doc_no,
"
"	   porlh_idm_dc_no,
"
"	   porlh_idm_dc_seq_no,
"
"	   porlh_dim_req_flag,
"
"	   porlh_thickness,
"
"	   porlh_length,
"
"	   porlh_width,
"
"	   porlh_so_type,
"
"	   porlh_so_pfx,
"
"	   porlh_so_no,
"
"	   porlh_so_seq_no,
"
"	   porlh_so_sub_seq_no,
"
"	   porlh_proj_id,
"
"	   porlh_task_id,
"
"	   porlh_vis_insp_flag,
"
"	   porlh_scr_qty,
"
"	   porlh_scr_inproc_qty,
"
"	   porlh_scr_recvd_qty,
"
"	   porlh_qty_in_nos,
"
"	   porlh_po_sys_ls_no,
"
"	   porlh_po_lot_no,
"
"	   porlh_po_ser_no,
"
"	   porlh_im_benf_type,
"
"	   porlh_aod_qty,
"
"	   porlh_stk_aod_qty,
"
"	   porlh_stk_prim_rej_qty,
"
"	   porlh_stk_sec_rej_qty,
"
"	   porlh_tot_aod_qty,
"
"	   porlh_rej_dm_flag,
"
"	   porlh_po_amd_no,
"
"	   porlh_cls_qty,
"
"	   porlh_rcpt_rev_flag,
"
"	   porlh_rwk_rtn_user,
"
"	   porlh_serv_prod_id,
"
"	   porlh_serv_io_type,
"
"	   porlh_amc_start_date,
"
"	   porlh_amc_end_date,
"
"	   porlh_dc_short_flag,
"
"	   porlh_cut_blank_qty,
"
"	   porlh_serv_prod_desc,
"
"	   porlh_scr_cls_short_qty,
"
"	   porlh_scr_sel_flag,
"
"	   porlh_scr_sel_user,
"
"	   porlh_scr_proc_qty,
"
"	   porlh_test_cert_no,
"
"	   porlh_cert_rcvd_flag,
"
"	   porlh_pack_mat_prod_id,
"
"	   porlh_pack_mat_prod_rev,
"
"	   porlh_pack_mat_qty,
"
"	   porlh_br_suplr_id,
"
"	   porlh_br_status,
"
"	   porlh_sou_po_plnt,
"
"	   porlh_install_req_flag,
"
"	   porlh_installed_flag,
"
"	   porlh_install_date,
"
"	   porlh_ins_sel_flag,
"
"	   porlh_ins_sel_user,
"
"	   porlh_pla_no,
"
"	   porlh_tool_wo_no,
"
"	   porlh_qty_phy_count_by,
"
"	   porlh_grn_cone_weight,
"
"	   porlh_grn_act_cone_weight,
"
"	   porlh_cone_ap_doc_pfx,
"
"	   porlh_cone_ap_doc_no,
"
"	   porlh_cone_inv_sel_flag,
"
"	   porlh_cone_wght_hdl_type,
"
"	   porlh_mov_ncr_doc_flag,
"
"	   porlh_rg23_no,
"
"	   porlh_scr_pct,
"
"	   porlh_act_scr_weight,
"
"	   porlh_alow_scr_qty,
"
"	   porlh_capex_bud_no,
"
"	   porlh_phy_cnt_qty,
"
"	   porlh_cone_dmi_cmpl_flag,
"
"	   porlh_qty_phy_count_by_name,
"
"	   porlh_fsi_flag,
"
"	   porlh_scr_dmi_qty,
"
"	   porlh_ls_uom_gen_type,
"
"	   porlh_so_schld_desc,
"
"	   porlh_tax_exc_reason,
"
"	   porlh_ctrl_set_no,
"
"	   porlh_spec_doc_no,
"
"	   porlh_spec_doc_rev,
"
"	   porlh_cap_asset_id,
"
"	   porlh_fa_type,
"
"	   porlh_qc_doc_date,
"
"	   porlh_grn_recv_date,
"
"	   porlh_hsn_code,
"
"	   porlh_no_of_bale,
"
"	   porlh_avg_bale_weight,
"
"	   porlh_allow_amt,
"
"	   porlh_gst_rev_tax_cat_id,
"
"	   porlh_catalog_no,
"
"	   porlh_mchn_id,
"
"	   porlh_sub_dept_id,
"
"	   porlh_sco_mtrl_rqrd_flag,
"
"	   porlh_std_cost,
"
"	   porlh_spn_ord_upd_flag,
"
"	   porlh_fcm_bl_id,
"
"	   porlh_fcm_proj_no,
"
"	   porlh_mftr_id,
"
"	   porlh_mftr_part_no,
"
"	   porlh_category_id,
"
"	   porlh_gst_exempt_flag,
"
"	   porlh_tc_chrg_flag,
"
"	   porlh_st_so_pfx,
"
"	   porlh_st_so_no,
"
"	   porlh_st_so_seq_no,
"
"	   porlh_st_so_sub_seq_no,
"
"	   porlh_st_cs_doc_no,
"
"	   porlh_st_cs_doc_rev,
"
"	   porlh_st_cs_schld_no,
"
"	   porlh_buyer_emp_id,
"
"	   porlh_cost_basis,
"
"	   porlh_full_rej_acpt_flag,
"
"	   porlh_cd_expmt_flag,
"
"	   porlh_annex_no,
"
"	   porlh_annex_date,
"
"	   porlh_rebate_unit_cost,
"
"	   porlh_rebate_prim_val,
"
"	   porlh_rebate_cut_val,
"
"	   porlh_bond_no,
"
"	   porlh_fnl_disc_amt,
"
"	   porlh_fnl_unit_disc_amt,
"
"	   porlh_moist_pct,
"
"	   porlh_wvd_basis,
"
"	   porlh_wvd_shrt_type,
"
"	   porlh_wvd_excs_type,
"
"	   porlh_gross_amt,
"
"	   porlh_tax_amt,
"
"	   porlh_net_amt,
"
"	   porlh_prod_cls_desc,
"
"	   porlh_prod_subcls_desc,
"
"	   porlh_prod_grp,
"
"	   porlh_prod_grp_desc,
"
"	   porlh_prod_subgrp,
"
"	   porlh_prod_subgrp_desc,
"
"	   porlh_custom_val,
"
"	   porlh_hs_tariff_code,
"
"	   porlh_suplr_bill_amt,
"
"	   porlh_vat_exempt_flag,
"
"	   porlh_bag_cost,
"
"           porlh_bag_chrg_amt,
"
"	   porlh_no_of_pcs,
"
"	   porlh_rebate_cost_type,
"
"	   porlh_cash_disc_pct,
"
"	   porlh_prod_outer_dia,
"
"	   porlh_gst_input_type,
"
"	   porlh_si_price,
"
"	   porlh_st_inv_pfx,
"
"	   porlh_st_inv_no,
"
"	   porlh_st_inv_seq_no,
"
"	   porlh_st_inv_bu,
"
"	   porlh_st_inv_plnt,
"
"	   porlh_cc_lvl1,
"
"	   porlh_cc_lvl2,
"
"	   porlh_cc_lvl3,
"
"	   porlh_cc_lvl4,
"
"           porlh_cc_prj_lvl,
"
"	   porlh_boq_ref_no,
"
"	   porlh_boq_seq_no,
"
"	   porlh_boq_sub_seq_no,
"
"	   porlh_boq_inproc_qty,
"
"	   porlh_boq_comp_qty,
"
"	   porlh_gst_rev_tax_cat,
"
"           porlh_gst_rev_tax_flag,
"
"	   porlh_crate_sel_flag,
"
"           porlh_crate_sel_user,
"
"           porlh_crate_proc_qty,
"
"           porlh_crate_iss_qty,
"
"	   porlh_vehicle_no,
"
"	   porlh_lc_rqrd_flag,
"
"	   porlh_aen_type,
"
"	   porlh_bak_qty,
"
"	   porlh_stk_bak_qty,
"
"	   porlh_tot_bak_qty,
"
"	   porlh_no_of_bags,
"
"	   porlh_delay_reason,
"
"	   porlh_adv_lic_doc_no,
"
"	   porlh_adv_lic_adj_qty,
"
"	   porlh_adv_lic_adj_amt,
"
"	   porlh_dry_lr_pct,
"
"	   porlh_dry_qty_kgs,
"
"	   porlh_dry_fat_pct,
"
"	   porlh_dry_snf_pct,
"
"	   porlh_dry_fat_kgs,
"
"	   porlh_dry_snf_kgs,
"
"           porlh_batch_no,
"
"           porlh_expiry_date,
"
"           porlh_mfg_date,
"
"	   porlh_tcs_sec_id,
"
"	   porlh_tcs_acces_val,
"
"	   porlh_tcs_pct,
"
"	   porlh_tcs_amt,
"
"	   porlh_dc_no,
"
"           porlh_dc_doc_no,
"
"           porlh_dc_seq_no,
"
"           porlh_dc_proc_qty,
"
"           porlh_dc_cons_qty,
"
"           porlh_ins_policy_no,
"
"	   porlh_iss_code,
"
"	   porlh_unload_qty,
"
"	   porlh_moist_qty,
"
"	   porlh_shrt_qty,
"
"	   porlh_shrt_amt,
"
"	   porlh_adv_lic_no,
"
"	   porlh_tot_stk_acpt_qty,
"
"	   porlh_tot_stk_aod_qty,
"
"	   porlh_tot_stk_rej_qty,
"
"	   porlh_mill_suplr_name,
"
"	   porlh_height,
"
"	   porlh_inner_dia,
"
"	   porlh_density,
"
"	   porlh_pur_acct,
"
"	   porlh_cc_code,
"
"	   porlh_smpl_qty,
"
"	   porlh_stk_smpl_qty,
"
"	   porlh_tot_smpl_qty,
"
"	   porlh_tot_stk_smpl_qty,
"
"	   porlh_fab_item_type,
"
"	   porlh_plnt_loc_id,
"
"	   porlh_gla_fxd_flag,
"
"	   porlh_cpc_fxd_flag,
"
"	   porlh_st_oprn_ln_seq_no,
"
"	   porlh_st_comp_oprn_id,
"
"	   porlh_po_plnt,
"
"	   porlh_po_plnt_loc_id,
"
"	   porlh_sou_oprn_seq,
"
"	   porlh_sou_proc_id,
"
"	   porlh_tar_oprn_seq,
"
"	   porlh_tar_proc_id,
"
"	   porlh_asn_no,
"
"	   porlh_ts_rate,
"
"	   porlh_ts_rate_fr,
"
"	   porlh_tax_pct,
"
"           porlh_igst_amt,
"
"           porlh_sgst_amt,
"
"           porlh_cgst_amt,
"
"           porlh_utgst_amt,
"
"           porlh_cess_pct,
"
"           porlh_cess_amt,
"
"	   porlh_suplr_chrg_flag,
"
"	   porlh_trd_disc_pct,
"
"           porlh_trd_disc_amt,
"
"           porlh_spl_disc_pct,
"
"           porlh_spl_disc_amt,
"
"           porlh_cash_disc_amt,
"
"           porlh_assbl_val,
"
"	   porlh_trd_assbl_val,
"
"	   porlh_spl_assbl_val,
"
"           porlh_cash_assbl_val,
"
"	   porlh_rcm_flag,
"
"	   porlh_rcm_cat_id,
"
"	   porlh_ge_doc_date,
"
"	   porlh_cess_rate,
"
"	   porlh_warr_date,
"
"	   porlh_kbl_dev_remark ,
"
"	   porlh_chem_comp,
"
"	   porlh_basis,
"
"	   porlh_tool_wrk_ord_no
"
"      FROM pur_ord_receipt_ln_hist
"
"     WHERE porlh_bu = p_bu
"
"       AND porlh_receipt_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_rcpt_land_costs(prlc_bu,
"
"                                    prlc_rcpt_no,
"
"                                    prlc_seq_no,
"
"				    prlc_tc_type,
"
"                                    prlc_tc_id,
"
"				    prlc_tc_rev,
"
"                                    prlc_assbl_val,
"
"                                    prlc_tc_pct,
"
"                                    prlc_tc_amt,
"
"                                    prlc_suplr_id,
"
"                                    prlc_chrg_flag,
"
"                                    prlc_ref_no,
"
"                                    prlc_ref_date,
"
"                                    prlc_doc_pfx,
"
"                                    prlc_doc_no,
"
"                                    prlc_sel_flag,
"
"                                    prlc_sel_user,
"
"                                    prlc_pts_flag,
"
"                                    prlc_type,
"
"                                    prlc_pur_acct,
"
"                                    prlc_offset_acct,
"
"                                    prlc_hsn_code,
"
"                                    prlc_cre_by,
"
"				    prlc_cre_emp_id,
"
"				    prlc_cre_ip_addr,
"
"				    prlc_cre_os_user,
"
"                                    prlc_cre_date,
"
"                                    prlc_upd_by,
"
"				    prlc_upd_emp_id,
"
"				    prlc_upd_ip_addr,
"
"				    prlc_upd_os_user,
"
"                                    prlc_upd_date,
"
"				    prlc_suplr_doc_no,
"
"				    prlc_suplr_doc_date,
"
"				    prlc_rec_source,
"
"				    prlc_meis_doc_no,
"
"				    prlc_meis_lic_no,
"
"                                    prlc_bt_doc_pfx,
"
"                                    prlc_bt_doc_no,
"
"                                    prlc_bt_doc_seq_no,
"
"				    prlc_currency,
"
"				    prlc_exchange_rate,
"
"				    prlc_tax_type,
"
"				    prlc_sub_seq_no,
"
"				    prlc_annex_no,
"
"				    prlc_annex_date,
"
"				    prlc_po_pfx,
"
"				    prlc_po_no,
"
"				    prlc_po_seq_no,
"
"				    prlc_igst_pct,
"
"                                    prlc_igst_amt,
"
"                                    prlc_cgst_pct,
"
"                                    prlc_cgst_amt,
"
"                                    prlc_sgst_pct,
"
"                                    prlc_sgst_amt,
"
"				    prlc_utgst_pct,
"
"				    prlc_utgst_amt,
"
"				    prlc_cess_pct,
"
"				    prlc_cess_amt,
"
"				    prlc_gst_type,
"
"				    prlc_gst_clf_type,
"
"				    prlc_billfr_loc,
"
"				    prlc_gst_exempt_type
"
"				   )
"
"    SELECT prlch_bu,
"
"           prlch_rcpt_no,
"
"           prlch_seq_no,
"
"	   prlch_tc_type,
"
"           prlch_tc_id,
"
"	   prlch_tc_rev,
"
"           prlch_assbl_val,
"
"           prlch_tc_pct,
"
"           prlch_tc_amt,
"
"           prlch_suplr_id,
"
"           prlch_chrg_flag,
"
"           prlch_ref_no,
"
"           prlch_ref_date,
"
"           prlch_doc_pfx,
"
"           prlch_doc_no,
"
"           prlch_sel_flag,
"
"           prlch_sel_user,
"
"           prlch_pts_flag,
"
"           prlch_type,
"
"           prlch_pur_acct,
"
"           prlch_offset_acct,
"
"           prlch_hsn_code,
"
"           prlch_cre_by,
"
"	   prlch_cre_emp_id,
"
"	   prlch_cre_ip_addr,
"
"	   prlch_cre_os_user,
"
"           prlch_cre_date,
"
"           prlch_upd_by,
"
"	   prlch_upd_emp_id,
"
"	   prlch_upd_ip_addr,
"
"	   prlch_upd_os_user,
"
"           prlch_upd_date,
"
"	   prlch_suplr_doc_no,
"
"	   prlch_suplr_doc_date,
"
"	   prlch_rec_source,
"
"	   prlch_meis_doc_no,
"
"           prlch_meis_lic_no,
"
"           prlch_bt_doc_pfx,
"
"           prlch_bt_doc_no,
"
"           prlch_bt_doc_seq_no,
"
"	   prlch_currency,
"
"	   prlch_exchange_rate,
"
"	   prlch_tax_type,
"
"	   prlch_sub_seq_no,
"
"	   prlch_annex_no,
"
"	   prlch_annex_date,
"
"	   prlch_po_pfx,
"
"	   prlch_po_no,
"
"	   prlch_po_seq_no,
"
"	   prlch_igst_pct,
"
"           prlch_igst_amt,
"
"           prlch_cgst_pct,
"
"           prlch_cgst_amt,
"
"           prlch_sgst_pct,
"
"           prlch_sgst_amt,
"
"	   prlch_utgst_pct,
"
"	   prlch_utgst_amt,
"
"	   prlch_cess_pct,
"
"	   prlch_cess_amt,
"
"           prlch_gst_type,
"
"           prlch_gst_clf_type,
"
"	   prlch_billfr_loc,
"
"	   prlch_gst_exempt_type
"
"      FROM pur_rcpt_land_costs_hist
"
"     WHERE prlch_bu = p_bu
"
"       AND prlch_rcpt_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_receipt_lot(prlt_bu,
"
"                                prlt_receipt_no,
"
"                                prlt_prod_id,
"
"                                prlt_prod_rev,
"
"                                prlt_lot_no,
"
"                                prlt_lot_qty,
"
"                                prlt_type,
"
"                                prlt_cre_by,
"
"				prlt_cre_emp_id,
"
"				prlt_cre_ip_addr,
"
"				prlt_cre_os_user,
"
"                                prlt_cre_date,
"
"                                prlt_upd_by,
"
"				prlt_upd_emp_id,
"
"				prlt_upd_ip_addr,
"
"				prlt_upd_os_user,
"
"                                prlt_upd_date,
"
"                                prlt_start_ser_no,
"
"                                prlt_alloc_qty,
"
"                                prlt_mfg_date,
"
"                                prlt_seq_no,
"
"                                prlt_expiry_date,
"
"                                prlt_ln_seq_no,
"
"                                prlt_no_of_bale,
"
"                                prlt_conv_factor,
"
"				prlt_tdc,
"
"                                prlt_uts,
"
"                                prlt_ys,
"
"                                prlt_hrb,
"
"                                prlt_elo,
"
"				prlt_gsm,
"
"				prlt_passivation,
"
"				prlt_thickness,
"
"				prlt_width,
"
"				prlt_length,
"
"				prlt_temper,
"
"				prlt_coating,
"
"				prlt_yield_pct,
"
"				prlt_noof_comp_per_sht,
"
"				prlt_wght_of_sht,
"
"				prlt_no_of_sht,
"
"				prlt_cost_of_sht,
"
"				prlt_no_of_output,
"
"				prlt_prod_outer_dia,
"
"				prlt_crate_id,
"
"				prlt_heat_no,
"
"				prlt_test_no,
"
"				prlt_tl_est_life,
"
"				prlt_coil_no
"
"			       )
"
"    SELECT prlth_bu,
"
"           prlth_receipt_no,
"
"           prlth_prod_id,
"
"           prlth_prod_rev,
"
"           prlth_lot_no,
"
"           prlth_lot_qty,
"
"           prlth_type,
"
"           prlth_cre_by,
"
"	   prlth_cre_emp_id,
"
"	   prlth_cre_ip_addr,
"
"	   prlth_cre_os_user,
"
"           prlth_cre_date,
"
"           prlth_upd_by,
"
"	   prlth_upd_emp_id,
"
"	   prlth_upd_ip_addr,
"
"	   prlth_upd_os_user,
"
"           prlth_upd_date,
"
"           prlth_start_ser_no,
"
"           prlth_alloc_qty,
"
"           prlth_mfg_date,
"
"           prlth_seq_no,
"
"           prlth_expiry_date,
"
"           prlth_ln_seq_no,
"
"           prlth_no_of_bale,
"
"           prlth_conv_factor,
"
"	   prlth_tdc,
"
"           prlth_uts,
"
"           prlth_ys,
"
"           prlth_hrb,
"
"           prlth_elo,
"
"	   prlth_gsm,
"
"	   prlth_passivation,
"
"	   prlth_thickness,
"
"	   prlth_width,
"
"	   prlth_length,
"
"	   prlth_temper,
"
"	   prlth_coating,
"
"	   prlth_yield_pct,
"
"	   prlth_noof_comp_per_sht,
"
"	   prlth_wght_of_sht,
"
"	   prlth_no_of_sht,
"
"	   prlth_cost_of_sht,
"
"	   prlth_no_of_output,
"
"	   prlth_prod_outer_dia,
"
"	   prlth_crate_id,
"
"	   prlth_heat_no,
"
"	   prlth_test_no,
"
"	   prlth_tl_est_life,
"
"	   prlth_coil_no
"
"      FROM pur_receipt_lot_hist
"
"     WHERE prlth_bu = p_bu
"
"       AND prlth_receipt_no = p_rcpt_no;
"
"
"
"    INSERT INTO sub_contr_rcpt_process(scrp_bu,
"
"                                       scrp_rcpt_no,
"
"                                       scrp_seq_no,
"
"                                       scrp_sub_seq_no,
"
"                                       scrp_process,
"
"                                       scrp_oprn_seq_no,
"
"                                       scrp_proc_cost,
"
"                                       scrp_proc_flag,
"
"                                       scrp_ls_req_flag,
"
"                                       scrp_prod_id,
"
"                                       scrp_prod_rev,
"
"                                       scrp_hsn_code,
"
"                                       scrp_sc_chrg_amt,
"
"                                       scrp_sc_nchrg_amt,
"
"                                       scrp_bc_lc_chrg_amt,
"
"                                       scrp_bc_lc_nchrg_amt,
"
"                                       scrp_uom,
"
"                                       scrp_batch_qty,
"
"                                       scrp_batch_cost,
"
"                                       scrp_conv_factor,
"
"                                       scrp_price_opt,
"
"                                       scrp_min_flag,
"
"                                       scrp_ir_flag,
"
"                                       scrp_oprn_ln_seq_no,
"
"                                       scrp_cre_by,
"
"                                       scrp_cre_ip_addr,
"
"                                       scrp_cre_os_user,
"
"                                       scrp_cre_date,
"
"                                       scrp_upd_by,
"
"                                       scrp_upd_ip_addr,
"
"                                       scrp_upd_os_user,
"
"                                       scrp_upd_date,
"
"                                       scrp_cre_emp_id,
"
"                                       scrp_upd_emp_id,
"
"                                       scrp_pur_acct,
"
"                                       scrp_cc_code,
"
"                                       scrp_disc_amt,
"
"                                       scrp_igst_pct,
"
"                                       scrp_sgst_pct,
"
"                                       scrp_cgst_pct,
"
"                                       scrp_utgst_pct,
"
"                                       scrp_cess_pct,
"
"                                       scrp_igst_amt,
"
"                                       scrp_sgst_amt,
"
"                                       scrp_cgst_amt,
"
"                                       scrp_utgst_amt,
"
"                                       scrp_cess_amt,
"
"                                       scrp_assbl_val,
"
"                                       scrp_proc_qty,
"
"                                       scrp_temp_inv_qty,
"
"                                       scrp_temp_in_progress,
"
"                                       scrp_inv_qty,
"
"                                       scrp_close_qty,
"
"				       scrp_inv_proc_qty,
"
"				       scrp_cpc_fxd_flag,
"
"                                       scrp_gla_fxd_flag
"
"				      )
"
"    SELECT scrph_bu,
"
"           scrph_rcpt_no,
"
"           scrph_seq_no,
"
"           scrph_sub_seq_no,
"
"           scrph_process,
"
"           scrph_oprn_seq_no,
"
"           scrph_proc_cost,
"
"           scrph_proc_flag,
"
"           scrph_ls_req_flag,
"
"           scrph_prod_id,
"
"           scrph_prod_rev,
"
"           scrph_hsn_code,
"
"           scrph_sc_chrg_amt,
"
"           scrph_sc_nchrg_amt,
"
"           scrph_bc_lc_chrg_amt,
"
"           scrph_bc_lc_nchrg_amt,
"
"           scrph_uom,
"
"           scrph_batch_qty,
"
"           scrph_batch_cost,
"
"           scrph_conv_factor,
"
"           scrph_price_opt,
"
"           scrph_min_flag,
"
"           scrph_ir_flag,
"
"           scrph_oprn_ln_seq_no,
"
"           scrph_cre_by,
"
"           scrph_cre_ip_addr,
"
"           scrph_cre_os_user,
"
"           scrph_cre_date,
"
"           scrph_upd_by,
"
"           scrph_upd_ip_addr,
"
"           scrph_upd_os_user,
"
"           scrph_upd_date,
"
"           scrph_cre_emp_id,
"
"           scrph_upd_emp_id,
"
"           scrph_pur_acct,
"
"           scrph_cc_code,
"
"           scrph_disc_amt,
"
"           scrph_igst_pct,
"
"           scrph_sgst_pct,
"
"           scrph_cgst_pct,
"
"           scrph_utgst_pct,
"
"           scrph_cess_pct,
"
"           scrph_igst_amt,
"
"           scrph_sgst_amt,
"
"           scrph_cgst_amt,
"
"           scrph_utgst_amt,
"
"           scrph_cess_amt,
"
"           scrph_assbl_val,
"
"           scrph_proc_qty,
"
"           scrph_temp_inv_qty,
"
"           scrph_temp_in_progress,
"
"           scrph_inv_qty,
"
"           scrph_close_qty,
"
"	   scrph_inv_proc_qty,
"
"	   scrph_cpc_fxd_flag,
"
"           scrph_gla_fxd_flag
"
"      FROM sub_contr_rcpt_process_hist
"
"     WHERE scrph_bu = p_bu
"
"       AND scrph_rcpt_no = p_rcpt_no;
"
"
"
"        INSERT INTO pur_rcpt_lot_serial(prcls_bu,
"
"                                    prcls_doc_no,
"
"                                    prcls_doc_seq_no,
"
"                                    prcls_seq_no,
"
"                                    prcls_lot_no,
"
"                                    prcls_serial_no,
"
"                                    prcls_lot_qty,
"
"                                    prcls_qty_accepted,
"
"                                    prcls_tot_accepted,
"
"                                    prcls_tot_rejected,
"
"                                    prcls_qty_rejected,
"
"                                    prcls_expiry_date,
"
"                                    prcls_type,
"
"                                    prcls_accept_flag,
"
"                                    prcls_status,
"
"                                    prcls_so_upd_qty,
"
"                                    prcls_rework_qty,
"
"                                    prcls_return_qty,
"
"                                    prcls_tmp_rtn_qty,
"
"                                    prcls_tmp_rwk_qty,
"
"                                    prcls_rtn_inproc_qty,
"
"                                    prcls_rwk_inproc_qty,
"
"                                    prcls_prim_rej_qty,
"
"                                    prcls_sec_rej_qty,
"
"                                    prcls_apply_type,
"
"                                    prcls_prim_rtnprcs_qty,
"
"                                    prcls_prim_rtninprcs_qty,
"
"                                    prcls_prim_ret_qty,
"
"                                    prcls_sec_rtnprcs_qty,
"
"                                    prcls_sec_rtninprcs_qty,
"
"                                    prcls_sec_ret_qty,
"
"                                    prcls_prim_rwk_inside,
"
"                                    prcls_prim_rwk_outside,
"
"                                    prcls_secon_rwk_inside,
"
"                                    prcls_secon_rwk_outside,
"
"                                    prcls_fa_inprcs_qty,
"
"                                    prcls_fa_prcs_qty,
"
"                                    prcls_fa_rcpt_qty,
"
"                                    prcls_tg_inprcs_qty,
"
"                                    prcls_tg_prcs_qty,
"
"                                    prcls_tg_inv_qty,
"
"                                    prcls_warr_date,
"
"                                    prcls_cre_by,
"
"				    prcls_cre_emp_id,
"
"				    prcls_cre_ip_addr,
"
"				    prcls_cre_os_user,
"
"                                    prcls_cre_date,
"
"                                    prcls_upd_by,
"
"				    prcls_upd_emp_id,
"
"				    prcls_upd_ip_addr,
"
"				    prcls_upd_os_user,
"
"                                    prcls_upd_date,
"
"                                    prcls_rwk_flag,
"
"                                    prcls_sys_ls_no,
"
"                                    prcls_mfg_date,
"
"                                    prcls_prim_rwk_is_inproc_qty,
"
"                                    prcls_secon_rwk_is_inproc_qty,
"
"                                    prcls_prim_rwk_os_inproc_qty,
"
"                                    prcls_secon_rwk_os_inproc_qty,
"
"                                    prcls_prim_is_rwk_qty,
"
"                                    prcls_secon_is_rwk_qty,
"
"                                    prcls_prim_os_rwk_qty,
"
"                                    prcls_secon_os_rwk_qty,
"
"                                    prcls_rec_pri_is_repair_qty,
"
"                                    prcls_rec_pri_os_repair_qty,
"
"                                    prcls_rec_pri_scrap_qty,
"
"                                    prcls_rec_pri_dis_ass_qty,
"
"                                    prcls_rec_pri_rtrn_qty,
"
"                                    prcls_rec_sec_is_repair_qty,
"
"                                    prcls_rec_sec_os_repair_qty,
"
"                                    prcls_rec_sec_scrap_qty,
"
"                                    prcls_rec_sec_dis_ass_qty,
"
"                                    prcls_rec_sec_rtrn_qty,
"
"                                    prcls_prim_rtn_suplr,
"
"                                    prcls_sec_rtn_suplr,
"
"                                    prcls_prim_rwk_suplr,
"
"                                    prcls_sec_rwk_suplr,
"
"                                    prcls_rwk_rtn_sel_flag,
"
"                                    prcls_rwk_rtn_user,
"
"                                    prcls_rwk_rtn_ref,
"
"                                    prcls_route_card_no,
"
"                                    prcls_sou_type,
"
"                                    prcls_sou_id,
"
"                                    prcls_old_ls_flag,
"
"                                    prcls_old_ls_ref,
"
"                                    prcls_aod_qty,
"
"                                    prcls_tot_aod_qty,
"
"                                    prcls_test_no,
"
"                                    prcls_no_of_coils,
"
"                                    prcls_heat_no,
"
"                                    prcls_coil_gr_wgt,
"
"                                    prcls_coil_tr_wgt,
"
"                                    prcls_col_nt_wgt,
"
"                                    prcls_press_mark_no,
"
"                                    prcls_press_run_no,
"
"                                    prcls_org_lot_no,
"
"				    prcls_tdc,
"
"				    prcls_uts,
"
"				    prcls_ys,
"
"				    prcls_hrb,
"
"				    prcls_elo,
"
"				    prcls_gsm,
"
"				    prcls_passivation,
"
"				    prcls_thickness,
"
"				    prcls_width,
"
"				    prcls_length,
"
"				    prcls_temper,
"
"				    prcls_coating,
"
"				    prcls_yield_pct,
"
"				    prcls_mix_lot_no,
"
"				    prcls_test_cert_no,
"
"				    prcls_noof_comp_per_sht,
"
"				    prcls_wght_of_sht,
"
"				    prcls_no_of_sht,
"
"				    prcls_cost_of_sht,
"
"				    prcls_no_of_output,
"
"				    prcls_cut_blank_qty,
"
"				    prcls_prod_outer_dia,
"
"				    prcls_crate_id,
"
"				    prcls_mix_id,
"
"				    prcls_mix_rev,
"
"				    prcls_remark,
"
"				    prcls_stk_rcpt_qty,
"
"				    prcls_stk_acpt_qty,
"
"				    prcls_stk_aod_qty,
"
"				    prcls_stk_rej_qty,
"
"				    prcls_stk_prim_rej_qty,
"
"				    prcls_stk_sec_rej_qty,
"
"				    prcls_bak_qty,
"
"				    prcls_stk_bak_qty,
"
"				    prcls_tot_bak_qty,
"
"				    prcls_tot_stk_acpt_qty,
"
"				    prcls_tot_stk_aod_qty,
"
"				    prcls_tot_stk_rej_qty,
"
"				    prcls_tl_est_life,
"
"				    prcls_powder_batch_no ,
"
"				    prcls_weld_wire_no
"
"			           )
"
"    SELECT prclsh_bu,
"
"	   prclsh_doc_no,
"
"	   prclsh_doc_seq_no,
"
"	   prclsh_seq_no,
"
"	   prclsh_lot_no,
"
"	   prclsh_serial_no,
"
"	   prclsh_lot_qty,
"
"	   prclsh_qty_accepted,
"
"	   prclsh_tot_accepted,
"
"	   prclsh_tot_rejected,
"
"	   prclsh_qty_rejected,
"
"	   prclsh_expiry_date,
"
"	   prclsh_type,
"
"	   prclsh_accept_flag,
"
"	   prclsh_status,
"
"	   prclsh_so_upd_qty,
"
"	   prclsh_rework_qty,
"
"	   prclsh_return_qty,
"
"	   prclsh_tmp_rtn_qty,
"
"	   prclsh_tmp_rwk_qty,
"
"	   prclsh_rtn_inproc_qty,
"
"	   prclsh_rwk_inproc_qty,
"
"	   prclsh_prim_rej_qty,
"
"	   prclsh_sec_rej_qty,
"
"	   prclsh_apply_type,
"
"	   prclsh_prim_rtnprcs_qty,
"
"	   prclsh_prim_rtninprcs_qty,
"
"	   prclsh_prim_ret_qty,
"
"	   prclsh_sec_rtnprcs_qty,
"
"	   prclsh_sec_rtninprcs_qty,
"
"	   prclsh_sec_ret_qty,
"
"	   prclsh_prim_rwk_inside,
"
"	   prclsh_prim_rwk_outside,
"
"	   prclsh_secon_rwk_inside,
"
"	   prclsh_secon_rwk_outside,
"
"	   prclsh_fa_inprcs_qty,
"
"	   prclsh_fa_prcs_qty,
"
"	   prclsh_fa_rcpt_qty,
"
"	   prclsh_tg_inprcs_qty,
"
"	   prclsh_tg_prcs_qty,
"
"	   prclsh_tg_inv_qty,
"
"	   prclsh_warr_date,
"
"	   prclsh_cre_by,
"
"	   prclsh_cre_emp_id,
"
"	   prclsh_cre_ip_addr,
"
"	   prclsh_cre_os_user,
"
"	   prclsh_cre_date,
"
"	   prclsh_upd_by,
"
"	   prclsh_upd_emp_id,
"
"	   prclsh_upd_ip_addr,
"
"	   prclsh_upd_os_user,
"
"	   prclsh_upd_date,
"
"	   prclsh_rwk_flag,
"
"	   prclsh_sys_ls_no,
"
"	   prclsh_mfg_date,
"
"	   prclsh_prim_rwk_is_inproc_qty,
"
"	   prclsh_secon_rwk_is_inproc_qty,
"
"	   prclsh_prim_rwk_os_inproc_qty,
"
"	   prclsh_secon_rwk_os_inproc_qty,
"
"	   prclsh_prim_is_rwk_qty,
"
"	   prclsh_secon_is_rwk_qty,
"
"	   prclsh_prim_os_rwk_qty,
"
"	   prclsh_secon_os_rwk_qty,
"
"	   prclsh_rec_pri_is_repair_qty,
"
"	   prclsh_rec_pri_os_repair_qty,
"
"	   prclsh_rec_pri_scrap_qty,
"
"	   prclsh_rec_pri_dis_ass_qty,
"
"	   prclsh_rec_pri_rtrn_qty,
"
"	   prclsh_rec_sec_is_repair_qty,
"
"	   prclsh_rec_sec_os_repair_qty,
"
"	   prclsh_rec_sec_scrap_qty,
"
"	   prclsh_rec_sec_dis_ass_qty,
"
"	   prclsh_rec_sec_rtrn_qty,
"
"	   prclsh_prim_rtn_suplr,
"
"	   prclsh_sec_rtn_suplr,
"
"	   prclsh_prim_rwk_suplr,
"
"	   prclsh_sec_rwk_suplr,
"
"	   prclsh_rwk_rtn_sel_flag,
"
"	   prclsh_rwk_rtn_user,
"
"	   prclsh_rwk_rtn_ref,
"
"	   prclsh_route_card_no,
"
"	   prclsh_sou_type,
"
"	   prclsh_sou_id,
"
"	   prclsh_old_ls_flag,
"
"	   prclsh_old_ls_ref,
"
"	   prclsh_aod_qty,
"
"	   prclsh_tot_aod_qty,
"
"	   prclsh_test_no,
"
"	   prclsh_no_of_coils,
"
"	   prclsh_heat_no,
"
"	   prclsh_coil_gr_wgt,
"
"	   prclsh_coil_tr_wgt,
"
"	   prclsh_col_nt_wgt,
"
"	   prclsh_press_mark_no,
"
"	   prclsh_press_run_no,
"
"	   prclsh_org_lot_no,
"
"	   prclsh_tdc,
"
"	   prclsh_uts,
"
"	   prclsh_ys,
"
"	   prclsh_hrb,
"
"	   prclsh_elo,
"
"	   prclsh_gsm,
"
"	   prclsh_passivation,
"
"	   prclsh_thickness,
"
"	   prclsh_width,
"
"	   prclsh_length,
"
"	   prclsh_temper,
"
"	   prclsh_coating,
"
"	   prclsh_yield_pct,
"
"	   prclsh_mix_lot_no,
"
"	   prclsh_test_cert_no,
"
"	   prclsh_noof_comp_per_sht,
"
"	   prclsh_wght_of_sht,
"
"	   prclsh_no_of_sht,
"
"	   prclsh_cost_of_sht,
"
"	   prclsh_no_of_output,
"
"	   prclsh_cut_blank_qty,
"
"	   prclsh_prod_outer_dia,
"
"	   prclsh_crate_id,
"
"	   prclsh_mix_id,
"
"	   prclsh_mix_rev,
"
"	   prclsh_remark,
"
"           prclsh_stk_rcpt_qty,
"
"           prclsh_stk_acpt_qty,
"
"           prclsh_stk_aod_qty,
"
"           prclsh_stk_rej_qty,
"
"           prclsh_stk_prim_rej_qty,
"
"           prclsh_stk_sec_rej_qty,
"
"	   prclsh_bak_qty,
"
"	   prclsh_stk_bak_qty,
"
"	   prclsh_tot_bak_qty,
"
"	   prclsh_tot_stk_acpt_qty,
"
"	   prclsh_tot_stk_aod_qty,
"
"	   prclsh_tot_stk_rej_qty,
"
"	   prclsh_tl_est_life,
"
"	   prclsh_powder_batch_no,
"
"	   prclsh_weld_wire_no
"
"      FROM pur_rcpt_lot_serial_hist
"
"     WHERE prclsh_bu = p_bu
"
"       AND prclsh_doc_no = p_rcpt_no;
"
"
"
"    INSERT INTO pur_rcpt_addr(pra_bu,
"
"			      pra_rcpt_no,
"
"			      pra_shipfr_addr1,
"
"			      pra_shipfr_addr2,
"
"			      pra_shipfr_addr3,
"
"			      pra_shipfr_postal_code,
"
"			      pra_shipfr_city,
"
"			      pra_shipfr_state,
"
"			      pra_shipfr_state_code,
"
"			      pra_shipfr_cntry,
"
"			      pra_shipfr_tele1,
"
"			      pra_shipfr_fax1,
"
"			      pra_shipfr_email1,
"
"			      pra_shipfr_mobno,
"
"			      pra_shipfr_zip_code,
"
"			      pra_shipfr_gst_no,
"
"			      pra_billfr_addr1,
"
"			      pra_billfr_addr2,
"
"			      pra_billfr_addr3,
"
"			      pra_billfr_postal_code,
"
"			      pra_billfr_city,
"
"			      pra_billfr_state,
"
"			      pra_billfr_state_code,
"
"			      pra_billfr_cntry,
"
"			      pra_billfr_tele1,
"
"			      pra_billfr_fax1,
"
"			      pra_billfr_email1,
"
"			      pra_billfr_mobno,
"
"			      pra_billfr_zip_code,
"
"			      pra_billfr_gst_no,
"
"			      pra_billto_addr1,
"
"			      pra_billto_addr2,
"
"			      pra_billto_addr3,
"
"			      pra_billto_postal_code,
"
"			      pra_billto_tele1,
"
"			      pra_billto_fax1,
"
"			      pra_billto_email1,
"
"			      pra_billto_mobno,
"
"			      pra_billto_zip_code,
"
"			      pra_billto_city,
"
"			      pra_billto_state,
"
"			      pra_billto_state_code,
"
"			      pra_billto_cntry,
"
"			      pra_billto_gst_no,
"
"			      pra_shipto_addr1,
"
"			      pra_shipto_addr2,
"
"			      pra_shipto_addr3,
"
"			      pra_shipto_postal_code,
"
"			      pra_shipto_tele1,
"
"			      pra_shipto_fax1,
"
"			      pra_shipto_email1,
"
"			      pra_shipto_mobno,
"
"			      pra_shipto_zip_code,
"
"			      pra_shipto_city,
"
"			      pra_shipto_state,
"
"			      pra_shipto_state_code,
"
"			      pra_shipto_cntry,
"
"			      pra_shipto_gst_no,
"
"			      pra_cre_by,
"
"			      pra_cre_emp_id,
"
"			      pra_cre_ip_addr,
"
"			      pra_cre_os_user,
"
"			      pra_cre_date,
"
"			      pra_upd_by,
"
"			      pra_upd_emp_id,
"
"			      pra_upd_ip_addr,
"
"			      pra_upd_os_user,
"
"			      pra_upd_date
"
"			     )
"
"    SELECT prah_bu,
"
"	   prah_rcpt_no,
"
"	   prah_shipfr_addr1,
"
"	   prah_shipfr_addr2,
"
"	   prah_shipfr_addr3,
"
"	   prah_shipfr_postal_code,
"
"	   prah_shipfr_city,
"
"	   prah_shipfr_state,
"
"	   prah_shipfr_state_code,
"
"	   prah_shipfr_cntry,
"
"	   prah_shipfr_tele1,
"
"	   prah_shipfr_fax1,
"
"	   prah_shipfr_email1,
"
"	   prah_shipfr_mobno,
"
"	   prah_shipfr_zip_code,
"
"	   prah_shipfr_gst_no,
"
"	   prah_billfr_addr1,
"
"	   prah_billfr_addr2,
"
"	   prah_billfr_addr3,
"
"	   prah_billfr_postal_code,
"
"	   prah_billfr_city,
"
"	   prah_billfr_state,
"
"	   prah_billfr_state_code,
"
"	   prah_billfr_cntry,
"
"	   prah_billfr_tele1,
"
"	   prah_billfr_fax1,
"
"	   prah_billfr_email1,
"
"	   prah_billfr_mobno,
"
"	   prah_billfr_zip_code,
"
"	   prah_billfr_gst_no,
"
"	   prah_billto_addr1,
"
"	   prah_billto_addr2,
"
"	   prah_billto_addr3,
"
"	   prah_billto_postal_code,
"
"	   prah_billto_tele1,
"
"	   prah_billto_fax1,
"
"	   prah_billto_email1,
"
"	   prah_billto_mobno,
"
"	   prah_billto_zip_code,
"
"	   prah_billto_city,
"
"	   prah_billto_state,
"
"	   prah_billto_state_code,
"
"	   prah_billto_cntry,
"
"	   prah_billto_gst_no,
"
"	   prah_shipto_addr1,
"
"	   prah_shipto_addr2,
"
"	   prah_shipto_addr3,
"
"	   prah_shipto_postal_code,
"
"	   prah_shipto_tele1,
"
"	   prah_shipto_fax1,
"
"	   prah_shipto_email1,
"
"	   prah_shipto_mobno,
"
"	   prah_shipto_zip_code,
"
"	   prah_shipto_city,
"
"	   prah_shipto_state,
"
"	   prah_shipto_state_code,
"
"	   prah_shipto_cntry,
"
"	   prah_shipto_gst_no,
"
"	   prah_cre_by,
"
"	   prah_cre_emp_id,
"
"	   prah_cre_ip_addr,
"
"	   prah_cre_os_user,
"
"	   prah_cre_date,
"
"	   prah_upd_by,
"
"	   prah_upd_emp_id,
"
"	   prah_upd_ip_addr,
"
"	   prah_upd_os_user,
"
"	   prah_upd_date
"
"      FROM pur_rcpt_addr_hist
"
"     WHERE prah_bu = p_bu
"
"       AND prah_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_rcpt_lot_serial_hist
"
"     WHERE prclsh_bu = p_bu
"
"       AND prclsh_doc_no = p_rcpt_no;
"
"
"
"    DELETE FROM sub_contr_rcpt_process_hist
"
"     WHERE scrph_bu = p_bu
"
"       AND scrph_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_receipt_lot_hist
"
"     WHERE prlth_bu = p_bu
"
"       AND prlth_receipt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_rcpt_land_costs_hist
"
"     WHERE prlch_bu = p_bu
"
"       AND prlch_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_ord_receipt_ln_hist
"
"     WHERE porlh_bu = p_bu
"
"       AND porlh_receipt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_rcpt_addr_hist
"
"     WHERE prah_bu = p_bu
"
"       AND prah_rcpt_no = p_rcpt_no;
"
"
"
"    DELETE FROM pur_ord_receipt_hd_hist
"
"     WHERE porhh_bu = p_bu
"
"       AND porhh_receipt_no = p_rcpt_no;
"
"
"
"  END proc_rev_grn_hist;
"
"
"
"  PROCEDURE proc_ins_po_hist(p_bu		pur_order_hd.poh_bu%TYPE,
"
"			     p_ord_pfx		pur_order_hd.poh_order_pfx%TYPE,
"
"			     p_ord_no		pur_order_hd.poh_order_no%TYPE
"
"			    )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO pur_order_hd_hist(pohh_bu,
"
"pohh_mode,
"
"pohh_order_pfx,
"
"pohh_order_no,
"
"pohh_suplr_id,
"
"pohh_suplr_name,
"
"pohh_order_date,
"
"pohh_order_year,
"
"pohh_order_period,
"
"pohh_currency,
"
"pohh_exchange_rate,
"
"pohh_status,
"
"pohh_shipvia_id,
"
"pohh_term_id,
"
"pohh_fob_id,
"
"pohh_buyer_id,
"
"pohh_origin,
"
"pohh_adv_payable,
"
"pohh_adv_paid,
"
"pohh_adv_paid_on,
"
"pohh_part_ship_flag,
"
"pohh_reqstr_id,
"
"pohh_reqstr_name,
"
"pohh_reqstr_pos_id,
"
"pohh_reqstr_pos_name,
"
"pohh_rqst_dept_id,
"
"pohh_apprvr_id,
"
"pohh_apprvr_name,
"
"pohh_apprvr_pos_id,
"
"pohh_apprvr_pos_name,
"
"pohh_apprvr_dept_id,
"
"pohh_apprvd_date,
"
"pohh_sou_doc_pfx,
"
"pohh_sou_doc_no,
"
"pohh_type,
"
"pohh_stk_trn_so_pfx,
"
"pohh_stk_trn_so_no,
"
"pohh_cs_narration,
"
"pohh_plant,
"
"pohh_suplr_doc_no,
"
"pohh_suplr_doc_date,
"
"pohh_adv_req_flag,
"
"pohh_adv_pct,
"
"pohh_adv_to_payd,
"
"pohh_adv_payd,
"
"pohh_adv_doc_pfx,
"
"pohh_adv_doc_no,
"
"pohh_lc_req_flag,
"
"pohh_lc_pct,
"
"pohh_lc_amt,
"
"pohh_lc_doc_pfx,
"
"pohh_lc_doc_no,
"
"pohh_lc_valid_freq,
"
"pohh_lc_valid_dur,
"
"pohh_terr_id,
"
"pohh_ref,
"
"pohh_suplr_ord_acpt_no,
"
"pohh_suplr_ord_acpt_date,
"
"pohh_transp_id,
"
"pohh_suplr_edc_date,
"
"pohh_trns_lr_date,
"
"pohh_trns_lr_no,
"
"pohh_frt_scope,
"
"pohh_rcpt_rev_flag,
"
"pohh_amend_id,
"
"pohh_loc_id,
"
"pohh_adv_sel_flag,
"
"pohh_adv_sel_user,
"
"pohh_adv_proc_qty,
"
"pohh_cs_id,
"
"pohh_gen_po_flag,
"
"pohh_capex_bud_no,
"
"pohh_lab_ord_int_source,
"
"pohh_mrp_no,
"
"pohh_adv_in_progress,
"
"pohh_broker_id,
"
"pohh_for_type,
"
"pohh_sc_mr_type,
"
"pohh_billfr_loc_id,
"
"pohh_ord_type,
"
"pohh_suplr_contr_no,
"
"pohh_total_amt,
"
"pohh_buyer_emp_id,
"
"pohh_late_ded_disc_pct,
"
"pohh_billto_loc_id,
"
"pohh_dir_bro_type,
"
"pohh_plnt_loc_id,
"
"pohh_swo_type,
"
"pohh_mail_sub_msg,
"
"pohh_mail_body_msg,
"
"pohh_csd_cust_id,
"
"pohh_csd_prod_id,
"
"pohh_csd_prod_rev,
"
"pohh_csd_mchn_serial_no,
"
"pohh_csd_sale_inv_pfx,
"
"pohh_csd_sale_inv_no,
"
"pohh_lm_disc_amt,
"
"pohh_sos_cost_flag,
"
"pohh_csr_doc_no,
"
"pohh_rr_no,
"
"pohh_cash_disc_pct,
"
"pohh_rr_flag,
"
"pohh_shipto_loc_id,
"
"pohh_suplr_sale_contr_no,
"
"pohh_suplr_sale_contr_date,
"
"pohh_adv_paid_amt_bc,
"
"pohh_adv_paid_avg_exrate,
"
"pohh_upd_cost_flag,
"
"pohh_vertical_type,
"
"pohh_sp_inst,
"
"pohh_payment_detail,
"
"pohh_vat_cst,
"
"pohh_ed,
"
"pohh_insurance,
"
"pohh_frieght,
"
"pohh_forwarding,
"
"pohh_pack_forwd,
"
"pohh_delivery,
"
"pohh_dest,
"
"pohh_so_ref,
"
"pohh_import_flag,
"
"pohh_cmsng_po_list_flag,
"
"pohh_lc_rqrd_flag,
"
"pohh_cre_by,
"
"pohh_cre_ip_addr,
"
"pohh_cre_os_user,
"
"pohh_cre_date,
"
"pohh_upd_by,
"
"pohh_upd_ip_addr,
"
"pohh_upd_os_user,
"
"pohh_upd_date,
"
"pohh_cust_id,
"
"pohh_paymnt_recv_flag,
"
"pohh_cre_emp_id,
"
"pohh_upd_emp_id,
"
"pohh_prof_inv_no,
"
"pohh_prof_inv_date,
"
"pohh_form_a,
"
"pohh_mat_amt,
"
"pohh_tax_amt,
"
"pohh_disc_amt,
"
"pohh_rnd_amt,
"
"pohh_tot_amt,
"
"pohh_form_27c,
"
"pohh_par_ord_pfx,
"
"pohh_par_ord_no,
"
"pohh_route_card_no,
"
"pohh_par_ord_type,
"
"pohh_proj_id,
"
"pohh_inv_sel_flag,
"
"pohh_inv_sel_user,
"
"pohh_shipto_type,
"
"pohh_pan_no,
"
"pohh_aadhaar_no,
"
"pohh_pan_avail_type,
"
"pohh_tcs_amt,
"
"pohh_ins_policy_no,
"
"pohh_eauc_flag,
"
"pohh_eauc_type,
"
"pohh_eauc_ref,
"
"pohh_eauc_emd_amt,
"
"pohh_gst_type,
"
"pohh_gst_clf_type,
"
"pohh_cc_code,
"
"pohh_plnt_loc_name,
"
"pohh_net_weight,
"
"pohh_billto_gst_type,
"
"pohh_billto_clf_type,
"
"pohh_gen_mrp_flag,
"
"pohh_appr_by,
"
"pohh_appr_emp_id,
"
"pohh_appr_ip_addr,
"
"pohh_appr_os_user,
"
"pohh_appr_date,
"
"pohh_shipfr_loc_name,
"
"pohh_shipto_loc_name,
"
"pohh_billfr_loc_name,
"
"pohh_billto_loc_name,
"
"pohh_billfr_clf_type,
"
"pohh_adv_tax_pct,
"
"pohh_broker_amt
"
")
"
"    SELECT poh_bu,
"
"poh_mode,
"
"poh_order_pfx,
"
"poh_order_no,
"
"poh_suplr_id,
"
"poh_suplr_name,
"
"poh_order_date,
"
"poh_order_year,
"
"poh_order_period,
"
"poh_currency,
"
"poh_exchange_rate,
"
"poh_status,
"
"poh_shipvia_id,
"
"poh_term_id,
"
"poh_fob_id,
"
"poh_buyer_id,
"
"poh_origin,
"
"poh_adv_payable,
"
"poh_adv_paid,
"
"poh_adv_paid_on,
"
"poh_part_ship_flag,
"
"poh_reqstr_id,
"
"poh_reqstr_name,
"
"poh_reqstr_pos_id,
"
"poh_reqstr_pos_name,
"
"poh_rqst_dept_id,
"
"poh_apprvr_id,
"
"poh_apprvr_name,
"
"poh_apprvr_pos_id,
"
"poh_apprvr_pos_name,
"
"poh_apprvr_dept_id,
"
"poh_apprvd_date,
"
"poh_sou_doc_pfx,
"
"poh_sou_doc_no,
"
"poh_type,
"
"poh_stk_trn_so_pfx,
"
"poh_stk_trn_so_no,
"
"poh_cs_narration,
"
"poh_plant,
"
"poh_suplr_doc_no,
"
"poh_suplr_doc_date,
"
"poh_adv_req_flag,
"
"poh_adv_pct,
"
"poh_adv_to_payd,
"
"poh_adv_payd,
"
"poh_adv_doc_pfx,
"
"poh_adv_doc_no,
"
"poh_lc_req_flag,
"
"poh_lc_pct,
"
"poh_lc_amt,
"
"poh_lc_doc_pfx,
"
"poh_lc_doc_no,
"
"poh_lc_valid_freq,
"
"poh_lc_valid_dur,
"
"poh_terr_id,
"
"poh_ref,
"
"poh_suplr_ord_acpt_no,
"
"poh_suplr_ord_acpt_date,
"
"poh_transp_id,
"
"poh_suplr_edc_date,
"
"poh_trns_lr_date,
"
"poh_trns_lr_no,
"
"poh_frt_scope,
"
"poh_rcpt_rev_flag,
"
"poh_amend_id,
"
"poh_loc_id,
"
"poh_adv_sel_flag,
"
"poh_adv_sel_user,
"
"poh_adv_proc_qty,
"
"poh_cs_id,
"
"poh_gen_po_flag,
"
"poh_capex_bud_no,
"
"poh_lab_ord_int_source,
"
"poh_mrp_no,
"
"poh_adv_in_progress,
"
"poh_broker_id,
"
"poh_for_type,
"
"poh_sc_mr_type,
"
"poh_billfr_loc_id,
"
"poh_ord_type,
"
"poh_suplr_contr_no,
"
"poh_total_amt,
"
"poh_buyer_emp_id,
"
"poh_late_ded_disc_pct,
"
"poh_billto_loc_id,
"
"poh_dir_bro_type,
"
"poh_plnt_loc_id,
"
"poh_swo_type,
"
"poh_mail_sub_msg,
"
"poh_mail_body_msg,
"
"poh_csd_cust_id,
"
"poh_csd_prod_id,
"
"poh_csd_prod_rev,
"
"poh_csd_mchn_serial_no,
"
"poh_csd_sale_inv_pfx,
"
"poh_csd_sale_inv_no,
"
"poh_lm_disc_amt,
"
"poh_sos_cost_flag,
"
"poh_csr_doc_no,
"
"poh_rr_no,
"
"poh_cash_disc_pct,
"
"poh_rr_flag,
"
"poh_shipto_loc_id,
"
"poh_suplr_sale_contr_no,
"
"poh_suplr_sale_contr_date,
"
"poh_adv_paid_amt_bc,
"
"poh_adv_paid_avg_exrate,
"
"poh_upd_cost_flag,
"
"poh_vertical_type,
"
"poh_sp_inst,
"
"poh_payment_detail,
"
"poh_vat_cst,
"
"poh_ed,
"
"poh_insurance,
"
"poh_frieght,
"
"poh_forwarding,
"
"poh_pack_forwd,
"
"poh_delivery,
"
"poh_dest,
"
"poh_so_ref,
"
"poh_import_flag,
"
"poh_cmsng_po_list_flag,
"
"poh_lc_rqrd_flag,
"
"poh_cre_by,
"
"poh_cre_ip_addr,
"
"poh_cre_os_user,
"
"poh_cre_date,
"
"poh_upd_by,
"
"poh_upd_ip_addr,
"
"poh_upd_os_user,
"
"poh_upd_date,
"
"poh_cust_id,
"
"poh_paymnt_recv_flag,
"
"poh_cre_emp_id,
"
"poh_upd_emp_id,
"
"poh_prof_inv_no,
"
"poh_prof_inv_date,
"
"poh_form_a,
"
"poh_mat_amt,
"
"poh_tax_amt,
"
"poh_disc_amt,
"
"poh_rnd_amt,
"
"poh_tot_amt,
"
"poh_form_27c,
"
"poh_par_ord_pfx,
"
"poh_par_ord_no,
"
"poh_route_card_no,
"
"poh_par_ord_type,
"
"poh_proj_id,
"
"poh_inv_sel_flag,
"
"poh_inv_sel_user,
"
"poh_shipto_type,
"
"poh_pan_no,
"
"poh_aadhaar_no,
"
"poh_pan_avail_type,
"
"poh_tcs_amt,
"
"poh_ins_policy_no,
"
"poh_eauc_flag,
"
"poh_eauc_type,
"
"poh_eauc_ref,
"
"poh_eauc_emd_amt,
"
"poh_gst_type,
"
"poh_gst_clf_type,
"
"poh_cc_code,
"
"poh_plnt_loc_name,
"
"poh_net_weight,
"
"poh_billto_gst_type,
"
"poh_billto_clf_type,
"
"poh_gen_mrp_flag,
"
"poh_appr_by,
"
"poh_appr_emp_id,
"
"poh_appr_ip_addr,
"
"poh_appr_os_user,
"
"poh_appr_date,
"
"poh_shipfr_loc_name,
"
"poh_shipto_loc_name,
"
"poh_billfr_loc_name,
"
"poh_billto_loc_name,
"
"poh_billfr_clf_type,
"
"poh_adv_tax_pct,
"
"poh_broker_amt
"
"      FROM pur_order_hd
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_no = p_ord_no;
"
"
"
"    INSERT INTO pur_order_ln_hist(polh_bu,
"
"                                  polh_order_no,
"
"                                  polh_seq_no,
"
"                                  polh_prod_id,
"
"                                  polh_prod_rev,
"
"                                  polh_prod_desc1,
"
"                                  polh_prod_cls,
"
"                                  polh_prod_cls_desc,
"
"                                  polh_prod_sub_cls,
"
"                                  polh_prod_sub_cls_desc,
"
"                                  polh_uom,
"
"                                  polh_prod_uom,
"
"                                  polh_conv_factor,
"
"                                  polh_cost_basis,
"
"                                  polh_contract_id,
"
"                                  polh_sc_unit_cost,
"
"                                  polh_disc_pct,
"
"                                  polh_scon_mat_unit_cost,
"
"                                  polh_qc_required,
"
"                                  polh_stocked,
"
"                                  polh_ordered_qty,
"
"                                  polh_received_qty,
"
"                                  polh_deflt_schld_flag,
"
"                                  polh_net_disc_flag,
"
"                                  polh_origin,
"
"                                  polh_proj_flag,
"
"                                  polh_status,
"
"                                  polh_tolr_qty,
"
"                                  polh_tot_received_qty,
"
"                                  polh_rejected_qty,
"
"                                  polh_cs_narration,
"
"                                  polh_suplr_prod_id,
"
"                                  polh_suplr_prod_desc,
"
"                                  polh_parent_prod_id,
"
"                                  polh_parent_prod_rev,
"
"                                  polh_rate_finalize,
"
"                                  polh_work_ord_no,
"
"                                  polh_rwk_rcpt_seq_no,
"
"                                  polh_prim_rwk_qty,
"
"                                  polh_sec_rwk_qty,
"
"                                  polh_rwk_rcpt_pfx,
"
"                                  polh_rwk_rcpt_no,
"
"                                  polh_disc_amt,
"
"                                  polh_scrap_qty,
"
"                                  polh_amd_no,
"
"                                  polh_contr_pfx,
"
"                                  polh_prod_ord_no,
"
"                                  polh_sf_code,
"
"                                  polh_bom_avail_flag,
"
"                                  polh_print_seq_no,
"
"                                  polh_ins_plan_no,
"
"                                  polh_ins_plan_rev,
"
"                                  polh_test_req_flag,
"
"                                  polh_cert_id,
"
"                                  polh_rfq_pfx,
"
"                                  polh_rfq_no,
"
"                                  polh_suplr_qtn_no,
"
"                                  polh_suplr_resp_date,
"
"                                  polh_contr_amd_no,
"
"                                  polh_ref,
"
"                                  polh_amend_reason,
"
"                                  polh_amd_date,
"
"                                  polh_prod_ext_desc,
"
"                                  polh_drawing_no,
"
"                                  polh_drawing_rev,
"
"                                  polh_wvd_flag,
"
"                                  polh_rwk_rcpt_type,
"
"                                  polh_spr_type,
"
"                                  polh_foc_flag,
"
"                                  polh_targ_sf_code,
"
"                                  polh_rwk_queue_type,
"
"                                  polh_sou_mat_weight,
"
"                                  polh_tar_mat_weight,
"
"                                  polh_plnd_scrap_weight,
"
"                                  polh_plnd_hr_unit,
"
"                                  polh_dim_req_flag,
"
"                                  polh_thickness,
"
"                                  polh_length,
"
"                                  polh_width,
"
"                                  polh_vis_insp_flag,
"
"                                  polh_qty_in_nos,
"
"                                  polh_rcpt_rev_flag,
"
"                                  polh_serv_prod_id,
"
"                                  polh_serv_io_type,
"
"                                  polh_amc_start_date,
"
"                                  polh_amc_end_date,
"
"                                  polh_amend_id,
"
"                                  polh_serv_prod_desc,
"
"                                  polh_install_req_flag,
"
"                                  polh_cs_id,
"
"                                  polh_tool_wo_no,
"
"                                  polh_scr_pct,
"
"                                  polh_scr_weight,
"
"                                  polh_alow_scr_qty,
"
"                                  polh_cls_sel_flag,
"
"                                  polh_cls_sel_user,
"
"                                  polh_cls_proc_qty,
"
"                                  polh_cls_qty,
"
"                                  polh_cap_asset_id,
"
"                                  polh_mat_req_trans_no,
"
"                                  polh_po_auto_cs_flag,
"
"                                  polh_po_auto_cs_pct,
"
"                                  polh_enquiry_no,
"
"                                  polh_hsn_code,
"
"                                  polh_gst_rev_tax_cat_id,
"
"                                  polh_catalog_no,
"
"                                  polh_mchn_id,
"
"                                  polh_sub_dept_id,
"
"                                  polh_dc_no,
"
"                                  polh_mrp_rel_qty,
"
"                                  polh_mftr_id,
"
"                                  polh_mftr_part_no,
"
"                                  polh_category_id,
"
"                                  polh_gst_exempt_flag,
"
"                                  polh_eqpmt_id,
"
"                                  polh_eqpmt_desc,
"
"                                  polh_rfq_seq_no,
"
"                                  polh_insp_pln_no,
"
"                                  polh_insp_pln_rev,
"
"                                  polh_mrkt_price,
"
"                                  polh_pr_ref,
"
"                                  polh_mchn_grp_id,
"
"                                  polh_stk_tr_so_pfx,
"
"                                  polh_stk_tr_so_no,
"
"                                  polh_stk_tr_so_seq_no,
"
"                                  polh_lm_disc_amt,
"
"                                  polh_warranty_date,
"
"                                  polh_instal_chrg_amt,
"
"                                  polh_make_id,
"
"                                  polh_model,
"
"                                  polh_wvd_basis,
"
"                                  polh_wvd_shrt_type,
"
"                                  polh_wvd_excs_type,
"
"                                  polh_gross_amt,
"
"                                  polh_tax_amt,
"
"                                  polh_net_amt,
"
"                                  polh_prod_grp,
"
"                                  polh_prod_grp_desc,
"
"                                  polh_prod_subgrp,
"
"                                  polh_prod_subgrp_desc,
"
"                                  polh_hs_tariff_code,
"
"                                  polh_rwk_rcpt_rev,
"
"                                  polh_prod_outer_dia,
"
"                                  polh_gst_input_type,
"
"                                  polh_ord_stk_qty,
"
"                                  polh_cre_by,
"
"                                  polh_cre_ip_addr,
"
"                                  polh_cre_os_user,
"
"                                  polh_cre_date,
"
"                                  polh_upd_by,
"
"                                  polh_upd_ip_addr,
"
"                                  polh_upd_os_user,
"
"                                  polh_upd_date,
"
"                                  polh_cre_emp_id,
"
"                                  polh_upd_emp_id,
"
"                                  polh_last_po_price,
"
"                                  polh_iss_code,
"
"                                  polh_disc_unit_amt,
"
"                                  polh_proj_lvl_id,
"
"                                  polh_proj_lvl_desc,
"
"                                  polh_height,
"
"                                  polh_inner_dia,
"
"                                  polh_density,
"
"                                  polh_pur_acct,
"
"                                  polh_cc_code,
"
"                                  polh_mill_suplr_name,
"
"                                  polh_op_ord_cl_reason,
"
"                                  polh_fab_item_type,
"
"                                  polh_temp_inv_qty,
"
"                                  polh_inv_qty,
"
"                                  polh_temp_in_progress,
"
"                                  polh_inv_sel_flag,
"
"                                  polh_bom_no,
"
"                                  polh_bom_name,
"
"                                  polh_no_of_bags,
"
"                                  polh_rwk_rcpt_sub_seq_no,
"
"                                  polh_sou_oprn_seq,
"
"                                  polh_sou_proc_id,
"
"                                  polh_tar_oprn_seq,
"
"                                  polh_tar_proc_id,
"
"                                  polh_csr_doc_no,
"
"                                  polh_store_id,
"
"                                  polh_store_name,
"
"                                  polh_required_date,
"
"                                  polh_promise_date,
"
"                                  polh_so_schld_desc,
"
"                                  polh_so_type,
"
"                                  polh_so_pfx,
"
"                                  polh_so_no,
"
"                                  polh_so_seq_no,
"
"                                  polh_so_sub_seq_no,
"
"                                  polh_proj_id,
"
"                                  polh_task_id,
"
"                                  polh_tax_pct,
"
"                                  polh_igst_amt,
"
"                                  polh_sgst_amt,
"
"                                  polh_cgst_amt,
"
"                                  polh_utgst_amt,
"
"                                  polh_cess_pct,
"
"                                  polh_cess_amt,
"
"                                  polh_suplr_chrg_flag,
"
"                                  polh_assbl_val,
"
"                                  polh_li_mov_type,
"
"                                  polh_lo_inv_qty,
"
"                                  polh_lo_rcpt_qty,
"
"                                  polh_plnt,
"
"                                  polh_proc_qty,
"
"                                  polh_inproc_qty,
"
"                                  polh_route_card_no,
"
"                                  polh_sys_ls_no,
"
"                                  polh_lot_no,
"
"                                  polh_ser_no,
"
"                                  polh_heat_no,
"
"                                  polh_test_no,
"
"                                  polh_sel_flag,
"
"                                  polh_sel_user,
"
"                                  polh_pr_pfx,
"
"                                  polh_pr_no,
"
"                                  polh_pr_seq_no,
"
"                                  polh_rcpt_stk_qty,
"
"                                  polh_tot_rcpt_qty,
"
"                                  polh_tolr_type,
"
"                                  polh_tolr_pct,
"
"                                  polh_excess_qty,
"
"                                  polh_delay_reason,
"
"                                  polh_rcpt_plnt,
"
"                                  polh_rcpt_plnt_loc_id,
"
"                                  polh_rcpt_plnt_loc_name,
"
"                                  polh_asn_no,
"
"                                  polh_asn_proc_qty,
"
"                                  polh_asn_inproc_qty,
"
"                                  polh_asn_qty,
"
"                                  polh_igst_pct,
"
"                                  polh_sgst_pct,
"
"                                  polh_cgst_pct,
"
"                                  polh_utgst_pct,
"
"                                  polh_st_so_pfx,
"
"                                  polh_st_so_no,
"
"                                  polh_st_so_seq_no,
"
"                                  polh_trd_disc_pct,
"
"                                  polh_trd_disc_amt,
"
"                                  polh_spl_disc_pct,
"
"                                  polh_spl_disc_amt,
"
"                                  polh_cash_disc_pct,
"
"                                  polh_cash_disc_amt,
"
"                                  polh_matl_type,
"
"                                  polh_mds_no,
"
"                                  polh_mds_rev,
"
"				  polh_cess_rate,
"
"				  polh_basis,
"
"				  polh_proc_val,
"
"				  polh_inproc_val,
"
"				  polh_rcpt_val,
"
"				  polh_net_wght,
"
"	                          polh_rate_per_wght
"
"                                 )
"
"                           SELECT pol_bu,
"
"                                  pol_order_no,
"
"                                  pol_seq_no,
"
"                                  pol_prod_id,
"
"                                  pol_prod_rev,
"
"                                  pol_prod_desc1,
"
"                                  pol_prod_cls,
"
"                                  pol_prod_cls_desc,
"
"                                  pol_prod_sub_cls,
"
"                                  pol_prod_sub_cls_desc,
"
"                                  pol_uom,
"
"                                  pol_prod_uom,
"
"                                  pol_conv_factor,
"
"                                  pol_cost_basis,
"
"                                  pol_contract_id,
"
"                                  pol_sc_unit_cost,
"
"                                  pol_disc_pct,
"
"                                  pol_scon_mat_unit_cost,
"
"                                  pol_qc_required,
"
"                                  pol_stocked,
"
"                                  pol_ordered_qty,
"
"                                  pol_received_qty,
"
"                                  pol_deflt_schld_flag,
"
"                                  pol_net_disc_flag,
"
"                                  pol_origin,
"
"                                  pol_proj_flag,
"
"                                  pol_status,
"
"                                  pol_tolr_qty,
"
"                                  pol_tot_received_qty,
"
"                                  pol_rejected_qty,
"
"                                  pol_cs_narration,
"
"                                  pol_suplr_prod_id,
"
"                                  pol_suplr_prod_desc,
"
"                                  pol_parent_prod_id,
"
"                                  pol_parent_prod_rev,
"
"                                  pol_rate_finalize,
"
"                                  pol_work_ord_no,
"
"                                  pol_rwk_rcpt_seq_no,
"
"                                  pol_prim_rwk_qty,
"
"                                  pol_sec_rwk_qty,
"
"                                  pol_rwk_rcpt_pfx,
"
"                                  pol_rwk_rcpt_no,
"
"                                  pol_disc_amt,
"
"                                  pol_scrap_qty,
"
"                                  pol_amd_no,
"
"                                  pol_contr_pfx,
"
"                                  pol_prod_ord_no,
"
"                                  pol_sf_code,
"
"                                  pol_bom_avail_flag,
"
"                                  pol_print_seq_no,
"
"                                  pol_ins_plan_no,
"
"                                  pol_ins_plan_rev,
"
"                                  pol_test_req_flag,
"
"                                  pol_cert_id,
"
"                                  pol_rfq_pfx,
"
"                                  pol_rfq_no,
"
"                                  pol_suplr_qtn_no,
"
"                                  pol_suplr_resp_date,
"
"                                  pol_contr_amd_no,
"
"                                  pol_ref,
"
"                                  pol_amend_reason,
"
"                                  pol_amd_date,
"
"                                  pol_prod_ext_desc,
"
"                                  pol_drawing_no,
"
"                                  pol_drawing_rev,
"
"                                  pol_wvd_flag,
"
"                                  pol_rwk_rcpt_type,
"
"                                  pol_spr_type,
"
"                                  pol_foc_flag,
"
"                                  pol_targ_sf_code,
"
"                                  pol_rwk_queue_type,
"
"                                  pol_sou_mat_weight,
"
"                                  pol_tar_mat_weight,
"
"                                  pol_plnd_scrap_weight,
"
"                                  pol_plnd_hr_unit,
"
"                                  pol_dim_req_flag,
"
"                                  pol_thickness,
"
"                                  pol_length,
"
"                                  pol_width,
"
"                                  pol_vis_insp_flag,
"
"                                  pol_qty_in_nos,
"
"                                  pol_rcpt_rev_flag,
"
"                                  pol_serv_prod_id,
"
"                                  pol_serv_io_type,
"
"                                  pol_amc_start_date,
"
"                                  pol_amc_end_date,
"
"                                  pol_amend_id,
"
"                                  pol_serv_prod_desc,
"
"                                  pol_install_req_flag,
"
"                                  pol_cs_id,
"
"                                  pol_tool_wo_no,
"
"                                  pol_scr_pct,
"
"                                  pol_scr_weight,
"
"                                  pol_alow_scr_qty,
"
"                                  pol_cls_sel_flag,
"
"                                  pol_cls_sel_user,
"
"                                  pol_cls_proc_qty,
"
"                                  pol_cls_qty,
"
"                                  pol_cap_asset_id,
"
"                                  pol_mat_req_trans_no,
"
"                                  pol_po_auto_cs_flag,
"
"                                  pol_po_auto_cs_pct,
"
"                                  pol_enquiry_no,
"
"                                  pol_hsn_code,
"
"                                  pol_gst_rev_tax_cat_id,
"
"                                  pol_catalog_no,
"
"                                  pol_mchn_id,
"
"                                  pol_sub_dept_id,
"
"                                  pol_dc_no,
"
"                                  pol_mrp_rel_qty,
"
"                                  pol_mftr_id,
"
"                                  pol_mftr_part_no,
"
"                                  pol_category_id,
"
"                                  pol_gst_exempt_flag,
"
"                                  pol_eqpmt_id,
"
"                                  pol_eqpmt_desc,
"
"                                  pol_rfq_seq_no,
"
"                                  pol_insp_pln_no,
"
"                                  pol_insp_pln_rev,
"
"                                  pol_mrkt_price,
"
"                                  pol_pr_ref,
"
"                                  pol_mchn_grp_id,
"
"                                  pol_stk_tr_so_pfx,
"
"                                  pol_stk_tr_so_no,
"
"                                  pol_stk_tr_so_seq_no,
"
"                                  pol_lm_disc_amt,
"
"                                  pol_warranty_date,
"
"                                  pol_instal_chrg_amt,
"
"                                  pol_make_id,
"
"                                  pol_model,
"
"                                  pol_wvd_basis,
"
"                                  pol_wvd_shrt_type,
"
"                                  pol_wvd_excs_type,
"
"                                  pol_gross_amt,
"
"                                  pol_tax_amt,
"
"                                  pol_net_amt,
"
"                                  pol_prod_grp,
"
"                                  pol_prod_grp_desc,
"
"                                  pol_prod_subgrp,
"
"                                  pol_prod_subgrp_desc,
"
"                                  pol_hs_tariff_code,
"
"                                  pol_rwk_rcpt_rev,
"
"                                  pol_prod_outer_dia,
"
"                                  pol_gst_input_type,
"
"                                  pol_ord_stk_qty,
"
"                                  pol_cre_by,
"
"                                  pol_cre_ip_addr,
"
"                                  pol_cre_os_user,
"
"                                  pol_cre_date,
"
"                                  pol_upd_by,
"
"                                  pol_upd_ip_addr,
"
"                                  pol_upd_os_user,
"
"                                  pol_upd_date,
"
"                                  pol_cre_emp_id,
"
"                                  pol_upd_emp_id,
"
"                                  pol_last_po_price,
"
"                                  pol_iss_code,
"
"                                  pol_disc_unit_amt,
"
"                                  pol_proj_lvl_id,
"
"                                  pol_proj_lvl_desc,
"
"                                  pol_height,
"
"                                  pol_inner_dia,
"
"                                  pol_density,
"
"                                  pol_pur_acct,
"
"                                  pol_cc_code,
"
"                                  pol_mill_suplr_name,
"
"                                  pol_op_ord_cl_reason,
"
"                                  pol_fab_item_type,
"
"                                  pol_temp_inv_qty,
"
"                                  pol_inv_qty,
"
"                                  pol_temp_in_progress,
"
"                                  pol_inv_sel_flag,
"
"                                  pol_bom_no,
"
"                                  pol_bom_name,
"
"                                  pol_no_of_bags,
"
"                                  pol_rwk_rcpt_sub_seq_no,
"
"                                  pol_sou_oprn_seq,
"
"                                  pol_sou_proc_id,
"
"                                  pol_tar_oprn_seq,
"
"                                  pol_tar_proc_id,
"
"                                  pol_csr_doc_no,
"
"                                  pol_store_id,
"
"                                  pol_store_name,
"
"                                  pol_required_date,
"
"                                  pol_promise_date,
"
"                                  pol_so_schld_desc,
"
"                                  pol_so_type,
"
"                                  pol_so_pfx,
"
"                                  pol_so_no,
"
"                                  pol_so_seq_no,
"
"                                  pol_so_sub_seq_no,
"
"                                  pol_proj_id,
"
"                                  pol_task_id,
"
"                                  pol_tax_pct,
"
"                                  pol_igst_amt,
"
"                                  pol_sgst_amt,
"
"                                  pol_cgst_amt,
"
"                                  pol_utgst_amt,
"
"                                  pol_cess_pct,
"
"                                  pol_cess_amt,
"
"                                  pol_suplr_chrg_flag,
"
"                                  pol_assbl_val,
"
"                                  pol_li_mov_type,
"
"                                  pol_lo_inv_qty,
"
"                                  pol_lo_rcpt_qty,
"
"                                  pol_plnt,
"
"                                  pol_proc_qty,
"
"                                  pol_inproc_qty,
"
"                                  pol_route_card_no,
"
"                                  pol_sys_ls_no,
"
"                                  pol_lot_no,
"
"                                  pol_ser_no,
"
"                                  pol_heat_no,
"
"                                  pol_test_no,
"
"                                  pol_sel_flag,
"
"                                  pol_sel_user,
"
"                                  pol_pr_pfx,
"
"                                  pol_pr_no,
"
"                                  pol_pr_seq_no,
"
"                                  pol_rcpt_stk_qty,
"
"                                  pol_tot_rcpt_qty,
"
"                                  pol_tolr_type,
"
"                                  pol_tolr_pct,
"
"                                  pol_excess_qty,
"
"                                  pol_delay_reason,
"
"                                  pol_rcpt_plnt,
"
"                                  pol_rcpt_plnt_loc_id,
"
"                                  pol_rcpt_plnt_loc_name,
"
"                                  pol_asn_no,
"
"                                  pol_asn_proc_qty,
"
"                                  pol_asn_inproc_qty,
"
"                                  pol_asn_qty,
"
"                                  pol_igst_pct,
"
"                                  pol_sgst_pct,
"
"                                  pol_cgst_pct,
"
"                                  pol_utgst_pct,
"
"                                  pol_st_so_pfx,
"
"                                  pol_st_so_no,
"
"                                  pol_st_so_seq_no,
"
"                                  pol_trd_disc_pct,
"
"                                  pol_trd_disc_amt,
"
"                                  pol_spl_disc_pct,
"
"                                  pol_spl_disc_amt,
"
"                                  pol_cash_disc_pct,
"
"                                  pol_cash_disc_amt,
"
"                                  pol_matl_type,
"
"                                  pol_mds_no,
"
"                                  pol_mds_rev,
"
"				  pol_cess_rate,
"
"				  pol_basis,
"
"				  pol_proc_val,
"
"				  pol_inproc_val,
"
"				  pol_rcpt_val,
"
"				  pol_net_wght,
"
"	                          pol_rate_per_wght
"
"                             FROM pur_order_ln
"
"                            WHERE pol_bu = p_bu
"
"                              AND pol_order_no = p_ord_no;
"
"
"
"    INSERT INTO po_hd_tnc_attr_hist(phtah_bu,
"
"				    phtah_po_no,
"
"				    phtah_seq_no,
"
"				    phtah_attr_id,
"
"				    phtah_print_seq,
"
"				    phtah_tmplt_no,
"
"				    phtah_cre_by,
"
"				    phtah_cre_ip_addr,
"
"				    phtah_cre_os_user,
"
"				    phtah_cre_date,
"
"				    phtah_upd_by,
"
"				    phtah_upd_ip_addr,
"
"				    phtah_upd_os_user,
"
"				    phtah_upd_date,
"
"				    phtah_cre_emp_id,
"
"				    phtah_upd_emp_id
"
"				   )
"
"                            SELECT phta_bu,
"
"                           	   phta_po_no,
"
"                           	   phta_seq_no,
"
"                           	   phta_attr_id,
"
"                           	   phta_print_seq,
"
"                           	   phta_tmplt_no,
"
"                           	   phta_cre_by,
"
"                           	   phta_cre_ip_addr,
"
"                           	   phta_cre_os_user,
"
"                           	   phta_cre_date,
"
"                           	   phta_upd_by,
"
"                           	   phta_upd_ip_addr,
"
"                           	   phta_upd_os_user,
"
"                           	   phta_upd_date,
"
"                           	   phta_cre_emp_id,
"
"                           	   phta_upd_emp_id
"
"                              FROM po_hd_tnc_attr
"
"                             WHERE phta_bu = p_bu
"
"                               AND phta_po_no = p_ord_no;
"
"
"
"    INSERT INTO po_hd_tnc_attr_val_hist(phtavh_bu,
"
"                                        phtavh_po_no,
"
"                                        phtavh_seq_no,
"
"	                                phtavh_sub_seq_no,
"
"	                                phtavh_attr_val,
"
"                                        phtavh_cre_by,
"
"					phtavh_cre_emp_id,
"
"					phtavh_cre_ip_addr,
"
"					phtavh_cre_os_user,
"
"                                        phtavh_cre_date,
"
"                                        phtavh_upd_by,
"
"					phtavh_upd_emp_id,
"
"					phtavh_upd_ip_addr,
"
"					phtavh_upd_os_user,
"
"                                        phtavh_upd_date
"
"				       )
"
"                                SELECT phtav_bu,
"
"                                       phtav_po_no,
"
"                                       phtav_seq_no,
"
"                            	       phtav_sub_seq_no,
"
"                            	       phtav_attr_val,
"
"                                       phtav_cre_by,
"
"                            	       phtav_cre_emp_id,
"
"                            	       phtav_cre_ip_addr,
"
"                            	       phtav_cre_os_user,
"
"                                       phtav_cre_date,
"
"                                       phtav_upd_by,
"
"                            	       phtav_upd_emp_id,
"
"                            	       phtav_upd_ip_addr,
"
"                            	       phtav_upd_os_user,
"
"                                       phtav_upd_date
"
"                                  FROM po_hd_tnc_attr_val
"
"                                 WHERE phtav_bu = p_bu
"
"                                   AND phtav_po_no = p_ord_no;
"
"
"
"    /*INSERT INTO po_ln_tnc_attr_hist(pltah_bu,
"
"                                    pltah_po_no,
"
"                                    pltah_po_seq_no,
"
"                                    pltah_seq_no,
"
"                                    pltah_attr_id,
"
"                                    pltah_print_seq,
"
"                                    pltah_cre_by,
"
"				    pltah_cre_emp_id,
"
"				    pltah_cre_ip_addr,
"
"				    pltah_cre_os_user,
"
"                                    pltah_cre_date,
"
"                                    pltah_upd_by,
"
"				    pltah_upd_emp_id,
"
"				    pltah_upd_ip_addr,
"
"				    pltah_upd_os_user,
"
"                                    pltah_upd_date
"
"				   )
"
"    SELECT plta_bu,
"
"           plta_po_no,
"
"           plta_po_seq_no,
"
"           plta_seq_no,
"
"           plta_attr_id,
"
"           plta_print_seq,
"
"           plta_cre_by,
"
"	   plta_cre_emp_id,
"
"	   plta_cre_ip_addr,
"
"	   plta_cre_os_user,
"
"           plta_cre_date,
"
"           plta_upd_by,
"
"	   plta_upd_emp_id,
"
"	   plta_upd_ip_addr,
"
"	   plta_upd_os_user,
"
"           plta_upd_date
"
"      FROM po_ln_tnc_attr
"
"     WHERE plta_bu = p_bu
"
"       AND plta_po_no = p_ord_no;
"
"
"
"    INSERT INTO po_ln_tnc_attr_val_hist(pltavh_bu,
"
"                                        pltavh_po_no,
"
"                                        pltavh_po_seq_no,
"
"                                        pltavh_seq_no,
"
"	                                pltavh_sub_seq_no,
"
"	                                pltavh_attr_val,
"
"                                        pltavh_cre_by,
"
"					pltavh_cre_emp_id,
"
"					pltavh_cre_ip_addr,
"
"					pltavh_cre_os_user,
"
"                                        pltavh_cre_date,
"
"                                        pltavh_upd_by,
"
"					pltavh_upd_emp_id,
"
"					pltavh_upd_ip_addr,
"
"					pltavh_upd_os_user,
"
"                                        pltavh_upd_date
"
"				       )
"
"    SELECT pltav_bu,
"
"           pltav_po_no,
"
"           pltav_po_seq_no,
"
"           pltav_seq_no,
"
"	   pltav_sub_seq_no,
"
"	   pltav_attr_val,
"
"           pltav_cre_by,
"
"	   pltav_cre_emp_id,
"
"	   pltav_cre_ip_addr,
"
"	   pltav_cre_os_user,
"
"           pltav_cre_date,
"
"           pltav_upd_by,
"
"	   pltav_upd_emp_id,
"
"	   pltav_upd_ip_addr,
"
"	   pltav_upd_os_user,
"
"           pltav_upd_date
"
"      FROM po_ln_tnc_attr_val
"
"     WHERE pltav_bu = p_bu
"
"       AND pltav_po_no = p_ord_no;*/
"
"
"
"
"
"    INSERT INTO po_prod_parts_cont_hist(poppch_bu,
"
"                                        poppch_ord_no,
"
"                                        poppch_ord_seq_no,
"
"                                        poppch_seq_no,
"
"                                        poppch_prod_id,
"
"                                        poppch_prod_rev,
"
"                                        poppch_qty,
"
"                                        poppch_cre_by,
"
"					poppch_cre_emp_id,
"
"					poppch_cre_ip_addr,
"
"					poppch_cre_os_user,
"
"                                        poppch_cre_date,
"
"                                        poppch_upd_by,
"
"					poppch_upd_emp_id,
"
"					poppch_upd_ip_addr,
"
"					poppch_upd_os_user,
"
"                                        poppch_upd_date,
"
"                                        poppch_prod_desc1
"
"				       )
"
"    SELECT poppc_bu,
"
"           poppc_ord_no,
"
"           poppc_ord_seq_no,
"
"           poppc_seq_no,
"
"           poppc_prod_id,
"
"           poppc_prod_rev,
"
"           poppc_qty,
"
"           poppc_cre_by,
"
"	   poppc_cre_emp_id,
"
"	   poppc_cre_ip_addr,
"
"	   poppc_cre_os_user,
"
"           poppc_cre_date,
"
"           poppc_upd_by,
"
"	   poppc_upd_emp_id,
"
"	   poppc_upd_ip_addr,
"
"	   poppc_upd_os_user,
"
"           poppc_upd_date,
"
"           poppc_prod_desc1
"
"      FROM po_prod_parts_cont
"
"     WHERE poppc_bu = p_bu
"
"       AND poppc_ord_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_attr_hist(poah_bu,
"
"                                  poah_ord_no,
"
"                                  poah_seq_no,
"
"                                  poah_attr_id,
"
"                                  poah_cre_by,
"
"				  poah_cre_emp_id,
"
"				  poah_cre_ip_addr,
"
"				  poah_cre_os_user,
"
"                                  poah_cre_date,
"
"                                  poah_upd_by,
"
"				  poah_upd_emp_id,
"
"				  poah_upd_ip_addr,
"
"				  poah_upd_os_user,
"
"                                  poah_upd_date
"
"				 )
"
"    SELECT poa_bu,
"
"           poa_ord_no,
"
"           poa_seq_no,
"
"           poa_attr_id,
"
"           poa_cre_by,
"
"	   poa_cre_emp_id,
"
"	   poa_cre_ip_addr,
"
"	   poa_cre_os_user,
"
"           poa_cre_date,
"
"           poa_upd_by,
"
"	   poa_upd_emp_id,
"
"	   poa_upd_ip_addr,
"
"	   poa_upd_os_user,
"
"           poa_upd_date
"
"      FROM pur_ord_attr
"
"     WHERE poa_bu = p_bu
"
"       AND poa_ord_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_attr_notes_hist(poanh_bu,
"
"                                        poanh_ord_no,
"
"                                        poanh_seq_no,
"
"                                        poanh_sub_seq_no,
"
"                                        poanh_note,
"
"                                        poanh_cre_by,
"
"					poanh_cre_emp_id,
"
"					poanh_cre_ip_addr,
"
"					poanh_cre_os_user,
"
"                                        poanh_cre_date,
"
"                                        poanh_upd_by,
"
"					poanh_upd_emp_id,
"
"					poanh_upd_ip_addr,
"
"					poanh_upd_os_user,
"
"                                        poanh_upd_date
"
"				       )
"
"    SELECT poan_bu,
"
"           poan_ord_no,
"
"           poan_seq_no,
"
"           poan_sub_seq_no,
"
"           poan_note,
"
"           poan_cre_by,
"
"	   poan_cre_emp_id,
"
"	   poan_cre_ip_addr,
"
"	   poan_cre_os_user,
"
"           poan_cre_date,
"
"           poan_upd_by,
"
"	   poan_upd_emp_id,
"
"	   poan_upd_ip_addr,
"
"	   poan_upd_os_user,
"
"           poan_upd_date
"
"      FROM pur_ord_attr_notes
"
"     WHERE poan_bu = p_bu
"
"       AND poan_ord_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_ln_prod_attr_hist(polpah_bu,
"
"                                          polpah_plnt,
"
"                                          polpah_po_no,
"
"                                          polpah_po_line_no,
"
"                                          polpah_seq_no,
"
"                                          polpah_attr_id,
"
"                                          polpah_cre_by,
"
"					  polpah_cre_emp_id,
"
"					  polpah_cre_ip_addr,
"
"					  polpah_cre_os_user,
"
"                                          polpah_cre_date,
"
"                                          polpah_upd_by,
"
"					  polpah_upd_emp_id,
"
"					  polpah_upd_ip_addr,
"
"					  polpah_upd_os_user,
"
"                                          polpah_upd_date
"
"					 )
"
"    SELECT polpa_bu,
"
"           polpa_plnt,
"
"           polpa_po_no,
"
"           polpa_po_line_no,
"
"           polpa_seq_no,
"
"           polpa_attr_id,
"
"           polpa_cre_by,
"
"	   polpa_cre_emp_id,
"
"	   polpa_cre_ip_addr,
"
"	   polpa_cre_os_user,
"
"           polpa_cre_date,
"
"           polpa_upd_by,
"
"	   polpa_upd_emp_id,
"
"	   polpa_upd_ip_addr,
"
"	   polpa_upd_os_user,
"
"           polpa_upd_date
"
"      FROM pur_ord_ln_prod_attr
"
"     WHERE polpa_bu = p_bu
"
"       AND polpa_po_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_ln_prod_attr_note_hist(polpanh_bu,
"
"                                               polpanh_plnt,
"
"                                               polpanh_po_no,
"
"                                               polpanh_line_no,
"
"                                               polpanh_seq_no,
"
"                                               polpanh_sub_seq_no,
"
"                                               polpanh_notes,
"
"                                               polpanh_cre_by,
"
"					       polpanh_cre_emp_id,
"
"					       polpanh_cre_ip_addr,
"
"					       polpanh_cre_os_user,
"
"                                               polpanh_cre_date,
"
"                                               polpanh_upd_by,
"
"					       polpanh_upd_emp_id,
"
"					       polpanh_upd_ip_addr,
"
"					       polpanh_upd_os_user,
"
"                                               polpanh_upd_date
"
"					      )
"
"    SELECT polpan_bu,
"
"           polpan_plnt,
"
"           polpan_po_no,
"
"           polpan_line_no,
"
"           polpan_seq_no,
"
"           polpan_sub_seq_no,
"
"           polpan_notes,
"
"           polpan_cre_by,
"
"	   polpan_cre_emp_id,
"
"	   polpan_cre_ip_addr,
"
"	   polpan_cre_os_user,
"
"           polpan_cre_date,
"
"           polpan_upd_by,
"
"	   polpan_upd_emp_id,
"
"	   polpan_upd_ip_addr,
"
"	   polpan_upd_os_user,
"
"           polpan_upd_date
"
"      FROM pur_ord_ln_prod_attr_notes
"
"     WHERE polpan_bu = p_bu
"
"       AND polpan_po_no = p_ord_no;
"
"
"
" /*   INSERT INTO pur_ord_pay_schedule_hist(popsh_bu,
"
"                                          popsh_plnt,
"
"                                          popsh_order_no,
"
"                                          popsh_seq_no,
"
"                                          popsh_ms_id,
"
"                                          popsh_due_date,
"
"                                          popsh_due_amt,
"
"                                          popsh_due_pct,
"
"                                          popsh_due_days,
"
"                                          popsh_cre_by,
"
"					  popsh_cre_emp_id,
"
"					  popsh_cre_ip_addr,
"
"					  popsh_cre_os_user,
"
"                                          popsh_cre_date,
"
"                                          popsh_upd_by,
"
"					  popsh_upd_emp_id,
"
"					  popsh_upd_ip_addr,
"
"					  popsh_upd_os_user,
"
"                                          popsh_upd_date
"
"					 )
"
"    SELECT pops_bu,
"
"           pops_plnt,
"
"           pops_order_no,
"
"           pops_seq_no,
"
"           pops_ms_id,
"
"           pops_due_date,
"
"           pops_due_amt,
"
"           pops_due_pct,
"
"           pops_due_days,
"
"           pops_cre_by,
"
"	   pops_cre_emp_id,
"
"	   pops_cre_ip_addr,
"
"	   pops_cre_os_user,
"
"           pops_cre_date,
"
"           pops_upd_by,
"
"	   pops_upd_emp_id,
"
"	   pops_upd_ip_addr,
"
"	   pops_upd_os_user,
"
"           pops_upd_date
"
"      FROM pur_ord_pay_schedule
"
"     WHERE pops_bu = p_bu
"
"       AND pops_order_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_pay_schedule
"
"     WHERE pops_bu = p_bu
"
"       AND pops_order_no = p_ord_no;*/
"
"
"
"    DELETE FROM pur_ord_ln_prod_attr_notes
"
"     WHERE polpan_bu = p_bu
"
"       AND polpan_po_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_ln_prod_attr
"
"     WHERE polpa_bu = p_bu
"
"       AND polpa_po_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_attr_notes
"
"     WHERE poan_bu = p_bu
"
"       AND poan_ord_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_attr
"
"     WHERE poa_bu = p_bu
"
"       AND poa_ord_no = p_ord_no;
"
"
"
"    DELETE FROM po_prod_parts_cont
"
"     WHERE poppc_bu = p_bu
"
"       AND poppc_ord_no = p_ord_no;
"
"
"
"    DELETE FROM po_ln_tnc_attr_val
"
"     WHERE pltav_bu = p_bu
"
"       AND pltav_po_no = p_ord_no;
"
"
"
"    DELETE FROM po_ln_tnc_attr
"
"     WHERE plta_bu = p_bu
"
"       AND plta_po_no = p_ord_no;
"
"
"
"    DELETE FROM po_hd_tnc_attr_val
"
"     WHERE phtav_bu = p_bu
"
"       AND phtav_po_no = p_ord_no;
"
"
"
"    DELETE FROM po_hd_tnc_attr
"
"     WHERE phta_bu = p_bu
"
"       AND phta_po_no = p_ord_no;
"
"
"
"    DELETE FROM pur_order_ln
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_no = p_ord_no;
"
"
"
"    DELETE FROM pur_order_hd
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_no = p_ord_no;
"
"
"
"  END proc_ins_po_hist;
"
"
"
"  PROCEDURE proc_rev_po_hist(p_bu		pur_order_hd.poh_bu%TYPE,
"
"			     p_ord_pfx		pur_order_hd.poh_order_pfx%TYPE,
"
"			     p_ord_no		pur_order_hd.poh_order_no%TYPE
"
"			    )
"
"  AS
"
"  BEGIN
"
"
"
"    /*INSERT INTO pur_order_hd(poh_bu,
"
"                             poh_mode,
"
"                             poh_order_pfx,
"
"                             poh_order_no,
"
"                             poh_suplr_id,
"
"                             poh_suplr_name,
"
"                             poh_order_date,
"
"                             poh_order_year,
"
"                             poh_order_period,
"
"                             poh_currency,
"
"                             poh_exchange_rate,
"
"                             poh_status,
"
"                             poh_shipvia_id,
"
"                             poh_term_id,
"
"                             poh_fob_id,
"
"                             poh_control_person,
"
"                             poh_lcg_base_flag,
"
"                             poh_lcg_doc_type,
"
"                             poh_lc_pfx,
"
"                             poh_lc_no,
"
"                             poh_buyer_id,
"
"                             poh_origin,
"
"                             poh_adv_payable,
"
"                             poh_adv_paid,
"
"                             poh_adv_paid_on,
"
"                             poh_sent_on,
"
"                             poh_sent_by,
"
"                             poh_sent_via,
"
"                             poh_part_ship_flag,
"
"                             poh_ack_require,
"
"                             poh_ack_rcvd_on,
"
"                             poh_ack_rcvd_by,
"
"                             poh_ack_rcvd_via,
"
"                             poh_reqstr_id,
"
"                             poh_reqstr_name,
"
"                             poh_reqstr_pos_id,
"
"                             poh_reqstr_pos_name,
"
"                             poh_rqst_dept_id,
"
"                             poh_apprvr_id,
"
"                             poh_apprvr_name,
"
"                             poh_apprvr_pos_id,
"
"                             poh_apprvr_pos_name,
"
"                             poh_apprvr_dept_id,
"
"                             poh_apprvd_date,
"
"                             poh_tax_flag,
"
"                             poh_appl_source,
"
"                             poh_sou_doc_pfx,
"
"                             poh_sou_doc_no,
"
"                             poh_type,
"
"                             poh_amend_flag,
"
"                             poh_blanket_pfx,
"
"                             poh_blanket_no,
"
"                             poh_blanket_rev,
"
"                             poh_stk_trn_so_pfx,
"
"                             poh_stk_trn_so_no,
"
"                             poh_cs_narration,
"
"                             poh_ins_pay_flag,
"
"                             poh_tax_req_flag,
"
"                             poh_frwd_date,
"
"                             poh_other_flag,
"
"                             poh_plant,
"
"                             poh_to_plant,
"
"                             poh_ct3_no,
"
"                             poh_ct3_date,
"
"                             poh_suplr_doc_no,
"
"                             poh_suplr_doc_date,
"
"                             poh_wf_status,
"
"                             poh_adv_req_flag,
"
"                             poh_adv_pct,
"
"                             poh_adv_to_payd,
"
"                             poh_adv_payd,
"
"                             poh_adv_doc_pfx,
"
"                             poh_adv_doc_no,
"
"                             poh_lc_req_flag,
"
"                             poh_lc_pct,
"
"                             poh_lc_amt,
"
"                             poh_lc_doc_pfx,
"
"                             poh_lc_doc_no,
"
"                             poh_lc_valid_freq,
"
"                             poh_lc_valid_dur,
"
"                             poh_terr_id,
"
"                             poh_ref,
"
"                             poh_amend_no,
"
"                             poh_amend_date,
"
"                             poh_amend_reason,
"
"                             poh_suplr_ord_acpt_no,
"
"                             poh_suplr_ord_acpt_date,
"
"                             poh_transp_id,
"
"                             poh_suplr_edc_date,
"
"                             poh_trns_lr_date,
"
"                             poh_trns_lr_no,
"
"                             poh_frt_scope,
"
"                             poh_rcpt_rev_flag,
"
"                             poh_amend_id,
"
"                             poh_loc_id,
"
"                             poh_adv_sel_flag,
"
"                             poh_adv_sel_user,
"
"                             poh_adv_proc_qty,
"
"                             poh_cs_id,
"
"                             poh_gen_po_flag,
"
"                             poh_capex_bud_no,
"
"                             poh_lab_ord_int_source,
"
"                             poh_mrp_no,
"
"                             poh_adv_in_progress,
"
"                             poh_broker_id,
"
"                             poh_for_type,
"
"                             poh_sc_mr_type,
"
"                             poh_billfr_loc_id,
"
"                             poh_ord_type,
"
"                             poh_suplr_contr_no,
"
"                             poh_total_amt,
"
"                             poh_buyer_emp_id,
"
"                             poh_late_ded_disc_pct,
"
"                             poh_billto_loc_id,
"
"                             poh_dir_bro_type,
"
"                             poh_plnt_loc_id,
"
"                             poh_swo_type,
"
"                             poh_mail_sub_msg,
"
"                             poh_mail_body_msg,
"
"                             poh_csd_cust_id,
"
"                             poh_csd_prod_id,
"
"                             poh_csd_prod_rev,
"
"                             poh_csd_mchn_serial_no,
"
"                             poh_csd_sale_inv_pfx,
"
"                             poh_csd_sale_inv_no,
"
"                             poh_lm_disc_amt,
"
"                             poh_sos_cost_flag,
"
"                             poh_csr_doc_no,
"
"                             poh_rr_no,
"
"                             poh_cash_disc_pct,
"
"                             poh_rr_flag,
"
"                             poh_shipto_loc_id,
"
"                             poh_suplr_sale_contr_no,
"
"                             poh_suplr_sale_contr_date,
"
"                             poh_adv_paid_amt_bc,
"
"                             poh_adv_paid_avg_exrate,
"
"                             poh_upd_cost_flag,
"
"                             poh_spn_brkr_comm_basis,
"
"                             poh_spn_brkr_comm_amt,
"
"                             poh_spn_brkr_comm_payble,
"
"                             poh_vertical_type,
"
"                             poh_sp_inst,
"
"                             poh_payment_detail,
"
"                             poh_vat_cst,
"
"                             poh_ed,
"
"                             poh_insurance,
"
"                             poh_frieght,
"
"                             poh_forwarding,
"
"                             poh_pack_forwd,
"
"                             poh_delivery,
"
"                             poh_dest,
"
"                             poh_e2_form,
"
"                             poh_e1_form,
"
"                             poh_so_ref,
"
"                             poh_import_flag,
"
"                             poh_cmsng_po_list_flag,
"
"                             poh_lc_rqrd_flag,
"
"                             poh_cre_by,
"
"                             poh_cre_ip_addr,
"
"                             poh_cre_os_user,
"
"                             poh_cre_date,
"
"                             poh_upd_by,
"
"                             poh_upd_ip_addr,
"
"                             poh_upd_os_user,
"
"                             poh_upd_date,
"
"                             poh_cust_id,
"
"                             poh_paymnt_recv_flag,
"
"                             poh_cre_emp_id,
"
"                             poh_upd_emp_id,
"
"                             poh_prof_inv_no,
"
"                             poh_prof_inv_date,
"
"                             poh_form_a,
"
"                             poh_mat_amt,
"
"                             poh_tax_amt,
"
"                             poh_disc_amt,
"
"                             poh_rnd_amt,
"
"                             poh_tot_amt,
"
"                             poh_form_27c,
"
"                             poh_par_ord_pfx,
"
"                             poh_par_ord_no,
"
"                             poh_route_card_no,
"
"                             poh_par_ord_type,
"
"                             poh_proj_id,
"
"                             poh_inv_sel_flag,
"
"                             poh_inv_sel_user,
"
"                             poh_shipto_type,
"
"                             poh_pan_no,
"
"                             poh_aadhaar_no,
"
"                             poh_pan_avail_type,
"
"                             poh_tcs_amt,
"
"                             poh_ins_policy_no,
"
"                             poh_eauc_flag,
"
"                             poh_eauc_type,
"
"                             poh_eauc_ref,
"
"                             poh_eauc_emd_amt,
"
"                             poh_gst_type,
"
"                             poh_gst_clf_type,
"
"                             poh_cc_code,
"
"                             poh_plnt_loc_name,
"
"                             poh_net_weight,
"
"                             poh_billto_gst_type,
"
"                             poh_billto_clf_type,
"
"			     poh_gen_mrp_flag,
"
"			     poh_billfr_clf_type,
"
"			     poh_broker_amt
"
"			    )
"
"    SELECT pohh_bu,
"
"           pohh_mode,
"
"           pohh_order_pfx,
"
"           pohh_order_no,
"
"           pohh_suplr_id,
"
"           pohh_suplr_name,
"
"           pohh_order_date,
"
"           pohh_order_year,
"
"           pohh_order_period,
"
"           pohh_currency,
"
"           pohh_exchange_rate,
"
"           pohh_status,
"
"           pohh_shipvia_id,
"
"           pohh_term_id,
"
"           pohh_fob_id,
"
"           pohh_control_person,
"
"           pohh_lcg_base_flag,
"
"           pohh_lcg_doc_type,
"
"           pohh_lc_pfx,
"
"           pohh_lc_no,
"
"           pohh_buyer_id,
"
"           pohh_origin,
"
"           pohh_adv_payable,
"
"           pohh_adv_paid,
"
"           pohh_adv_paid_on,
"
"           pohh_sent_on,
"
"           pohh_sent_by,
"
"           pohh_sent_via,
"
"           pohh_part_ship_flag,
"
"           pohh_ack_require,
"
"           pohh_ack_rcvd_on,
"
"           pohh_ack_rcvd_by,
"
"           pohh_ack_rcvd_via,
"
"           pohh_reqstr_id,
"
"           pohh_reqstr_name,
"
"           pohh_reqstr_pos_id,
"
"           pohh_reqstr_pos_name,
"
"           pohh_rqst_dept_id,
"
"           pohh_apprvr_id,
"
"           pohh_apprvr_name,
"
"           pohh_apprvr_pos_id,
"
"           pohh_apprvr_pos_name,
"
"           pohh_apprvr_dept_id,
"
"           pohh_apprvd_date,
"
"           pohh_tax_flag,
"
"           pohh_appl_source,
"
"           pohh_sou_doc_pfx,
"
"           pohh_sou_doc_no,
"
"           pohh_type,
"
"           pohh_amend_flag,
"
"           pohh_blanket_pfx,
"
"           pohh_blanket_no,
"
"           pohh_blanket_rev,
"
"           pohh_stk_trn_so_pfx,
"
"           pohh_stk_trn_so_no,
"
"           pohh_cs_narration,
"
"           pohh_ins_pay_flag,
"
"           pohh_tax_req_flag,
"
"           pohh_frwd_date,
"
"           pohh_other_flag,
"
"           pohh_plant,
"
"           pohh_to_plant,
"
"           pohh_ct3_no,
"
"           pohh_ct3_date,
"
"           pohh_suplr_doc_no,
"
"           pohh_suplr_doc_date,
"
"           pohh_wf_status,
"
"           pohh_adv_req_flag,
"
"           pohh_adv_pct,
"
"           pohh_adv_to_payd,
"
"           pohh_adv_payd,
"
"           pohh_adv_doc_pfx,
"
"           pohh_adv_doc_no,
"
"           pohh_lc_req_flag,
"
"           pohh_lc_pct,
"
"           pohh_lc_amt,
"
"           pohh_lc_doc_pfx,
"
"           pohh_lc_doc_no,
"
"           pohh_lc_valid_freq,
"
"           pohh_lc_valid_dur,
"
"           pohh_terr_id,
"
"           pohh_ref,
"
"           pohh_suplr_ord_acpt_no,
"
"           pohh_suplr_ord_acpt_date,
"
"           pohh_transp_id,
"
"           pohh_suplr_edc_date,
"
"           pohh_trns_lr_date,
"
"           pohh_trns_lr_no,
"
"           pohh_frt_scope,
"
"           pohh_rcpt_rev_flag,
"
"           pohh_amend_id,
"
"           pohh_loc_id,
"
"           pohh_adv_sel_flag,
"
"           pohh_adv_sel_user,
"
"           pohh_adv_proc_qty,
"
"           pohh_cs_id,
"
"           pohh_gen_po_flag,
"
"           pohh_capex_bud_no,
"
"           pohh_lab_ord_int_source,
"
"           pohh_mrp_no,
"
"           pohh_adv_in_progress,
"
"           pohh_broker_id,
"
"           pohh_for_type,
"
"           pohh_sc_mr_type,
"
"           pohh_billfr_loc_id,
"
"           pohh_ord_type,
"
"           pohh_suplr_contr_no,
"
"           pohh_total_amt,
"
"           pohh_buyer_emp_id,
"
"           pohh_late_ded_disc_pct,
"
"           pohh_billto_loc_id,
"
"           pohh_dir_bro_type,
"
"           pohh_plnt_loc_id,
"
"           pohh_swo_type,
"
"           pohh_mail_sub_msg,
"
"           pohh_mail_body_msg,
"
"           pohh_csd_cust_id,
"
"           pohh_csd_prod_id,
"
"           pohh_csd_prod_rev,
"
"           pohh_csd_mchn_serial_no,
"
"           pohh_csd_sale_inv_pfx,
"
"           pohh_csd_sale_inv_no,
"
"           pohh_lm_disc_amt,
"
"           pohh_sos_cost_flag,
"
"           pohh_csr_doc_no,
"
"           pohh_rr_no,
"
"           pohh_cash_disc_pct,
"
"           pohh_rr_flag,
"
"           pohh_shipto_loc_id,
"
"           pohh_suplr_sale_contr_no,
"
"           pohh_suplr_sale_contr_date,
"
"           pohh_adv_paid_amt_bc,
"
"           pohh_adv_paid_avg_exrate,
"
"           pohh_upd_cost_flag,
"
"           pohh_spn_brkr_comm_basis,
"
"           pohh_spn_brkr_comm_amt,
"
"           pohh_spn_brkr_comm_payble,
"
"           pohh_vertical_type,
"
"           pohh_sp_inst,
"
"           pohh_payment_detail,
"
"           pohh_vat_cst,
"
"           pohh_ed,
"
"           pohh_insurance,
"
"           pohh_frieght,
"
"           pohh_forwarding,
"
"           pohh_pack_forwd,
"
"           pohh_delivery,
"
"           pohh_dest,
"
"           pohh_e2_form,
"
"           pohh_e1_form,
"
"           pohh_so_ref,
"
"           pohh_import_flag,
"
"           pohh_cmsng_po_list_flag,
"
"           pohh_lc_rqrd_flag,
"
"           pohh_cre_by,
"
"           pohh_cre_ip_addr,
"
"           pohh_cre_os_user,
"
"           pohh_cre_date,
"
"           pohh_upd_by,
"
"           pohh_upd_ip_addr,
"
"           pohh_upd_os_user,
"
"           pohh_upd_date,
"
"           pohh_cust_id,
"
"           pohh_paymnt_recv_flag,
"
"           pohh_cre_emp_id,
"
"           pohh_upd_emp_id,
"
"           pohh_prof_inv_no,
"
"           pohh_prof_inv_date,
"
"           pohh_form_a,
"
"           pohh_mat_amt,
"
"           pohh_tax_amt,
"
"           pohh_disc_amt,
"
"           pohh_rnd_amt,
"
"           pohh_tot_amt,
"
"           pohh_form_27c,
"
"           pohh_par_ord_pfx,
"
"           pohh_par_ord_no,
"
"           pohh_route_card_no,
"
"           pohh_par_ord_type,
"
"           pohh_proj_id,
"
"           pohh_inv_sel_flag,
"
"           pohh_inv_sel_user,
"
"           pohh_shipto_type,
"
"           pohh_pan_no,
"
"           pohh_aadhaar_no,
"
"           pohh_pan_avail_type,
"
"           pohh_tcs_amt,
"
"           pohh_ins_policy_no,
"
"           pohh_eauc_flag,
"
"           pohh_eauc_type,
"
"           pohh_eauc_ref,
"
"           pohh_eauc_emd_amt,
"
"           pohh_gst_type,
"
"           pohh_gst_clf_type,
"
"           pohh_cc_code,
"
"           pohh_plnt_loc_name,
"
"           pohh_net_weight,
"
"           pohh_billto_gst_type,
"
"           pohh_billto_clf_type,
"
"	   pohh_gen_mrp_flag,
"
"	   pohh_billfr_clf_type,
"
"	   pohh_broker_amt
"
"      FROM pur_order_hd_hist
"
"     WHERE pohh_bu = p_bu
"
"       AND pohh_order_no = p_ord_no;
"
"
"
"    INSERT INTO pur_order_ln(pol_bu,
"
"			     pol_order_no,
"
"			     pol_seq_no,
"
"			     pol_prod_id,
"
"			     pol_prod_rev,
"
"			     pol_prod_desc1,
"
"			     pol_prod_cls,
"
"			     pol_prod_cls_desc,
"
"			     pol_prod_sub_cls,
"
"			     pol_prod_sub_cls_desc,
"
"			     pol_uom,
"
"			     pol_prod_uom,
"
"			     pol_conv_factor,
"
"			     pol_cost_basis,
"
"			     pol_contract_id,
"
"			     pol_sc_unit_cost,
"
"			     pol_disc_pct,
"
"			     pol_scon_mat_unit_cost,
"
"			     pol_qc_required,
"
"			     pol_stocked,
"
"			     pol_ordered_qty,
"
"			     pol_received_qty,
"
"			     pol_deflt_schld_flag,
"
"			     pol_net_disc_flag,
"
"			     pol_origin,
"
"			     pol_proj_flag,
"
"			     pol_status,
"
"			     pol_qc_temp_qty,
"
"			     pol_tolr_qty,
"
"			     pol_bo_release_qty,
"
"			     pol_bo_released_qty,
"
"			     pol_abc_cls,
"
"			     pol_fv_cls,
"
"			     pol_price_div_pct,
"
"			     pol_sc_old_cost,
"
"			     pol_tot_received_qty,
"
"			     pol_rejected_qty,
"
"			     pol_cs_narration,
"
"			     pol_suplr_prod_id,
"
"			     pol_suplr_prod_desc,
"
"			     pol_parent_prod_id,
"
"			     pol_parent_prod_rev,
"
"			     pol_rate_finalize,
"
"			     pol_work_ord_no,
"
"			     pol_rwk_rcpt_seq_no,
"
"			     pol_prim_rwk_qty,
"
"			     pol_sec_rwk_qty,
"
"			     pol_rwk_rcpt_pfx,
"
"			     pol_rwk_rcpt_no,
"
"			     pol_disc_amt,
"
"			     pol_scrap_qty,
"
"			     pol_amd_no,
"
"			     pol_contr_pfx,
"
"			     pol_prod_ord_no,
"
"			     pol_sf_code,
"
"			     pol_pg_flag,
"
"			     pol_pg_id,
"
"			     pol_bom_avail_flag,
"
"			     pol_print_seq_no,
"
"			     pol_ins_plan_no,
"
"			     pol_ins_plan_rev,
"
"			     pol_test_req_flag,
"
"			     pol_cert_id,
"
"			     pol_rfq_pfx,
"
"			     pol_rfq_no,
"
"			     pol_quote_pfx,
"
"			     pol_quote_no,
"
"			     pol_tax_set_id,
"
"			     pol_qtn_no,
"
"			     pol_qtn_date,
"
"			     pol_qtn_pfx,
"
"			     pol_suplr_qtn_no,
"
"			     pol_suplr_resp_date,
"
"			     pol_contr_amd_no,
"
"			     pol_ref,
"
"			     pol_amend_reason,
"
"			     pol_rej_rcpt_pfx,
"
"			     pol_rej_rcpt_no,
"
"			     pol_rej_line_no,
"
"			     pol_rej_ord_no,
"
"			     pol_rej_trans_no,
"
"			     pol_amd_date,
"
"			     pol_tcf_id,
"
"			     pol_prod_ext_desc,
"
"			     pol_drawing_no,
"
"			     pol_drawing_rev,
"
"			     pol_wvd_flag,
"
"			     pol_rwk_rcpt_type,
"
"			     pol_prim_incent_amt,
"
"			     pol_sec_incent_amt,
"
"			     pol_spr_type,
"
"			     pol_foc_flag,
"
"			     pol_targ_sf_code,
"
"			     pol_rwk_queue_type,
"
"			     pol_budget_flag,
"
"			     pol_sou_mat_weight,
"
"			     pol_tar_mat_weight,
"
"			     pol_plnd_scrap_weight,
"
"			     pol_plnd_hr_unit,
"
"			     pol_dim_req_flag,
"
"			     pol_thickness,
"
"			     pol_length,
"
"			     pol_width,
"
"			     pol_vis_insp_flag,
"
"			     pol_qty_in_nos,
"
"			     pol_rcpt_rev_flag,
"
"			     pol_serv_prod_id,
"
"			     pol_serv_io_type,
"
"			     pol_amc_start_date,
"
"			     pol_amc_end_date,
"
"			     pol_amend_id,
"
"			     pol_serv_prod_desc,
"
"			     pol_install_req_flag,
"
"			     pol_cs_id,
"
"			     pol_tool_wo_no,
"
"			     pol_scr_pct,
"
"			     pol_scr_weight,
"
"			     pol_alow_scr_qty,
"
"			     pol_ls_uom_gen_type,
"
"			     pol_tax_exc_reason,
"
"			     pol_cls_sel_flag,
"
"			     pol_cls_sel_user,
"
"			     pol_cls_proc_qty,
"
"			     pol_cls_qty,
"
"			     pol_ctrl_set_no,
"
"			     pol_spec_doc_no,
"
"			     pol_spec_doc_rev,
"
"			     pol_cap_asset_id,
"
"			     pol_mat_req_trans_no,
"
"			     pol_po_auto_cs_flag,
"
"			     pol_po_auto_cs_pct,
"
"			     pol_no_of_bale,
"
"			     pol_enquiry_no,
"
"			     pol_avg_bale_weight,
"
"			     pol_hsn_code,
"
"			     pol_gst_rev_tax_cat_id,
"
"			     pol_catalog_no,
"
"			     pol_mchn_id,
"
"			     pol_sub_dept_id,
"
"			     pol_pre_mr_no,
"
"			     pol_pre_mr_seq_no,
"
"			     pol_pre_mr_date,
"
"			     pol_sco_mtrl_rqrd_flag,
"
"			     pol_dc_no,
"
"			     pol_fcm_bl_id,
"
"			     pol_fcm_proj_no,
"
"			     pol_mrp_rel_qty,
"
"			     pol_mftr_id,
"
"			     pol_mftr_part_no,
"
"			     pol_category_id,
"
"			     pol_gst_exempt_flag,
"
"			     pol_eqpmt_id,
"
"			     pol_eqpmt_desc,
"
"			     pol_gar_style,
"
"			     pol_gar_color,
"
"			     pol_gar_size,
"
"			     pol_qtn_seq_no,
"
"			     pol_insp_pln_no,
"
"			     pol_insp_pln_rev,
"
"			     pol_br_doc_no,
"
"			     pol_br_ln_seq_no,
"
"			     pol_mrkt_price,
"
"			     pol_pr_ref,
"
"			     pol_pr_no,
"
"			     pol_mchn_grp_id,
"
"			     pol_stk_tr_so_pfx,
"
"			     pol_stk_tr_so_no,
"
"			     pol_stk_tr_so_seq_no,
"
"			     pol_lm_disc_amt,
"
"			     pol_warranty_date,
"
"			     pol_instal_chrg_amt,
"
"			     pol_make_id,
"
"			     pol_model,
"
"			     pol_wvd_basis,
"
"			     pol_wvd_shrt_type,
"
"			     pol_wvd_excs_type,
"
"			     pol_brnd_id,
"
"			     pol_gross_amt,
"
"			     pol_tax_amt,
"
"			     pol_net_amt,
"
"			     pol_prod_grp,
"
"			     pol_prod_grp_desc,
"
"			     pol_prod_subgrp,
"
"			     pol_prod_subgrp_desc,
"
"			     pol_vat_exempt_flag,
"
"			     pol_hs_tariff_code,
"
"			     pol_chk_promise_date,
"
"			     pol_rwk_rcpt_rev,
"
"			     pol_prod_outer_dia,
"
"			     pol_gst_input_type,
"
"			     pol_ord_stk_qty,
"
"			     pol_prod_station,
"
"			     pol_promo_code,
"
"			     pol_comm_amt,
"
"			     pol_quote_sfx,
"
"			     pol_quote_seq_no,
"
"			     pol_cre_by,
"
"			     pol_cre_ip_addr,
"
"			     pol_cre_os_user,
"
"			     pol_cre_date,
"
"			     pol_upd_by,
"
"			     pol_upd_ip_addr,
"
"			     pol_upd_os_user,
"
"			     pol_upd_date,
"
"			     pol_no_of_bale_recv,
"
"			     pol_no_of_bale_inproc,
"
"			     pol_cre_emp_id,
"
"			     pol_upd_emp_id,
"
"			     pol_last_po_price,
"
"			     pol_batch_no,
"
"			     pol_expiry_date,
"
"			     pol_mfg_date,
"
"			     pol_packtype_id,
"
"			     pol_sterilize_date,
"
"			     pol_tcs_sec_id,
"
"			     pol_tcs_acces_val,
"
"			     pol_tcs_pct,
"
"			     pol_tcs_amt,
"
"			     pol_iss_code,
"
"			     pol_no_of_bale_proc,
"
"			     pol_disc_unit_amt,
"
"			     pol_proj_lvl_id,
"
"			     pol_proj_lvl_desc,
"
"			     pol_height,
"
"			     pol_inner_dia,
"
"			     pol_density,
"
"			     pol_pur_acct,
"
"			     pol_mill_suplr_name,
"
"			     pol_op_ord_cl_reason,
"
"			     pol_fab_item_type,
"
"			     pol_temp_inv_qty,
"
"			     pol_inv_qty,
"
"			     pol_temp_in_progress,
"
"			     pol_inv_sel_flag,
"
"			     pol_gla_fxd_flag,
"
"			     pol_cpc_fxd_flag,
"
"			     pol_bom_no,
"
"			     pol_bom_name,
"
"			     pol_no_of_bags,
"
"			     pol_rwk_rcpt_sub_seq_no,
"
"			     pol_sks_currency,
"
"			     pol_sks_exchange_rate,
"
"			     pol_sks_fc_unit_cost,
"
"			     pol_sou_oprn_seq,
"
"			     pol_sou_proc_id,
"
"			     pol_tar_oprn_seq,
"
"			     pol_tar_proc_id,
"
"			     pol_store_id,
"
"                             pol_store_name,
"
"                             pol_required_date,
"
"                             pol_promise_date,
"
"                             pol_so_schld_desc,
"
"                             pol_so_type,
"
"                             pol_so_pfx,
"
"                             pol_so_no,
"
"                             pol_so_seq_no,
"
"                             pol_so_sub_seq_no,
"
"                             pol_proj_id,
"
"                             pol_task_id,
"
"                             pol_tax_pct,
"
"                             pol_igst_amt,
"
"                             pol_sgst_amt,
"
"                             pol_cgst_amt,
"
"                             pol_utgst_amt,
"
"                             pol_cess_pct,
"
"                             pol_cess_amt,
"
"                             pol_suplr_chrg_flag,
"
"                             pol_sel_flag,
"
"                             pol_sel_user,
"
"                             pol_igst_pct,
"
"                             pol_sgst_pct,
"
"                             pol_cgst_pct,
"
"                             pol_utgst_pct,
"
"                             pol_st_so_pfx,
"
"                             pol_st_so_no,
"
"                             pol_st_so_seq_no,
"
"                             pol_trd_disc_pct,
"
"                             pol_trd_disc_amt,
"
"                             pol_spl_disc_pct,
"
"                             pol_spl_disc_amt,
"
"                             pol_cash_disc_pct,
"
"                             pol_cash_disc_amt,
"
"                             pol_matl_type,
"
"			     pol_mds_no,
"
"	   pol_mds_rev)
"
"    SELECT polh_bu,
"
"           polh_order_no,
"
"           polh_seq_no,
"
"           polh_prod_id,
"
"           polh_prod_rev,
"
"           polh_prod_desc1,
"
"           polh_prod_cls,
"
"           polh_prod_cls_desc,
"
"           polh_prod_sub_cls,
"
"           polh_prod_sub_cls_desc,
"
"           polh_uom,
"
"           polh_prod_uom,
"
"           polh_conv_factor,
"
"           polh_cost_basis,
"
"           polh_contract_id,
"
"           polh_sc_unit_cost,
"
"           polh_disc_pct,
"
"           polh_scon_mat_unit_cost,
"
"           polh_qc_required,
"
"           polh_stocked,
"
"           polh_ordered_qty,
"
"           polh_received_qty,
"
"           polh_deflt_schld_flag,
"
"           polh_net_disc_flag,
"
"           polh_origin,
"
"           polh_proj_flag,
"
"           polh_status,
"
"           polh_qc_temp_qty,
"
"           polh_tolr_qty,
"
"           polh_bo_release_qty,
"
"           polh_bo_released_qty,
"
"           polh_abc_cls,
"
"           polh_fv_cls,
"
"           polh_price_div_pct,
"
"           polh_sc_old_cost,
"
"           polh_tot_received_qty,
"
"           polh_rejected_qty,
"
"           polh_cs_narration,
"
"           polh_suplr_prod_id,
"
"           polh_suplr_prod_desc,
"
"           polh_parent_prod_id,
"
"           polh_parent_prod_rev,
"
"           polh_rate_finalize,
"
"           polh_work_ord_no,
"
"           polh_rwk_rcpt_seq_no,
"
"           polh_prim_rwk_qty,
"
"           polh_sec_rwk_qty,
"
"           polh_rwk_rcpt_pfx,
"
"           polh_rwk_rcpt_no,
"
"           polh_disc_amt,
"
"           polh_scrap_qty,
"
"           polh_amd_no,
"
"           polh_contr_pfx,
"
"           polh_prod_ord_no,
"
"           polh_sf_code,
"
"           polh_pg_flag,
"
"           polh_pg_id,
"
"           polh_bom_avail_flag,
"
"           polh_print_seq_no,
"
"           polh_ins_plan_no,
"
"           polh_ins_plan_rev,
"
"           polh_test_req_flag,
"
"           polh_cert_id,
"
"           polh_rfq_pfx,
"
"           polh_rfq_no,
"
"           polh_quote_pfx,
"
"           polh_quote_no,
"
"           polh_tax_set_id,
"
"           polh_qtn_no,
"
"           polh_qtn_date,
"
"           polh_qtn_pfx,
"
"           polh_suplr_qtn_no,
"
"           polh_suplr_resp_date,
"
"           polh_contr_amd_no,
"
"           polh_ref,
"
"           polh_amend_reason,
"
"           polh_rej_rcpt_pfx,
"
"           polh_rej_rcpt_no,
"
"           polh_rej_line_no,
"
"           polh_rej_ord_no,
"
"           polh_rej_trans_no,
"
"           polh_amd_date,
"
"           polh_tcf_id,
"
"           polh_prod_ext_desc,
"
"           polh_drawing_no,
"
"           polh_drawing_rev,
"
"           polh_wvd_flag,
"
"           polh_rwk_rcpt_type,
"
"           polh_prim_incent_amt,
"
"           polh_sec_incent_amt,
"
"           polh_spr_type,
"
"           polh_foc_flag,
"
"           polh_targ_sf_code,
"
"           polh_rwk_queue_type,
"
"           polh_budget_flag,
"
"           polh_sou_mat_weight,
"
"           polh_tar_mat_weight,
"
"           polh_plnd_scrap_weight,
"
"           polh_plnd_hr_unit,
"
"           polh_dim_req_flag,
"
"           polh_thickness,
"
"           polh_length,
"
"           polh_width,
"
"           polh_vis_insp_flag,
"
"           polh_qty_in_nos,
"
"           polh_rcpt_rev_flag,
"
"           polh_serv_prod_id,
"
"           polh_serv_io_type,
"
"           polh_amc_start_date,
"
"           polh_amc_end_date,
"
"           polh_amend_id,
"
"           polh_serv_prod_desc,
"
"           polh_install_req_flag,
"
"           polh_cs_id,
"
"           polh_tool_wo_no,
"
"           polh_scr_pct,
"
"           polh_scr_weight,
"
"           polh_alow_scr_qty,
"
"           polh_ls_uom_gen_type,
"
"           polh_tax_exc_reason,
"
"           polh_cls_sel_flag,
"
"           polh_cls_sel_user,
"
"           polh_cls_proc_qty,
"
"           polh_cls_qty,
"
"           polh_ctrl_set_no,
"
"           polh_spec_doc_no,
"
"           polh_spec_doc_rev,
"
"           polh_cap_asset_id,
"
"           polh_mat_req_trans_no,
"
"           polh_po_auto_cs_flag,
"
"           polh_po_auto_cs_pct,
"
"           polh_no_of_bale,
"
"           polh_enquiry_no,
"
"           polh_avg_bale_weight,
"
"           polh_hsn_code,
"
"           polh_gst_rev_tax_cat_id,
"
"           polh_catalog_no,
"
"           polh_mchn_id,
"
"           polh_sub_dept_id,
"
"           polh_pre_mr_no,
"
"           polh_pre_mr_seq_no,
"
"           polh_pre_mr_date,
"
"           polh_sco_mtrl_rqrd_flag,
"
"           polh_dc_no,
"
"           polh_fcm_bl_id,
"
"           polh_fcm_proj_no,
"
"           polh_mrp_rel_qty,
"
"           polh_mftr_id,
"
"           polh_mftr_part_no,
"
"           polh_category_id,
"
"           polh_gst_exempt_flag,
"
"           polh_eqpmt_id,
"
"           polh_eqpmt_desc,
"
"           polh_gar_style,
"
"           polh_gar_color,
"
"           polh_gar_size,
"
"           polh_qtn_seq_no,
"
"           polh_insp_pln_no,
"
"           polh_insp_pln_rev,
"
"           polh_br_doc_no,
"
"           polh_br_ln_seq_no,
"
"           polh_mrkt_price,
"
"           polh_pr_ref,
"
"           polh_pr_no,
"
"           polh_mchn_grp_id,
"
"           polh_stk_tr_so_pfx,
"
"           polh_stk_tr_so_no,
"
"           polh_stk_tr_so_seq_no,
"
"           polh_lm_disc_amt,
"
"           polh_warranty_date,
"
"           polh_instal_chrg_amt,
"
"           polh_make_id,
"
"           polh_model,
"
"           polh_wvd_basis,
"
"           polh_wvd_shrt_type,
"
"           polh_wvd_excs_type,
"
"           polh_brnd_id,
"
"           polh_gross_amt,
"
"           polh_tax_amt,
"
"           polh_net_amt,
"
"           polh_prod_grp,
"
"           polh_prod_grp_desc,
"
"           polh_prod_subgrp,
"
"           polh_prod_subgrp_desc,
"
"           polh_vat_exempt_flag,
"
"           polh_hs_tariff_code,
"
"           polh_chk_promise_date,
"
"           polh_rwk_rcpt_rev,
"
"           polh_prod_outer_dia,
"
"           polh_gst_input_type,
"
"           polh_ord_stk_qty,
"
"           polh_prod_station,
"
"           polh_promo_code,
"
"           polh_comm_amt,
"
"           polh_quote_sfx,
"
"           polh_quote_seq_no,
"
"           polh_cre_by,
"
"           polh_cre_ip_addr,
"
"           polh_cre_os_user,
"
"           polh_cre_date,
"
"           polh_upd_by,
"
"           polh_upd_ip_addr,
"
"           polh_upd_os_user,
"
"           polh_upd_date,
"
"           polh_no_of_bale_recv,
"
"           polh_no_of_bale_inproc,
"
"           polh_cre_emp_id,
"
"           polh_upd_emp_id,
"
"           polh_last_po_price,
"
"           polh_batch_no,
"
"           polh_expiry_date,
"
"           polh_mfg_date,
"
"           polh_packtype_id,
"
"           polh_sterilize_date,
"
"           polh_tcs_sec_id,
"
"           polh_tcs_acces_val,
"
"           polh_tcs_pct,
"
"           polh_tcs_amt,
"
"           polh_iss_code,
"
"           polh_no_of_bale_proc,
"
"           polh_disc_unit_amt,
"
"           polh_proj_lvl_id,
"
"           polh_proj_lvl_desc,
"
"           polh_height,
"
"           polh_inner_dia,
"
"           polh_density,
"
"           polh_pur_acct,
"
"           polh_mill_suplr_name,
"
"           polh_op_ord_cl_reason,
"
"           polh_fab_item_type,
"
"           polh_temp_inv_qty,
"
"           polh_inv_qty,
"
"           polh_temp_in_progress,
"
"           polh_inv_sel_flag,
"
"           polh_gla_fxd_flag,
"
"           polh_cpc_fxd_flag,
"
"           polh_bom_no,
"
"           polh_bom_name,
"
"           polh_no_of_bags,
"
"           polh_rwk_rcpt_sub_seq_no,
"
"           polh_sou_oprn_seq,
"
"           polh_sou_proc_id,
"
"           polh_tar_oprn_seq,
"
"           polh_tar_proc_id,
"
"	   polh_store_id,
"
"           polh_store_name,
"
"           polh_required_date,
"
"           polh_promise_date,
"
"           polh_so_schld_desc,
"
"           polh_so_type,
"
"           polh_so_pfx,
"
"           polh_so_no,
"
"           polh_so_seq_no,
"
"           polh_so_sub_seq_no,
"
"           polh_proj_id,
"
"           polh_task_id,
"
"           polh_tax_pct,
"
"           polh_igst_amt,
"
"           polh_sgst_amt,
"
"           polh_cgst_amt,
"
"           polh_utgst_amt,
"
"           polh_cess_pct,
"
"           polh_cess_amt,
"
"           polh_suplr_chrg_flag,
"
"           polh_sel_flag,
"
"           polh_sel_user,
"
"           polh_igst_pct,
"
"           polh_sgst_pct,
"
"           polh_cgst_pct,
"
"           polh_utgst_pct,
"
"           polh_st_so_pfx,
"
"           polh_st_so_no,
"
"           polh_st_so_seq_no,
"
"           polh_trd_disc_pct,
"
"           polh_trd_disc_amt,
"
"           polh_spl_disc_pct,
"
"           polh_spl_disc_amt,
"
"           polh_cash_disc_pct,
"
"           polh_cash_disc_amt,
"
"           polh_matl_type,
"
"	   polh_mds_no,
"
"	   polh_mds_rev
"
"      FROM pur_order_ln_hist
"
"     WHERE polh_bu = p_bu
"
"       AND polh_order_no = p_ord_no;
"
"
"
"    INSERT INTO po_hd_tnc_attr(phta_bu,
"
"			       phta_po_no,
"
"			       phta_seq_no,
"
"			       phta_attr_id,
"
"			       phta_print_seq,
"
"			       phta_tmplt_no,
"
"			       phta_cre_by,
"
"			       phta_cre_ip_addr,
"
"			       phta_cre_os_user,
"
"			       phta_cre_date,
"
"			       phta_upd_by,
"
"			       phta_upd_ip_addr,
"
"			       phta_upd_os_user,
"
"			       phta_upd_date,
"
"			       phta_cre_emp_id,
"
"			       phta_upd_emp_id
"
"			      )
"
"    SELECT phtah_bu,
"
"	   phtah_po_no,
"
"	   phtah_seq_no,
"
"	   phtah_attr_id,
"
"	   phtah_print_seq,
"
"	   phtah_tmplt_no,
"
"	   phtah_cre_by,
"
"	   phtah_cre_ip_addr,
"
"	   phtah_cre_os_user,
"
"	   phtah_cre_date,
"
"	   phtah_upd_by,
"
"	   phtah_upd_ip_addr,
"
"	   phtah_upd_os_user,
"
"	   phtah_upd_date,
"
"	   phtah_cre_emp_id,
"
"	   phtah_upd_emp_id
"
"      FROM po_hd_tnc_attr_hist
"
"     WHERE phtah_bu = p_bu
"
"       AND phtah_po_no = p_ord_no;
"
"
"
"    INSERT INTO po_hd_tnc_attr_val(phtav_bu,
"
"                                   phtav_po_no,
"
"                                   phtav_seq_no,
"
"	                           phtav_sub_seq_no,
"
"	                           phtav_attr_val,
"
"                                   phtav_cre_by,
"
"				   phtav_cre_emp_id,
"
"				   phtav_cre_ip_addr,
"
"				   phtav_cre_os_user,
"
"                                   phtav_cre_date,
"
"                                   phtav_upd_by,
"
"				   phtav_upd_emp_id,
"
"				   phtav_upd_ip_addr,
"
"				   phtav_upd_os_user,
"
"                                   phtav_upd_date
"
"				  )
"
"    SELECT phtavh_bu,
"
"           phtavh_po_no,
"
"           phtavh_seq_no,
"
"	   phtavh_sub_seq_no,
"
"	   phtavh_attr_val,
"
"           phtavh_cre_by,
"
"	   phtavh_cre_emp_id,
"
"	   phtavh_cre_ip_addr,
"
"	   phtavh_cre_os_user,
"
"           phtavh_cre_date,
"
"           phtavh_upd_by,
"
"	   phtavh_upd_emp_id,
"
"	   phtavh_upd_ip_addr,
"
"	   phtavh_upd_os_user,
"
"           phtavh_upd_date
"
"      FROM po_hd_tnc_attr_val_hist
"
"     WHERE phtavh_bu = p_bu
"
"       AND phtavh_po_no = p_ord_no;
"
"
"
"    INSERT INTO po_ln_tnc_attr(plta_bu,
"
"                               plta_po_no,
"
"                               plta_po_seq_no,
"
"                               plta_seq_no,
"
"                               plta_attr_id,
"
"                               plta_print_seq,
"
"                               plta_cre_by,
"
"			       plta_cre_emp_id,
"
"			       plta_cre_ip_addr,
"
"			       plta_cre_os_user,
"
"                               plta_cre_date,
"
"                               plta_upd_by,
"
"			       plta_upd_emp_id,
"
"			       plta_upd_ip_addr,
"
"			       plta_upd_os_user,
"
"                               plta_upd_date
"
"			      )
"
"    SELECT pltah_bu,
"
"           pltah_po_no,
"
"           pltah_po_seq_no,
"
"           pltah_seq_no,
"
"           pltah_attr_id,
"
"           pltah_print_seq,
"
"           pltah_cre_by,
"
"	   pltah_cre_emp_id,
"
"	   pltah_cre_ip_addr,
"
"	   pltah_cre_os_user,
"
"           pltah_cre_date,
"
"           pltah_upd_by,
"
"	   pltah_upd_emp_id,
"
"	   pltah_upd_ip_addr,
"
"	   pltah_upd_os_user,
"
"           pltah_upd_date
"
"      FROM po_ln_tnc_attr_hist
"
"     WHERE pltah_bu = p_bu
"
"       AND pltah_po_no = p_ord_no;
"
"
"
"    INSERT INTO po_ln_tnc_attr_val(pltav_bu,
"
"                                   pltav_po_no,
"
"                                   pltav_po_seq_no,
"
"                                   pltav_seq_no,
"
"	                           pltav_sub_seq_no,
"
"	                           pltav_attr_val,
"
"                                   pltav_cre_by,
"
"				   pltav_cre_emp_id,
"
"				   pltav_cre_ip_addr,
"
"				   pltav_cre_os_user,
"
"                                   pltav_cre_date,
"
"                                   pltav_upd_by,
"
"				   pltav_upd_emp_id,
"
"				   pltav_upd_ip_addr,
"
"				   pltav_upd_os_user,
"
"                                   pltav_upd_date
"
"				  )
"
"    SELECT pltavh_bu,
"
"           pltavh_po_no,
"
"           pltavh_po_seq_no,
"
"           pltavh_seq_no,
"
"	   pltavh_sub_seq_no,
"
"	   pltavh_attr_val,
"
"           pltavh_cre_by,
"
"	   pltavh_cre_emp_id,
"
"	   pltavh_cre_ip_addr,
"
"	   pltavh_cre_os_user,
"
"           pltavh_cre_date,
"
"           pltavh_upd_by,
"
"	   pltavh_upd_emp_id,
"
"	   pltavh_upd_ip_addr,
"
"	   pltavh_upd_os_user,
"
"           pltavh_upd_date
"
"      FROM po_ln_tnc_attr_val_hist
"
"     WHERE pltavh_bu = p_bu
"
"       AND pltavh_po_no = p_ord_no;
"
"
"
"
"
"    INSERT INTO po_prod_parts_cont(poppc_bu,
"
"                                   poppc_ord_no,
"
"                                   poppc_ord_seq_no,
"
"                                   poppc_seq_no,
"
"                                   poppc_prod_id,
"
"                                   poppc_prod_rev,
"
"                                   poppc_qty,
"
"                                   poppc_cre_by,
"
"				   poppc_cre_emp_id,
"
"				   poppc_cre_ip_addr,
"
"				   poppc_cre_os_user,
"
"                                   poppc_cre_date,
"
"                                   poppc_upd_by,
"
"				   poppc_upd_emp_id,
"
"				   poppc_upd_ip_addr,
"
"				   poppc_upd_os_user,
"
"                                   poppc_upd_date,
"
"                                   poppc_prod_desc1
"
"				  )
"
"    SELECT poppch_bu,
"
"           poppch_ord_no,
"
"           poppch_ord_seq_no,
"
"           poppch_seq_no,
"
"           poppch_prod_id,
"
"           poppch_prod_rev,
"
"           poppch_qty,
"
"           poppch_cre_by,
"
"	   poppch_cre_emp_id,
"
"	   poppch_cre_ip_addr,
"
"	   poppch_cre_os_user,
"
"           poppch_cre_date,
"
"           poppch_upd_by,
"
"	   poppch_upd_emp_id,
"
"	   poppch_upd_ip_addr,
"
"	   poppch_upd_os_user,
"
"           poppch_upd_date,
"
"           poppch_prod_desc1
"
"      FROM po_prod_parts_cont_hist
"
"     WHERE poppch_bu = p_bu
"
"       AND poppch_ord_no = p_ord_no;
"
"
"
"    INSERT INTO po_prod_test_cert(pptc_bu,
"
"                                  pptc_plnt,
"
"                                  pptc_po_no,
"
"                                  pptc_po_seq_no,
"
"                                  pptc_sub_seq_no,
"
"                                  pptc_tc_id,
"
"                                  pptc_cre_by,
"
"				  pptc_cre_emp_id,
"
"				  pptc_cre_ip_addr,
"
"				  pptc_cre_os_user,
"
"                                  pptc_cre_date,
"
"                                  pptc_upd_by,
"
"				  pptc_upd_emp_id,
"
"				  pptc_upd_ip_addr,
"
"				  pptc_upd_os_user,
"
"                                  pptc_upd_date
"
"				 )
"
"    SELECT pptch_bu,
"
"           pptch_plnt,
"
"           pptch_po_no,
"
"           pptch_po_seq_no,
"
"           pptch_sub_seq_no,
"
"           pptch_tc_id,
"
"           pptch_cre_by,
"
"	   pptch_cre_emp_id,
"
"	   pptch_cre_ip_addr,
"
"	   pptch_cre_os_user,
"
"           pptch_cre_date,
"
"           pptch_upd_by,
"
"	   pptch_upd_emp_id,
"
"	   pptch_upd_ip_addr,
"
"	   pptch_upd_os_user,
"
"           pptch_upd_date
"
"      FROM po_prod_test_cert_hist
"
"     WHERE pptch_bu = p_bu
"
"       AND pptch_po_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_attr(poa_bu,
"
"                             poa_ord_no,
"
"                             poa_seq_no,
"
"                             poa_attr_id,
"
"                             poa_cre_by,
"
"			     poa_cre_emp_id,
"
"			     poa_cre_ip_addr,
"
"			     poa_cre_os_user,
"
"                             poa_cre_date,
"
"                             poa_upd_by,
"
"			     poa_upd_emp_id,
"
"			     poa_upd_ip_addr,
"
"			     poa_upd_os_user,
"
"                             poa_upd_date
"
"			    )
"
"    SELECT poah_bu,
"
"           poah_ord_no,
"
"           poah_seq_no,
"
"           poah_attr_id,
"
"           poah_cre_by,
"
"	   poah_cre_emp_id,
"
"	   poah_cre_ip_addr,
"
"	   poah_cre_os_user,
"
"           poah_cre_date,
"
"           poah_upd_by,
"
"	   poah_upd_emp_id,
"
"	   poah_upd_ip_addr,
"
"	   poah_upd_os_user,
"
"           poah_upd_date
"
"      FROM pur_ord_attr_hist
"
"     WHERE poah_bu = p_bu
"
"       AND poah_ord_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_attr_notes(poan_bu,
"
"                                   poan_ord_no,
"
"                                   poan_seq_no,
"
"                                   poan_sub_seq_no,
"
"                                   poan_note,
"
"                                   poan_cre_by,
"
"				   poan_cre_emp_id,
"
"				   poan_cre_ip_addr,
"
"				   poan_cre_os_user,
"
"                                   poan_cre_date,
"
"                                   poan_upd_by,
"
"				   poan_upd_emp_id,
"
"				   poan_upd_ip_addr,
"
"				   poan_upd_os_user,
"
"                                   poan_upd_date
"
"				  )
"
"    SELECT poanh_bu,
"
"           poanh_ord_no,
"
"           poanh_seq_no,
"
"           poanh_sub_seq_no,
"
"           poanh_note,
"
"           poanh_cre_by,
"
"	   poanh_cre_emp_id,
"
"	   poanh_cre_ip_addr,
"
"	   poanh_cre_os_user,
"
"           poanh_cre_date,
"
"           poanh_upd_by,
"
"	   poanh_upd_emp_id,
"
"	   poanh_upd_ip_addr,
"
"	   poanh_upd_os_user,
"
"           poanh_upd_date
"
"      FROM pur_ord_attr_notes_hist
"
"     WHERE poanh_bu = p_bu
"
"       AND poanh_ord_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_ln_prod_attr(polpa_bu,
"
"                                     polpa_plnt,
"
"                                     polpa_po_no,
"
"                                     polpa_po_line_no,
"
"                                     polpa_seq_no,
"
"                                     polpa_attr_id,
"
"                                     polpa_cre_by,
"
"				     polpa_cre_emp_id,
"
"				     polpa_cre_ip_addr,
"
"				     polpa_cre_os_user,
"
"                                     polpa_cre_date,
"
"                                     polpa_upd_by,
"
"				     polpa_upd_emp_id,
"
"				     polpa_upd_ip_addr,
"
"				     polpa_upd_os_user,
"
"                                     polpa_upd_date
"
"				    )
"
"    SELECT polpah_bu,
"
"           polpah_plnt,
"
"           polpah_po_no,
"
"           polpah_po_line_no,
"
"           polpah_seq_no,
"
"           polpah_attr_id,
"
"           polpah_cre_by,
"
"	   polpah_cre_emp_id,
"
"	   polpah_cre_ip_addr,
"
"	   polpah_cre_os_user,
"
"           polpah_cre_date,
"
"           polpah_upd_by,
"
"	   polpah_upd_emp_id,
"
"	   polpah_upd_ip_addr,
"
"	   polpah_upd_os_user,
"
"           polpah_upd_date
"
"      FROM pur_ord_ln_prod_attr_hist
"
"     WHERE polpah_bu = p_bu
"
"       AND polpah_po_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_ln_prod_attr_notes(polpan_bu,
"
"                                           polpan_plnt,
"
"                                           polpan_po_no,
"
"                                           polpan_line_no,
"
"                                           polpan_seq_no,
"
"                                           polpan_sub_seq_no,
"
"                                           polpan_notes,
"
"                                           polpan_cre_by,
"
"					   polpan_cre_emp_id,
"
"					   polpan_cre_ip_addr,
"
"					   polpan_cre_os_user,
"
"                                           polpan_cre_date,
"
"                                           polpan_upd_by,
"
"					   polpan_upd_emp_id,
"
"					   polpan_upd_ip_addr,
"
"					   polpan_upd_os_user,
"
"                                           polpan_upd_date
"
"					  )
"
"    SELECT polpanh_bu,
"
"           polpanh_plnt,
"
"           polpanh_po_no,
"
"           polpanh_line_no,
"
"           polpanh_seq_no,
"
"           polpanh_sub_seq_no,
"
"           polpanh_notes,
"
"           polpanh_cre_by,
"
"	   polpanh_cre_emp_id,
"
"	   polpanh_cre_ip_addr,
"
"	   polpanh_cre_os_user,
"
"           polpanh_cre_date,
"
"           polpanh_upd_by,
"
"	   polpanh_upd_emp_id,
"
"	   polpanh_upd_ip_addr,
"
"	   polpanh_upd_os_user,
"
"           polpanh_upd_date
"
"      FROM pur_ord_ln_prod_attr_note_hist
"
"     WHERE polpanh_bu = p_bu
"
"       AND polpanh_po_no = p_ord_no;
"
"
"
"    INSERT INTO po_sup_doc(psd_bu,
"
"                           psd_plnt,
"
"                           psd_po_no,
"
"                           psd_doc_id,
"
"                           psd_ir_mode,
"
"                           psd_ref,
"
"                           psd_cre_by,
"
"			   psd_cre_emp_id,
"
"			   psd_cre_ip_addr,
"
"			   psd_cre_os_user,
"
"                           psd_cre_date,
"
"                           psd_upd_by,
"
"			   psd_upd_emp_id,
"
"			   psd_upd_ip_addr,
"
"			   psd_upd_os_user,
"
"                           psd_upd_date
"
"			  )
"
"    SELECT psdh_bu,
"
"           psdh_plnt,
"
"           psdh_po_no,
"
"           psdh_doc_id,
"
"           psdh_ir_mode,
"
"           psdh_ref,
"
"           psdh_cre_by,
"
"	   psdh_cre_emp_id,
"
"	   psdh_cre_ip_addr,
"
"	   psdh_cre_os_user,
"
"           psdh_cre_date,
"
"           psdh_upd_by,
"
"	   psdh_upd_emp_id,
"
"	   psdh_upd_ip_addr,
"
"	   psdh_upd_os_user,
"
"           psdh_upd_date
"
"      FROM po_sup_doc_hist
"
"     WHERE psdh_bu = p_bu
"
"       AND psdh_po_no = p_ord_no;
"
"
"
"    INSERT INTO pur_ord_pay_schedule(pops_bu,
"
"                                     pops_plnt,
"
"                                     pops_order_no,
"
"                                     pops_seq_no,
"
"                                     pops_ms_id,
"
"                                     pops_due_date,
"
"                                     pops_due_amt,
"
"                                     pops_due_pct,
"
"                                     pops_due_days,
"
"                                     pops_cre_by,
"
"				     pops_cre_emp_id,
"
"				     pops_cre_ip_addr,
"
"				     pops_cre_os_user,
"
"                                     pops_cre_date,
"
"                                     pops_upd_by,
"
"				     pops_upd_emp_id,
"
"				     pops_upd_ip_addr,
"
"				     pops_upd_os_user,
"
"                                     pops_upd_date
"
"				    )
"
"    SELECT popsh_bu,
"
"           popsh_plnt,
"
"           popsh_order_no,
"
"           popsh_seq_no,
"
"           popsh_ms_id,
"
"           popsh_due_date,
"
"           popsh_due_amt,
"
"           popsh_due_pct,
"
"           popsh_due_days,
"
"           popsh_cre_by,
"
"	   popsh_cre_emp_id,
"
"	   popsh_cre_ip_addr,
"
"	   popsh_cre_os_user,
"
"           popsh_cre_date,
"
"           popsh_upd_by,
"
"	   popsh_upd_emp_id,
"
"	   popsh_upd_ip_addr,
"
"	   popsh_upd_os_user,
"
"           popsh_upd_date
"
"      FROM pur_ord_pay_schedule_hist
"
"     WHERE popsh_bu = p_bu
"
"       AND popsh_order_no = p_ord_no;
"
"
"
"    INSERT INTO po_hd_comments(phcmt_bu,
"
"                               phcmt_order_no,
"
"                               phcmt_seq_no,
"
"                               phcmt_comment,
"
"                               phcmt_cre_by,
"
"                               phcmt_cre_ip_addr,
"
"                               phcmt_cre_os_user,
"
"                               phcmt_cre_date,
"
"                               phcmt_upd_by,
"
"                               phcmt_upd_ip_addr,
"
"                               phcmt_upd_os_user,
"
"                               phcmt_upd_date,
"
"                               phcmt_cre_emp_id,
"
"                               phcmt_upd_emp_id
"
"			      )
"
"    SELECT phcmth_bu,
"
"           phcmth_order_no,
"
"           phcmth_seq_no,
"
"           phcmth_comment,
"
"           phcmth_cre_by,
"
"           phcmth_cre_ip_addr,
"
"           phcmth_cre_os_user,
"
"           phcmth_cre_date,
"
"           phcmth_upd_by,
"
"           phcmth_upd_ip_addr,
"
"           phcmth_upd_os_user,
"
"           phcmth_upd_date,
"
"           phcmth_cre_emp_id,
"
"           phcmth_upd_emp_id
"
"      FROM po_hd_comments_hist
"
"     WHERE phcmth_bu = p_bu
"
"       AND phcmth_order_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_pay_schedule_hist
"
"     WHERE popsh_bu = p_bu
"
"       AND popsh_order_no = p_ord_no;
"
"
"
"    DELETE FROM po_sup_doc_hist
"
"     WHERE psdh_bu = p_bu
"
"       AND psdh_po_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_ln_prod_attr_note_hist
"
"     WHERE polpanh_bu = p_bu
"
"       AND polpanh_po_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_ln_prod_attr_hist
"
"     WHERE polpah_bu = p_bu
"
"       AND polpah_po_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_attr_notes_hist
"
"     WHERE poanh_bu = p_bu
"
"       AND poanh_ord_no = p_ord_no;
"
"
"
"    DELETE FROM pur_ord_attr_hist
"
"     WHERE poah_bu = p_bu
"
"       AND poah_ord_no = p_ord_no;
"
"
"
"    DELETE FROM po_prod_test_cert_hist
"
"     WHERE pptch_bu = p_bu
"
"       AND pptch_po_no = p_ord_no;
"
"
"
"    DELETE FROM po_prod_parts_cont_hist
"
"     WHERE poppch_bu = p_bu
"
"       AND poppch_ord_no = p_ord_no;
"
"
"
"    DELETE FROM po_ln_tnc_attr_val_hist
"
"     WHERE pltavh_bu = p_bu
"
"       AND pltavh_po_no = p_ord_no;
"
"
"
"    DELETE FROM po_ln_tnc_attr_hist
"
"     WHERE pltah_bu = p_bu
"
"       AND pltah_po_no = p_ord_no;
"
"
"
"    DELETE FROM po_hd_tnc_attr_val_hist
"
"     WHERE phtavh_bu = p_bu
"
"       AND phtavh_po_no = p_ord_no;
"
"
"
"    DELETE FROM po_hd_tnc_attr_hist
"
"     WHERE phtah_bu = p_bu
"
"       AND phtah_po_no = p_ord_no;
"
"
"
"    DELETE FROM pur_order_ln_hist
"
"     WHERE polh_bu = p_bu
"
"       AND polh_order_no = p_ord_no;
"
"
"
"    DELETE FROM pur_order_hd_hist
"
"     WHERE pohh_bu = p_bu
"
"       AND pohh_order_no = p_ord_no;*/NULL;
"
"
"
"  END proc_rev_po_hist;
"
"
"
" /* PROCEDURE proc_ins_pr_hist(p_bu		pur_req_hd.prh_bu%TYPE,
"
"			     p_rqst_pfx		pur_req_hd.prh_rqst_pfx%TYPE,
"
"			     p_rqst_no		pur_req_hd.prh_rqst_no%TYPE
"
"			    )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO pur_req_hd_hist(prhh_bu,
"
"                                prhh_rqst_no,
"
"                                prhh_rqst_pfx,
"
"                                prhh_rqst_date,
"
"                                prhh_rqst_year,
"
"                                prhh_rqst_period,
"
"                                prhh_status,
"
"                                prhh_narration,
"
"                                prhh_reqstr_id,
"
"                                prhh_reqstr_name,
"
"                                prhh_reqstr_pos_id,
"
"                                prhh_reqstr_pos_name,
"
"                                prhh_rqst_dept_id,
"
"                                prhh_apprvr_id,
"
"                                prhh_apprvr_name,
"
"                                prhh_apprvr_pos_id,
"
"                                prhh_apprvr_pos_name,
"
"                                prhh_apprvr_dept_id,
"
"                                prhh_apprvd_date,
"
"                                prhh_control_person,
"
"                                prhh_create_po,
"
"                                prhh_mode,
"
"                                prhh_rec_source,
"
"                                prhh_frwd_date,
"
"                                prhh_other_flag,
"
"                                prhh_plant,
"
"                                prhh_to_plant,
"
"                                prhh_cre_by,
"
"				prhh_cre_emp_id,
"
"				prhh_cre_ip_addr,
"
"				prhh_cre_os_user,
"
"                                prhh_cre_date,
"
"                                prhh_upd_by,
"
"				prhh_upd_emp_id,
"
"				prhh_upd_ip_addr,
"
"				prhh_upd_os_user,
"
"                                prhh_upd_date,
"
"                                prhh_cs_narr,
"
"                                prhh_capex_bud_no,
"
"                                prhh_mrp_no,
"
"                                prhh_fcm_bl_id,
"
"                                prhh_fcm_proj_no,
"
"								prhh_plnt_loc_name
"
"			       )
"
"    SELECT prh_bu,
"
"           prh_rqst_pfx,
"
"           prh_rqst_no,
"
"           prh_rqst_date,
"
"           prh_rqst_year,
"
"           prh_rqst_period,
"
"           prh_status,
"
"           prh_narration,
"
"           prh_reqstr_id,
"
"           prh_reqstr_name,
"
"           prh_reqstr_pos_id,
"
"           prh_reqstr_pos_name,
"
"           prh_rqst_dept_id,
"
"           prh_apprvr_id,
"
"           prh_apprvr_name,
"
"           prh_apprvr_pos_id,
"
"           prh_apprvr_pos_name,
"
"           prh_apprvr_dept_id,
"
"           prh_apprvd_date,
"
"           prh_control_person,
"
"           prh_create_po,
"
"           prh_mode,
"
"           prh_rec_source,
"
"           prh_frwd_date,
"
"           prh_other_flag,
"
"           prh_plant,
"
"           prh_to_plant,
"
"           prh_cre_by,
"
"	   prh_cre_emp_id,
"
"	   prh_cre_ip_addr,
"
"	   prh_cre_os_user,
"
"           prh_cre_date,
"
"           prh_upd_by,
"
"	   prh_upd_emp_id,
"
"	   prh_upd_ip_addr,
"
"	   prh_upd_os_user,
"
"           prh_upd_date,
"
"           prh_cs_narr,
"
"           prh_capex_bud_no,
"
"           prh_mrp_no,
"
"           prh_fcm_bl_id,
"
"           prh_fcm_proj_no,
"
"		   prh_plnt_loc_name
"
"      FROM pur_req_hd
"
"     WHERE prh_bu = p_bu
"
"       AND prh_rqst_pfx = p_rqst_pfx
"
"       AND prh_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO pur_req_ln_hist(prlh_bu,
"
"                                prlh_rqst_pfx,
"
"                                prlh_rqst_no,
"
"                                prlh_seq_no,
"
"                                prlh_prod_id,
"
"                                prlh_prod_rev,
"
"                                prlh_prod_desc1,
"
"                                prlh_class_id,
"
"                                prlh_class_desc,
"
"                                prlh_sub_cls_id,
"
"                                prlh_sub_cls_desc,
"
"                                prlh_uom,
"
"                                prlh_prod_uom,
"
"                                prlh_conv_factor,
"
"                                prlh_requested_qty,
"
"                                prlh_ordered_qty,
"
"                                prlh_receipt_qty,
"
"                                prlh_bc_unit_cost,
"
"                                prlh_disc_pct,
"
"                                prlh_stocked,
"
"                                prlh_qc_required,
"
"                                prlh_quote_pfx,
"
"                                prlh_quote_no,
"
"                                prlh_order_pfx,
"
"                                prlh_order_no,
"
"                                prlh_deflt_schld_flag,
"
"                                prlh_net_disc_flag,
"
"                                prlh_status,
"
"                                prlh_qc_temp_qty,
"
"                                prlh_prod_temp_id,
"
"                                prlh_prod_temp_rev,
"
"                                prlh_prod_lot_no,
"
"                                prlh_work_ord_no,
"
"                                prlh_select_flag,
"
"                                prlh_cre_by,
"
"				prlh_cre_emp_id,
"
"				prlh_cre_ip_addr,
"
"				prlh_cre_os_user,
"
"                                prlh_cre_date,
"
"                                prlh_upd_by,
"
"				prlh_upd_emp_id,
"
"				prlh_upd_ip_addr,
"
"				prlh_upd_os_user,
"
"                                prlh_upd_date,
"
"                                prlh_ins_plan_no,
"
"                                prlh_ins_plan_rev,
"
"                                prlh_pg_flag,
"
"                                prlh_pg_id,
"
"                                prlh_prod_ord_no,
"
"                                prlh_sf_code,
"
"                                prlh_test_req_flag,
"
"                                prlh_cert_id,
"
"                                prlh_print_seq_no,
"
"                                prlh_prod_temp_desc1,
"
"                                prlh_ref,
"
"                                prlh_prod_ext_desc,
"
"                                prlh_cs_narr,
"
"                                prlh_drawing_no,
"
"                                prlh_drawing_rev,
"
"                                prlh_spr_type,
"
"                                prlh_rcpt_rcvd_qty,
"
"                                prlh_dim_req_flag,
"
"                                prlh_thickness,
"
"                                prlh_length,
"
"                                prlh_width,
"
"                                prlh_qty_in_nos,
"
"                                prlh_serv_prod_id,
"
"                                prlh_serv_io_type,
"
"                                prlh_amc_start_date,
"
"                                prlh_amc_end_date,
"
"                                prlh_serv_prod_desc,
"
"                                prlh_tool_wo_no,
"
"                                prlh_sugg_suplr_id,
"
"                                prlh_cls_sel_user,
"
"                                prlh_cls_qty,
"
"                                prlh_cls_proc_qty,
"
"                                prlh_cap_asset_id,
"
"                                prlh_cust_drw_no,
"
"                                prlh_cust_drw_rev,
"
"                                prlh_catalog_no,
"
"                                prlh_mchn_id,
"
"                                prlh_sub_dept_id,
"
"                                prlh_pre_mr_no,
"
"                                prlh_pre_mr_seq_no,
"
"                                prlh_pre_mr_date,
"
"                                prlh_priority,
"
"                                prlh_buyer_id,
"
"                                prlh_mrp_rel_qty,
"
"                                prlh_mftr_id,
"
"                                prlh_mftr_part_no,
"
"                                prlh_eqpmt_id,
"
"                                prlh_eqpmt_desc,
"
"                                prlh_buyer_emp_id
"
"			       )
"
"    SELECT prl_bu,
"
"           prl_rqst_pfx,
"
"           prl_rqst_no,
"
"           prl_seq_no,
"
"           prl_prod_id,
"
"           prl_prod_rev,
"
"           prl_prod_desc1,
"
"           prl_class_id,
"
"           prl_class_desc,
"
"           prl_sub_cls_id,
"
"           prl_sub_cls_desc,
"
"           prl_uom,
"
"           prl_prod_uom,
"
"           prl_conv_factor,
"
"           prl_requested_qty,
"
"           prl_ordered_qty,
"
"           prl_receipt_qty,
"
"           prl_bc_unit_cost,
"
"           prl_disc_pct,
"
"           prl_stocked,
"
"           prl_qc_required,
"
"           prl_quote_pfx,
"
"           prl_quote_no,
"
"           prl_order_pfx,
"
"           prl_order_no,
"
"           prl_deflt_schld_flag,
"
"           prl_net_disc_flag,
"
"           prl_status,
"
"           prl_qc_temp_qty,
"
"           prl_prod_temp_id,
"
"           prl_prod_temp_rev,
"
"           prl_prod_lot_no,
"
"           prl_work_ord_no,
"
"           prl_select_flag,
"
"           prl_cre_by,
"
"	   prl_cre_emp_id,
"
"	   prl_cre_ip_addr,
"
"	   prl_cre_os_user,
"
"           prl_cre_date,
"
"           prl_upd_by,
"
"	   prl_upd_emp_id,
"
"	   prl_upd_ip_addr,
"
"	   prl_upd_os_user,
"
"           prl_upd_date,
"
"           prl_ins_plan_no,
"
"           prl_ins_plan_rev,
"
"           prl_pg_flag,
"
"           prl_pg_id,
"
"           prl_prod_ord_no,
"
"           prl_sf_code,
"
"           prl_test_req_flag,
"
"           prl_cert_id,
"
"           prl_print_seq_no,
"
"           prl_prod_temp_desc1,
"
"           prl_ref,
"
"           prl_prod_ext_desc,
"
"           prl_cs_narr,
"
"           prl_drawing_no,
"
"           prl_drawing_rev,
"
"           prl_spr_type,
"
"           prl_rcpt_rcvd_qty,
"
"           prl_dim_req_flag,
"
"           prl_thickness,
"
"           prl_length,
"
"           prl_width,
"
"           prl_qty_in_nos,
"
"           prl_serv_prod_id,
"
"           prl_serv_io_type,
"
"           prl_amc_start_date,
"
"           prl_amc_end_date,
"
"           prl_serv_prod_desc,
"
"           prl_tool_wo_no,
"
"           prl_sugg_suplr_id,
"
"           prl_cls_sel_user,
"
"           prl_cls_qty,
"
"           prl_cls_proc_qty,
"
"           prl_cap_asset_id,
"
"           prl_cust_drw_no,
"
"           prl_cust_drw_rev,
"
"           prl_catalog_no,
"
"           prl_mchn_id,
"
"           prl_sub_dept_id,
"
"           prl_pre_mr_no,
"
"           prl_pre_mr_seq_no,
"
"           prl_pre_mr_date,
"
"           prl_priority,
"
"           prl_buyer_id,
"
"           prl_mrp_rel_qty,
"
"           prl_mftr_id,
"
"           prl_mftr_part_no,
"
"           prl_eqpmt_id,
"
"           prl_eqpmt_desc,
"
"           prl_buyer_emp_id
"
"      FROM pur_req_ln
"
"     WHERE prl_bu = p_bu
"
"       AND prl_rqst_pfx = p_rqst_pfx
"
"       AND prl_rqst_no = p_rqst_no;
"
"
"
"
"
"    INSERT INTO pur_req_attr_hist(prah_bu,
"
"                                  prah_rqst_pfx,
"
"                                  prah_rqst_no,
"
"                                  prah_seq_no,
"
"                                  prah_attr_id,
"
"                                  prah_cre_by,
"
"				  prah_cre_emp_id,
"
"				  prah_cre_ip_addr,
"
"				  prah_cre_os_user,
"
"                                  prah_cre_date,
"
"                                  prah_upd_by,
"
"				  prah_upd_emp_id,
"
"				  prah_upd_ip_addr,
"
"				  prah_upd_os_user,
"
"                                  prah_upd_date
"
"				 )
"
"    SELECT pra_bu,
"
"           pra_rqst_pfx,
"
"           pra_rqst_no,
"
"           pra_seq_no,
"
"           pra_attr_id,
"
"           pra_cre_by,
"
"	   pra_cre_emp_id,
"
"	   pra_cre_ip_addr,
"
"	   pra_cre_os_user,
"
"           pra_cre_date,
"
"           pra_upd_by,
"
"	   pra_upd_emp_id,
"
"	   pra_upd_ip_addr,
"
"	   pra_upd_os_user,
"
"           pra_upd_date
"
"      FROM pur_req_attr
"
"     WHERE pra_bu = p_bu
"
"       AND pra_rqst_pfx = p_rqst_pfx
"
"       AND pra_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO pur_req_attr_notes_hist(pranh_bu,
"
"                                        pranh_rqst_pfx,
"
"                                        pranh_rqst_no,
"
"                                        pranh_seq_no,
"
"                                        pranh_sub_seq_no,
"
"                                        pranh_note,
"
"                                        pranh_cre_by,
"
"					pranh_cre_emp_id,
"
"					pranh_cre_ip_addr,
"
"					pranh_cre_os_user,
"
"                                        pranh_cre_date,
"
"                                        pranh_upd_by,
"
"					pranh_upd_emp_id,
"
"					pranh_upd_ip_addr,
"
"					pranh_upd_os_user,
"
"                                        pranh_upd_date
"
"				       )
"
"    SELECT pran_bu,
"
"           pran_rqst_pfx,
"
"           pran_rqst_no,
"
"           pran_seq_no,
"
"           pran_sub_seq_no,
"
"           pran_note,
"
"           pran_cre_by,
"
"	   pran_cre_emp_id,
"
"	   pran_cre_ip_addr,
"
"	   pran_cre_os_user,
"
"           pran_cre_date,
"
"           pran_upd_by,
"
"	   pran_upd_emp_id,
"
"	   pran_upd_ip_addr,
"
"	   pran_upd_os_user,
"
"           pran_upd_date
"
"      FROM pur_req_attr_notes
"
"     WHERE pran_bu = p_bu
"
"       AND pran_rqst_pfx = p_rqst_pfx
"
"       AND pran_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO pur_req_ln_attr_hist(prlah_bu,
"
"                                     prlah_rqst_pfx,
"
"                                     prlah_rqst_no,
"
"                                     prlah_seq_no,
"
"                                     prlah_attr_id,
"
"                                     prlah_cre_by,
"
"				     prlah_cre_emp_id,
"
"				     prlah_cre_ip_addr,
"
"				     prlah_cre_os_user,
"
"                                     prlah_cre_date,
"
"                                     prlah_upd_by,
"
"				     prlah_upd_emp_id,
"
"				     prlah_upd_ip_addr,
"
"				     prlah_upd_os_user,
"
"                                     prlah_upd_date
"
"				    )
"
"    SELECT prla_bu,
"
"           prla_rqst_pfx,
"
"           prla_rqst_no,
"
"           prla_seq_no,
"
"           prla_attr_id,
"
"           prla_cre_by,
"
"	   prla_cre_emp_id,
"
"	   prla_cre_ip_addr,
"
"	   prla_cre_os_user,
"
"           prla_cre_date,
"
"           prla_upd_by,
"
"	   prla_upd_emp_id,
"
"	   prla_upd_ip_addr,
"
"	   prla_upd_os_user,
"
"           prla_upd_date
"
"      FROM pur_req_ln_attr
"
"     WHERE prla_bu = p_bu
"
"       AND prla_rqst_pfx = p_rqst_pfx
"
"       AND prla_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO pur_req_ln_attr_notes_hist(prlanh_bu,
"
"                                           prlanh_rqst_pfx,
"
"                                           prlanh_rqst_no,
"
"                                           prlanh_seq_no,
"
"                                           prlanh_sub_seq_no,
"
"                                           prlanh_note,
"
"                                           prlanh_cre_by,
"
"					   prlanh_cre_emp_id,
"
"					   prlanh_cre_ip_addr,
"
"					   prlanh_cre_os_user,
"
"                                           prlanh_cre_date,
"
"                                           prlanh_upd_by,
"
"					   prlanh_upd_emp_id,
"
"					   prlanh_upd_ip_addr,
"
"					   prlanh_upd_os_user,
"
"                                           prlanh_upd_date
"
"				          )
"
"    SELECT prlan_bu,
"
"           prlan_rqst_pfx,
"
"           prlan_rqst_no,
"
"           prlan_seq_no,
"
"           prlan_sub_seq_no,
"
"           prlan_note,
"
"           prlan_cre_by,
"
"	   prlan_cre_emp_id,
"
"	   prlan_cre_ip_addr,
"
"	   prlan_cre_os_user,
"
"           prlan_cre_date,
"
"           prlan_upd_by,
"
"	   prlan_upd_emp_id,
"
"	   prlan_upd_ip_addr,
"
"	   prlan_upd_os_user,
"
"           prlan_upd_date
"
"      FROM pur_req_ln_attr_notes
"
"     WHERE prlan_bu = p_bu
"
"       AND prlan_rqst_pfx = p_rqst_pfx
"
"       AND prlan_rqst_no = p_rqst_no;
"
"
"
"
"
"
"
"    INSERT INTO pr_prod_parts_cont_hist(prppch_bu,
"
"				        prppch_rqst_pfx,
"
"				        prppch_rqst_no,
"
"				        prppch_rqst_seq_no,
"
"				        prppch_seq_no,
"
"				        prppch_prod_id,
"
"				        prppch_prod_rev,
"
"				        prppch_qty,
"
"				        prppch_cre_by,
"
"					prppch_cre_emp_id,
"
"					prppch_cre_ip_addr,
"
"					prppch_cre_os_user,
"
"				        prppch_cre_date,
"
"				        prppch_upd_by,
"
"					prppch_upd_emp_id,
"
"					prppch_upd_ip_addr,
"
"					prppch_upd_os_user,
"
"				        prppch_upd_date,
"
"				        prppch_prod_desc1
"
"				       )
"
"    SELECT prppc_bu,
"
"	   prppc_rqst_pfx,
"
"	   prppc_rqst_no,
"
"	   prppc_rqst_seq_no,
"
"	   prppc_seq_no,
"
"	   prppc_prod_id,
"
"	   prppc_prod_rev,
"
"	   prppc_qty,
"
"	   prppc_cre_by,
"
"	   prppc_cre_emp_id,
"
"	   prppc_cre_ip_addr,
"
"	   prppc_cre_os_user,
"
"	   prppc_cre_date,
"
"	   prppc_upd_by,
"
"	   prppc_upd_emp_id,
"
"	   prppc_upd_ip_addr,
"
"	   prppc_upd_os_user,
"
"	   prppc_upd_date,
"
"	   prppc_prod_desc1
"
"      FROM pr_prod_parts_cont
"
"     WHERE prppc_bu = p_bu
"
"       AND prppc_rqst_pfx = p_rqst_pfx
"
"       AND prppc_rqst_no = p_rqst_no;
"
"
"
"    DELETE FROM pur_req_ln_attr_notes
"
"     WHERE prlan_bu = p_bu
"
"       AND prlan_rqst_pfx = p_rqst_pfx
"
"       AND prlan_rqst_no = p_rqst_no;
"
"
"
"    DELETE FROM pur_req_ln_attr
"
"     WHERE prla_bu = p_bu
"
"       AND prla_rqst_pfx = p_rqst_pfx
"
"       AND prla_rqst_no = p_rqst_no;
"
"
"
"    DELETE FROM pur_req_attr_notes
"
"     WHERE pran_bu = p_bu
"
"       AND pran_rqst_pfx = p_rqst_pfx
"
"       AND pran_rqst_no = p_rqst_no;
"
"
"
"    DELETE FROM pur_req_attr
"
"     WHERE pra_bu = p_bu
"
"       AND pra_rqst_pfx = p_rqst_pfx
"
"       AND pra_rqst_no = p_rqst_no;
"
"
"
"    DELETE FROM pur_req_ln
"
"     WHERE prl_bu = p_bu
"
"       AND prl_rqst_pfx = p_rqst_pfx
"
"       AND prl_rqst_no = p_rqst_no;
"
"
"
"    DELETE FROM pur_req_hd
"
"     WHERE prh_bu = p_bu
"
"       AND prh_rqst_pfx = p_rqst_pfx
"
"       AND prh_rqst_no = p_rqst_no;
"
"
"
"  END proc_ins_pr_hist;*/
"
"
"
"END pkg_pur_hist;"
/
