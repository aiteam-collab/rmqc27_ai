CREATE OR REPLACE
"PACKAGE BODY pkg_insp_hist
"
"AS
"
"
"
"  PROCEDURE proc_ins_qc_plan_hist(p_bu		tqm_qc_plan_hd.tqphd_bu%TYPE,
"
"			          p_pln_pfx	tqm_qc_plan_hd.tqphd_pln_pfx%TYPE,
"
"			          p_pln_no	tqm_qc_plan_hd.tqphd_pln_no%TYPE
"
"			         )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO tqm_qc_plan_hd_hist(tqphdh_bu,
"
"				    tqphdh_pln_no,
"
"				    tqphdh_pln_date,
"
"				    tqphdh_pln_year,
"
"				    tqphdh_pln_period,
"
"				    tqphdh_insp_mode,
"
"				    tqphdh_qc_type,
"
"				    tqphdh_qc_id,
"
"				    tqphdh_control_person,
"
"				    tqphdh_reference,
"
"				    tqphdh_status,
"
"				    tqphdh_plnt,
"
"				    tqphdh_proc_id,
"
"				    tqphdh_qlty_incharge,
"
"				    tqphdh_cust_id,
"
"				    tqphdh_third_party,
"
"				    tqphdh_qc_ref,
"
"				    tqphdh_cre_by,
"
"				    tqphdh_cre_emp_id,
"
"				    tqphdh_cre_ip_addr,
"
"				    tqphdh_cre_os_user,
"
"				    tqphdh_cre_date,
"
"				    tqphdh_upd_by,
"
"				    tqphdh_upd_emp_id,
"
"				    tqphdh_upd_ip_addr,
"
"				    tqphdh_upd_os_user,
"
"				    tqphdh_upd_date,
"
"				    tqphdh_qc_desc,
"
"				    tqphdh_shift_id,
"
"				    tqphdh_mach_id,
"
"				    tqphdh_veh_no,
"
"				    tqphdh_sub_type,
"
"				    tqphdh_prelim_acc_flag,
"
"				    tqphdh_ptrl_insp_type,
"
"				    tqphdh_plnt_loc_id,
"
"			            tqphdh_plnt_loc_name
"
"				   )
"
"    SELECT tqphd_bu,
"
"	   tqphd_pln_no,
"
"	   tqphd_pln_date,
"
"	   tqphd_pln_year,
"
"	   tqphd_pln_period,
"
"	   tqphd_insp_mode,
"
"	   tqphd_qc_type,
"
"	   tqphd_qc_id,
"
"	   tqphd_control_person,
"
"	   tqphd_reference,
"
"	   tqphd_status,
"
"	   tqphd_plnt,
"
"	   tqphd_proc_id,
"
"	   tqphd_qlty_incharge,
"
"	   tqphd_cust_id,
"
"	   tqphd_third_party,
"
"	   tqphd_qc_ref,
"
"	   tqphd_cre_by,
"
"	   tqphd_cre_emp_id,
"
"	   tqphd_cre_ip_addr,
"
"	   tqphd_cre_os_user,
"
"	   tqphd_cre_date,
"
"	   tqphd_upd_by,
"
"	   tqphd_upd_emp_id,
"
"	   tqphd_upd_ip_addr,
"
"	   tqphd_upd_os_user,
"
"	   tqphd_upd_date,
"
"	   tqphd_qc_desc,
"
"	   tqphd_shift_id,
"
"	   tqphd_mach_id,
"
"	   tqphd_veh_no,
"
"	   tqphd_sub_type,
"
"	   tqphd_prelim_acc_flag,
"
"	   tqphd_ptrl_insp_type,
"
"	   tqphd_plnt_loc_id,
"
"	   tqphd_plnt_loc_name
"
"      FROM tqm_qc_plan_hd
"
"     WHERE tqphd_bu = p_bu
"
"       AND tqphd_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_qc_plan_ln_hist(tqplnh_bu,
"
"				    tqplnh_pln_no,
"
"				    tqplnh_seq_no,
"
"				    tqplnh_prod_id,
"
"				    tqplnh_prod_rev,
"
"				    tqplnh_uom,
"
"				    tqplnh_ord_type,
"
"				    tqplnh_ord_no,
"
"				    tqplnh_receipt_qty,
"
"				    tqplnh_accepted_qty,
"
"				    tqplnh_aod_qty,
"
"				    tqplnh_rejected_qty,
"
"				    tqplnh_store_proc_type,
"
"				    tqplnh_store_proc_id,
"
"				    tqplnh_reference,
"
"				    tqplnh_status,
"
"				    tqplnh_insp_mode,
"
"				    tqplnh_oprn_id,
"
"				    tqplnh_sel_flag,
"
"				    tqplnh_qc_oper,
"
"				    tqplnh_sw_pfx,
"
"				    tqplnh_sw_ord_no,
"
"				    tqplnh_qlty_person,
"
"				    tqplnh_compld_date,
"
"				    tqplnh_cre_by,
"
"				    tqplnh_cre_emp_id,
"
"				    tqplnh_cre_ip_addr,
"
"				    tqplnh_cre_os_user,
"
"				    tqplnh_cre_date,
"
"				    tqplnh_upd_by,
"
"				    tqplnh_upd_emp_id,
"
"				    tqplnh_upd_ip_addr,
"
"				    tqplnh_upd_os_user,
"
"				    tqplnh_upd_date,
"
"				    tqplnh_prod_uom,
"
"				    tqplnh_stk_receipt_qty,
"
"				    tqplnh_stk_accept_qty,
"
"				    tqplnh_stk_reject_qty,
"
"				    tqplnh_cert_id,
"
"				    tqplnh_test_req_flag,
"
"				    tqplnh_prod_desc1,
"
"				    tqplnh_ge_doc_no,
"
"				    tqplnh_dc_no,
"
"				    tqplnh_dc_date,
"
"				    tqplnh_mat_type,
"
"				    tqplnh_plan_no,
"
"				    tqplnh_plan_line,
"
"				    tqplnh_vou_no,
"
"				    tqplnh_vou_line_no,
"
"				    tqplnh_prod_ord_no,
"
"				    tqplnh_sf_code,
"
"				    tqplnh_so_type,
"
"				    tqplnh_so_no,
"
"				    tqplnh_so_seq_no,
"
"				    tqplnh_proj_id,
"
"				    tqplnh_task_id,
"
"				    tqplnh_cut_blank_qty,
"
"				    tqplnh_shortage_qty,
"
"				    tqplnh_shift_id,
"
"				    tqplnh_max_proc_id,
"
"				    tqplnh_proc_insp_id,
"
"				    tqplnh_so_schld_desc,
"
"				    tqplnh_vou_sub_line,
"
"				    tqplnh_mi_doc_no,
"
"				    tqplnh_sand_cast_flag,
"
"				    tqplnh_qc_plan_no,
"
"				    tqplnh_qc_plan_rev,
"
"				    tqplnh_process_wt_qty,
"
"				    tqplnh_inprocess_wt_qty,
"
"				    tqplnh_cust_drw_no,
"
"				    tqplnh_cust_drw_rev,
"
"				    tqplnh_next_code,
"
"				    tqplnh_th_comp_seq_no,
"
"				    tqplnh_mftr_id,
"
"				    tqplnh_mftr_part_no,
"
"				    tqplnh_quaran_reason,
"
"	                            tqplnh_quaran_date,
"
"				    tqplnh_vehicle_no,
"
"                                    tqplnh_fab_item_type,
"
"                                    tqplnh_thickness,
"
"                                    tqplnh_width,
"
"                                    tqplnh_length,
"
"                                    tqplnh_height,
"
"                                    tqplnh_outer_dia,
"
"                                    tqplnh_inner_dia,
"
"                                    tqplnh_density,
"
"				    tqplnh_rwk_vou_type,
"
"				    tqplnh_vou_date
"
"				   )
"
"    SELECT tqpln_bu,
"
"	   tqpln_pln_no,
"
"	   tqpln_seq_no,
"
"	   tqpln_prod_id,
"
"	   tqpln_prod_rev,
"
"	   tqpln_uom,
"
"	   tqpln_ord_type,
"
"	   tqpln_ord_no,
"
"	   tqpln_receipt_qty,
"
"	   tqpln_accepted_qty,
"
"	   tqpln_aod_qty,
"
"	   tqpln_rejected_qty,
"
"	   tqpln_store_proc_type,
"
"	   tqpln_store_proc_id,
"
"	   tqpln_reference,
"
"	   tqpln_status,
"
"	   tqpln_insp_mode,
"
"	   tqpln_oprn_id,
"
"	   tqpln_sel_flag,
"
"	   tqpln_qc_oper,
"
"	   tqpln_sw_pfx,
"
"	   tqpln_sw_ord_no,
"
"	   tqpln_qlty_person,
"
"	   tqpln_compld_date,
"
"	   tqpln_cre_by,
"
"	   tqpln_cre_emp_id,
"
"	   tqpln_cre_ip_addr,
"
"	   tqpln_cre_os_user,
"
"	   tqpln_cre_date,
"
"	   tqpln_upd_by,
"
"	   tqpln_upd_emp_id,
"
"	   tqpln_upd_ip_addr,
"
"	   tqpln_upd_os_user,
"
"	   tqpln_upd_date,
"
"	   tqpln_prod_uom,
"
"	   tqpln_stk_receipt_qty,
"
"	   tqpln_stk_accept_qty,
"
"	   tqpln_stk_reject_qty,
"
"	   tqpln_cert_id,
"
"	   tqpln_test_req_flag,
"
"	   tqpln_prod_desc1,
"
"	   tqpln_ge_doc_no,
"
"	   tqpln_dc_no,
"
"	   tqpln_dc_date,
"
"	   tqpln_mat_type,
"
"	   tqpln_plan_no,
"
"	   tqpln_plan_line,
"
"	   tqpln_vou_no,
"
"	   tqpln_vou_line_no,
"
"	   tqpln_prod_ord_no,
"
"	   tqpln_sf_code,
"
"	   tqpln_so_type,
"
"	   tqpln_so_no,
"
"	   tqpln_so_seq_no,
"
"	   tqpln_proj_id,
"
"	   tqpln_task_id,
"
"	   tqpln_cut_blank_qty,
"
"	   tqpln_shortage_qty,
"
"	   tqpln_shift_id,
"
"	   tqpln_max_proc_id,
"
"	   tqpln_proc_insp_id,
"
"	   tqpln_so_schld_desc,
"
"	   tqpln_vou_sub_line,
"
"	   tqpln_mi_doc_no,
"
"	   tqpln_sand_cast_flag,
"
"	   tqpln_qc_plan_no,
"
"	   tqpln_qc_plan_rev,
"
"	   tqpln_process_wt_qty,
"
"	   tqpln_inprocess_wt_qty,
"
"	   tqpln_cust_drw_no,
"
"	   tqpln_cust_drw_rev,
"
"	   tqpln_next_code,
"
"	   tqpln_th_comp_seq_no,
"
"	   tqpln_mftr_id,
"
"	   tqpln_mftr_part_no,
"
"	   tqpln_quaran_reason,
"
"	   tqpln_quaran_date,
"
"	   tqpln_vehicle_no,
"
"           tqpln_fab_item_type,
"
"           tqpln_thickness,
"
"           tqpln_width,
"
"           tqpln_length,
"
"           tqpln_height,
"
"           tqpln_outer_dia,
"
"           tqpln_inner_dia,
"
"           tqpln_density,
"
"	   tqpln_rwk_vou_type,
"
"	   tqpln_vou_date
"
"      FROM tqm_qc_plan_ln
"
"     WHERE tqpln_bu = p_bu
"
"       AND tqpln_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_qc_plan_lot_ser_dtls_hist(tqplsdh_bu,
"
"                                              tqplsdh_pln_no,
"
"                                              tqplsdh_seq_no,
"
"                                              tqplsdh_sub_seq_no,
"
"                                              tqplsdh_lot_type,
"
"                                              tqplsdh_lot_no,
"
"                                              tqplsdh_lot_qty,
"
"                                              tqplsdh_accepted_qty,
"
"                                              tqplsdh_aod_qty,
"
"                                              tqplsdh_rejected_qty,
"
"                                              tqplsdh_serial_no,
"
"                                              tqplsdh_sel_flag,
"
"                                              tqplsdh_source_type,
"
"                                              tqplsdh_source_id,
"
"                                              tqplsdh_bin_id,
"
"                                              tqplsdh_cre_by,
"
"					      tqplsdh_cre_emp_id,
"
"					      tqplsdh_cre_ip_addr,
"
"					      tqplsdh_cre_os_user,
"
"                                              tqplsdh_cre_date,
"
"                                              tqplsdh_upd_by,
"
"					      tqplsdh_upd_emp_id,
"
"					      tqplsdh_upd_ip_addr,
"
"					      tqplsdh_upd_os_user,
"
"                                              tqplsdh_upd_date,
"
"                                              tqplsdh_sys_ls_no,
"
"                                              tqplsdh_expiry_date,
"
"                                              tqplsdh_sel_user,
"
"                                              tqplsdh_shortage_qty,
"
"                                              tqplsdh_lot_wt_qty,
"
"                                              tqplsdh_accpt_wt_qty,
"
"                                              tqplsdh_rej_wt_qty,
"
"                                              tqplsdh_gross_wt_qty,
"
"                                              tqplsdh_cone_wt_qty,
"
"                                              tqplsdh_tar_lot_no,
"
"                                              tqplsdh_tar_sys_ls_no,
"
"                                              tqplsdh_org_lot_no,
"
"					      tqplsdh_stk_rcpt_qty,
"
"					      tqplsdh_stk_acpt_qty,
"
"					      tqplsdh_stk_aod_qty,
"
"					      tqplsdh_stk_rej_qty,
"
"					      tqplsdh_stk_prim_rej_qty,
"
"					      tqplsdh_stk_sec_rej_qty,
"
"					      tqplsdh_heat_no,
"
"					      tqplsdh_test_no
"
"					     )
"
"    SELECT tqplsd_bu,
"
"           tqplsd_pln_no,
"
"           tqplsd_seq_no,
"
"           tqplsd_sub_seq_no,
"
"           tqplsd_lot_type,
"
"           tqplsd_lot_no,
"
"           tqplsd_lot_qty,
"
"           tqplsd_accepted_qty,
"
"           tqplsd_aod_qty,
"
"           tqplsd_rejected_qty,
"
"           tqplsd_serial_no,
"
"           tqplsd_sel_flag,
"
"           tqplsd_source_type,
"
"           tqplsd_source_id,
"
"           tqplsd_bin_id,
"
"           tqplsd_cre_by,
"
"	   tqplsd_cre_emp_id,
"
"	   tqplsd_cre_ip_addr,
"
"	   tqplsd_cre_os_user,
"
"           tqplsd_cre_date,
"
"           tqplsd_upd_by,
"
"	   tqplsd_upd_emp_id,
"
"	   tqplsd_upd_ip_addr,
"
"	   tqplsd_upd_os_user,
"
"           tqplsd_upd_date,
"
"           tqplsd_sys_ls_no,
"
"           tqplsd_expiry_date,
"
"           tqplsd_sel_user,
"
"           tqplsd_shortage_qty,
"
"           tqplsd_lot_wt_qty,
"
"           tqplsd_accpt_wt_qty,
"
"           tqplsd_rej_wt_qty,
"
"           tqplsd_gross_wt_qty,
"
"           tqplsd_cone_wt_qty,
"
"           tqplsd_tar_lot_no,
"
"           tqplsd_tar_sys_ls_no,
"
"           tqplsd_org_lot_no,
"
"	   tqplsd_stk_rcpt_qty,
"
"	   tqplsd_stk_acpt_qty,
"
"	   tqplsd_stk_aod_qty,
"
"	   tqplsd_stk_rej_qty,
"
"	   tqplsd_stk_prim_rej_qty,
"
"	   tqplsd_stk_sec_rej_qty,
"
"	   tqplsd_heat_no,
"
"	   tqplsd_test_no
"
"      FROM tqm_qc_plan_lot_serial_dtls
"
"     WHERE tqplsd_bu = p_bu
"
"       AND tqplsd_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_qc_plan_process_hist(tqpph_bu,
"
"				         tqpph_pln_no,
"
"				         tqpph_seq_no,
"
"				         tqpph_sub_seq_no,
"
"				         tqpph_proc_id,
"
"				         tqpph_proc_seq_no,
"
"				         tqpph_cre_by,
"
"					 tqpph_cre_emp_id,
"
"					 tqpph_cre_ip_addr,
"
"					 tqpph_cre_os_user,
"
"				         tqpph_cre_date,
"
"				         tqpph_upd_by,
"
"					 tqpph_upd_emp_id,
"
"					 tqpph_upd_ip_addr,
"
"					 tqpph_upd_os_user,
"
"				         tqpph_upd_date,
"
"						 tqpph_oprn_ln_seq
"
"				        )
"
"    SELECT tqpp_bu,
"
"	   tqpp_pln_no,
"
"	   tqpp_seq_no,
"
"	   tqpp_sub_seq_no,
"
"	   tqpp_proc_id,
"
"	   tqpp_proc_seq_no,
"
"	   tqpp_cre_by,
"
"	   tqpp_cre_emp_id,
"
"	   tqpp_cre_ip_addr,
"
"	   tqpp_cre_os_user,
"
"	   tqpp_cre_date,
"
"	   tqpp_upd_by,
"
"	   tqpp_upd_emp_id,
"
"	   tqpp_upd_ip_addr,
"
"	   tqpp_upd_os_user,
"
"	   tqpp_upd_date,
"
"	   tqpp_oprn_ln_seq
"
"      FROM tqm_qc_plan_process
"
"     WHERE tqpp_bu = p_bu
"
"       AND tqpp_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_plan_prod_test_cert_hist(tpptch_bu,
"
"					     tpptch_plnt,
"
"					     tpptch_qc_plan_no,
"
"					     tpptch_qc_plan_seq_no,
"
"					     tpptch_sub_seq_no,
"
"					     tpptch_tc_id,
"
"					     tpptch_cre_by,
"
"					     tpptch_cre_emp_id,
"
"					     tpptch_cre_ip_addr,
"
"					     tpptch_cre_os_user,
"
"					     tpptch_cre_date,
"
"					     tpptch_upd_by,
"
"					     tpptch_upd_emp_id,
"
"					     tpptch_upd_ip_addr,
"
"					     tpptch_upd_os_user,
"
"					     tpptch_upd_date,
"
"					     tpptch_test_cert_no,
"
"					     tpptch_cert_rcvd_flag
"
"					    )
"
"    SELECT tpptc_bu,
"
"	   tpptc_plnt,
"
"	   tpptc_qc_plan_no,
"
"	   tpptc_qc_plan_seq_no,
"
"	   tpptc_sub_seq_no,
"
"	   tpptc_tc_id,
"
"	   tpptc_cre_by,
"
"	   tpptc_cre_emp_id,
"
"	   tpptc_cre_ip_addr,
"
"	   tpptc_cre_os_user,
"
"	   tpptc_cre_date,
"
"	   tpptc_upd_by,
"
"	   tpptc_upd_emp_id,
"
"	   tpptc_upd_ip_addr,
"
"	   tpptc_upd_os_user,
"
"	   tpptc_upd_date,
"
"	   tpptc_test_cert_no,
"
"	   tpptc_cert_rcvd_flag
"
"      FROM tqm_plan_prod_test_cert
"
"     WHERE tpptc_bu = p_bu
"
"       AND tpptc_qc_plan_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_plan_prod_test_cert
"
"     WHERE tpptc_bu = p_bu
"
"       AND tpptc_qc_plan_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_process
"
"     WHERE tqpp_bu = p_bu
"
"       AND tqpp_pln_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_lot_serial_dtls
"
"     WHERE tqplsd_bu = p_bu
"
"       AND tqplsd_pln_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_ln
"
"     WHERE tqpln_bu = p_bu
"
"       AND tqpln_pln_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_hd
"
"     WHERE tqphd_bu = p_bu
"
"       AND tqphd_pln_no = p_pln_no;
"
"
"
"  END proc_ins_qc_plan_hist;
"
"
"
"  PROCEDURE proc_rev_qc_plan_hist(p_bu		tqm_qc_plan_hd.tqphd_bu%TYPE,
"
"			          p_pln_pfx	tqm_qc_plan_hd.tqphd_pln_pfx%TYPE,
"
"			          p_pln_no	tqm_qc_plan_hd.tqphd_pln_no%TYPE
"
"			         )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO tqm_qc_plan_hd(tqphd_bu,
"
"			       tqphd_pln_no,
"
"			       tqphd_pln_date,
"
"			       tqphd_pln_year,
"
"			       tqphd_pln_period,
"
"			       tqphd_insp_mode,
"
"			       tqphd_qc_type,
"
"			       tqphd_qc_id,
"
"			       tqphd_control_person,
"
"			       tqphd_reference,
"
"			       tqphd_status,
"
"			       tqphd_plnt,
"
"			       tqphd_proc_id,
"
"			       tqphd_qlty_incharge,
"
"			       tqphd_cust_id,
"
"			       tqphd_third_party,
"
"			       tqphd_qc_ref,
"
"			       tqphd_cre_by,
"
"			       tqphd_cre_emp_id,
"
"			       tqphd_cre_ip_addr,
"
"			       tqphd_cre_os_user,
"
"			       tqphd_cre_date,
"
"			       tqphd_upd_by,
"
"			       tqphd_upd_emp_id,
"
"			       tqphd_upd_ip_addr,
"
"			       tqphd_upd_os_user,
"
"			       tqphd_upd_date,
"
"			       tqphd_qc_desc,
"
"			       tqphd_shift_id,
"
"			       tqphd_mach_id,
"
"			       tqphd_veh_no,
"
"			       tqphd_sub_type,
"
"			       tqphd_prelim_acc_flag,
"
"				   tqphd_plnt_loc_id,
"
"				   tqphd_plnt_loc_name
"
"			      )
"
"    SELECT tqphdh_bu,
"
"	   tqphdh_pln_no,
"
"	   tqphdh_pln_date,
"
"	   tqphdh_pln_year,
"
"	   tqphdh_pln_period,
"
"	   tqphdh_insp_mode,
"
"	   tqphdh_qc_type,
"
"	   tqphdh_qc_id,
"
"	   tqphdh_control_person,
"
"	   tqphdh_reference,
"
"	   tqphdh_status,
"
"	   tqphdh_plnt,
"
"	   tqphdh_proc_id,
"
"	   tqphdh_qlty_incharge,
"
"	   tqphdh_cust_id,
"
"	   tqphdh_third_party,
"
"	   tqphdh_qc_ref,
"
"	   tqphdh_cre_by,
"
"	   tqphdh_cre_emp_id,
"
"	   tqphdh_cre_ip_addr,
"
"	   tqphdh_cre_os_user,
"
"	   tqphdh_cre_date,
"
"	   tqphdh_upd_by,
"
"	   tqphdh_upd_emp_id,
"
"	   tqphdh_upd_ip_addr,
"
"	   tqphdh_upd_os_user,
"
"	   tqphdh_upd_date,
"
"	   tqphdh_qc_desc,
"
"	   tqphdh_shift_id,
"
"	   tqphdh_mach_id,
"
"	   tqphdh_veh_no,
"
"	   tqphdh_sub_type,
"
"	   tqphdh_prelim_acc_flag,
"
"	   tqphdh_plnt_loc_id,
"
"	   tqphdh_plnt_loc_name
"
"      FROM tqm_qc_plan_hd_hist
"
"     WHERE tqphdh_bu = p_bu
"
"       AND tqphdh_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_qc_plan_ln(tqpln_bu,
"
"			       tqpln_pln_no,
"
"			       tqpln_seq_no,
"
"			       tqpln_prod_id,
"
"			       tqpln_prod_rev,
"
"			       tqpln_uom,
"
"			       tqpln_ord_type,
"
"			       tqpln_ord_no,
"
"			       tqpln_receipt_qty,
"
"			       tqpln_accepted_qty,
"
"			       tqpln_aod_qty,
"
"			       tqpln_rejected_qty,
"
"			       tqpln_store_proc_type,
"
"			       tqpln_store_proc_id,
"
"			       tqpln_reference,
"
"			       tqpln_status,
"
"			       tqpln_insp_mode,
"
"			       tqpln_oprn_id,
"
"			       tqpln_sel_flag,
"
"			       tqpln_qc_oper,
"
"			       tqpln_sw_pfx,
"
"			       tqpln_sw_ord_no,
"
"			       tqpln_qlty_person,
"
"			       tqpln_compld_date,
"
"			       tqpln_cre_by,
"
"			       tqpln_cre_emp_id,
"
"			       tqpln_cre_ip_addr,
"
"			       tqpln_cre_os_user,
"
"			       tqpln_cre_date,
"
"			       tqpln_upd_by,
"
"			       tqpln_upd_emp_id,
"
"			       tqpln_upd_ip_addr,
"
"			       tqpln_upd_os_user,
"
"			       tqpln_upd_date,
"
"			       tqpln_prod_uom,
"
"			       tqpln_stk_receipt_qty,
"
"			       tqpln_stk_accept_qty,
"
"			       tqpln_stk_reject_qty,
"
"			       tqpln_cert_id,
"
"			       tqpln_test_req_flag,
"
"			       tqpln_prod_desc1,
"
"			       tqpln_ge_doc_no,
"
"			       tqpln_dc_no,
"
"			       tqpln_dc_date,
"
"			       tqpln_mat_type,
"
"			       tqpln_plan_no,
"
"			       tqpln_plan_line,
"
"			       tqpln_vou_no,
"
"			       tqpln_vou_line_no,
"
"			       tqpln_prod_ord_no,
"
"			       tqpln_sf_code,
"
"			       tqpln_so_type,
"
"			       tqpln_so_no,
"
"			       tqpln_so_seq_no,
"
"			       tqpln_proj_id,
"
"			       tqpln_task_id,
"
"			       tqpln_cut_blank_qty,
"
"			       tqpln_shortage_qty,
"
"			       tqpln_shift_id,
"
"			       tqpln_max_proc_id,
"
"			       tqpln_proc_insp_id,
"
"			       tqpln_so_schld_desc,
"
"			       tqpln_vou_sub_line,
"
"			       tqpln_mi_doc_no,
"
"			       tqpln_sand_cast_flag,
"
"			       tqpln_qc_plan_no,
"
"			       tqpln_qc_plan_rev,
"
"			       tqpln_process_wt_qty,
"
"			       tqpln_inprocess_wt_qty,
"
"			       tqpln_cust_drw_no,
"
"			       tqpln_cust_drw_rev,
"
"			       tqpln_next_code,
"
"			       tqpln_th_comp_seq_no,
"
"			       tqpln_mftr_id,
"
"			       tqpln_mftr_part_no,
"
"			       tqpln_quaran_reason,
"
"	                       tqpln_quaran_date,
"
"			       tqpln_vehicle_no,
"
"                               tqpln_fab_item_type,
"
"                               tqpln_thickness,
"
"                               tqpln_width,
"
"                               tqpln_length,
"
"                               tqpln_height,
"
"                               tqpln_outer_dia,
"
"                               tqpln_inner_dia,
"
"                               tqpln_density,
"
"			       tqpln_rwk_vou_type,
"
"			       tqpln_vou_date
"
"			      )
"
"    SELECT tqplnh_bu,
"
"	   tqplnh_pln_no,
"
"	   tqplnh_seq_no,
"
"	   tqplnh_prod_id,
"
"	   tqplnh_prod_rev,
"
"	   tqplnh_uom,
"
"	   tqplnh_ord_type,
"
"	   tqplnh_ord_no,
"
"	   tqplnh_receipt_qty,
"
"	   tqplnh_accepted_qty,
"
"	   tqplnh_aod_qty,
"
"	   tqplnh_rejected_qty,
"
"	   tqplnh_store_proc_type,
"
"	   tqplnh_store_proc_id,
"
"	   tqplnh_reference,
"
"	   tqplnh_status,
"
"	   tqplnh_insp_mode,
"
"	   tqplnh_oprn_id,
"
"	   tqplnh_sel_flag,
"
"	   tqplnh_qc_oper,
"
"	   tqplnh_sw_pfx,
"
"	   tqplnh_sw_ord_no,
"
"	   tqplnh_qlty_person,
"
"	   tqplnh_compld_date,
"
"	   tqplnh_cre_by,
"
"	   tqplnh_cre_emp_id,
"
"	   tqplnh_cre_ip_addr,
"
"	   tqplnh_cre_os_user,
"
"	   tqplnh_cre_date,
"
"	   tqplnh_upd_by,
"
"	   tqplnh_upd_emp_id,
"
"	   tqplnh_upd_ip_addr,
"
"	   tqplnh_upd_os_user,
"
"	   tqplnh_upd_date,
"
"	   tqplnh_prod_uom,
"
"	   tqplnh_stk_receipt_qty,
"
"	   tqplnh_stk_accept_qty,
"
"	   tqplnh_stk_reject_qty,
"
"	   tqplnh_cert_id,
"
"	   tqplnh_test_req_flag,
"
"	   tqplnh_prod_desc1,
"
"	   tqplnh_ge_doc_no,
"
"	   tqplnh_dc_no,
"
"	   tqplnh_dc_date,
"
"	   tqplnh_mat_type,
"
"	   tqplnh_plan_no,
"
"	   tqplnh_plan_line,
"
"	   tqplnh_vou_no,
"
"	   tqplnh_vou_line_no,
"
"	   tqplnh_prod_ord_no,
"
"	   tqplnh_sf_code,
"
"	   tqplnh_so_type,
"
"	   tqplnh_so_no,
"
"	   tqplnh_so_seq_no,
"
"	   tqplnh_proj_id,
"
"	   tqplnh_task_id,
"
"	   tqplnh_cut_blank_qty,
"
"	   tqplnh_shortage_qty,
"
"	   tqplnh_shift_id,
"
"	   tqplnh_max_proc_id,
"
"	   tqplnh_proc_insp_id,
"
"	   tqplnh_so_schld_desc,
"
"	   tqplnh_vou_sub_line,
"
"	   tqplnh_mi_doc_no,
"
"	   tqplnh_sand_cast_flag,
"
"	   tqplnh_qc_plan_no,
"
"	   tqplnh_qc_plan_rev,
"
"	   tqplnh_process_wt_qty,
"
"	   tqplnh_inprocess_wt_qty,
"
"	   tqplnh_cust_drw_no,
"
"	   tqplnh_cust_drw_rev,
"
"	   tqplnh_next_code,
"
"	   tqplnh_th_comp_seq_no,
"
"	   tqplnh_mftr_id,
"
"	   tqplnh_mftr_part_no,
"
"	   tqplnh_quaran_reason,
"
"	   tqplnh_quaran_date,
"
"	   tqplnh_vehicle_no,
"
"           tqplnh_fab_item_type,
"
"           tqplnh_thickness,
"
"           tqplnh_width,
"
"           tqplnh_length,
"
"           tqplnh_height,
"
"           tqplnh_outer_dia,
"
"           tqplnh_inner_dia,
"
"           tqplnh_density,
"
"	   tqplnh_rwk_vou_type,
"
"	   tqplnh_vou_date
"
"      FROM tqm_qc_plan_ln_hist
"
"     WHERE tqplnh_bu = p_bu
"
"       AND tqplnh_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_qc_plan_lot_serial_dtls(tqplsd_bu,
"
"                                            tqplsd_pln_no,
"
"                                            tqplsd_seq_no,
"
"                                            tqplsd_sub_seq_no,
"
"                                            tqplsd_lot_type,
"
"                                            tqplsd_lot_no,
"
"                                            tqplsd_lot_qty,
"
"                                            tqplsd_accepted_qty,
"
"                                            tqplsd_aod_qty,
"
"                                            tqplsd_rejected_qty,
"
"                                            tqplsd_serial_no,
"
"                                            tqplsd_sel_flag,
"
"                                            tqplsd_source_type,
"
"                                            tqplsd_source_id,
"
"                                            tqplsd_bin_id,
"
"                                            tqplsd_cre_by,
"
"					    tqplsd_cre_emp_id,
"
"					    tqplsd_cre_ip_addr,
"
"					    tqplsd_cre_os_user,
"
"                                            tqplsd_cre_date,
"
"                                            tqplsd_upd_by,
"
"					    tqplsd_upd_emp_id,
"
"					    tqplsd_upd_ip_addr,
"
"					    tqplsd_upd_os_user,
"
"                                            tqplsd_upd_date,
"
"                                            tqplsd_sys_ls_no,
"
"                                            tqplsd_expiry_date,
"
"                                            tqplsd_sel_user,
"
"                                            tqplsd_shortage_qty,
"
"                                            tqplsd_lot_wt_qty,
"
"                                            tqplsd_accpt_wt_qty,
"
"                                            tqplsd_rej_wt_qty,
"
"                                            tqplsd_gross_wt_qty,
"
"                                            tqplsd_cone_wt_qty,
"
"                                            tqplsd_tar_lot_no,
"
"                                            tqplsd_tar_sys_ls_no,
"
"                                            tqplsd_org_lot_no,
"
"					    tqplsd_stk_rcpt_qty,
"
"					    tqplsd_stk_acpt_qty,
"
"					    tqplsd_stk_aod_qty,
"
"					    tqplsd_stk_rej_qty,
"
"					    tqplsd_stk_prim_rej_qty,
"
"					    tqplsd_stk_sec_rej_qty,
"
"					    tqplsd_heat_no,
"
"					    tqplsd_test_no
"
"					   )
"
"    SELECT tqplsdh_bu,
"
"           tqplsdh_pln_no,
"
"           tqplsdh_seq_no,
"
"           tqplsdh_sub_seq_no,
"
"           tqplsdh_lot_type,
"
"           tqplsdh_lot_no,
"
"           tqplsdh_lot_qty,
"
"           tqplsdh_accepted_qty,
"
"           tqplsdh_aod_qty,
"
"           tqplsdh_rejected_qty,
"
"           tqplsdh_serial_no,
"
"           tqplsdh_sel_flag,
"
"           tqplsdh_source_type,
"
"           tqplsdh_source_id,
"
"           tqplsdh_bin_id,
"
"           tqplsdh_cre_by,
"
"	   tqplsdh_cre_emp_id,
"
"	   tqplsdh_cre_ip_addr,
"
"	   tqplsdh_cre_os_user,
"
"           tqplsdh_cre_date,
"
"           tqplsdh_upd_by,
"
"	   tqplsdh_upd_emp_id,
"
"	   tqplsdh_upd_ip_addr,
"
"	   tqplsdh_upd_os_user,
"
"           tqplsdh_upd_date,
"
"           tqplsdh_sys_ls_no,
"
"           tqplsdh_expiry_date,
"
"           tqplsdh_sel_user,
"
"           tqplsdh_shortage_qty,
"
"           tqplsdh_lot_wt_qty,
"
"           tqplsdh_accpt_wt_qty,
"
"           tqplsdh_rej_wt_qty,
"
"           tqplsdh_gross_wt_qty,
"
"           tqplsdh_cone_wt_qty,
"
"           tqplsdh_tar_lot_no,
"
"           tqplsdh_tar_sys_ls_no,
"
"           tqplsdh_org_lot_no,
"
"	   tqplsdh_stk_rcpt_qty,
"
"	   tqplsdh_stk_acpt_qty,
"
"	   tqplsdh_stk_aod_qty,
"
"	   tqplsdh_stk_rej_qty,
"
"	   tqplsdh_stk_prim_rej_qty,
"
"	   tqplsdh_stk_sec_rej_qty,
"
"	   tqplsdh_heat_no,
"
"	   tqplsdh_test_no
"
"      FROM tqm_qc_plan_lot_ser_dtls_hist
"
"     WHERE tqplsdh_bu = p_bu
"
"       AND tqplsdh_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_qc_plan_process(tqpp_bu,
"
"				    tqpp_pln_no,
"
"				    tqpp_seq_no,
"
"				    tqpp_sub_seq_no,
"
"				    tqpp_proc_id,
"
"				    tqpp_proc_seq_no,
"
"				    tqpp_cre_by,
"
"				    tqpp_cre_emp_id,
"
"				    tqpp_cre_ip_addr,
"
"				    tqpp_cre_os_user,
"
"				    tqpp_cre_date,
"
"				    tqpp_upd_by,
"
"				    tqpp_upd_emp_id,
"
"				    tqpp_upd_ip_addr,
"
"				    tqpp_upd_os_user,
"
"				    tqpp_upd_date
"
"				   )
"
"    SELECT tqpph_bu,
"
"	   tqpph_pln_no,
"
"	   tqpph_seq_no,
"
"	   tqpph_sub_seq_no,
"
"	   tqpph_proc_id,
"
"	   tqpph_proc_seq_no,
"
"	   tqpph_cre_by,
"
"	   tqpph_cre_emp_id,
"
"	   tqpph_cre_ip_addr,
"
"	   tqpph_cre_os_user,
"
"	   tqpph_cre_date,
"
"	   tqpph_upd_by,
"
"	   tqpph_upd_emp_id,
"
"	   tqpph_upd_ip_addr,
"
"	   tqpph_upd_os_user,
"
"	   tqpph_upd_date
"
"      FROM tqm_qc_plan_process_hist
"
"     WHERE tqpph_bu = p_bu
"
"       AND tqpph_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_plan_prod_test_cert(tpptc_bu,
"
"					tpptc_plnt,
"
"					tpptc_qc_plan_no,
"
"					tpptc_qc_plan_seq_no,
"
"					tpptc_sub_seq_no,
"
"					tpptc_tc_id,
"
"					tpptc_cre_by,
"
"					tpptc_cre_emp_id,
"
"					tpptc_cre_ip_addr,
"
"					tpptc_cre_os_user,
"
"					tpptc_cre_date,
"
"					tpptc_upd_by,
"
"					tpptc_upd_emp_id,
"
"					tpptc_upd_ip_addr,
"
"					tpptc_upd_os_user,
"
"					tpptc_upd_date,
"
"					tpptc_test_cert_no,
"
"					tpptc_cert_rcvd_flag
"
"				       )
"
"    SELECT tpptch_bu,
"
"	   tpptch_plnt,
"
"	   tpptch_qc_plan_no,
"
"	   tpptch_qc_plan_seq_no,
"
"	   tpptch_sub_seq_no,
"
"	   tpptch_tc_id,
"
"	   tpptch_cre_by,
"
"	   tpptch_cre_emp_id,
"
"	   tpptch_cre_ip_addr,
"
"	   tpptch_cre_os_user,
"
"	   tpptch_cre_date,
"
"	   tpptch_upd_by,
"
"	   tpptch_upd_emp_id,
"
"	   tpptch_upd_ip_addr,
"
"	   tpptch_upd_os_user,
"
"	   tpptch_upd_date,
"
"	   tpptch_test_cert_no,
"
"	   tpptch_cert_rcvd_flag
"
"      FROM tqm_plan_prod_test_cert_hist
"
"     WHERE tpptch_bu = p_bu
"
"       AND tpptch_qc_plan_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_plan_prod_test_cert_hist
"
"     WHERE tpptch_bu = p_bu
"
"       AND tpptch_qc_plan_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_process_hist
"
"     WHERE tqpph_bu = p_bu
"
"       AND tqpph_pln_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_lot_ser_dtls_hist
"
"     WHERE tqplsdh_bu = p_bu
"
"       AND tqplsdh_pln_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_ln_hist
"
"     WHERE tqplnh_bu = p_bu
"
"       AND tqplnh_pln_no = p_pln_no;
"
"
"
"    DELETE FROM tqm_qc_plan_hd_hist
"
"     WHERE tqphdh_bu = p_bu
"
"       AND tqphdh_pln_no = p_pln_no;
"
"
"
"  END proc_rev_qc_plan_hist;
"
"
"
"  PROCEDURE proc_ins_qc_hist(p_bu	tqm_qc_hd.tqhd_bu%TYPE,
"
"			     p_qc_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"			     p_qc_no	tqm_qc_hd.tqhd_qc_no%TYPE,
"
"			     p_qc_rev	tqm_qc_hd.tqhd_qc_rev%TYPE
"
"			    )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO tqm_qc_hd_hist(tqhdh_bu,
"
"			       tqhdh_qc_no,
"
"			       tqhdh_qc_rev,
"
"			       tqhdh_date,
"
"			       tqhdh_year,
"
"			       tqhdh_period,
"
"			       tqhdh_accp_date,
"
"			       tqhdh_accp_year,
"
"			       tqhdh_accp_period,
"
"			       tqhdh_insp_mode,
"
"			       tqhdh_qc_type,
"
"			       tqhdh_qc_id,
"
"			       tqhdh_appr_id,
"
"			       tqhdh_appr_pos,
"
"			       tqhdh_appr_date,
"
"			       tqhdh_appr_commnt,
"
"			       tqhdh_control_person,
"
"			       tqhdh_doc_action,
"
"			       tqhdh_reference,
"
"			       tqhdh_status,
"
"			       tqhdh_plnt,
"
"			       tqhdh_proc_id,
"
"			       tqhdh_qlty_incharge,
"
"			       tqhdh_cust_id,
"
"			       tqhdh_third_party,
"
"			       tqhdh_qc_ref,
"
"			       tqhdh_cre_by,
"
"			       tqhdh_cre_emp_id,
"
"			       tqhdh_cre_ip_addr,
"
"			       tqhdh_cre_os_user,
"
"			       tqhdh_cre_date,
"
"			       tqhdh_upd_by,
"
"			       tqhdh_upd_emp_id,
"
"			       tqhdh_upd_ip_addr,
"
"			       tqhdh_upd_os_user,
"
"			       tqhdh_upd_date,
"
"			       tqhdh_ref_unit,
"
"			       tqhdh_qc_desc,
"
"			       tqhdh_so_ref,
"
"			       tqhdh_shift_id,
"
"			       tqhdh_mach_id,
"
"			       tqhdh_insp_loc,
"
"			       tqhdh_mov_ncr_doc_flag,
"
"			       tqhdh_qc_compl_date,
"
"			       tqhdh_qc_shift_id,
"
"			       tqhdh_cust_ref,
"
"			       tqhdh_aoi_mchn_id,
"
"			       tqhdh_aoi_oper_id,
"
"			       tqhdh_inchrg_id,
"
"			       tqhdh_insp_type,
"
"			       tqhdh_fbi_ed_time,
"
"			       tqhdh_fbi_st_time,
"
"			       tqhdh_fb_ver_flag,
"
"			       tqhdh_aoi_ref,
"
"			       tqhdh_prelim_acc_flag,
"
"			       tqhdh_ptrl_insp_type,
"
"			       tqhdh_plnt_loc_id,
"
"			       tqhdh_plnt_loc_name,
"
"			       tqhdh_vcd,
"
"			       tqhdh_dmt,
"
"			       tqhdh_pitch_mic,
"
"			       tqhdh_go,
"
"			       tqhdh_no_go,
"
"			       tqhdh_prof_pjr,
"
"			       tqhdh_plunger,
"
"			       tqhdh_lever,
"
"                               tqhdh_rm_sou_name,
"
"			       tqhdh_prod_id,
"
"	                       tqhdh_prod_rev,
"
"	                       tqhdh_prod_desc,
"
"	                       tqhdh_rcpt_qty,
"
"	                       tqhdh_acpt_qty,
"
"	                       tqhdh_aod_qty,
"
"	                       tqhdh_rej_qty,
"
"	                       tqhdh_prim_rej_qty,
"
"	                       tqhdh_secon_rej_qty,
"
"	                       tqhdh_lot_no,
"
"	                       tqhdh_ser_no,
"
"	                       tqhdh_heat_no,
"
"	                       tqhdh_test_no,
"
"	                       tqhdh_uom,
"
"	                       tqhdh_matl_type,
"
"	                       tqhdh_tar_sf_code,
"
"                               tqhdh_tar_oprn_seq,
"
"                               tqhdh_tar_proc_id,
"
"	                       tqhdh_sou_sf_code,
"
"                               tqhdh_sou_oprn_seq,
"
"                               tqhdh_sou_proc_id,
"
"                               tqhdh_std_code  ,
"
"	                       tqhdh_appr_by  ,
"
"                               tqhdh_appr_emp_id  ,
"
"                               tqhdh_appr_ip_addr,
"
"                               tqhdh_appr_os_user ,
"
"                               tqhdh_appr_upd_date,
"
"	                       tqhdh_rec_pri_is_repair_qty,
"
"	                       tqhdh_rec_sec_is_repair_qty,
"
"	                       tqhdh_rec_pri_os_repair_qty,
"
"	                       tqhdh_rec_sec_os_repair_qty,
"
"	                       tqhdh_rec_pri_scrap_qty,
"
"	                       tqhdh_rec_sec_scrap_qty,
"
"	                       tqhdh_rec_pri_dis_ass_qty,
"
"	                       tqhdh_rec_sec_dis_ass_qty,
"
"	                       tqhdh_rec_pri_rtrn_qty,
"
"	                       tqhdh_rec_sec_rtrn_qty,
"
"                               tqhdh_smpl_size_var,
"
"                               tqhdh_smpl_size_attr,
"
"                               tqhdh_obs_no_var,
"
"                               tqhdh_obs_no_attr,
"
"                               tqhdh_smpl_size_var_ent,
"
"                               tqhdh_smpl_size_attr_ent,
"
"                               tqhdh_obs_no_var_ent,
"
"                               tqhdh_obs_no_attr_ent,
"
"			       tqhdh_exp_date,
"
"			       tqhdh_mfg_date
"
"			      )
"
"    SELECT tqhd_bu,
"
"	   tqhd_qc_no,
"
"	   tqhd_qc_rev,
"
"	   tqhd_date,
"
"	   tqhd_year,
"
"	   tqhd_period,
"
"	   tqhd_accp_date,
"
"	   tqhd_accp_year,
"
"	   tqhd_accp_period,
"
"	   tqhd_insp_mode,
"
"	   tqhd_qc_type,
"
"	   tqhd_qc_id,
"
"	   tqhd_appr_id,
"
"	   tqhd_appr_pos,
"
"	   tqhd_appr_date,
"
"	   tqhd_appr_commnt,
"
"	   tqhd_control_person,
"
"	   tqhd_doc_action,
"
"	   tqhd_reference,
"
"	   tqhd_status,
"
"	   tqhd_plnt,
"
"	   tqhd_proc_id,
"
"	   tqhd_qlty_incharge,
"
"	   tqhd_cust_id,
"
"	   tqhd_third_party,
"
"	   tqhd_qc_ref,
"
"	   tqhd_cre_by,
"
"	   tqhd_cre_emp_id,
"
"	   tqhd_cre_ip_addr,
"
"	   tqhd_cre_os_user,
"
"	   tqhd_cre_date,
"
"	   tqhd_upd_by,
"
"	   tqhd_upd_emp_id,
"
"	   tqhd_upd_ip_addr,
"
"	   tqhd_upd_os_user,
"
"	   tqhd_upd_date,
"
"	   tqhd_ref_unit,
"
"	   tqhd_qc_desc,
"
"	   tqhd_so_ref,
"
"	   tqhd_shift_id,
"
"	   tqhd_mach_id,
"
"	   tqhd_insp_loc,
"
"	   tqhd_mov_ncr_doc_flag,
"
"	   tqhd_qc_compl_date,
"
"	   tqhd_qc_shift_id,
"
"	   tqhd_cust_ref,
"
"	   tqhd_aoi_mchn_id,
"
"	   tqhd_aoi_oper_id,
"
"	   tqhd_inchrg_id,
"
"	   tqhd_insp_type,
"
"	   tqhd_fbi_ed_time,
"
"	   tqhd_fbi_st_time,
"
"	   tqhd_fb_ver_flag,
"
"	   tqhd_aoi_ref,
"
"	   tqhd_prelim_acc_flag,
"
"	   tqhd_ptrl_insp_type,
"
"	   tqhd_plnt_loc_id,
"
"	   tqhd_plnt_loc_name,
"
"	   tqhd_vcd,
"
"	   tqhd_dmt,
"
"	   tqhd_pitch_mic,
"
"	   tqhd_go,
"
"	   tqhd_no_go,
"
"	   tqhd_prof_pjr,
"
"	   tqhd_plunger,
"
"	   tqhd_lever,
"
"           tqhd_rm_sou_name,
"
"           tqhd_prod_id,
"
"	   tqhd_prod_rev,
"
"	   tqhd_prod_desc,
"
"	   tqhd_rcpt_qty,
"
"	   tqhd_acpt_qty,
"
"	   tqhd_aod_qty,
"
"	   tqhd_rej_qty,
"
"	   tqhd_prim_rej_qty,
"
"	   tqhd_secon_rej_qty,
"
"	   tqhd_lot_no,
"
"	   tqhd_ser_no,
"
"	   tqhd_heat_no,
"
"	   tqhd_test_no,
"
"	   tqhd_uom,
"
"	   tqhd_matl_type,
"
"	   tqhd_tar_sf_code,
"
"           tqhd_tar_oprn_seq,
"
"           tqhd_tar_proc_id,
"
"	   tqhd_sou_sf_code,
"
"           tqhd_sou_oprn_seq,
"
"           tqhd_sou_proc_id,
"
"           tqhd_std_code  ,
"
"	   tqhd_appr_by  ,
"
"           tqhd_appr_emp_id  ,
"
"           tqhd_appr_ip_addr,
"
"           tqhd_appr_os_user ,
"
"           tqhd_appr_upd_date,
"
"	   tqhd_rec_pri_is_repair_qty,
"
"	   tqhd_rec_sec_is_repair_qty,
"
"	   tqhd_rec_pri_os_repair_qty,
"
"	   tqhd_rec_sec_os_repair_qty,
"
"	   tqhd_rec_pri_scrap_qty,
"
"	   tqhd_rec_sec_scrap_qty,
"
"	   tqhd_rec_pri_dis_ass_qty,
"
"	   tqhd_rec_sec_dis_ass_qty,
"
"	   tqhd_rec_pri_rtrn_qty,
"
"	   tqhd_rec_sec_rtrn_qty,
"
"           tqhd_smpl_size_var,
"
"           tqhd_smpl_size_attr,
"
"           tqhd_obs_no_var,
"
"           tqhd_obs_no_attr,
"
"           tqhd_smpl_size_var_ent,
"
"           tqhd_smpl_size_attr_ent,
"
"           tqhd_obs_no_var_ent,
"
"           tqhd_obs_no_attr_ent,
"
"           tqhd_exp_date,
"
"           tqhd_mfg_date
"
"      FROM tqm_qc_hd
"
"     WHERE tqhd_bu = p_bu
"
"       AND tqhd_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln_hist(tqlnh_bu,
"
"			       tqlnh_qc_no,
"
"			       tqlnh_seq_no,
"
"			       tqlnh_pln_seq_no,
"
"			       tqlnh_prod_id,
"
"			       tqlnh_prod_rev,
"
"			       tqlnh_uom,
"
"			       tqlnh_no_of_samples,
"
"			       tqlnh_sample_qty,
"
"			       tqlnh_no_of_obs,
"
"			       tqlnh_std_acc_qty,
"
"			       tqlnh_std_rej_qty,
"
"			       tqlnh_attained_res,
"
"			       tqlnh_auto_flag,
"
"			       tqlnh_receipt_qty,
"
"			       tqlnh_accept_qty,
"
"			       tqlnh_aod_qty,
"
"			       tqlnh_reject_qty,
"
"			       tqlnh_control_person,
"
"			       tqlnh_reference,
"
"			       tqlnh_status,
"
"			       tqlnh_sales_sub_seq_no,
"
"			       tqlnh_segg_qty,
"
"			       tqlnh_segg_flag,
"
"			       tqlnh_accept_basis,
"
"			       tqlnh_rev_status,
"
"			       tqlnh_prim_rej_qty,
"
"			       tqlnh_secon_rej_qty,
"
"			       tqlnh_sw_pfx,
"
"			       tqlnh_sw_ord_no,
"
"			       tqlnh_qlty_person,
"
"			       tqlnh_compld_date,
"
"			       tqlnh_cre_by,
"
"			       tqlnh_cre_emp_id,
"
"			       tqlnh_cre_ip_addr,
"
"			       tqlnh_cre_os_user,
"
"			       tqlnh_cre_date,
"
"			       tqlnh_upd_by,
"
"			       tqlnh_upd_emp_id,
"
"			       tqlnh_upd_ip_addr,
"
"			       tqlnh_upd_os_user,
"
"			       tqlnh_upd_date,
"
"			       tqlnh_sal_inprocess_qty,
"
"			       tqlnh_sal_inv_qty,
"
"			       tqlnh_prod_uom,
"
"			       tqlnh_stk_receipt_qty,
"
"			       tqlnh_stk_accept_qty,
"
"			       tqlnh_stk_reject_qty,
"
"			       tqlnh_cert_rcvd_flag,
"
"			       tqlnh_cert_instr,
"
"			       tqlnh_cert_id,
"
"			       tqlnh_test_req_flag,
"
"			       tqlnh_sampling_time,
"
"			       tqlnh_resulting_time,
"
"			       tqlnh_prod_desc1,
"
"			       tqlnh_insp_pln_no,
"
"			       tqlnh_insp_pln_rev,
"
"			       tqlnh_ncr_flag,
"
"			       tqlnh_ncr_user,
"
"			       tqlnh_ncr_qty,
"
"			       tqlnh_smpl_size_var,
"
"			       tqlnh_smpl_size_attr,
"
"			       tqlnh_obs_no_var,
"
"			       tqlnh_obs_no_attr,
"
"			       tqlnh_smpl_size_var_ent,
"
"			       tqlnh_smpl_size_attr_ent,
"
"			       tqlnh_obs_no_var_ent,
"
"			       tqlnh_obs_no_attr_ent,
"
"			       tqlnh_test_cert_no,
"
"			       tqlnh_ge_doc_no,
"
"			       tqlnh_dc_no,
"
"			       tqlnh_dc_date,
"
"			       tqlnh_mat_type,
"
"			       tqlnh_spr_type,
"
"			       tqlnh_inv_inproc_qty,
"
"			       tqlnh_inv_qty,
"
"			       tqlnh_rec_pri_is_repair_qty,
"
"			       tqlnh_rec_sec_is_repair_qty,
"
"			       tqlnh_rec_pri_scrap_qty,
"
"			       tqlnh_rec_sec_scrap_qty,
"
"			       tqlnh_rec_pri_dis_ass_qty,
"
"			       tqlnh_rec_sec_dis_ass_qty,
"
"			       tqlnh_rec_pri_rtrn_qty,
"
"			       tqlnh_rec_sec_rtrn_qty,
"
"			       tqlnh_rec_sec_os_repair_qty,
"
"			       tqlnh_rec_pri_os_repair_qty,
"
"			       tqlnh_vou_pfx,
"
"			       tqlnh_vou_no,
"
"			       tqlnh_vou_line_no,
"
"			       tqlnh_prod_ord_no,
"
"			       tqlnh_sf_code,
"
"			       tqlnh_act_compld_date,
"
"			       tqlnh_start_date,
"
"			       tqlnh_end_date,
"
"			       tqlnh_so_type,
"
"			       tqlnh_so_pfx,
"
"			       tqlnh_so_no,
"
"			       tqlnh_so_seq_no,
"
"			       tqlnh_so_sub_seq_no,
"
"			       tqlnh_proj_id,
"
"			       tqlnh_task_id,
"
"			       tqlnh_stk_aod_qty,
"
"			       tqlnh_stk_prim_rej_qty,
"
"			       tqlnh_stk_sec_rej_qty,
"
"			       tqlnh_fines_pct,
"
"			       tqlnh_fines_qty,
"
"			       tqlnh_moisture_pct,
"
"			       tqlnh_moisture_qty,
"
"			       tqlnh_veh_no,
"
"			       tqlnh_insp_rpt_no,
"
"			       tqlnh_cut_blank_qty,
"
"			       tqlnh_mov_ncr_doc_flag,
"
"			       tqlnh_shortage_qty,
"
"			       tqlnh_shift_id,
"
"			       tqlnh_so_schld_desc,
"
"			       tqlnh_insp_id,
"
"			       tqlnh_attr_insp_id,
"
"			       tqlnh_aql,
"
"			       tqlnh_std_code,
"
"			       tqlnh_vou_sub_line,
"
"			       tqlnh_sand_cast_flag,
"
"			       tqlnh_qc_plan_no,
"
"			       tqlnh_qc_plan_rev,
"
"			       tqlnh_cust_drw_no,
"
"			       tqlnh_cust_drw_rev,
"
"			       tqlnh_insrwk_proc_qty,
"
"			       tqlnh_insrwk_curproc_qty,
"
"			       tqlnh_reworked_qty,
"
"			       tqlnh_rwk_sel_flag,
"
"			       tqlnh_rwk_sel_user,
"
"			       tqlnh_next_code,
"
"			       tqlnh_print_type,
"
"			       tqlnh_peel_method,
"
"			       tqlnh_fusing_time,
"
"			       tqlnh_temperature,
"
"			       tqlnh_pressure,
"
"			       tqlnh_th_comp_seq_no,
"
"			       tqlnh_conv_factor,
"
"			       tqlnh_qc_spec_rqrd_flag,
"
"			       tqlnh_mftr_id,
"
"			       tqlnh_mftr_part_no,
"
"			       tqlnh_rej_ref,
"
"			       tqlnh_can_ref,
"
"			       tqlnh_insp_rqst_pfx,
"
"			       tqlnh_insp_rqst_no,
"
"			       tqlnh_insp_rqst_seq_no,
"
"			       tqlnh_ls_uom_gen_type,
"
"			       tqlnh_bak_qty,
"
"			       tqlnh_stk_bak_qty,
"
"                               tqlnh_fab_item_type,
"
"                               tqlnh_thickness,
"
"                               tqlnh_width,
"
"                               tqlnh_length,
"
"                               tqlnh_height,
"
"                               tqlnh_outer_dia,
"
"                               tqlnh_inner_dia,
"
"                               tqlnh_density,
"
"			       tqlnh_rwk_vou_type,
"
"			       tqlnh_vou_date,
"
"			       tqlnh_unit_cost
"
"			      )
"
"    SELECT tqln_bu,
"
"	   tqln_qc_no,
"
"	   tqln_seq_no,
"
"	   tqln_pln_seq_no,
"
"	   tqln_prod_id,
"
"	   tqln_prod_rev,
"
"	   tqln_uom,
"
"	   tqln_no_of_samples,
"
"	   tqln_sample_qty,
"
"	   tqln_no_of_obs,
"
"	   tqln_std_acc_qty,
"
"	   tqln_std_rej_qty,
"
"	   tqln_attained_res,
"
"	   tqln_auto_flag,
"
"	   tqln_receipt_qty,
"
"	   tqln_accept_qty,
"
"	   tqln_aod_qty,
"
"	   tqln_reject_qty,
"
"	   tqln_control_person,
"
"	   tqln_reference,
"
"	   tqln_status,
"
"	   tqln_sales_sub_seq_no,
"
"	   tqln_segg_qty,
"
"	   tqln_segg_flag,
"
"	   tqln_accept_basis,
"
"	   tqln_rev_status,
"
"	   tqln_prim_rej_qty,
"
"	   tqln_secon_rej_qty,
"
"	   tqln_sw_pfx,
"
"	   tqln_sw_ord_no,
"
"	   tqln_qlty_person,
"
"	   tqln_compld_date,
"
"	   tqln_cre_by,
"
"	   tqln_cre_emp_id,
"
"	   tqln_cre_ip_addr,
"
"	   tqln_cre_os_user,
"
"	   tqln_cre_date,
"
"	   tqln_upd_by,
"
"	   tqln_upd_emp_id,
"
"	   tqln_upd_ip_addr,
"
"	   tqln_upd_os_user,
"
"	   tqln_upd_date,
"
"	   tqln_sal_inprocess_qty,
"
"	   tqln_sal_inv_qty,
"
"	   tqln_prod_uom,
"
"	   tqln_stk_receipt_qty,
"
"	   tqln_stk_accept_qty,
"
"	   tqln_stk_reject_qty,
"
"	   tqln_cert_rcvd_flag,
"
"	   tqln_cert_instr,
"
"	   tqln_cert_id,
"
"	   tqln_test_req_flag,
"
"	   tqln_sampling_time,
"
"	   tqln_resulting_time,
"
"	   tqln_prod_desc1,
"
"	   tqln_insp_pln_no,
"
"	   tqln_insp_pln_rev,
"
"	   tqln_ncr_flag,
"
"	   tqln_ncr_user,
"
"	   tqln_ncr_qty,
"
"	   tqln_smpl_size_var,
"
"	   tqln_smpl_size_attr,
"
"	   tqln_obs_no_var,
"
"	   tqln_obs_no_attr,
"
"	   tqln_smpl_size_var_ent,
"
"	   tqln_smpl_size_attr_ent,
"
"	   tqln_obs_no_var_ent,
"
"	   tqln_obs_no_attr_ent,
"
"	   tqln_test_cert_no,
"
"	   tqln_ge_doc_no,
"
"	   tqln_dc_no,
"
"	   tqln_dc_date,
"
"	   tqln_mat_type,
"
"	   tqln_spr_type,
"
"	   tqln_inv_inproc_qty,
"
"	   tqln_inv_qty,
"
"	   tqln_rec_pri_is_repair_qty,
"
"	   tqln_rec_sec_is_repair_qty,
"
"	   tqln_rec_pri_scrap_qty,
"
"	   tqln_rec_sec_scrap_qty,
"
"	   tqln_rec_pri_dis_ass_qty,
"
"	   tqln_rec_sec_dis_ass_qty,
"
"	   tqln_rec_pri_rtrn_qty,
"
"	   tqln_rec_sec_rtrn_qty,
"
"	   tqln_rec_sec_os_repair_qty,
"
"	   tqln_rec_pri_os_repair_qty,
"
"	   tqln_vou_pfx,
"
"	   tqln_vou_no,
"
"	   tqln_vou_line_no,
"
"	   tqln_prod_ord_no,
"
"	   tqln_sf_code,
"
"	   tqln_act_compld_date,
"
"	   tqln_start_date,
"
"	   tqln_end_date,
"
"	   tqln_so_type,
"
"	   tqln_so_pfx,
"
"	   tqln_so_no,
"
"	   tqln_so_seq_no,
"
"	   tqln_so_sub_seq_no,
"
"	   tqln_proj_id,
"
"	   tqln_task_id,
"
"	   tqln_stk_aod_qty,
"
"	   tqln_stk_prim_rej_qty,
"
"	   tqln_stk_sec_rej_qty,
"
"	   tqln_fines_pct,
"
"	   tqln_fines_qty,
"
"	   tqln_moisture_pct,
"
"	   tqln_moisture_qty,
"
"	   tqln_veh_no,
"
"	   tqln_insp_rpt_no,
"
"	   tqln_cut_blank_qty,
"
"	   tqln_mov_ncr_doc_flag,
"
"	   tqln_shortage_qty,
"
"	   tqln_shift_id,
"
"	   tqln_so_schld_desc,
"
"	   tqln_insp_id,
"
"	   tqln_attr_insp_id,
"
"	   tqln_aql,
"
"	   tqln_std_code,
"
"	   tqln_vou_sub_line,
"
"	   tqln_sand_cast_flag,
"
"	   tqln_qc_plan_no,
"
"	   tqln_qc_plan_rev,
"
"	   tqln_cust_drw_no,
"
"	   tqln_cust_drw_rev,
"
"	   tqln_insrwk_proc_qty,
"
"	   tqln_insrwk_curproc_qty,
"
"	   tqln_reworked_qty,
"
"	   tqln_rwk_sel_flag,
"
"	   tqln_rwk_sel_user,
"
"	   tqln_next_code,
"
"	   tqln_print_type,
"
"	   tqln_peel_method,
"
"	   tqln_fusing_time,
"
"	   tqln_temperature,
"
"	   tqln_pressure,
"
"	   tqln_th_comp_seq_no,
"
"	   tqln_conv_factor,
"
"	   tqln_qc_spec_rqrd_flag,
"
"	   tqln_mftr_id,
"
"	   tqln_mftr_part_no,
"
"	   tqln_rej_ref,
"
"	   tqln_can_ref,
"
"	   tqln_insp_rqst_pfx,
"
"	   tqln_insp_rqst_no,
"
"	   tqln_insp_rqst_seq_no,
"
"	   tqln_ls_uom_gen_type,
"
"	   tqln_bak_qty,
"
"	   tqln_stk_bak_qty,
"
"           tqln_fab_item_type,
"
"           tqln_thickness,
"
"           tqln_width,
"
"           tqln_length,
"
"           tqln_height,
"
"           tqln_outer_dia,
"
"           tqln_inner_dia,
"
"           tqln_density,
"
"	   tqln_rwk_vou_type,
"
"	   tqln_vou_date,
"
"	   tqln_unit_cost
"
"      FROM tqm_qc_ln
"
"     WHERE tqln_bu = p_bu
"
"       AND tqln_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_lot_serial_nos_hist(tqmlsh_bu,
"
"					tqmlsh_qc_no,
"
"					tqmlsh_qc_doc_seq_no,
"
"					tqmlsh_pln_seq_no,
"
"					tqmlsh_ls_type,
"
"					tqmlsh_lot_no,
"
"					tqmlsh_receipt_qty,
"
"					tqmlsh_accepted_qty,
"
"					tqmlsh_rejected_qty,
"
"					tqmlsh_aod_qty,
"
"					tqmlsh_sample_qty,
"
"					tqmlsh_serial_no,
"
"					tqmlsh_rej_flag,
"
"					tqmlsh_sample_flag,
"
"					tqmlsh_prim_rej_qty,
"
"					tqmlsh_secon_rej_qty,
"
"					tqmlsh_qc_doc_sub_seq_no,
"
"					tqmlsh_source_type,
"
"					tqmlsh_source_id,
"
"					tqmlsh_bin_id,
"
"					tqmlsh_cre_by,
"
"					tqmlsh_cre_emp_id,
"
"					tqmlsh_cre_ip_addr,
"
"					tqmlsh_cre_os_user,
"
"					tqmlsh_cre_date,
"
"					tqmlsh_upd_by,
"
"					tqmlsh_upd_emp_id,
"
"					tqmlsh_upd_ip_addr,
"
"					tqmlsh_upd_os_user,
"
"					tqmlsh_upd_date,
"
"					tqmlsh_rec_pri_is_repair_qty,
"
"					tqmlsh_rec_sec_is_repair_qty,
"
"					tqmlsh_rec_pri_os_repair_qty,
"
"					tqmlsh_rec_sec_os_repair_qty,
"
"					tqmlsh_rec_pri_scrap_qty,
"
"					tqmlsh_rec_sec_scrap_qty,
"
"					tqmlsh_rec_pri_dis_ass_qty,
"
"					tqmlsh_rec_sec_dis_ass_qty,
"
"					tqmlsh_rec_pri_rtrn_qty,
"
"					tqmlsh_rec_sec_rtrn_qty,
"
"					tqmlsh_sys_ls_no,
"
"					tqmlsh_expiry_date,
"
"					tqmlsh_return_qty,
"
"					tqmlsh_rework_qty,
"
"					tqmlsh_prim_ret_qty,
"
"					tqmlsh_sec_ret_qty,
"
"					tqmlsh_prim_is_rwk_qty,
"
"					tqmlsh_prim_os_rwk_qty,
"
"					tqmlsh_sec_is_rwk_qty,
"
"					tqmlsh_sec_os_rwk_qty,
"
"					tqmlsh_shortage_qty,
"
"					tqmlsh_receipt_wt_qty,
"
"					tqmlsh_accept_wt_qty,
"
"					tqmlsh_reject_wt_qty,
"
"					tqmlsh_cone_wt,
"
"					tqmlsh_gross_wt,
"
"					tqmlsh_rej_curproc_qty,
"
"					tqmlsh_rej_proc_qty,
"
"					tqmlsh_rwk_sel_flag,
"
"					tqmlsh_rwk_sel_user,
"
"					tqmlsh_insrwk_proc_qty,
"
"					tqmlsh_insrwk_curproc_qty,
"
"					tqmlsh_reworked_qty,
"
"					tqmlsh_che_act_temp,
"
"					tqmlsh_hyd_mtr_val,
"
"					tqmlsh_hyd_mtr_std_val,
"
"					tqmlsh_spec_grv_pct,
"
"					tqmlsh_tar_lot_no,
"
"					tqmlsh_tar_sys_ls_no,
"
"					tqmlsh_org_lot_no,
"
"					tqmlsh_msl,
"
"					tqmlsh_osrwk_proc_qty,
"
"                                        tqmlsh_osrwk_curproc_qty,
"
"                                        tqmlsh_suplr_id,
"
"                                        tqmlsh_rtnd_qty,
"
"                                        tqmlsh_curproc_rtn_qty,
"
"                                        tqmlsh_mix_lot_no,
"
"                                        tqmlsh_cut_blank_qty,
"
"					tqmlsh_crate_id,
"
"					tqmlsh_no_of_coils,
"
"					tqmlsh_stk_rcpt_qty,
"
"					tqmlsh_stk_acpt_qty,
"
"					tqmlsh_stk_aod_qty,
"
"					tqmlsh_stk_rej_qty,
"
"					tqmlsh_stk_prim_rej_qty,
"
"					tqmlsh_stk_sec_rej_qty,
"
"					tqmlsh_baking_type,
"
"					tqmlsh_bak_qty,
"
"					tqmlsh_stk_bak_qty,
"
"					tqmlsh_rej_heat_no,
"
"					tqmlsh_post_prod_flag,
"
"					tqmlsh_heat_no,
"
"					tqmlsh_test_no,
"
"					tqmlsh_obs_rqrd_flag,
"
"					tqmlsh_qc_sys_ls_no,
"
"					tqmlsh_batch_no,
"
"					tqmlsh_unit_cost
"
"				       )
"
"    SELECT tqmls_bu,
"
"           tqmls_qc_no,
"
"           tqmls_qc_doc_seq_no,
"
"           tqmls_pln_seq_no,
"
"           tqmls_ls_type,
"
"           tqmls_lot_no,
"
"           tqmls_receipt_qty,
"
"           tqmls_accepted_qty,
"
"           tqmls_rejected_qty,
"
"           tqmls_aod_qty,
"
"           tqmls_sample_qty,
"
"           tqmls_serial_no,
"
"           tqmls_rej_flag,
"
"           tqmls_sample_flag,
"
"           tqmls_prim_rej_qty,
"
"           tqmls_secon_rej_qty,
"
"           tqmls_qc_doc_sub_seq_no,
"
"           tqmls_source_type,
"
"           tqmls_source_id,
"
"           tqmls_bin_id,
"
"           tqmls_cre_by,
"
"	   tqmls_cre_emp_id,
"
"	   tqmls_cre_ip_addr,
"
"	   tqmls_cre_os_user,
"
"           tqmls_cre_date,
"
"           tqmls_upd_by,
"
"	   tqmls_upd_emp_id,
"
"	   tqmls_upd_ip_addr,
"
"	   tqmls_upd_os_user,
"
"           tqmls_upd_date,
"
"           tqmls_rec_pri_is_repair_qty,
"
"           tqmls_rec_sec_is_repair_qty,
"
"           tqmls_rec_pri_os_repair_qty,
"
"           tqmls_rec_sec_os_repair_qty,
"
"           tqmls_rec_pri_scrap_qty,
"
"           tqmls_rec_sec_scrap_qty,
"
"           tqmls_rec_pri_dis_ass_qty,
"
"           tqmls_rec_sec_dis_ass_qty,
"
"           tqmls_rec_pri_rtrn_qty,
"
"           tqmls_rec_sec_rtrn_qty,
"
"           tqmls_sys_ls_no,
"
"           tqmls_expiry_date,
"
"           tqmls_return_qty,
"
"           tqmls_rework_qty,
"
"           tqmls_prim_ret_qty,
"
"           tqmls_sec_ret_qty,
"
"           tqmls_prim_is_rwk_qty,
"
"           tqmls_prim_os_rwk_qty,
"
"           tqmls_sec_is_rwk_qty,
"
"           tqmls_sec_os_rwk_qty,
"
"           tqmls_shortage_qty,
"
"           tqmls_receipt_wt_qty,
"
"           tqmls_accept_wt_qty,
"
"           tqmls_reject_wt_qty,
"
"           tqmls_cone_wt,
"
"           tqmls_gross_wt,
"
"           tqmls_rej_curproc_qty,
"
"           tqmls_rej_proc_qty,
"
"           tqmls_rwk_sel_flag,
"
"           tqmls_rwk_sel_user,
"
"           tqmls_insrwk_proc_qty,
"
"           tqmls_insrwk_curproc_qty,
"
"           tqmls_reworked_qty,
"
"           tqmls_che_act_temp,
"
"           tqmls_hyd_mtr_val,
"
"           tqmls_hyd_mtr_std_val,
"
"           tqmls_spec_grv_pct,
"
"           tqmls_tar_lot_no,
"
"           tqmls_tar_sys_ls_no,
"
"           tqmls_org_lot_no,
"
"           tqmls_msl,
"
"           tqmls_osrwk_proc_qty,
"
"           tqmls_osrwk_curproc_qty,
"
"           tqmls_suplr_id,
"
"           tqmls_rtnd_qty,
"
"           tqmls_curproc_rtn_qty,
"
"           tqmls_mix_lot_no,
"
"           tqmls_cut_blank_qty,
"
"	   tqmls_crate_id,
"
"           tqmls_no_of_coils,
"
"           tqmls_stk_rcpt_qty,
"
"	   tqmls_stk_acpt_qty,
"
"	   tqmls_stk_aod_qty,
"
"	   tqmls_stk_rej_qty,
"
"	   tqmls_stk_prim_rej_qty,
"
"	   tqmls_stk_sec_rej_qty,
"
"           tqmls_baking_type,
"
"           tqmls_bak_qty,
"
"           tqmls_stk_bak_qty,
"
"           tqmls_rej_heat_no,
"
"           tqmls_post_prod_flag,
"
"	   tqmls_heat_no,
"
"	   tqmls_test_no,
"
"	   tqmls_obs_rqrd_flag,
"
"	   tqmls_qc_sys_ls_no,
"
"	   tqmls_batch_no,
"
"	   tqmls_unit_cost
"
"      FROM tqm_lot_serial_nos
"
"     WHERE tqmls_bu = p_bu
"
"       AND tqmls_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln_param_hist(tqlph_bu,
"
"				     tqlph_qc_no,
"
"				     tqlph_qc_seq_no,
"
"				     tqlph_seq_no,
"
"				     tqlph_param_type,
"
"				     tqlph_param_id,
"
"				     tqlph_test_id,
"
"				     tqlph_proc_id,
"
"				     tqlph_std_value_uom,
"
"				     tqlph_std_value,
"
"				     tqlph_tolr_from,
"
"				     tqlph_tolr_to,
"
"				     tqlph_spec_id,
"
"				     tqlph_inst_grp_id,
"
"				     tqlph_crit_flag,
"
"				     tqlph_cost_flag,
"
"				     tqlph_decid_falg,
"
"				     tqlph_xbar_fact,
"
"				     tqlph_rbar_up_fact,
"
"				     tqlph_rbar_lr_fact,
"
"				     tqlph_schart_fact,
"
"				     tqlph_cre_by,
"
"				     tqlph_cre_emp_id,
"
"				     tqlph_cre_ip_addr,
"
"				     tqlph_cre_os_user,
"
"				     tqlph_cre_date,
"
"				     tqlph_upd_by,
"
"				     tqlph_upd_emp_id,
"
"				     tqlph_upd_ip_addr,
"
"				     tqlph_upd_os_user,
"
"				     tqlph_upd_date,
"
"				     tqlph_gauge_id,
"
"				     tqlph_regular_lot,
"
"				     tqlph_sample_lot,
"
"				     tqlph_pilot_lot,
"
"				     tqlph_crit_type,
"
"				     tqlph_drawing_no,
"
"				     tqlph_drawing_rev,
"
"				     tqlph_std_val,
"
"				     tqlph_var_from,
"
"				     tqlph_var_to,
"
"				     tqlph_type,
"
"				     tqlph_operator,
"
"				     tqlph_std_operator,
"
"				     tqlph_tc_mant_flag,
"
"				     tqlph_ref,
"
"				     tqlph_obsrv_rqrd_flag,
"
"				     tqlph_exp_flag,
"
"				     tqlph_accpt_rej,
"
"				     tqlph_loc,
"
"				     tqlph_report_no,
"
"				     tqlph_appr_by,
"
"				     tqlph_source,
"
"				     tqlph_obser_level,
"
"				     tqlph_no_of_smpl,
"
"                                     tqlph_no_of_obs,
"
"                                     tqlph_mode_of_insp)
"
"    SELECT tqlp_bu,
"
"	   tqlp_qc_no,
"
"	   tqlp_qc_seq_no,
"
"	   tqlp_seq_no,
"
"	   tqlp_param_type,
"
"	   tqlp_param_id,
"
"	   tqlp_test_id,
"
"	   tqlp_proc_id,
"
"	   tqlp_std_value_uom,
"
"	   tqlp_std_value,
"
"	   tqlp_tolr_from,
"
"	   tqlp_tolr_to,
"
"	   tqlp_spec_id,
"
"	   tqlp_inst_grp_id,
"
"	   tqlp_crit_flag,
"
"	   tqlp_cost_flag,
"
"	   tqlp_decid_falg,
"
"	   tqlp_xbar_fact,
"
"	   tqlp_rbar_up_fact,
"
"	   tqlp_rbar_lr_fact,
"
"	   tqlp_schart_fact,
"
"	   tqlp_cre_by,
"
"	   tqlp_cre_emp_id,
"
"	   tqlp_cre_ip_addr,
"
"	   tqlp_cre_os_user,
"
"	   tqlp_cre_date,
"
"	   tqlp_upd_by,
"
"	   tqlp_upd_emp_id,
"
"	   tqlp_upd_ip_addr,
"
"	   tqlp_upd_os_user,
"
"	   tqlp_upd_date,
"
"	   tqlp_gauge_id,
"
"	   tqlp_regular_lot,
"
"	   tqlp_sample_lot,
"
"	   tqlp_pilot_lot,
"
"	   tqlp_crit_type,
"
"	   tqlp_drawing_no,
"
"	   tqlp_drawing_rev,
"
"	   tqlp_std_val,
"
"	   tqlp_var_from,
"
"	   tqlp_var_to,
"
"	   tqlp_type,
"
"	   tqlp_operator,
"
"	   tqlp_std_operator,
"
"	   tqlp_tc_mant_flag,
"
"	   tqlp_ref,
"
"	   tqlp_obsrv_rqrd_flag,
"
"	   tqlp_exp_flag,
"
"	   tqlp_accpt_rej,
"
"	   tqlp_loc,
"
"	   tqlp_report_no,
"
"	   tqlp_appr_by,
"
"	   tqlp_source,
"
"	   tqlp_obser_level,
"
"	   tqlp_no_of_smpl,
"
"           tqlp_no_of_obs,
"
"           tqlp_mode_of_insp
"
"      FROM tqm_qc_ln_param
"
"     WHERE tqlp_bu = p_bu
"
"       AND tqlp_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_observ_hist(tqobh_bu,
"
"				   tqobh_qc_no,
"
"				   tqobh_qc_doc_seq_no,
"
"				   tqobh_pln_seq_no,
"
"				   tqobh_sample_no,
"
"				   tqobh_observ_no,
"
"				   tqobh_param_id,
"
"				   tqobh_value,
"
"				   tqobh_spec_id,
"
"				   tqobh_std_value,
"
"				   tqobh_std_value_uom,
"
"				   tqobh_tolr_from,
"
"				   tqobh_tolr_to,
"
"				   tqobh_std_spec_id,
"
"				   tqobh_insp_emp_id,
"
"				   tqobh_qc_attained,
"
"				   tqobh_cre_by,
"
"				   tqobh_cre_emp_id,
"
"				   tqobh_cre_ip_addr,
"
"				   tqobh_cre_os_user,
"
"				   tqobh_cre_date,
"
"				   tqobh_upd_by,
"
"				   tqobh_upd_emp_id,
"
"				   tqobh_upd_ip_addr,
"
"				   tqobh_upd_os_user,
"
"				   tqobh_upd_date,
"
"				   tqobh_drw_no,
"
"				   tqobh_drw_rev,
"
"				   tqobh_accept_qty,
"
"				   tqobh_reject_qty,
"
"				   tqobh_operator,
"
"				   tqobh_print_seq_no,
"
"				   tqobh_tc_mant_flag,
"
"				   tqobh_tc_chk_flag,
"
"				   tqobh_lot_no,
"
"				   tqobh_ref,
"
"				   tqobh_text_value,
"
"				   tqobh_param_type,
"
"				   tqobh_spec_desc,
"
"				   tqobh_std_spec_desc,
"
"				   tqobh_heat_no,
"
"				   tqobh_ls_seq_no,
"
"				   tqobh_std_val_text,
"
"				   tqobh_test_no,
"
"				   tqobh_obser_level
"
"				  )
"
"    SELECT tqob_bu,
"
"	   tqob_qc_no,
"
"	   tqob_qc_doc_seq_no,
"
"	   tqob_pln_seq_no,
"
"	   tqob_sample_no,
"
"	   tqob_observ_no,
"
"	   tqob_param_id,
"
"	   tqob_value,
"
"	   tqob_spec_id,
"
"	   tqob_std_value,
"
"	   tqob_std_value_uom,
"
"	   tqob_tolr_from,
"
"	   tqob_tolr_to,
"
"	   tqob_std_spec_id,
"
"	   tqob_insp_emp_id,
"
"	   tqob_qc_attained,
"
"	   tqob_cre_by,
"
"	   tqob_cre_emp_id,
"
"	   tqob_cre_ip_addr,
"
"	   tqob_cre_os_user,
"
"	   tqob_cre_date,
"
"	   tqob_upd_by,
"
"	   tqob_upd_emp_id,
"
"	   tqob_upd_ip_addr,
"
"	   tqob_upd_os_user,
"
"	   tqob_upd_date,
"
"	   tqob_drw_no,
"
"	   tqob_drw_rev,
"
"	   tqob_accept_qty,
"
"	   tqob_reject_qty,
"
"	   tqob_operator,
"
"	   tqob_print_seq_no,
"
"	   tqob_tc_mant_flag,
"
"	   tqob_tc_chk_flag,
"
"	   tqob_lot_no,
"
"	   tqob_ref,
"
"	   tqob_text_value,
"
"	   tqob_param_type,
"
"	   tqob_spec_desc,
"
"	   tqob_std_spec_desc,
"
"	   tqob_heat_no,
"
"	   tqob_ls_seq_no,
"
"	   tqob_std_val_text,
"
"	   tqob_test_no,
"
"	   tqob_obser_level
"
"      FROM tqm_qc_observ
"
"     WHERE tqob_bu = p_bu
"
"       AND tqob_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_param_dtls_hist(tqpdh_bu,
"
"				       tqpdh_qc_no,
"
"				       tqpdh_qc_seq_no,
"
"				       tqpdh_seq_no,
"
"				       tqpdh_sub_seq_no,
"
"				       tqpdh_sample_no,
"
"				       tqpdh_xbar_mean,
"
"				       tqpdh_xbar_ucl,
"
"				       tqpdh_xbar_lcl,
"
"				       tqpdh_rbar_mean,
"
"				       tqpdh_rbar_ucl,
"
"				       tqpdh_rbar_lcl,
"
"				       tqpdh_cre_by,
"
"				       tqpdh_cre_emp_id,
"
"				       tqpdh_cre_ip_addr,
"
"				       tqpdh_cre_os_user,
"
"				       tqpdh_cre_date,
"
"				       tqpdh_upd_by,
"
"				       tqpdh_upd_emp_id,
"
"				       tqpdh_upd_ip_addr,
"
"				       tqpdh_upd_os_user,
"
"				       tqpdh_upd_date
"
"				      )
"
"    SELECT tqpd_bu,
"
"           tqpd_qc_no,
"
"           tqpd_qc_seq_no,
"
"           tqpd_seq_no,
"
"           tqpd_sub_seq_no,
"
"           tqpd_sample_no,
"
"           tqpd_xbar_mean,
"
"           tqpd_xbar_ucl,
"
"           tqpd_xbar_lcl,
"
"           tqpd_rbar_mean,
"
"           tqpd_rbar_ucl,
"
"           tqpd_rbar_lcl,
"
"           tqpd_cre_by,
"
"	   tqpd_cre_emp_id,
"
"	   tqpd_cre_ip_addr,
"
"	   tqpd_cre_os_user,
"
"           tqpd_cre_date,
"
"           tqpd_upd_by,
"
"           tqpd_upd_emp_id,
"
"           tqpd_upd_ip_addr,
"
"           tqpd_upd_os_user,
"
"           tqpd_upd_date
"
"      FROM tqm_qc_param_dtls
"
"     WHERE tqpd_bu = p_bu
"
"       AND tqpd_qc_pfx = p_qc_pfx
"
"       AND tqpd_qc_no = p_qc_no
"
"       AND tqpd_qc_rev = p_qc_rev;
"
"
"
"    /*INSERT INTO tqm_suplr_test_po_doc_hist(tstpdh_bu,
"
"					   tstpdh_plnt,
"
"					   tstpdh_qc_no,
"
"					   tstpdh_seq_no,
"
"					   tstpdh_sub_seq_no,
"
"					   tstpdh_suplr_id,
"
"					   tstpdh_prod_id,
"
"					   tstpdh_prod_rev,
"
"					   tstpdh_po_pfx,
"
"					   tstpdh_po_no,
"
"					   tstpdh_result,
"
"					   tstpdh_cre_by,
"
"					   tstpdh_cre_emp_id,
"
"					   tstpdh_cre_ip_addr,
"
"					   tstpdh_cre_os_user,
"
"					   tstpdh_cre_date,
"
"					   tstpdh_upd_by,
"
"					   tstpdh_upd_emp_id,
"
"					   tstpdh_upd_ip_addr,
"
"					   tstpdh_upd_os_user,
"
"					   tstpdh_upd_date
"
"					  )
"
"    SELECT tstpd_bu,
"
"           tstpd_plnt,
"
"           tstpd_qc_no,
"
"           tstpd_seq_no,
"
"           tstpd_sub_seq_no,
"
"           tstpd_suplr_id,
"
"           tstpd_prod_id,
"
"           tstpd_prod_rev,
"
"           tstpd_po_pfx,
"
"           tstpd_po_no,
"
"           tstpd_result,
"
"           tstpd_cre_by,
"
"	   tstpd_cre_emp_id,
"
"	   tstpd_cre_ip_addr,
"
"	   tstpd_cre_os_user,
"
"           tstpd_cre_date,
"
"           tstpd_upd_by,
"
"	   tstpd_upd_emp_id,
"
"	   tstpd_upd_ip_addr,
"
"	   tstpd_upd_os_user,
"
"           tstpd_upd_date
"
"      FROM tqm_suplr_test_po_doc
"
"     WHERE tstpd_bu = p_bu
"
"       AND tstpd_qc_no = p_qc_no;*/
"
"
"
"    INSERT INTO tqm_qc_defects_hist(tqdfcth_bu,
"
"				    tqdfcth_qc_no,
"
"				    tqdfcth_qc_doc_seq_no,
"
"				    tqdfcth_seq_no,
"
"				    tqdfcth_dfct_id,
"
"				    tqdfcth_dfct_type,
"
"				    tqdfcth_dfct_qty,
"
"				    tqdfcth_pln_seq_no,
"
"				    tqdfcth_cre_by,
"
"				    tqdfcth_cre_emp_id,
"
"				    tqdfcth_cre_ip_addr,
"
"				    tqdfcth_cre_os_user,
"
"				    tqdfcth_cre_date,
"
"				    tqdfcth_upd_by,
"
"				    tqdfcth_upd_emp_id,
"
"				    tqdfcth_upd_ip_addr,
"
"				    tqdfcth_upd_os_user,
"
"				    tqdfcth_upd_date,
"
"				    tqdfcth_prim_dfct_qty,
"
"				    tqdfcth_sec_dfct_qty,
"
"				    tqdfcth_sys_ls_no,
"
"				    tqdfcth_lot_no,
"
"				    tqdfcth_ser_no,
"
"				    tqdfcth_remarks,
"
"				    tqdfcth_crate_id
"
"				   )
"
"    SELECT tqdfct_bu,
"
"	   tqdfct_qc_no,
"
"	   tqdfct_qc_doc_seq_no,
"
"	   tqdfct_seq_no,
"
"	   tqdfct_dfct_id,
"
"	   tqdfct_dfct_type,
"
"	   tqdfct_dfct_qty,
"
"	   tqdfct_pln_seq_no,
"
"	   tqdfct_cre_by,
"
"	   tqdfct_cre_emp_id,
"
"	   tqdfct_cre_ip_addr,
"
"	   tqdfct_cre_os_user,
"
"	   tqdfct_cre_date,
"
"	   tqdfct_upd_by,
"
"	   tqdfct_upd_emp_id,
"
"	   tqdfct_upd_ip_addr,
"
"	   tqdfct_upd_os_user,
"
"	   tqdfct_upd_date,
"
"	   tqdfct_prim_dfct_qty,
"
"	   tqdfct_sec_dfct_qty,
"
"	   tqdfct_sys_ls_no,
"
"	   tqdfct_lot_no,
"
"	   tqdfct_ser_no,
"
"	   tqdfct_remarks,
"
"	   tqdfct_crate_id
"
"      FROM tqm_qc_defects
"
"     WHERE tqdfct_bu = p_bu
"
"       AND tqdfct_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO tqm_qc_defect_pos_hist(tqdph_bu,
"
"	                               tqdph_plnt,
"
"	                               tqdph_qc_no,
"
"	                               tqdph_line_no,
"
"	                               tqdph_dfct_seq_no,
"
"	                               tqdph_seq_no,
"
"	                               tqdph_qc_pos_id,
"
"	                               tqdph_cav_no,
"
"	                               tqdph_qty,
"
"	                               tqdph_cre_by,
"
"				       tqdph_cre_emp_id,
"
"				       tqdph_cre_ip_addr,
"
"				       tqdph_cre_os_user,
"
"	                               tqdph_cre_date,
"
"	                               tqdph_upd_by,
"
"				       tqdph_upd_emp_id,
"
"				       tqdph_upd_ip_addr,
"
"				       tqdph_upd_os_user,
"
"	                               tqdph_upd_date
"
"				      )
"
"    SELECT tqdp_bu,
"
"	   tqdp_plnt,
"
"	   tqdp_qc_no,
"
"	   tqdp_line_no,
"
"	   tqdp_dfct_seq_no,
"
"	   tqdp_seq_no,
"
"	   tqdp_qc_pos_id,
"
"	   tqdp_cav_no,
"
"	   tqdp_qty,
"
"	   tqdp_cre_by,
"
"	   tqdp_cre_emp_id,
"
"	   tqdp_cre_ip_addr,
"
"	   tqdp_cre_os_user,
"
"	   tqdp_cre_date,
"
"	   tqdp_upd_by,
"
"	   tqdp_upd_emp_id,
"
"	   tqdp_upd_ip_addr,
"
"	   tqdp_upd_os_user,
"
"	   tqdp_upd_date
"
"      FROM tqm_qc_defect_pos
"
"     WHERE tqdp_bu = p_bu
"
"       AND tqdp_qc_pfx = p_qc_pfx
"
"       AND tqdp_qc_no = p_qc_no
"
"       AND tqdp_qc_rev_no = p_qc_rev;*/
"
"
"
"    INSERT INTO tqm_qc_defect_cause_hist(tqdch_bu,
"
"					 tqdch_qc_no,
"
"					 tqdch_qc_doc_seq_no,
"
"					 tqdch_dfct_seq_no,
"
"					 tqdch_cause_id,
"
"					 tqdch_cre_by,
"
"					 tqdch_cre_emp_id,
"
"					 tqdch_cre_ip_addr,
"
"					 tqdch_cre_os_user,
"
"					 tqdch_cre_date,
"
"					 tqdch_upd_by,
"
"					 tqdch_upd_emp_id,
"
"					 tqdch_upd_ip_addr,
"
"					 tqdch_upd_os_user,
"
"					 tqdch_upd_date
"
"					)
"
"    SELECT tqdc_bu,
"
"	   tqdc_qc_no,
"
"	   tqdc_qc_doc_seq_no,
"
"	   tqdc_dfct_seq_no,
"
"	   tqdc_cause_id,
"
"	   tqdc_cre_by,
"
"	   tqdc_cre_emp_id,
"
"	   tqdc_cre_ip_addr,
"
"	   tqdc_cre_os_user,
"
"	   tqdc_cre_date,
"
"	   tqdc_upd_by,
"
"	   tqdc_upd_emp_id,
"
"	   tqdc_upd_ip_addr,
"
"	   tqdc_upd_os_user,
"
"	   tqdc_upd_date
"
"      FROM tqm_qc_defect_cause
"
"     WHERE tqdc_bu = p_bu
"
"       AND tqdc_qc_pfx = p_qc_pfx
"
"       AND tqdc_qc_no = p_qc_no
"
"       AND tqdc_qc_rev = p_qc_rev;
"
"
"
"    INSERT INTO tqm_qc_defect_actions_hist(tqdah_bu,
"
"					   tqdah_qc_no,
"
"					   tqdah_qc_doc_seq_no,
"
"					   tqdah_dfct_seq_no,
"
"					   tqdah_actn_id,
"
"					   tqdah_cre_by,
"
"					   tqdah_cre_date,
"
"					   tqdah_upd_by,
"
"					   tqdah_upd_date
"
"					  )
"
"    SELECT tqda_bu,
"
"	   tqda_qc_no,
"
"	   tqda_qc_doc_seq_no,
"
"	   tqda_dfct_seq_no,
"
"	   tqda_actn_id,
"
"	   tqda_cre_by,
"
"	   tqda_cre_date,
"
"	   tqda_upd_by,
"
"	   tqda_upd_date
"
"      FROM tqm_qc_defect_actions
"
"     WHERE tqda_bu = p_bu
"
"       AND tqda_qc_pfx = p_qc_pfx
"
"       AND tqda_qc_no = p_qc_no
"
"       AND tqda_qc_rev = p_qc_rev;
"
"
"
"
"
"    INSERT INTO tqm_qc_dev_hist(tqdevh_bu,
"
"				tqdevh_qc_no,
"
"				tqdevh_qc_doc_seq_no,
"
"				tqdevh_seq_no,
"
"				tqdevh_aod_no,
"
"				tqdevh_dev_id,
"
"				tqdevh_dev_qty,
"
"				tqdevh_pln_seq_no,
"
"				tqdevh_cre_by,
"
"				tqdevh_cre_date,
"
"				tqdevh_upd_by,
"
"				tqdevh_upd_date,
"
"				tqdevh_sys_ls_no,
"
"				tqdevh_crate_id
"
"			       )
"
"    SELECT tqdev_bu,
"
"	   tqdev_qc_no,
"
"	   tqdev_qc_doc_seq_no,
"
"	   tqdev_seq_no,
"
"	   tqdev_aod_no,
"
"	   tqdev_dev_id,
"
"	   tqdev_dev_qty,
"
"	   tqdev_pln_seq_no,
"
"	   tqdev_cre_by,
"
"	   tqdev_cre_date,
"
"	   tqdev_upd_by,
"
"	   tqdev_upd_date,
"
"	   tqdev_sys_ls_no,
"
"	   tqdev_crate_id
"
"      FROM tqm_qc_dev
"
"     WHERE tqdev_bu = p_bu
"
"       AND tqdev_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO tqm_qc_dev_det_hist(tqdevdh_bu,
"
"				    tqdevdh_qc_no,
"
"				    tqdevdh_qc_doc_seq_no,
"
"				    tqdevdh_seq_no,
"
"				    tqdevdh_param_id,
"
"				    tqdevdh_std_value,
"
"				    tqdevdh_std_value_uom,
"
"				    tqdevdh_tolr_from,
"
"				    tqdevdh_tolr_to,
"
"				    tqdevdh_std_spec_id,
"
"				    tqdevdh_observ_value,
"
"				    tqdevdh_observ_spec_id,
"
"				    tqdevdh_reference,
"
"				    tqdevdh_pln_seq_no,
"
"				    tqdevdh_cre_by,
"
"				    tqdevdh_cre_date,
"
"				    tqdevdh_upd_by,
"
"				    tqdevdh_upd_date
"
"				   )
"
"    SELECT tqdevd_bu,
"
"	   tqdevd_qc_no,
"
"	   tqdevd_qc_doc_seq_no,
"
"	   tqdevd_seq_no,
"
"	   tqdevd_param_id,
"
"	   tqdevd_std_value,
"
"	   tqdevd_std_value_uom,
"
"	   tqdevd_tolr_from,
"
"	   tqdevd_tolr_to,
"
"	   tqdevd_std_spec_id,
"
"	   tqdevd_observ_value,
"
"	   tqdevd_observ_spec_id,
"
"	   tqdevd_reference,
"
"	   tqdevd_pln_seq_no,
"
"	   tqdevd_cre_by,
"
"	   tqdevd_cre_date,
"
"	   tqdevd_upd_by,
"
"	   tqdevd_upd_date
"
"      FROM tqm_qc_dev_det
"
"     WHERE tqdevd_bu = p_bu
"
"       AND tqdevd_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_res_hist(tqrh_bu,
"
"				tqrh_qc_no,
"
"				tqrh_qc_seq_no,
"
"				tqrh_sub_seq_no,
"
"				tqrh_res_id,
"
"				tqrh_hours,
"
"				tqrh_mins,
"
"				tqrh_rates,
"
"				tqrh_cre_by,
"
"				tqrh_cre_date,
"
"				tqrh_upd_by,
"
"				tqrh_upd_date
"
"			       )
"
"    SELECT tqr_bu,
"
"	   tqr_qc_no,
"
"	   tqr_qc_seq_no,
"
"	   tqr_sub_seq_no,
"
"	   tqr_res_id,
"
"	   tqr_hours,
"
"	   tqr_mins,
"
"	   tqr_rates,
"
"	   tqr_cre_by,
"
"	   tqr_cre_date,
"
"	   tqr_upd_by,
"
"	   tqr_upd_date
"
"      FROM tqm_qc_res
"
"     WHERE tqr_bu = p_bu
"
"       AND tqr_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_res_usage_hist(tqruh_bu,
"
"				   tqruh_qc_no,
"
"				   tqruh_qc_seq_no,
"
"				   tqruh_sub_seq_no,
"
"				   tqruh_res_id,
"
"				   tqruh_hours,
"
"				   tqruh_mins,
"
"				   tqruh_rates,
"
"				   tqruh_cre_by,
"
"				   tqruh_cre_date,
"
"				   tqruh_upd_by,
"
"				   tqruh_upd_date
"
"				  )
"
"    SELECT tqru_bu,
"
"	   tqru_qc_no,
"
"	   tqru_qc_seq_no,
"
"	   tqru_sub_seq_no,
"
"	   tqru_res_id,
"
"	   tqru_hours,
"
"	   tqru_mins,
"
"	   tqru_rates,
"
"	   tqru_cre_by,
"
"	   tqru_cre_date,
"
"	   tqru_upd_by,
"
"	   tqru_upd_date
"
"      FROM tqm_res_usage
"
"     WHERE tqru_bu = p_bu
"
"       AND tqru_qc_no = p_qc_no;*/
"
"
"
"    INSERT INTO tqm_qc_process_hist(tqph_bu,
"
"				    tqph_qc_no,
"
"				    tqph_seq_no,
"
"				    tqph_sub_seq_no,
"
"				    tqph_proc_id,
"
"				    tqph_proc_seq_no,
"
"				    tqph_cre_by,
"
"				    tqph_cre_date,
"
"				    tqph_upd_by,
"
"				    tqph_upd_date
"
"				   )
"
"    SELECT tqp_bu,
"
"	   tqp_qc_no,
"
"	   tqp_seq_no,
"
"	   tqp_sub_seq_no,
"
"	   tqp_proc_id,
"
"	   tqp_proc_seq_no,
"
"	   tqp_cre_by,
"
"	   tqp_cre_date,
"
"	   tqp_upd_by,
"
"	   tqp_upd_date
"
"      FROM tqm_qc_process
"
"     WHERE tqp_bu = p_bu
"
"       AND tqp_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_item_seg_prodn_hist(tqisph_bu,
"
"					   tqisph_plnt,
"
"					   tqisph_qc_no,
"
"					   tqisph_seq_no,
"
"					   tqisph_sub_seq_no,
"
"					   tqisph_prod_id,
"
"					   tqisph_prod_rev,
"
"					   tqisph_qty,
"
"					   tqisph_cre_by,
"
"					   tqisph_cre_date,
"
"					   tqisph_upd_by,
"
"					   tqisph_upd_date,
"
"					   tqisph_vou_no
"
"					  )
"
"    SELECT tqisp_bu,
"
"	   tqisp_plnt,
"
"	   tqisp_qc_no,
"
"	   tqisp_seq_no,
"
"	   tqisp_sub_seq_no,
"
"	   tqisp_prod_id,
"
"	   tqisp_prod_rev,
"
"	   tqisp_qty,
"
"	   tqisp_cre_by,
"
"	   tqisp_cre_date,
"
"	   tqisp_upd_by,
"
"	   tqisp_upd_date,
"
"	   tqisp_vou_no
"
"      FROM tqm_qc_item_seg_prodn
"
"     WHERE tqisp_bu = p_bu
"
"       AND tqisp_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO pre_dispatch_put_away_hist(pdpah_bu,
"
"					   pdpah_plnt,
"
"					   pdpah_seq_no,
"
"					   pdpah_qc_no,
"
"					   pdpah_qc_seq_no,
"
"					   pdpah_store_id,
"
"					   pdpah_bin_id,
"
"					   pdpah_lot_no,
"
"					   pdpah_serial_no,
"
"					   pdpah_qty,
"
"					   pdpah_prod_id,
"
"					   pdpah_prod_rev,
"
"					   pdpah_bin_flag,
"
"					   pdpah_mode,
"
"					   pdpah_cre_by,
"
"					   pdpah_cre_date,
"
"					   pdpah_upd_by,
"
"					   pdpah_upd_date,
"
"					   pdpah_qc_rev,
"
"					   pdpah_sys_ls_no,
"
"					   pdpah_crate_id
"
"					  )
"
"    SELECT pdpa_bu,
"
"	   pdpa_plnt,
"
"	   pdpa_seq_no,
"
"	   pdpa_qc_no,
"
"	   pdpa_qc_seq_no,
"
"	   pdpa_store_id,
"
"	   pdpa_bin_id,
"
"	   pdpa_lot_no,
"
"	   pdpa_serial_no,
"
"	   pdpa_qty,
"
"	   pdpa_prod_id,
"
"	   pdpa_prod_rev,
"
"	   pdpa_bin_flag,
"
"	   pdpa_mode,
"
"	   pdpa_cre_by,
"
"	   pdpa_cre_date,
"
"	   pdpa_upd_by,
"
"	   pdpa_upd_date,
"
"	   pdpa_qc_rev,
"
"	   pdpa_sys_ls_no,
"
"	   pdpa_crate_id
"
"      FROM pre_dispatch_put_away
"
"     WHERE pdpa_bu = p_bu
"
"       AND pdpa_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_prod_test_cert_hist(tqptch_bu,
"
"				           tqptch_plnt,
"
"				           tqptch_qc_no,
"
"				           tqptch_qc_seq_no,
"
"				           tqptch_sub_seq_no,
"
"				           tqptch_tc_id,
"
"				           tqptch_cre_by,
"
"				           tqptch_cre_date,
"
"				           tqptch_upd_by,
"
"				           tqptch_upd_date,
"
"				           tqptch_test_cert_no,
"
"				           tqptch_cert_rcvd_flag
"
"					  )
"
"    SELECT tqptc_bu,
"
"	   tqptc_plnt,
"
"	   tqptc_qc_no,
"
"	   tqptc_qc_seq_no,
"
"	   tqptc_sub_seq_no,
"
"	   tqptc_tc_id,
"
"	   tqptc_cre_by,
"
"	   tqptc_cre_date,
"
"	   tqptc_upd_by,
"
"	   tqptc_upd_date,
"
"	   tqptc_test_cert_no,
"
"	   tqptc_cert_rcvd_flag
"
"      FROM tqm_qc_prod_test_cert
"
"     WHERE tqptc_bu = p_bu
"
"       AND tqptc_qc_no = p_qc_no;*/
"
"
"
"    INSERT INTO tqm_qc_obsr_exp_hist(tqoeh_bu,
"
"				     tqoeh_qc_no,
"
"				     tqoeh_seq_no,
"
"				     tqoeh_ln_seq_no,
"
"				     tqoeh_prod_id,
"
"				     tqoeh_prod_rev,
"
"				     tqoeh_param_id,
"
"				     tqoeh_samp_no,
"
"				     tqoeh_obsr_no,
"
"				     tqoeh_exp_ref
"
"				    )
"
"    SELECT tqoe_bu,
"
"	   tqoe_qc_no,
"
"	   tqoe_seq_no,
"
"	   tqoe_ln_seq_no,
"
"	   tqoe_prod_id,
"
"	   tqoe_prod_rev,
"
"	   tqoe_param_id,
"
"	   tqoe_samp_no,
"
"	   tqoe_obsr_no,
"
"	   tqoe_exp_ref
"
"      FROM tqm_qc_obsr_exp
"
"     WHERE tqoe_bu = p_bu
"
"       AND tqoe_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO tqm_qc_hd_attr_hist(tqhdah_bu,
"
"				    tqhdah_qc_no,
"
"				    tqhdah_seq_no,
"
"				    tqhdah_attr_id,
"
"				    tqhdah_cre_by,
"
"				    tqhdah_cre_date,
"
"				    tqhdah_upd_by,
"
"				    tqhdah_upd_date
"
"				   )
"
"    SELECT tqhda_bu,
"
"	   tqhda_qc_no,
"
"	   tqhda_seq_no,
"
"	   tqhda_attr_id,
"
"	   tqhda_cre_by,
"
"	   tqhda_cre_date,
"
"	   tqhda_upd_by,
"
"	   tqhda_upd_date
"
"      FROM tqm_qc_hd_attr
"
"     WHERE tqhda_bu = p_bu
"
"       AND tqhda_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_hd_attr_notes_hist(tqhdanh_bu,
"
"					  tqhdanh_qc_no,
"
"					  tqhdanh_seq_no,
"
"					  tqhdanh_sub_seq_no,
"
"					  tqhdanh_note,
"
"					  tqhdanh_cre_by,
"
"					  tqhdanh_cre_date,
"
"					  tqhdanh_upd_by,
"
"					  tqhdanh_upd_date
"
"					 )
"
"    SELECT tqhdan_bu,
"
"	   tqhdan_qc_no,
"
"	   tqhdan_seq_no,
"
"	   tqhdan_sub_seq_no,
"
"	   tqhdan_note,
"
"	   tqhdan_cre_by,
"
"	   tqhdan_cre_date,
"
"	   tqhdan_upd_by,
"
"	   tqhdan_upd_date
"
"      FROM tqm_qc_hd_attr_notes
"
"     WHERE tqhdan_bu = p_bu
"
"       AND tqhdan_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln_attr_hist(tqlnah_bu,
"
"				    tqlnah_qc_no,
"
"				    tqlnah_qc_seq_no,
"
"				    tqlnah_seq_no,
"
"				    tqlnah_attr_id,
"
"				    tqlnah_cre_by,
"
"				    tqlnah_cre_date,
"
"				    tqlnah_upd_by,
"
"				    tqlnah_upd_date
"
"				   )
"
"    SELECT tqlna_bu,
"
"	   tqlna_qc_no,
"
"	   tqlna_qc_seq_no,
"
"	   tqlna_seq_no,
"
"	   tqlna_attr_id,
"
"	   tqlna_cre_by,
"
"	   tqlna_cre_date,
"
"	   tqlna_upd_by,
"
"	   tqlna_upd_date
"
"      FROM tqm_qc_ln_attr
"
"     WHERE tqlna_bu = p_bu
"
"       AND tqlna_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln_attr_notes_hist(tqlnanh_bu,
"
"					  tqlnanh_qc_no,
"
"					  tqlnanh_qc_seq_no,
"
"					  tqlnanh_seq_no,
"
"					  tqlnanh_sub_seq_no,
"
"					  tqlnanh_notes,
"
"					  tqlnanh_cre_by,
"
"					  tqlnanh_cre_date,
"
"					  tqlnanh_upd_by,
"
"					  tqlnanh_upd_date
"
"					 )
"
"    SELECT tqlnan_bu,
"
"	   tqlnan_qc_no,
"
"	   tqlnan_qc_seq_no,
"
"	   tqlnan_seq_no,
"
"	   tqlnan_sub_seq_no,
"
"	   tqlnan_notes,
"
"	   tqlnan_cre_by,
"
"	   tqlnan_cre_date,
"
"	   tqlnan_upd_by,
"
"	   tqlnan_upd_date
"
"      FROM tqm_qc_ln_attr_notes
"
"     WHERE tqlnan_bu = p_bu
"
"       AND tqlnan_qc_no = p_qc_no;*/
"
"
"
"    /*DELETE FROM tqm_qc_ln_attr_notes
"
"     WHERE tqlnan_bu = p_bu
"
"       AND tqlnan_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_ln_attr
"
"     WHERE tqlna_bu = p_bu
"
"       AND tqlna_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_hd_attr_notes
"
"     WHERE tqhdan_bu = p_bu
"
"       AND tqhdan_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_hd_attr
"
"     WHERE tqhda_bu = p_bu
"
"       AND tqhda_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_obsr_exp
"
"     WHERE tqoe_bu = p_bu
"
"       AND tqoe_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_qc_prod_test_cert
"
"     WHERE tqptc_bu = p_bu
"
"       AND tqptc_qc_no = p_qc_no;
"
"
"
"    DELETE FROM pre_dispatch_put_away
"
"     WHERE pdpa_bu = p_bu
"
"       AND pdpa_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_item_seg_prodn
"
"     WHERE tqisp_bu = p_bu
"
"       AND tqisp_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_process
"
"     WHERE tqp_bu = p_bu
"
"       AND tqp_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_res_usage
"
"     WHERE tqru_bu = p_bu
"
"       AND tqru_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_res
"
"     WHERE tqr_bu = p_bu
"
"       AND tqr_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_dev_det
"
"     WHERE tqdevd_bu = p_bu
"
"       AND tqdevd_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_dev
"
"     WHERE tqdev_bu = p_bu
"
"       AND tqdev_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_defect_actions
"
"     WHERE tqda_bu = p_bu
"
"       AND tqda_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_defect_cause
"
"     WHERE tqdc_bu = p_bu
"
"       AND tqdc_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_qc_defect_pos
"
"     WHERE tqdp_bu = p_bu
"
"       AND tqdp_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_defects
"
"     WHERE tqdfct_bu = p_bu
"
"       AND tqdfct_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_suplr_test_po_doc
"
"     WHERE tstpd_bu = p_bu
"
"       AND tstpd_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_param_dtls
"
"     WHERE tqpd_bu = p_bu
"
"       AND tqpd_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_observ
"
"     WHERE tqob_bu = p_bu
"
"       AND tqob_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_ln_param
"
"     WHERE tqlp_bu = p_bu
"
"       AND tqlp_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_lot_serial_nos
"
"     WHERE tqmls_bu = p_bu
"
"       AND tqmls_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_ln
"
"     WHERE tqln_bu = p_bu
"
"       AND tqln_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_hd
"
"     WHERE tqhd_bu = p_bu
"
"       AND tqhd_qc_no = p_qc_no;
"
"
"
"  END proc_ins_qc_hist;
"
"
"
"  PROCEDURE proc_rev_qc_hist(p_bu	tqm_qc_hd.tqhd_bu%TYPE,
"
"			     p_qc_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"			     p_qc_no	tqm_qc_hd.tqhd_qc_no%TYPE,
"
"			     p_qc_rev	tqm_qc_hd.tqhd_qc_rev%TYPE
"
"			    )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO tqm_qc_hd(tqhd_bu,
"
"			       tqhd_qc_no,
"
"			       tqhd_date,
"
"			       tqhd_year,
"
"			       tqhd_period,
"
"			       tqhd_accp_date,
"
"			       tqhd_accp_year,
"
"			       tqhd_accp_period,
"
"			       tqhd_insp_mode,
"
"			       tqhd_qc_type,
"
"			       tqhd_qc_id,
"
"			       tqhd_appr_id,
"
"			       tqhd_appr_pos,
"
"			       tqhd_appr_date,
"
"			       tqhd_appr_commnt,
"
"			       tqhd_control_person,
"
"			       tqhd_doc_action,
"
"			       tqhd_reference,
"
"			       tqhd_status,
"
"			       tqhd_plnt,
"
"			       tqhd_proc_id,
"
"			       tqhd_qlty_incharge,
"
"			       tqhd_cust_id,
"
"			       tqhd_third_party,
"
"			       tqhd_qc_ref,
"
"			       tqhd_cre_by,
"
"			       tqhd_cre_date,
"
"			       tqhd_upd_by,
"
"			       tqhd_upd_date,
"
"			       tqhd_ref_unit,
"
"			       tqhd_qc_desc,
"
"			       tqhd_so_ref,
"
"			       tqhd_shift_id,
"
"			       tqhd_mach_id,
"
"			       tqhd_insp_loc,
"
"			       tqhd_mov_ncr_doc_flag,
"
"			       tqhd_qc_compl_date,
"
"			       tqhd_qc_shift_id,
"
"			       tqhd_cust_ref,
"
"			       tqhd_aoi_mchn_id,
"
"			       tqhd_aoi_oper_id,
"
"			       tqhd_inchrg_id,
"
"			       tqhd_insp_type,
"
"			       tqhd_fbi_ed_time,
"
"			       tqhd_fbi_st_time,
"
"			       tqhd_fb_ver_flag,
"
"			       tqhd_aoi_ref,
"
"			       tqhd_prelim_acc_flag,
"
"			       tqhd_plnt_loc_id,
"
"			       tqhd_plnt_loc_name,
"
"			       tqhd_vcd,
"
"			       tqhd_dmt,
"
"			       tqhd_pitch_mic,
"
"			       tqhd_go,
"
"			       tqhd_no_go,
"
"			       tqhd_prof_pjr,
"
"			       tqhd_plunger,
"
"			       tqhd_lever,
"
"			       tqhd_rm_sou_name,
"
"	                       tqhd_prod_id,
"
"	                       tqhd_prod_rev,
"
"	                       tqhd_prod_desc,
"
"	                       tqhd_rcpt_qty,
"
"	                       tqhd_acpt_qty,
"
"	                       tqhd_aod_qty,
"
"	                       tqhd_rej_qty,
"
"	                       tqhd_prim_rej_qty,
"
"	                       tqhd_secon_rej_qty,
"
"	                       tqhd_lot_no,
"
"	                       tqhd_ser_no,
"
"	                       tqhd_heat_no,
"
"	                       tqhd_test_no,
"
"	                       tqhd_uom,
"
"	                       tqhd_matl_type,
"
"	                       tqhd_tar_sf_code,
"
"                               tqhd_tar_oprn_seq,
"
"                               tqhd_tar_proc_id,
"
"	                       tqhd_sou_sf_code,
"
"                               tqhd_sou_oprn_seq,
"
"                               tqhd_sou_proc_id,
"
"                               tqhd_std_code  ,
"
"	                       tqhd_appr_by  ,
"
"                               tqhd_appr_emp_id  ,
"
"                               tqhd_appr_ip_addr,
"
"                               tqhd_appr_os_user ,
"
"                               tqhd_appr_upd_date,
"
"	                       tqhd_rec_pri_is_repair_qty,
"
"	                       tqhd_rec_sec_is_repair_qty,
"
"	                       tqhd_rec_pri_os_repair_qty,
"
"	                       tqhd_rec_sec_os_repair_qty,
"
"	                       tqhd_rec_pri_scrap_qty,
"
"	                       tqhd_rec_sec_scrap_qty,
"
"	                       tqhd_rec_pri_dis_ass_qty,
"
"	                       tqhd_rec_sec_dis_ass_qty,
"
"	                       tqhd_rec_pri_rtrn_qty,
"
"	                       tqhd_rec_sec_rtrn_qty,
"
"                               tqhd_smpl_size_var,
"
"                               tqhd_smpl_size_attr,
"
"                               tqhd_obs_no_var,
"
"                               tqhd_obs_no_attr,
"
"                               tqhd_smpl_size_var_ent,
"
"                               tqhd_smpl_size_attr_ent,
"
"                               tqhd_obs_no_var_ent,
"
"                               tqhd_obs_no_attr_ent,
"
"			       tqhd_exp_date,
"
"			       tqhd_mfg_date
"
"			      )
"
"    SELECT tqhdh_bu,
"
"	   tqhdh_qc_no,
"
"	   tqhdh_date,
"
"	   tqhdh_year,
"
"	   tqhdh_period,
"
"	   tqhdh_accp_date,
"
"	   tqhdh_accp_year,
"
"	   tqhdh_accp_period,
"
"	   tqhdh_insp_mode,
"
"	   tqhdh_qc_type,
"
"	   tqhdh_qc_id,
"
"	   tqhdh_appr_id,
"
"	   tqhdh_appr_pos,
"
"	   tqhdh_appr_date,
"
"	   tqhdh_appr_commnt,
"
"	   tqhdh_control_person,
"
"	   tqhdh_doc_action,
"
"	   tqhdh_reference,
"
"	   tqhdh_status,
"
"	   tqhdh_plnt,
"
"	   tqhdh_proc_id,
"
"	   tqhdh_qlty_incharge,
"
"	   tqhdh_cust_id,
"
"	   tqhdh_third_party,
"
"	   tqhdh_qc_ref,
"
"	   tqhdh_cre_by,
"
"	   tqhdh_cre_date,
"
"	   tqhdh_upd_by,
"
"	   tqhdh_upd_date,
"
"	   tqhdh_ref_unit,
"
"	   tqhdh_qc_desc,
"
"	   tqhdh_so_ref,
"
"	   tqhdh_shift_id,
"
"	   tqhdh_mach_id,
"
"	   tqhdh_insp_loc,
"
"	   tqhdh_mov_ncr_doc_flag,
"
"	   tqhdh_qc_compl_date,
"
"	   tqhdh_qc_shift_id,
"
"	   tqhdh_cust_ref,
"
"	   tqhdh_aoi_mchn_id,
"
"	   tqhdh_aoi_oper_id,
"
"	   tqhdh_inchrg_id,
"
"	   tqhdh_insp_type,
"
"	   tqhdh_fbi_ed_time,
"
"	   tqhdh_fbi_st_time,
"
"	   tqhdh_fb_ver_flag,
"
"	   tqhdh_aoi_ref,
"
"	   tqhdh_prelim_acc_flag,
"
"	   tqhdh_plnt_loc_id,
"
"	   tqhdh_plnt_loc_name,
"
"	   tqhdh_vcd,
"
"	   tqhdh_dmt,
"
"	   tqhdh_pitch_mic,
"
"	   tqhdh_go,
"
"	   tqhdh_no_go,
"
"	   tqhdh_prof_pjr,
"
"	   tqhdh_plunger,
"
"	   tqhdh_lever,
"
"           tqhdh_rm_sou_name,
"
"	   tqhdh_prod_id,
"
"	   tqhdh_prod_rev,
"
"	   tqhdh_prod_desc,
"
"	   tqhdh_rcpt_qty,
"
"	   tqhdh_acpt_qty,
"
"	   tqhdh_aod_qty,
"
"	   tqhdh_rej_qty,
"
"	   tqhdh_prim_rej_qty,
"
"	   tqhdh_secon_rej_qty,
"
"	   tqhdh_lot_no,
"
"	   tqhdh_ser_no,
"
"	   tqhdh_heat_no,
"
"	   tqhdh_test_no,
"
"	   tqhdh_uom,
"
"	   tqhdh_matl_type,
"
"	   tqhdh_tar_sf_code,
"
"           tqhdh_tar_oprn_seq,
"
"           tqhdh_tar_proc_id,
"
"	   tqhdh_sou_sf_code,
"
"           tqhdh_sou_oprn_seq,
"
"           tqhdh_sou_proc_id,
"
"           tqhdh_std_code  ,
"
"	   tqhdh_appr_by  ,
"
"           tqhdh_appr_emp_id  ,
"
"           tqhdh_appr_ip_addr,
"
"           tqhdh_appr_os_user ,
"
"           tqhdh_appr_upd_date,
"
"	   tqhdh_rec_pri_is_repair_qty,
"
"	   tqhdh_rec_sec_is_repair_qty,
"
"	   tqhdh_rec_pri_os_repair_qty,
"
"	   tqhdh_rec_sec_os_repair_qty,
"
"	   tqhdh_rec_pri_scrap_qty,
"
"	   tqhdh_rec_sec_scrap_qty,
"
"	   tqhdh_rec_pri_dis_ass_qty,
"
"	   tqhdh_rec_sec_dis_ass_qty,
"
"	   tqhdh_rec_pri_rtrn_qty,
"
"	   tqhdh_rec_sec_rtrn_qty,
"
"           tqhdh_smpl_size_var,
"
"           tqhdh_smpl_size_attr,
"
"           tqhdh_obs_no_var,
"
"           tqhdh_obs_no_attr,
"
"           tqhdh_smpl_size_var_ent,
"
"           tqhdh_smpl_size_attr_ent,
"
"           tqhdh_obs_no_var_ent,
"
"           tqhdh_obs_no_attr_ent,
"
"	   tqhdh_exp_date,
"
"	   tqhdh_mfg_date
"
"      FROM tqm_qc_hd_hist
"
"     WHERE tqhdh_bu = p_bu
"
"       AND tqhdh_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln(tqln_bu,
"
"			       tqln_qc_no,
"
"			       tqln_seq_no,
"
"			       tqln_pln_seq_no,
"
"			       tqln_prod_id,
"
"			       tqln_prod_rev,
"
"			       tqln_uom,
"
"			       tqln_no_of_samples,
"
"			       tqln_sample_qty,
"
"			       tqln_no_of_obs,
"
"			       tqln_std_acc_qty,
"
"			       tqln_std_rej_qty,
"
"			       tqln_attained_res,
"
"			       tqln_auto_flag,
"
"			       tqln_receipt_qty,
"
"			       tqln_accept_qty,
"
"			       tqln_aod_qty,
"
"			       tqln_reject_qty,
"
"			       tqln_control_person,
"
"			       tqln_reference,
"
"			       tqln_status,
"
"			       tqln_sales_sub_seq_no,
"
"			       tqln_segg_qty,
"
"			       tqln_segg_flag,
"
"			       tqln_accept_basis,
"
"			       tqln_rev_status,
"
"			       tqln_prim_rej_qty,
"
"			       tqln_secon_rej_qty,
"
"			       tqln_sw_pfx,
"
"			       tqln_sw_ord_no,
"
"			       tqln_qlty_person,
"
"			       tqln_compld_date,
"
"			       tqln_cre_by,
"
"			       tqln_cre_date,
"
"			       tqln_upd_by,
"
"			       tqln_upd_date,
"
"			       tqln_sal_inprocess_qty,
"
"			       tqln_sal_inv_qty,
"
"			       tqln_prod_uom,
"
"			       tqln_stk_receipt_qty,
"
"			       tqln_stk_accept_qty,
"
"			       tqln_stk_reject_qty,
"
"			       tqln_cert_rcvd_flag,
"
"			       tqln_cert_instr,
"
"			       tqln_cert_id,
"
"			       tqln_test_req_flag,
"
"			       tqln_sampling_time,
"
"			       tqln_resulting_time,
"
"			       tqln_prod_desc1,
"
"			       tqln_insp_pln_no,
"
"			       tqln_insp_pln_rev,
"
"			       tqln_ncr_flag,
"
"			       tqln_ncr_user,
"
"			       tqln_ncr_qty,
"
"			       tqln_smpl_size_var,
"
"			       tqln_smpl_size_attr,
"
"			       tqln_obs_no_var,
"
"			       tqln_obs_no_attr,
"
"			       tqln_smpl_size_var_ent,
"
"			       tqln_smpl_size_attr_ent,
"
"			       tqln_obs_no_var_ent,
"
"			       tqln_obs_no_attr_ent,
"
"			       tqln_test_cert_no,
"
"			       tqln_ge_doc_no,
"
"			       tqln_dc_no,
"
"			       tqln_dc_date,
"
"			       tqln_mat_type,
"
"			       tqln_spr_type,
"
"			       tqln_inv_inproc_qty,
"
"			       tqln_inv_qty,
"
"			       tqln_rec_pri_is_repair_qty,
"
"			       tqln_rec_sec_is_repair_qty,
"
"			       tqln_rec_pri_scrap_qty,
"
"			       tqln_rec_sec_scrap_qty,
"
"			       tqln_rec_pri_dis_ass_qty,
"
"			       tqln_rec_sec_dis_ass_qty,
"
"			       tqln_rec_pri_rtrn_qty,
"
"			       tqln_rec_sec_rtrn_qty,
"
"			       tqln_rec_sec_os_repair_qty,
"
"			       tqln_rec_pri_os_repair_qty,
"
"			       tqln_vou_pfx,
"
"			       tqln_vou_no,
"
"			       tqln_vou_line_no,
"
"			       tqln_prod_ord_no,
"
"			       tqln_sf_code,
"
"			       tqln_act_compld_date,
"
"			       tqln_start_date,
"
"			       tqln_end_date,
"
"			       tqln_so_type,
"
"			       tqln_so_pfx,
"
"			       tqln_so_no,
"
"			       tqln_so_seq_no,
"
"			       tqln_so_sub_seq_no,
"
"			       tqln_proj_id,
"
"			       tqln_task_id,
"
"			       tqln_stk_aod_qty,
"
"			       tqln_stk_prim_rej_qty,
"
"			       tqln_stk_sec_rej_qty,
"
"			       tqln_fines_pct,
"
"			       tqln_fines_qty,
"
"			       tqln_moisture_pct,
"
"			       tqln_moisture_qty,
"
"			       tqln_veh_no,
"
"			       tqln_insp_rpt_no,
"
"			       tqln_cut_blank_qty,
"
"			       tqln_mov_ncr_doc_flag,
"
"			       tqln_shortage_qty,
"
"			       tqln_shift_id,
"
"			       tqln_so_schld_desc,
"
"			       tqln_insp_id,
"
"			       tqln_attr_insp_id,
"
"			       tqln_aql,
"
"			       tqln_std_code,
"
"			       tqln_vou_sub_line,
"
"			       tqln_sand_cast_flag,
"
"			       tqln_qc_plan_no,
"
"			       tqln_qc_plan_rev,
"
"			       tqln_cust_drw_no,
"
"			       tqln_cust_drw_rev,
"
"			       tqln_insrwk_proc_qty,
"
"			       tqln_insrwk_curproc_qty,
"
"			       tqln_reworked_qty,
"
"			       tqln_rwk_sel_flag,
"
"			       tqln_rwk_sel_user,
"
"			       tqln_next_code,
"
"			       tqln_print_type,
"
"			       tqln_peel_method,
"
"			       tqln_fusing_time,
"
"			       tqln_temperature,
"
"			       tqln_pressure,
"
"			       tqln_th_comp_seq_no,
"
"			       tqln_conv_factor,
"
"			       tqln_qc_spec_rqrd_flag,
"
"			       tqln_mftr_id,
"
"			       tqln_mftr_part_no,
"
"			       tqln_rej_ref,
"
"			       tqln_can_ref,
"
"			       tqln_insp_rqst_pfx,
"
"			       tqln_insp_rqst_no,
"
"			       tqln_insp_rqst_seq_no,
"
"			       tqln_ls_uom_gen_type,
"
"			       tqln_bak_qty,
"
"			       tqln_stk_bak_qty,
"
"                               tqln_fab_item_type,
"
"                               tqln_thickness,
"
"                               tqln_width,
"
"                               tqln_length,
"
"                               tqln_height,
"
"                               tqln_outer_dia,
"
"                               tqln_inner_dia,
"
"                               tqln_density,
"
"			       tqln_rwk_vou_type,
"
"			       tqln_vou_date,
"
"			       tqln_unit_cost
"
"			      )
"
"    SELECT tqlnh_bu,
"
"	   tqlnh_qc_no,
"
"	   tqlnh_seq_no,
"
"	   tqlnh_pln_seq_no,
"
"	   tqlnh_prod_id,
"
"	   tqlnh_prod_rev,
"
"	   tqlnh_uom,
"
"	   tqlnh_no_of_samples,
"
"	   tqlnh_sample_qty,
"
"	   tqlnh_no_of_obs,
"
"	   tqlnh_std_acc_qty,
"
"	   tqlnh_std_rej_qty,
"
"	   tqlnh_attained_res,
"
"	   tqlnh_auto_flag,
"
"	   tqlnh_receipt_qty,
"
"	   tqlnh_accept_qty,
"
"	   tqlnh_aod_qty,
"
"	   tqlnh_reject_qty,
"
"	   tqlnh_control_person,
"
"	   tqlnh_reference,
"
"	   tqlnh_status,
"
"	   tqlnh_sales_sub_seq_no,
"
"	   tqlnh_segg_qty,
"
"	   tqlnh_segg_flag,
"
"	   tqlnh_accept_basis,
"
"	   tqlnh_rev_status,
"
"	   tqlnh_prim_rej_qty,
"
"	   tqlnh_secon_rej_qty,
"
"	   tqlnh_sw_pfx,
"
"	   tqlnh_sw_ord_no,
"
"	   tqlnh_qlty_person,
"
"	   tqlnh_compld_date,
"
"	   tqlnh_cre_by,
"
"	   tqlnh_cre_date,
"
"	   tqlnh_upd_by,
"
"	   tqlnh_upd_date,
"
"	   tqlnh_sal_inprocess_qty,
"
"	   tqlnh_sal_inv_qty,
"
"	   tqlnh_prod_uom,
"
"	   tqlnh_stk_receipt_qty,
"
"	   tqlnh_stk_accept_qty,
"
"	   tqlnh_stk_reject_qty,
"
"	   tqlnh_cert_rcvd_flag,
"
"	   tqlnh_cert_instr,
"
"	   tqlnh_cert_id,
"
"	   tqlnh_test_req_flag,
"
"	   tqlnh_sampling_time,
"
"	   tqlnh_resulting_time,
"
"	   tqlnh_prod_desc1,
"
"	   tqlnh_insp_pln_no,
"
"	   tqlnh_insp_pln_rev,
"
"	   tqlnh_ncr_flag,
"
"	   tqlnh_ncr_user,
"
"	   tqlnh_ncr_qty,
"
"	   tqlnh_smpl_size_var,
"
"	   tqlnh_smpl_size_attr,
"
"	   tqlnh_obs_no_var,
"
"	   tqlnh_obs_no_attr,
"
"	   tqlnh_smpl_size_var_ent,
"
"	   tqlnh_smpl_size_attr_ent,
"
"	   tqlnh_obs_no_var_ent,
"
"	   tqlnh_obs_no_attr_ent,
"
"	   tqlnh_test_cert_no,
"
"	   tqlnh_ge_doc_no,
"
"	   tqlnh_dc_no,
"
"	   tqlnh_dc_date,
"
"	   tqlnh_mat_type,
"
"	   tqlnh_spr_type,
"
"	   tqlnh_inv_inproc_qty,
"
"	   tqlnh_inv_qty,
"
"	   tqlnh_rec_pri_is_repair_qty,
"
"	   tqlnh_rec_sec_is_repair_qty,
"
"	   tqlnh_rec_pri_scrap_qty,
"
"	   tqlnh_rec_sec_scrap_qty,
"
"	   tqlnh_rec_pri_dis_ass_qty,
"
"	   tqlnh_rec_sec_dis_ass_qty,
"
"	   tqlnh_rec_pri_rtrn_qty,
"
"	   tqlnh_rec_sec_rtrn_qty,
"
"	   tqlnh_rec_sec_os_repair_qty,
"
"	   tqlnh_rec_pri_os_repair_qty,
"
"	   tqlnh_vou_pfx,
"
"	   tqlnh_vou_no,
"
"	   tqlnh_vou_line_no,
"
"	   tqlnh_prod_ord_no,
"
"	   tqlnh_sf_code,
"
"	   tqlnh_act_compld_date,
"
"	   tqlnh_start_date,
"
"	   tqlnh_end_date,
"
"	   tqlnh_so_type,
"
"	   tqlnh_so_pfx,
"
"	   tqlnh_so_no,
"
"	   tqlnh_so_seq_no,
"
"	   tqlnh_so_sub_seq_no,
"
"	   tqlnh_proj_id,
"
"	   tqlnh_task_id,
"
"	   tqlnh_stk_aod_qty,
"
"	   tqlnh_stk_prim_rej_qty,
"
"	   tqlnh_stk_sec_rej_qty,
"
"	   tqlnh_fines_pct,
"
"	   tqlnh_fines_qty,
"
"	   tqlnh_moisture_pct,
"
"	   tqlnh_moisture_qty,
"
"	   tqlnh_veh_no,
"
"	   tqlnh_insp_rpt_no,
"
"	   tqlnh_cut_blank_qty,
"
"	   tqlnh_mov_ncr_doc_flag,
"
"	   tqlnh_shortage_qty,
"
"	   tqlnh_shift_id,
"
"	   tqlnh_so_schld_desc,
"
"	   tqlnh_insp_id,
"
"	   tqlnh_attr_insp_id,
"
"	   tqlnh_aql,
"
"	   tqlnh_std_code,
"
"	   tqlnh_vou_sub_line,
"
"	   tqlnh_sand_cast_flag,
"
"	   tqlnh_qc_plan_no,
"
"	   tqlnh_qc_plan_rev,
"
"	   tqlnh_cust_drw_no,
"
"	   tqlnh_cust_drw_rev,
"
"	   tqlnh_insrwk_proc_qty,
"
"	   tqlnh_insrwk_curproc_qty,
"
"	   tqlnh_reworked_qty,
"
"	   tqlnh_rwk_sel_flag,
"
"	   tqlnh_rwk_sel_user,
"
"	   tqlnh_next_code,
"
"	   tqlnh_print_type,
"
"	   tqlnh_peel_method,
"
"	   tqlnh_fusing_time,
"
"	   tqlnh_temperature,
"
"	   tqlnh_pressure,
"
"	   tqlnh_th_comp_seq_no,
"
"	   tqlnh_conv_factor,
"
"	   tqlnh_qc_spec_rqrd_flag,
"
"	   tqlnh_mftr_id,
"
"	   tqlnh_mftr_part_no,
"
"	   tqlnh_rej_ref,
"
"	   tqlnh_can_ref,
"
"           tqlnh_insp_rqst_pfx,
"
"	   tqlnh_insp_rqst_no,
"
"	   tqlnh_insp_rqst_seq_no,
"
"	   tqlnh_ls_uom_gen_type,
"
"	   tqlnh_bak_qty,
"
"	   tqlnh_stk_bak_qty,
"
"           tqlnh_fab_item_type,
"
"           tqlnh_thickness,
"
"           tqlnh_width,
"
"           tqlnh_length,
"
"           tqlnh_height,
"
"           tqlnh_outer_dia,
"
"           tqlnh_inner_dia,
"
"           tqlnh_density,
"
"	   tqlnh_rwk_vou_type,
"
"	   tqlnh_vou_date,
"
"	   tqlnh_unit_cost
"
"      FROM tqm_qc_ln_hist
"
"     WHERE tqlnh_bu = p_bu
"
"       AND tqlnh_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_lot_serial_nos(tqmls_bu,
"
"				   tqmls_qc_no,
"
"				   tqmls_qc_doc_seq_no,
"
"				   tqmls_pln_seq_no,
"
"				   tqmls_ls_type,
"
"				   tqmls_lot_no,
"
"				   tqmls_receipt_qty,
"
"				   tqmls_accepted_qty,
"
"				   tqmls_rejected_qty,
"
"				   tqmls_aod_qty,
"
"				   tqmls_sample_qty,
"
"				   tqmls_serial_no,
"
"				   tqmls_rej_flag,
"
"				   tqmls_sample_flag,
"
"				   tqmls_prim_rej_qty,
"
"				   tqmls_secon_rej_qty,
"
"				   tqmls_qc_doc_sub_seq_no,
"
"				   tqmls_source_type,
"
"				   tqmls_source_id,
"
"				   tqmls_bin_id,
"
"				   tqmls_cre_by,
"
"				   tqmls_cre_date,
"
"				   tqmls_upd_by,
"
"				   tqmls_upd_date,
"
"				   tqmls_rec_pri_is_repair_qty,
"
"				   tqmls_rec_sec_is_repair_qty,
"
"				   tqmls_rec_pri_os_repair_qty,
"
"				   tqmls_rec_sec_os_repair_qty,
"
"				   tqmls_rec_pri_scrap_qty,
"
"				   tqmls_rec_sec_scrap_qty,
"
"				   tqmls_rec_pri_dis_ass_qty,
"
"				   tqmls_rec_sec_dis_ass_qty,
"
"				   tqmls_rec_pri_rtrn_qty,
"
"				   tqmls_rec_sec_rtrn_qty,
"
"				   tqmls_sys_ls_no,
"
"				   tqmls_expiry_date,
"
"				   tqmls_return_qty,
"
"				   tqmls_rework_qty,
"
"				   tqmls_prim_ret_qty,
"
"				   tqmls_sec_ret_qty,
"
"				   tqmls_prim_is_rwk_qty,
"
"				   tqmls_prim_os_rwk_qty,
"
"				   tqmls_sec_is_rwk_qty,
"
"				   tqmls_sec_os_rwk_qty,
"
"				   tqmls_shortage_qty,
"
"				   tqmls_receipt_wt_qty,
"
"				   tqmls_accept_wt_qty,
"
"				   tqmls_reject_wt_qty,
"
"				   tqmls_cone_wt,
"
"				   tqmls_gross_wt,
"
"				   tqmls_rej_curproc_qty,
"
"				   tqmls_rej_proc_qty,
"
"				   tqmls_rwk_sel_flag,
"
"				   tqmls_rwk_sel_user,
"
"				   tqmls_insrwk_proc_qty,
"
"				   tqmls_insrwk_curproc_qty,
"
"				   tqmls_reworked_qty,
"
"				   tqmls_che_act_temp,
"
"				   tqmls_hyd_mtr_val,
"
"				   tqmls_hyd_mtr_std_val,
"
"				   tqmls_spec_grv_pct,
"
"				   tqmls_tar_lot_no,
"
"				   tqmls_tar_sys_ls_no,
"
"				   tqmls_org_lot_no,
"
"				   tqmls_msl,
"
"				   tqmls_osrwk_proc_qty,
"
"                                   tqmls_osrwk_curproc_qty,
"
"                                   tqmls_suplr_id,
"
"                                   tqmls_rtnd_qty,
"
"                                   tqmls_curproc_rtn_qty,
"
"                                   tqmls_mix_lot_no,
"
"                                   tqmls_cut_blank_qty,
"
"				   tqmls_crate_id,
"
"				   tqmls_no_of_coils,
"
"				   tqmls_stk_rcpt_qty,
"
"				   tqmls_stk_acpt_qty,
"
"				   tqmls_stk_aod_qty,
"
"				   tqmls_stk_rej_qty,
"
"				   tqmls_stk_prim_rej_qty,
"
"				   tqmls_stk_sec_rej_qty,
"
"				   tqmls_baking_type,
"
"				   tqmls_bak_qty,
"
"				   tqmls_stk_bak_qty,
"
"                                   tqmls_rej_heat_no,
"
"				   tqmls_post_prod_flag,
"
"				   tqmls_heat_no,
"
"				   tqmls_test_no,
"
"				   tqmls_obs_rqrd_flag,
"
"				   tqmls_qc_sys_ls_no,
"
"				   tqmls_batch_no,
"
"				   tqmls_unit_cost
"
"				  )
"
"    SELECT tqmlsh_bu,
"
"           tqmlsh_qc_no,
"
"           tqmlsh_qc_doc_seq_no,
"
"           tqmlsh_pln_seq_no,
"
"           tqmlsh_ls_type,
"
"           tqmlsh_lot_no,
"
"           tqmlsh_receipt_qty,
"
"           tqmlsh_accepted_qty,
"
"           tqmlsh_rejected_qty,
"
"           tqmlsh_aod_qty,
"
"           tqmlsh_sample_qty,
"
"           tqmlsh_serial_no,
"
"           tqmlsh_rej_flag,
"
"           tqmlsh_sample_flag,
"
"           tqmlsh_prim_rej_qty,
"
"           tqmlsh_secon_rej_qty,
"
"           tqmlsh_qc_doc_sub_seq_no,
"
"           tqmlsh_source_type,
"
"           tqmlsh_source_id,
"
"           tqmlsh_bin_id,
"
"           tqmlsh_cre_by,
"
"           tqmlsh_cre_date,
"
"           tqmlsh_upd_by,
"
"           tqmlsh_upd_date,
"
"           tqmlsh_rec_pri_is_repair_qty,
"
"           tqmlsh_rec_sec_is_repair_qty,
"
"           tqmlsh_rec_pri_os_repair_qty,
"
"           tqmlsh_rec_sec_os_repair_qty,
"
"           tqmlsh_rec_pri_scrap_qty,
"
"           tqmlsh_rec_sec_scrap_qty,
"
"           tqmlsh_rec_pri_dis_ass_qty,
"
"           tqmlsh_rec_sec_dis_ass_qty,
"
"           tqmlsh_rec_pri_rtrn_qty,
"
"           tqmlsh_rec_sec_rtrn_qty,
"
"           tqmlsh_sys_ls_no,
"
"           tqmlsh_expiry_date,
"
"           tqmlsh_return_qty,
"
"           tqmlsh_rework_qty,
"
"           tqmlsh_prim_ret_qty,
"
"           tqmlsh_sec_ret_qty,
"
"           tqmlsh_prim_is_rwk_qty,
"
"           tqmlsh_prim_os_rwk_qty,
"
"           tqmlsh_sec_is_rwk_qty,
"
"           tqmlsh_sec_os_rwk_qty,
"
"           tqmlsh_shortage_qty,
"
"           tqmlsh_receipt_wt_qty,
"
"           tqmlsh_accept_wt_qty,
"
"           tqmlsh_reject_wt_qty,
"
"           tqmlsh_cone_wt,
"
"           tqmlsh_gross_wt,
"
"           tqmlsh_rej_curproc_qty,
"
"           tqmlsh_rej_proc_qty,
"
"           tqmlsh_rwk_sel_flag,
"
"           tqmlsh_rwk_sel_user,
"
"           tqmlsh_insrwk_proc_qty,
"
"           tqmlsh_insrwk_curproc_qty,
"
"           tqmlsh_reworked_qty,
"
"           tqmlsh_che_act_temp,
"
"           tqmlsh_hyd_mtr_val,
"
"           tqmlsh_hyd_mtr_std_val,
"
"           tqmlsh_spec_grv_pct,
"
"           tqmlsh_tar_lot_no,
"
"           tqmlsh_tar_sys_ls_no,
"
"           tqmlsh_org_lot_no,
"
"           tqmlsh_msl,
"
"           tqmlsh_osrwk_proc_qty,
"
"           tqmlsh_osrwk_curproc_qty,
"
"           tqmlsh_suplr_id,
"
"           tqmlsh_rtnd_qty,
"
"           tqmlsh_curproc_rtn_qty,
"
"           tqmlsh_mix_lot_no,
"
"           tqmlsh_cut_blank_qty,
"
"	   tqmlsh_crate_id,
"
"	   tqmlsh_no_of_coils,
"
"	   tqmlsh_stk_rcpt_qty,
"
"	   tqmlsh_stk_acpt_qty,
"
"	   tqmlsh_stk_aod_qty,
"
"	   tqmlsh_stk_rej_qty,
"
"	   tqmlsh_stk_prim_rej_qty,
"
"	   tqmlsh_stk_sec_rej_qty,
"
"	   tqmlsh_baking_type,
"
"	   tqmlsh_bak_qty,
"
"	   tqmlsh_stk_bak_qty,
"
"           tqmlsh_rej_heat_no,
"
"           tqmlsh_post_prod_flag,
"
"	   tqmlsh_heat_no,
"
"	   tqmlsh_test_no,
"
"	   tqmlsh_obs_rqrd_flag,
"
"	   tqmlsh_qc_sys_ls_no,
"
"	   tqmlsh_batch_no,
"
"	   tqmlsh_unit_cost
"
"      FROM tqm_lot_serial_nos_hist
"
"     WHERE tqmlsh_bu = p_bu
"
"       AND tqmlsh_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln_param(tqlp_bu,
"
"				     tqlp_qc_no,
"
"				     tqlp_qc_seq_no,
"
"				     tqlp_seq_no,
"
"				     tqlp_param_type,
"
"				     tqlp_param_id,
"
"				     tqlp_test_id,
"
"				     tqlp_proc_id,
"
"				     tqlp_std_value_uom,
"
"				     tqlp_std_value,
"
"				     tqlp_tolr_from,
"
"				     tqlp_tolr_to,
"
"				     tqlp_spec_id,
"
"				     tqlp_inst_grp_id,
"
"				     tqlp_crit_flag,
"
"				     tqlp_cost_flag,
"
"				     tqlp_decid_falg,
"
"				     tqlp_xbar_fact,
"
"				     tqlp_rbar_up_fact,
"
"				     tqlp_rbar_lr_fact,
"
"				     tqlp_schart_fact,
"
"				     tqlp_cre_by,
"
"				     tqlp_cre_date,
"
"				     tqlp_upd_by,
"
"				     tqlp_upd_date,
"
"				     tqlp_gauge_id,
"
"				     tqlp_regular_lot,
"
"				     tqlp_sample_lot,
"
"				     tqlp_pilot_lot,
"
"				     tqlp_crit_type,
"
"				     tqlp_drawing_no,
"
"				     tqlp_drawing_rev,
"
"				     tqlp_std_val,
"
"				     tqlp_var_from,
"
"				     tqlp_var_to,
"
"				     tqlp_type,
"
"				     tqlp_operator,
"
"				     tqlp_std_operator,
"
"				     tqlp_tc_mant_flag,
"
"				     tqlp_ref,
"
"				     tqlp_obsrv_rqrd_flag,
"
"				     tqlp_exp_flag,
"
"				     tqlp_accpt_rej,
"
"				     tqlp_loc,
"
"				     tqlp_report_no,
"
"				     tqlp_appr_by,
"
"				     tqlp_source,
"
"				     tqlp_obser_level,
"
"				     tqlp_no_of_smpl,
"
"                                     tqlp_no_of_obs,
"
"                                     tqlp_mode_of_insp
"
"				    )
"
"    SELECT tqlph_bu,
"
"	   tqlph_qc_no,
"
"	   tqlph_qc_seq_no,
"
"	   tqlph_seq_no,
"
"	   tqlph_param_type,
"
"	   tqlph_param_id,
"
"	   tqlph_test_id,
"
"	   tqlph_proc_id,
"
"	   tqlph_std_value_uom,
"
"	   tqlph_std_value,
"
"	   tqlph_tolr_from,
"
"	   tqlph_tolr_to,
"
"	   tqlph_spec_id,
"
"	   tqlph_inst_grp_id,
"
"	   tqlph_crit_flag,
"
"	   tqlph_cost_flag,
"
"	   tqlph_decid_falg,
"
"	   tqlph_xbar_fact,
"
"	   tqlph_rbar_up_fact,
"
"	   tqlph_rbar_lr_fact,
"
"	   tqlph_schart_fact,
"
"	   tqlph_cre_by,
"
"	   tqlph_cre_date,
"
"	   tqlph_upd_by,
"
"	   tqlph_upd_date,
"
"	   tqlph_gauge_id,
"
"	   tqlph_regular_lot,
"
"	   tqlph_sample_lot,
"
"	   tqlph_pilot_lot,
"
"	   tqlph_crit_type,
"
"	   tqlph_drawing_no,
"
"	   tqlph_drawing_rev,
"
"	   tqlph_std_val,
"
"	   tqlph_var_from,
"
"	   tqlph_var_to,
"
"	   tqlph_type,
"
"	   tqlph_operator,
"
"	   tqlph_std_operator,
"
"	   tqlph_tc_mant_flag,
"
"	   tqlph_ref,
"
"	   tqlph_obsrv_rqrd_flag,
"
"	   tqlph_exp_flag,
"
"	   tqlph_accpt_rej,
"
"	   tqlph_loc,
"
"	   tqlph_report_no,
"
"	   tqlph_appr_by,
"
"	   tqlph_source,
"
"	   tqlph_obser_level,
"
"	   tqlph_no_of_smpl,
"
"           tqlph_no_of_obs,
"
"           tqlph_mode_of_insp
"
"      FROM tqm_qc_ln_param_hist
"
"     WHERE tqlph_bu = p_bu
"
"       AND tqlph_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_observ(tqob_bu,
"
"				   tqob_qc_no,
"
"				   tqob_qc_doc_seq_no,
"
"				   tqob_pln_seq_no,
"
"				   tqob_sample_no,
"
"				   tqob_observ_no,
"
"				   tqob_param_id,
"
"				   tqob_value,
"
"				   tqob_spec_id,
"
"				   tqob_std_value,
"
"				   tqob_std_value_uom,
"
"				   tqob_tolr_from,
"
"				   tqob_tolr_to,
"
"				   tqob_std_spec_id,
"
"				   tqob_insp_emp_id,
"
"				   tqob_qc_attained,
"
"				   tqob_cre_by,
"
"				   tqob_cre_date,
"
"				   tqob_upd_by,
"
"				   tqob_upd_date,
"
"				   tqob_drw_no,
"
"				   tqob_drw_rev,
"
"				   tqob_accept_qty,
"
"				   tqob_reject_qty,
"
"				   tqob_operator,
"
"				   tqob_print_seq_no,
"
"				   tqob_tc_mant_flag,
"
"				   tqob_tc_chk_flag,
"
"				   tqob_lot_no,
"
"				   tqob_ref,
"
"				   tqob_text_value,
"
"				   tqob_param_type,
"
"				   tqob_spec_desc,
"
"				   tqob_std_spec_desc,
"
"				   tqob_heat_no,
"
"				   tqob_ls_seq_no,
"
"				   tqob_test_no,
"
"				   tqob_obser_level
"
"				  )
"
"    SELECT tqobh_bu,
"
"	   tqobh_qc_no,
"
"	   tqobh_qc_doc_seq_no,
"
"	   tqobh_pln_seq_no,
"
"	   tqobh_sample_no,
"
"	   tqobh_observ_no,
"
"	   tqobh_param_id,
"
"	   tqobh_value,
"
"	   tqobh_spec_id,
"
"	   tqobh_std_value,
"
"	   tqobh_std_value_uom,
"
"	   tqobh_tolr_from,
"
"	   tqobh_tolr_to,
"
"	   tqobh_std_spec_id,
"
"	   tqobh_insp_emp_id,
"
"	   tqobh_qc_attained,
"
"	   tqobh_cre_by,
"
"	   tqobh_cre_date,
"
"	   tqobh_upd_by,
"
"	   tqobh_upd_date,
"
"	   tqobh_drw_no,
"
"	   tqobh_drw_rev,
"
"	   tqobh_accept_qty,
"
"	   tqobh_reject_qty,
"
"	   tqobh_operator,
"
"	   tqobh_print_seq_no,
"
"	   tqobh_tc_mant_flag,
"
"	   tqobh_tc_chk_flag,
"
"	   tqobh_lot_no,
"
"	   tqobh_ref,
"
"	   tqobh_text_value,
"
"	   tqobh_param_type,
"
"	   tqobh_spec_desc,
"
"	   tqobh_std_spec_desc,
"
"	   tqobh_heat_no,
"
"	   tqobh_ls_seq_no,
"
"	   tqobh_test_no,
"
"	   tqobh_obser_level
"
"      FROM tqm_qc_observ_hist
"
"     WHERE tqobh_bu = p_bu
"
"       AND tqobh_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_param_dtls(tqpd_bu,
"
"				       tqpd_qc_no,
"
"				       tqpd_qc_seq_no,
"
"				       tqpd_seq_no,
"
"				       tqpd_sub_seq_no,
"
"				       tqpd_sample_no,
"
"				       tqpd_xbar_mean,
"
"				       tqpd_xbar_ucl,
"
"				       tqpd_xbar_lcl,
"
"				       tqpd_rbar_mean,
"
"				       tqpd_rbar_ucl,
"
"				       tqpd_rbar_lcl,
"
"				       tqpd_cre_by,
"
"				       tqpd_cre_date,
"
"				       tqpd_upd_by,
"
"				       tqpd_upd_date
"
"				      )
"
"    SELECT tqpdh_bu,
"
"           tqpdh_qc_no,
"
"           tqpdh_qc_seq_no,
"
"           tqpdh_seq_no,
"
"           tqpdh_sub_seq_no,
"
"           tqpdh_sample_no,
"
"           tqpdh_xbar_mean,
"
"           tqpdh_xbar_ucl,
"
"           tqpdh_xbar_lcl,
"
"           tqpdh_rbar_mean,
"
"           tqpdh_rbar_ucl,
"
"           tqpdh_rbar_lcl,
"
"           tqpdh_cre_by,
"
"           tqpdh_cre_date,
"
"           tqpdh_upd_by,
"
"           tqpdh_upd_date
"
"      FROM tqm_qc_param_dtls_hist
"
"     WHERE tqpdh_bu = p_bu
"
"       AND tqpdh_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO tqm_suplr_test_po_doc(tstpd_bu,
"
"					   tstpd_plnt,
"
"					   tstpd_qc_no,
"
"					   tstpd_seq_no,
"
"					   tstpd_sub_seq_no,
"
"					   tstpd_suplr_id,
"
"					   tstpd_prod_id,
"
"					   tstpd_prod_rev,
"
"					   tstpd_po_pfx,
"
"					   tstpd_po_no,
"
"					   tstpd_result,
"
"					   tstpd_cre_by,
"
"					   tstpd_cre_date,
"
"					   tstpd_upd_by,
"
"					   tstpd_upd_date
"
"					  )
"
"    SELECT tstpdh_bu,
"
"           tstpdh_plnt,
"
"           tstpdh_qc_no,
"
"           tstpdh_seq_no,
"
"           tstpdh_sub_seq_no,
"
"           tstpdh_suplr_id,
"
"           tstpdh_prod_id,
"
"           tstpdh_prod_rev,
"
"           tstpdh_po_pfx,
"
"           tstpdh_po_no,
"
"           tstpdh_result,
"
"           tstpdh_cre_by,
"
"           tstpdh_cre_date,
"
"           tstpdh_upd_by,
"
"           tstpdh_upd_date
"
"      FROM tqm_suplr_test_po_doc_hist
"
"     WHERE tstpdh_bu = p_bu
"
"       AND tstpdh_qc_no = p_qc_no;*/
"
"
"
"    INSERT INTO tqm_qc_defects(tqdfct_bu,
"
"				    tqdfct_qc_no,
"
"				    tqdfct_qc_doc_seq_no,
"
"				    tqdfct_seq_no,
"
"				    tqdfct_dfct_id,
"
"				    tqdfct_dfct_type,
"
"				    tqdfct_dfct_qty,
"
"				    tqdfct_pln_seq_no,
"
"				    tqdfct_cre_by,
"
"				    tqdfct_cre_date,
"
"				    tqdfct_upd_by,
"
"				    tqdfct_upd_date,
"
"				    tqdfct_prim_dfct_qty,
"
"				    tqdfct_sec_dfct_qty,
"
"				    tqdfct_sys_ls_no,
"
"				    tqdfct_lot_no,
"
"				    tqdfct_ser_no,
"
"				    tqdfct_remarks,
"
"				    tqdfct_crate_id
"
"				   )
"
"    SELECT tqdfcth_bu,
"
"	   tqdfcth_qc_no,
"
"	   tqdfcth_qc_doc_seq_no,
"
"	   tqdfcth_seq_no,
"
"	   tqdfcth_dfct_id,
"
"	   tqdfcth_dfct_type,
"
"	   tqdfcth_dfct_qty,
"
"	   tqdfcth_pln_seq_no,
"
"	   tqdfcth_cre_by,
"
"	   tqdfcth_cre_date,
"
"	   tqdfcth_upd_by,
"
"	   tqdfcth_upd_date,
"
"	   tqdfcth_prim_dfct_qty,
"
"	   tqdfcth_sec_dfct_qty,
"
"	   tqdfcth_sys_ls_no,
"
"	   tqdfcth_lot_no,
"
"	   tqdfcth_ser_no,
"
"	   tqdfcth_remarks,
"
"	   tqdfcth_crate_id
"
"      FROM tqm_qc_defects_hist
"
"     WHERE tqdfcth_bu = p_bu
"
"       AND tqdfcth_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO tqm_qc_defect_pos(tqdp_bu,
"
"	                               tqdp_plnt,
"
"	                               tqdp_qc_no,
"
"	                               tqdp_line_no,
"
"	                               tqdp_dfct_seq_no,
"
"	                               tqdp_seq_no,
"
"	                               tqdp_qc_pos_id,
"
"	                               tqdp_cav_no,
"
"	                               tqdp_qty,
"
"	                               tqdp_cre_by,
"
"	                               tqdp_cre_date,
"
"	                               tqdp_upd_by,
"
"	                               tqdp_upd_date
"
"				      )
"
"    SELECT tqdph_bu,
"
"	   tqdph_plnt,
"
"	   tqdph_qc_no,
"
"	   tqdph_line_no,
"
"	   tqdph_dfct_seq_no,
"
"	   tqdph_seq_no,
"
"	   tqdph_qc_pos_id,
"
"	   tqdph_cav_no,
"
"	   tqdph_qty,
"
"	   tqdph_cre_by,
"
"	   tqdph_cre_date,
"
"	   tqdph_upd_by,
"
"	   tqdph_upd_date
"
"      FROM tqm_qc_defect_pos_hist
"
"     WHERE tqdph_bu = p_bu
"
"       AND tqdph_qc_no = p_qc_no;*/
"
"
"
"    INSERT INTO tqm_qc_defect_cause(tqdc_bu,
"
"					 tqdc_qc_no,
"
"					 tqdc_qc_doc_seq_no,
"
"					 tqdc_dfct_seq_no,
"
"					 tqdc_cause_id,
"
"					 tqdc_cre_by,
"
"					 tqdc_cre_date,
"
"					 tqdc_upd_by,
"
"					 tqdc_upd_date
"
"					)
"
"    SELECT tqdch_bu,
"
"	   tqdch_qc_no,
"
"	   tqdch_qc_doc_seq_no,
"
"	   tqdch_dfct_seq_no,
"
"	   tqdch_cause_id,
"
"	   tqdch_cre_by,
"
"	   tqdch_cre_date,
"
"	   tqdch_upd_by,
"
"	   tqdch_upd_date
"
"      FROM tqm_qc_defect_cause_hist
"
"     WHERE tqdch_bu = p_bu
"
"       AND tqdch_qc_pfx = p_qc_pfx
"
"       AND tqdch_qc_no = p_qc_no
"
"       AND tqdch_qc_rev = p_qc_rev;
"
"
"
"    INSERT INTO tqm_qc_defect_actions(tqda_bu,
"
"					   tqda_qc_no,
"
"					   tqda_qc_doc_seq_no,
"
"					   tqda_dfct_seq_no,
"
"					   tqda_actn_id,
"
"					   tqda_cre_by,
"
"					   tqda_cre_date,
"
"					   tqda_upd_by,
"
"					   tqda_upd_date
"
"					  )
"
"    SELECT tqdah_bu,
"
"	   tqdah_qc_no,
"
"	   tqdah_qc_doc_seq_no,
"
"	   tqdah_dfct_seq_no,
"
"	   tqdah_actn_id,
"
"	   tqdah_cre_by,
"
"	   tqdah_cre_date,
"
"	   tqdah_upd_by,
"
"	   tqdah_upd_date
"
"      FROM tqm_qc_defect_actions_hist
"
"     WHERE tqdah_bu = p_bu
"
"       AND tqdah_qc_pfx = p_qc_pfx
"
"       AND tqdah_qc_no = p_qc_no
"
"       AND tqdah_qc_rev = p_qc_rev;
"
"
"
"
"
"    INSERT INTO tqm_qc_dev(tqdev_bu,
"
"				tqdev_qc_no,
"
"				tqdev_qc_doc_seq_no,
"
"				tqdev_seq_no,
"
"				tqdev_aod_no,
"
"				tqdev_dev_id,
"
"				tqdev_dev_qty,
"
"				tqdev_pln_seq_no,
"
"				tqdev_cre_by,
"
"				tqdev_cre_date,
"
"				tqdev_upd_by,
"
"				tqdev_upd_date,
"
"				tqdev_sys_ls_no,
"
"				tqdev_crate_id
"
"			       )
"
"    SELECT tqdevh_bu,
"
"	   tqdevh_qc_no,
"
"	   tqdevh_qc_doc_seq_no,
"
"	   tqdevh_seq_no,
"
"	   tqdevh_aod_no,
"
"	   tqdevh_dev_id,
"
"	   tqdevh_dev_qty,
"
"	   tqdevh_pln_seq_no,
"
"	   tqdevh_cre_by,
"
"	   tqdevh_cre_date,
"
"	   tqdevh_upd_by,
"
"	   tqdevh_upd_date,
"
"	   tqdevh_sys_ls_no,
"
"	   tqdevh_crate_id
"
"      FROM tqm_qc_dev_hist
"
"     WHERE tqdevh_bu = p_bu
"
"       AND tqdevh_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO tqm_qc_dev_det(tqdevd_bu,
"
"				    tqdevd_qc_no,
"
"				    tqdevd_qc_doc_seq_no,
"
"				    tqdevd_seq_no,
"
"				    tqdevd_param_id,
"
"				    tqdevd_std_value,
"
"				    tqdevd_std_value_uom,
"
"				    tqdevd_tolr_from,
"
"				    tqdevd_tolr_to,
"
"				    tqdevd_std_spec_id,
"
"				    tqdevd_observ_value,
"
"				    tqdevd_observ_spec_id,
"
"				    tqdevd_reference,
"
"				    tqdevd_pln_seq_no,
"
"				    tqdevd_cre_by,
"
"				    tqdevd_cre_date,
"
"				    tqdevd_upd_by,
"
"				    tqdevd_upd_date
"
"				   )
"
"    SELECT tqdevdh_bu,
"
"	   tqdevdh_qc_no,
"
"	   tqdevdh_qc_doc_seq_no,
"
"	   tqdevdh_seq_no,
"
"	   tqdevdh_param_id,
"
"	   tqdevdh_std_value,
"
"	   tqdevdh_std_value_uom,
"
"	   tqdevdh_tolr_from,
"
"	   tqdevdh_tolr_to,
"
"	   tqdevdh_std_spec_id,
"
"	   tqdevdh_observ_value,
"
"	   tqdevdh_observ_spec_id,
"
"	   tqdevdh_reference,
"
"	   tqdevdh_pln_seq_no,
"
"	   tqdevdh_cre_by,
"
"	   tqdevdh_cre_date,
"
"	   tqdevdh_upd_by,
"
"	   tqdevdh_upd_date
"
"      FROM tqm_qc_dev_det_hist
"
"     WHERE tqdevdh_bu = p_bu
"
"       AND tqdevdh_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_res(tqr_bu,
"
"				tqr_qc_no,
"
"				tqr_qc_seq_no,
"
"				tqr_sub_seq_no,
"
"				tqr_res_id,
"
"				tqr_hours,
"
"				tqr_mins,
"
"				tqr_rates,
"
"				tqr_cre_by,
"
"				tqr_cre_date,
"
"				tqr_upd_by,
"
"				tqr_upd_date
"
"			       )
"
"    SELECT tqrh_bu,
"
"	   tqrh_qc_no,
"
"	   tqrh_qc_seq_no,
"
"	   tqrh_sub_seq_no,
"
"	   tqrh_res_id,
"
"	   tqrh_hours,
"
"	   tqrh_mins,
"
"	   tqrh_rates,
"
"	   tqrh_cre_by,
"
"	   tqrh_cre_date,
"
"	   tqrh_upd_by,
"
"	   tqrh_upd_date
"
"      FROM tqm_qc_res_hist
"
"     WHERE tqrh_bu = p_bu
"
"       AND tqrh_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_res_usage(tqru_bu,
"
"				   tqru_qc_no,
"
"				   tqru_qc_seq_no,
"
"				   tqru_sub_seq_no,
"
"				   tqru_res_id,
"
"				   tqru_hours,
"
"				   tqru_mins,
"
"				   tqru_rates,
"
"				   tqru_cre_by,
"
"				   tqru_cre_date,
"
"				   tqru_upd_by,
"
"				   tqru_upd_date
"
"				  )
"
"    SELECT tqruh_bu,
"
"	   tqruh_qc_no,
"
"	   tqruh_qc_seq_no,
"
"	   tqruh_sub_seq_no,
"
"	   tqruh_res_id,
"
"	   tqruh_hours,
"
"	   tqruh_mins,
"
"	   tqruh_rates,
"
"	   tqruh_cre_by,
"
"	   tqruh_cre_date,
"
"	   tqruh_upd_by,
"
"	   tqruh_upd_date
"
"      FROM tqm_res_usage_hist
"
"     WHERE tqruh_bu = p_bu
"
"       AND tqruh_qc_no = p_qc_no;*/
"
"
"
"    INSERT INTO tqm_qc_process(tqp_bu,
"
"				    tqp_qc_no,
"
"				    tqp_seq_no,
"
"				    tqp_sub_seq_no,
"
"				    tqp_proc_id,
"
"				    tqp_proc_seq_no,
"
"				    tqp_cre_by,
"
"				    tqp_cre_date,
"
"				    tqp_upd_by,
"
"				    tqp_upd_date
"
"				   )
"
"    SELECT tqph_bu,
"
"	   tqph_qc_no,
"
"	   tqph_seq_no,
"
"	   tqph_sub_seq_no,
"
"	   tqph_proc_id,
"
"	   tqph_proc_seq_no,
"
"	   tqph_cre_by,
"
"	   tqph_cre_date,
"
"	   tqph_upd_by,
"
"	   tqph_upd_date
"
"      FROM tqm_qc_process_hist
"
"     WHERE tqph_bu = p_bu
"
"       AND tqph_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_item_seg_prodn(tqisp_bu,
"
"					   tqisp_plnt,
"
"					   tqisp_qc_no,
"
"					   tqisp_seq_no,
"
"					   tqisp_sub_seq_no,
"
"					   tqisp_prod_id,
"
"					   tqisp_prod_rev,
"
"					   tqisp_qty,
"
"					   tqisp_cre_by,
"
"					   tqisp_cre_date,
"
"					   tqisp_upd_by,
"
"					   tqisp_upd_date,
"
"					   tqisp_vou_no
"
"					  )
"
"    SELECT tqisph_bu,
"
"	   tqisph_plnt,
"
"	   tqisph_qc_no,
"
"	   tqisph_seq_no,
"
"	   tqisph_sub_seq_no,
"
"	   tqisph_prod_id,
"
"	   tqisph_prod_rev,
"
"	   tqisph_qty,
"
"	   tqisph_cre_by,
"
"	   tqisph_cre_date,
"
"	   tqisph_upd_by,
"
"	   tqisph_upd_date,
"
"	   tqisph_vou_no
"
"      FROM tqm_qc_item_seg_prodn_hist
"
"     WHERE tqisph_bu = p_bu
"
"       AND tqisph_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO pre_dispatch_put_away(pdpa_bu,
"
"					   pdpa_plnt,
"
"					   pdpa_seq_no,
"
"					   pdpa_qc_no,
"
"					   pdpa_qc_seq_no,
"
"					   pdpa_store_id,
"
"					   pdpa_bin_id,
"
"					   pdpa_lot_no,
"
"					   pdpa_serial_no,
"
"					   pdpa_qty,
"
"					   pdpa_prod_id,
"
"					   pdpa_prod_rev,
"
"					   pdpa_bin_flag,
"
"					   pdpa_mode,
"
"					   pdpa_cre_by,
"
"					   pdpa_cre_date,
"
"					   pdpa_upd_by,
"
"					   pdpa_upd_date,
"
"					   pdpa_qc_rev,
"
"					   pdpa_sys_ls_no,
"
"					   pdpa_crate_id
"
"					  )
"
"    SELECT pdpah_bu,
"
"	   pdpah_plnt,
"
"	   pdpah_seq_no,
"
"	   pdpah_qc_no,
"
"	   pdpah_qc_seq_no,
"
"	   pdpah_store_id,
"
"	   pdpah_bin_id,
"
"	   pdpah_lot_no,
"
"	   pdpah_serial_no,
"
"	   pdpah_qty,
"
"	   pdpah_prod_id,
"
"	   pdpah_prod_rev,
"
"	   pdpah_bin_flag,
"
"	   pdpah_mode,
"
"	   pdpah_cre_by,
"
"	   pdpah_cre_date,
"
"	   pdpah_upd_by,
"
"	   pdpah_upd_date,
"
"	   pdpah_qc_rev,
"
"	   pdpah_sys_ls_no,
"
"	   pdpah_crate_id
"
"      FROM pre_dispatch_put_away_hist
"
"     WHERE pdpah_bu = p_bu
"
"       AND pdpah_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_prod_test_cert(tqptc_bu,
"
"				           tqptc_plnt,
"
"				           tqptc_qc_no,
"
"				           tqptc_qc_seq_no,
"
"				           tqptc_sub_seq_no,
"
"				           tqptc_tc_id,
"
"				           tqptc_cre_by,
"
"				           tqptc_cre_date,
"
"				           tqptc_upd_by,
"
"				           tqptc_upd_date,
"
"				           tqptc_test_cert_no,
"
"				           tqptc_cert_rcvd_flag
"
"					  )
"
"    SELECT tqptch_bu,
"
"	   tqptch_plnt,
"
"	   tqptch_qc_no,
"
"	   tqptch_qc_seq_no,
"
"	   tqptch_sub_seq_no,
"
"	   tqptch_tc_id,
"
"	   tqptch_cre_by,
"
"	   tqptch_cre_date,
"
"	   tqptch_upd_by,
"
"	   tqptch_upd_date,
"
"	   tqptch_test_cert_no,
"
"	   tqptch_cert_rcvd_flag
"
"      FROM tqm_qc_prod_test_cert_hist
"
"     WHERE tqptch_bu = p_bu
"
"       AND tqptch_qc_no = p_qc_no;*/
"
"
"
"    INSERT INTO tqm_qc_obsr_exp(tqoe_bu,
"
"				     tqoe_qc_no,
"
"				     tqoe_seq_no,
"
"				     tqoe_ln_seq_no,
"
"				     tqoe_prod_id,
"
"				     tqoe_prod_rev,
"
"				     tqoe_param_id,
"
"				     tqoe_samp_no,
"
"				     tqoe_obsr_no,
"
"				     tqoe_exp_ref
"
"				    )
"
"    SELECT tqoeh_bu,
"
"	   tqoeh_qc_no,
"
"	   tqoeh_seq_no,
"
"	   tqoeh_ln_seq_no,
"
"	   tqoeh_prod_id,
"
"	   tqoeh_prod_rev,
"
"	   tqoeh_param_id,
"
"	   tqoeh_samp_no,
"
"	   tqoeh_obsr_no,
"
"	   tqoeh_exp_ref
"
"      FROM tqm_qc_obsr_exp_hist
"
"     WHERE tqoeh_bu = p_bu
"
"       AND tqoeh_qc_no = p_qc_no;
"
"
"
"    /*INSERT INTO tqm_qc_hd_attr(tqhda_bu,
"
"				    tqhda_qc_no,
"
"				    tqhda_seq_no,
"
"				    tqhda_attr_id,
"
"				    tqhda_cre_by,
"
"				    tqhda_cre_date,
"
"				    tqhda_upd_by,
"
"				    tqhda_upd_date
"
"				   )
"
"    SELECT tqhdah_bu,
"
"	   tqhdah_qc_no,
"
"	   tqhdah_seq_no,
"
"	   tqhdah_attr_id,
"
"	   tqhdah_cre_by,
"
"	   tqhdah_cre_date,
"
"	   tqhdah_upd_by,
"
"	   tqhdah_upd_date
"
"      FROM tqm_qc_hd_attr_hist
"
"     WHERE tqhdah_bu = p_bu
"
"       AND tqhdah_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_hd_attr_notes(tqhdan_bu,
"
"					  tqhdan_qc_no,
"
"					  tqhdan_seq_no,
"
"					  tqhdan_sub_seq_no,
"
"					  tqhdan_note,
"
"					  tqhdan_cre_by,
"
"					  tqhdan_cre_date,
"
"					  tqhdan_upd_by,
"
"					  tqhdan_upd_date
"
"					 )
"
"    SELECT tqhdanh_bu,
"
"	   tqhdanh_qc_no,
"
"	   tqhdanh_seq_no,
"
"	   tqhdanh_sub_seq_no,
"
"	   tqhdanh_note,
"
"	   tqhdanh_cre_by,
"
"	   tqhdanh_cre_date,
"
"	   tqhdanh_upd_by,
"
"	   tqhdanh_upd_date
"
"      FROM tqm_qc_hd_attr_notes_hist
"
"     WHERE tqhdanh_bu = p_bu
"
"       AND tqhdanh_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln_attr(tqlna_bu,
"
"				    tqlna_qc_no,
"
"				    tqlna_seq_no,
"
"				    tqlna_attr_id,
"
"				    tqlna_cre_by,
"
"				    tqlna_cre_date,
"
"				    tqlna_upd_by,
"
"				    tqlna_upd_date
"
"				   )
"
"    SELECT tqlnah_bu,
"
"	   tqlnah_qc_no,
"
"	   tqlnah_seq_no,
"
"	   tqlnah_attr_id,
"
"	   tqlnah_cre_by,
"
"	   tqlnah_cre_date,
"
"	   tqlnah_upd_by,
"
"	   tqlnah_upd_date
"
"      FROM tqm_qc_ln_attr_hist
"
"     WHERE tqlnah_bu = p_bu
"
"       AND tqlnah_qc_no = p_qc_no;
"
"
"
"    INSERT INTO tqm_qc_ln_attr_notes(tqlnan_bu,
"
"					  tqlnan_qc_no,
"
"					  tqlnan_seq_no,
"
"					  tqlnan_sub_seq_no,
"
"					  tqlnan_notes,
"
"					  tqlnan_cre_by,
"
"					  tqlnan_cre_date,
"
"					  tqlnan_upd_by,
"
"					  tqlnan_upd_date
"
"					 )
"
"    SELECT tqlnanh_bu,
"
"	   tqlnanh_qc_no,
"
"	   tqlnanh_seq_no,
"
"	   tqlnanh_sub_seq_no,
"
"	   tqlnanh_notes,
"
"	   tqlnanh_cre_by,
"
"	   tqlnanh_cre_date,
"
"	   tqlnanh_upd_by,
"
"	   tqlnanh_upd_date
"
"      FROM tqm_qc_ln_attr_notes_hist
"
"     WHERE tqlnanh_bu = p_bu
"
"       AND tqlnanh_qc_no = p_qc_no;*/
"
"
"
"    /*DELETE FROM tqm_qc_ln_attr_notes_hist
"
"     WHERE tqlnanh_bu = p_bu
"
"       AND tqlnanh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_ln_attr_hist
"
"     WHERE tqlnah_bu = p_bu
"
"       AND tqlnah_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_hd_attr_notes_hist
"
"     WHERE tqhdanh_bu = p_bu
"
"       AND tqhdanh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_hd_attr_hist
"
"     WHERE tqhdah_bu = p_bu
"
"       AND tqhdah_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_obsr_exp_hist
"
"     WHERE tqoeh_bu = p_bu
"
"       AND tqoeh_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_qc_prod_test_cert_hist
"
"     WHERE tqptch_bu = p_bu
"
"       AND tqptch_qc_no = p_qc_no;
"
"
"
"    DELETE FROM pre_dispatch_put_away_hist
"
"     WHERE pdpah_bu = p_bu
"
"       AND pdpah_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_item_seg_prodn_hist
"
"     WHERE tqisph_bu = p_bu
"
"       AND tqisph_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_process_hist
"
"     WHERE tqph_bu = p_bu
"
"       AND tqph_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_res_usage_hist
"
"     WHERE tqruh_bu = p_bu
"
"       AND tqruh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_res_hist
"
"     WHERE tqrh_bu = p_bu
"
"       AND tqrh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_dev_det_hist
"
"     WHERE tqdevdh_bu = p_bu
"
"       AND tqdevdh_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_dev_hist
"
"     WHERE tqdevh_bu = p_bu
"
"       AND tqdevh_qc_no = p_qc_no;
"
"
"
"
"
"    DELETE FROM tqm_qc_defect_actions_hist
"
"     WHERE tqdah_bu = p_bu
"
"       AND tqdah_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_defect_cause_hist
"
"     WHERE tqdch_bu = p_bu
"
"       AND tqdch_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_qc_defect_pos_hist
"
"     WHERE tqdph_bu = p_bu
"
"       AND tqdph_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_defects_hist
"
"     WHERE tqdfcth_bu = p_bu
"
"       AND tqdfcth_qc_no = p_qc_no;
"
"
"
"    /*DELETE FROM tqm_suplr_test_po_doc_hist
"
"     WHERE tstpdh_bu = p_bu
"
"       AND tstpdh_qc_no = p_qc_no;*/
"
"
"
"    DELETE FROM tqm_qc_param_dtls_hist
"
"     WHERE tqpdh_bu = p_bu
"
"       AND tqpdh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_observ_hist
"
"     WHERE tqobh_bu = p_bu
"
"       AND tqobh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_ln_param_hist
"
"     WHERE tqlph_bu = p_bu
"
"       AND tqlph_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_lot_serial_nos_hist
"
"     WHERE tqmlsh_bu = p_bu
"
"       AND tqmlsh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_ln_hist
"
"     WHERE tqlnh_bu = p_bu
"
"       AND tqlnh_qc_no = p_qc_no;
"
"
"
"    DELETE FROM tqm_qc_hd_hist
"
"     WHERE tqhdh_bu = p_bu
"
"       AND tqhdh_qc_no = p_qc_no;
"
"
"
"  END proc_rev_qc_hist;
"
"
"
"END pkg_insp_hist;"
/
