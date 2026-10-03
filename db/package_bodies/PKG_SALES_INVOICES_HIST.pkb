CREATE OR REPLACE
"PACKAGE BODY pkg_sales_invoices_hist
"
"AS
"
"   PROCEDURE proc_ins_sal_inv_hist (
"
"      p_bu        sales_invoices_hd.sihd_bu%TYPE,
"
"      p_plnt      sales_invoices_hd.sihd_plant%TYPE,
"
"      p_doc_no    sales_invoices_hd.sihd_doc_no%TYPE)
"
"   AS
"
"   BEGIN
"
"      INSERT INTO sales_invoices_hd_hist (sihdh_bu,
"
"                                          sihdh_plant,
"
"                                          sihdh_doc_no,
"
"                                          sihdh_doc_date,
"
"                                          sihdh_cust_id,
"
"                                          sihdh_currency,
"
"                                          sihdh_pay_term,
"
"                                          sihdh_price_term,
"
"                                          sihdh_ship_via,
"
"                                          sihdh_sales_area,
"
"                                          --sihdh_terr_id,
"
"                                          --sihdh_sub_terr_id,
"
"                                          sihdh_status,
"
"                                          sihdh_inv_pfx,
"
"                                          sihdh_inv_no,
"
"                                          sihdh_inv_date,
"
"                                          sihdh_exchange_rate,
"
"                                          sihdh_year,
"
"                                          sihdh_period,
"
"                                          sihdh_rem_date,
"
"                                          sihdh_type,
"
"                                          sihdh_pay_term_det,
"
"                                          sihdh_ref1,
"
"                                          sihdh_ref2,
"
"                                          sihdh_tot_amt,
"
"                                          sihdh_mat_amt,
"
"                                          sihdh_tax_amt,
"
"                                          sihdh_rnd_off,
"
"                                          sihdh_ref3,
"
"                                          sihdh_loading_port,
"
"                                          sihdh_discharging_port,
"
"                                          sihdh_ref4,
"
"                                          sihdh_3pl_grn_no,
"
"                                          sihdh_3pl_rcpt_date,
"
"                                          sihdh_3pl_sel_flag,
"
"                                          sihdh_buyer_id,
"
"                                          sihdh_discharging_port_id,
"
"                                          sihdh_loading_port_id,
"
"                                          sihdh_destination_port_id,
"
"                                          sihdh_destination_port,
"
"                                          sihdh_gross_amt,
"
"                                          sihdh_net_amt,
"
"                                          sihdh_disc_amt,
"
"                                          sihdh_proforma_inv_no,
"
"                                          sihdh_proforma_inv_pfx,
"
"                                          sihdh_sal_ret_type,
"
"                                          sihdh_jrnl_flag,
"
"                                          sihdh_bd_flag,
"
"                                          sihdh_dc_cre_flag,
"
"                                          sihdh_dc_cre_user,
"
"                                          sihdh_dc_no,
"
"                                          sihdh_cust_inv_no,
"
"                                          sihdh_cust_inv_date,
"
"                                          sihdh_cust_dc_no,
"
"                                          sihdh_cust_dc_date,
"
"                                          sihdh_lut_ref_no,
"
"                                          sihdh_shipment_ord_date,
"
"                                          sihdh_bol_no,
"
"                                          sihdh_bol_date,
"
"                                          sihdh_epcg_no,
"
"                                          sihdh_epcg_ref_no,
"
"                                          sihdh_ap_ar_doc_cls,
"
"                                          sihdh_deduction_amt,
"
"                                          sihdh_source,
"
"                                          sihdh_adv_lic_no,
"
"                                          sihdh_calc_comm_flag,
"
"                                          sihdh_adv_recd_amt,
"
"                                          sihdh_tobe_rcvd_amt,
"
"                                          sihdh_sales_person,
"
"                                          sihdh_ins_doc_no,
"
"                                          sihdh_ins_doc_cover_amt,
"
"                                          sihdh_consign_deliv_date,
"
"                                          sihdh_cust_grn_no,
"
"                                          sihdh_on_board_date,
"
"                                          sihdh_prf_of_deliv_date,
"
"                                          sihdh_chq_no,
"
"                                          sihdh_chq_date,
"
"                                          sihdh_chq_rcvd_date,
"
"                                          sihdh_chq_amt,
"
"                                          sihdh_pod_date,
"
"                                          sihdh_asn_no,
"
"                                          sihdh_li_move_type,
"
"                                          sihdh_proj_id,
"
"                                          sihdh_task_id,
"
"                                          sihdh_jrnl_wn_ent_req_flag,
"
"                                          sihdh_comm_inv_pfx,
"
"                                          sihdh_comm_inv_no,
"
"                                          sihdh_comm_inv_date,
"
"                                          sihdh_exc_inv_pfx,
"
"                                          sihdh_exc_inv_no,
"
"                                          sihdh_exc_inv_date,
"
"                                          sihdh_custom_ex_rate,
"
"                                          sihdh_trnsptr_id,
"
"                                          sihdh_frt_to_pay_flag,
"
"                                          sihdh_exc_inv_user,
"
"                                          sihdh_exc_inv_sel_flag,
"
"                                          sihdh_dummy_inv_flag,
"
"                                          sihdh_reverse_flag,
"
"                                          sihdh_tot_net_weight,
"
"                                          sihdh_sales_emp_id,
"
"                                          sihdh_sub_mgr_id,
"
"                                          sihdh_te_mgr_id,
"
"                                          sihdh_ar_mgr_id,
"
"                                          sihdh_tot_carr_rate,
"
"                                          sihdh_oral_dlvry_date,
"
"                                          sihdh_dlvry_date,
"
"                                          sihdh_rec_source,
"
"                                          sihdh_bd_eligible_amt,
"
"                                          sihdh_bd_inprog_amt,
"
"                                          sihdh_bd_prcs_amt,
"
"                                          sihdh_lut_doc_status,
"
"                                          sihdh_lut_sel_flag,
"
"                                          sihdh_lut_sel_user,
"
"                                          sihdh_despatch_rcvd_date,
"
"                                          sihdh_movement_date,
"
"                                          sihdh_air_frgt_cost_flag,
"
"                                          sihdh_air_frgt_cost_val,
"
"                                          sihdh_freight,
"
"                                          sihdh_insurance,
"
"                                          sihdh_commision,
"
"                                          sihdh_part_brc_rcvd_date,
"
"                                          sihdh_brc_rcvd_date,
"
"                                          sihdh_bill_of_exg_date,
"
"                                          sihdh_exp_pay_rcvd_date,
"
"                                          sihdh_fob_value,
"
"                                          sihdh_poe_rcvd_flag,
"
"                                          sihdh_poe_rcvd_date,
"
"                                          sihdh_poe_ref_no,
"
"                                          sihdh_trnsptr_name,
"
"                                          sihdh_fg_spr_type,
"
"                                          sihdh_gst_cust_type,
"
"                                          sihdh_gst_reg_type,
"
"                                          sihdh_gst_w_wo_pay_flag,
"
"                                          sihdh_gst_rcm_flag,
"
"                                          sihdh_gst_e_oe_type,
"
"                                          sihdh_gst_rtn_type,
"
"                                          sihdh_ecc_rcvd_flag,
"
"                                          sihdh_bol_rcvd_flag,
"
"                                          sihdh_exe_rcvd_flag,
"
"                                          sihdh_epc_rcvd_flag,
"
"                                          sihdh_sp_type,
"
"                                          sihdh_sp_emp_id,
"
"                                          sihdh_price_term_type,
"
"                                          sihdh_ddr_flag,
"
"                                          sihdh_fms_flag,
"
"                                          sihdh_meis_flag,
"
"                                          sihdh_brc_no,
"
"                                          sihdh_brc_date,
"
"                                          sihdh_suplm_doc_no,
"
"                                          --sihdh_div_id,
"
"                                          --sihdh_sub_div_id,
"
"                                          sihdh_lr_flag,
"
"                                          sihdh_cancel_reason,
"
"                                          sihdh_stk_trfr_grn_pfx,
"
"                                          sihdh_stk_trfr_grn_no,
"
"                                          sihdh_stk_trfr_sel_flag,
"
"                                          sihdh_stk_trfr_sel_user,
"
"                                          sihdh_stk_trfr_ge_doc_no,
"
"                                          sihdh_csd_cust_id,
"
"                                          sihdh_csd_prod_id,
"
"                                          sihdh_csd_prod_rev,
"
"                                          sihdh_csd_sale_inv_pfx,
"
"                                          sihdh_csd_sale_inv_no,
"
"                                          sihdh_csd_mchn_serial_no,
"
"                                          sihdh_adv_recv_pct,
"
"                                          sihdh_cr_limit_status,
"
"                                          sihdh_etr_no,
"
"                                          sihdh_exempt_no,
"
"                                          sihdh_exempt_date_from,
"
"                                          sihdh_exempt_date_to,
"
"                                          sihdh_oem_flag,
"
"                                          sihdh_epz_no,
"
"                                          sihdh_epz_date_from,
"
"                                          sihdh_epz_date_to,
"
"                                          sihdh_cnr_sou_inv_no,
"
"                                          sihdh_cnr_sou_inv_date,
"
"                                          sihdh_adv_recv_amt,
"
"                                          sihdh_deliverable_flag,
"
"                                          sihdh_pur_rtn_reas_id,
"
"                                          sihdh_perf_bg_req_flag,
"
"                                          sihdh_perf_bg_doc_pfx,
"
"                                          sihdh_perf_bg_doc_no,
"
"                                          sihdh_gr_wgt,
"
"                                          sihdh_tr_wgt,
"
"                                          sihdh_nt_wgt,
"
"                                          sihdh_eway_sel_flag,
"
"                                          sihdh_eway_sel_user,
"
"                                          sihdh_inspn_flag,
"
"                                          sihdh_isd_gst_eligible_flag,
"
"                                          sihdh_div_type,
"
"                                          sihdh_supply_type,
"
"                                          sihdh_no_packs,
"
"                                          sihdh_vehicle_id,
"
"                                          sihdh_air_bill_no,
"
"                                          sihdh_ship_bill_no,
"
"                                          sihdh_ship_bill_date,
"
"                                          sihdh_shp_bl_exp_no,
"
"                                          sihdh_shp_bl_exp_date,
"
"                                          sihdh_lodgement_date,
"
"                                          sihdh_lodgement_bank,
"
"                                          sihdh_cust_house_agent,
"
"                                          sihdh_cash_disc_pct,
"
"                                          sihdh_brc_amt,
"
"                                          sihdh_forwarder_name,
"
"                                          sihdh_drwbck_detail,
"
"                                          sihdh_drwbck_pct,
"
"                                          sihdh_cust_name,
"
"                                          sihdh_dbktrk_bank_ref_det,
"
"                                          sihdh_dbktrk_doc_trk_det,
"
"                                          sihdh_dbktrk_fob_val,
"
"                                          sihdh_dbktrk_sb_exrate,
"
"                                          sihdh_dbktrk_inforex_amt,
"
"                                          sihdh_dbktrk_ir_odbb_no,
"
"                                          sihdh_dbktrk_db_cr_note_no,
"
"                                          sihdh_dbktrk_db_cr_amt,
"
"                                          sihdh_dbktrk_rlized_val,
"
"                                          sihdh_dbktrk_ins_no,
"
"                                          sihdh_dbktrk_ins_date,
"
"                                          sihdh_dbktrk_ins_val,
"
"                                          sihdh_dbktrk_car_app_date,
"
"                                          sihdh_dbktrk_cert_no,
"
"                                          sihdh_dbktrk_cert_appl_on_dt,
"
"                                          sihdh_dbktrk_cert_rcvd_on_dt,
"
"                                          sihdh_dbktrk_car_cont_det,
"
"                                          sihdh_dbktrk_brc_no,
"
"                                          sihdh_dbktrk_brc_date,
"
"                                          sihdh_opr_type,
"
"                                          sihdh_payterm_desc,
"
"                                          sihdh_fob_desc,
"
"                                          sihdh_shipvia_desc,
"
"                                          sihdh_cre_by,
"
"                                          sihdh_cre_ip_addr,
"
"                                          sihdh_cre_os_user,
"
"                                          sihdh_cre_date,
"
"                                          sihdh_upd_by,
"
"                                          sihdh_upd_ip_addr,
"
"                                          sihdh_upd_os_user,
"
"                                          sihdh_upd_date,
"
"                                          sihdh_cre_emp_id,
"
"                                          sihdh_upd_emp_id,
"
"                                          sihdh_lc_no,
"
"                                          sihdh_banker_detail,
"
"                                          sihdh_comm_branch,
"
"                                          sihdh_custom_office,
"
"                                          sihdh_dbktrk_submt_to_bank,
"
"                                          sihdh_dbktrk_brc_amt_fc,
"
"                                          sihdh_prof_inv_pfx,
"
"                                          sihdh_prof_inv_no,
"
"                                          sihdh_desp_pln_doc_no,
"
"                                          sihdh_ewb_inv_no,
"
"                                          sihdh_acct_cls_id,
"
"                                          sihdh_cust_po_no,
"
"                                          sihdh_cust_po_date,
"
"                                          sihdh_proj_lvl,
"
"                                          sihdh_proj_lvl_name,
"
"                                          sihdh_pan_no,
"
"                                          sihdh_aadhaar_no,
"
"                                          sihdh_pan_avail_type,
"
"                                          sihdh_tcs_amt,
"
"                                          sihdh_lc_raised_by,
"
"                                          sihdh_einv_arn_no,
"
"                                          sihdh_einv_irn_no,
"
"                                          sihdh_frgt_coll_amt,
"
"                                          sihdh_frgt_paid_amt,
"
"                                          sihdh_einv_ack_date,
"
"                                          sihdh_asn_date,
"
"                                          sihdh_cust_grn_date,
"
"                                          sihdh_cust_asn_no,
"
"                                          sihdh_cust_asn_date,
"
"                                          sihdh_einv_json_file,
"
"                                          sihdh_einv_post_response,
"
"                                          sihdh_einv_post_status,
"
"                                          sihdh_einv_sign_qrcode,
"
"                                          sihdh_einv_sign_invoice,
"
"                                          sihdh_cash_disc_amt,
"
"                                          sihdh_einv_post_err,
"
"                                          sihdh_einv_cancel_date,
"
"                                          sihdh_einv_cancel_response,
"
"                                          sihdh_einv_cancel_status,
"
"                                          sihdh_einv_cancel_err,
"
"                                          sihdh_ebill_expiry_date,
"
"                                          sihdh_ebill_post_response,
"
"                                          sihdh_ebill_post_status,
"
"                                          sihdh_ebill_post_err,
"
"                                          sihdh_ebill_cancel_response,
"
"                                          sihdh_ebill_cancel_status,
"
"                                          sihdh_ebill_cancel_date,
"
"                                          sihdh_ebill_cancel_err,
"
"                                          sihdh_billfrm_loc_name,
"
"                                          sihdh_shipfrm_loc_name,
"
"                                          sihdh_billto_loc_name,
"
"                                          sihdh_shipto_loc_name,
"
"                                          sihdh_upd_tcs_amt,
"
"                                          sihdh_tcs_pct,
"
"                                          sihdh_tcs_access_val,
"
"                                          sihdh_tcs_sec_id,
"
"                                          sihdh_lc_doc_pfx,
"
"                                          sihdh_lc_doc_no,
"
"                                          sihdh_lc_reference,
"
"                                          sihdh_lo_grn_pfx,
"
"                                          sihdh_lo_grn_no,
"
"                                          sihdh_lo_ge_doc_no,
"
"                                          sihdh_recpt_no,
"
"                                          sihdh_mate_rec_date,
"
"                                          sihdh_oral_delvry_date,
"
"                                          sihdh_delvry_date,
"
"                                          sihdh_asnno_repsonse,
"
"                                          sihdh_asn_err_msg,
"
"                                          sihdh_shipfrm_type,
"
"                                          sihdh_cust_unit_id,
"
"                                          sihdh_plnt_loc_id,
"
"                                          sihdh_plnt_loc_name,
"
"                                          sihdh_trans_bu,
"
"                                          sihdh_trans_plnt,
"
"                                          sihdh_trans_plnt_loc_id,
"
"                                          sihdh_comm_tax_inv_flag,
"
"                                          sihdh_org_swift_bic,
"
"                                          sihdh_org_ifsc_code,
"
"                                          sihdh_org_pay_bank,
"
"                                          sihdh_org_pay_bank_desc,
"
"                                          sihdh_org_pay_acct_no,
"
"                                          sihdh_org_pay_branch_desc,
"
"                                          sihdh_ship_rem,
"
"                                          sihdh_orgin,
"
"                                          sihdh_recv_name,
"
"                                          sihdh_cust_rcpt_date,
"
"                                          sihdh_cust_rcpt_no,
"
"                                          sihdh_trans_bill_no,
"
"                                          sihdh_trans_bitt_date,
"
"                                          sihdh_rtn_opt,
"
"                                          sihdh_cc_code,
"
"                                          sihdh_amc_can_rec,
"
"                                          sihdh_amc_sel_flag,
"
"                                          sihdh_parent_cust_id,
"
"                                          sihdh_instl_plnt_loc_id,
"
"                                          sihdh_ebill_post_status_code,
"
"                                          sihdh_ebill_cancel_status_code,
"
"                                          sihdh_ebill_post_status_desc,
"
"                                          sihdh_ebill_cancel_status_desc,
"
"                                          sihdh_ewb_json_file,
"
"                                          sihdh_sal_rtn_reas_id,
"
"                                          sihdh_rtn_source,
"
"                                          sihdh_rtn_goods_dtls,
"
"                                          sihdh_doc_pfx,
"
"                                          sihdh_cust_po_ref,
"
"                                          sihdh_cust_inv_ref,
"
"                                          sihdh_cust_sal_ord_ref)
"
"         SELECT sihd_bu,
"
"                sihd_plant,
"
"                sihd_doc_no,
"
"                sihd_doc_date,
"
"                sihd_cust_id,
"
"                sihd_currency,
"
"                sihd_pay_term,
"
"                sihd_price_term,
"
"                sihd_ship_via,
"
"                sihd_sales_area,
"
"                --sihd_terr_id,
"
"                --sihd_sub_terr_id,
"
"                sihd_status,
"
"                sihd_inv_pfx,
"
"                sihd_inv_no,
"
"                sihd_inv_date,
"
"                sihd_exchange_rate,
"
"                sihd_year,
"
"                sihd_period,
"
"                sihd_rem_date,
"
"                sihd_type,
"
"                sihd_pay_term_det,
"
"                sihd_ref1,
"
"                sihd_ref2,
"
"                sihd_tot_amt,
"
"                sihd_mat_amt,
"
"                sihd_tax_amt,
"
"                sihd_rnd_off,
"
"                sihd_ref3,
"
"                sihd_loading_port,
"
"                sihd_discharging_port,
"
"                sihd_ref4,
"
"                sihd_3pl_grn_no,
"
"                sihd_3pl_rcpt_date,
"
"                sihd_3pl_sel_flag,
"
"                sihd_buyer_id,
"
"                sihd_discharging_port_id,
"
"                sihd_loading_port_id,
"
"                sihd_destination_port_id,
"
"                sihd_destination_port,
"
"                sihd_gross_amt,
"
"                sihd_net_amt,
"
"                sihd_disc_amt,
"
"                sihd_proforma_inv_no,
"
"                sihd_proforma_inv_pfx,
"
"                sihd_sal_ret_type,
"
"                sihd_jrnl_flag,
"
"                sihd_bd_flag,
"
"                sihd_dc_cre_flag,
"
"                sihd_dc_cre_user,
"
"                sihd_dc_no,
"
"                sihd_cust_inv_no,
"
"                sihd_cust_inv_date,
"
"                sihd_cust_dc_no,
"
"                sihd_cust_dc_date,
"
"                sihd_lut_ref_no,
"
"                sihd_shipment_ord_date,
"
"                sihd_bol_no,
"
"                sihd_bol_date,
"
"                sihd_epcg_no,
"
"                sihd_epcg_ref_no,
"
"                sihd_ap_ar_doc_cls,
"
"                sihd_deduction_amt,
"
"                sihd_source,
"
"                sihd_adv_lic_no,
"
"                sihd_calc_comm_flag,
"
"                sihd_adv_recd_amt,
"
"                sihd_tobe_rcvd_amt,
"
"                sihd_sales_person,
"
"                sihd_ins_doc_no,
"
"                sihd_ins_doc_cover_amt,
"
"                sihd_consign_deliv_date,
"
"                sihd_cust_grn_no,
"
"                sihd_on_board_date,
"
"                sihd_prf_of_deliv_date,
"
"                sihd_chq_no,
"
"                sihd_chq_date,
"
"                sihd_chq_rcvd_date,
"
"                sihd_chq_amt,
"
"                sihd_pod_date,
"
"                sihd_asn_no,
"
"                sihd_li_move_type,
"
"                sihd_proj_id,
"
"                sihd_task_id,
"
"                sihd_jrnl_wn_ent_req_flag,
"
"                sihd_comm_inv_pfx,
"
"                sihd_comm_inv_no,
"
"                sihd_comm_inv_date,
"
"                sihd_exc_inv_pfx,
"
"                sihd_exc_inv_no,
"
"                sihd_exc_inv_date,
"
"                sihd_custom_ex_rate,
"
"                sihd_trnsptr_id,
"
"                sihd_frt_to_pay_flag,
"
"                sihd_exc_inv_user,
"
"                sihd_exc_inv_sel_flag,
"
"                sihd_dummy_inv_flag,
"
"                sihd_reverse_flag,
"
"                sihd_tot_net_weight,
"
"                sihd_sales_emp_id,
"
"                sihd_sub_mgr_id,
"
"                sihd_te_mgr_id,
"
"                sihd_ar_mgr_id,
"
"                sihd_tot_carr_rate,
"
"                sihd_oral_dlvry_date,
"
"                sihd_dlvry_date,
"
"                sihd_rec_source,
"
"                sihd_bd_eligible_amt,
"
"                sihd_bd_inprog_amt,
"
"                sihd_bd_prcs_amt,
"
"                sihd_lut_doc_status,
"
"                sihd_lut_sel_flag,
"
"                sihd_lut_sel_user,
"
"                sihd_despatch_rcvd_date,
"
"                sihd_movement_date,
"
"                sihd_air_frgt_cost_flag,
"
"                sihd_air_frgt_cost_val,
"
"                sihd_freight,
"
"                sihd_insurance,
"
"                sihd_commision,
"
"                sihd_part_brc_rcvd_date,
"
"                sihd_brc_rcvd_date,
"
"                sihd_bill_of_exg_date,
"
"                sihd_exp_pay_rcvd_date,
"
"                sihd_fob_value,
"
"                sihd_poe_rcvd_flag,
"
"                sihd_poe_rcvd_date,
"
"                sihd_poe_ref_no,
"
"                sihd_trnsptr_name,
"
"                sihd_fg_spr_type,
"
"                sihd_gst_cust_type,
"
"                sihd_gst_reg_type,
"
"                sihd_gst_w_wo_pay_flag,
"
"                sihd_gst_rcm_flag,
"
"                sihd_gst_e_oe_type,
"
"                sihd_gst_rtn_type,
"
"                sihd_ecc_rcvd_flag,
"
"                sihd_bol_rcvd_flag,
"
"                sihd_exe_rcvd_flag,
"
"                sihd_epc_rcvd_flag,
"
"                sihd_sp_type,
"
"                sihd_sp_emp_id,
"
"                sihd_price_term_type,
"
"                sihd_ddr_flag,
"
"                sihd_fms_flag,
"
"                sihd_meis_flag,
"
"                sihd_brc_no,
"
"                sihd_brc_date,
"
"                sihd_suplm_doc_no,
"
"                --sihd_div_id,
"
"                --sihd_sub_div_id,
"
"                sihd_lr_flag,
"
"                sihd_cancel_reason,
"
"                sihd_stk_trfr_grn_pfx,
"
"                sihd_stk_trfr_grn_no,
"
"                sihd_stk_trfr_sel_flag,
"
"                sihd_stk_trfr_sel_user,
"
"                sihd_stk_trfr_ge_doc_no,
"
"                sihd_csd_cust_id,
"
"                sihd_csd_prod_id,
"
"                sihd_csd_prod_rev,
"
"                sihd_csd_sale_inv_pfx,
"
"                sihd_csd_sale_inv_no,
"
"                sihd_csd_mchn_serial_no,
"
"                sihd_adv_recv_pct,
"
"                sihd_cr_limit_status,
"
"                sihd_etr_no,
"
"                sihd_exempt_no,
"
"                sihd_exempt_date_from,
"
"                sihd_exempt_date_to,
"
"                sihd_oem_flag,
"
"                sihd_epz_no,
"
"                sihd_epz_date_from,
"
"                sihd_epz_date_to,
"
"                sihd_cnr_sou_inv_no,
"
"                sihd_cnr_sou_inv_date,
"
"                sihd_adv_recv_amt,
"
"                sihd_deliverable_flag,
"
"                sihd_pur_rtn_reas_id,
"
"                sihd_perf_bg_req_flag,
"
"                sihd_perf_bg_doc_pfx,
"
"                sihd_perf_bg_doc_no,
"
"                sihd_gr_wgt,
"
"                sihd_tr_wgt,
"
"                sihd_nt_wgt,
"
"                sihd_eway_sel_flag,
"
"                sihd_eway_sel_user,
"
"                sihd_inspn_flag,
"
"                sihd_isd_gst_eligible_flag,
"
"                sihd_div_type,
"
"                sihd_supply_type,
"
"                sihd_no_packs,
"
"                sihd_vehicle_id,
"
"                sihd_air_bill_no,
"
"                sihd_ship_bill_no,
"
"                sihd_ship_bill_date,
"
"                sihd_shp_bl_exp_no,
"
"                sihd_shp_bl_exp_date,
"
"                sihd_lodgement_date,
"
"                sihd_lodgement_bank,
"
"                sihd_cust_house_agent,
"
"                sihd_cash_disc_pct,
"
"                sihd_brc_amt,
"
"                sihd_forwarder_name,
"
"                sihd_drwbck_detail,
"
"                sihd_drwbck_pct,
"
"                sihd_cust_name,
"
"                sihd_dbktrk_bank_ref_det,
"
"                sihd_dbktrk_doc_trk_det,
"
"                sihd_dbktrk_fob_val,
"
"                sihd_dbktrk_sb_exrate,
"
"                sihd_dbktrk_inforex_amt,
"
"                sihd_dbktrk_ir_odbb_no,
"
"                sihd_dbktrk_db_cr_note_no,
"
"                sihd_dbktrk_db_cr_amt,
"
"                sihd_dbktrk_rlized_val,
"
"                sihd_dbktrk_ins_no,
"
"                sihd_dbktrk_ins_date,
"
"                sihd_dbktrk_ins_val,
"
"                sihd_dbktrk_car_app_date,
"
"                sihd_dbktrk_cert_no,
"
"                sihd_dbktrk_cert_appl_on_dt,
"
"                sihd_dbktrk_cert_rcvd_on_dt,
"
"                sihd_dbktrk_car_cont_det,
"
"                sihd_dbktrk_brc_no,
"
"                sihd_dbktrk_brc_date,
"
"                sihd_opr_type,
"
"                sihd_payterm_desc,
"
"                sihd_fob_desc,
"
"                sihd_shipvia_desc,
"
"                sihd_cre_by,
"
"                sihd_cre_ip_addr,
"
"                sihd_cre_os_user,
"
"                sihd_cre_date,
"
"                sihd_upd_by,
"
"                sihd_upd_ip_addr,
"
"                sihd_upd_os_user,
"
"                sihd_upd_date,
"
"                sihd_cre_emp_id,
"
"                sihd_upd_emp_id,
"
"                sihd_lc_no,
"
"                sihd_banker_detail,
"
"                sihd_comm_branch,
"
"                sihd_custom_office,
"
"                sihd_dbktrk_submt_to_bank,
"
"                sihd_dbktrk_brc_amt_fc,
"
"                sihd_prof_inv_pfx,
"
"                sihd_prof_inv_no,
"
"                sihd_desp_pln_doc_no,
"
"                sihd_ewb_inv_no,
"
"                sihd_acct_cls_id,
"
"                sihd_cust_po_no,
"
"                sihd_cust_po_date,
"
"                sihd_proj_lvl,
"
"                sihd_proj_lvl_name,
"
"                sihd_pan_no,
"
"                sihd_aadhaar_no,
"
"                sihd_pan_avail_type,
"
"                sihd_tcs_amt,
"
"                sihd_lc_raised_by,
"
"                sihd_einv_arn_no,
"
"                sihd_einv_irn_no,
"
"                sihd_frgt_coll_amt,
"
"                sihd_frgt_paid_amt,
"
"                sihd_einv_ack_date,
"
"                sihd_asn_date,
"
"                sihd_cust_grn_date,
"
"                sihd_cust_asn_no,
"
"                sihd_cust_asn_date,
"
"                sihd_einv_json_file,
"
"                sihd_einv_post_response,
"
"                sihd_einv_post_status,
"
"                sihd_einv_sign_qrcode,
"
"                sihd_einv_sign_invoice,
"
"                sihd_cash_disc_amt,
"
"                sihd_einv_post_err,
"
"                sihd_einv_cancel_date,
"
"                sihd_einv_cancel_response,
"
"                sihd_einv_cancel_status,
"
"                sihd_einv_cancel_err,
"
"                sihd_ebill_expiry_date,
"
"                sihd_ebill_post_response,
"
"                sihd_ebill_post_status,
"
"                sihd_ebill_post_err,
"
"                sihd_ebill_cancel_response,
"
"                sihd_ebill_cancel_status,
"
"                sihd_ebill_cancel_date,
"
"                sihd_ebill_cancel_err,
"
"                sihd_billfrm_loc_name,
"
"                sihd_shipfrm_loc_name,
"
"                sihd_billto_loc_name,
"
"                sihd_shipto_loc_name,
"
"                sihd_upd_tcs_amt,
"
"                sihd_tcs_pct,
"
"                sihd_tcs_access_val,
"
"                sihd_tcs_sec_id,
"
"                sihd_lc_doc_pfx,
"
"                sihd_lc_doc_no,
"
"                sihd_lc_reference,
"
"                sihd_lo_grn_pfx,
"
"                sihd_lo_grn_no,
"
"                sihd_lo_ge_doc_no,
"
"                sihd_recpt_no,
"
"                sihd_mate_rec_date,
"
"                sihd_oral_delvry_date,
"
"                sihd_delvry_date,
"
"                sihd_asnno_repsonse,
"
"                sihd_asn_err_msg,
"
"                sihd_shipfrm_type,
"
"                sihd_cust_unit_id,
"
"                sihd_plnt_loc_id,
"
"                sihd_plnt_loc_name,
"
"                sihd_trans_bu,
"
"                sihd_trans_plnt,
"
"                sihd_trans_plnt_loc_id,
"
"                sihd_comm_tax_inv_flag,
"
"                sihd_org_swift_bic,
"
"                sihd_org_ifsc_code,
"
"                sihd_org_pay_bank,
"
"                sihd_org_pay_bank_desc,
"
"                sihd_org_pay_acct_no,
"
"                sihd_org_pay_branch_desc,
"
"                sihd_ship_rem,
"
"                sihd_orgin,
"
"                sihd_recv_name,
"
"                sihd_cust_rcpt_date,
"
"                sihd_cust_rcpt_no,
"
"                sihd_trans_bill_no,
"
"                sihd_trans_bitt_date,
"
"                sihd_rtn_opt,
"
"                sihd_cc_code,
"
"                sihd_amc_can_rec,
"
"                sihd_amc_sel_flag,
"
"                sihd_parent_cust_id,
"
"                sihd_instl_plnt_loc_id,
"
"                sihd_ebill_post_status_code,
"
"                sihd_ebill_cancel_status_code,
"
"                sihd_ebill_post_status_desc,
"
"                sihd_ebill_cancel_status_desc,
"
"                sihd_ewb_json_file,
"
"                sihd_sal_rtn_reas_id,
"
"                sihd_rtn_source,
"
"                sihd_rtn_goods_dtls,
"
"                sihd_doc_pfx,
"
"                sihd_cust_po_ref,
"
"                sihd_cust_inv_ref,
"
"                sihd_cust_sal_ord_ref
"
"           FROM sales_invoices_hd
"
"          WHERE     sihd_bu = p_bu
"
"                AND sihd_plant = p_plnt
"
"                AND sihd_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_invoices_ln_hist (silnh_bu,
"
"                                          silnh_plnt,
"
"                                          silnh_doc_no,
"
"                                          silnh_seq_no,
"
"                                          silnh_loc_id,
"
"                                          silnh_prod_id,
"
"                                          silnh_prod_desc1,
"
"                                          silnh_state,
"
"                                          silnh_uom,
"
"                                          silnh_price,
"
"                                          silnh_disc_pct,
"
"                                          silnh_inv_qty,
"
"                                          silnh_conv_factor,
"
"                                          silnh_pick_qty,
"
"                                          silnh_class,
"
"                                          silnh_return_qty,
"
"                                          silnh_prod_rev,
"
"                                          silnh_warranty_flag,
"
"                                          silnh_so_no,
"
"                                          silnh_so_sfx,
"
"                                          silnh_so_seq_no,
"
"                                          silnh_rqrd_date,
"
"                                          silnh_promise_date,
"
"                                          silnh_store_id,
"
"                                          silnh_cust_po_date,
"
"                                          silnh_cust_po_no,
"
"                                          silnh_inv_seq_no,
"
"                                          silnh_stk_trn_po_no,
"
"                                          silnh_old_inv_pfx,
"
"                                          silnh_old_inv_no,
"
"                                          silnh_old_seq_no,
"
"                                          silnh_stk_trn_rcpt_qty,
"
"                                          silnh_net_price,
"
"                                          silnh_unit_cost,
"
"                                          silnh_offset_qty,
"
"                                          silnh_price_uom,
"
"                                          silnh_prod_uom,
"
"                                          silnh_tg_rcpt_no,
"
"                                          silnh_tg_rcpt_seq_no,
"
"                                          silnh_list_price,
"
"                                          silnh_prod_size,
"
"                                          silnh_proj_id,
"
"                                          silnh_trans_task_id,
"
"                                          silnh_inv_task_id,
"
"                                          silnh_emp_id,
"
"                                          silnh_res_id,
"
"                                          silnh_vehicle_id,
"
"                                          silnh_cons_qty,
"
"                                          silnh_inprog_qty,
"
"                                          silnh_subinv_flag,
"
"                                          silnh_cons_temp_qty,
"
"                                          silnh_cons_date,
"
"                                          silnh_sup_inproc_qty,
"
"                                          silnh_sup_compl_qty,
"
"                                          silnh_disc_amt,
"
"                                          silnh_rcvd_store_id,
"
"                                          silnh_3pl_sel_flag,
"
"                                          silnh_3pl_inproc_qty,
"
"                                          silnh_3pl_proc_qty,
"
"                                          silnh_3pl_compl_qty,
"
"                                          silnh_3pl_sess_id,
"
"                                          silnh_amd_no,
"
"                                          silnh_amd_date,
"
"                                          silnh_conract_no,
"
"                                          silnh_cust_doc_no,
"
"                                          silnh_cust_doc_rev,
"
"                                          silnh_cust_ln_seq_no,
"
"                                          silnh_price_basis,
"
"                                          silnh_sales_price_class,
"
"                                          silnh_po_ref,
"
"                                          silnh_cust_po_seq_no,
"
"                                          silnh_prim_rtnprcs_qty,
"
"                                          silnh_sec_rtnprcs_qty,
"
"                                          silnh_prod_seq_no,
"
"                                          silnh_prod_ord_no,
"
"                                          silnh_prod_trans_no,
"
"                                          silnh_prod_oprn_id,
"
"                                          silnh_mt_doc_no,
"
"                                          silnh_mt_seq_no,
"
"                                          silnh_sub_cls,
"
"                                          silnh_cust_prod_id,
"
"                                          silnh_cont_no,
"
"                                          silnh_rqrd_qty,
"
"                                          silnh_so_sl_seq_no,
"
"                                          silnh_po_sl_seq_no,
"
"                                          silnh_catalog_no,
"
"                                          silnh_depb_pct,
"
"                                          silnh_depb_flag,
"
"                                          silnh_ref,
"
"                                          silnh_adv_rcvd_amt,
"
"                                          silnh_mftr_cost,
"
"                                          silnh_prod_ext_desc,
"
"                                          silnh_sf_code,
"
"                                          silnh_prod_net_weight,
"
"                                          silnh_tolr_qty,
"
"                                          silnh_sup_doc_no,
"
"                                          silnh_sup_si_doc_no,
"
"                                          silnh_fp_receipt_no,
"
"                                          silnh_mrp_price,
"
"                                          silnh_accepted_qty,
"
"                                          silnh_rejected_qty,
"
"                                          silnh_sr_dev_unit_cost,
"
"                                          silnh_sq_price,
"
"                                          silnh_map_price,
"
"                                          silnh_sou_bu,
"
"                                          silnh_sou_plnt,
"
"                                          silnh_sou_ord_no,
"
"                                          silnh_sou_ord_seq_no,
"
"                                          silnh_exec_id,
"
"                                          silnh_dept_id,
"
"                                          silnh_lot_no,
"
"                                          silnh_ser_no,
"
"                                          silnh_source_id,
"
"                                          silnh_source_type,
"
"                                          silnh_sys_ls_no,
"
"                                          silnh_expiry_date,
"
"                                          silnh_inst_req_flag,
"
"                                          silnh_dc_doc_no,
"
"                                          silnh_dc_no,
"
"                                          silnh_dc_seq_no,
"
"                                          silnh_mark_no,
"
"                                          silnh_kinds_of_bags,
"
"                                          silnh_desc_of_goods,
"
"                                          silnh_custom_price,
"
"                                          silnh_adv_lic_no,
"
"                                          silnh_adv_lic_date,
"
"                                          silnh_cust_prod_desc,
"
"                                          silnh_no_of_packs,
"
"                                          silnh_prod_cat_id,
"
"                                          silnh_prod_grade_id,
"
"                                          silnh_prod_pack_size,
"
"                                          silnh_comm_proc_qty,
"
"                                          silnh_comm_in_proc_qty,
"
"                                          silnh_comm_inv_user,
"
"                                          silnh_comm_inv_sel_flag,
"
"                                          silnh_rg_cat_id,
"
"                                          silnh_rg_grade_id,
"
"                                          silnh_rg_size,
"
"                                          silnh_rg_pack_size,
"
"                                          silnh_price_conv_factor,
"
"                                          silnh_gross_amt,
"
"                                          silnh_last_amd_no,
"
"                                          silnh_dc_short_flag,
"
"                                          silnh_abatement_pct,
"
"                                          silnh_ret_dur,
"
"                                          silnh_ret_freq,
"
"                                          silnh_ret_by_date,
"
"                                          silnh_gen_ls_flag,
"
"                                          silnh_prod_gross_weight,
"
"                                          silnh_pack_mat_wgt,
"
"                                          silnh_pack_prod_id,
"
"                                          silnh_pack_prod_rev,
"
"                                          silnh_normal_disc_pct,
"
"                                          silnh_additional_disc_pct,
"
"                                          silnh_carr_rate,
"
"                                          silnh_promotion_flag,
"
"                                          silnh_supl_inv_cre_flag,
"
"                                          silnh_net_amt,
"
"                                          silnh_tax_amt,
"
"                                          silnh_so_schld_desc,
"
"                                          silnh_asset_id,
"
"                                          silnh_ncr_no,
"
"                                          silnh_prod_indicator_flag,
"
"                                          silnh_tac_rqrd_flag,
"
"                                          silnh_hsn_code,
"
"                                          silnh_cust_drw_no,
"
"                                          silnh_cust_drw_rev,
"
"                                          silnh_tolr_pct,
"
"                                          silnh_prod_tar_weight,
"
"                                          silnh_tariff_code,
"
"                                          silnh_commodity_code,
"
"                                          silnh_task_id,
"
"                                          silnh_sc_ord_no,
"
"                                          silnh_sc_ord_seq_no,
"
"                                          silnh_prod_short_desc,
"
"                                          silnh_matl_type,
"
"                                          silnh_enqry_doc_no,
"
"                                          silnh_grn_suplr_doc_no,
"
"                                          silnh_grn_suplr_doc_date,
"
"                                          silnh_grn_dc_no,
"
"                                          silnh_grn_dc_date,
"
"                                          silnh_price_po_no,
"
"                                          silnh_price_po_date,
"
"                                          silnh_cust_po_rev,
"
"                                          silnh_prod_thickness,
"
"                                          silnh_prod_width,
"
"                                          silnh_prod_length,
"
"                                          silnh_prod_mtrl_id,
"
"                                          silnh_prof_inv_pfx,
"
"                                          silnh_prof_inv_no,
"
"                                          silnh_prof_inv_sfx,
"
"                                          silnh_prof_inv_seq_no,
"
"                                          silnh_stk_inv_qty,
"
"                                          silnh_oem_suplr_id,
"
"                                          silnh_oem_status,
"
"                                          silnh_curproc_qty,
"
"                                          silnh_sel_flag,
"
"                                          silnh_prom_qty,
"
"                                          silnh_meis_doc_no,
"
"                                          silnh_meis_lic_no,
"
"                                          silnh_lic_amt,
"
"                                          silnh_spl_disc_amt,
"
"                                          silnh_cash_disc_amt,
"
"                                          silnh_gst_exempt_flag,
"
"                                          silnh_prod_chrg_amt,
"
"                                          silnh_revised_price,
"
"                                          silnh_amc_sel_flag,
"
"                                          silnh_stk_trfr_ge_doc_no,
"
"                                          silnh_prj_type,
"
"                                          silnh_prod_cls_desc,
"
"                                          silnh_prod_subcls_desc,
"
"                                          silnh_prod_grp,
"
"                                          silnh_prod_grp_desc,
"
"                                          silnh_prod_subgrp,
"
"                                          silnh_prod_subgrp_desc,
"
"                                          silnh_st_dev_doc_no,
"
"                                          silnh_st_dev_doc_seq_no,
"
"                                          silnh_serv_thrw_flag,
"
"                                          silnh_tp_suplr_id,
"
"                                          silnh_tds_us,
"
"                                          silnh_tds_tax_pct,
"
"                                          silnh_tds_assbl_val,
"
"                                          silnh_tds_amt,
"
"                                          silnh_ge_no,
"
"                                          silnh_ge_seq_no,
"
"                                          silnh_ge_sub_seq_no,
"
"                                          silnh_desp_date,
"
"                                          silnh_adv_recv_pct,
"
"                                          silnh_adv_recv_amt,
"
"                                          silnh_bal_adv_to_recv,
"
"                                          silnh_vat_exempt_flag,
"
"                                          silnh_qc_pfx,
"
"                                          silnh_qc_no,
"
"                                          silnh_qc_rev,
"
"                                          silnh_qc_doc_seq_no,
"
"                                          silnh_pack_sticker_type,
"
"                                          silnh_old_inv_date,
"
"                                          silnh_oem_drg_no,
"
"                                          silnh_oem_dwg_rev,
"
"                                          silnh_pack_type,
"
"                                          silnh_dd_appl_flag,
"
"                                          silnh_fob_value,
"
"                                          silnh_meis_lic_bal_amt,
"
"                                          silnh_pack_slip_doc_no,
"
"                                          silnh_pack_slip_seq_no,
"
"                                          silnh_comm_pack_inv_flag,
"
"                                          silnh_ins_rwk_flag,
"
"                                          silnh_ins_rwk_user,
"
"                                          silnh_rec_scrap_qty,
"
"                                          silnh_rec_dis_ass_qty,
"
"                                          silnh_rec_repair_qty,
"
"                                          silnh_rwk_inproc_qty,
"
"                                          silnh_rwk_proc_qty,
"
"                                          silnh_reworked_qty,
"
"                                          silnh_st_dev_sel_flag,
"
"                                          silnh_st_dev_sel_user,
"
"                                          silnh_inc_price,
"
"                                          silnh_inc_disc_amt,
"
"                                          silnh_gst_input_type,
"
"                                          silnh_qc_rqrd_flag,
"
"                                          silnh_cash_disc_pct,
"
"                                          silnh_cmr_rcpt_type,
"
"                                          silnh_comm_amt,
"
"                                          silnh_ord_disc_amt,
"
"                                          silnh_tot_amt_per_qty,
"
"                                          silnh_realzn_price,
"
"                                          silnh_realzn_pct,
"
"                                          silnh_org_drg_no,
"
"                                          silnh_org_drg_rev,
"
"                                          silnh_mt_disc_amt,
"
"                                          silnh_mt_spl_disc_amt,
"
"                                          silnh_pack_slip_ord_type,
"
"                                          silnh_bulk_disc_pct,
"
"                                          silnh_ins_pct,
"
"                                          silnh_frgt_pct,
"
"                                          silnh_csr_doc_no,
"
"                                          silnh_amc_frm_date,
"
"                                          silnh_amc_to_date,
"
"                                          silnh_rtn_inproc_qty,
"
"                                          silnh_rtn_proc_qty,
"
"                                          silnh_rtnd_qty,
"
"                                          silnh_rtn_suplr_id,
"
"                                          silnh_rej_rtn_doc_no,
"
"                                          silnh_rej_rtn_seq_no,
"
"                                          silnh_cre_by,
"
"                                          silnh_cre_ip_addr,
"
"                                          silnh_cre_os_user,
"
"                                          silnh_cre_date,
"
"                                          silnh_upd_by,
"
"                                          silnh_upd_ip_addr,
"
"                                          silnh_upd_os_user,
"
"                                          silnh_upd_date,
"
"                                          silnh_cre_emp_id,
"
"                                          silnh_upd_emp_id,
"
"                                          silnh_adv_lic_doc_no,
"
"                                          silnh_adv_lic_adj_qty,
"
"                                          silnh_adv_lic_adj_amt,
"
"                                          silnh_disc_amt_per_qty,
"
"                                          silnh_prod_qtn_desc,
"
"                                          silnh_cust_exp_date,
"
"                                          silnh_cust_mfg_date,
"
"                                          silnh_tcs_pct,
"
"                                          silnh_tcs_access_val,
"
"                                          silnh_tcs_amt,
"
"                                          silnh_tcs_sec_id,
"
"                                          silnh_upd_tcs_amt,
"
"                                          silnh_cust_rcpt_qty,
"
"                                          silnh_oem_id,
"
"                                          silnh_oem_name,
"
"                                          silnh_ref1,
"
"                                          silnh_proj_lvl_id,
"
"                                          silnh_proj_lvl_name,
"
"                                          silnh_w_wo_stk_flag,
"
"                                          silnh_sal_acct_id,
"
"                                          silnh_disc_acct_id,
"
"                                          silnh_sal_cc_id,
"
"                                          silnh_disc_cc_id,
"
"                                          silnh_cust_mat_dc_date,
"
"                                          silnh_cust_mat_dc_no,
"
"                                          silnh_cust_mat_rcpt_no,
"
"                                          silnh_cust_mat_rcpt_seq_no,
"
"                                          silnh_oprn_ln_seq_no,
"
"                                          silnh_no_of_bags,
"
"                                          silnh_del_sel_flag,
"
"                                          silnh_desp_pln_doc_no,
"
"                                          silnh_amc_dur,
"
"                                          silnh_amc_freq,
"
"                                          silnh_pur_acct,
"
"                                          silnh_ts_rate,
"
"                                          silnh_tax_pct,
"
"                                          silnh_igst_amt,
"
"                                          silnh_sgst_amt,
"
"                                          silnh_cgst_amt,
"
"                                          silnh_utgst_amt,
"
"                                          silnh_cess_pct,
"
"                                          silnh_cess_amt,
"
"                                          silnh_assbl_val,
"
"                                          silnh_int_so_pfx,
"
"                                          silnh_int_so_no,
"
"                                          silnh_ret_inv_proc,
"
"                                          silnh_cust_tax_charge_flag,
"
"                                          silnh_user,
"
"                                          silnh_ret_flag,
"
"                                          silnh_ret_in_progress)
"
"         SELECT siln_bu,
"
"                siln_plnt,
"
"                siln_doc_no,
"
"                siln_seq_no,
"
"                siln_loc_id,
"
"                siln_prod_id,
"
"                siln_prod_desc1,
"
"                siln_state,
"
"                siln_uom,
"
"                siln_price,
"
"                siln_disc_pct,
"
"                siln_inv_qty,
"
"                siln_conv_factor,
"
"                siln_pick_qty,
"
"                siln_class,
"
"                siln_return_qty,
"
"                siln_prod_rev,
"
"                siln_warranty_flag,
"
"                siln_so_no,
"
"                siln_so_sfx,
"
"                siln_so_seq_no,
"
"                siln_rqrd_date,
"
"                siln_promise_date,
"
"                siln_store_id,
"
"                siln_cust_po_date,
"
"                siln_cust_po_no,
"
"                siln_inv_seq_no,
"
"                siln_stk_trn_po_no,
"
"                siln_old_inv_pfx,
"
"                siln_old_inv_no,
"
"                siln_old_seq_no,
"
"                siln_stk_trn_rcpt_qty,
"
"                siln_net_price,
"
"                siln_unit_cost,
"
"                siln_offset_qty,
"
"                siln_price_uom,
"
"                siln_prod_uom,
"
"                siln_tg_rcpt_no,
"
"                siln_tg_rcpt_seq_no,
"
"                siln_list_price,
"
"                siln_prod_size,
"
"                siln_proj_id,
"
"                siln_trans_task_id,
"
"                siln_inv_task_id,
"
"                siln_emp_id,
"
"                siln_res_id,
"
"                siln_vehicle_id,
"
"                siln_cons_qty,
"
"                siln_inprog_qty,
"
"                siln_subinv_flag,
"
"                siln_cons_temp_qty,
"
"                siln_cons_date,
"
"                siln_sup_inproc_qty,
"
"                siln_sup_compl_qty,
"
"                siln_disc_amt,
"
"                siln_rcvd_store_id,
"
"                siln_3pl_sel_flag,
"
"                siln_3pl_inproc_qty,
"
"                siln_3pl_proc_qty,
"
"                siln_3pl_compl_qty,
"
"                siln_3pl_sess_id,
"
"                siln_amd_no,
"
"                siln_amd_date,
"
"                siln_conract_no,
"
"                siln_cust_doc_no,
"
"                siln_cust_doc_rev,
"
"                siln_cust_ln_seq_no,
"
"                siln_price_basis,
"
"                siln_sales_price_class,
"
"                siln_po_ref,
"
"                siln_cust_po_seq_no,
"
"                siln_prim_rtnprcs_qty,
"
"                siln_sec_rtnprcs_qty,
"
"                siln_prod_seq_no,
"
"                siln_prod_ord_no,
"
"                siln_prod_trans_no,
"
"                siln_prod_oprn_id,
"
"                siln_mt_doc_no,
"
"                siln_mt_seq_no,
"
"                siln_sub_cls,
"
"                siln_cust_prod_id,
"
"                siln_cont_no,
"
"                siln_rqrd_qty,
"
"                siln_so_sl_seq_no,
"
"                siln_po_sl_seq_no,
"
"                siln_catalog_no,
"
"                siln_depb_pct,
"
"                siln_depb_flag,
"
"                siln_ref,
"
"                siln_adv_rcvd_amt,
"
"                siln_mftr_cost,
"
"                siln_prod_ext_desc,
"
"                siln_sf_code,
"
"                siln_prod_net_weight,
"
"                siln_tolr_qty,
"
"                siln_sup_doc_no,
"
"                siln_sup_si_doc_no,
"
"                siln_fp_receipt_no,
"
"                siln_mrp_price,
"
"                siln_accepted_qty,
"
"                siln_rejected_qty,
"
"                siln_sr_dev_unit_cost,
"
"                siln_sq_price,
"
"                siln_map_price,
"
"                siln_sou_bu,
"
"                siln_sou_plnt,
"
"                siln_sou_ord_no,
"
"                siln_sou_ord_seq_no,
"
"                siln_exec_id,
"
"                siln_dept_id,
"
"                siln_lot_no,
"
"                siln_ser_no,
"
"                siln_source_id,
"
"                siln_source_type,
"
"                siln_sys_ls_no,
"
"                siln_expiry_date,
"
"                siln_inst_req_flag,
"
"                siln_dc_doc_no,
"
"                siln_dc_no,
"
"                siln_dc_seq_no,
"
"                siln_mark_no,
"
"                siln_kinds_of_bags,
"
"                siln_desc_of_goods,
"
"                siln_custom_price,
"
"                siln_adv_lic_no,
"
"                siln_adv_lic_date,
"
"                siln_cust_prod_desc,
"
"                siln_no_of_packs,
"
"                siln_prod_cat_id,
"
"                siln_prod_grade_id,
"
"                siln_prod_pack_size,
"
"                siln_comm_proc_qty,
"
"                siln_comm_in_proc_qty,
"
"                siln_comm_inv_user,
"
"                siln_comm_inv_sel_flag,
"
"                siln_rg_cat_id,
"
"                siln_rg_grade_id,
"
"                siln_rg_size,
"
"                siln_rg_pack_size,
"
"                siln_price_conv_factor,
"
"                siln_gross_amt,
"
"                siln_last_amd_no,
"
"                siln_dc_short_flag,
"
"                siln_abatement_pct,
"
"                siln_ret_dur,
"
"                siln_ret_freq,
"
"                siln_ret_by_date,
"
"                siln_gen_ls_flag,
"
"                siln_prod_gross_weight,
"
"                siln_pack_mat_wgt,
"
"                siln_pack_prod_id,
"
"                siln_pack_prod_rev,
"
"                siln_normal_disc_pct,
"
"                siln_additional_disc_pct,
"
"                siln_carr_rate,
"
"                siln_promotion_flag,
"
"                siln_supl_inv_cre_flag,
"
"                siln_net_amt,
"
"                siln_tax_amt,
"
"                siln_so_schld_desc,
"
"                siln_asset_id,
"
"                siln_ncr_no,
"
"                siln_prod_indicator_flag,
"
"                siln_tac_rqrd_flag,
"
"                siln_hsn_code,
"
"                siln_cust_drw_no,
"
"                siln_cust_drw_rev,
"
"                siln_tolr_pct,
"
"                siln_prod_tar_weight,
"
"                siln_tariff_code,
"
"                siln_commodity_code,
"
"                siln_task_id,
"
"                siln_sc_ord_no,
"
"                siln_sc_ord_seq_no,
"
"                siln_prod_short_desc,
"
"                siln_matl_type,
"
"                siln_enqry_doc_no,
"
"                siln_grn_suplr_doc_no,
"
"                siln_grn_suplr_doc_date,
"
"                siln_grn_dc_no,
"
"                siln_grn_dc_date,
"
"                siln_price_po_no,
"
"                siln_price_po_date,
"
"                siln_cust_po_rev,
"
"                siln_prod_thickness,
"
"                siln_prod_width,
"
"                siln_prod_length,
"
"                siln_prod_mtrl_id,
"
"                siln_prof_inv_pfx,
"
"                siln_prof_inv_no,
"
"                siln_prof_inv_sfx,
"
"                siln_prof_inv_seq_no,
"
"                siln_stk_inv_qty,
"
"                siln_oem_suplr_id,
"
"                siln_oem_status,
"
"                siln_curproc_qty,
"
"                siln_sel_flag,
"
"                siln_prom_qty,
"
"                siln_meis_doc_no,
"
"                siln_meis_lic_no,
"
"                siln_lic_amt,
"
"                siln_spl_disc_amt,
"
"                siln_cash_disc_amt,
"
"                siln_gst_exempt_flag,
"
"                siln_prod_chrg_amt,
"
"                siln_revised_price,
"
"                siln_amc_sel_flag,
"
"                siln_stk_trfr_ge_doc_no,
"
"                siln_prj_type,
"
"                siln_prod_cls_desc,
"
"                siln_prod_subcls_desc,
"
"                siln_prod_grp,
"
"                siln_prod_grp_desc,
"
"                siln_prod_subgrp,
"
"                siln_prod_subgrp_desc,
"
"                siln_st_dev_doc_no,
"
"                siln_st_dev_doc_seq_no,
"
"                siln_serv_thrw_flag,
"
"                siln_tp_suplr_id,
"
"                siln_tds_us,
"
"                siln_tds_tax_pct,
"
"                siln_tds_assbl_val,
"
"                siln_tds_amt,
"
"                siln_ge_no,
"
"                siln_ge_seq_no,
"
"                siln_ge_sub_seq_no,
"
"                siln_desp_date,
"
"                siln_adv_recv_pct,
"
"                siln_adv_recv_amt,
"
"                siln_bal_adv_to_recv,
"
"                siln_vat_exempt_flag,
"
"                siln_qc_pfx,
"
"                siln_qc_no,
"
"                siln_qc_rev,
"
"                siln_qc_doc_seq_no,
"
"                siln_pack_sticker_type,
"
"                siln_old_inv_date,
"
"                siln_oem_drg_no,
"
"                siln_oem_dwg_rev,
"
"                siln_pack_type,
"
"                siln_dd_appl_flag,
"
"                siln_fob_value,
"
"                siln_meis_lic_bal_amt,
"
"                siln_pack_slip_doc_no,
"
"                siln_pack_slip_seq_no,
"
"                siln_comm_pack_inv_flag,
"
"                siln_ins_rwk_flag,
"
"                siln_ins_rwk_user,
"
"                siln_rec_scrap_qty,
"
"                siln_rec_dis_ass_qty,
"
"                siln_rec_repair_qty,
"
"                siln_rwk_inproc_qty,
"
"                siln_rwk_proc_qty,
"
"                siln_reworked_qty,
"
"                siln_st_dev_sel_flag,
"
"                siln_st_dev_sel_user,
"
"                siln_inc_price,
"
"                siln_inc_disc_amt,
"
"                siln_gst_input_type,
"
"                siln_qc_rqrd_flag,
"
"                siln_cash_disc_pct,
"
"                siln_cmr_rcpt_type,
"
"                siln_comm_amt,
"
"                siln_ord_disc_amt,
"
"                siln_tot_amt_per_qty,
"
"                siln_realzn_price,
"
"                siln_realzn_pct,
"
"                siln_org_drg_no,
"
"                siln_org_drg_rev,
"
"                siln_mt_disc_amt,
"
"                siln_mt_spl_disc_amt,
"
"                siln_pack_slip_ord_type,
"
"                siln_bulk_disc_pct,
"
"                siln_ins_pct,
"
"                siln_frgt_pct,
"
"                siln_csr_doc_no,
"
"                siln_amc_frm_date,
"
"                siln_amc_to_date,
"
"                siln_rtn_inproc_qty,
"
"                siln_rtn_proc_qty,
"
"                siln_rtnd_qty,
"
"                siln_rtn_suplr_id,
"
"                siln_rej_rtn_doc_no,
"
"                siln_rej_rtn_seq_no,
"
"                siln_cre_by,
"
"                siln_cre_ip_addr,
"
"                siln_cre_os_user,
"
"                siln_cre_date,
"
"                siln_upd_by,
"
"                siln_upd_ip_addr,
"
"                siln_upd_os_user,
"
"                siln_upd_date,
"
"                siln_cre_emp_id,
"
"                siln_upd_emp_id,
"
"                siln_adv_lic_doc_no,
"
"                siln_adv_lic_adj_qty,
"
"                siln_adv_lic_adj_amt,
"
"                siln_disc_amt_per_qty,
"
"                siln_prod_qtn_desc,
"
"                siln_cust_exp_date,
"
"                siln_cust_mfg_date,
"
"                siln_tcs_pct,
"
"                siln_tcs_access_val,
"
"                siln_tcs_amt,
"
"                siln_tcs_sec_id,
"
"                siln_upd_tcs_amt,
"
"                siln_cust_rcpt_qty,
"
"                siln_oem_id,
"
"                siln_oem_name,
"
"                siln_ref1,
"
"                siln_proj_lvl_id,
"
"                siln_proj_lvl_name,
"
"                siln_w_wo_stk_flag,
"
"                siln_sal_acct_id,
"
"                siln_disc_acct_id,
"
"                siln_sal_cc_id,
"
"                siln_disc_cc_id,
"
"                siln_cust_mat_dc_date,
"
"                siln_cust_mat_dc_no,
"
"                siln_cust_mat_rcpt_no,
"
"                siln_cust_mat_rcpt_seq_no,
"
"                siln_oprn_ln_seq_no,
"
"                siln_no_of_bags,
"
"                siln_del_sel_flag,
"
"                siln_desp_pln_doc_no,
"
"                siln_amc_dur,
"
"                siln_amc_freq,
"
"                siln_pur_acct,
"
"                siln_ts_rate,
"
"                siln_tax_pct,
"
"                siln_igst_amt,
"
"                siln_sgst_amt,
"
"                siln_cgst_amt,
"
"                siln_utgst_amt,
"
"                siln_cess_pct,
"
"                siln_cess_amt,
"
"                siln_assbl_val,
"
"                siln_int_so_pfx,
"
"                siln_int_so_no,
"
"                siln_ret_inv_proc,
"
"                siln_cust_tax_charge_flag,
"
"                siln_user,
"
"                siln_ret_flag,
"
"                siln_ret_in_progress
"
"           FROM sales_invoices_ln
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_plnt
"
"                AND siln_doc_no = p_doc_no;
"
"
"
"      INSERT INTO si_oth_tax_charges_hist (siotch_bu,
"
"                                           siotch_plnt,
"
"                                           siotch_doc_no,
"
"                                           siotch_seq_no,
"
"                                           siotch_prod_id,
"
"                                           siotch_prod_rev,
"
"                                           siotch_hsn_code,
"
"                                           siotch_qty,
"
"                                           siotch_chrg_basis,
"
"                                           siotch_chrg_pct,
"
"                                           siotch_chrg_amt,
"
"                                           siotch_cre_by,
"
"                                           siotch_cre_date,
"
"                                           siotch_upd_by,
"
"                                           siotch_upd_date,
"
"                                           siotch_gst_exempt_flag)
"
"         SELECT siotc_bu,
"
"                siotc_plnt,
"
"                siotc_doc_no,
"
"                siotc_seq_no,
"
"                siotc_prod_id,
"
"                siotc_prod_rev,
"
"                siotc_hsn_code,
"
"                siotc_qty,
"
"                siotc_chrg_basis,
"
"                siotc_chrg_pct,
"
"                siotc_chrg_amt,
"
"                siotc_cre_by,
"
"                siotc_cre_date,
"
"                siotc_upd_by,
"
"                siotc_upd_date,
"
"                siotc_gst_exempt_flag
"
"           FROM si_oth_tax_charges
"
"          WHERE     siotc_bu = p_bu
"
"                AND siotc_plnt = p_plnt
"
"                AND siotc_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_adv_hist (siah_bu,
"
"                                      siah_plnt,
"
"                                      siah_doc_no,
"
"                                      siah_seq_no,
"
"                                      siah_adv_doc_pfx,
"
"                                      siah_adv_doc_no,
"
"                                      siah_ref,
"
"                                      siah_adv_pct,
"
"                                      siah_adv_amt,
"
"                                      siah_cre_by,
"
"                                      siah_cre_date,
"
"                                      siah_upd_by,
"
"                                      siah_upd_date,
"
"                                      siah_rv_no,
"
"                                      siah_rv_date,
"
"                                      siah_chk_rtgs_no,
"
"                                      siah_adv_rcpt_amt,
"
"                                      siah_pr_doc_pfx,
"
"                                      siah_pr_doc_no,
"
"                                      siah_so_pfx,
"
"                                      siah_so_no,
"
"                                      siah_rv_pfx,
"
"                                      siah_rcpt_type,
"
"                                      siah_proc_amt,
"
"                                      siah_vou_plnt)
"
"         SELECT sia_bu,
"
"                sia_plnt,
"
"                sia_doc_no,
"
"                sia_seq_no,
"
"                sia_adv_doc_pfx,
"
"                sia_adv_doc_no,
"
"                sia_ref,
"
"                sia_adv_pct,
"
"                sia_adv_amt,
"
"                sia_cre_by,
"
"                sia_cre_date,
"
"                sia_upd_by,
"
"                sia_upd_date,
"
"                sia_rv_no,
"
"                sia_rv_date,
"
"                sia_chk_rtgs_no,
"
"                sia_adv_rcpt_amt,
"
"                sia_pr_doc_pfx,
"
"                sia_pr_doc_no,
"
"                sia_so_pfx,
"
"                sia_so_no,
"
"                sia_rv_pfx,
"
"                sia_rcpt_type,
"
"                sia_proc_amt,
"
"                sia_vou_plnt
"
"           FROM sales_inv_adv
"
"          WHERE sia_bu = p_bu AND sia_plnt = p_plnt AND sia_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_invoices_pay_due_hist (sipdh_bu,
"
"                                               sipdh_doc_no,
"
"                                               sipdh_seq_no,
"
"                                               sipdh_due_days,
"
"                                               sipdh_due_date,
"
"                                               sipdh_due_pct,
"
"                                               sipdh_due_amt,
"
"                                               sipdh_disc_pct,
"
"                                               sipdh_int_pct,
"
"                                               sipdh_due_type,
"
"                                               sipdh_plnt,
"
"                                               sipdh_cre_by,
"
"                                               sipdh_cre_date,
"
"                                               sipdh_upd_by,
"
"                                               sipdh_upd_date,
"
"                                               sipdh_ms_id,
"
"                                               sipdh_activity_date)
"
"         SELECT sipd_bu,
"
"                sipd_doc_no,
"
"                sipd_seq_no,
"
"                sipd_due_days,
"
"                sipd_due_date,
"
"                sipd_due_pct,
"
"                sipd_due_amt,
"
"                sipd_disc_pct,
"
"                sipd_int_pct,
"
"                sipd_due_type,
"
"                sipd_plnt,
"
"                sipd_cre_by,
"
"                sipd_cre_date,
"
"                sipd_upd_by,
"
"                sipd_upd_date,
"
"                sipd_ms_id,
"
"                sipd_activity_date
"
"           FROM sales_invoices_pay_due
"
"          WHERE     sipd_bu = p_bu
"
"                AND sipd_plnt = p_plnt
"
"                AND sipd_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_bill_of_lading_hist (sibolh_bu,
"
"                                                 sibolh_doc_no,
"
"                                                 sibolh_vehicle_type,
"
"                                                 sibolh_vehicle_no,
"
"                                                 sibolh_driver_id,
"
"                                                 sibolh_driver_name,
"
"                                                 sibolh_drive_licence_no,
"
"                                                 sibolh_departure_date,
"
"                                                 sibolh_expect_arrival_date,
"
"                                                 sibolh_gatepass_no,
"
"                                                 sibolh_gatepass_issued_by,
"
"                                                 sibolh_ship_doc_pfx,
"
"                                                 sibolh_ship_doc_no,
"
"                                                 sibolh_lr_no,
"
"                                                 sibolh_trans_name,
"
"                                                 sibolh_rpermit_no,
"
"                                                 sibolh_gatepass_date,
"
"                                                 sibolh_ship_bill_no,
"
"                                                 sibolh_ship_bill_date,
"
"                                                 sibolh_lr_date,
"
"                                                 sibolh_custom_desc,
"
"                                                 sibolh_seal_no,
"
"                                                 sibolh_vehicle_name,
"
"                                                 sibolh_vehicle_rate,
"
"                                                 sibolh_actual_remove_date,
"
"                                                 sibolh_plnt,
"
"                                                 sibolh_seq_no,
"
"                                                 sibolh_inv_pfx,
"
"                                                 sibolh_inv_no,
"
"                                                 sibolh_veh_owner_type,
"
"                                                 sibolh_trans_id,
"
"                                                 sibolh_chr_suplr,
"
"                                                 sibolh_pay,
"
"                                                 sibolh_cre_by,
"
"                                                 sibolh_cre_date,
"
"                                                 sibolh_upd_by,
"
"                                                 sibolh_upd_date,
"
"                                                 sibolh_veh_reg_no,
"
"                                                 sibolh_veh_inv_no,
"
"                                                 sibolh_frt_amount,
"
"                                                 sibolh_ship_clr_date,
"
"                                                 sibolh_ship_clr_no,
"
"                                                 sibolh_veh_reading,
"
"                                                 sibolh_ewb_dist_km,
"
"                                                 sibolh_ewb_bill_no,
"
"                                                 sibolh_courier_name,
"
"                                                 sibolh_person_name,
"
"                                                 sibolh_trip_pln_no,
"
"                                                 sibolh_mob_no,
"
"                                                 sibolh_veh_id,
"
"                                                 sibolh_trans_type,
"
"                                                 sibolh_cess_non_advol_amt,
"
"                                                 sibolh_other,
"
"                                                 sibolh_eway_bill_date)
"
"         SELECT sibol_bu,
"
"                sibol_doc_no,
"
"                sibol_vehicle_type,
"
"                sibol_vehicle_no,
"
"                sibol_driver_id,
"
"                sibol_driver_name,
"
"                sibol_drive_licence_no,
"
"                sibol_departure_date,
"
"                sibol_expect_arrival_date,
"
"                sibol_gatepass_no,
"
"                sibol_gatepass_issued_by,
"
"                sibol_ship_doc_pfx,
"
"                sibol_ship_doc_no,
"
"                sibol_lr_no,
"
"                sibol_trans_name,
"
"                sibol_rpermit_no,
"
"                sibol_gatepass_date,
"
"                sibol_ship_bill_no,
"
"                sibol_ship_bill_date,
"
"                sibol_lr_date,
"
"                sibol_custom_desc,
"
"                sibol_seal_no,
"
"                sibol_vehicle_name,
"
"                sibol_vehicle_rate,
"
"                sibol_actual_remove_date,
"
"                sibol_plnt,
"
"                NVL(sibol_seq_no,1),
"
"                sibol_inv_pfx,
"
"                sibol_inv_no,
"
"                sibol_veh_owner_type,
"
"                sibol_trans_id,
"
"                sibol_chr_suplr,
"
"                sibol_pay,
"
"                sibol_cre_by,
"
"                sibol_cre_date,
"
"                sibol_upd_by,
"
"                sibol_upd_date,
"
"                sibol_veh_reg_no,
"
"                sibol_veh_inv_no,
"
"                sibol_frt_amount,
"
"                sibol_ship_clr_date,
"
"                sibol_ship_clr_no,
"
"                sibol_veh_reading,
"
"                sibol_ewb_dist_km,
"
"                sibol_ewb_bill_no,
"
"                sibol_courier_name,
"
"                sibol_person_name,
"
"                sibol_trip_pln_no,
"
"                sibol_mob_no,
"
"                sibol_veh_id,
"
"                sibol_trans_type,
"
"                sibol_cess_non_advol_amt,
"
"                sibol_other,
"
"                sibol_eway_bill_date
"
"           FROM sales_inv_bill_of_lading
"
"          WHERE     sibol_bu = p_bu
"
"                AND sibol_plnt = p_plnt
"
"                AND sibol_doc_no = p_doc_no;
"
"
"
"      INSERT INTO si_cust_dc_mat_cons_hist (sicdmch_bu,
"
"                                            sicdmch_plnt,
"
"                                            sicdmch_doc_no,
"
"                                            sicdmch_seq_no,
"
"                                            sicdmch_sub_seq_no,
"
"                                            sicdmch_cr_doc_no,
"
"                                            sicdmch_cr_doc_seq_no,
"
"                                            sicdmch_dc_no,
"
"                                            sicdmch_dc_date,
"
"                                            sicdmch_prod_id,
"
"                                            sicdmch_prod_rev,
"
"                                            sicdmch_cons_qty,
"
"                                            sicdmch_cre_by,
"
"                                            sicdmch_cre_date,
"
"                                            sicdmch_upd_by,
"
"                                            sicdmch_upd_date,
"
"                                            sicdmch_dc_doc_no,
"
"                                            sicdmch_dc_seq_no,
"
"                                            sicdmch_pt_trans_no,
"
"                                            sicdmch_pt_seq_no,
"
"                                            sicdmch_pt_sub_seq_no,
"
"                                            sicdmch_pick_plnt)
"
"         SELECT sicdmc_bu,
"
"                sicdmc_plnt,
"
"                sicdmc_doc_no,
"
"                sicdmc_seq_no,
"
"                sicdmc_sub_seq_no,
"
"                sicdmc_cr_doc_no,
"
"                sicdmc_cr_doc_seq_no,
"
"                sicdmc_dc_no,
"
"                sicdmc_dc_date,
"
"                sicdmc_prod_id,
"
"                sicdmc_prod_rev,
"
"                sicdmc_cons_qty,
"
"                sicdmc_cre_by,
"
"                sicdmc_cre_date,
"
"                sicdmc_upd_by,
"
"                sicdmc_upd_date,
"
"                sicdmc_dc_doc_no,
"
"                sicdmc_dc_seq_no,
"
"                sicdmc_pt_trans_no,
"
"                sicdmc_pt_seq_no,
"
"                sicdmc_pt_sub_seq_no,
"
"                sicdmc_pick_plnt
"
"           FROM sales_inv_cust_dc_mat_cons
"
"          WHERE     sicdmc_bu = p_bu
"
"                AND sicdmc_plnt = p_plnt
"
"                AND sicdmc_doc_no = p_doc_no;
"
"
"
"
"
"      INSERT INTO sales_inv_ship_addr_hist (sisah_bu,
"
"                                            sisah_doc_no,
"
"                                            sisah_shipto_name,
"
"                                            sisah_shipto_addr1,
"
"                                            sisah_shipto_addr2,
"
"                                            sisah_shipto_addr3,
"
"                                            sisah_shipto_postal_code,
"
"                                            sisah_shipto_city,
"
"                                            sisah_shipto_state,
"
"                                            sisah_shipto_cntry,
"
"                                            sisah_shipto_po_box,
"
"                                            sisah_shipto_tele1,
"
"                                            sisah_shipto_tele2,
"
"                                            sisah_shipto_fax1,
"
"                                            sisah_shipto_fax2,
"
"                                            sisah_shipto_email1,
"
"                                            sisah_shipto_email2,
"
"                                            sisah_shipto_website1,
"
"                                            sisah_shipto_website2,
"
"                                            sisah_billto_name,
"
"                                            sisah_billto_addr1,
"
"                                            sisah_billto_addr2,
"
"                                            sisah_billto_addr3,
"
"                                            sisah_billto_postal_code,
"
"                                            sisah_billto_city,
"
"                                            sisah_billto_state,
"
"                                            sisah_billto_cntry,
"
"                                            sisah_billto_po_box,
"
"                                            sisah_billto_tele1,
"
"                                            sisah_billto_tele2,
"
"                                            sisah_billto_fax1,
"
"                                            sisah_billto_fax2,
"
"                                            sisah_billto_email1,
"
"                                            sisah_billto_email2,
"
"                                            sisah_billto_website1,
"
"                                            sisah_billto_website2,
"
"                                            sisah_ref1,
"
"                                            sisah_ref2,
"
"                                            sisah_billto_ref1,
"
"                                            sisah_billto_ref2,
"
"                                            sisah_plnt,
"
"                                            sisah_cre_by,
"
"                                            sisah_cre_date,
"
"                                            sisah_upd_by,
"
"                                            sisah_upd_date,
"
"                                            sisah_shipto_mobile,
"
"                                            sisah_billto_mobile,
"
"                                            sisah_shipto_addr4,
"
"                                            sisah_shipto_addr5,
"
"                                            sisah_billto_addr4,
"
"                                            sisah_billto_addr5,
"
"                                            sisah_buyer_id,
"
"                                            sisah_buyer_addr1,
"
"                                            sisah_buyer_addr2,
"
"                                            sisah_buyer_addr3,
"
"                                            sisah_buyer_addr4,
"
"                                            sisah_buyer_addr5,
"
"                                            sisah_buyer_city,
"
"                                            sisah_buyer_state,
"
"                                            sisah_buyer_cntry,
"
"                                            sisah_buyer_tele1,
"
"                                            sisah_buyer_email1,
"
"                                            sisah_buyer_fax1,
"
"                                            sisah_buyer_mobile,
"
"                                            sisah_buyer_po_box,
"
"                                            sisah_buyer_postal_code,
"
"                                            sisah_shipto_dist,
"
"                                            sisah_shipfrm_addr1,
"
"                                            sisah_shipfrm_addr2,
"
"                                            sisah_shipfrm_addr3,
"
"                                            sisah_shipfrm_city,
"
"                                            sisah_shipfrm_state,
"
"                                            sisah_shipfrm_cntry,
"
"                                            sisah_shipfrm_postal_code,
"
"                                            sisah_shipfrm_po_box,
"
"                                            sisah_shipfrm_tele1,
"
"                                            sisah_shipfrm_mobile,
"
"                                            sisah_shipfrm_fax1,
"
"                                            sisah_shipfrm_email1,
"
"                                            sisah_shipfrm_website1,
"
"                                            sisah_shipfrm_gst_no,
"
"                                            sisah_billfrm_addr1,
"
"                                            sisah_billfrm_addr2,
"
"                                            sisah_billfrm_addr3,
"
"                                            sisah_billfrm_city,
"
"                                            sisah_billfrm_state,
"
"                                            sisah_billfrm_cntry,
"
"                                            sisah_billfrm_postal_code,
"
"                                            sisah_billfrm_po_box,
"
"                                            sisah_billfrm_tele1,
"
"                                            sisah_billfrm_mobile,
"
"                                            sisah_billfrm_fax1,
"
"                                            sisah_billfrm_email1,
"
"                                            sisah_billfrm_website1,
"
"                                            sisah_billfrm_gst_no)
"
"         SELECT sisa_bu,
"
"                sisa_doc_no,
"
"                sisa_shipto_name,
"
"                sisa_shipto_addr1,
"
"                sisa_shipto_addr2,
"
"                sisa_shipto_addr3,
"
"                sisa_shipto_postal_code,
"
"                sisa_shipto_city,
"
"                sisa_shipto_state,
"
"                sisa_shipto_cntry,
"
"                sisa_shipto_po_box,
"
"                sisa_shipto_tele1,
"
"                sisa_shipto_tele2,
"
"                sisa_shipto_fax1,
"
"                sisa_shipto_fax2,
"
"                sisa_shipto_email1,
"
"                sisa_shipto_email2,
"
"                sisa_shipto_website1,
"
"                sisa_shipto_website2,
"
"                sisa_billto_name,
"
"                sisa_billto_addr1,
"
"                sisa_billto_addr2,
"
"                sisa_billto_addr3,
"
"                sisa_billto_postal_code,
"
"                sisa_billto_city,
"
"                sisa_billto_state,
"
"                sisa_billto_cntry,
"
"                sisa_billto_po_box,
"
"                sisa_billto_tele1,
"
"                sisa_billto_tele2,
"
"                sisa_billto_fax1,
"
"                sisa_billto_fax2,
"
"                sisa_billto_email1,
"
"                sisa_billto_email2,
"
"                sisa_billto_website1,
"
"                sisa_billto_website2,
"
"                sisa_ref1,
"
"                sisa_ref2,
"
"                sisa_billto_ref1,
"
"                sisa_billto_ref2,
"
"                sisa_plnt,
"
"                sisa_cre_by,
"
"                sisa_cre_date,
"
"                sisa_upd_by,
"
"                sisa_upd_date,
"
"                sisa_shipto_mobile,
"
"                sisa_billto_mobile,
"
"                sisa_shipto_addr4,
"
"                sisa_shipto_addr5,
"
"                sisa_billto_addr4,
"
"                sisa_billto_addr5,
"
"                sisa_buyer_id,
"
"                sisa_buyer_addr1,
"
"                sisa_buyer_addr2,
"
"                sisa_buyer_addr3,
"
"                sisa_buyer_addr4,
"
"                sisa_buyer_addr5,
"
"                sisa_buyer_city,
"
"                sisa_buyer_state,
"
"                sisa_buyer_cntry,
"
"                sisa_buyer_tele1,
"
"                sisa_buyer_email1,
"
"                sisa_buyer_fax1,
"
"                sisa_buyer_mobile,
"
"                sisa_buyer_po_box,
"
"                sisa_buyer_postal_code,
"
"                sisa_shipto_dist,
"
"                sisa_shipfrm_addr1,
"
"                sisa_shipfrm_addr2,
"
"                sisa_shipfrm_addr3,
"
"                sisa_shipfrm_city,
"
"                sisa_shipfrm_state,
"
"                sisa_shipfrm_cntry,
"
"                sisa_shipfrm_postal_code,
"
"                sisa_shipfrm_po_box,
"
"                sisa_shipfrm_tele1,
"
"                sisa_shipfrm_mobile,
"
"                sisa_shipfrm_fax1,
"
"                sisa_shipfrm_email1,
"
"                sisa_shipfrm_website1,
"
"                sisa_shipfrm_gst_no,
"
"                sisa_billfrm_addr1,
"
"                sisa_billfrm_addr2,
"
"                sisa_billfrm_addr3,
"
"                sisa_billfrm_city,
"
"                sisa_billfrm_state,
"
"                sisa_billfrm_cntry,
"
"                sisa_billfrm_postal_code,
"
"                sisa_billfrm_po_box,
"
"                sisa_billfrm_tele1,
"
"                sisa_billfrm_mobile,
"
"                sisa_billfrm_fax1,
"
"                sisa_billfrm_email1,
"
"                sisa_billfrm_website1,
"
"                sisa_billfrm_gst_no
"
"           FROM sales_inv_ship_addr
"
"          WHERE     sisa_bu = p_bu
"
"                AND sisa_plnt = p_plnt
"
"                AND sisa_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_pack_list_hd_hist (siplhh_bu,
"
"                                               siplhh_doc_no,
"
"                                               siplhh_seq_no,
"
"                                               siplhh_pck_ctn_prod_id,
"
"                                               siplhh_pck_ctn_prod_rev,
"
"                                               siplhh_cs_ctn,
"
"                                               siplhh_no_of_ctn,
"
"                                               siplhh_cont_meas_uom,
"
"                                               siplhh_cont_length,
"
"                                               siplhh_cont_width,
"
"                                               siplhh_cont_height,
"
"                                               siplhh_cont_weight,
"
"                                               siplhh_cont_weight_uom,
"
"                                               siplhh_item_weight,
"
"                                               siplhh_item_weight_uom,
"
"                                               siplhh_prod_desc1,
"
"                                               siplhh_prod_desc2,
"
"                                               siplhh_unit_weight,
"
"                                               siplhh_ext_cont_weight,
"
"                                               siplhh_ext_weight,
"
"                                               siplhh_sel_flag,
"
"                                               siplhh_plnt,
"
"                                               siplhh_cre_by,
"
"                                               siplhh_cre_date,
"
"                                               siplhh_upd_by,
"
"                                               siplhh_upd_date,
"
"                                               siplhh_gross_weight1,
"
"                                               siplhh_gross_weight2,
"
"                                               siplhh_gross_weight3,
"
"                                               siplhh_gross_weight4,
"
"                                               siplhh_gross_weight5,
"
"                                               siplhh_net_weight1,
"
"                                               siplhh_net_weight2,
"
"                                               siplhh_net_weight3,
"
"                                               siplhh_net_weight4,
"
"                                               siplhh_net_weight5,
"
"                                               siplhh_length1,
"
"                                               siplhh_width1,
"
"                                               siplhh_height1,
"
"                                               siplhh_length2,
"
"                                               siplhh_width2,
"
"                                               siplhh_height2,
"
"                                               siplhh_length3,
"
"                                               siplhh_width3,
"
"                                               siplhh_height3,
"
"                                               siplhh_length4,
"
"                                               siplhh_width4,
"
"                                               siplhh_height4,
"
"                                               siplhh_length5,
"
"                                               siplhh_width5,
"
"                                               siplhh_height5,
"
"                                               siplhh_case_mark,
"
"                                               siplhh_pack_type)
"
"         SELECT siplh_bu,
"
"                siplh_doc_no,
"
"                siplh_seq_no,
"
"                siplh_pck_ctn_prod_id,
"
"                siplh_pck_ctn_prod_rev,
"
"                siplh_cs_ctn,
"
"                siplh_no_of_ctn,
"
"                siplh_cont_meas_uom,
"
"                siplh_cont_length,
"
"                siplh_cont_width,
"
"                siplh_cont_height,
"
"                siplh_cont_weight,
"
"                siplh_cont_weight_uom,
"
"                siplh_item_weight,
"
"                siplh_item_weight_uom,
"
"                siplh_prod_desc1,
"
"                siplh_prod_desc2,
"
"                siplh_unit_weight,
"
"                siplh_ext_cont_weight,
"
"                siplh_ext_weight,
"
"                siplh_sel_flag,
"
"                siplh_plnt,
"
"                siplh_cre_by,
"
"                siplh_cre_date,
"
"                siplh_upd_by,
"
"                siplh_upd_date,
"
"                siplh_gross_weight1,
"
"                siplh_gross_weight2,
"
"                siplh_gross_weight3,
"
"                siplh_gross_weight4,
"
"                siplh_gross_weight5,
"
"                siplh_net_weight1,
"
"                siplh_net_weight2,
"
"                siplh_net_weight3,
"
"                siplh_net_weight4,
"
"                siplh_net_weight5,
"
"                siplh_length1,
"
"                siplh_width1,
"
"                siplh_height1,
"
"                siplh_length2,
"
"                siplh_width2,
"
"                siplh_height2,
"
"                siplh_length3,
"
"                siplh_width3,
"
"                siplh_height3,
"
"                siplh_length4,
"
"                siplh_width4,
"
"                siplh_height4,
"
"                siplh_length5,
"
"                siplh_width5,
"
"                siplh_height5,
"
"                siplh_case_mark,
"
"                siplh_pack_type
"
"           FROM sales_inv_pack_list_hd
"
"          WHERE     siplh_bu = p_bu
"
"                AND siplh_plnt = p_plnt
"
"                AND siplh_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_pack_list_dtls_hist (sipldh_bu,
"
"                                                 sipldh_doc_no,
"
"                                                 sipldh_seq_no,
"
"                                                 sipldh_tpn_no,
"
"                                                 sipldh_prod_id,
"
"                                                 sipldh_prod_rev,
"
"                                                 sipldh_lot_no,
"
"                                                 sipldh_serial_no,
"
"                                                 sipldh_qty,
"
"                                                 sipldh_tpn_pfx,
"
"                                                 sipldh_tag_no,
"
"                                                 sipldh_sub_seq_no,
"
"                                                 sipldh_prod_desc1,
"
"                                                 sipldh_prod_desc2,
"
"                                                 sipldh_plnt,
"
"                                                 sipldh_cre_by,
"
"                                                 sipldh_cre_date,
"
"                                                 sipldh_upd_by,
"
"                                                 sipldh_upd_date,
"
"                                                 sipldh_unit_weight,
"
"                                                 sipldh_std_flag)
"
"         SELECT sipld_bu,
"
"                sipld_doc_no,
"
"                sipld_seq_no,
"
"                sipld_tpn_no,
"
"                sipld_prod_id,
"
"                sipld_prod_rev,
"
"                sipld_lot_no,
"
"                sipld_serial_no,
"
"                sipld_qty,
"
"                sipld_tpn_pfx,
"
"                sipld_tag_no,
"
"                sipld_sub_seq_no,
"
"                sipld_prod_desc1,
"
"                sipld_prod_desc2,
"
"                sipld_plnt,
"
"                sipld_cre_by,
"
"                sipld_cre_date,
"
"                sipld_upd_by,
"
"                sipld_upd_date,
"
"                sipld_unit_weight,
"
"                sipld_std_flag
"
"           FROM sales_inv_pack_list_dtls
"
"          WHERE     sipld_bu = p_bu
"
"                AND sipld_plnt = p_plnt
"
"                AND sipld_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_pack_list_item_hist (siplih_bu,
"
"                                                 siplih_doc_no,
"
"                                                 siplih_seq_no,
"
"                                                 siplih_prod_id,
"
"                                                 siplih_prod_rev,
"
"                                                 siplih_no_of_ctn,
"
"                                                 siplih_weight,
"
"                                                 siplih_weight_uom,
"
"                                                 siplih_prod_desc1,
"
"                                                 siplih_plnt,
"
"                                                 siplih_sub_seq_no,
"
"                                                 siplih_cre_by,
"
"                                                 siplih_cre_date,
"
"                                                 siplih_upd_by,
"
"                                                 siplih_upd_date,
"
"                                                 siplih_std_flag,
"
"                                                 siplih_remarks,
"
"                                                 siplih_ln_seq_no,
"
"                                                 siplih_no_of_pallet,
"
"                                                 siplih_no_of_tot_ctn,
"
"                                                 siplih_tot_weight)
"
"         SELECT sipli_bu,
"
"                sipli_doc_no,
"
"                sipli_seq_no,
"
"                sipli_prod_id,
"
"                sipli_prod_rev,
"
"                sipli_no_of_ctn,
"
"                sipli_weight,
"
"                sipli_weight_uom,
"
"                sipli_prod_desc1,
"
"                sipli_plnt,
"
"                sipli_sub_seq_no,
"
"                sipli_cre_by,
"
"                sipli_cre_date,
"
"                sipli_upd_by,
"
"                sipli_upd_date,
"
"                sipli_std_flag,
"
"                sipli_remarks,
"
"                sipli_ln_seq_no,
"
"                sipli_no_of_pallet,
"
"                sipli_no_of_tot_ctn,
"
"                sipli_tot_weight
"
"           FROM sales_inv_pack_list_item
"
"          WHERE     sipli_bu = p_bu
"
"                AND sipli_plnt = p_plnt
"
"                AND sipli_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_serial_lot_no_hist (sislnh_bu,
"
"                                                sislnh_inv_type,
"
"                                                sislnh_inv_pfx,
"
"                                                sislnh_inv_no,
"
"                                                sislnh_seq_no,
"
"                                                sislnh_type,
"
"                                                sislnh_lot_no,
"
"                                                sislnh_serial_no,
"
"                                                sislnh_suplr_id,
"
"                                                sislnh_rtn_flag,
"
"                                                sislnh_source_id,
"
"                                                sislnh_source_type,
"
"                                                sislnh_inv_qty,
"
"                                                sislnh_rtn_qty,
"
"                                                sislnh_proc_qty,
"
"                                                sislnh_inproc_qty,
"
"                                                sislnh_doc_no,
"
"                                                sislnh_lot_qty,
"
"                                                sislnh_sub_seq_no,
"
"                                                sislnh_offset_qty,
"
"                                                sislnh_rejected_qty,
"
"                                                sislnh_accept_flag,
"
"                                                sislnh_tag_no,
"
"                                                sislnh_flag,
"
"                                                sislnh_batch_id,
"
"                                                sislnh_stk_trn_proc_qty,
"
"                                                sislnh_stk_trn_inproc_qty,
"
"                                                sislnh_stk_trn_rcpt_qty,
"
"                                                sislnh_pick_qty,
"
"                                                sislnh_bin_id,
"
"                                                sislnh_plnt,
"
"                                                sislnh_cre_by,
"
"                                                sislnh_cre_date,
"
"                                                sislnh_upd_by,
"
"                                                sislnh_upd_date,
"
"                                                sislnh_tpn_no,
"
"                                                sislnh_pack_qty,
"
"                                                sislnh_sys_ls_no,
"
"                                                sislnh_expiry_date,
"
"                                                sislnh_mfg_date,
"
"                                                sislnh_dc_doc_no,
"
"                                                sislnh_dc_seq_no,
"
"                                                sislnh_tr_wgt,
"
"                                                sislnh_grn_qty,
"
"                                                sislnh_org_lot_no,
"
"                                                sislnh_source_flag,
"
"                                                sislnh_ser_pre_flag,
"
"                                                sislnh_ser_suc_flag,
"
"                                                sislnh_no_of_pcs,
"
"                                                sislnh_pigmnt_tc_doc_no)
"
"         SELECT sisln_bu,
"
"                sisln_inv_type,
"
"                sisln_inv_pfx,
"
"                sisln_inv_no,
"
"                sisln_seq_no,
"
"                sisln_type,
"
"                sisln_lot_no,
"
"                sisln_serial_no,
"
"                sisln_suplr_id,
"
"                sisln_rtn_flag,
"
"                sisln_source_id,
"
"                sisln_source_type,
"
"                sisln_inv_qty,
"
"                sisln_rtn_qty,
"
"                sisln_proc_qty,
"
"                sisln_inproc_qty,
"
"                sisln_doc_no,
"
"                sisln_lot_qty,
"
"                sisln_sub_seq_no,
"
"                sisln_offset_qty,
"
"                sisln_rejected_qty,
"
"                sisln_accept_flag,
"
"                sisln_tag_no,
"
"                sisln_flag,
"
"                sisln_batch_id,
"
"                sisln_stk_trn_proc_qty,
"
"                sisln_stk_trn_inproc_qty,
"
"                sisln_stk_trn_rcpt_qty,
"
"                sisln_pick_qty,
"
"                sisln_bin_id,
"
"                sisln_plnt,
"
"                sisln_cre_by,
"
"                sisln_cre_date,
"
"                sisln_upd_by,
"
"                sisln_upd_date,
"
"                sisln_tpn_no,
"
"                sisln_pack_qty,
"
"                sisln_sys_ls_no,
"
"                sisln_expiry_date,
"
"                sisln_mfg_date,
"
"                sisln_dc_doc_no,
"
"                sisln_dc_seq_no,
"
"                sisln_tr_wgt,
"
"                sisln_grn_qty,
"
"                sisln_org_lot_no,
"
"                sisln_source_flag,
"
"                NVL(sisln_ser_pre_flag,'N'),
"
"                NVL(sisln_ser_suc_flag,'N'),
"
"                sisln_no_of_pcs,
"
"                sisln_pigmnt_tc_doc_no
"
"           FROM sales_inv_serial_lot_no
"
"          WHERE     sisln_bu = p_bu
"
"                AND sisln_plnt = p_plnt
"
"                AND sisln_doc_no = p_doc_no;
"
"
"
"      INSERT INTO so_inv_warranty_hist (soiwh_bu,
"
"                                        soiwh_doc_no,
"
"                                        soiwh_seq_no,
"
"                                        soiwh_sub_seq_no,
"
"                                        soiwh_type,
"
"                                        soiwh_frequency,
"
"                                        soiwh_duration,
"
"                                        soiwh_plnt,
"
"                                        soiwh_cre_by,
"
"                                        soiwh_cre_date,
"
"                                        soiwh_upd_by,
"
"                                        soiwh_upd_date,
"
"                                        soiwh_end_date,
"
"                                        soiwh_start_date)
"
"         SELECT soiw_bu,
"
"                soiw_doc_no,
"
"                soiw_seq_no,
"
"                soiw_sub_seq_no,
"
"                soiw_type,
"
"                soiw_frequency,
"
"                soiw_duration,
"
"                soiw_plnt,
"
"                soiw_cre_by,
"
"                soiw_cre_date,
"
"                soiw_upd_by,
"
"                soiw_upd_date,
"
"                soiw_end_date,
"
"                soiw_start_date
"
"           FROM so_inv_warranty
"
"          WHERE     soiw_bu = p_bu
"
"                AND soiw_plnt = p_plnt
"
"                AND soiw_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_bin_details_hist (sibdh_bu,
"
"                                              sibdh_plnt,
"
"                                              sibdh_doc_no,
"
"                                              sibdh_seq_no,
"
"                                              sibdh_sub_seq_no,
"
"                                              sibdh_store_id,
"
"                                              sibdh_prod_id,
"
"                                              sibdh_prod_rev,
"
"                                              sibdh_bin_id,
"
"                                              sibdh_lot_no,
"
"                                              sibdh_ser_no,
"
"                                              sibdh_bin_qty,
"
"                                              sibdh_pick_qty,
"
"                                              sibdh_inv_qty,
"
"                                              sibdh_source_type,
"
"                                              sibdh_source_id,
"
"                                              sibdh_cre_by,
"
"                                              sibdh_cre_date,
"
"                                              sibdh_upd_by,
"
"                                              sibdh_upd_date,
"
"                                              sibdh_sys_ls_no)
"
"         SELECT sibd_bu,
"
"                sibd_plnt,
"
"                sibd_doc_no,
"
"                sibd_seq_no,
"
"                sibd_sub_seq_no,
"
"                sibd_store_id,
"
"                sibd_prod_id,
"
"                sibd_prod_rev,
"
"                sibd_bin_id,
"
"                sibd_lot_no,
"
"                sibd_ser_no,
"
"                sibd_bin_qty,
"
"                sibd_pick_qty,
"
"                sibd_inv_qty,
"
"                sibd_source_type,
"
"                sibd_source_id,
"
"                sibd_cre_by,
"
"                sibd_cre_date,
"
"                sibd_upd_by,
"
"                sibd_upd_date,
"
"                sibd_sys_ls_no
"
"           FROM sales_inv_bin_details
"
"          WHERE     sibd_bu = p_bu
"
"                AND sibd_plnt = p_plnt
"
"                AND sibd_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_cost_batch_hist (sicbh_bu,
"
"                                             sicbh_plnt,
"
"                                             sicbh_doc_no,
"
"                                             sicbh_seq_no,
"
"                                             sicbh_sub_seq_no,
"
"                                             sicbh_batch_no,
"
"                                             sicbh_trans_qty,
"
"                                             sicbh_unit_cost,
"
"                                             sicbh_cre_by,
"
"                                             sicbh_cre_date,
"
"                                             sicbh_upd_by,
"
"                                             sicbh_upd_date)
"
"         SELECT sicb_bu,
"
"                sicb_plnt,
"
"                sicb_doc_no,
"
"                sicb_seq_no,
"
"                sicb_sub_seq_no,
"
"                sicb_batch_no,
"
"                sicb_trans_qty,
"
"                sicb_unit_cost,
"
"                sicb_cre_by,
"
"                sicb_cre_date,
"
"                sicb_upd_by,
"
"                sicb_upd_date
"
"           FROM sales_inv_cost_batch
"
"          WHERE     sicb_bu = p_bu
"
"                AND sicb_plnt = p_plnt
"
"                AND sicb_doc_no = p_doc_no;
"
"
"
"
"
"      INSERT INTO sales_inv_pdi_qc_doc_hist (sipqdh_bu,
"
"                                             sipqdh_plnt,
"
"                                             sipqdh_inv_doc_no,
"
"                                             sipqdh_inv_seq_no,
"
"                                             sipqdh_sub_seq_no,
"
"                                             sipqdh_qc_doc_pfx,
"
"                                             sipqdh_qc_doc_no,
"
"                                             sipqdh_qc_doc_rev,
"
"                                             sipqdh_inv_qty,
"
"                                             sipqdh_tc_no,
"
"                                             sipqdh_cre_by,
"
"                                             sipqdh_cre_date,
"
"                                             sipqdh_upd_by,
"
"                                             sipqdh_upd_date,
"
"                                             sipqdh_qc_seq_no)
"
"         SELECT sipqd_bu,
"
"                sipqd_plnt,
"
"                sipqd_inv_doc_no,
"
"                sipqd_inv_seq_no,
"
"                sipqd_sub_seq_no,
"
"                sipqd_qc_doc_pfx,
"
"                sipqd_qc_doc_no,
"
"                sipqd_qc_doc_rev,
"
"                sipqd_inv_qty,
"
"                sipqd_tc_no,
"
"                sipqd_cre_by,
"
"                sipqd_cre_date,
"
"                sipqd_upd_by,
"
"                sipqd_upd_date,
"
"                sipqd_qc_seq_no
"
"           FROM sales_inv_pdi_qc_doc
"
"          WHERE     sipqd_bu = p_bu
"
"                AND sipqd_plnt = p_plnt
"
"                AND sipqd_inv_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_invoice_process_hist (siph_bu,
"
"                                              siph_plnt,
"
"                                              siph_doc_no,
"
"                                              siph_seq_no,
"
"                                              siph_oprn_seq_no,
"
"                                              siph_process,
"
"                                              siph_proc_comp_flag,
"
"                                              siph_cre_by,
"
"                                              siph_cre_date,
"
"                                              siph_upd_by,
"
"                                              siph_upd_date,
"
"                                              siph_unit_cost,
"
"                                              siph_source)
"
"         SELECT sip_bu,
"
"                sip_plnt,
"
"                sip_doc_no,
"
"                sip_seq_no,
"
"                sip_oprn_seq_no,
"
"                sip_process,
"
"                sip_proc_comp_flag,
"
"                sip_cre_by,
"
"                sip_cre_date,
"
"                sip_upd_by,
"
"                sip_upd_date,
"
"                sip_unit_cost,
"
"                sip_source
"
"           FROM sales_invoice_process
"
"          WHERE sip_bu = p_bu AND sip_plnt = p_plnt AND sip_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_sto_dtls_hist (sisdh_bu,
"
"                                           sisdh_plnt,
"
"                                           sisdh_doc_no,
"
"                                           sisdh_seq_no,
"
"                                           sisdh_sub_seq_no,
"
"                                           sisdh_store_id,
"
"                                           sisdh_prod_id,
"
"                                           sisdh_prod_rev,
"
"                                           sisdh_prod_uom,
"
"                                           sisdh_bom_uom,
"
"                                           sisdh_bom_qty,
"
"                                           sisdh_rqrd_qty,
"
"                                           sisdh_cre_by,
"
"                                           sisdh_cre_date,
"
"                                           sisdh_upd_by,
"
"                                           sisdh_upd_date,
"
"                                           sisdh_stl_std_spec_id,
"
"                                           sisdh_grade_id,
"
"                                           sisdh_cust_dwg_no,
"
"                                           sisdh_cust_dwg_rev,
"
"                                           sisdh_org_dwg_no,
"
"                                           sisdh_org_dwg_rev,
"
"                                           sisdh_fm_pm_flag,
"
"                                           sisdh_mchng_qty,
"
"                                           sisdh_prod_desc,
"
"                                           sisdh_raw_cast_wgt,
"
"                                           sisdh_res_id,
"
"                                           sisdh_ac_type,
"
"                                           sisdh_oem_dwg_no,
"
"                                           sisdh_oem_dwg_rev,
"
"                                           sisdh_source_type)
"
"         SELECT sisd_bu,
"
"                sisd_plnt,
"
"                sisd_doc_no,
"
"                sisd_seq_no,
"
"                sisd_sub_seq_no,
"
"                sisd_store_id,
"
"                sisd_prod_id,
"
"                sisd_prod_rev,
"
"                sisd_prod_uom,
"
"                sisd_bom_uom,
"
"                sisd_bom_qty,
"
"                sisd_rqrd_qty,
"
"                sisd_cre_by,
"
"                sisd_cre_date,
"
"                sisd_upd_by,
"
"                sisd_upd_date,
"
"                sisd_stl_std_spec_id,
"
"                sisd_grade_id,
"
"                sisd_cust_dwg_no,
"
"                sisd_cust_dwg_rev,
"
"                sisd_org_dwg_no,
"
"                sisd_org_dwg_rev,
"
"                sisd_fm_pm_flag,
"
"                sisd_mchng_qty,
"
"                sisd_prod_desc,
"
"                sisd_raw_cast_wgt,
"
"                sisd_res_id,
"
"                sisd_ac_type,
"
"                sisd_oem_dwg_no,
"
"                sisd_oem_dwg_rev,
"
"                sisd_source_type
"
"           FROM sales_inv_sto_dtls
"
"          WHERE     sisd_bu = p_bu
"
"                AND sisd_plnt = p_plnt
"
"                AND sisd_doc_no = p_doc_no;
"
"
"
"      INSERT INTO comm_inv_dtl_hist (cidh_bu,
"
"                                     cidh_plnt,
"
"                                     cidh_doc_no,
"
"                                     cidh_pre_carr_by,
"
"                                     cidh_pre_carr_rcpt_place,
"
"                                     cidh_vessel_no,
"
"                                     cidh_port_of_load,
"
"                                     cidh_port_of_disch,
"
"                                     cidh_fin_dest,
"
"                                     cidh_tot_gross_wt,
"
"                                     cidh_tot_net_wt,
"
"                                     cidh_wt_uom,
"
"                                     cidh_no_of_pallets,
"
"                                     cidh_banker_det1,
"
"                                     cidh_banker_det2,
"
"                                     cidh_banker_det3,
"
"                                     cidh_banker_det4,
"
"                                     cidh_cntry_of_origin,
"
"                                     cidh_cntry_of_dest,
"
"                                     cidh_pkg_remark1,
"
"                                     cidh_pkg_remark2,
"
"                                     cidh_adv_license_no,
"
"                                     cidh_adv_license_date,
"
"                                     cidh_cre_by,
"
"                                     cidh_cre_date,
"
"                                     cidh_upd_by,
"
"                                     cidh_upd_date,
"
"                                     cidh_adv_lic2_doc_no,
"
"                                     cidh_adv_lic2_adj_qty,
"
"                                     cidh_adv_lic1_adj_qty,
"
"                                     cidh_adv_lic1_adj_amt,
"
"                                     cidh_adv_lic2_adj_amt)
"
"         SELECT cid_bu,
"
"                cid_plnt,
"
"                cid_doc_no,
"
"                cid_pre_carr_by,
"
"                cid_pre_carr_rcpt_place,
"
"                cid_vessel_no,
"
"                cid_port_of_load,
"
"                cid_port_of_disch,
"
"                cid_fin_dest,
"
"                cid_tot_gross_wt,
"
"                cid_tot_net_wt,
"
"                cid_wt_uom,
"
"                cid_no_of_pallets,
"
"                cid_banker_det1,
"
"                cid_banker_det2,
"
"                cid_banker_det3,
"
"                cid_banker_det4,
"
"                cid_cntry_of_origin,
"
"                cid_cntry_of_dest,
"
"                cid_pkg_remark1,
"
"                cid_pkg_remark2,
"
"                cid_adv_license_no,
"
"                cid_adv_license_date,
"
"                cid_cre_by,
"
"                cid_cre_date,
"
"                cid_upd_by,
"
"                cid_upd_date,
"
"                cid_adv_lic2_doc_no,
"
"                cid_adv_lic2_adj_qty,
"
"                cid_adv_lic1_adj_qty,
"
"                cid_adv_lic1_adj_amt,
"
"                cid_adv_lic2_adj_amt
"
"           FROM comm_inv_dtl
"
"          WHERE cid_bu = p_bu AND cid_plnt = p_plnt AND cid_doc_no = p_doc_no;
"
"   END proc_ins_sal_inv_hist;
"
"
"
"   PROCEDURE proc_del_sal_inv_hist (
"
"      p_bu        sales_invoices_hd.sihd_bu%TYPE,
"
"      p_plnt      sales_invoices_hd.sihd_plant%TYPE,
"
"      p_doc_no    sales_invoices_hd.sihd_doc_no%TYPE)
"
"   AS
"
"   BEGIN
"
"      DELETE FROM si_oth_tax_charges_hist
"
"            WHERE     siotch_bu = p_bu
"
"                  AND siotch_plnt = p_plnt
"
"                  AND siotch_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_inv_adv_hist
"
"            WHERE     siah_bu = p_bu
"
"                  AND siah_plnt = p_plnt
"
"                  AND siah_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_invoices_pay_due_hist
"
"            WHERE     sipdh_bu = p_bu
"
"                  AND sipdh_plnt = p_plnt
"
"                  AND sipdh_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_inv_bill_of_lading_hist
"
"            WHERE     sibolh_bu = p_bu
"
"                  AND sibolh_plnt = p_plnt
"
"                  AND sibolh_doc_no = p_doc_no;
"
"
"
"      DELETE FROM si_cust_dc_mat_cons_hist
"
"            WHERE     sicdmch_bu = p_bu
"
"                  AND sicdmch_plnt = p_plnt
"
"                  AND sicdmch_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_inv_ship_addr_hist
"
"            WHERE     sisah_bu = p_bu
"
"                  AND sisah_plnt = p_plnt
"
"                  AND sisah_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_inv_pack_list_hd_hist
"
"            WHERE     siplhh_bu = p_bu
"
"                  AND siplhh_plnt = p_plnt
"
"                  AND siplhh_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_inv_pack_list_item_hist
"
"            WHERE     siplih_bu = p_bu
"
"                  AND siplih_plnt = p_plnt
"
"                  AND siplih_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_inv_serial_lot_no_hist
"
"            WHERE     sislnh_bu = p_bu
"
"                  AND sislnh_plnt = p_plnt
"
"                  AND sislnh_doc_no = p_doc_no;
"
"
"
"      DELETE FROM so_inv_warranty_hist
"
"            WHERE     soiwh_bu = p_bu
"
"                  AND soiwh_plnt = p_plnt
"
"                  AND soiwh_doc_no = p_doc_no;
"
"
"
"
"
"
"
"      DELETE FROM sales_inv_bin_details_hist
"
"            WHERE     sibdh_bu = p_bu
"
"                  AND sibdh_plnt = p_plnt
"
"                  AND sibdh_doc_no = p_doc_no;
"
"
"
"
"
"      DELETE FROM sales_inv_cost_batch_hist
"
"            WHERE     sicbh_bu = p_bu
"
"                  AND sicbh_plnt = p_plnt
"
"                  AND sicbh_doc_no = p_doc_no;
"
"
"
"
"
"      DELETE FROM sales_inv_pdi_qc_doc_hist
"
"            WHERE     sipqdh_bu = p_bu
"
"                  AND sipqdh_plnt = p_plnt
"
"                  AND sipqdh_inv_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_invoice_process_hist
"
"            WHERE     siph_bu = p_bu
"
"                  AND siph_plnt = p_plnt
"
"                  AND siph_doc_no = p_doc_no;
"
"
"
"
"
"      DELETE FROM sales_inv_sto_dtls_hist
"
"            WHERE     sisdh_bu = p_bu
"
"                  AND sisdh_plnt = p_plnt
"
"                  AND sisdh_doc_no = p_doc_no;
"
"
"
"      DELETE FROM comm_inv_dtl_hist
"
"            WHERE     cidh_bu = p_bu
"
"                  AND cidh_plnt = p_plnt
"
"                  AND cidh_doc_no = p_doc_no;
"
"
"
"
"
"      DELETE FROM sales_inv_pack_dtls_hist
"
"            WHERE     sipdh_bu = p_bu
"
"                  AND sipdh_plnt = p_plnt
"
"                  AND sipdh_doc_no = p_doc_no;
"
"
"
"
"
"
"
"      DELETE FROM sales_invoices_ln_hist
"
"            WHERE     silnh_bu = p_bu
"
"                  AND silnh_plnt = p_plnt
"
"                  AND silnh_doc_no = p_doc_no;
"
"
"
"      DELETE FROM sales_invoices_hd_hist
"
"            WHERE     sihdh_bu = p_bu
"
"                  AND sihdh_plant = p_plnt
"
"                  AND sihdh_doc_no = p_doc_no;
"
"   END proc_del_sal_inv_hist;
"
"END pkg_sales_invoices_hist;"
/
