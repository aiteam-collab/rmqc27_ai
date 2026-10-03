CREATE OR REPLACE
"PACKAGE BODY pkg_inv_hist
"
"AS
"
"
"
"  PROCEDURE proc_ins_mr_hist(p_bu		inv_material_request_hd.imrhd_bu%TYPE,
"
"  			     p_rqst_no		inv_material_request_hd.imrhd_rqst_no%TYPE
"
"  			    )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO inv_material_request_hd_hist(imrhdh_bu,
"
"					     imrhdh_rqst_no,
"
"					     imrhdh_rqstto_store_id,
"
"					     imrhdh_rqst_date,
"
"					     imrhdh_year,
"
"					     imrhdh_period,
"
"					     imrhdh_rqstby_type,
"
"					     imrhdh_rqstby_id,
"
"					     imrhdh_status,
"
"					     imrhdh_reference,
"
"					     imrhdh_control_person,
"
"					     imrhdh_reqstr_id,
"
"					     imrhdh_reqstr_name,
"
"					     imrhdh_reqstr_pos_id,
"
"					     imrhdh_reqstr_pos_name,
"
"					     imrhdh_rqst_dept_id,
"
"					     imrhdh_apprvr_id,
"
"					     imrhdh_apprvr_name,
"
"					     imrhdh_apprvr_pos_id,
"
"					     imrhdh_apprvr_pos_name,
"
"					     imrhdh_apprvr_dept_id,
"
"					     imrhdh_apprvd_date,
"
"					     imrhdh_appr_flag,
"
"					     imrhdh_no_of_try,
"
"					     imrhdh_no_of_issues,
"
"					     imrhdh_rec_source,
"
"					     imrhdh_session_id,
"
"					     imrhdh_other_flag,
"
"					     imrhdh_plnt,
"
"					     imrhdh_frwd_date,
"
"					     imrhdh_source_flag,
"
"					     imrhdh_cre_by,
"
"					     imrhdh_cre_emp_id,
"
"					     imrhdh_cre_ip_addr,
"
"					     imrhdh_cre_os_user,
"
"					     imrhdh_cre_date,
"
"					     imrhdh_upd_by,
"
"					     imrhdh_upd_emp_id,
"
"					     imrhdh_upd_ip_addr,
"
"					     imrhdh_upd_os_user,
"
"					     imrhdh_upd_date,
"
"					     imrhdh_ref_unit,
"
"					     imrhdh_close_shrt_reason,
"
"					     imrhdh_iss_code,
"
"					     imrhdh_sel_flag,
"
"					     imrhdh_trace_action,
"
"					     imrhdh_trace_msg,
"
"					     imrhdh_ord_type,
"
"					     imrhdh_ord_no,
"
"					     imrhdh_sg_flag,
"
"					     imrhdh_ord_qty,
"
"					     imrhdh_oprn_id,
"
"					     imrhdh_work_center,
"
"					     imrhdh_equip_id,
"
"					     imrhdh_mix_doc_no,
"
"					     imrhdh_fcm_bl_id,
"
"					     imrhdh_fcm_proj_no,
"
"					     imrhdh_shift_id,
"
"					     imrhdh_aen_type,
"
"					     imrhdh_rqstby_entity,
"
"					     imrhdh_emp_id,
"
"				             imrhdh_plnt_loc_id,
"
"				             imrhdh_plnt_loc_name,
"
"                                             imrhdh_res_id,
"
"					     imrhdh_rqst_pfx
"
"					    )
"
"			              SELECT imrhd_bu,
"
"					     imrhd_rqst_no,
"
"					     imrhd_rqstto_store_id,
"
"					     imrhd_rqst_date,
"
"					     imrhd_year,
"
"					     imrhd_period,
"
"					     imrhd_rqstby_type,
"
"					     imrhd_rqstby_id,
"
"					     imrhd_status,
"
"					     imrhd_reference,
"
"					     imrhd_control_person,
"
"					     imrhd_reqstr_id,
"
"					     imrhd_reqstr_name,
"
"					     imrhd_reqstr_pos_id,
"
"					     imrhd_reqstr_pos_name,
"
"					     imrhd_rqst_dept_id,
"
"					     imrhd_apprvr_id,
"
"					     imrhd_apprvr_name,
"
"					     imrhd_apprvr_pos_id,
"
"					     imrhd_apprvr_pos_name,
"
"					     imrhd_apprvr_dept_id,
"
"					     imrhd_apprvd_date,
"
"					     imrhd_appr_flag,
"
"					     imrhd_no_of_try,
"
"					     imrhd_no_of_issues,
"
"					     imrhd_rec_source,
"
"					     imrhd_session_id,
"
"					     imrhd_other_flag,
"
"					     imrhd_plnt,
"
"					     imrhd_frwd_date,
"
"					     NVL(imrhd_source_flag,'M'),
"
"					     imrhd_cre_by,
"
"					     imrhd_cre_emp_id,
"
"					     imrhd_cre_ip_addr,
"
"					     imrhd_cre_os_user,
"
"					     imrhd_cre_date,
"
"					     imrhd_upd_by,
"
"					     imrhd_upd_emp_id,
"
"					     imrhd_upd_ip_addr,
"
"					     imrhd_upd_os_user,
"
"					     imrhd_upd_date,
"
"					     imrhd_ref_unit,
"
"					     imrhd_close_shrt_reason,
"
"					     imrhd_iss_code,
"
"					     imrhd_sel_flag,
"
"					     imrhd_trace_action,
"
"					     imrhd_trace_msg,
"
"					     imrhd_ord_type,
"
"					     imrhd_ord_no,
"
"					     imrhd_sg_flag,
"
"					     imrhd_ord_qty,
"
"					     imrhd_oprn_id,
"
"					     imrhd_work_center,
"
"					     imrhd_equip_id,
"
"					     imrhd_mix_doc_no,
"
"					     imrhd_fcm_bl_id,
"
"					     imrhd_fcm_proj_no,
"
"					     imrhd_shift_id,
"
"					     imrhd_aen_type,
"
"					     imrhd_rqstby_entity,
"
"					     imrhd_emp_id,
"
"					     imrhd_plnt_loc_id,
"
"					     imrhd_plnt_loc_name,
"
"                                             imrhd_res_id,
"
"					     imrhd_rqst_pfx
"
"				        FROM inv_material_request_hd
"
"				       WHERE imrhd_bu = p_bu
"
"				         AND imrhd_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO inv_material_request_ln_hist(imrlnh_bu,
"
"					     imrlnh_rqst_no,
"
"					     imrlnh_seq_no,
"
"					     imrlnh_prod_id,
"
"					     imrlnh_prod_rev,
"
"					     imrlnh_prod_cls,
"
"					     imrlnh_unit_cost,
"
"					     imrlnh_requested_qty,
"
"					     imrlnh_uom,
"
"					     imrlnh_prod_uom,
"
"					     imrlnh_conv_factor,
"
"					     imrlnh_mi_allocated_qty,
"
"					     imrlnh_issued_qty,
"
"					     imrlnh_reference,
"
"					     imrlnh_substiute,
"
"					     imrlnh_rqrd_date,
"
"					     imrlnh_rqrd_year,
"
"					     imrlnh_rqrd_period,
"
"					     imrlnh_proj_task_id,
"
"					     imrlnh_status,
"
"					     imrlnh_sel_flag,
"
"					     imrlnh_to_allocated_qty,
"
"					     imrlnh_process_id,
"
"					     imrlnh_po_ord_no,
"
"					     imrlnh_sel_user,
"
"					     imrlnh_sf_code,
"
"					     imrlnh_cre_by,
"
"					     imrlnh_cre_emp_id,
"
"					     imrlnh_cre_ip_addr,
"
"					     imrlnh_cre_os_user,
"
"					     imrlnh_cre_date,
"
"					     imrlnh_upd_by,
"
"					     imrlnh_upd_emp_id,
"
"					     imrlnh_upd_ip_addr,
"
"					     imrlnh_upd_os_user,
"
"					     imrlnh_upd_date,
"
"					     imrlnh_piece_mark,
"
"					     imrlnh_draw_doc_no,
"
"					     imrlnh_draw_seq_no,
"
"					     imrlnh_close_shrt_reason,
"
"					     imrlnh_prod_subcls,
"
"					     imrlnh_mi_method,
"
"					     imrlnh_par_prod_id,
"
"					     imrlnh_par_prod_rev,
"
"					     imrlnh_mnt_task_id,
"
"					     imrlnh_mnt_oprn_id,
"
"					     imrlnh_mnt_wc_id,
"
"					     imrlnh_mat_type,
"
"					     imrlnh_ord_type,
"
"					     imrlnh_ord_pfx,
"
"					     imrlnh_ord_no,
"
"					     imrlnh_ord_seq_no,
"
"					     imrlnh_ord_sub_seq_no,
"
"					     imrlnh_ord_qty,
"
"					     imrlnh_work_center,
"
"					     imrlnh_excs_qty,
"
"					     imrlnh_type,
"
"					     imrlnh_so_pfx,
"
"					     imrlnh_so_no,
"
"					     imrlnh_so_seq_no,
"
"					     imrlnh_so_sub_seq_no,
"
"					     imrlnh_proj_id,
"
"					     imrlnh_task_id,
"
"					     imrlnh_sys_ls_no,
"
"					     imrlnh_lot_no,
"
"					     imrlnh_ser_no,
"
"					     imrlnh_expiry_date,
"
"					     imrlnh_res_id,
"
"					     imrlnh_shift_id,
"
"					     imrlnh_so_schld_desc,
"
"					     imrlnh_cls_qty,
"
"					     imrlnh_trans_no,
"
"					     imrlnh_plnt,
"
"					     imrlnh_cap_asset_id,
"
"					     imrlnh_par_batch_no,
"
"					     imrlnh_rqst_batch_no,
"
"					     imrlnh_pr_pfx,
"
"					     imrlnh_pr_no,
"
"					     imrlnh_pr_seq_no,
"
"					     imrlnh_pr_qty,
"
"					     imrlnh_mix_doc_no,
"
"					     imrlnh_sugg_alloc_req_flag,
"
"					     imrlnh_mix_seq_no,
"
"					     imrlnh_sou_plnt,
"
"					     imrlnh_returned_qty,
"
"					     imrlnh_emp_id,
"
"					     imrlnh_bin_id,
"
"					     imrlnh_crate_id,
"
"					     imrlnh_store_id,
"
"					     imrlnh_no_of_bale,
"
"					     imrlnh_boq_ref_no,
"
"					     imrlnh_boq_seq_no,
"
"					     imrlnh_boq_sub_seq_no,
"
"					     imrlnh_boq_ref_test_no,
"
"					     imrlnh_cust_prod_id,
"
"					     imrlnh_cust_prod_desc,
"
"					     imrlnh_pr_rqrd_flag,
"
"					     imrlnh_iss_code,
"
"					     imrlnh_rcpt_iss_code,
"
"					     imrlnh_oprn_ln_seq_no,
"
"					     imrlnh_csr_type,
"
"					     imrlnh_height,
"
"					     imrlnh_outer_dia,
"
"					     imrlnh_inner_dia,
"
"					     imrlnh_density,
"
"					     imrlnh_fab_item_type,
"
"					     imrlnh_tl_chrt_no,
"
"					     imrlnh_tl_station_loc,
"
"					     imrlnh_sou_oprn_seq,
"
"					     imrlnh_sou_proc_id,
"
"					     imrlnh_ws_id,
"
"					     imrlnh_eqpmt_id,
"
"					     imrlnh_billfr_loc_name,
"
"					     imrlnh_shipfr_loc_name
"
"					    )
"
"				      SELECT imrln_bu,
"
"					     imrln_rqst_no,
"
"					     imrln_seq_no,
"
"					     imrln_prod_id,
"
"					     imrln_prod_rev,
"
"					     imrln_prod_cls,
"
"					     imrln_unit_cost,
"
"					     imrln_requested_qty,
"
"					     imrln_uom,
"
"					     imrln_prod_uom,
"
"					     imrln_conv_factor,
"
"					     imrln_mi_allocated_qty,
"
"					     imrln_issued_qty,
"
"					     imrln_reference,
"
"					     imrln_substiute,
"
"					     imrln_rqrd_date,
"
"					     imrln_rqrd_year,
"
"					     imrln_rqrd_period,
"
"					     imrln_proj_task_id,
"
"					     imrln_status,
"
"					     imrln_sel_flag,
"
"					     imrln_to_allocated_qty,
"
"					     imrln_process_id,
"
"					     imrln_po_ord_no,
"
"					     imrln_sel_user,
"
"					     imrln_sf_code,
"
"					     imrln_cre_by,
"
"					     imrln_cre_emp_id,
"
"					     imrln_cre_ip_addr,
"
"					     imrln_cre_os_user,
"
"					     imrln_cre_date,
"
"					     imrln_upd_by,
"
"					     imrln_upd_emp_id,
"
"					     imrln_upd_ip_addr,
"
"					     imrln_upd_os_user,
"
"					     imrln_upd_date,
"
"					     imrln_piece_mark,
"
"					     imrln_draw_doc_no,
"
"					     imrln_draw_seq_no,
"
"					     imrln_close_shrt_reason,
"
"					     imrln_prod_subcls,
"
"					     imrln_mi_method,
"
"					     imrln_par_prod_id,
"
"					     imrln_par_prod_rev,
"
"					     imrln_mnt_task_id,
"
"					     imrln_mnt_oprn_id,
"
"					     imrln_mnt_wc_id,
"
"					     imrln_mat_type,
"
"					     imrln_ord_type,
"
"					     imrln_ord_pfx,
"
"					     imrln_ord_no,
"
"					     imrln_ord_seq_no,
"
"					     imrln_ord_sub_seq_no,
"
"					     imrln_ord_qty,
"
"					     imrln_work_center,
"
"					     imrln_excs_qty,
"
"					     imrln_type,
"
"					     imrln_so_pfx,
"
"					     imrln_so_no,
"
"					     imrln_so_seq_no,
"
"					     imrln_so_sub_seq_no,
"
"					     imrln_proj_id,
"
"					     imrln_task_id,
"
"					     imrln_sys_ls_no,
"
"					     imrln_lot_no,
"
"					     imrln_ser_no,
"
"					     imrln_expiry_date,
"
"					     imrln_res_id,
"
"					     imrln_shift_id,
"
"					     imrln_so_schld_desc,
"
"					     imrln_cls_qty,
"
"					     imrln_trans_no,
"
"					     imrln_plnt,
"
"					     imrln_cap_asset_id,
"
"					     imrln_par_batch_no,
"
"					     imrln_rqst_batch_no,
"
"					     imrln_pr_pfx,
"
"					     imrln_pr_no,
"
"					     imrln_pr_seq_no,
"
"					     imrln_pr_qty,
"
"					     imrln_mix_doc_no,
"
"					     imrln_sugg_alloc_req_flag,
"
"					     imrln_mix_seq_no,
"
"					     imrln_sou_plnt,
"
"					     imrln_returned_qty,
"
"					     imrln_emp_id,
"
"					     imrln_bin_id,
"
"					     imrln_crate_id,
"
"					     imrln_store_id,
"
"					     imrln_no_of_bale,
"
"					     imrln_boq_ref_no,
"
"					     imrln_boq_seq_no,
"
"					     imrln_boq_sub_seq_no,
"
"					     imrln_boq_ref_test_no,
"
"					     imrln_cust_prod_id,
"
"					     imrln_cust_prod_desc,
"
"					     imrln_pr_rqrd_flag,
"
"					     imrln_iss_code,
"
"					     imrln_rcpt_iss_code,
"
"					     imrln_oprn_ln_seq_no,
"
"					     imrln_csr_type,
"
"					     imrln_height,
"
"					     imrln_outer_dia,
"
"					     imrln_inner_dia,
"
"					     imrln_density,
"
"					     imrln_fab_item_type,
"
"					     imrln_tl_chrt_no,
"
"					     imrln_tl_station_loc,
"
"					     imrln_sou_oprn_seq,
"
"					     imrln_sou_proc_id,
"
"					     imrln_ws_id,
"
"					     imrln_eqpmt_id,
"
"					     imrln_billfr_loc_name,
"
"					     imrln_shipfr_loc_name
"
"					FROM inv_material_request_ln
"
"				       WHERE imrln_bu = p_bu
"
"				         AND imrln_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO inv_mat_req_attr_hist(imrah_bu,
"
"				      imrah_rqst_no,
"
"				      imrah_seq_no,
"
"				      imrah_attr_id,
"
"				      imrah_cre_by,
"
"				      imrah_cre_date,
"
"				      imrah_upd_by,
"
"				      imrah_upd_date
"
"				     )
"
"			       SELECT imra_bu,
"
"				      imra_rqst_no,
"
"				      imra_seq_no,
"
"				      imra_attr_id,
"
"				      imra_cre_by,
"
"				      imra_cre_date,
"
"				      imra_upd_by,
"
"				      imra_upd_date
"
"				 FROM inv_mat_req_attr
"
"				WHERE imra_bu = p_bu
"
"				  AND imra_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO inv_mat_req_attr_notes_hist(imranh_bu,
"
"					    imranh_rqst_no,
"
"					    imranh_seq_no,
"
"					    imranh_sub_seq_no,
"
"					    imranh_note,
"
"					    imranh_cre_by,
"
"					    imranh_cre_date,
"
"					    imranh_upd_by,
"
"					    imranh_upd_date
"
"					   )
"
"			             SELECT imran_bu,
"
"					    imran_rqst_no,
"
"					    imran_seq_no,
"
"					    imran_sub_seq_no,
"
"					    imran_note,
"
"					    imran_cre_by,
"
"					    imran_cre_date,
"
"					    imran_upd_by,
"
"					    imran_upd_date
"
"				       FROM inv_mat_req_attr_notes
"
"				      WHERE imran_bu = p_bu
"
"				        AND imran_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO inv_mat_req_ln_attr_hist(imrlah_bu,
"
"					 imrlah_rqst_no,
"
"					 imrlah_rqst_seq_no,
"
"					 imrlah_seq_no,
"
"					 imrlah_attr_id,
"
"					 imrlah_cre_by,
"
"					 imrlah_cre_date,
"
"					 imrlah_upd_by,
"
"					 imrlah_upd_date
"
"					)
"
"			          SELECT imrla_bu,
"
"					 imrla_rqst_no,
"
"					 imrla_rqst_seq_no,
"
"					 imrla_seq_no,
"
"					 imrla_attr_id,
"
"					 imrla_cre_by,
"
"					 imrla_cre_date,
"
"					 imrla_upd_by,
"
"					 imrla_upd_date
"
"			            FROM inv_mat_req_ln_attr
"
"			           WHERE imrla_bu = p_bu
"
"			             AND imrla_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO inv_mat_req_ln_attr_notes_hist(imrlanh_bu,
"
"					       imrlanh_rqst_no,
"
"					       imrlanh_rqst_seq_no,
"
"					       imrlanh_seq_no,
"
"					       imrlanh_sub_seq_no,
"
"					       imrlanh_note,
"
"					       imrlanh_cre_by,
"
"					       imrlanh_cre_date,
"
"					       imrlanh_upd_by,
"
"					       imrlanh_upd_date
"
"					      )
"
"					SELECT imrlan_bu,
"
"					       imrlan_rqst_no,
"
"					       imrlan_rqst_seq_no,
"
"					       imrlan_seq_no,
"
"					       imrlan_sub_seq_no,
"
"					       imrlan_note,
"
"					       imrlan_cre_by,
"
"					       imrlan_cre_date,
"
"					       imrlan_upd_by,
"
"					       imrlan_upd_date
"
"					  FROM inv_mat_req_ln_attr_notes
"
"					 WHERE imrlan_bu = p_bu
"
"					   AND imrlan_rqst_no = p_rqst_no;
"
"
"
"
"
"    DELETE
"
"      FROM inv_mat_req_ln_attr_notes
"
"     WHERE imrlan_bu = p_bu
"
"       AND imrlan_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_req_ln_attr
"
"     WHERE imrla_bu = p_bu
"
"       AND imrla_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_req_attr_notes
"
"     WHERE imran_bu = p_bu
"
"       AND imran_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_req_attr
"
"     WHERE imra_bu = p_bu
"
"       AND imra_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_material_request_ln
"
"     WHERE imrln_bu = p_bu
"
"       AND imrln_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_material_request_hd
"
"     WHERE imrhd_bu = p_bu
"
"       AND imrhd_rqst_no = p_rqst_no;
"
"
"
"
"
"  END proc_ins_mr_hist;
"
"
"
"  PROCEDURE proc_rev_mr_hist(p_bu		inv_material_request_hd.imrhd_bu%TYPE,
"
"  			     p_rqst_no		inv_material_request_hd.imrhd_rqst_no%TYPE
"
"  			    )
"
"  AS
"
"  BEGIN
"
"
"
"
"
"    INSERT INTO inv_material_request_hd(imrhd_bu,
"
"					imrhd_rqst_no,
"
"					imrhd_rqstto_store_id,
"
"					imrhd_rqst_date,
"
"					imrhd_year,
"
"					imrhd_period,
"
"					imrhd_rqstby_type,
"
"					imrhd_rqstby_id,
"
"					imrhd_status,
"
"					imrhd_reference,
"
"					imrhd_control_person,
"
"					imrhd_reqstr_id,
"
"					imrhd_reqstr_name,
"
"					imrhd_reqstr_pos_id,
"
"					imrhd_reqstr_pos_name,
"
"					imrhd_rqst_dept_id,
"
"					imrhd_apprvr_id,
"
"					imrhd_apprvr_name,
"
"					imrhd_apprvr_pos_id,
"
"					imrhd_apprvr_pos_name,
"
"					imrhd_apprvr_dept_id,
"
"					imrhd_apprvd_date,
"
"					imrhd_appr_flag,
"
"					imrhd_no_of_try,
"
"					imrhd_no_of_issues,
"
"					imrhd_rec_source,
"
"					imrhd_session_id,
"
"					imrhd_other_flag,
"
"					imrhd_plnt,
"
"					imrhd_frwd_date,
"
"					imrhd_source_flag,
"
"					imrhd_cre_by,
"
"					imrhd_cre_date,
"
"					imrhd_upd_by,
"
"					imrhd_upd_date,
"
"					imrhd_ref_unit,
"
"					imrhd_close_shrt_reason,
"
"					imrhd_iss_code,
"
"					imrhd_sel_flag,
"
"					imrhd_trace_action,
"
"					imrhd_trace_msg,
"
"					imrhd_ord_type,
"
"					imrhd_ord_no,
"
"					imrhd_sg_flag,
"
"					imrhd_ord_qty,
"
"					imrhd_oprn_id,
"
"					imrhd_work_center,
"
"					imrhd_equip_id,
"
"					imrhd_mix_doc_no,
"
"					imrhd_fcm_bl_id,
"
"					imrhd_fcm_proj_no,
"
"					imrhd_shift_id,
"
"					imrhd_aen_type,
"
"					imrhd_rqstby_entity,
"
"					imrhd_emp_id,
"
"						 imrhd_plnt_loc_id,
"
"						 imrhd_plnt_loc_name,
"
"                                        imrhd_res_id,
"
"					imrhd_rqst_pfx
"
"				       )
"
"			         SELECT imrhdh_bu,
"
"					imrhdh_rqst_no,
"
"					imrhdh_rqstto_store_id,
"
"					imrhdh_rqst_date,
"
"					imrhdh_year,
"
"					imrhdh_period,
"
"					imrhdh_rqstby_type,
"
"					imrhdh_rqstby_id,
"
"					imrhdh_status,
"
"					imrhdh_reference,
"
"					imrhdh_control_person,
"
"					imrhdh_reqstr_id,
"
"					imrhdh_reqstr_name,
"
"					imrhdh_reqstr_pos_id,
"
"					imrhdh_reqstr_pos_name,
"
"					imrhdh_rqst_dept_id,
"
"					imrhdh_apprvr_id,
"
"					imrhdh_apprvr_name,
"
"					imrhdh_apprvr_pos_id,
"
"					imrhdh_apprvr_pos_name,
"
"					imrhdh_apprvr_dept_id,
"
"					imrhdh_apprvd_date,
"
"					imrhdh_appr_flag,
"
"					imrhdh_no_of_try,
"
"					imrhdh_no_of_issues,
"
"					imrhdh_rec_source,
"
"					imrhdh_session_id,
"
"					imrhdh_other_flag,
"
"					imrhdh_plnt,
"
"					imrhdh_frwd_date,
"
"					imrhdh_source_flag,
"
"					imrhdh_cre_by,
"
"					imrhdh_cre_date,
"
"					imrhdh_upd_by,
"
"					imrhdh_upd_date,
"
"					imrhdh_ref_unit,
"
"					imrhdh_close_shrt_reason,
"
"					imrhdh_iss_code,
"
"					imrhdh_sel_flag,
"
"					imrhdh_trace_action,
"
"					imrhdh_trace_msg,
"
"					imrhdh_ord_type,
"
"					imrhdh_ord_no,
"
"					imrhdh_sg_flag,
"
"					imrhdh_ord_qty,
"
"					imrhdh_oprn_id,
"
"					imrhdh_work_center,
"
"					imrhdh_equip_id,
"
"					imrhdh_mix_doc_no,
"
"					imrhdh_fcm_bl_id,
"
"					imrhdh_fcm_proj_no,
"
"					imrhdh_shift_id,
"
"					imrhdh_aen_type,
"
"					imrhdh_rqstby_entity,
"
"					imrhdh_emp_id,
"
"						 imrhdh_plnt_loc_id,
"
"						 imrhdh_plnt_loc_name,
"
"						 imrhdh_res_id,
"
"						 imrhdh_rqst_pfx
"
"                                   FROM inv_material_request_hd_hist
"
"                                  WHERE imrhdh_bu = p_bu
"
"                                    AND imrhdh_rqst_no = p_rqst_no;
"
"
"
"
"
"    INSERT INTO inv_material_request_ln(imrln_bu,
"
"					imrln_rqst_no,
"
"					imrln_seq_no,
"
"					imrln_prod_id,
"
"					imrln_prod_rev,
"
"					imrln_prod_cls,
"
"					imrln_unit_cost,
"
"					imrln_requested_qty,
"
"					imrln_uom,
"
"					imrln_prod_uom,
"
"					imrln_conv_factor,
"
"					imrln_mi_allocated_qty,
"
"					imrln_issued_qty,
"
"					imrln_reference,
"
"					imrln_substiute,
"
"					imrln_rqrd_date,
"
"					imrln_rqrd_year,
"
"					imrln_rqrd_period,
"
"					imrln_proj_task_id,
"
"					imrln_status,
"
"					imrln_sel_flag,
"
"					imrln_to_allocated_qty,
"
"					imrln_process_id,
"
"					imrln_po_ord_no,
"
"					imrln_sel_user,
"
"					imrln_sf_code,
"
"					imrln_cre_by,
"
"					imrln_cre_date,
"
"					imrln_upd_by,
"
"					imrln_upd_date,
"
"					imrln_piece_mark,
"
"					imrln_draw_doc_no,
"
"					imrln_draw_seq_no,
"
"					imrln_close_shrt_reason,
"
"					imrln_prod_subcls,
"
"					imrln_mi_method,
"
"					imrln_par_prod_id,
"
"					imrln_par_prod_rev,
"
"					imrln_mnt_task_id,
"
"					imrln_mnt_oprn_id,
"
"					imrln_mnt_wc_id,
"
"					imrln_mat_type,
"
"					imrln_ord_type,
"
"					imrln_ord_pfx,
"
"					imrln_ord_no,
"
"					imrln_ord_seq_no,
"
"					imrln_ord_sub_seq_no,
"
"					imrln_ord_qty,
"
"					imrln_work_center,
"
"					imrln_excs_qty,
"
"					imrln_type,
"
"					imrln_so_pfx,
"
"					imrln_so_no,
"
"					imrln_so_seq_no,
"
"					imrln_so_sub_seq_no,
"
"					imrln_proj_id,
"
"					imrln_task_id,
"
"					imrln_sys_ls_no,
"
"					imrln_lot_no,
"
"					imrln_ser_no,
"
"					imrln_expiry_date,
"
"					imrln_res_id,
"
"					imrln_shift_id,
"
"					imrln_so_schld_desc,
"
"					imrln_cls_qty,
"
"					imrln_trans_no,
"
"					imrln_plnt,
"
"					imrln_cap_asset_id,
"
"					imrln_par_batch_no,
"
"					imrln_rqst_batch_no,
"
"					imrln_pr_pfx,
"
"					imrln_pr_no,
"
"					imrln_pr_seq_no,
"
"					imrln_pr_qty,
"
"					imrln_mix_doc_no,
"
"					imrln_sugg_alloc_req_flag,
"
"					imrln_mix_seq_no,
"
"					imrln_sou_plnt,
"
"					imrln_returned_qty,
"
"					imrln_bin_id,
"
"					imrln_crate_id,
"
"					imrln_store_id,
"
"					imrln_no_of_bale,
"
"					imrln_boq_ref_no,
"
"					imrln_boq_seq_no,
"
"					imrln_boq_sub_seq_no,
"
"					imrln_boq_ref_test_no,
"
"					imrln_cust_prod_id,
"
"					imrln_cust_prod_desc,
"
"					imrln_pr_rqrd_flag,
"
"					imrln_iss_code,
"
"					imrln_rcpt_iss_code,
"
"					imrln_oprn_ln_seq_no,
"
"					imrln_csr_type,
"
"					imrln_height,
"
"					imrln_outer_dia,
"
"					imrln_inner_dia,
"
"					imrln_density,
"
"					imrln_fab_item_type,
"
"					imrln_tl_chrt_no,
"
"					imrln_sou_oprn_seq,
"
"					imrln_sou_proc_id,
"
"					imrln_ws_id,
"
"					imrln_eqpmt_id,
"
"					imrln_billfr_loc_name,
"
"				        imrln_shipfr_loc_name
"
"                                       )
"
"			         SELECT imrlnh_bu,
"
"					imrlnh_rqst_no,
"
"					imrlnh_seq_no,
"
"					imrlnh_prod_id,
"
"					imrlnh_prod_rev,
"
"					imrlnh_prod_cls,
"
"					imrlnh_unit_cost,
"
"					imrlnh_requested_qty,
"
"					imrlnh_uom,
"
"					imrlnh_prod_uom,
"
"					imrlnh_conv_factor,
"
"					imrlnh_mi_allocated_qty,
"
"					imrlnh_issued_qty,
"
"					imrlnh_reference,
"
"					imrlnh_substiute,
"
"					imrlnh_rqrd_date,
"
"					imrlnh_rqrd_year,
"
"					imrlnh_rqrd_period,
"
"					imrlnh_proj_task_id,
"
"					imrlnh_status,
"
"					imrlnh_sel_flag,
"
"					imrlnh_to_allocated_qty,
"
"					imrlnh_process_id,
"
"					imrlnh_po_ord_no,
"
"					imrlnh_sel_user,
"
"					imrlnh_sf_code,
"
"					imrlnh_cre_by,
"
"					imrlnh_cre_date,
"
"					imrlnh_upd_by,
"
"					imrlnh_upd_date,
"
"					imrlnh_piece_mark,
"
"					imrlnh_draw_doc_no,
"
"					imrlnh_draw_seq_no,
"
"					imrlnh_close_shrt_reason,
"
"					imrlnh_prod_subcls,
"
"					imrlnh_mi_method,
"
"					imrlnh_par_prod_id,
"
"					imrlnh_par_prod_rev,
"
"					imrlnh_mnt_task_id,
"
"					imrlnh_mnt_oprn_id,
"
"					imrlnh_mnt_wc_id,
"
"					imrlnh_mat_type,
"
"					imrlnh_ord_type,
"
"					imrlnh_ord_pfx,
"
"					imrlnh_ord_no,
"
"					imrlnh_ord_seq_no,
"
"					imrlnh_ord_sub_seq_no,
"
"					imrlnh_ord_qty,
"
"					imrlnh_work_center,
"
"					imrlnh_excs_qty,
"
"					imrlnh_type,
"
"					imrlnh_so_pfx,
"
"					imrlnh_so_no,
"
"					imrlnh_so_seq_no,
"
"					imrlnh_so_sub_seq_no,
"
"					imrlnh_proj_id,
"
"					imrlnh_task_id,
"
"					imrlnh_sys_ls_no,
"
"					imrlnh_lot_no,
"
"					imrlnh_ser_no,
"
"					imrlnh_expiry_date,
"
"					imrlnh_res_id,
"
"					imrlnh_shift_id,
"
"					imrlnh_so_schld_desc,
"
"					imrlnh_cls_qty,
"
"					imrlnh_trans_no,
"
"					imrlnh_plnt,
"
"					imrlnh_cap_asset_id,
"
"					imrlnh_par_batch_no,
"
"					imrlnh_rqst_batch_no,
"
"					imrlnh_pr_pfx,
"
"					imrlnh_pr_no,
"
"					imrlnh_pr_seq_no,
"
"					imrlnh_pr_qty,
"
"					imrlnh_mix_doc_no,
"
"					imrlnh_sugg_alloc_req_flag,
"
"					imrlnh_mix_seq_no,
"
"					imrlnh_sou_plnt,
"
"					imrlnh_returned_qty,
"
"					imrlnh_bin_id,
"
"					imrlnh_crate_id,
"
"					imrlnh_store_id,
"
"					imrlnh_no_of_bale,
"
"					imrlnh_boq_ref_no,
"
"					imrlnh_boq_seq_no,
"
"					imrlnh_boq_sub_seq_no,
"
"					imrlnh_boq_ref_test_no,
"
"					imrlnh_cust_prod_id,
"
"					imrlnh_cust_prod_desc,
"
"					imrlnh_pr_rqrd_flag,
"
"					imrlnh_iss_code,
"
"					imrlnh_rcpt_iss_code,
"
"					imrlnh_oprn_ln_seq_no,
"
"					imrlnh_csr_type,
"
"					imrlnh_height,
"
"					imrlnh_outer_dia,
"
"					imrlnh_inner_dia,
"
"					imrlnh_density,
"
"					imrlnh_fab_item_type,
"
"					imrlnh_tl_chrt_no,
"
"					imrlnh_sou_oprn_seq,
"
"					imrlnh_sou_proc_id,
"
"					imrlnh_ws_id,
"
"					imrlnh_eqpmt_id,
"
"					imrlnh_billfr_loc_name,
"
"					imrlnh_shipfr_loc_name
"
"                                   FROM inv_material_request_ln_hist
"
"                                  WHERE imrlnh_bu = p_bu
"
"                                    AND imrlnh_rqst_no = p_rqst_no;
"
"
"
"
"
"    INSERT INTO inv_mat_req_attr(imra_bu,
"
"				 imra_rqst_no,
"
"				 imra_seq_no,
"
"				 imra_attr_id,
"
"				 imra_cre_by,
"
"				 imra_cre_date,
"
"				 imra_upd_by,
"
"				 imra_upd_date
"
"				)
"
"                          SELECT imrah_bu,
"
"				 imrah_rqst_no,
"
"				 imrah_seq_no,
"
"				 imrah_attr_id,
"
"				 imrah_cre_by,
"
"				 imrah_cre_date,
"
"				 imrah_upd_by,
"
"				 imrah_upd_date
"
"                            FROM inv_mat_req_attr_hist
"
"                           WHERE imrah_bu = p_bu
"
"                             AND imrah_rqst_no = p_rqst_no;
"
"
"
"
"
"    INSERT INTO inv_mat_req_attr_notes(imran_bu,
"
"				       imran_rqst_no,
"
"				       imran_seq_no,
"
"				       imran_sub_seq_no,
"
"				       imran_note,
"
"				       imran_cre_by,
"
"				       imran_cre_date,
"
"				       imran_upd_by,
"
"				       imran_upd_date
"
"				      )
"
"                                SELECT imranh_bu,
"
"				       imranh_rqst_no,
"
"				       imranh_seq_no,
"
"				       imranh_sub_seq_no,
"
"				       imranh_note,
"
"				       imranh_cre_by,
"
"				       imranh_cre_date,
"
"				       imranh_upd_by,
"
"				       imranh_upd_date
"
"                                  FROM inv_mat_req_attr_notes_hist
"
"                                 WHERE imranh_bu = p_bu
"
"                                   AND imranh_rqst_no = p_rqst_no;
"
"
"
"
"
"    INSERT INTO inv_mat_req_ln_attr(imrla_bu,
"
"				    imrla_rqst_no,
"
"				    imrla_rqst_seq_no,
"
"				    imrla_seq_no,
"
"				    imrla_attr_id,
"
"				    imrla_cre_by,
"
"				    imrla_cre_date,
"
"				    imrla_upd_by,
"
"				    imrla_upd_date
"
"				   )
"
"                             SELECT imrlah_bu,
"
"				    imrlah_rqst_no,
"
"				    imrlah_rqst_seq_no,
"
"				    imrlah_seq_no,
"
"				    imrlah_attr_id,
"
"				    imrlah_cre_by,
"
"				    imrlah_cre_date,
"
"				    imrlah_upd_by,
"
"				    imrlah_upd_date
"
"                               FROM inv_mat_req_ln_attr_hist
"
"		              WHERE imrlah_bu = p_bu
"
"		                AND imrlah_rqst_no = p_rqst_no;
"
"
"
"    INSERT INTO inv_mat_req_ln_attr_notes(imrlan_bu,
"
"					  imrlan_rqst_no,
"
"					  imrlan_rqst_seq_no,
"
"					  imrlan_seq_no,
"
"					  imrlan_sub_seq_no,
"
"					  imrlan_note,
"
"					  imrlan_cre_by,
"
"					  imrlan_cre_date,
"
"					  imrlan_upd_by,
"
"					  imrlan_upd_date
"
"					 )
"
"				   SELECT imrlanh_bu,
"
"					  imrlanh_rqst_no,
"
"					  imrlanh_rqst_seq_no,
"
"					  imrlanh_seq_no,
"
"					  imrlanh_sub_seq_no,
"
"					  imrlanh_note,
"
"					  imrlanh_cre_by,
"
"					  imrlanh_cre_date,
"
"					  imrlanh_upd_by,
"
"					  imrlanh_upd_date
"
"				     FROM inv_mat_req_ln_attr_notes_hist
"
"				    WHERE imrlanh_bu = p_bu
"
"				      AND imrlanh_rqst_no = p_rqst_no;
"
"
"
"
"
"    DELETE
"
"      FROM inv_mat_req_ln_attr_notes_hist
"
"     WHERE imrlanh_bu = p_bu
"
"       AND imrlanh_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_req_ln_attr_hist
"
"     WHERE imrlah_bu = p_bu
"
"       AND imrlah_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_req_attr_notes_hist
"
"     WHERE imranh_bu = p_bu
"
"       AND imranh_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_req_attr_hist
"
"     WHERE imrah_bu = p_bu
"
"       AND imrah_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_material_request_ln_hist
"
"     WHERE imrlnh_bu = p_bu
"
"       AND imrlnh_rqst_no = p_rqst_no;
"
"
"
"    DELETE
"
"      FROM inv_material_request_hd_hist
"
"     WHERE imrhdh_bu = p_bu
"
"       AND imrhdh_rqst_no = p_rqst_no;
"
"
"
"  END proc_rev_mr_hist;
"
"
"
"  PROCEDURE proc_ins_mi_hist(p_bu		inv_stock_trans_hd.isthd_bu%TYPE,
"
"			     p_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE
"
"			    )
"
"  AS
"
"  BEGIN
"
"   --Raise_application_error(-20999,'HRM'||'~'||p_bu||'~'||p_doc_no);
"
"    INSERT INTO inv_stock_trans_hd_hist(isthdh_bu,
"
"				        isthdh_doc_no,
"
"				        isthdh_doc_oper,
"
"				        isthdh_issuefm_store_id,
"
"				        isthdh_issueto_type,
"
"				        isthdh_issueto_id,
"
"				        isthdh_trans_date,
"
"				        isthdh_year,
"
"				        isthdh_period,
"
"				        isthdh_status,
"
"				        isthdh_reference,
"
"				        isthdh_issuer_id,
"
"				        isthdh_issuer_name,
"
"				        isthdh_issuer_pos_id,
"
"				        isthdh_issuer_pos_name,
"
"				        isthdh_rec_src_flag,
"
"				        isthdh_dc_type,
"
"				        isthdh_return_type,
"
"				        isthdh_plnt,
"
"				        isthdh_inspection_type,
"
"				        isthdh_cust_id,
"
"				        isthdh_third_party,
"
"				        isthdh_qc_ref,
"
"				        isthdh_cre_by,
"
"					isthdh_cre_emp_id,
"
"					isthdh_cre_ip_addr,
"
"					isthdh_cre_os_user,
"
"				        isthdh_cre_date,
"
"				        isthdh_upd_by,
"
"					isthdh_upd_emp_id,
"
"					isthdh_upd_ip_addr,
"
"					isthdh_upd_os_user,
"
"				        isthdh_upd_date,
"
"				        isthdh_rcpt_pfx,
"
"				        isthdh_rcpt_no,
"
"				        isthdh_ref_unit,
"
"				        isthdh_dc_cre_flag,
"
"				        isthdh_dc_cre_user,
"
"				        isthdh_iss_code,
"
"				        isthdh_so_ref,
"
"				        isthdh_jrnl_flag,
"
"				        isthdh_fin_status,
"
"				        isthdh_pio_type,
"
"				        isthdh_work_center,
"
"				        isthdh_oprn_id,
"
"				        isthdh_alloc_flag,
"
"				        isthdh_fmcg_doc_type,
"
"				        isthdh_fmcg_doc_no,
"
"				        isthdh_out_dc_no,
"
"				        isthdh_dc_no,
"
"				        isthdh_fcm_bl_id,
"
"				        isthdh_fcm_proj_no,
"
"				        isthdh_bond_no,
"
"					isthdh_boe_no,
"
"                                        isthdh_boe_date,
"
"					isthdh_recvd_by,
"
"					isthdh_issued_by,
"
"					isthdh_imo_no,
"
"					isthdh_dairy_type,
"
"					isthdh_dry_seal_ser_no,
"
"					isthdh_dry_insp_flag,
"
"					isthdh_rqstby_entity,
"
"					isthdh_issuefm_store_type,
"
"					isthdh_plnt_loc_id,
"
"					isthdh_plnt_loc_name,
"
"					isthdh_res_id,
"
"					isthdh_issueto_plnt,
"
"					isthdh_issueto_plnt_loc_id,
"
"					isthdh_veh_cap,
"
"					isthdh_trans_id,
"
"					isthdh_veh_no,
"
"					isthdh_driv_name,
"
"					isthdh_driv_mobile,
"
"					isthdh_veh_cap_tons,
"
"					isthdh_trans_chrg_amt,
"
"					isthdh_fvr_emp_mr_cre_flag,
"
"					isthdh_llr_no,
"
"					isthdh_suplr_dc_no,
"
"					isthdh_suplr_dc_date,
"
"					isthdh_trans_desc,
"
"					isthdh_trnsp_req_flag,
"
"					isthdh_loading_type,
"
"					isthdh_csr_doc_no,
"
"					isthdh_lot_no,
"
"					isthdh_recvd_by_name,
"
"					isthdh_vou_oper,
"
"					isthdh_doc_pfx,
"
"					isthdh_fvr_doc_no,
"
"					isthdh_vou_type
"
"				       )
"
"                                 SELECT isthd_bu,
"
"				        isthd_doc_no,
"
"				        isthd_doc_oper,
"
"				        isthd_issuefm_store_id,
"
"				        isthd_issueto_type,
"
"				        isthd_issueto_id,
"
"				        isthd_trans_date,
"
"				        isthd_year,
"
"				        isthd_period,
"
"				        isthd_status,
"
"				        isthd_reference,
"
"				        isthd_issuer_id,
"
"				        isthd_issuer_name,
"
"				        isthd_issuer_pos_id,
"
"				        isthd_issuer_pos_name,
"
"				        isthd_rec_src_flag,
"
"				        isthd_dc_type,
"
"				        isthd_return_type,
"
"				        isthd_plnt,
"
"				        isthd_inspection_type,
"
"				        isthd_cust_id,
"
"				        isthd_third_party,
"
"				        isthd_qc_ref,
"
"				        isthd_cre_by,
"
"					isthd_cre_emp_id,
"
"					isthd_cre_ip_addr,
"
"					isthd_cre_os_user,
"
"				        isthd_cre_date,
"
"				        isthd_upd_by,
"
"					isthd_upd_emp_id,
"
"					isthd_upd_ip_addr,
"
"					isthd_upd_os_user,
"
"				        isthd_upd_date,
"
"				        isthd_rcpt_pfx,
"
"				        isthd_rcpt_no,
"
"				        isthd_ref_unit,
"
"				        isthd_dc_cre_flag,
"
"				        isthd_dc_cre_user,
"
"				        isthd_iss_code,
"
"				        isthd_so_ref,
"
"				        isthd_jrnl_flag,
"
"				        isthd_fin_status,
"
"				        isthd_pio_type,
"
"				        isthd_work_center,
"
"				        isthd_oprn_id,
"
"				        isthd_alloc_flag,
"
"				        isthd_fmcg_doc_type,
"
"				        isthd_fmcg_doc_no,
"
"				        isthd_out_dc_no,
"
"				        isthd_dc_no,
"
"				        isthd_fcm_bl_id,
"
"				        isthd_fcm_proj_no,
"
"                                        isthd_bond_no,
"
"					isthd_boe_no,
"
"                                        isthd_boe_date,
"
"					isthd_recvd_by,
"
"					isthd_issued_by,
"
"					isthd_imo_no,
"
"					isthd_dairy_type,
"
"					isthd_dry_seal_ser_no,
"
"					isthd_dry_insp_flag,
"
"					isthd_rqstby_entity,
"
"					isthd_issuefm_store_type,
"
"					isthd_plnt_loc_id,
"
"					isthd_plnt_loc_name,
"
"					isthd_res_id,
"
"					isthd_issueto_plnt,
"
"					isthd_issueto_plnt_loc_id,
"
"					isthd_veh_cap,
"
"					isthd_trans_id,
"
"					isthd_veh_no,
"
"					isthd_driv_name,
"
"					isthd_driv_mobile,
"
"					isthd_veh_cap_tons,
"
"					isthd_trans_chrg_amt,
"
"					isthd_fvr_emp_mr_cre_flag,
"
"					isthd_llr_no,
"
"					isthd_suplr_dc_no,
"
"					isthd_suplr_dc_date,
"
"					isthd_trans_desc,
"
"					isthd_trnsp_req_flag,
"
"					isthd_loading_type,
"
"					isthd_csr_doc_no,
"
"					isthd_lot_no,
"
"					isthd_recvd_by_name,
"
"					isthd_vou_oper,
"
"					isthd_doc_pfx,
"
"					isthd_fvr_doc_no,
"
"					isthd_vou_type
"
"				   FROM inv_stock_trans_hd
"
"				  WHERE isthd_bu = p_bu
"
"				    AND isthd_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_stock_trans_ln_hist(istlnh_bu,
"
"					istlnh_doc_no,
"
"					istlnh_seq_no,
"
"					istlnh_prod_id,
"
"					istlnh_prod_rev,
"
"					istlnh_uom,
"
"					istlnh_prod_uom,
"
"					istlnh_conv_factor,
"
"					istlnh_prod_cls,
"
"					istlnh_prod_subcls,
"
"					istlnh_rqst_qty,
"
"					istlnh_trans_qty,
"
"					istlnh_rejected_qty,
"
"					istlnh_defect_qty,
"
"					istlnh_accepted_qty,
"
"					istlnh_unit_cost,
"
"					istlnh_ord_type,
"
"					istlnh_ord_no,
"
"					istlnh_proj_task_id,
"
"					istlnh_rqst_no,
"
"					istlnh_rqst_seq_no,
"
"					istlnh_tmp_doc_no,
"
"					istlnh_tmp_rtn_qty,
"
"					istlnh_tmp_batch_id,
"
"					istlnh_tmp_seq_no,
"
"					istlnh_reference,
"
"					istlnh_rev_cip_no,
"
"					istlnh_mfg_date,
"
"					istlnh_expiry_date,
"
"					istlnh_status,
"
"					istlnh_ord_pfx,
"
"					istlnh_qc_pfx,
"
"					istlnh_qc_no,
"
"					istlnh_qc_seq_no,
"
"					istlnh_chrg_amt,
"
"					istlnh_nonchrg_amt,
"
"					istlnh_lc_doc_pfx,
"
"					istlnh_lc_doc_no,
"
"					istlnh_rqst_sub_seq_no,
"
"					istlnh_grn_pfx,
"
"					istlnh_grn_no,
"
"					istlnh_grn_seq_no,
"
"					istlnh_process_id,
"
"					istlnh_po_ord_no,
"
"					istlnh_sf_code,
"
"					istlnh_cre_by,
"
"					istlnh_cre_emp_id,
"
"					istlnh_cre_ip_addr,
"
"					istlnh_cre_os_user,
"
"					istlnh_cre_date,
"
"					istlnh_upd_by,
"
"					istlnh_upd_emp_id,
"
"					istlnh_upd_ip_addr,
"
"					istlnh_upd_os_user,
"
"					istlnh_upd_date,
"
"					istlnh_trnf_acpt_qty,
"
"					istlnh_trnf_tot_acpt_qty,
"
"					istlnh_trnf_acpt_flag,
"
"					istlnh_trnf_acpt_user,
"
"					istlnh_trnf_rtn_qty,
"
"					istlnh_trnf_tot_rtn_qty,
"
"					istlnh_par_prod_id,
"
"					istlnh_par_prod_rev,
"
"					istlnh_upd_uc_ap_rq_flag,
"
"					istlnh_upd_uc_ap_cp_flag,
"
"					istlnh_receipt_no,
"
"					istlnh_dc_no,
"
"					istlnh_dc_seq_no,
"
"					istlnh_source_flag,
"
"					istlnh_rcpt_batch_id,
"
"					istlnh_dc_doc_no,
"
"					istlnh_mnt_task_id,
"
"					istlnh_mnt_oprn_id,
"
"					istlnh_mnt_wc_id,
"
"					istlnh_grn_source_type,
"
"					istlnh_plan_no,
"
"					istlnh_plan_line,
"
"					istlnh_mat_type,
"
"					istlnh_rtn_proc_qty,
"
"					istlnh_rtn_inproc_qty,
"
"					istlnh_rtn_qty,
"
"					istlnh_ord_seq_no,
"
"					istlnh_ord_sub_seq_no,
"
"					istlnh_ord_qty,
"
"					istlnh_work_center,
"
"					istlnh_excs_qty,
"
"					istlnh_type,
"
"					istlnh_so_pfx,
"
"					istlnh_so_no,
"
"					istlnh_so_seq_no,
"
"					istlnh_so_sub_seq_no,
"
"					istlnh_proj_id,
"
"					istlnh_task_id,
"
"					istlnh_res_id,
"
"					istlnh_shift_id,
"
"					istlnh_dim_req_flag,
"
"					istlnh_thickness,
"
"					istlnh_length,
"
"					istlnh_width,
"
"					istlnh_scrap_qty,
"
"					istlnh_dis_ass_qty,
"
"					istlnh_ord_sfx,
"
"					istlnh_src_prod_id,
"
"					istlnh_src_prod_rev,
"
"					istlnh_subc_bill_status,
"
"					istlnh_so_schld_desc,
"
"					istlnh_recv_trans_date,
"
"					istlnh_trans_no,
"
"					istlnh_cap_asset_id,
"
"					istlnh_par_batch_no,
"
"					istlnh_fa_type,
"
"					istlnh_upd_queue_flag,
"
"					istlnh_route_card_no,
"
"					istlnh_comp_trans_no,
"
"					istlnh_qc_rev,
"
"					istlnh_gar_pack_doc_no,
"
"					istlnh_gar_pa_id,
"
"					istlnh_pre_mr_no,
"
"					istlnh_pre_mr_seq_no,
"
"					istlnh_hsn_code,
"
"					istlnh_par_prod_ord_no,
"
"					istlnh_catalog_no,
"
"				   	istlnh_mchn_grp_id,
"
"				   	istlnh_swo_type,
"
"					istlnh_imo_no,
"
"					istlnh_rtn_imo_no,
"
"					istlnh_sub_dept_id,
"
"					istlnh_emp_id,
"
"					istlnh_store_id,
"
"					istlnh_ge_doc_no,
"
"					istlnh_aen_type,
"
"					istlnh_no_of_bale,
"
"                                        istlnh_boq_ref_no,
"
"                                        istlnh_boq_seq_no,
"
"                                        istlnh_boq_sub_seq_no,
"
"                                        istlnh_boq_ref_test_no,
"
"                                        istlnh_cust_prod_id,
"
"                                        istlnh_cust_prod_desc,
"
"					istlnh_eqpmt_id,
"
"					istlnh_oprn_ln_seq_no,
"
"					istlnh_dry_lr,
"
"					istlnh_dry_fat,
"
"					istlnh_dry_snf,
"
"					istlnh_dry_fat_kgs,
"
"					istlnh_dry_snf_kgs,
"
"					istlnh_dry_trf_qty_ltr,
"
"                                        istlnh_dry_trf_qty_kgs,
"
"					istlnh_dry_no_of_can,
"
"					istlnh_dry_rct_lr,
"
"                                        istlnh_dry_rct_fat,
"
"                                        istlnh_dry_rct_snf,
"
"                                        istlnh_dry_rct_fat_kgs,
"
"                                        istlnh_dry_rct_snf_kgs,
"
"					istlnh_dry_rct_qty_kgs,
"
"					istlnh_bag_type,
"
"					istlnh_stk_trans_qty,
"
"					istlnh_rcpt_store_id,
"
"					istlnh_sou_iss_code,
"
"					istlnh_rcpt_iss_code,
"
"					istlnh_csr_type,
"
"					istlnh_ge_seq_no,
"
"					istlnh_ge_sub_seq_no,
"
"					istlnh_mi_doc_no,
"
"					istlnh_mi_seq_no,
"
"					istlnh_height,
"
"					istlnh_outer_dia,
"
"					istlnh_inner_dia,
"
"					istlnh_density,
"
"					istlnh_fab_item_type,
"
"					istlnh_no_of_pcs,
"
"					istlnh_unit_wght,
"
"					istlnh_act_wght,
"
"					istlnh_tl_chrt_no,
"
"					istlnh_tl_station_loc,
"
"					istlnh_mostr_qty,
"
"					istlnh_short_qty,
"
"					istlnh_remarks,
"
"				        istlnh_moist_chrg_amt,
"
"					istlnh_sou_oprn_seq,
"
"					istlnh_sou_proc_id,
"
"					istlnh_sou_cc_code,
"
"					istlnh_sou_acct,
"
"					istlnh_tar_cc_code,
"
"					istlnh_tar_acct,
"
"				        istlnh_gr_wght,
"
"				        istlnh_tr_wght,
"
"				        istlnh_nt_wght,
"
"				        istlnh_tot_bags,
"
"					istlnh_ws_id,
"
"					istlnh_vou_type,
"
"					istlnh_vou_no,
"
"					istlnh_vou_seq_no,
"
"					istlnh_sel_flag,
"
"					istlnh_sel_user,
"
"					istlnh_proc_qty,
"
"					istlnh_inproc_qty,
"
"					istlnh_rwk_vou_type,
"
"					istlnh_billfr_loc_name,
"
"					istlnh_shipfr_loc_name,
"
"					istlnh_tool_life,
"
"					istlnh_csr_doc_no,
"
"					istlnh_fa_conv_qty,
"
"					istlnh_tool_wrk_ord_no
"
"				       )
"
"    				 SELECT istln_bu,
"
"	   				istln_doc_no,
"
"				   	istln_seq_no,
"
"				   	istln_prod_id,
"
"				   	istln_prod_rev,
"
"				   	istln_uom,
"
"				   	istln_prod_uom,
"
"				   	istln_conv_factor,
"
"				   	istln_prod_cls,
"
"					istln_prod_subcls,
"
"				   	istln_rqst_qty,
"
"				   	istln_trans_qty,
"
"				   	istln_rejected_qty,
"
"				   	istln_defect_qty,
"
"				   	istln_accepted_qty,
"
"				   	istln_unit_cost,
"
"				   	istln_ord_type,
"
"				   	istln_ord_no,
"
"				   	istln_proj_task_id,
"
"				   	istln_rqst_no,
"
"				   	istln_rqst_seq_no,
"
"				   	istln_tmp_doc_no,
"
"				   	istln_tmp_rtn_qty,
"
"				   	istln_tmp_batch_id,
"
"				   	istln_tmp_seq_no,
"
"				   	istln_reference,
"
"				   	istln_rev_cip_no,
"
"				   	istln_mfg_date,
"
"				   	istln_expiry_date,
"
"				   	istln_status,
"
"				   	istln_ord_pfx,
"
"				   	istln_qc_pfx,
"
"				   	istln_qc_no,
"
"				   	istln_qc_seq_no,
"
"				   	istln_chrg_amt,
"
"				   	istln_nonchrg_amt,
"
"				   	istln_lc_doc_pfx,
"
"				   	istln_lc_doc_no,
"
"				   	istln_rqst_sub_seq_no,
"
"				   	istln_grn_pfx,
"
"				   	istln_grn_no,
"
"				   	istln_grn_seq_no,
"
"				   	istln_process_id,
"
"				   	istln_po_ord_no,
"
"				   	istln_sf_code,
"
"				   	istln_cre_by,
"
"					istln_cre_emp_id,
"
"					istln_cre_ip_addr,
"
"					istln_cre_os_user,
"
"				   	istln_cre_date,
"
"				   	istln_upd_by,
"
"					istln_upd_emp_id,
"
"					istln_upd_ip_addr,
"
"					istln_upd_os_user,
"
"				   	istln_upd_date,
"
"				   	istln_trnf_acpt_qty,
"
"				   	istln_trnf_tot_acpt_qty,
"
"				   	istln_trnf_acpt_flag,
"
"				   	istln_trnf_acpt_user,
"
"				   	istln_trnf_rtn_qty,
"
"				   	istln_trnf_tot_rtn_qty,
"
"				   	istln_par_prod_id,
"
"				   	istln_par_prod_rev,
"
"				   	istln_upd_uc_ap_rq_flag,
"
"				   	istln_upd_uc_ap_cp_flag,
"
"				   	istln_receipt_no,
"
"				   	istln_dc_no,
"
"				   	istln_dc_seq_no,
"
"				   	NVL(istln_source_flag,'N'),
"
"				   	istln_rcpt_batch_id,
"
"				   	istln_dc_doc_no,
"
"				   	istln_mnt_task_id,
"
"				   	istln_mnt_oprn_id,
"
"				   	istln_mnt_wc_id,
"
"				   	istln_grn_source_type,
"
"				   	istln_plan_no,
"
"				   	istln_plan_line,
"
"				   	istln_mat_type,
"
"				   	istln_rtn_proc_qty,
"
"				   	istln_rtn_inproc_qty,
"
"				   	istln_rtn_qty,
"
"				   	istln_ord_seq_no,
"
"				   	istln_ord_sub_seq_no,
"
"				   	istln_ord_qty,
"
"				   	istln_work_center,
"
"				   	istln_excs_qty,
"
"				   	istln_type,
"
"				   	istln_so_pfx,
"
"				   	istln_so_no,
"
"				   	istln_so_seq_no,
"
"				   	istln_so_sub_seq_no,
"
"				   	istln_proj_id,
"
"				   	istln_task_id,
"
"				   	istln_res_id,
"
"				   	istln_shift_id,
"
"				   	istln_dim_req_flag,
"
"				   	istln_thickness,
"
"				   	istln_length,
"
"				   	istln_width,
"
"				   	istln_scrap_qty,
"
"				   	istln_dis_ass_qty,
"
"				   	istln_ord_sfx,
"
"				   	istln_src_prod_id,
"
"				   	istln_src_prod_rev,
"
"				   	NVL(istln_subc_bill_status,'N'),
"
"				   	istln_so_schld_desc,
"
"				   	istln_recv_trans_date,
"
"				   	istln_trans_no,
"
"				   	istln_cap_asset_id,
"
"				   	istln_par_batch_no,
"
"				   	istln_fa_type,
"
"				   	istln_upd_queue_flag,
"
"				   	istln_route_card_no,
"
"				   	istln_comp_trans_no,
"
"				   	istln_qc_rev,
"
"				   	istln_gar_pack_doc_no,
"
"				   	istln_gar_pa_id,
"
"				   	istln_pre_mr_no,
"
"				   	istln_pre_mr_seq_no,
"
"				   	istln_hsn_code,
"
"				   	istln_par_prod_ord_no,
"
"				   	istln_catalog_no,
"
"				   	istln_mchn_grp_id,
"
"				   	istln_swo_type,
"
"					istln_imo_no,
"
"					istln_rtn_imo_no,
"
"					istln_sub_dept_id,
"
"					istln_emp_id,
"
"					istln_store_id,
"
"					istln_ge_doc_no,
"
"					istln_aen_type,
"
"					istln_no_of_bale,
"
"                                        istln_boq_ref_no,
"
"                                        istln_boq_seq_no,
"
"                                        istln_boq_sub_seq_no,
"
"                                        istln_boq_ref_test_no,
"
"                                        istln_cust_prod_id,
"
"                                        istln_cust_prod_desc,
"
"					istln_eqpmt_id,
"
"					istln_oprn_ln_seq_no,
"
"					istln_dry_lr,
"
"					istln_dry_fat,
"
"					istln_dry_snf,
"
"					istln_dry_fat_kgs,
"
"					istln_dry_snf_kgs,
"
"					istln_dry_trf_qty_ltr,
"
"                                        istln_dry_trf_qty_kgs,
"
"					istln_dry_no_of_can,
"
"					istln_dry_rct_lr,
"
"                                        istln_dry_rct_fat,
"
"                                        istln_dry_rct_snf,
"
"                                        istln_dry_rct_fat_kgs,
"
"                                        istln_dry_rct_snf_kgs,
"
"					istln_dry_rct_qty_kgs,
"
"					istln_bag_type,
"
"					istln_stk_trans_qty,
"
"					istln_rcpt_store_id,
"
"					istln_sou_iss_code,
"
"					istln_rcpt_iss_code,
"
"					istln_csr_type,
"
"					istln_ge_seq_no,
"
"					istln_ge_sub_seq_no,
"
"					istln_mi_doc_no,
"
"					istln_mi_seq_no,
"
"					istln_height,
"
"					istln_outer_dia,
"
"					istln_inner_dia,
"
"					istln_density,
"
"					istln_fab_item_type,
"
"					istln_no_of_pcs,
"
"					istln_unit_wght,
"
"					istln_act_wght,
"
"					istln_tl_chrt_no,
"
"					istln_tl_station_loc,
"
"					istln_mostr_qty,
"
"					istln_short_qty,
"
"					istln_remarks,
"
"				        istln_moist_chrg_amt,
"
"					istln_sou_oprn_seq,
"
"					istln_sou_proc_id,
"
"					istln_sou_cc_code,
"
"					istln_sou_acct,
"
"					istln_tar_cc_code,
"
"					istln_tar_acct,
"
"				        istln_gr_wght,
"
"				        istln_tr_wght,
"
"				        istln_nt_wght,
"
"				        istln_tot_bags,
"
"					istln_ws_id,
"
"					istln_vou_type,
"
"					istln_vou_no,
"
"					istln_vou_seq_no,
"
"					istln_sel_flag,
"
"					istln_sel_user,
"
"					istln_proc_qty,
"
"					istln_inproc_qty,
"
"					istln_rwk_vou_type,
"
"					istln_billfr_loc_name,
"
"					istln_shipfr_loc_name,
"
"					istln_tool_life,
"
"					istln_csr_doc_no,
"
"					istln_fa_conv_qty,
"
"					istln_tool_wrk_ord_no
"
"			           FROM inv_stock_trans_ln
"
"			          WHERE istln_bu = p_bu
"
"			            AND istln_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_stock_batch_details_hist(isbdh_bu,
"
"					     isbdh_seq_no,
"
"					     isbdh_sub_seq_no,
"
"					     isbdh_issue_doc_no,
"
"					     isbdh_trans_qty,
"
"					     isbdh_lot_no,
"
"					     isbdh_serial_no,
"
"					     isbdh_source_id,
"
"					     isbdh_source_type,
"
"					     isbdh_expiry_date,
"
"					     isbdh_ins_rec,
"
"					     isbdh_cre_by,
"
"					     isbdh_cre_date,
"
"					     isbdh_upd_by,
"
"					     isbdh_upd_date,
"
"					     isbdh_trnf_acpt_qty,
"
"					     isbdh_trnf_rtn_qty,
"
"					     isbdh_trnf_tot_acpt_qty,
"
"					     isbdh_trnf_tot_rtn_qty,
"
"					     isbdh_upd_uc_ap_rq_flag,
"
"					     isbdh_upd_uc_ap_cp_flag,
"
"					     isbdh_rtn_proc_qty,
"
"					     isbdh_rtn_inproc_qty,
"
"					     isbdh_rtn_qty,
"
"					     isbdh_excs_qty,
"
"					     isbdh_excs_rtn_qty,
"
"					     isbdh_excs_proc_qty,
"
"					     isbdh_excs_inproc_qty,
"
"					     isbdh_excs_sel_flag,
"
"					     isbdh_excs_sel_user,
"
"					     isbdh_sys_ls_no,
"
"					     isbdh_scrap_qty,
"
"					     isbdh_dis_ass_qty,
"
"					     isbdh_rtn_temp_qty,
"
"					     isbdh_finalize,
"
"					     isbdh_hist_flag,
"
"					     isbdh_tdc,
"
"					     isbdh_uts,
"
"					     isbdh_ys,
"
"					     isbdh_hrb,
"
"					     isbdh_elo,
"
"					     isbdh_no_of_bale,
"
"					     isbdh_batch_no,
"
"					     isbdh_no_of_yarn,
"
"					     isbdh_stk_trans_qty,
"
"				             isbdh_heat_no,
"
"				             isbdh_test_no,
"
"					     isbdh_act_wght,
"
"					     isbdh_gr_wght,
"
"					     isbdh_tr_wght,
"
"					     isbdh_nt_wght,
"
"					     isbdh_tot_bags,
"
"					     isbdh_store_id,
"
"					     isbdh_unit_cost,
"
"					     isbdh_new_sys_ls_no,
"
"					     isbdh_conv_factor,
"
"					     isbdh_mfg_date
"
"					    )
"
"    				      SELECT isbd_bu,
"
"	   				     isbd_seq_no,
"
"	   				     isbd_sub_seq_no,
"
"	   				     isbd_issue_doc_no,
"
"	   				     isbd_trans_qty,
"
"	   				     isbd_lot_no,
"
"	   				     isbd_serial_no,
"
"	   				     isbd_source_id,
"
"	   				     isbd_source_type,
"
"	   				     isbd_expiry_date,
"
"	   				     isbd_ins_rec,
"
"	   				     isbd_cre_by,
"
"	   				     isbd_cre_date,
"
"	   				     isbd_upd_by,
"
"	   				     isbd_upd_date,
"
"	   				     isbd_trnf_acpt_qty,
"
"	   				     isbd_trnf_rtn_qty,
"
"	   				     isbd_trnf_tot_acpt_qty,
"
"	   				     isbd_trnf_tot_rtn_qty,
"
"	   				     isbd_upd_uc_ap_rq_flag,
"
"	   				     isbd_upd_uc_ap_cp_flag,
"
"	   				     isbd_rtn_proc_qty,
"
"	   				     isbd_rtn_inproc_qty,
"
"	   				     isbd_rtn_qty,
"
"	   				     isbd_excs_qty,
"
"	   				     isbd_excs_rtn_qty,
"
"	   				     isbd_excs_proc_qty,
"
"	   				     isbd_excs_inproc_qty,
"
"	   				     isbd_excs_sel_flag,
"
"	   				     isbd_excs_sel_user,
"
"	   				     isbd_sys_ls_no,
"
"	   				     isbd_scrap_qty,
"
"	   				     isbd_dis_ass_qty,
"
"	   				     isbd_rtn_temp_qty,
"
"	   				     isbd_finalize,
"
"	   				     isbd_hist_flag,
"
"					     isbd_tdc,
"
"					     isbd_uts,
"
"					     isbd_ys,
"
"					     isbd_hrb,
"
"					     isbd_elo,
"
"					     isbd_no_of_bale,
"
"					     isbd_batch_no,
"
"					     isbd_no_of_yarn,
"
"					     isbd_stk_trans_qty,
"
"				             isbd_heat_no,
"
"				             isbd_test_no,
"
"					     isbd_act_wght,
"
"					     isbd_gr_wght,
"
"					     isbd_tr_wght,
"
"					     isbd_nt_wght,
"
"					     isbd_tot_bags,
"
"					     isbd_store_id,
"
"					     isbd_unit_cost,
"
"					     isbd_new_sys_ls_no,
"
"					     isbd_conv_factor,
"
"					     isbd_mfg_date
"
"	   				FROM inv_stock_batch_details
"
"	   			       WHERE isbd_bu = p_bu
"
"	   			         AND isbd_issue_doc_no = p_doc_no;
"
"
"
"
"
"    INSERT INTO inv_mat_transfer_bin_hist(imtbh_bu,
"
"					  imtbh_doc_no,
"
"					  imtbh_seq_no,
"
"					  imtbh_store_id,
"
"					  imtbh_prod_id,
"
"					  imtbh_prod_rev,
"
"					  imtbh_lot_no,
"
"					  imtbh_ser_no,
"
"					  imtbh_bin_id,
"
"					  imtbh_trans_qty,
"
"					  imtbh_stk_trans_qty,
"
"					  imtbh_source_id,
"
"					  imtbh_source_type,
"
"					  imtbh_cre_by,
"
"					  imtbh_cre_date,
"
"					  imtbh_upd_by,
"
"					  imtbh_upd_date,
"
"					  imtbh_sys_ls_no,
"
"					  imtbh_hist_flag,
"
"					  imtbh_crate_id
"
"					 )
"
"			    	   SELECT imtb_bu,
"
"				          imtb_doc_no,
"
"				          imtb_seq_no,
"
"				          imtb_store_id,
"
"				          imtb_prod_id,
"
"				          imtb_prod_rev,
"
"				          imtb_lot_no,
"
"				          imtb_ser_no,
"
"				          imtb_bin_id,
"
"				          imtb_trans_qty,
"
"					  imtb_stk_trans_qty,
"
"				          imtb_source_id,
"
"				          imtb_source_type,
"
"				          imtb_cre_by,
"
"				          imtb_cre_date,
"
"				          imtb_upd_by,
"
"				          imtb_upd_date,
"
"				          imtb_sys_ls_no,
"
"				          imtb_hist_flag,
"
"					  imtb_crate_id
"
"				     FROM inv_mat_transfer_bin
"
"				    WHERE imtb_bu = p_bu
"
"				      AND imtb_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_mat_issue_bin_hist(imibh_bu,
"
"				       imibh_doc_no,
"
"				       imibh_seq_no,
"
"				       imibh_prod_id,
"
"				       imibh_prod_rev,
"
"				       imibh_bin_id,
"
"				       imibh_lot_no,
"
"				       imibh_ser_no,
"
"				       imibh_trans_qty,
"
"				       imibh_source_id,
"
"				       imibh_source_type,
"
"				       imibh_rec_flag,
"
"				       imibh_cre_by,
"
"				       imibh_cre_date,
"
"				       imibh_upd_by,
"
"				       imibh_upd_date,
"
"				       imibh_sys_ls_no,
"
"				       imibh_hist_flag,
"
"				       imibh_crate_id,
"
"				       imibh_stk_trans_qty
"
"				      )
"
"    			        SELECT imib_bu,
"
"				       imib_doc_no,
"
"				       imib_seq_no,
"
"				       imib_prod_id,
"
"				       imib_prod_rev,
"
"				       imib_bin_id,
"
"				       imib_lot_no,
"
"				       imib_ser_no,
"
"				       imib_trans_qty,
"
"				       imib_source_id,
"
"				       imib_source_type,
"
"				       imib_rec_flag,
"
"				       imib_cre_by,
"
"				       imib_cre_date,
"
"				       imib_upd_by,
"
"				       imib_upd_date,
"
"				       imib_sys_ls_no,
"
"				       imib_hist_flag,
"
"				       imib_crate_id,
"
"				       imib_stk_trans_qty
"
"				  FROM inv_mat_issue_bin
"
"				 WHERE imib_bu = p_bu
"
"				   AND imib_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_stock_trans_cst_batch_hist(istcbh_bu,
"
"					       istcbh_doc_no,
"
"					       istcbh_seq_no,
"
"					       istcbh_sub_seq_no,
"
"					       istcbh_batch_no,
"
"					       istcbh_trans_qty,
"
"					       istcbh_unit_cost,
"
"					       istcbh_cre_by,
"
"					       istcbh_cre_date,
"
"					       istcbh_upd_by,
"
"					       istcbh_upd_date,
"
"					       istcbh_ins_rec,
"
"					       istcbh_trnf_tot_acpt_qty,
"
"					       istcbh_trnf_tot_rtn_qty,
"
"					       istcbh_hist_flag,
"
"					       istcbh_stk_trans_qty,
"
"					       istcbh_grn_bill_no,
"
"					       istcbh_grn_bill_date,
"
"					       istcbh_sys_ls_no
"
"					      )
"
"				        SELECT istcb_bu,
"
"					       istcb_doc_no,
"
"					       istcb_seq_no,
"
"					       istcb_sub_seq_no,
"
"					       istcb_batch_no,
"
"					       istcb_trans_qty,
"
"					       istcb_unit_cost,
"
"					       istcb_cre_by,
"
"					       istcb_cre_date,
"
"					       istcb_upd_by,
"
"					       istcb_upd_date,
"
"					       istcb_ins_rec,
"
"					       istcb_trnf_tot_acpt_qty,
"
"					       istcb_trnf_tot_rtn_qty,
"
"					       istcb_hist_flag,
"
"					       istcb_stk_trans_qty,
"
"					       istcb_grn_bill_no,
"
"					       istcb_grn_bill_date,
"
"					       istcb_sys_ls_no
"
"					  FROM inv_stock_trans_cost_batch
"
"					 WHERE istcb_bu = p_bu
"
"					   AND istcb_doc_no = p_doc_no;
"
"
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
"					 prlch_billfr_loc,
"
"					 prlch_state_code,
"
"					 prlch_igst_pct,
"
"					 prlch_igst_amt,
"
"					 prlch_cgst_pct,
"
"					 prlch_cgst_amt,
"
"					 prlch_sgst_pct,
"
"					 prlch_sgst_amt,
"
"					 prlch_utgst_pct,
"
"					 prlch_utgst_amt,
"
"					 prlch_cess_pct,
"
"					 prlch_cess_amt,
"
"					 prlch_gst_type,
"
"					 prlch_gst_clf_type,
"
"					 prlch_gst_exempt_type
"
"
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
"	   prlc_billfr_loc,
"
"	   prlc_state_code,
"
"	   prlc_igst_pct,
"
"	   prlc_igst_amt,
"
"	   prlc_cgst_pct,
"
"	   prlc_cgst_amt,
"
"	   prlc_sgst_pct,
"
"	   prlc_sgst_amt,
"
"	   prlc_utgst_pct,
"
"	   prlc_utgst_amt,
"
"	   prlc_cess_pct,
"
"	   prlc_cess_amt,
"
"	   prlc_gst_type,
"
"	   prlc_gst_clf_type,
"
"	   prlc_gst_exempt_type
"
"      FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_doc_no;
"
"
"
"    UPDATE inv_stock_trans_cost_batch
"
"       SET istcb_hist_flag = 'Y'
"
"     WHERE istcb_bu = p_bu
"
"       AND istcb_doc_no = p_doc_no;
"
"
"
"    UPDATE inv_mat_issue_bin
"
"       SET imib_hist_flag = 'Y'
"
"     WHERE imib_bu = p_bu
"
"       AND imib_doc_no = p_doc_no;
"
"
"
"    UPDATE inv_mat_transfer_bin
"
"       SET imtb_hist_flag = 'Y'
"
"     WHERE imtb_bu = p_bu
"
"       AND imtb_doc_no = p_doc_no;
"
"
"
"    UPDATE inv_stock_batch_details
"
"       SET isbd_hist_flag = 'Y'
"
"     WHERE isbd_bu = p_bu
"
"       AND isbd_issue_doc_no = p_doc_no;
"
"
"
"    DELETE FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM inv_stock_trans_cost_batch
"
"     WHERE istcb_bu = p_bu
"
"       AND istcb_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_issue_bin
"
"     WHERE imib_bu = p_bu
"
"       AND imib_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM inv_mat_transfer_bin
"
"     WHERE imtb_bu = p_bu
"
"       AND imtb_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM inv_stock_batch_details
"
"     WHERE isbd_bu = p_bu
"
"       AND isbd_issue_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM inv_stock_trans_ln
"
"     WHERE istln_bu = p_bu
"
"       AND istln_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM inv_stock_trans_hd
"
"     WHERE isthd_bu = p_bu
"
"       AND isthd_doc_no = p_doc_no;
"
"
"
"  END proc_ins_mi_hist;
"
"
"
"  PROCEDURE proc_rev_mi_hist(p_bu		inv_stock_trans_hd.isthd_bu%TYPE,
"
"			     p_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE
"
"			    )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"				   isthd_doc_no,
"
"				   isthd_doc_oper,
"
"				   isthd_issuefm_store_id,
"
"				   isthd_issueto_type,
"
"				   isthd_issueto_id,
"
"				   isthd_trans_date,
"
"				   isthd_year,
"
"				   isthd_period,
"
"				   isthd_status,
"
"				   isthd_reference,
"
"				   isthd_issuer_id,
"
"				   isthd_issuer_name,
"
"				   isthd_issuer_pos_id,
"
"				   isthd_issuer_pos_name,
"
"				   isthd_rec_src_flag,
"
"				   isthd_dc_type,
"
"				   isthd_return_type,
"
"				   isthd_plnt,
"
"				   isthd_inspection_type,
"
"				   isthd_cust_id,
"
"				   isthd_third_party,
"
"				   isthd_qc_ref,
"
"				   isthd_cre_by,
"
"				   isthd_cre_date,
"
"				   isthd_upd_by,
"
"				   isthd_upd_date,
"
"				   isthd_rcpt_pfx,
"
"				   isthd_rcpt_no,
"
"				   isthd_ref_unit,
"
"				   isthd_dc_cre_flag,
"
"				   isthd_dc_cre_user,
"
"				   isthd_iss_code,
"
"				   isthd_so_ref,
"
"				   isthd_jrnl_flag,
"
"				   isthd_fin_status,
"
"				   isthd_pio_type,
"
"				   isthd_work_center,
"
"				   isthd_oprn_id,
"
"				   isthd_alloc_flag,
"
"				   isthd_fmcg_doc_type,
"
"				   isthd_fmcg_doc_no,
"
"				   isthd_out_dc_no,
"
"				   isthd_dc_no,
"
"				   isthd_fcm_bl_id,
"
"				   isthd_fcm_proj_no,
"
"				   isthd_bond_no,
"
"				   isthd_boe_no,
"
"                                   isthd_boe_date,
"
"				   isthd_recvd_by,
"
"				   isthd_issued_by,
"
"				   isthd_imo_no,
"
"				   isthd_dairy_type,
"
"				   isthd_dry_seal_ser_no,
"
"				   isthd_dry_insp_flag,
"
"				   isthd_rqstby_entity,
"
"				   isthd_issuefm_store_type,
"
"				   isthd_plnt_loc_id,
"
"				   isthd_plnt_loc_name,
"
"				   isthd_issueto_plnt,
"
"				   isthd_issueto_plnt_loc_id,
"
"				   isthd_veh_cap,
"
"				   isthd_trans_id,
"
"				   isthd_veh_no,
"
"				   isthd_driv_name,
"
"				   isthd_driv_mobile,
"
"				   isthd_trans_chrg_amt,
"
"				   isthd_llr_no,
"
"				   isthd_suplr_dc_no,
"
"				   isthd_suplr_dc_date,
"
"				   isthd_trans_desc,
"
"				   isthd_trnsp_req_flag,
"
"				   isthd_loading_type,
"
"				   isthd_lot_no,
"
"				   isthd_recvd_by_name,
"
"				   isthd_vou_oper,
"
"				   isthd_doc_pfx,
"
"				   isthd_cre_ip_addr,
"
"                                   isthd_cre_os_user,
"
"                                   isthd_cre_emp_id,
"
"                                   isthd_upd_ip_addr,
"
"                                   isthd_upd_os_user,
"
"                                   isthd_upd_emp_id
"
"				  )
"
"                            SELECT isthdh_bu,
"
"				   isthdh_doc_no,
"
"				   isthdh_doc_oper,
"
"				   isthdh_issuefm_store_id,
"
"				   isthdh_issueto_type,
"
"				   isthdh_issueto_id,
"
"				   isthdh_trans_date,
"
"				   isthdh_year,
"
"				   isthdh_period,
"
"				   isthdh_status,
"
"				   isthdh_reference,
"
"				   isthdh_issuer_id,
"
"				   isthdh_issuer_name,
"
"				   isthdh_issuer_pos_id,
"
"				   isthdh_issuer_pos_name,
"
"				   isthdh_rec_src_flag,
"
"				   isthdh_dc_type,
"
"				   isthdh_return_type,
"
"				   isthdh_plnt,
"
"				   isthdh_inspection_type,
"
"				   isthdh_cust_id,
"
"				   isthdh_third_party,
"
"				   isthdh_qc_ref,
"
"				   isthdh_cre_by,
"
"				   isthdh_cre_date,
"
"				   isthdh_upd_by,
"
"				   isthdh_upd_date,
"
"				   isthdh_rcpt_pfx,
"
"				   isthdh_rcpt_no,
"
"				   isthdh_ref_unit,
"
"				   isthdh_dc_cre_flag,
"
"				   isthdh_dc_cre_user,
"
"				   isthdh_iss_code,
"
"				   isthdh_so_ref,
"
"				   isthdh_jrnl_flag,
"
"				   isthdh_fin_status,
"
"				   isthdh_pio_type,
"
"				   isthdh_work_center,
"
"				   isthdh_oprn_id,
"
"				   isthdh_alloc_flag,
"
"				   isthdh_fmcg_doc_type,
"
"				   isthdh_fmcg_doc_no,
"
"				   isthdh_out_dc_no,
"
"				   isthdh_dc_no,
"
"				   isthdh_fcm_bl_id,
"
"				   isthdh_fcm_proj_no,
"
"                                   isthdh_bond_no,
"
"				   isthdh_boe_no,
"
"                                   isthdh_boe_date,
"
"				   isthdh_recvd_by,
"
"				   isthdh_issued_by,
"
"				   isthdh_imo_no,
"
"				   isthdh_dairy_type,
"
"				   isthdh_dry_seal_ser_no,
"
"				   isthdh_dry_insp_flag,
"
"				   isthdh_rqstby_entity,
"
"				   isthdh_issuefm_store_type,
"
"				   isthdh_plnt_loc_id,
"
"				   isthdh_plnt_loc_name,
"
"				   isthdh_issueto_plnt,
"
"				   isthdh_issueto_plnt_loc_id,
"
"				   isthdh_veh_cap,
"
"				   isthdh_trans_id,
"
"				   isthdh_veh_no,
"
"				   isthdh_driv_name,
"
"				   isthdh_driv_mobile,
"
"				   isthdh_trans_chrg_amt,
"
"				   isthdh_llr_no,
"
"				   isthdh_suplr_dc_no,
"
"				   isthdh_suplr_dc_date,
"
"				   isthdh_trans_desc,
"
"				   isthdh_trnsp_req_flag,
"
"				   isthdh_loading_type,
"
"				   isthdh_lot_no,
"
"				   isthdh_recvd_by_name,
"
"				   isthdh_vou_oper,
"
"				   isthdh_doc_pfx,
"
"				   isthdh_cre_ip_addr,
"
"                                   isthdh_cre_os_user,
"
"                                   isthdh_cre_emp_id,
"
"                                   isthdh_upd_ip_addr,
"
"                                   isthdh_upd_os_user,
"
"                                   isthdh_upd_emp_id
"
"                              FROM inv_stock_trans_hd_hist
"
"                             WHERE isthdh_bu = p_bu
"
"                               AND isthdh_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_stock_trans_ln(istln_bu,
"
"				   istln_doc_no,
"
"				   istln_seq_no,
"
"				   istln_prod_id,
"
"				   istln_prod_rev,
"
"				   istln_uom,
"
"				   istln_prod_uom,
"
"				   istln_conv_factor,
"
"				   istln_prod_cls,
"
"				   istln_prod_subcls,
"
"				   istln_rqst_qty,
"
"				   istln_trans_qty,
"
"				   istln_rejected_qty,
"
"				   istln_defect_qty,
"
"				   istln_accepted_qty,
"
"				   istln_unit_cost,
"
"				   istln_ord_type,
"
"				   istln_ord_no,
"
"				   istln_proj_task_id,
"
"				   istln_rqst_no,
"
"				   istln_rqst_seq_no,
"
"				   istln_tmp_doc_no,
"
"				   istln_tmp_rtn_qty,
"
"				   istln_tmp_batch_id,
"
"				   istln_tmp_seq_no,
"
"				   istln_reference,
"
"				   istln_rev_cip_no,
"
"				   istln_mfg_date,
"
"				   istln_expiry_date,
"
"				   istln_status,
"
"				   istln_ord_pfx,
"
"				   istln_qc_pfx,
"
"				   istln_qc_no,
"
"				   istln_qc_seq_no,
"
"				   istln_chrg_amt,
"
"				   istln_nonchrg_amt,
"
"				   istln_lc_doc_pfx,
"
"				   istln_lc_doc_no,
"
"				   istln_rqst_sub_seq_no,
"
"				   istln_grn_pfx,
"
"				   istln_grn_no,
"
"				   istln_grn_seq_no,
"
"				   istln_process_id,
"
"				   istln_po_ord_no,
"
"				   istln_sf_code,
"
"				   istln_cre_by,
"
"				   istln_cre_date,
"
"				   istln_upd_by,
"
"				   istln_upd_date,
"
"				   istln_trnf_acpt_qty,
"
"				   istln_trnf_tot_acpt_qty,
"
"				   istln_trnf_acpt_flag,
"
"				   istln_trnf_acpt_user,
"
"				   istln_trnf_rtn_qty,
"
"				   istln_trnf_tot_rtn_qty,
"
"				   istln_par_prod_id,
"
"				   istln_par_prod_rev,
"
"				   istln_upd_uc_ap_rq_flag,
"
"				   istln_upd_uc_ap_cp_flag,
"
"				   istln_receipt_no,
"
"				   istln_dc_no,
"
"				   istln_dc_seq_no,
"
"				   istln_source_flag,
"
"				   istln_rcpt_batch_id,
"
"				   istln_dc_doc_no,
"
"				   istln_mnt_task_id,
"
"				   istln_mnt_oprn_id,
"
"				   istln_mnt_wc_id,
"
"				   istln_grn_source_type,
"
"				   istln_plan_no,
"
"				   istln_plan_line,
"
"				   istln_mat_type,
"
"				   istln_rtn_proc_qty,
"
"				   istln_rtn_inproc_qty,
"
"				   istln_rtn_qty,
"
"				   istln_ord_seq_no,
"
"				   istln_ord_sub_seq_no,
"
"				   istln_ord_qty,
"
"				   istln_work_center,
"
"				   istln_excs_qty,
"
"				   istln_type,
"
"				   istln_so_pfx,
"
"				   istln_so_no,
"
"				   istln_so_seq_no,
"
"				   istln_so_sub_seq_no,
"
"				   istln_proj_id,
"
"				   istln_task_id,
"
"				   istln_res_id,
"
"				   istln_shift_id,
"
"				   istln_dim_req_flag,
"
"				   istln_thickness,
"
"				   istln_length,
"
"				   istln_width,
"
"				   istln_scrap_qty,
"
"				   istln_dis_ass_qty,
"
"				   istln_ord_sfx,
"
"				   istln_src_prod_id,
"
"				   istln_src_prod_rev,
"
"				   istln_subc_bill_status,
"
"				   istln_so_schld_desc,
"
"				   istln_recv_trans_date,
"
"				   istln_trans_no,
"
"				   istln_cap_asset_id,
"
"				   istln_par_batch_no,
"
"				   istln_fa_type,
"
"				   istln_upd_queue_flag,
"
"				   istln_route_card_no,
"
"				   istln_comp_trans_no,
"
"				   istln_qc_rev,
"
"				   istln_gar_pack_doc_no,
"
"				   istln_gar_pa_id,
"
"				   istln_pre_mr_no,
"
"				   istln_pre_mr_seq_no,
"
"				   istln_hsn_code,
"
"				   istln_par_prod_ord_no,
"
"				   istln_catalog_no,
"
"				   istln_mchn_grp_id,
"
"				   istln_swo_type,
"
"				   istln_imo_no,
"
"				   istln_rtn_imo_no,
"
"				   istln_sub_dept_id,
"
"				   istln_emp_id,
"
"				   istln_store_id,
"
"				   istln_ge_doc_no,
"
"				   istln_aen_type,
"
"				   istln_no_of_bale,
"
"                                   istln_boq_ref_no,
"
"                                   istln_boq_seq_no,
"
"                                   istln_boq_sub_seq_no,
"
"                                   istln_boq_ref_test_no,
"
"                                   istln_cust_prod_id,
"
"                                   istln_cust_prod_desc,
"
"				   istln_eqpmt_id,
"
"                                   istln_oprn_ln_seq_no,
"
"                                   istln_dry_lr,
"
"                                   istln_dry_fat,
"
"                                   istln_dry_snf,
"
"                                   istln_dry_fat_kgs,
"
"                                   istln_dry_snf_kgs,
"
"                                   istln_dry_trf_qty_ltr,
"
"                                   istln_dry_trf_qty_kgs,
"
"                                   istln_dry_no_of_can,
"
"                                   istln_dry_rct_lr,
"
"                                   istln_dry_rct_fat,
"
"                                   istln_dry_rct_snf,
"
"                                   istln_dry_rct_fat_kgs,
"
"                                   istln_dry_rct_snf_kgs,
"
"                                   istln_dry_rct_qty_kgs,
"
"                                   istln_bag_type,
"
"                                   istln_stk_trans_qty,
"
"                                   istln_rcpt_store_id,
"
"				   istln_sou_iss_code,
"
"				   istln_rcpt_iss_code,
"
"				   istln_csr_type,
"
"				   istln_ge_seq_no,
"
"				   istln_ge_sub_seq_no,
"
"				   istln_mi_doc_no,
"
"				   istln_mi_seq_no,
"
"				   istln_height,
"
"				   istln_outer_dia,
"
"				   istln_inner_dia,
"
"				   istln_density,
"
"				   istln_fab_item_type,
"
"				   istln_no_of_pcs,
"
"				   istln_unit_wght,
"
"				   istln_act_wght,
"
"				   istln_tl_chrt_no,
"
"				   istln_tl_station_loc,
"
"				   istln_mostr_qty,
"
"				   istln_short_qty,
"
"			           istln_remarks,
"
"				   istln_moist_chrg_amt,
"
"				   istln_sou_oprn_seq,
"
"				   istln_sou_proc_id,
"
"				   istln_sou_cc_code,
"
"				   istln_sou_acct,
"
"				   istln_tar_cc_code,
"
"				   istln_tar_acct,
"
"				   istln_gr_wght,
"
"				   istln_tr_wght,
"
"				   istln_nt_wght,
"
"				   istln_tot_bags,
"
"				   istln_ws_id,
"
"				   istln_vou_type,
"
"				   istln_vou_no,
"
"				   istln_vou_seq_no,
"
"				   istln_sel_flag,
"
"				   istln_sel_user,
"
"				   istln_proc_qty,
"
"				   istln_inproc_qty,
"
"				   istln_cre_ip_addr,
"
"                                   istln_cre_os_user,
"
"                                   istln_cre_emp_id,
"
"                                   istln_upd_ip_addr,
"
"                                   istln_upd_os_user,
"
"                                   istln_upd_emp_id,
"
"				   istln_billfr_loc_name,
"
"				   istln_shipfr_loc_name,
"
"				   istln_tool_life,
"
"				   istln_fa_conv_qty,
"
"				   istln_tool_wrk_ord_no
"
"				  )
"
"    			    SELECT istlnh_bu,
"
"	   			   istlnh_doc_no,
"
"				   istlnh_seq_no,
"
"				   istlnh_prod_id,
"
"				   istlnh_prod_rev,
"
"				   istlnh_uom,
"
"				   istlnh_prod_uom,
"
"				   istlnh_conv_factor,
"
"				   istlnh_prod_cls,
"
"				   istlnh_prod_subcls,
"
"				   istlnh_rqst_qty,
"
"				   istlnh_trans_qty,
"
"				   istlnh_rejected_qty,
"
"				   istlnh_defect_qty,
"
"				   istlnh_accepted_qty,
"
"				   istlnh_unit_cost,
"
"				   istlnh_ord_type,
"
"				   istlnh_ord_no,
"
"				   istlnh_proj_task_id,
"
"				   istlnh_rqst_no,
"
"				   istlnh_rqst_seq_no,
"
"				   istlnh_tmp_doc_no,
"
"				   istlnh_tmp_rtn_qty,
"
"				   istlnh_tmp_batch_id,
"
"				   istlnh_tmp_seq_no,
"
"				   istlnh_reference,
"
"				   istlnh_rev_cip_no,
"
"				   istlnh_mfg_date,
"
"				   istlnh_expiry_date,
"
"				   istlnh_status,
"
"				   istlnh_ord_pfx,
"
"				   istlnh_qc_pfx,
"
"				   istlnh_qc_no,
"
"				   istlnh_qc_seq_no,
"
"				   istlnh_chrg_amt,
"
"				   istlnh_nonchrg_amt,
"
"				   istlnh_lc_doc_pfx,
"
"				   istlnh_lc_doc_no,
"
"				   istlnh_rqst_sub_seq_no,
"
"				   istlnh_grn_pfx,
"
"				   istlnh_grn_no,
"
"				   istlnh_grn_seq_no,
"
"				   istlnh_process_id,
"
"				   istlnh_po_ord_no,
"
"				   istlnh_sf_code,
"
"				   istlnh_cre_by,
"
"				   istlnh_cre_date,
"
"				   istlnh_upd_by,
"
"				   istlnh_upd_date,
"
"				   istlnh_trnf_acpt_qty,
"
"				   istlnh_trnf_tot_acpt_qty,
"
"				   istlnh_trnf_acpt_flag,
"
"				   istlnh_trnf_acpt_user,
"
"				   istlnh_trnf_rtn_qty,
"
"				   istlnh_trnf_tot_rtn_qty,
"
"				   istlnh_par_prod_id,
"
"				   istlnh_par_prod_rev,
"
"				   istlnh_upd_uc_ap_rq_flag,
"
"				   istlnh_upd_uc_ap_cp_flag,
"
"				   istlnh_receipt_no,
"
"				   istlnh_dc_no,
"
"				   istlnh_dc_seq_no,
"
"				   istlnh_source_flag,
"
"				   istlnh_rcpt_batch_id,
"
"				   istlnh_dc_doc_no,
"
"				   istlnh_mnt_task_id,
"
"				   istlnh_mnt_oprn_id,
"
"				   istlnh_mnt_wc_id,
"
"				   istlnh_grn_source_type,
"
"				   istlnh_plan_no,
"
"				   istlnh_plan_line,
"
"				   istlnh_mat_type,
"
"				   istlnh_rtn_proc_qty,
"
"				   istlnh_rtn_inproc_qty,
"
"				   istlnh_rtn_qty,
"
"				   istlnh_ord_seq_no,
"
"				   istlnh_ord_sub_seq_no,
"
"				   istlnh_ord_qty,
"
"				   istlnh_work_center,
"
"				   istlnh_excs_qty,
"
"				   istlnh_type,
"
"				   istlnh_so_pfx,
"
"				   istlnh_so_no,
"
"				   istlnh_so_seq_no,
"
"				   istlnh_so_sub_seq_no,
"
"				   istlnh_proj_id,
"
"				   istlnh_task_id,
"
"				   istlnh_res_id,
"
"				   istlnh_shift_id,
"
"				   istlnh_dim_req_flag,
"
"				   istlnh_thickness,
"
"				   istlnh_length,
"
"				   istlnh_width,
"
"				   istlnh_scrap_qty,
"
"				   istlnh_dis_ass_qty,
"
"				   istlnh_ord_sfx,
"
"				   istlnh_src_prod_id,
"
"				   istlnh_src_prod_rev,
"
"				   istlnh_subc_bill_status,
"
"				   istlnh_so_schld_desc,
"
"				   istlnh_recv_trans_date,
"
"				   istlnh_trans_no,
"
"				   istlnh_cap_asset_id,
"
"				   istlnh_par_batch_no,
"
"				   istlnh_fa_type,
"
"				   istlnh_upd_queue_flag,
"
"				   istlnh_route_card_no,
"
"				   istlnh_comp_trans_no,
"
"				   istlnh_qc_rev,
"
"				   istlnh_gar_pack_doc_no,
"
"				   istlnh_gar_pa_id,
"
"				   istlnh_pre_mr_no,
"
"				   istlnh_pre_mr_seq_no,
"
"				   istlnh_hsn_code,
"
"				   istlnh_par_prod_ord_no,
"
"				   istlnh_catalog_no,
"
"				   istlnh_mchn_grp_id,
"
"				   istlnh_swo_type,
"
"				   istlnh_imo_no,
"
"				   istlnh_rtn_imo_no,
"
"				   istlnh_sub_dept_id,
"
"				   istlnh_emp_id,
"
"				   istlnh_store_id,
"
"				   istlnh_ge_doc_no,
"
"				   istlnh_aen_type,
"
"				   istlnh_no_of_bale,
"
"                                   istlnh_boq_ref_no,
"
"                                   istlnh_boq_seq_no,
"
"                                   istlnh_boq_sub_seq_no,
"
"                                   istlnh_boq_ref_test_no,
"
"                                   istlnh_cust_prod_id,
"
"                                   istlnh_cust_prod_desc,
"
"				   istlnh_eqpmt_id,
"
"                                   istlnh_oprn_ln_seq_no,
"
"                                   istlnh_dry_lr,
"
"                                   istlnh_dry_fat,
"
"                                   istlnh_dry_snf,
"
"                                   istlnh_dry_fat_kgs,
"
"                                   istlnh_dry_snf_kgs,
"
"                                   istlnh_dry_trf_qty_ltr,
"
"                                   istlnh_dry_trf_qty_kgs,
"
"                                   istlnh_dry_no_of_can,
"
"                                   istlnh_dry_rct_lr,
"
"                                   istlnh_dry_rct_fat,
"
"                                   istlnh_dry_rct_snf,
"
"                                   istlnh_dry_rct_fat_kgs,
"
"                                   istlnh_dry_rct_snf_kgs,
"
"                                   istlnh_dry_rct_qty_kgs,
"
"                                   istlnh_bag_type,
"
"                                   istlnh_stk_trans_qty,
"
"                                   istlnh_rcpt_store_id,
"
"				   istlnh_sou_iss_code,
"
"				   istlnh_rcpt_iss_code,
"
"				   istlnh_csr_type,
"
"				   istlnh_ge_seq_no,
"
"				   istlnh_ge_sub_seq_no,
"
"				   istlnh_mi_doc_no,
"
"				   istlnh_mi_seq_no,
"
"				   istlnh_height,
"
"				   istlnh_outer_dia,
"
"				   istlnh_inner_dia,
"
"				   istlnh_density,
"
"				   istlnh_fab_item_type,
"
"				   istlnh_no_of_pcs,
"
"				   istlnh_unit_wght,
"
"				   istlnh_act_wght,
"
"				   istlnh_tl_chrt_no,
"
"				   istlnh_tl_station_loc,
"
"			           istlnh_mostr_qty,
"
"			           istlnh_short_qty,
"
"				   istlnh_remarks,
"
"				   istlnh_moist_chrg_amt,
"
"				   istlnh_sou_oprn_seq,
"
"				   istlnh_sou_proc_id,
"
"				   istlnh_sou_cc_code,
"
"				   istlnh_sou_acct,
"
"				   istlnh_tar_cc_code,
"
"				   istlnh_tar_acct,
"
"				   istlnh_gr_wght,
"
"				   istlnh_tr_wght,
"
"				   istlnh_nt_wght,
"
"				   istlnh_tot_bags,
"
"				   istlnh_ws_id,
"
"				   istlnh_vou_type,
"
"				   istlnh_vou_no,
"
"				   istlnh_vou_seq_no,
"
"				   istlnh_sel_flag,
"
"				   istlnh_sel_user,
"
"				   istlnh_proc_qty,
"
"				   istlnh_inproc_qty,
"
"				   istlnh_cre_ip_addr,
"
"                                   istlnh_cre_os_user,
"
"                                   istlnh_cre_emp_id,
"
"                                   istlnh_upd_ip_addr,
"
"                                   istlnh_upd_os_user,
"
"                                   istlnh_upd_emp_id,
"
"				   istlnh_billfr_loc_name,
"
"				   istlnh_shipfr_loc_name,
"
"				   istlnh_tool_life,
"
"				   istlnh_fa_conv_qty,
"
"				   istlnh_tool_wrk_ord_no
"
"                              FROM inv_stock_trans_ln_hist
"
"			     WHERE istlnh_bu = p_bu
"
"			       AND istlnh_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_stock_batch_details(isbd_bu,
"
"					isbd_seq_no,
"
"					isbd_sub_seq_no,
"
"					isbd_issue_doc_no,
"
"					isbd_trans_qty,
"
"					isbd_lot_no,
"
"					isbd_serial_no,
"
"					isbd_source_id,
"
"					isbd_source_type,
"
"					isbd_expiry_date,
"
"					isbd_ins_rec,
"
"					isbd_cre_by,
"
"					isbd_cre_date,
"
"					isbd_upd_by,
"
"					isbd_upd_date,
"
"					isbd_trnf_acpt_qty,
"
"					isbd_trnf_rtn_qty,
"
"					isbd_trnf_tot_acpt_qty,
"
"					isbd_trnf_tot_rtn_qty,
"
"					isbd_upd_uc_ap_rq_flag,
"
"					isbd_upd_uc_ap_cp_flag,
"
"					isbd_rtn_proc_qty,
"
"					isbd_rtn_inproc_qty,
"
"					isbd_rtn_qty,
"
"					isbd_excs_qty,
"
"					isbd_excs_rtn_qty,
"
"					isbd_excs_proc_qty,
"
"					isbd_excs_inproc_qty,
"
"					isbd_excs_sel_flag,
"
"					isbd_excs_sel_user,
"
"					isbd_sys_ls_no,
"
"					isbd_scrap_qty,
"
"					isbd_dis_ass_qty,
"
"					isbd_rtn_temp_qty,
"
"					isbd_finalize,
"
"					isbd_hist_flag,
"
"					isbd_tdc,
"
"					isbd_uts,
"
"					isbd_ys,
"
"					isbd_hrb,
"
"					isbd_elo,
"
"					isbd_no_of_bale,
"
"					isbd_batch_no,
"
"					isbd_no_of_yarn,
"
"					isbd_stk_trans_qty,
"
"				        isbd_heat_no,
"
"				        isbd_test_no,
"
"					isbd_act_wght,
"
"					isbd_gr_wght,
"
"					isbd_tr_wght,
"
"					isbd_nt_wght,
"
"					isbd_tot_bags,
"
"					isbd_store_id,
"
"					isbd_unit_cost,
"
"					isbd_new_sys_ls_no,
"
"					isbd_conv_factor,
"
"					isbd_mfg_date,
"
"					isbd_cre_ip_addr,
"
"                                        isbd_cre_os_user,
"
"                                        isbd_cre_emp_id,
"
"                                        isbd_upd_ip_addr,
"
"                                        isbd_upd_os_user,
"
"                                        isbd_upd_emp_id
"
"				       )
"
"    				 SELECT isbdh_bu,
"
"	   				isbdh_seq_no,
"
"	   				isbdh_sub_seq_no,
"
"	   				isbdh_issue_doc_no,
"
"	   				isbdh_trans_qty,
"
"	   				isbdh_lot_no,
"
"	   				isbdh_serial_no,
"
"	   				isbdh_source_id,
"
"	   				isbdh_source_type,
"
"	   				isbdh_expiry_date,
"
"	   				'N',--isbdh_ins_rec,
"
"	   				isbdh_cre_by,
"
"	   				isbdh_cre_date,
"
"	   				isbdh_upd_by,
"
"	   				isbdh_upd_date,
"
"	   				isbdh_trnf_acpt_qty,
"
"	   				isbdh_trnf_rtn_qty,
"
"	   				isbdh_trnf_tot_acpt_qty,
"
"	   				isbdh_trnf_tot_rtn_qty,
"
"	   				isbdh_upd_uc_ap_rq_flag,
"
"	   				isbdh_upd_uc_ap_cp_flag,
"
"	   				isbdh_rtn_proc_qty,
"
"	   				isbdh_rtn_inproc_qty,
"
"	   				isbdh_rtn_qty,
"
"	   				isbdh_excs_qty,
"
"	   				isbdh_excs_rtn_qty,
"
"	   				isbdh_excs_proc_qty,
"
"	   				isbdh_excs_inproc_qty,
"
"	   				isbdh_excs_sel_flag,
"
"	   				isbdh_excs_sel_user,
"
"	   				isbdh_sys_ls_no,
"
"	   				isbdh_scrap_qty,
"
"	   				isbdh_dis_ass_qty,
"
"	   				isbdh_rtn_temp_qty,
"
"	   				isbdh_finalize,
"
"	   				isbdh_hist_flag,
"
"					isbdh_tdc,
"
"					isbdh_uts,
"
"					isbdh_ys,
"
"					isbdh_hrb,
"
"					isbdh_elo,
"
"					isbdh_no_of_bale,
"
"					isbdh_batch_no,
"
"					isbdh_no_of_yarn,
"
"					isbdh_stk_trans_qty,
"
"				        isbdh_heat_no,
"
"				        isbdh_test_no,
"
"					isbdh_act_wght,
"
"					isbdh_gr_wght,
"
"					isbdh_tr_wght,
"
"					isbdh_nt_wght,
"
"					isbdh_tot_bags,
"
"					isbdh_store_id,
"
"					isbdh_unit_cost,
"
"					isbdh_new_sys_ls_no,
"
"					isbdh_conv_factor,
"
"					isbdh_mfg_date,
"
"					NVL(isbdh_cre_ip_addr,'-'),
"
"                                        NVL(isbdh_cre_os_user,'-'),
"
"                                         NVL(isbdh_cre_emp_id,func_find_emp_id(p_bu,isbdh_cre_by)),
"
"                                        isbdh_upd_ip_addr,
"
"                                        isbdh_upd_os_user,
"
"                                        isbdh_upd_emp_id
"
"	   		           FROM inv_stock_batch_details_hist
"
"	   			  WHERE isbdh_bu = p_bu
"
"	   			    AND isbdh_issue_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_mat_transfer_bin(imtb_bu,
"
"				     imtb_doc_no,
"
"				     imtb_seq_no,
"
"				     imtb_store_id,
"
"				     imtb_prod_id,
"
"				     imtb_prod_rev,
"
"				     imtb_lot_no,
"
"				     imtb_ser_no,
"
"				     imtb_bin_id,
"
"				     imtb_trans_qty,
"
"				     imtb_source_id,
"
"				     imtb_source_type,
"
"				     imtb_cre_by,
"
"				     imtb_cre_date,
"
"				     imtb_upd_by,
"
"				     imtb_upd_date,
"
"				     imtb_sys_ls_no,
"
"				     imtb_hist_flag,
"
"				     imtb_crate_id,
"
"				     imtb_cre_ip_addr,
"
"                                     imtb_cre_os_user,
"
"                                     imtb_cre_emp_id,
"
"                                     imtb_upd_ip_addr,
"
"                                     imtb_upd_os_user,
"
"                                     imtb_upd_emp_id
"
"				    )
"
"                              SELECT imtbh_bu,
"
"				     imtbh_doc_no,
"
"				     imtbh_seq_no,
"
"				     imtbh_store_id,
"
"				     imtbh_prod_id,
"
"				     imtbh_prod_rev,
"
"				     imtbh_lot_no,
"
"				     imtbh_ser_no,
"
"				     imtbh_bin_id,
"
"				     imtbh_trans_qty,
"
"				     imtbh_source_id,
"
"				     imtbh_source_type,
"
"				     imtbh_cre_by,
"
"				     imtbh_cre_date,
"
"				     imtbh_upd_by,
"
"				     imtbh_upd_date,
"
"				     imtbh_sys_ls_no,
"
"				     imtbh_hist_flag,
"
"				     imtbh_crate_id,
"
"				     imtbh_cre_ip_addr,
"
"                                     imtbh_cre_os_user,
"
"                                     imtbh_cre_emp_id,
"
"                                     imtbh_upd_ip_addr,
"
"                                     imtbh_upd_os_user,
"
"                                     imtbh_upd_emp_id
"
"                                FROM inv_mat_transfer_bin_hist
"
"                               WHERE imtbh_bu = p_bu
"
"                                 AND imtbh_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_mat_issue_bin(imib_bu,
"
"				  imib_doc_no,
"
"				  imib_seq_no,
"
"				  imib_prod_id,
"
"				  imib_prod_rev,
"
"				  imib_bin_id,
"
"				  imib_lot_no,
"
"				  imib_ser_no,
"
"				  imib_trans_qty,
"
"				  imib_source_id,
"
"				  imib_source_type,
"
"				  imib_rec_flag,
"
"				  imib_cre_by,
"
"				  imib_cre_date,
"
"				  imib_upd_by,
"
"				  imib_upd_date,
"
"				  imib_sys_ls_no,
"
"				  imib_hist_flag,
"
"				  imib_crate_id,
"
"				  imib_stk_trans_qty,
"
"				  imib_cre_ip_addr,
"
"                                  imib_cre_os_user,
"
"                                  imib_cre_emp_id,
"
"                                  imib_upd_ip_addr,
"
"                                  imib_upd_os_user,
"
"                                  imib_upd_emp_id
"
"				 )
"
"    			   SELECT imibh_bu,
"
"				  imibh_doc_no,
"
"				  imibh_seq_no,
"
"				  imibh_prod_id,
"
"				  imibh_prod_rev,
"
"				  imibh_bin_id,
"
"				  imibh_lot_no,
"
"				  imibh_ser_no,
"
"				  imibh_trans_qty,
"
"				  imibh_source_id,
"
"				  imibh_source_type,
"
"				  imibh_rec_flag,--'Y',
"
"				  imibh_cre_by,
"
"				  imibh_cre_date,
"
"				  imibh_upd_by,
"
"				  imibh_upd_date,
"
"				  imibh_sys_ls_no,
"
"				  imibh_hist_flag,
"
"				  imibh_crate_id,
"
"				  imibh_stk_trans_qty,
"
"				  imibh_cre_ip_addr,
"
"                                  imibh_cre_os_user,
"
"                                  imibh_cre_emp_id,
"
"                                  imibh_upd_ip_addr,
"
"                                  imibh_upd_os_user,
"
"                                  imibh_upd_emp_id
"
"                             FROM inv_mat_issue_bin_hist
"
"			    WHERE imibh_bu = p_bu
"
"			      AND imibh_doc_no = p_doc_no;
"
"
"
"    INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"					   istcb_doc_no,
"
"					   istcb_seq_no,
"
"					   istcb_sub_seq_no,
"
"					   istcb_batch_no,
"
"					   istcb_trans_qty,
"
"					   istcb_unit_cost,
"
"					   istcb_cre_by,
"
"					   istcb_cre_date,
"
"					   istcb_upd_by,
"
"					   istcb_upd_date,
"
"					   istcb_ins_rec,
"
"					   istcb_trnf_tot_acpt_qty,
"
"					   istcb_trnf_tot_rtn_qty,
"
"					   istcb_hist_flag,
"
"					   istcb_stk_trans_qty,
"
"					   istcb_sys_ls_no,
"
"					   istcb_cre_ip_addr,
"
"                                           istcb_cre_os_user,
"
"                                           istcb_cre_emp_id,
"
"                                           istcb_upd_ip_addr,
"
"                                           istcb_upd_os_user,
"
"                                           istcb_upd_emp_id
"
"					  )
"
"			            SELECT istcbh_bu,
"
"					   istcbh_doc_no,
"
"					   istcbh_seq_no,
"
"					   istcbh_sub_seq_no,
"
"					   istcbh_batch_no,
"
"					   istcbh_trans_qty,
"
"					   istcbh_unit_cost,
"
"					   istcbh_cre_by,
"
"					   istcbh_cre_date,
"
"					   istcbh_upd_by,
"
"					   istcbh_upd_date,
"
"					   'N',--istcbh_ins_rec,
"
"					   istcbh_trnf_tot_acpt_qty,
"
"					   istcbh_trnf_tot_rtn_qty,
"
"					   istcbh_hist_flag,
"
"					   istcbh_stk_trans_qty,
"
"					   istcbh_sys_ls_no,
"
"					   istcbh_cre_ip_addr,
"
"                                           istcbh_cre_os_user,
"
"                                           istcbh_cre_emp_id,
"
"                                           istcbh_upd_ip_addr,
"
"                                           istcbh_upd_os_user,
"
"                                           istcbh_upd_emp_id
"
"				      FROM inv_stock_trans_cst_batch_hist
"
"				     WHERE istcbh_bu = p_bu
"
"				       AND istcbh_doc_no = p_doc_no;
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
"				    prlc_lc_import_flag,
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
"				    prlc_billfr_loc,
"
"				    prlc_state_code,
"
"				    prlc_igst_pct,
"
"				    prlc_igst_amt,
"
"				    prlc_cgst_pct,
"
"				    prlc_cgst_amt,
"
"				    prlc_sgst_pct,
"
"				    prlc_sgst_amt,
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
"	   prlch_lc_import_flag,
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
"	   prlch_billfr_loc,
"
"	   prlch_state_code,
"
"	   prlch_igst_pct,
"
"	   prlch_igst_amt,
"
"	   prlch_cgst_pct,
"
"	   prlch_cgst_amt,
"
"	   prlch_sgst_pct,
"
"	   prlch_sgst_amt,
"
"	   prlch_utgst_pct,
"
"	   prlch_utgst_amt,
"
"	   prlch_cess_pct,
"
"	   prlch_cess_amt,
"
"	   prlch_gst_type,
"
"	   prlch_gst_clf_type,
"
"	   prlch_gst_exempt_type
"
"      FROM pur_rcpt_land_costs_hist
"
"     WHERE prlch_bu = p_bu
"
"       AND prlch_rcpt_no = p_doc_no;
"
"
"
"    /*UPDATE inv_stock_trans_cost_batch
"
"       SET istcb_hist_flag = 'Y'
"
"     WHERE istcb_bu = p_bu
"
"       AND istcb_doc_no = p_doc_no;
"
"
"
"    UPDATE inv_mat_issue_bin
"
"       SET imib_hist_flag = 'Y'
"
"     WHERE imib_bu = p_bu
"
"       AND imib_doc_no = p_doc_no;
"
"
"
"    UPDATE inv_mat_transfer_bin
"
"       SET imtb_hist_flag = 'Y'
"
"     WHERE imtb_bu = p_bu
"
"       AND imtb_doc_no = p_doc_no;
"
"
"
"    UPDATE inv_stock_batch_details
"
"       SET isbd_hist_flag = 'Y'
"
"     WHERE isbd_bu = p_bu
"
"       AND isbd_issue_doc_no = p_doc_no;*/
"
"
"
"    DELETE FROM pur_rcpt_land_costs_hist
"
"     WHERE prlch_bu = p_bu
"
"       AND prlch_rcpt_no = p_doc_no;
"
"
"
"    DELETE FROM inv_stock_trans_cst_batch_hist
"
"     WHERE istcbh_bu = p_bu
"
"       AND istcbh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM inv_mat_issue_bin_hist
"
"     WHERE imibh_bu = p_bu
"
"       AND imibh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM inv_mat_transfer_bin_hist
"
"     WHERE imtbh_bu = p_bu
"
"       AND imtbh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM inv_stock_batch_details_hist
"
"     WHERE isbdh_bu = p_bu
"
"       AND isbdh_issue_doc_no = p_doc_no;
"
"
"
"    DELETE FROM inv_stock_trans_ln_hist
"
"     WHERE istlnh_bu = p_bu
"
"       AND istlnh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM inv_stock_trans_hd_hist
"
"     WHERE isthdh_bu = p_bu
"
"       AND isthdh_doc_no = p_doc_no;
"
"
"
"  END proc_rev_mi_hist;
"
"
"
"  PROCEDURE proc_ins_mat_ret_hist(p_bu		store_stock_trans_hd.ssthd_bu%TYPE,
"
"  				  p_doc_no	store_stock_trans_hd.ssthd_doc_no%TYPE
"
"  				 )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO store_stock_trans_hd_hist(ssthdh_bu,
"
"					  ssthdh_doc_no,
"
"					  ssthdh_fm_doc_type,
"
"					  ssthdh_fm_store_id,
"
"					  ssthdh_fm_bkt_type,
"
"					  ssthdh_to_store_id,
"
"					  ssthdh_to_bkt_type,
"
"					  ssthdh_ref,
"
"					  ssthdh_ord_type,
"
"					  ssthdh_status,
"
"					  ssthdh_date,
"
"					  ssthdh_year,
"
"					  ssthdh_period,
"
"					  ssthdh_plnt,
"
"					  ssthdh_sg_flag,
"
"					  ssthdh_proj_task_id,
"
"					  ssthdh_cre_by,
"
"					  ssthdh_cre_emp_id,
"
"					  ssthdh_cre_ip_addr,
"
"					  ssthdh_cre_os_user,
"
"					  ssthdh_cre_date,
"
"					  ssthdh_upd_by,
"
"					  ssthdh_upd_emp_id,
"
"					  ssthdh_upd_ip_addr,
"
"					  ssthdh_upd_os_user,
"
"					  ssthdh_upd_date,
"
"					  ssthdh_ref_plnt,
"
"					  ssthdh_qc_flag,
"
"					  ssthdh_type,
"
"					  ssthdh_rec_source,
"
"					  ssthdh_jrnl_flag,
"
"					  ssthdh_plnt_loc_id,
"
"					  ssthdh_plnt_loc_name,
"
"					  ssthdh_doc_pfx,
"
"					  ssthdh_appr_by,
"
"                                          ssthdh_appr_emp_id,
"
"                                          ssthdh_appr_ip_addr,
"
"                                          ssthdh_appr_os_user,
"
"                                          ssthdh_appr_date,
"
"					  ssthdh_shift_id
"
"					 )
"
"				   SELECT ssthd_bu,
"
"					  ssthd_doc_no,
"
"					  ssthd_fm_doc_type,
"
"					  ssthd_fm_store_id,
"
"					  ssthd_fm_bkt_type,
"
"					  ssthd_to_store_id,
"
"					  ssthd_to_bkt_type,
"
"					  ssthd_ref,
"
"					  ssthd_ord_type,
"
"					  ssthd_status,
"
"					  ssthd_date,
"
"					  ssthd_year,
"
"					  ssthd_period,
"
"					  ssthd_plnt,
"
"					  ssthd_sg_flag,
"
"					  ssthd_proj_task_id,
"
"					  ssthd_cre_by,
"
"					  ssthd_cre_emp_id,
"
"					  ssthd_cre_ip_addr,
"
"					  ssthd_cre_os_user,
"
"					  ssthd_cre_date,
"
"					  ssthd_upd_by,
"
"					  ssthd_upd_emp_id,
"
"					  ssthd_upd_ip_addr,
"
"					  ssthd_upd_os_user,
"
"					  ssthd_upd_date,
"
"					  ssthd_ref_plnt,
"
"					  ssthd_qc_flag,
"
"					  ssthd_type,
"
"					  ssthd_rec_source,
"
"					  ssthd_jrnl_flag,
"
"					  ssthd_plnt_loc_id,
"
"					  ssthd_plnt_loc_name,
"
"					  ssthd_doc_pfx,
"
"					  ssthd_appr_by,
"
"                                          ssthd_appr_emp_id,
"
"                                          ssthd_appr_ip_addr,
"
"                                          ssthd_appr_os_user,
"
"                                          ssthd_appr_date,
"
"					  ssthd_shift_id
"
"				     FROM store_stock_trans_hd
"
"				    WHERE ssthd_bu = p_bu
"
"				      AND ssthd_doc_no = p_doc_no;
"
"
"
"    INSERT INTO store_stock_trans_ln_hist(sstlnh_bu,
"
"					  sstlnh_doc_no,
"
"					  sstlnh_seq_no,
"
"					  sstlnh_trans_qty,
"
"					  sstlnh_prod_uom,
"
"					  sstlnh_unit_cost,
"
"					  sstlnh_prod_id,
"
"					  sstlnh_prod_rev,
"
"					  sstlnh_process_id,
"
"					  sstlnh_po_ord_no,
"
"					  sstlnh_so_order_pfx,
"
"					  sstlnh_so_ord_no,
"
"					  sstlnh_so_line_no,
"
"					  sstlnh_so_sub_seq_no,
"
"					  sstlnh_qc_no,
"
"					  sstlnh_accepted_qty,
"
"					  sstlnh_rejected_qty,
"
"					  sstlnh_primary_rejected_qty,
"
"					  sstlnh_secondary_rejected_qty,
"
"					  sstlnh_prim_rtnprcs_qty,
"
"					  sstlnh_prim_rtninprcs_qty,
"
"					  sstlnh_prim_ret_qty,
"
"					  sstlnh_sec_rtnprcs_qty,
"
"					  sstlnh_sec_rtninprcs_qty,
"
"					  sstlnh_sec_ret_qty,
"
"					  sstlnh_sec_rtn_suplr,
"
"					  sstlnh_prim_rtn_suplr,
"
"					  sstlnh_sel_flag,
"
"					  sstlnh_rtnd_doc_qty,
"
"					  sstlnh_user,
"
"					  sstlnh_prim_rwk_inside,
"
"					  sstlnh_prim_rwk_outside,
"
"					  sstlnh_prim_rwk_supplier,
"
"					  sstlnh_secon_rwk_inside,
"
"					  sstlnh_secon_rwk_outside,
"
"					  sstlnh_secon_rwk_supplier,
"
"					  sstlnh_prim_rwk_in_proc_qty,
"
"					  sstlnh_secon_rwk_in_proc_qty,
"
"					  sstlnh_prim_rwk_qty,
"
"					  sstlnh_secon_rwk_qty,
"
"					  sstlnh_task_id,
"
"					  sstlnh_qc_pfx,
"
"					  sstlnh_proj_id,
"
"					  sstlnh_so_type,
"
"					  sstlnh_sf_code,
"
"					  sstlnh_cre_by,
"
"					  sstlnh_cre_date,
"
"					  sstlnh_upd_by,
"
"					  sstlnh_upd_date,
"
"					  sstlnh_conv_factor,
"
"					  sstlnh_uom,
"
"					  sstlnh_sg_flag,
"
"					  sstlnh_mnt_task_id,
"
"					  sstlnh_mnt_oprn_id,
"
"					  sstlnh_status,
"
"					  sstlnh_rec_pri_is_repair_qty,
"
"					  sstlnh_rec_pri_scrap_qty,
"
"					  sstlnh_rec_pri_dis_ass_qty,
"
"					  sstlnh_rec_pri_rtrn_qty,
"
"					  sstlnh_rec_sec_is_repair_qty,
"
"					  sstlnh_rec_sec_scrap_qty,
"
"					  sstlnh_rec_sec_dis_ass_qty,
"
"					  sstlnh_rec_sec_rtrn_qty,
"
"					  sstlnh_rec_pri_os_repair_qty,
"
"					  sstlnh_rec_sec_os_repair_qty,
"
"					  sstlnh_mnt_wc_id,
"
"					  sstlnh_mi_doc_no,
"
"					  sstlnh_mi_seq_no,
"
"					  sstlnh_mi_doc_date,
"
"					  sstlnh_mi_sub_seq_no,
"
"					  sstlnh_cap_asset_id,
"
"					  sstlnh_ord_trans_no,
"
"					  sstlnh_so_schld_desc,
"
"					  sstlnh_hist_flag,
"
"					  sstlnh_store_id,
"
"					  sstlnh_to_store_id,
"
"					  sstlnh_dc_doc_no,
"
"					  sstlnh_dc_seq_no,
"
"					  sstlnh_prod_cls,
"
"                                          sstlnh_prod_cls_desc,
"
"                                          sstlnh_prod_sub_cls,
"
"                                          sstlnh_prod_subcls_desc,
"
"                                          sstlnh_prod_grp,
"
"                                          sstlnh_prod_grp_desc,
"
"                                          sstlnh_prod_subgrp,
"
"                                          sstlnh_prod_subgrp_desc,
"
"                                          sstlnh_prod_cls_type,
"
"					  sstlnh_oprn_ln_seq_no,
"
"					  sstlnh_tool_life
"
"					 )
"
"				   SELECT sstln_bu,
"
"					  sstln_doc_no,
"
"					  sstln_seq_no,
"
"					  sstln_trans_qty,
"
"					  sstln_prod_uom,
"
"					  sstln_unit_cost,
"
"					  sstln_prod_id,
"
"					  sstln_prod_rev,
"
"					  sstln_process_id,
"
"					  sstln_po_ord_no,
"
"					  sstln_so_order_pfx,
"
"					  sstln_so_ord_no,
"
"					  sstln_so_line_no,
"
"					  sstln_so_sub_seq_no,
"
"					  sstln_qc_no,
"
"					  sstln_accepted_qty,
"
"					  sstln_rejected_qty,
"
"					  sstln_primary_rejected_qty,
"
"					  sstln_secondary_rejected_qty,
"
"					  sstln_prim_rtnprcs_qty,
"
"					  sstln_prim_rtninprcs_qty,
"
"					  sstln_prim_ret_qty,
"
"					  sstln_sec_rtnprcs_qty,
"
"					  sstln_sec_rtninprcs_qty,
"
"					  sstln_sec_ret_qty,
"
"					  sstln_sec_rtn_suplr,
"
"					  sstln_prim_rtn_suplr,
"
"					  sstln_sel_flag,
"
"					  sstln_rtnd_doc_qty,
"
"					  sstln_user,
"
"					  sstln_prim_rwk_inside,
"
"					  sstln_prim_rwk_outside,
"
"					  sstln_prim_rwk_supplier,
"
"					  sstln_secon_rwk_inside,
"
"					  sstln_secon_rwk_outside,
"
"					  sstln_secon_rwk_supplier,
"
"					  sstln_prim_rwk_in_proc_qty,
"
"					  sstln_secon_rwk_in_proc_qty,
"
"					  sstln_prim_rwk_qty,
"
"					  sstln_secon_rwk_qty,
"
"					  sstln_task_id,
"
"					  sstln_qc_pfx,
"
"					  sstln_proj_id,
"
"					  sstln_so_type,
"
"					  sstln_sf_code,
"
"					  sstln_cre_by,
"
"					  sstln_cre_date,
"
"					  sstln_upd_by,
"
"					  sstln_upd_date,
"
"					  sstln_conv_factor,
"
"					  sstln_uom,
"
"					  sstln_sg_flag,
"
"					  sstln_mnt_task_id,
"
"					  sstln_mnt_oprn_id,
"
"					  sstln_status,
"
"					  sstln_rec_pri_is_repair_qty,
"
"					  sstln_rec_pri_scrap_qty,
"
"					  sstln_rec_pri_dis_ass_qty,
"
"					  sstln_rec_pri_rtrn_qty,
"
"					  sstln_rec_sec_is_repair_qty,
"
"					  sstln_rec_sec_scrap_qty,
"
"					  sstln_rec_sec_dis_ass_qty,
"
"					  sstln_rec_sec_rtrn_qty,
"
"					  sstln_rec_pri_os_repair_qty,
"
"					  sstln_rec_sec_os_repair_qty,
"
"					  sstln_mnt_wc_id,
"
"					  sstln_mi_doc_no,
"
"					  sstln_mi_seq_no,
"
"					  sstln_mi_doc_date,
"
"					  sstln_mi_sub_seq_no,
"
"					  sstln_cap_asset_id,
"
"					  sstln_ord_trans_no,
"
"					  sstln_so_schld_desc,
"
"					  sstln_hist_flag,
"
"					  sstln_store_id,
"
"					  sstln_to_store_id,
"
"					  sstln_dc_doc_no,
"
"					  sstln_dc_seq_no,
"
"					  sstln_prod_cls,
"
"                                          sstln_prod_cls_desc,
"
"                                          sstln_prod_sub_cls,
"
"                                          sstln_prod_subcls_desc,
"
"                                          sstln_prod_grp,
"
"                                          sstln_prod_grp_desc,
"
"                                          sstln_prod_subgrp,
"
"                                          sstln_prod_subgrp_desc,
"
"                                          sstln_prod_cls_type,
"
"					  sstln_oprn_ln_seq_no,
"
"					  sstln_tool_life
"
"				     FROM store_stock_trans_ln
"
"				    WHERE sstln_bu = p_bu
"
"				      AND sstln_doc_no = p_doc_no;
"
"
"
"    INSERT INTO store_stock_trans_dtls_hist(sstdh_bu,
"
"					    sstdh_doc_no,
"
"					    sstdh_seq_no,
"
"					    sstdh_sub_seq_no,
"
"					    sstdh_lot_no,
"
"					    sstdh_ser_no,
"
"					    sstdh_source_type,
"
"					    sstdh_source_id,
"
"					    sstdh_trans_qty,
"
"					    sstdh_fm_bin_id,
"
"					    sstdh_to_bin_id,
"
"					    sstdh_accepted_qty,
"
"					    sstdh_rejected_qty,
"
"					    sstdh_prim_rej_qty,
"
"					    sstdh_sec_rej_qty,
"
"					    sstdh_prim_rtnprcs_qty,
"
"					    sstdh_prim_rtninprcs_qty,
"
"					    sstdh_prim_ret_qty,
"
"					    sstdh_sec_rtnprcs_qty,
"
"					    sstdh_sec_rtninprcs_qty,
"
"					    sstdh_sec_ret_qty,
"
"					    sstdh_prim_rwk_inside,
"
"					    sstdh_prim_rwk_outside,
"
"					    sstdh_secon_rwk_inside,
"
"					    sstdh_secon_rwk_outside,
"
"					    sstdh_prim_rwk_in_proc_qty,
"
"					    sstdh_secon_rwk_in_proc_qty,
"
"					    sstdh_prim_rwk_qty,
"
"					    sstdh_secon_rwk_qty,
"
"					    sstdh_cre_by,
"
"					    sstdh_cre_date,
"
"					    sstdh_upd_by,
"
"					    sstdh_upd_date,
"
"					    sstdh_rec_pri_is_repair_qty,
"
"					    sstdh_rec_pri_scrap_qty,
"
"					    sstdh_rec_pri_dis_ass_qty,
"
"					    sstdh_rec_pri_rtrn_qty,
"
"					    sstdh_rec_sec_is_repair_qty,
"
"					    sstdh_rec_sec_scrap_qty,
"
"					    sstdh_rec_sec_dis_ass_qty,
"
"					    sstdh_rec_sec_rtrn_qty,
"
"					    sstdh_rec_pri_os_repair_qty,
"
"					    sstdh_rec_sec_os_repair_qty,
"
"					    sstdh_sys_ls_no,
"
"					    sstdh_expiry_date,
"
"					    sstdh_sel_flag,
"
"					    sstdh_sec_rtn_suplr,
"
"					    sstdh_prim_rtn_suplr,
"
"					    sstdh_prim_rwk_suplr,
"
"					    sstdh_secon_rwk_suplr,
"
"					    sstdh_user,
"
"					    sstdh_tr_wgt,
"
"					    sstdh_hist_flag,
"
"					    sstdh_crate_id,
"
"					    sstdh_batch_id
"
"					   )
"
"				     SELECT sstd_bu,
"
"					    sstd_doc_no,
"
"					    sstd_seq_no,
"
"					    sstd_sub_seq_no,
"
"					    sstd_lot_no,
"
"					    sstd_ser_no,
"
"					    sstd_source_type,
"
"					    sstd_source_id,
"
"					    sstd_trans_qty,
"
"					    sstd_fm_bin_id,
"
"					    sstd_to_bin_id,
"
"					    sstd_accepted_qty,
"
"					    sstd_rejected_qty,
"
"					    sstd_prim_rej_qty,
"
"					    sstd_sec_rej_qty,
"
"					    sstd_prim_rtnprcs_qty,
"
"					    sstd_prim_rtninprcs_qty,
"
"					    sstd_prim_ret_qty,
"
"					    sstd_sec_rtnprcs_qty,
"
"					    sstd_sec_rtninprcs_qty,
"
"					    sstd_sec_ret_qty,
"
"					    sstd_prim_rwk_inside,
"
"					    sstd_prim_rwk_outside,
"
"					    sstd_secon_rwk_inside,
"
"					    sstd_secon_rwk_outside,
"
"					    sstd_prim_rwk_in_proc_qty,
"
"					    sstd_secon_rwk_in_proc_qty,
"
"					    sstd_prim_rwk_qty,
"
"					    sstd_secon_rwk_qty,
"
"					    sstd_cre_by,
"
"					    sstd_cre_date,
"
"					    sstd_upd_by,
"
"					    sstd_upd_date,
"
"					    sstd_rec_pri_is_repair_qty,
"
"					    sstd_rec_pri_scrap_qty,
"
"					    sstd_rec_pri_dis_ass_qty,
"
"					    sstd_rec_pri_rtrn_qty,
"
"					    sstd_rec_sec_is_repair_qty,
"
"					    sstd_rec_sec_scrap_qty,
"
"					    sstd_rec_sec_dis_ass_qty,
"
"					    sstd_rec_sec_rtrn_qty,
"
"					    sstd_rec_pri_os_repair_qty,
"
"					    sstd_rec_sec_os_repair_qty,
"
"					    sstd_sys_ls_no,
"
"					    sstd_expiry_date,
"
"					    sstd_sel_flag,
"
"					    sstd_sec_rtn_suplr,
"
"					    sstd_prim_rtn_suplr,
"
"					    sstd_prim_rwk_suplr,
"
"					    sstd_secon_rwk_suplr,
"
"					    sstd_user,
"
"					    sstd_tr_wgt,
"
"					    sstd_hist_flag,
"
"					    sstd_crate_id,
"
"					    sstd_batch_id
"
"				       FROM store_stock_trans_dtls
"
"				      WHERE sstd_bu = p_bu
"
"				        AND sstd_doc_no = p_doc_no;
"
"
"
"    INSERT INTO store_stk_trans_cost_bat_hist(sstcbh_bu,
"
"					      sstcbh_doc_no,
"
"					      sstcbh_seq_no,
"
"					      sstcbh_sub_seq_no,
"
"					      sstcbh_batch_no,
"
"					      sstcbh_trans_qty,
"
"					      sstcbh_unit_cost,
"
"					      sstcbh_cre_by,
"
"					      sstcbh_cre_date,
"
"					      sstcbh_upd_by,
"
"					      sstcbh_upd_date,
"
"					      sstcbh_hist_flag
"
"					     )
"
"				       SELECT sstcb_bu,
"
"					      sstcb_doc_no,
"
"					      sstcb_seq_no,
"
"					      sstcb_sub_seq_no,
"
"					      sstcb_batch_no,
"
"					      sstcb_trans_qty,
"
"					      sstcb_unit_cost,
"
"					      sstcb_cre_by,
"
"					      sstcb_cre_date,
"
"					      sstcb_upd_by,
"
"					      sstcb_upd_date,
"
"					      sstcb_hist_flag
"
"					 FROM store_stock_trans_cost_batch
"
"					WHERE sstcb_bu = p_bu
"
"					  AND sstcb_doc_no = p_doc_no;
"
"
"
"    UPDATE store_stock_trans_ln
"
"       SET sstln_hist_flag = 'Y'
"
"     WHERE sstln_bu = p_bu
"
"       AND sstln_doc_no = p_doc_no;
"
"
"
"    UPDATE store_stock_trans_dtls
"
"       SET sstd_hist_flag = 'Y'
"
"     WHERE sstd_bu = p_bu
"
"       AND sstd_doc_no = p_doc_no;
"
"
"
"    UPDATE store_stock_trans_cost_batch
"
"       SET sstcb_hist_flag = 'Y'
"
"     WHERE sstcb_bu = p_bu
"
"       AND sstcb_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM store_stock_trans_cost_batch
"
"     WHERE sstcb_bu = p_bu
"
"       AND sstcb_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM store_stock_trans_dtls
"
"     WHERE sstd_bu = p_bu
"
"       AND sstd_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM store_stock_trans_ln
"
"     WHERE sstln_bu = p_bu
"
"       AND sstln_doc_no = p_doc_no;
"
"
"
"    DELETE
"
"      FROM store_stock_trans_hd
"
"     WHERE ssthd_bu = p_bu
"
"       AND ssthd_doc_no = p_doc_no;
"
"
"
"  END proc_ins_mat_ret_hist;
"
"
"
"
"
"  PROCEDURE proc_rev_mat_ret_hist(p_bu		store_stock_trans_hd.ssthd_bu%TYPE,
"
"  				  p_doc_no	store_stock_trans_hd.ssthd_doc_no%TYPE
"
"  				 )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO store_stock_trans_hd(ssthd_bu,
"
"				     ssthd_doc_no,
"
"				     ssthd_fm_doc_type,
"
"				     ssthd_fm_store_id,
"
"				     ssthd_fm_bkt_type,
"
"				     ssthd_to_store_id,
"
"				     ssthd_to_bkt_type,
"
"				     ssthd_ref,
"
"				     ssthd_ord_type,
"
"				     ssthd_status,
"
"				     ssthd_date,
"
"				     ssthd_year,
"
"				     ssthd_period,
"
"				     ssthd_plnt,
"
"				     ssthd_sg_flag,
"
"				     ssthd_proj_task_id,
"
"				     ssthd_cre_by,
"
"				     ssthd_cre_date,
"
"				     ssthd_upd_by,
"
"				     ssthd_upd_date,
"
"				     ssthd_ref_plnt,
"
"				     ssthd_qc_flag,
"
"				     ssthd_type,
"
"				     ssthd_rec_source,
"
"				     ssthd_jrnl_flag,
"
"				     ssthd_plnt_loc_id,
"
"				     ssthd_plnt_loc_name,
"
"				     ssthd_doc_pfx,
"
"				     ssthd_appr_by,
"
"                                     ssthd_appr_emp_id,
"
"                                     ssthd_appr_ip_addr,
"
"                                     ssthd_appr_os_user,
"
"                                     ssthd_appr_date
"
"				    )
"
"			      SELECT ssthdh_bu,
"
"				     ssthdh_doc_no,
"
"				     ssthdh_fm_doc_type,
"
"				     ssthdh_fm_store_id,
"
"				     ssthdh_fm_bkt_type,
"
"				     ssthdh_to_store_id,
"
"				     ssthdh_to_bkt_type,
"
"				     ssthdh_ref,
"
"				     ssthdh_ord_type,
"
"				     ssthdh_status,
"
"				     ssthdh_date,
"
"				     ssthdh_year,
"
"				     ssthdh_period,
"
"				     ssthdh_plnt,
"
"				     ssthdh_sg_flag,
"
"				     ssthdh_proj_task_id,
"
"				     ssthdh_cre_by,
"
"				     ssthdh_cre_date,
"
"				     ssthdh_upd_by,
"
"				     ssthdh_upd_date,
"
"				     ssthdh_ref_plnt,
"
"				     ssthdh_qc_flag,
"
"				     ssthdh_type,
"
"				     ssthdh_rec_source,
"
"				     ssthdh_jrnl_flag,
"
"				     ssthdh_plnt_loc_id,
"
"				     ssthdh_plnt_loc_name,
"
"				     ssthdh_doc_pfx,
"
"				     ssthdh_appr_by,
"
"                                     ssthdh_appr_emp_id,
"
"                                     ssthdh_appr_ip_addr,
"
"                                     ssthdh_appr_os_user,
"
"                                     ssthdh_appr_date
"
"			        FROM store_stock_trans_hd_hist
"
"			       WHERE ssthdh_bu = p_bu
"
"				 AND ssthdh_doc_no = p_doc_no;
"
"
"
"    INSERT INTO store_stock_trans_ln(sstln_bu,
"
"				     sstln_doc_no,
"
"				     sstln_seq_no,
"
"				     sstln_trans_qty,
"
"				     sstln_prod_uom,
"
"				     sstln_unit_cost,
"
"				     sstln_prod_id,
"
"				     sstln_prod_rev,
"
"				     sstln_process_id,
"
"				     sstln_po_ord_no,
"
"				     sstln_so_order_pfx,
"
"				     sstln_so_ord_no,
"
"				     sstln_so_line_no,
"
"				     sstln_so_sub_seq_no,
"
"				     sstln_qc_no,
"
"				     sstln_accepted_qty,
"
"				     sstln_rejected_qty,
"
"				     sstln_primary_rejected_qty,
"
"				     sstln_secondary_rejected_qty,
"
"				     sstln_prim_rtnprcs_qty,
"
"				     sstln_prim_rtninprcs_qty,
"
"				     sstln_prim_ret_qty,
"
"				     sstln_sec_rtnprcs_qty,
"
"				     sstln_sec_rtninprcs_qty,
"
"				     sstln_sec_ret_qty,
"
"				     sstln_sec_rtn_suplr,
"
"				     sstln_prim_rtn_suplr,
"
"				     sstln_sel_flag,
"
"				     sstln_rtnd_doc_qty,
"
"				     sstln_user,
"
"				     sstln_prim_rwk_inside,
"
"				     sstln_prim_rwk_outside,
"
"				     sstln_prim_rwk_supplier,
"
"				     sstln_secon_rwk_inside,
"
"				     sstln_secon_rwk_outside,
"
"				     sstln_secon_rwk_supplier,
"
"				     sstln_prim_rwk_in_proc_qty,
"
"				     sstln_secon_rwk_in_proc_qty,
"
"				     sstln_prim_rwk_qty,
"
"				     sstln_secon_rwk_qty,
"
"				     sstln_task_id,
"
"				     sstln_qc_pfx,
"
"				     sstln_proj_id,
"
"				     sstln_so_type,
"
"				     sstln_sf_code,
"
"				     sstln_cre_by,
"
"				     sstln_cre_date,
"
"				     sstln_upd_by,
"
"				     sstln_upd_date,
"
"				     sstln_conv_factor,
"
"				     sstln_uom,
"
"				     sstln_sg_flag,
"
"				     sstln_mnt_task_id,
"
"				     sstln_mnt_oprn_id,
"
"				     sstln_status,
"
"				     sstln_rec_pri_is_repair_qty,
"
"				     sstln_rec_pri_scrap_qty,
"
"				     sstln_rec_pri_dis_ass_qty,
"
"				     sstln_rec_pri_rtrn_qty,
"
"				     sstln_rec_sec_is_repair_qty,
"
"				     sstln_rec_sec_scrap_qty,
"
"				     sstln_rec_sec_dis_ass_qty,
"
"				     sstln_rec_sec_rtrn_qty,
"
"				     sstln_rec_pri_os_repair_qty,
"
"				     sstln_rec_sec_os_repair_qty,
"
"				     sstln_mnt_wc_id,
"
"				     sstln_mi_doc_no,
"
"				     sstln_mi_seq_no,
"
"				     sstln_mi_doc_date,
"
"				     sstln_mi_sub_seq_no,
"
"				     sstln_cap_asset_id,
"
"				     sstln_ord_trans_no,
"
"				     sstln_so_schld_desc,
"
"				     sstln_hist_flag,
"
"				     sstln_store_id,
"
"				     sstln_to_store_id,
"
"				     sstln_dc_doc_no,
"
"				     sstln_dc_seq_no,
"
"				     sstln_prod_cls,
"
"                                     sstln_prod_cls_desc,
"
"                                     sstln_prod_sub_cls,
"
"                                     sstln_prod_subcls_desc,
"
"                                     sstln_prod_grp,
"
"                                     sstln_prod_grp_desc,
"
"                                     sstln_prod_subgrp,
"
"                                     sstln_prod_subgrp_desc,
"
"                                     sstln_prod_cls_type,
"
"				     sstln_oprn_ln_seq_no,
"
"				     sstln_tool_life
"
"				    )
"
"			      SELECT sstlnh_bu,
"
"				     sstlnh_doc_no,
"
"				     sstlnh_seq_no,
"
"				     sstlnh_trans_qty,
"
"				     sstlnh_prod_uom,
"
"				     sstlnh_unit_cost,
"
"				     sstlnh_prod_id,
"
"				     sstlnh_prod_rev,
"
"				     sstlnh_process_id,
"
"				     sstlnh_po_ord_no,
"
"				     sstlnh_so_order_pfx,
"
"				     sstlnh_so_ord_no,
"
"				     sstlnh_so_line_no,
"
"				     sstlnh_so_sub_seq_no,
"
"				     sstlnh_qc_no,
"
"				     sstlnh_accepted_qty,
"
"				     sstlnh_rejected_qty,
"
"				     sstlnh_primary_rejected_qty,
"
"				     sstlnh_secondary_rejected_qty,
"
"				     sstlnh_prim_rtnprcs_qty,
"
"				     sstlnh_prim_rtninprcs_qty,
"
"				     sstlnh_prim_ret_qty,
"
"				     sstlnh_sec_rtnprcs_qty,
"
"				     sstlnh_sec_rtninprcs_qty,
"
"				     sstlnh_sec_ret_qty,
"
"				     sstlnh_sec_rtn_suplr,
"
"				     sstlnh_prim_rtn_suplr,
"
"				     sstlnh_sel_flag,
"
"				     sstlnh_rtnd_doc_qty,
"
"				     sstlnh_user,
"
"				     sstlnh_prim_rwk_inside,
"
"				     sstlnh_prim_rwk_outside,
"
"				     sstlnh_prim_rwk_supplier,
"
"				     sstlnh_secon_rwk_inside,
"
"				     sstlnh_secon_rwk_outside,
"
"				     sstlnh_secon_rwk_supplier,
"
"				     sstlnh_prim_rwk_in_proc_qty,
"
"				     sstlnh_secon_rwk_in_proc_qty,
"
"				     sstlnh_prim_rwk_qty,
"
"				     sstlnh_secon_rwk_qty,
"
"				     sstlnh_task_id,
"
"				     sstlnh_qc_pfx,
"
"				     sstlnh_proj_id,
"
"				     sstlnh_so_type,
"
"				     sstlnh_sf_code,
"
"				     sstlnh_cre_by,
"
"				     sstlnh_cre_date,
"
"				     sstlnh_upd_by,
"
"				     sstlnh_upd_date,
"
"				     sstlnh_conv_factor,
"
"				     sstlnh_uom,
"
"				     sstlnh_sg_flag,
"
"				     sstlnh_mnt_task_id,
"
"				     sstlnh_mnt_oprn_id,
"
"				     sstlnh_status,
"
"				     sstlnh_rec_pri_is_repair_qty,
"
"				     sstlnh_rec_pri_scrap_qty,
"
"				     sstlnh_rec_pri_dis_ass_qty,
"
"				     sstlnh_rec_pri_rtrn_qty,
"
"				     sstlnh_rec_sec_is_repair_qty,
"
"				     sstlnh_rec_sec_scrap_qty,
"
"				     sstlnh_rec_sec_dis_ass_qty,
"
"				     sstlnh_rec_sec_rtrn_qty,
"
"				     sstlnh_rec_pri_os_repair_qty,
"
"				     sstlnh_rec_sec_os_repair_qty,
"
"				     sstlnh_mnt_wc_id,
"
"				     sstlnh_mi_doc_no,
"
"				     sstlnh_mi_seq_no,
"
"				     sstlnh_mi_doc_date,
"
"				     sstlnh_mi_sub_seq_no,
"
"				     sstlnh_cap_asset_id,
"
"				     sstlnh_ord_trans_no,
"
"				     sstlnh_so_schld_desc,
"
"				     sstlnh_hist_flag,
"
"				     sstlnh_store_id,
"
"				     sstlnh_to_store_id,
"
"				     sstlnh_dc_doc_no,
"
"				     sstlnh_dc_seq_no,
"
"				     sstlnh_prod_cls,
"
"                                     sstlnh_prod_cls_desc,
"
"                                     sstlnh_prod_sub_cls,
"
"                                     sstlnh_prod_subcls_desc,
"
"                                     sstlnh_prod_grp,
"
"                                     sstlnh_prod_grp_desc,
"
"                                     sstlnh_prod_subgrp,
"
"                                     sstlnh_prod_subgrp_desc,
"
"                                     sstlnh_prod_cls_type,
"
"				     sstlnh_oprn_ln_seq_no,
"
"				     sstlnh_tool_life
"
"			        FROM store_stock_trans_ln_hist
"
"			       WHERE sstlnh_bu = p_bu
"
"				 AND sstlnh_doc_no = p_doc_no;
"
"
"
"    INSERT INTO store_stock_trans_dtls(sstd_bu,
"
"				       sstd_doc_no,
"
"				       sstd_seq_no,
"
"				       sstd_sub_seq_no,
"
"				       sstd_lot_no,
"
"				       sstd_ser_no,
"
"				       sstd_source_type,
"
"				       sstd_source_id,
"
"				       sstd_trans_qty,
"
"				       sstd_fm_bin_id,
"
"				       sstd_to_bin_id,
"
"				       sstd_accepted_qty,
"
"				       sstd_rejected_qty,
"
"				       sstd_prim_rej_qty,
"
"				       sstd_sec_rej_qty,
"
"				       sstd_prim_rtnprcs_qty,
"
"				       sstd_prim_rtninprcs_qty,
"
"				       sstd_prim_ret_qty,
"
"				       sstd_sec_rtnprcs_qty,
"
"				       sstd_sec_rtninprcs_qty,
"
"				       sstd_sec_ret_qty,
"
"				       sstd_prim_rwk_inside,
"
"				       sstd_prim_rwk_outside,
"
"				       sstd_secon_rwk_inside,
"
"				       sstd_secon_rwk_outside,
"
"				       sstd_prim_rwk_in_proc_qty,
"
"				       sstd_secon_rwk_in_proc_qty,
"
"				       sstd_prim_rwk_qty,
"
"				       sstd_secon_rwk_qty,
"
"				       sstd_cre_by,
"
"				       sstd_cre_date,
"
"				       sstd_upd_by,
"
"				       sstd_upd_date,
"
"				       sstd_rec_pri_is_repair_qty,
"
"				       sstd_rec_pri_scrap_qty,
"
"				       sstd_rec_pri_dis_ass_qty,
"
"				       sstd_rec_pri_rtrn_qty,
"
"				       sstd_rec_sec_is_repair_qty,
"
"				       sstd_rec_sec_scrap_qty,
"
"				       sstd_rec_sec_dis_ass_qty,
"
"				       sstd_rec_sec_rtrn_qty,
"
"				       sstd_rec_pri_os_repair_qty,
"
"				       sstd_rec_sec_os_repair_qty,
"
"				       sstd_sys_ls_no,
"
"				       sstd_expiry_date,
"
"				       sstd_sel_flag,
"
"				       sstd_sec_rtn_suplr,
"
"				       sstd_prim_rtn_suplr,
"
"				       sstd_prim_rwk_suplr,
"
"				       sstd_secon_rwk_suplr,
"
"				       sstd_user,
"
"				       sstd_tr_wgt,
"
"				       sstd_hist_flag,
"
"				       sstd_crate_id,
"
"				       sstd_batch_id
"
"				      )
"
"			        SELECT sstdh_bu,
"
"				       sstdh_doc_no,
"
"				       sstdh_seq_no,
"
"				       sstdh_sub_seq_no,
"
"				       sstdh_lot_no,
"
"				       sstdh_ser_no,
"
"				       sstdh_source_type,
"
"				       sstdh_source_id,
"
"				       sstdh_trans_qty,
"
"				       sstdh_fm_bin_id,
"
"				       sstdh_to_bin_id,
"
"				       sstdh_accepted_qty,
"
"				       sstdh_rejected_qty,
"
"				       sstdh_prim_rej_qty,
"
"				       sstdh_sec_rej_qty,
"
"				       sstdh_prim_rtnprcs_qty,
"
"				       sstdh_prim_rtninprcs_qty,
"
"				       sstdh_prim_ret_qty,
"
"				       sstdh_sec_rtnprcs_qty,
"
"				       sstdh_sec_rtninprcs_qty,
"
"				       sstdh_sec_ret_qty,
"
"				       sstdh_prim_rwk_inside,
"
"				       sstdh_prim_rwk_outside,
"
"				       sstdh_secon_rwk_inside,
"
"				       sstdh_secon_rwk_outside,
"
"				       sstdh_prim_rwk_in_proc_qty,
"
"				       sstdh_secon_rwk_in_proc_qty,
"
"				       sstdh_prim_rwk_qty,
"
"				       sstdh_secon_rwk_qty,
"
"				       sstdh_cre_by,
"
"				       sstdh_cre_date,
"
"				       sstdh_upd_by,
"
"				       sstdh_upd_date,
"
"				       sstdh_rec_pri_is_repair_qty,
"
"				       sstdh_rec_pri_scrap_qty,
"
"				       sstdh_rec_pri_dis_ass_qty,
"
"				       sstdh_rec_pri_rtrn_qty,
"
"				       sstdh_rec_sec_is_repair_qty,
"
"				       sstdh_rec_sec_scrap_qty,
"
"				       sstdh_rec_sec_dis_ass_qty,
"
"				       sstdh_rec_sec_rtrn_qty,
"
"				       sstdh_rec_pri_os_repair_qty,
"
"				       sstdh_rec_sec_os_repair_qty,
"
"				       sstdh_sys_ls_no,
"
"				       sstdh_expiry_date,
"
"				       sstdh_sel_flag,
"
"				       sstdh_sec_rtn_suplr,
"
"				       sstdh_prim_rtn_suplr,
"
"				       sstdh_prim_rwk_suplr,
"
"				       sstdh_secon_rwk_suplr,
"
"				       sstdh_user,
"
"				       sstdh_tr_wgt,
"
"				       sstdh_hist_flag,
"
"				       sstdh_crate_id,
"
"				       sstdh_batch_id
"
"				  FROM store_stock_trans_dtls_hist
"
"				 WHERE sstdh_bu = p_bu
"
"				   AND sstdh_doc_no = p_doc_no;
"
"
"
"    INSERT INTO store_stock_trans_cost_batch(sstcb_bu,
"
"					     sstcb_doc_no,
"
"					     sstcb_seq_no,
"
"					     sstcb_sub_seq_no,
"
"					     sstcb_batch_no,
"
"					     sstcb_trans_qty,
"
"					     sstcb_unit_cost,
"
"					     sstcb_cre_by,
"
"					     sstcb_cre_date,
"
"					     sstcb_upd_by,
"
"					     sstcb_upd_date,
"
"					     sstcb_hist_flag
"
"					    )
"
"				      SELECT sstcbh_bu,
"
"					     sstcbh_doc_no,
"
"					     sstcbh_seq_no,
"
"					     sstcbh_sub_seq_no,
"
"					     sstcbh_batch_no,
"
"					     sstcbh_trans_qty,
"
"					     sstcbh_unit_cost,
"
"					     sstcbh_cre_by,
"
"					     sstcbh_cre_date,
"
"					     sstcbh_upd_by,
"
"					     sstcbh_upd_date,
"
"					     sstcbh_hist_flag
"
"					FROM store_stk_trans_cost_bat_hist
"
"				       WHERE sstcbh_bu = p_bu
"
"					 AND sstcbh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM store_stk_trans_cost_bat_hist
"
"     WHERE sstcbh_bu = p_bu
"
"       AND sstcbh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM store_stock_trans_dtls_hist
"
"     WHERE sstdh_bu = p_bu
"
"       AND sstdh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM store_stock_trans_ln_hist
"
"     WHERE sstlnh_bu = p_bu
"
"       AND sstlnh_doc_no = p_doc_no;
"
"
"
"    DELETE FROM store_stock_trans_hd_hist
"
"     WHERE ssthdh_bu = p_bu
"
"       AND ssthdh_doc_no = p_doc_no;
"
"
"
"  END proc_rev_mat_ret_hist;
"
"
"
"  /*PROCEDURE proc_ins_cmr_rcpt_hist(p_bu		cust_mat_trans_hd.cmthd_bu%TYPE,
"
"  				   p_plnt	cust_mat_trans_hd.cmthd_plnt%TYPE,
"
"  				   p_doc_no	cust_mat_trans_hd.cmthd_doc_no%TYPE
"
"  				  )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO cust_mat_trans_hd_hist(cmthdh_bu,
"
"				       cmthdh_plnt,
"
"				       cmthdh_doc_date,
"
"				       cmthdh_doc_no,
"
"				       cmthdh_cust_id,
"
"				       cmthdh_dc_date,
"
"				       cmthdh_dc_no,
"
"				       cmthdh_ref,
"
"				       cmthdh_status,
"
"				       cmthdh_trans_type,
"
"				       cmthdh_cre_by,
"
"				       cmthdh_cre_date,
"
"				       cmthdh_upd_by,
"
"				       cmthdh_upd_date,
"
"				       cmthdh_ge_doc_no,
"
"				       cmthdh_rcpt_no,
"
"				       cmthdh_ref_plnt,
"
"				       cmthdh_mi_doc_no,
"
"				       cmthdh_source_flag,
"
"				       cmthdh_benf_type,
"
"				       cmthdh_insp_flag,
"
"				       cmthdh_type,
"
"				       cmthdh_tar_prod_id,
"
"				       cmthdh_tar_prod_rev,
"
"				       cmthdh_tar_qty,
"
"				       cmthdh_tar_unit_cost,
"
"				       cmthdh_so_pfx,
"
"				       cmthdh_so_no,
"
"				       cmthdh_so_seq_no,
"
"				       cmthdh_inv_qty,
"
"				       cmthdh_so_plnt,
"
"				       cmthdh_sel_flag,
"
"				       cmthdh_sel_user,
"
"					   cmthdh_plnt_loc_id,
"
"					   cmthdh_plnt_loc_name
"
"				      )
"
"				SELECT cmthd_bu,
"
"				       cmthd_plnt,
"
"				       cmthd_doc_date,
"
"				       cmthd_doc_no,
"
"				       cmthd_cust_id,
"
"				       cmthd_dc_date,
"
"				       cmthd_dc_no,
"
"				       cmthd_ref,
"
"				       cmthd_status,
"
"				       cmthd_trans_type,
"
"				       cmthd_cre_by,
"
"				       cmthd_cre_date,
"
"				       cmthd_upd_by,
"
"				       cmthd_upd_date,
"
"				       cmthd_ge_doc_no,
"
"				       cmthd_rcpt_no,
"
"				       cmthd_ref_plnt,
"
"				       cmthd_mi_doc_no,
"
"				       cmthd_source_flag,
"
"				       cmthd_benf_type,
"
"				       cmthd_insp_flag,
"
"				       cmthd_type,
"
"				       cmthd_tar_prod_id,
"
"				       cmthd_tar_prod_rev,
"
"				       cmthd_tar_qty,
"
"				       cmthd_tar_unit_cost,
"
"				       cmthd_so_pfx,
"
"				       cmthd_so_no,
"
"				       cmthd_so_seq_no,
"
"				       cmthd_inv_qty,
"
"				       cmthd_so_plnt,
"
"				       cmthd_sel_flag,
"
"				       cmthd_sel_user,
"
"					   cmthd_plnt_loc_id,
"
"					   cmthd_plnt_loc_name
"
"				  FROM cust_mat_trans_hd
"
"				 WHERE cmthd_bu = p_bu
"
"				   AND cmthd_plnt = p_plnt
"
"				   AND cmthd_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_trans_ln_hist(cmtlnh_bu,
"
"				       cmtlnh_plnt,
"
"				       cmtlnh_doc_no,
"
"				       cmtlnh_seq_no,
"
"				       cmtlnh_prod_id,
"
"				       cmtlnh_prod_rev,
"
"				       cmtlnh_trans_qty,
"
"				       cmtlnh_inproc_qty,
"
"				       cmtlnh_cons_qty,
"
"				       cmtlnh_ref,
"
"				       cmtlnh_cre_by,
"
"				       cmtlnh_cre_date,
"
"				       cmtlnh_upd_by,
"
"				       cmtlnh_upd_date,
"
"				       cmtlnh_accept_qty,
"
"				       cmtlnh_reject_qty,
"
"				       cmtlnh_rtn_qty,
"
"				       cmtlnh_prod_uom,
"
"				       cmtlnh_conv_factor,
"
"				       cmtlnh_trans_type,
"
"				       cmtlnh_unit_cost,
"
"				       cmtlnh_qc_pfx,
"
"				       cmtlnh_qc_no,
"
"				       cmtlnh_qc_rev,
"
"				       cmtlnh_dc_line_no,
"
"				       cmtlnh_qc_flag,
"
"				       cmtlnh_rtn_proc_qty,
"
"				       cmtlnh_rtn_inproc_qty,
"
"				       cmtlnh_user,
"
"				       cmtlnh_sel_flag,
"
"				       cmtlnh_prod_rtn_qty,
"
"				       cmtlnh_sf_code,
"
"				       cmtlnh_prod_ord_no,
"
"				       cmtlnh_sou_bu,
"
"				       cmtlnh_sou_plnt,
"
"				       cmtlnh_sou_ord_pfx,
"
"				       cmtlnh_sou_ord_no,
"
"				       cmtlnh_sou_seq_no,
"
"				       cmtlnh_sou_sub_seq_no,
"
"				       cmtlnh_prod_cons_qty,
"
"				       cmtlnh_bill_qty,
"
"				       cmtlnh_recovery_pct,
"
"				       cmtlnh_recovery_qty,
"
"				       cmtlnh_moisture_qty,
"
"				       cmtlnh_allwd_wstge_qty,
"
"				       cmtlnh_act_wstge_qty,
"
"				       cmtlnh_status,
"
"				       cmtlnh_tot_accepted_qty,
"
"				       cmtlnh_tot_rejected_qty,
"
"				       cmtlnh_rcpt_store_id,
"
"				       cmtlnh_excs_shrt_qty
"
"				      )
"
"				SELECT cmtln_bu,
"
"				       cmtln_plnt,
"
"				       cmtln_doc_no,
"
"				       cmtln_seq_no,
"
"				       cmtln_prod_id,
"
"				       cmtln_prod_rev,
"
"				       cmtln_trans_qty,
"
"				       cmtln_inproc_qty,
"
"				       cmtln_cons_qty,
"
"				       cmtln_ref,
"
"				       cmtln_cre_by,
"
"				       cmtln_cre_date,
"
"				       cmtln_upd_by,
"
"				       cmtln_upd_date,
"
"				       cmtln_accept_qty,
"
"				       cmtln_reject_qty,
"
"				       cmtln_rtn_qty,
"
"				       cmtln_prod_uom,
"
"				       cmtln_conv_factor,
"
"				       cmtln_trans_type,
"
"				       cmtln_unit_cost,
"
"				       cmtln_qc_pfx,
"
"				       cmtln_qc_no,
"
"				       cmtln_qc_rev,
"
"				       cmtln_dc_line_no,
"
"				       cmtln_qc_flag,
"
"				       cmtln_rtn_proc_qty,
"
"				       cmtln_rtn_inproc_qty,
"
"				       cmtln_user,
"
"				       cmtln_sel_flag,
"
"				       cmtln_prod_rtn_qty,
"
"				       cmtln_sf_code,
"
"				       cmtln_prod_ord_no,
"
"				       cmtln_sou_bu,
"
"				       cmtln_sou_plnt,
"
"				       cmtln_sou_ord_pfx,
"
"				       cmtln_sou_ord_no,
"
"				       cmtln_sou_seq_no,
"
"				       cmtln_sou_sub_seq_no,
"
"				       cmtln_prod_cons_qty,
"
"				       cmtln_bill_qty,
"
"				       cmtln_recovery_pct,
"
"				       cmtln_recovery_qty,
"
"				       cmtln_moisture_qty,
"
"				       cmtln_allwd_wstge_qty,
"
"				       cmtln_act_wstge_qty,
"
"				       cmtln_status,
"
"				       cmtln_tot_accepted_qty,
"
"				       cmtln_tot_rejected_qty,
"
"				       cmtln_rcpt_store_id,
"
"				       cmtln_excs_shrt_qty
"
"				  FROM cust_mat_trans_ln
"
"				 WHERE cmtln_bu = p_bu
"
"				   AND cmtln_plnt = p_plnt
"
"				   AND cmtln_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_lot_dtls_hist(cmldh_bu,
"
"				       cmldh_plnt,
"
"				       cmldh_doc_no,
"
"				       cmldh_seq_no,
"
"				       cmldh_sub_seq_no,
"
"				       cmldh_ser_no,
"
"				       cmldh_lot_no,
"
"				       cmldh_trans_qty,
"
"				       cmldh_accept_qty,
"
"				       cmldh_reject_qty,
"
"				       cmldh_cre_by,
"
"				       cmldh_cre_date,
"
"				       cmldh_upd_by,
"
"				       cmldh_upd_date,
"
"				       cmldh_expiry_date,
"
"				       cmldh_source_type,
"
"				       cmldh_source_id,
"
"				       cmldh_rtn_inproc_qty,
"
"				       cmldh_rtn_proc_qty,
"
"				       cmldh_rtn_qty,
"
"				       cmldh_user,
"
"				       cmldh_sel_flag,
"
"				       cmldh_sys_ls_no,
"
"				       cmldh_mfg_date,
"
"				       cmldh_prod_rtn_qty,
"
"				       cmldh_inproc_qty,
"
"				       cmldh_prod_cons_qty
"
"				      )
"
"				SELECT cmld_bu,
"
"				       cmld_plnt,
"
"				       cmld_doc_no,
"
"				       cmld_seq_no,
"
"				       cmld_sub_seq_no,
"
"				       cmld_ser_no,
"
"				       cmld_lot_no,
"
"				       cmld_trans_qty,
"
"				       cmld_accept_qty,
"
"				       cmld_reject_qty,
"
"				       cmld_cre_by,
"
"				       cmld_cre_date,
"
"				       cmld_upd_by,
"
"				       cmld_upd_date,
"
"				       cmld_expiry_date,
"
"				       cmld_source_type,
"
"				       cmld_source_id,
"
"				       cmld_rtn_inproc_qty,
"
"				       cmld_rtn_proc_qty,
"
"				       cmld_rtn_qty,
"
"				       cmld_user,
"
"				       cmld_sel_flag,
"
"				       cmld_sys_ls_no,
"
"				       cmld_mfg_date,
"
"				       cmld_prod_rtn_qty,
"
"				       cmld_inproc_qty,
"
"				       cmld_prod_cons_qty
"
"				  FROM cust_mat_lot_dtls
"
"				 WHERE cmld_bu = p_bu
"
"				   AND cmld_plnt = p_plnt
"
"				   AND cmld_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_trns_ln_rcpt_itm_hist(cmtlrih_bu,
"
"					       cmtlrih_plnt,
"
"					       cmtlrih_doc_no,
"
"					       cmtlrih_seq_no,
"
"					       cmtlrih_sub_seq_no,
"
"					       cmtlrih_rcpt_prod_id,
"
"					       cmtlrih_rcpt_prod_rev,
"
"					       cmtlrih_rcpt_prod_uom,
"
"					       cmtlrih_rcpt_qty,
"
"					       cmtlrih_dc_proc_qty,
"
"					       cmtlrih_dc_cons_qty,
"
"					       cmtlrih_cre_by,
"
"					       cmtlrih_cre_date,
"
"					       cmtlrih_upd_by,
"
"					       cmtlrih_upd_date
"
"					      )
"
"					SELECT cmtlri_bu,
"
"					       cmtlri_plnt,
"
"					       cmtlri_doc_no,
"
"					       cmtlri_seq_no,
"
"					       cmtlri_sub_seq_no,
"
"					       cmtlri_rcpt_prod_id,
"
"					       cmtlri_rcpt_prod_rev,
"
"					       cmtlri_rcpt_prod_uom,
"
"					       cmtlri_rcpt_qty,
"
"					       cmtlri_dc_proc_qty,
"
"					       cmtlri_dc_cons_qty,
"
"					       cmtlri_cre_by,
"
"					       cmtlri_cre_date,
"
"					       cmtlri_upd_by,
"
"					       cmtlri_upd_date
"
"					  FROM cust_mat_trans_ln_rcpt_item
"
"					 WHERE cmtlri_bu = p_bu
"
"					   AND cmtlri_plnt = p_plnt
"
"					   AND cmtlri_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_proc_dtls_hist(cmpdh_bu,
"
"					cmpdh_plnt,
"
"					cmpdh_trans_type,
"
"					cmpdh_doc_no,
"
"					cmpdh_seq_no,
"
"					cmpdh_proc_id,
"
"					cmpdh_unit_cost,
"
"					cmpdh_cre_by,
"
"					cmpdh_cre_date,
"
"					cmpdh_upd_by,
"
"					cmpdh_upd_date,
"
"					cmpdh_sub_seq_no,
"
"					cmpdh_oprn_seq_no
"
"				       )
"
"				 SELECT cmpd_bu,
"
"					cmpd_plnt,
"
"					cmpd_trans_type,
"
"					cmpd_doc_no,
"
"					cmpd_seq_no,
"
"					cmpd_proc_id,
"
"					cmpd_unit_cost,
"
"					cmpd_cre_by,
"
"					cmpd_cre_date,
"
"					cmpd_upd_by,
"
"					cmpd_upd_date,
"
"					cmpd_sub_seq_no,
"
"					cmpd_oprn_seq_no
"
"			           FROM cust_mat_proc_dtls
"
"			          WHERE cmpd_bu = p_bu
"
"			            AND cmpd_plnt = p_plnt
"
"			            AND cmpd_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_trans_so_hist(cmtsoh_bu,
"
"				       cmtsoh_plnt,
"
"				       cmtsoh_trans_type,
"
"				       cmtsoh_doc_no,
"
"				       cmtsoh_seq_no,
"
"				       cmtsoh_tar_prod_id,
"
"				       cmtsoh_tar_prod_rev,
"
"				       cmtsoh_tar_qty,
"
"				       cmtsoh_tar_unit_cost,
"
"				       cmtsoh_so_pfx,
"
"				       cmtsoh_so_no,
"
"				       cmtsoh_so_seq_no,
"
"				       cmtsoh_inv_qty,
"
"				       cmtsoh_cre_by,
"
"				       cmtsoh_cre_date,
"
"				       cmtsoh_upd_by,
"
"				       cmtsoh_upd_date
"
"				      )
"
"				SELECT cmtso_bu,
"
"				       cmtso_plnt,
"
"				       cmtso_trans_type,
"
"				       cmtso_doc_no,
"
"				       cmtso_seq_no,
"
"				       cmtso_tar_prod_id,
"
"				       cmtso_tar_prod_rev,
"
"				       cmtso_tar_qty,
"
"				       cmtso_tar_unit_cost,
"
"				       cmtso_so_pfx,
"
"				       cmtso_so_no,
"
"				       cmtso_so_seq_no,
"
"				       cmtso_inv_qty,
"
"				       cmtso_cre_by,
"
"				       cmtso_cre_date,
"
"				       cmtso_upd_by,
"
"				       cmtso_upd_date
"
"				  FROM cust_mat_trans_so
"
"				 WHERE cmtso_bu = p_bu
"
"				   AND cmtso_plnt = p_plnt
"
"				   AND cmtso_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_trans_ln_bin_hist(cmtlbh_bu,
"
"                                           cmtlbh_plnt,
"
"                                           cmtlbh_doc_no,
"
"                                           cmtlbh_seq_no,
"
"                                           cmtlbh_sub_seq_no,
"
"                                           cmtlbh_prod_id,
"
"                                           cmtlbh_prod_rev,
"
"                                           cmtlbh_bin_id,
"
"                                           cmtlbh_lot_no,
"
"                                           cmtlbh_ser_no,
"
"                                           cmtlbh_trans_qty,
"
"                                           cmtlbh_source_id,
"
"                                           cmtlbh_source_type,
"
"                                           cmtlbh_rec_flag,
"
"                                           cmtlbh_cre_by,
"
"                                           cmtlbh_cre_date,
"
"                                           cmtlbh_upd_by,
"
"                                           cmtlbh_upd_date,
"
"                                           cmtlbh_sys_ls_no,
"
"                                           cmtlbh_hist_flag
"
"				          )
"
"				    SELECT cmtlb_bu,
"
"					   cmtlb_plnt,
"
"					   cmtlb_doc_no,
"
"					   cmtlb_seq_no,
"
"					   cmtlb_sub_seq_no,
"
"					   cmtlb_prod_id,
"
"					   cmtlb_prod_rev,
"
"					   cmtlb_bin_id,
"
"					   cmtlb_lot_no,
"
"					   cmtlb_ser_no,
"
"					   cmtlb_trans_qty,
"
"					   cmtlb_source_id,
"
"					   cmtlb_source_type,
"
"					   cmtlb_rec_flag,
"
"					   cmtlb_cre_by,
"
"					   cmtlb_cre_date,
"
"					   cmtlb_upd_by,
"
"					   cmtlb_upd_date,
"
"					   cmtlb_sys_ls_no,
"
"					   cmtlb_hist_flag
"
"				  FROM cust_mat_trans_ln_bin
"
"				 WHERE cmtlb_bu = p_bu
"
"				   AND cmtlb_plnt = p_plnt
"
"				   AND cmtlb_doc_no = p_doc_no;
"
"
"
"
"
"  END proc_ins_cmr_rcpt_hist;
"
"
"
"  PROCEDURE proc_ins_cmr_return_hist(p_bu	cust_mat_trans_return_hd.cmtrhd_bu%TYPE,
"
"  				     p_plnt	cust_mat_trans_return_hd.cmtrhd_plnt%TYPE,
"
"  				     p_doc_no	cust_mat_trans_return_hd.cmtrhd_doc_no%TYPE
"
"  				    )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO cust_mat_trans_return_hd_hist(cmtrhdh_bu,
"
"					      cmtrhdh_plnt,
"
"					      cmtrhdh_ref_plnt,
"
"					      cmtrhdh_doc_date,
"
"					      cmtrhdh_doc_no,
"
"					      cmtrhdh_cust_id,
"
"					      cmtrhdh_dc_date,
"
"					      cmtrhdh_dc_no,
"
"					      cmtrhdh_ref,
"
"					      cmtrhdh_status,
"
"					      cmtrhdh_cre_by,
"
"					      cmtrhdh_cre_date,
"
"					      cmtrhdh_upd_by,
"
"					      cmtrhdh_upd_date,
"
"					      cmtrhdh_type,
"
"						  cmtrhdh_plnt_loc_id,
"
"						  cmtrhdh_plnt_loc_name
"
"					     )
"
"				       SELECT cmtrhd_bu,
"
"					      cmtrhd_plnt,
"
"					      cmtrhd_ref_plnt,
"
"					      cmtrhd_doc_date,
"
"					      cmtrhd_doc_no,
"
"					      cmtrhd_cust_id,
"
"					      cmtrhd_dc_date,
"
"					      cmtrhd_dc_no,
"
"					      cmtrhd_ref,
"
"					      cmtrhd_status,
"
"					      cmtrhd_cre_by,
"
"					      cmtrhd_cre_date,
"
"					      cmtrhd_upd_by,
"
"					      cmtrhd_upd_date,
"
"					      cmtrhd_type,
"
"						  cmtrhd_plnt_loc_id,
"
"						  cmtrhd_plnt_loc_name
"
"					 FROM cust_mat_trans_return_hd
"
"					WHERE cmtrhd_bu = p_bu
"
"					  AND cmtrhd_plnt = p_plnt
"
"					  AND cmtrhd_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_trans_return_ln_hist(cmtrlnh_bu,
"
"					      cmtrlnh_plnt,
"
"					      cmtrlnh_doc_no,
"
"					      cmtrlnh_seq_no,
"
"					      cmtrlnh_prod_id,
"
"					      cmtrlnh_prod_rev,
"
"					      cmtrlnh_prod_uom,
"
"					      cmtrlnh_conv_factor,
"
"					      cmtrlnh_reject_qty,
"
"					      cmtrlnh_rtn_qty,
"
"					      cmtrlnh_unit_cost,
"
"					      cmtrlnh_ref,
"
"					      cmtrlnh_cre_by,
"
"					      cmtrlnh_cre_date,
"
"					      cmtrlnh_upd_by,
"
"					      cmtrlnh_upd_date,
"
"					      cmtrlnh_prod_ord_no,
"
"					      cmtrlnh_sf_code,
"
"					      cmtrlnh_so_pfx,
"
"					      cmtrlnh_so_no,
"
"					      cmtrlnh_so_seq_no,
"
"					      cmtrlnh_so_sub_seq_no,
"
"					      cmtrlnh_store_id,
"
"					      cmtrlnh_sou_bu,
"
"					      cmtrlnh_sou_plnt,
"
"					      cmtrlnh_sou_ord_pfx,
"
"					      cmtrlnh_sou_ord_no,
"
"					      cmtrlnh_sou_seq_no,
"
"					      cmtrlnh_sou_sub_seq_no,
"
"					      cmtrlnh_prod_ord_line,
"
"					      cmtrlnh_mat_type,
"
"					      cmtrlnh_comp_doc_no,
"
"					      cmtrlnh_dc_short_flag,
"
"					      cmtrlnh_first_oprn_id,
"
"					      cmtrlnh_last_oprn_id
"
"					     )
"
"				       SELECT cmtrln_bu,
"
"					      cmtrln_plnt,
"
"					      cmtrln_doc_no,
"
"					      cmtrln_seq_no,
"
"					      cmtrln_prod_id,
"
"					      cmtrln_prod_rev,
"
"					      cmtrln_prod_uom,
"
"					      cmtrln_conv_factor,
"
"					      cmtrln_reject_qty,
"
"					      cmtrln_rtn_qty,
"
"					      cmtrln_unit_cost,
"
"					      cmtrln_ref,
"
"					      cmtrln_cre_by,
"
"					      cmtrln_cre_date,
"
"					      cmtrln_upd_by,
"
"					      cmtrln_upd_date,
"
"					      cmtrln_prod_ord_no,
"
"					      cmtrln_sf_code,
"
"					      cmtrln_so_pfx,
"
"					      cmtrln_so_no,
"
"					      cmtrln_so_seq_no,
"
"					      cmtrln_so_sub_seq_no,
"
"					      cmtrln_store_id,
"
"					      cmtrln_sou_bu,
"
"					      cmtrln_sou_plnt,
"
"					      cmtrln_sou_ord_pfx,
"
"					      cmtrln_sou_ord_no,
"
"					      cmtrln_sou_seq_no,
"
"					      cmtrln_sou_sub_seq_no,
"
"					      cmtrln_prod_ord_line,
"
"					      cmtrln_mat_type,
"
"					      cmtrln_comp_doc_no,
"
"					      cmtrln_dc_short_flag,
"
"					      cmtrln_first_oprn_id,
"
"					      cmtrln_last_oprn_id
"
"					 FROM cust_mat_trans_return_ln
"
"					WHERE cmtrln_bu = p_bu
"
"					  AND cmtrln_plnt = p_plnt
"
"					  AND cmtrln_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_trans_return_dtl_hist(cmtrdh_bu,
"
"					       cmtrdh_plnt,
"
"					       cmtrdh_doc_no,
"
"					       cmtrdh_seq_no,
"
"					       cmtrdh_sub_seq_no,
"
"					       cmtrdh_cust_rcpt_no,
"
"					       cmtrdh_cust_seq_no,
"
"					       cmtrdh_cust_dc_no,
"
"					       cmtrdh_qty,
"
"					       cmtrdh_cre_by,
"
"					       cmtrdh_cre_date,
"
"					       cmtrdh_upd_by,
"
"					       cmtrdh_upd_date,
"
"					       cmtrdh_cust_dc_date
"
"					      )
"
"					SELECT cmtrd_bu,
"
"					       cmtrd_plnt,
"
"					       cmtrd_doc_no,
"
"					       cmtrd_seq_no,
"
"					       cmtrd_sub_seq_no,
"
"					       cmtrd_cust_rcpt_no,
"
"					       cmtrd_cust_seq_no,
"
"					       cmtrd_cust_dc_no,
"
"					       cmtrd_qty,
"
"					       cmtrd_cre_by,
"
"					       cmtrd_cre_date,
"
"					       cmtrd_upd_by,
"
"					       cmtrd_upd_date,
"
"					       cmtrd_cust_dc_date
"
"					  FROM cust_mat_trans_return_dtls
"
"					 WHERE cmtrd_bu = p_bu
"
"					   AND cmtrd_plnt = p_plnt
"
"					   AND cmtrd_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_return_lot_dtls_hist(cmrldh_bu,
"
"					      cmrldh_plnt,
"
"					      cmrldh_doc_no,
"
"					      cmrldh_seq_no,
"
"					      cmrldh_sub_seq_no,
"
"					      cmrldh_ser_no,
"
"					      cmrldh_lot_no,
"
"					      cmrldh_expiry_date,
"
"					      cmrldh_source_type,
"
"					      cmrldh_source_id,
"
"					      cmrldh_reject_qty,
"
"					      cmrldh_cre_by,
"
"					      cmrldh_cre_date,
"
"					      cmrldh_upd_by,
"
"					      cmrldh_upd_date,
"
"					      cmrldh_sys_ls_no
"
"					     )
"
"				       SELECT cmrld_bu,
"
"					      cmrld_plnt,
"
"					      cmrld_doc_no,
"
"					      cmrld_seq_no,
"
"					      cmrld_sub_seq_no,
"
"					      cmrld_ser_no,
"
"					      cmrld_lot_no,
"
"					      cmrld_expiry_date,
"
"					      cmrld_source_type,
"
"					      cmrld_source_id,
"
"					      cmrld_reject_qty,
"
"					      cmrld_cre_by,
"
"					      cmrld_cre_date,
"
"					      cmrld_upd_by,
"
"					      cmrld_upd_date,
"
"					      cmrld_sys_ls_no
"
"					 FROM cust_mat_return_lot_dtls
"
"					WHERE cmrld_bu = p_bu
"
"					  AND cmrld_plnt = p_plnt
"
"					  AND cmrld_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_ret_cost_batch_hist(cmrcbh_bu,
"
"					     cmrcbh_plnt,
"
"					     cmrcbh_doc_no,
"
"					     cmrcbh_seq_no,
"
"					     cmrcbh_sub_seq_no,
"
"					     cmrcbh_batch_no,
"
"					     cmrcbh_rtn_qty,
"
"					     cmrcbh_unit_cost,
"
"					     cmrcbh_cre_by,
"
"					     cmrcbh_cre_date,
"
"					     cmrcbh_upd_by,
"
"					     cmrcbh_upd_date
"
"					    )
"
"				      SELECT cmrcb_bu,
"
"					     cmrcb_plnt,
"
"					     cmrcb_doc_no,
"
"					     cmrcb_seq_no,
"
"					     cmrcb_sub_seq_no,
"
"					     cmrcb_batch_no,
"
"					     cmrcb_rtn_qty,
"
"					     cmrcb_unit_cost,
"
"					     cmrcb_cre_by,
"
"					     cmrcb_cre_date,
"
"					     cmrcb_upd_by,
"
"					     cmrcb_upd_date
"
"				        FROM cust_mat_return_cost_batch
"
"				       WHERE cmrcb_bu = p_bu
"
"				         AND cmrcb_plnt = p_plnt
"
"				         AND cmrcb_doc_no = p_doc_no;
"
"
"
"    INSERT INTO cust_mat_return_bin_dtls_hist(cmrbdh_bu,
"
"                                              cmrbdh_plnt,
"
"                                              cmrbdh_doc_no,
"
"                                              cmrbdh_seq_no,
"
"                                              cmrbdh_sub_seq_no,
"
"                                              cmrbdh_prod_id,
"
"                                              cmrbdh_prod_rev,
"
"                                              cmrbdh_bin_id,
"
"                                              cmrbdh_lot_no,
"
"                                              cmrbdh_ser_no,
"
"                                              cmrbdh_trans_qty,
"
"                                              cmrbdh_source_id,
"
"                                              cmrbdh_source_type,
"
"                                              cmrbdh_rec_flag,
"
"                                              cmrbdh_cre_by,
"
"                                              cmrbdh_cre_date,
"
"                                              cmrbdh_upd_by,
"
"                                              cmrbdh_upd_date,
"
"                                              cmrbdh_sys_ls_no,
"
"                                              cmrbdh_hist_flag
"
"					    )
"
"				       SELECT cmrbd_bu,
"
"                                              cmrbd_plnt,
"
"                                              cmrbd_doc_no,
"
"                                              cmrbd_seq_no,
"
"                                              cmrbd_sub_seq_no,
"
"                                              cmrbd_prod_id,
"
"                                              cmrbd_prod_rev,
"
"                                              cmrbd_bin_id,
"
"                                              cmrbd_lot_no,
"
"                                              cmrbd_ser_no,
"
"                                              cmrbd_trans_qty,
"
"                                              cmrbd_source_id,
"
"                                              cmrbd_source_type,
"
"                                              cmrbd_rec_flag,
"
"                                              cmrbd_cre_by,
"
"                                              cmrbd_cre_date,
"
"                                              cmrbd_upd_by,
"
"                                              cmrbd_upd_date,
"
"                                              cmrbd_sys_ls_no,
"
"                                              cmrbd_hist_flag
"
"				        FROM cust_mat_return_bin_dtls
"
"				       WHERE cmrbd_bu = p_bu
"
"				         AND cmrbd_plnt = p_plnt
"
"				         AND cmrbd_doc_no = p_doc_no;
"
"  END proc_ins_cmr_return_hist;*/
"
"
"
"END pkg_inv_hist;"
/
