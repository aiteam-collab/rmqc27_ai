CREATE OR REPLACE
"PACKAGE BODY pkg_rework_serial_comp
"
"IS
"
"    PROCEDURE proc_cre_rework_frm_rej(p_bu                VARCHAR2,
"
"                                      p_doc_date        DATE,
"
"                                      p_user            VARCHAR2,
"
"                                      p_rwo_res        OUT    VARCHAR2,
"
"                                      p_rwc_res        OUT    VARCHAR2,
"
"                                      p_check        OUT    VARCHAR2
"
"                                      )
"
"    IS
"
"    CURSOR c_ser(c_plnt   VARCHAR2 , c_trans_no VARCHAR2)
"
"    IS
"
"    SELECT pcsh_plnt,
"
"           pcsh_doc_no,
"
"           pcsh_prim_rwk_inside,
"
"               pcsh_serialno,
"
"           pcsh_sys_ls_no,
"
"           pcsh_source_id,
"
"           pcsh_source_type,
"
"           pcsh_primt_ret_cur,
"
"           pcsh_prim_suplr_id,
"
"           pcsh_prim_rwk_outside,
"
"           pcsh_prim_rwk_supplier,
"
"           pcsh_secon_ret_cur,
"
"           pcsh_secon_suplr_id,
"
"           pcsh_secon_rwk_inside,
"
"           pcsh_secon_rwk_outside,
"
"           pcsh_secon_rwk_supplier,
"
"           pcsh_prim_rej_qty,
"
"           pcsh_secon_rej_qty,
"
"           pcshh_prod_ord_no
"
"      FROM prod_comp_srlnos_hist
"
"     WHERE pcsh_bu = p_bu
"
"       AND pcsh_user = p_user
"
"       AND pcsh_sel_flag = 'Y'
"
"       AND pcsh_prim_rwk_inside > 0
"
"       AND (pcsh_plnt = c_plnt OR c_plnt IS NULL)
"
"       AND (pcsh_doc_no = c_trans_no OR c_trans_no IS NULL)
"
"     UNION ALL
"
"    SELECT pcsh_plnt,
"
"           pcsh_doc_no,
"
"           pcsh_prim_rwk_inside,
"
"           pcsh_serialno,
"
"           pcsh_sys_ls_no,
"
"           pcsh_source_id,
"
"           pcsh_source_type,
"
"           pcsh_primt_ret_cur,
"
"           pcsh_prim_suplr_id,
"
"           pcsh_prim_rwk_outside,
"
"           pcsh_prim_rwk_supplier,
"
"           pcsh_secon_ret_cur,
"
"           pcsh_secon_suplr_id,
"
"           pcsh_secon_rwk_inside,
"
"           pcsh_secon_rwk_outside,
"
"           pcsh_secon_rwk_supplier,
"
"           pcsh_prim_rej_qty,
"
"           pcsh_secon_rej_qty,
"
"           pcshh_prod_ord_no
"
"      FROM prod_comp_srlnos_hist
"
"     WHERE pcsh_bu = p_bu
"
"       AND pcsh_user = p_user
"
"       AND pcsh_sel_flag = 'Y'
"
"       AND pcsh_secon_rwk_inside > 0
"
"       AND (pcsh_plnt = c_plnt OR c_plnt IS NULL)
"
"       AND (pcsh_doc_no = c_trans_no OR c_trans_no IS NULL)
"
"     UNION ALL
"
"        SELECT pcs_plnt pcsh_plnt,
"
"           pcs_doc_no pcsh_doc_no,
"
"           pcs_prim_rwk_inside pcsh_prim_rwk_inside,
"
"               pcs_serialno pcsh_serialno,
"
"           pcs_sys_ls_no pcsh_sys_ls_no,
"
"           pcs_source_id pcsh_source_id,
"
"           pcs_source_type pcsh_source_type,
"
"           pcs_primt_ret_cur pcsh_primt_ret_cur,
"
"           pcs_prim_suplr_id pcsh_prim_suplr_id,
"
"           pcs_prim_rwk_outside pcsh_prim_rwk_outside,
"
"           pcs_prim_rwk_supplier pcsh_prim_rwk_supplier,
"
"           pcs_secon_ret_cur pcsh_secon_ret_cur,
"
"           pcs_secon_suplr_id pcsh_secon_suplr_id,
"
"           pcs_secon_rwk_inside pcsh_secon_rwk_inside,
"
"           pcs_secon_rwk_outside pcsh_secon_rwk_outside,
"
"           pcs_secon_rwk_supplier pcsh_secon_rwk_supplier,
"
"           pcs_prim_rej_qty pcsh_prim_rej_qty,
"
"           pcs_secon_rej_qty pcsh_secon_rej_qty,
"
"           pcsh_prod_ord_no pcshh_prod_ord_no
"
"      FROM prod_comp_srlnos
"
"     WHERE pcs_bu = p_bu
"
"       AND pcs_user = p_user
"
"       AND pcs_sel_flag = 'Y'
"
"       AND pcs_prim_rwk_inside > 0
"
"       AND (pcs_plnt = c_plnt OR c_plnt IS NULL)
"
"       AND (pcs_doc_no = c_trans_no OR c_trans_no IS NULL)
"
"     UNION ALL
"
"       SELECT  pcs_plnt pcsh_plnt,
"
"           pcs_doc_no pcsh_doc_no,
"
"               pcs_prim_rwk_inside pcsh_prim_rwk_inside,
"
"               pcs_serialno pcsh_serialno,
"
"           pcs_sys_ls_no pcsh_sys_ls_no,
"
"           pcs_source_id pcsh_source_id,
"
"           pcs_source_type pcsh_source_type,
"
"           pcs_primt_ret_cur pcsh_primt_ret_cur,
"
"           pcs_prim_suplr_id pcsh_prim_suplr_id,
"
"           pcs_prim_rwk_outside pcsh_prim_rwk_outside,
"
"           pcs_prim_rwk_supplier pcsh_prim_rwk_supplier,
"
"           pcs_secon_ret_cur pcsh_secon_ret_cur,
"
"           pcs_secon_suplr_id pcsh_secon_suplr_id,
"
"           pcs_secon_rwk_inside pcsh_secon_rwk_inside,
"
"           pcs_secon_rwk_outside pcsh_secon_rwk_outside,
"
"           pcs_secon_rwk_supplier pcsh_secon_rwk_supplier,
"
"           pcs_prim_rej_qty pcsh_prim_rej_qty,
"
"           pcs_secon_rej_qty pcsh_secon_rej_qty,
"
"           pcsh_prod_ord_no pcshh_prod_ord_no
"
"      FROM prod_comp_srlnos
"
"     WHERE pcs_bu = p_bu
"
"       AND pcs_user = p_user
"
"       AND pcs_sel_flag = 'Y'
"
"       AND pcs_secon_rwk_inside > 0
"
"       AND (pcs_plnt = c_plnt OR c_plnt IS NULL)
"
"       AND (pcs_doc_no = c_trans_no OR c_trans_no IS NULL);
"
"
"
"    CURSOR c0
"
"        IS
"
"    SELECT pth_plnt,
"
"           pth_prod_ord_no,
"
"           pth_trans_no,
"
"           pth_pp_no,
"
"           pth_pp_seq_no,
"
"           pth_prod_id,
"
"           pth_prod_rev,
"
"           pth_prim_rwk_inside pth_pri_rwk_qty,
"
"           0 pth_sec_rwk_qty,
"
"           0 pth_ppr_rwk_qty,
"
"           pth_comp_sf_code,
"
"           pth_sf_code,
"
"           pth_sys_ls_no,
"
"           pth_lot_no,
"
"           pth_ser_no,
"
"           pth_route_card_no,
"
"           pth_so_pfx,
"
"           pth_so_no,
"
"           pth_so_seq_no,
"
"           pth_so_sub_seq_no,
"
"           pth_proj_id,
"
"           pth_task_id,
"
"           pth_reference,
"
"           pth_source_id,
"
"           pth_source_type,
"
"           pth_vi_flag,
"
"           pth_temp_sys_ls_no,
"
"           pth_temp_lot_no,
"
"           pth_temp_ser_no,
"
"           pth_child_sys_ls_no,
"
"           pth_child_lot_no,
"
"           pth_rcpt_store_id,
"
"           pth_so_schld_desc,
"
"           pth_pg_type,
"
"           pth_oprn_ln_seq,
"
"           pth_loc_id,
"
"           pth_comp_pfx
"
"      FROM prod_transfer_hist,
"
"           products
"
"     WHERE pth_bu = prod_bu
"
"       AND pth_prod_id = prod_id
"
"       AND pth_prod_rev = prod_rev
"
"       AND prod_status = 'A'
"
"       AND prod_ser_lot_opt = 'S'
"
"       and pth_bu          = p_bu
"
"       AND pth_user        = p_user
"
"       AND pth_return_flag     = 'Y'
"
"       AND pth_prim_rwk_inside > 0
"
"       AND pth_line_id IS NULL
"
"     UNION
"
"    SELECT pth_plnt,
"
"           pth_prod_ord_no,
"
"           pth_trans_no,
"
"           pth_pp_no,
"
"           pth_pp_seq_no,
"
"           pth_prod_id,
"
"           pth_prod_rev,
"
"           0 pth_pri_rwk_qty,
"
"           pth_secon_rwk_inside pth_sec_rwk_qty,
"
"           0 pth_ppr_rwk_qty,
"
"           pth_comp_sf_code,
"
"           pth_sf_code,
"
"           pth_sys_ls_no,
"
"           pth_lot_no,
"
"           pth_ser_no,
"
"           pth_route_card_no,
"
"           pth_so_pfx,
"
"           pth_so_no,
"
"           pth_so_seq_no,
"
"           pth_so_sub_seq_no,
"
"           pth_proj_id,
"
"           pth_task_id,
"
"           pth_reference,
"
"           pth_source_id,
"
"           pth_source_type,
"
"           pth_vi_flag,
"
"           pth_temp_sys_ls_no,
"
"           pth_temp_lot_no,
"
"           pth_temp_ser_no,
"
"           pth_child_sys_ls_no,
"
"           pth_child_lot_no,
"
"           pth_rcpt_store_id,
"
"           pth_so_schld_desc,
"
"           pth_pg_type,
"
"           pth_oprn_ln_seq,
"
"           pth_loc_id,
"
"           pth_comp_pfx
"
"      FROM prod_transfer_hist,
"
"            products
"
"     WHERE pth_bu = prod_bu
"
"       AND pth_prod_id = prod_id
"
"       AND pth_prod_rev = prod_rev
"
"       AND prod_status = 'A'
"
"       AND prod_ser_lot_opt = 'S'
"
"       AND pth_bu           = p_bu
"
"       AND pth_user         = p_user
"
"       AND pth_return_flag         = 'Y'
"
"       AND pth_secon_rwk_inside > 0
"
"       AND pth_line_id IS NULL
"
"     UNION
"
"    SELECT pth_plnt,
"
"           pth_prod_ord_no,
"
"           pth_trans_no,
"
"           pth_pp_no,
"
"           pth_pp_seq_no,
"
"           pth_prod_id,
"
"           pth_prod_rev,
"
"           0 pth_pri_rwk_qty,
"
"           0 pth_sec_rwk_qty,
"
"           pth_pre_process_rej_Qty pth_ppr_rwk_qty,
"
"           pth_comp_sf_code,
"
"           pth_sf_code,
"
"           pth_sys_ls_no,
"
"           pth_lot_no,
"
"           pth_ser_no,
"
"           pth_route_card_no,
"
"           pth_so_pfx,
"
"           pth_so_no,
"
"           pth_so_seq_no,
"
"           pth_so_sub_seq_no,
"
"           pth_proj_id,
"
"           pth_task_id,
"
"           pth_reference,
"
"           pth_source_id,
"
"           pth_source_type,
"
"           pth_vi_flag,
"
"           pth_temp_sys_ls_no,
"
"           pth_temp_lot_no,
"
"           pth_temp_ser_no,
"
"           pth_child_sys_ls_no,
"
"           pth_child_lot_no,
"
"           pth_rcpt_store_id,
"
"           pth_so_schld_desc,
"
"           pth_pg_type,
"
"           pth_oprn_ln_seq,
"
"           pth_loc_id,
"
"           pth_comp_pfx
"
"      FROM prod_transfer_hist
"
"     WHERE pth_bu           = p_bu
"
"       AND pth_user         = p_user
"
"       AND pth_return_flag         = 'Y'
"
"       AND pth_ppr_rwk_inside > 0
"
"       AND pth_line_id IS NULL
"
"     UNION
"
"     SELECT    pt_plnt pth_plnt,
"
"           pt_prod_ord_no pth_prod_ord_no,
"
"           pt_trans_no pth_trans_no,
"
"           pt_pp_no pth_pp_no,
"
"           pt_pp_seq_no pth_pp_seq_no,
"
"           pt_prod_id  pth_prod_id,
"
"           pt_prod_rev pth_prod_rev,
"
"           pt_prim_rwk_inside pth_pri_rwk_qty,
"
"           0 pth_sec_rwk_qty,
"
"           0 pth_ppr_rwk_qty,
"
"           pt_comp_sf_code  pth_comp_sf_code,
"
"           pt_sf_code pth_sf_code,
"
"           pt_sys_ls_no pth_sys_ls_no,
"
"           pt_lot_no pth_lot_no,
"
"           pt_ser_no pth_ser_no,
"
"           pt_route_card_no pth_route_card_no,
"
"           pt_so_pfx pth_so_pfx,
"
"           pt_so_no pth_so_no,
"
"           pt_so_seq_no pth_so_seq_no,
"
"           pt_so_sub_seq_no pth_so_sub_seq_no,
"
"           pt_proj_id pth_proj_id,
"
"           pt_task_id pth_task_id,
"
"           pt_reference pth_reference,
"
"           pt_source_id pth_source_id,
"
"           pt_source_type pth_source_type,
"
"           pt_vi_flag pth_vi_flag,
"
"           pt_temp_sys_ls_no pth_temp_sys_ls_no,
"
"           pt_temp_lot_no pth_temp_lot_no,
"
"           pt_temp_ser_no pth_temp_ser_no,
"
"           pt_child_sys_ls_no pth_child_sys_ls_no,
"
"           pt_child_lot_no pth_child_lot_no,
"
"           pt_rcpt_store_id pth_rcpt_store_id,
"
"           pt_so_schld_desc pth_so_schld_desc,
"
"           pt_pg_type pth_pg_type,
"
"           pt_oprn_ln_seq pth_oprn_ln_seq,
"
"           pt_loc_id pth_loc_id,
"
"           pt_comp_pfx pth_comp_pfx
"
"      FROM prod_transfer,
"
"           products
"
"     WHERE pt_bu = prod_bu
"
"       AND pt_prod_id = prod_id
"
"       AND pt_prod_rev = prod_rev
"
"       AND prod_status = 'A'
"
"       AND prod_ser_lot_opt = 'S'
"
"       AND pt_bu          = p_bu
"
"       AND pt_user        = p_user
"
"       AND pt_return_flag     = 'Y'
"
"       AND pt_prim_rwk_inside > 0
"
"       AND pt_line_id IS NULL
"
"     UNION
"
"       SELECT  pt_plnt pth_plnt,
"
"           pt_prod_ord_no pth_prod_ord_no,
"
"           pt_trans_no pth_trans_no,
"
"           pt_pp_no pth_pp_no,
"
"           pt_pp_seq_no pth_pp_seq_no,
"
"           pt_prod_id  pth_prod_id,
"
"           pt_prod_rev pth_prod_rev,
"
"           0 pth_pri_rwk_qty,
"
"           pt_secon_rwk_inside pth_sec_rwk_qty,
"
"           0 pth_ppr_rwk_qty,
"
"           pt_comp_sf_code  pth_comp_sf_code,
"
"           pt_sf_code pth_sf_code,
"
"           pt_sys_ls_no pth_sys_ls_no,
"
"           pt_lot_no pth_lot_no,
"
"           pt_ser_no pth_ser_no,
"
"           pt_route_card_no pth_route_card_no,
"
"           pt_so_pfx pth_so_pfx,
"
"           pt_so_no pth_so_no,
"
"           pt_so_seq_no pth_so_seq_no,
"
"           pt_so_sub_seq_no pth_so_sub_seq_no,
"
"           pt_proj_id pth_proj_id,
"
"           pt_task_id pth_task_id,
"
"           pt_reference pth_reference,
"
"           pt_source_id pth_source_id,
"
"           pt_source_type pth_source_type,
"
"           pt_vi_flag pth_vi_flag,
"
"           pt_temp_sys_ls_no pth_temp_sys_ls_no,
"
"           pt_temp_lot_no pth_temp_lot_no,
"
"           pt_temp_ser_no pth_temp_ser_no,
"
"           pt_child_sys_ls_no pth_child_sys_ls_no,
"
"           pt_child_lot_no pth_child_lot_no,
"
"           pt_rcpt_store_id pth_rcpt_store_id,
"
"           pt_so_schld_desc pth_so_schld_desc,
"
"           pt_pg_type pth_pg_type,
"
"           pt_oprn_ln_seq pth_oprn_ln_seq,
"
"           pt_loc_id pth_loc_id,
"
"           pt_comp_pfx pth_comp_pfx
"
"      FROM prod_transfer,
"
"           products
"
"     WHERE pt_bu = prod_bu
"
"       AND pt_prod_id = prod_id
"
"       AND pt_prod_rev = prod_rev
"
"       AND prod_status = 'A'
"
"       AND prod_ser_lot_opt = 'S'
"
"       AND pt_bu           = p_bu
"
"       AND pt_user         = p_user
"
"       AND pt_return_flag         = 'Y'
"
"       AND pt_secon_rwk_inside > 0
"
"       AND pt_line_id IS NULL
"
"     UNION
"
"    SELECT     pt_plnt pth_plnt,
"
"           pt_prod_ord_no pth_prod_ord_no,
"
"           pt_trans_no pth_trans_no,
"
"           pt_pp_no pth_pp_no,
"
"           pt_pp_seq_no pth_pp_seq_no,
"
"           pt_prod_id  pth_prod_id,
"
"           pt_prod_rev pth_prod_rev,
"
"           0 pth_pri_rwk_qty,
"
"           0 pth_sec_rwk_qty,
"
"           pt_pre_process_rej_Qty pth_ppr_rwk_qty,
"
"           pt_comp_sf_code  pth_comp_sf_code,
"
"           pt_sf_code pth_sf_code,
"
"           pt_sys_ls_no pth_sys_ls_no,
"
"           pt_lot_no pth_lot_no,
"
"           pt_ser_no pth_ser_no,
"
"           pt_route_card_no pth_route_card_no,
"
"           pt_so_pfx pth_so_pfx,
"
"           pt_so_no pth_so_no,
"
"           pt_so_seq_no pth_so_seq_no,
"
"           pt_so_sub_seq_no pth_so_sub_seq_no,
"
"           pt_proj_id pth_proj_id,
"
"           pt_task_id pth_task_id,
"
"           pt_reference pth_reference,
"
"           pt_source_id pth_source_id,
"
"           pt_source_type pth_source_type,
"
"           pt_vi_flag pth_vi_flag,
"
"           pt_temp_sys_ls_no pth_temp_sys_ls_no,
"
"           pt_temp_lot_no pth_temp_lot_no,
"
"           pt_temp_ser_no pth_temp_ser_no,
"
"           pt_child_sys_ls_no pth_child_sys_ls_no,
"
"           pt_child_lot_no pth_child_lot_no,
"
"           pt_rcpt_store_id pth_rcpt_store_id,
"
"           pt_so_schld_desc pth_so_schld_desc,
"
"           pt_pg_type pth_pg_type,
"
"           pt_oprn_ln_seq pth_oprn_ln_seq,
"
"            pt_loc_id pth_loc_id,
"
"            pt_comp_pfx pth_comp_pfx
"
"      FROM prod_transfer,
"
"           products
"
"     WHERE pt_bu = prod_bu
"
"       AND pt_prod_id = prod_id
"
"       AND pt_prod_rev = prod_rev
"
"       AND prod_status = 'A'
"
"       AND pt_bu           = p_bu
"
"       AND pt_user         = p_user
"
"       AND pt_return_flag         = 'Y'
"
"       AND pt_ppr_rwk_inside > 0
"
"       AND prod_ser_lot_opt = 'S'
"
"       AND pt_line_id IS NULL;
"
"
"
"    CURSOR c1(c_plnt    VARCHAR2)
"
"        IS
"
"    SELECT bqac_req_rwk_appr,
"
"           bqac_cre_rwk_frm_comp,
"
"           bqac_req_rwk_type,
"
"           bqac_qc_recom_impl_rqrd
"
"      FROM bu_qcm_appl_ctrl
"
"     WHERE bqac_bu   = p_bu
"
"       AND bqac_plnt = c_plnt;
"
"
"
"    CURSOR c2(c_plnt    VARCHAR2,
"
"          c_trans_no     VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM (SELECT ptph_seq_no,
"
"                   ptph_oprn_id,
"
"                   ptph_oprn_ln_seq
"
"          FROM prod_transfer_process_hist
"
"         WHERE ptph_bu         = p_bu
"
"           AND ptph_plnt     = c_plnt
"
"           AND ptph_trans_no = c_trans_no
"
"
"
"         UNION
"
"         SELECT ptp_seq_no ptph_seq_no,
"
"                ptp_oprn_id ptph_oprn_id,
"
"                ptp_oprn_ln_seq ptph_oprn_ln_seq
"
"           FROM prod_transfer_process
"
"         WHERE ptp_bu         = p_bu
"
"           AND ptp_plnt     = c_plnt
"
"           AND ptp_trans_no = c_trans_no
"
"           )
"
"     WHERE ROWNUM = 1
"
"     ORDER BY ptph_seq_no DESC;
"
"
"
"    CURSOR c3(c_prod_id        VARCHAR2,
"
"              c_prod_rev    NUMBER,
"
"              c_sys_ls_no   VARCHAR2,
"
"              c_sou_type    VARCHAR2,
"
"          c_sou_id           VARCHAR2)
"
"        IS
"
"    SELECT     plsn_sys_ls_no,
"
"           plsn_lot_no,
"
"           plsn_ser_no
"
"      FROM prod_lot_ser_nos
"
"     WHERE plsn_bu        = p_bu
"
"       AND plsn_prod_id    = c_prod_id
"
"       AND plsn_prod_rev    = c_prod_rev
"
"       AND plsn_sys_ls_no    = c_sys_ls_no
"
"       AND plsn_source_id   = c_sou_id
"
"       AND plsn_source_type = c_sou_type;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"
"
"       v_ord_no            VARCHAR2(30);
"
"       v_rw_comp        VARCHAR2(4000);
"
"       v_rw_comp1        VARCHAR2(4000);
"
"       v_ord_no1         VARCHAR2(4000);
"
"       v_oprn_id        VARCHAR2(15);
"
"       v_sys_ls_no         NUMBER;
"
"       v_lot_no            VARCHAR2(50);
"
"       v_ser_no            VARCHAR2(50);
"
"       v_scrap_qty        NUMBER:= 0 ;
"
"       v_repair_qty        NUMBER:= 0;
"
"       v_disass_qty        NUMBER:= 0;
"
"       v_seq_no            NUMBER;
"
"       v_loop             NUMBER;
"
"       v_oprn_ln_seq    VARCHAR2(110);
"
"
"
"              v_last_no      VARCHAR2(30);
"
"       v_first_no     VARCHAR2(30);
"
"
"
"    BEGIN
"
"
"
"       p_check := 'N';
"
"
"
"       FOR cr_ser IN c_ser(NULL,NULL)
"
"       LOOP
"
"
"
"
"
"             UPDATE prod_transfer_hist
"
"                SET pth_prim_ret_cur           = pth_prim_ret_cur + cr_ser.pcsh_primt_ret_cur,
"
"                    pth_prim_suplr_id      = pth_prim_suplr_id + cr_ser.pcsh_prim_suplr_id,
"
"                    pth_prim_rwk_inside    = pth_prim_rwk_inside + cr_ser.pcsh_prim_rwk_inside,
"
"                    pth_prim_rwk_outside   = pth_prim_rwk_outside + cr_ser.pcsh_prim_rwk_outside,
"
"                    pth_prim_rwk_supplier  = pth_prim_rwk_supplier + cr_ser.pcsh_prim_rwk_supplier,
"
"                    pth_secon_ret_cur      = pth_secon_ret_cur + cr_ser.pcsh_secon_ret_cur,
"
"                    pth_secon_suplr_id     = pth_secon_suplr_id + cr_ser.pcsh_secon_suplr_id,
"
"                    pth_secon_rwk_inside   = pth_secon_rwk_inside + cr_ser.pcsh_secon_rwk_inside ,
"
"                    pth_secon_rwk_outside  = pth_secon_rwk_outside + cr_ser.pcsh_secon_rwk_outside,
"
"                    pth_secon_rwk_supplier = pth_secon_rwk_supplier + cr_ser.pcsh_secon_rwk_supplier,
"
"                    pth_user               = p_user,
"
"                    pth_return_flag        = 'Y',
"
"                    pth_upd_by             = p_user,
"
"                    pth_upd_date           = SYSDATE
"
"                      WHERE pth_bu       = p_bu
"
"                        AND pth_plnt     = cr_ser.pcsh_plnt
"
"                        AND pth_trans_no = cr_ser.pcsh_doc_no
"
"                        AND pth_line_id IS NULL;
"
"
"
"                      IF SQL%NOTFOUND THEN
"
"
"
"                     UPDATE prod_transfer
"
"                        SET pt_prim_ret_cur       = pt_prim_ret_cur + cr_ser.pcsh_primt_ret_cur,
"
"                    pt_prim_suplr_id      = pt_prim_suplr_id + cr_ser.pcsh_prim_suplr_id,
"
"                    pt_prim_rwk_inside    = pt_prim_rwk_inside + cr_ser.pcsh_prim_rwk_inside,
"
"                    pt_prim_rwk_outside   = pt_prim_rwk_outside + cr_ser.pcsh_prim_rwk_outside,
"
"                    pt_prim_rwk_supplier  = pt_prim_rwk_supplier + cr_ser.pcsh_prim_rwk_supplier,
"
"                    pt_secon_ret_cur      = pt_secon_ret_cur + cr_ser.pcsh_secon_ret_cur,
"
"                    pt_secon_suplr_id     = pt_secon_suplr_id + cr_ser.pcsh_secon_suplr_id,
"
"                    pt_secon_rwk_inside   = pt_secon_rwk_inside + cr_ser.pcsh_secon_rwk_inside ,
"
"                    pt_secon_rwk_outside  = pt_secon_rwk_outside + cr_ser.pcsh_secon_rwk_outside,
"
"                    pt_secon_rwk_supplier = pt_secon_rwk_supplier + cr_ser.pcsh_secon_rwk_supplier,
"
"                    pt_user               = p_user,
"
"                    pt_return_flag        = 'Y',
"
"                    pt_upd_by             = p_user,
"
"                    pt_upd_date           = SYSDATE
"
"                      WHERE pt_bu       = p_bu
"
"                        AND pt_plnt     = cr_ser.pcsh_plnt
"
"                        AND pt_trans_no = cr_ser.pcsh_doc_no
"
"                        AND pt_line_id IS NULL;
"
"            END IF;
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Update');
"
"
"
"            p_check := 'Y';
"
"
"
"
"
"       END LOOP c_ser;
"
"
"
"      IF p_check = 'Y' THEN
"
"
"
"       FOR cr0 IN c0
"
"       LOOP
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Loop');
"
"
"
"         /* OPEN c1(cr0.pth_plnt);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20560,'PLN' || ' ' ||cr0.pth_plnt||' - ' ||'Planning Control not defined.');
"
"         END IF;
"
"
"
"         IF cr1.bqac_cre_rwk_frm_comp = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20560,'PLN' || ' ' ||cr0.pth_plnt||' - ' ||'Not able to create Rework Document from TQM.');
"
"         END IF;
"
"
"
"             IF cr1.bqac_cre_rwk_frm_comp = 'Y' THEN--AND cr1.bqac_qc_recom_impl_rqrd = 'N' THEN */
"
"
"
"                IF cr0.pth_pg_type NOT IN ('C') THEN
"
"
"
"                OPEN c2 (cr0.pth_plnt, cr0.pth_trans_no);
"
"                FETCH c2 INTO cr2;
"
"
"
"                   IF c2%NOTFOUND OR cr2.ptph_oprn_id IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20476,'SFM');
"
"                   ELSE
"
"                    v_oprn_id := cr2.ptph_oprn_id;
"
"                    v_oprn_ln_seq := cr2.ptph_oprn_ln_seq;
"
"                   END IF;
"
"
"
"                CLOSE c2;
"
"
"
"                END IF;
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu, cr0.pth_prod_id, cr0.pth_prod_rev) NOT IN ('N') AND
"
"                   func_find_prod_ser_no_opt(p_bu, cr0.pth_prod_id, cr0.pth_prod_rev) IN ('T') AND
"
"                   cr0.pth_child_sys_ls_no IS NOT NULL AND INSTR(cr0.pth_sf_code, '1') = 0 THEN
"
"
"
"                   OPEN c3(cr0.pth_prod_id, cr0.pth_prod_rev, cr0.pth_child_sys_ls_no, cr0.pth_source_type, cr0.pth_source_id);
"
"                   FETCH c3 INTO cr3;
"
"
"
"                      IF c3%FOUND THEN
"
"                         v_sys_ls_no := cr3.plsn_sys_ls_no;
"
"                         v_lot_no    := cr3.plsn_lot_no;
"
"                      ELSE
"
"                         RAISE_APPLICATION_ERROR(-20969,'ICM'||cr0.pth_prod_id||'~'||cr0.pth_prod_rev||'~'||cr0.pth_child_sys_ls_no||'~'||cr0.pth_source_id||'~'||cr0.pth_source_type);
"
"                      END IF;
"
"
"
"                   CLOSE c3;
"
"                ELSE
"
"                   v_sys_ls_no := cr0.pth_sys_ls_no;
"
"                   v_lot_no    := cr0.pth_lot_no;
"
"                   v_ser_no    := cr0.pth_ser_no;
"
"                END IF;
"
"
"
"            --v_ord_no     := func_find_pfx_nextno(p_bu,p_doc_date,'RWO',p_user);
"
"
"
"        v_ord_no     := func_find_pfx_nextno(p_bu,
"
"                            p_doc_date,
"
"                            func_find_vou_dflt_pfx(p_bu,
"
"                                     cr0.pth_plnt,
"
"                                     cr0.pth_loc_id,
"
"                                     'RWO',
"
"                                     'RPO'),
"
"                                     p_user);
"
"
"
"
"
"
"
"
"
"        /*func_find_pfx_nextno(    p_bu,
"
"                            p_doc_date,
"
"                            func_find_get_mfg_pfx(p_bu,
"
"                                     cr0.pth_loc_id,
"
"                                     cr0.pth_plnt,
"
"                                     'RWO'),
"
"                                     p_user);*/
"
"
"
"
"
"        IF v_first_no IS NULL THEN
"
"
"
"           v_first_no  := v_ord_no;
"
"
"
"        END IF;
"
"
"
"        v_last_no  := v_ord_no;
"
"
"
"            DBMS_OUTPUT.PUT_LINE('HD');--cr0.pth_pri_rwk_qty
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM '||cr0.pth_pri_rwk_qty||'+'||cr0.pth_sec_rwk_qty||'+'||cr0.pth_ppr_rwk_qty||'-'||cr0.pth_prod_ord_no);--func_find_get_mfg_pfx(p_bu,
"
"              --                       cr0.pth_loc_id,
"
"             --                        cr0.pth_plnt,
"
"               --                      'RWO'));
"
"
"
"            INSERT INTO rework_order_hd (rwohd_bu        ,
"
"                                         rwohd_plnt        ,
"
"                     rwohd_ord_pfx,
"
"                                         rwohd_ord_no        ,
"
"                                         rwohd_date        ,
"
"                                         rwohd_prod_id        ,
"
"                                         rwohd_prod_rev        ,
"
"                                         rwohd_prod_ord_no    ,
"
"                                         rwohd_rework_qty    ,
"
"                                         rwohd_sys_ls_no          ,
"
"                                         rwohd_lot_no        ,
"
"                                         rwohd_serial_no    ,
"
"                                         rwohd_route_card_no    ,
"
"                                         rwohd_so_pfx        ,
"
"                                         rwohd_so_no        ,
"
"                                         rwohd_so_seq_no    ,
"
"                                         rwohd_so_sub_seq_no      ,
"
"                                         rwohd_proj_id            ,
"
"                                         rwohd_task_id            ,
"
"                                         rwohd_reference    ,
"
"                                         rwohd_status        ,
"
"                                         rwohd_line_id        ,
"
"                                         rwohd_rec_source    ,
"
"                                         rwohd_ord_type        ,
"
"                                         rwohd_prim_rwk_qty    ,
"
"                                         rwohd_secon_rwk_qty    ,
"
"                                         rwohd_ppr_rwk_qty    ,
"
"                                         rwohd_rcpt_store_id    ,
"
"                                         rwohd_sf_code        ,
"
"                                         rwohd_cre_by        ,
"
"                                         rwohd_cre_date        ,
"
"                                         rwohd_cre_ip_addr    ,
"
"                                         rwohd_cre_os_user    ,
"
"                                         rwohd_cre_emp_id    ,
"
"                                         rwohd_sou_doc_pfx    ,
"
"                                         rwohd_sou_doc_no    ,
"
"                                         rwohd_sou_doc_line_no    ,
"
"                                         rwohd_pp_no              ,
"
"                                         rwohd_pp_seq_no          ,
"
"                                         rwohd_source_id          ,
"
"                                         rwohd_source_type    ,
"
"                                         rwohd_vi_flag        ,
"
"                                         rwohd_oprn_id        ,
"
"                                         rwohd_so_schld_desc,
"
"                                         rwohd_oprn_ln_seq,
"
"                                         rwohd_loc_id,
"
"                                         rwohd_plnt_loc_id,
"
"                                         rwohd_plnt_loc_name,
"
"                                         rwohd_repair_qty
"
"                                         )
"
"                                    VALUES(p_bu            ,
"
"                                         cr0.pth_plnt        ,
"
"                                         func_find_get_mfg_pfx(p_bu,
"
"                                                               cr0.pth_loc_id,
"
"                                                               cr0.pth_plnt,
"
"                                                               'RWO'),
"
"                                         v_ord_no        ,
"
"                                         TRUNC(p_doc_date)        ,
"
"                                         cr0.pth_prod_id    ,
"
"                                         cr0.pth_prod_rev    ,
"
"                                         cr0.pth_prod_ord_no    ,
"
"                                         (cr0.pth_pri_rwk_qty + cr0.pth_sec_rwk_qty + cr0.pth_ppr_rwk_qty),
"
"                                         v_sys_ls_no        ,
"
"                                         v_lot_no            ,
"
"                                         v_ser_no        ,
"
"                                         cr0.pth_route_card_no    ,
"
"                                         cr0.pth_so_pfx        ,
"
"                                         cr0.pth_so_no        ,
"
"                                         cr0.pth_so_seq_no    ,
"
"                                         cr0.pth_so_sub_seq_no    ,
"
"                                         cr0.pth_proj_id          ,
"
"                                         cr0.pth_task_id          ,
"
"                                         CASE WHEN cr0.pth_pri_rwk_qty > 0 THEN 'REWORK DOC FOR PRIMARY REJECTION' WHEN cr0.pth_sec_rwk_qty > 0     THEN 'REWORK DOC FOR SECONDARY REJECTION' END,
"
"                                         'E'            ,
"
"                                         NULL            ,
"
"                                         'S'            ,
"
"                                         'RPO'            ,
"
"                                         cr0.pth_pri_rwk_qty      ,
"
"                                         cr0.pth_sec_rwk_qty      ,
"
"                                         cr0.pth_ppr_rwk_qty    ,
"
"                                         NULL            ,
"
"                                         cr0.pth_comp_sf_code    ,
"
"                                         p_user            ,
"
"                                         SYSDATE        ,
"
"                                         audit_info.get_ip_address    ,
"
"                                                    audit_info.get_os_user        ,
"
"                                                    func_find_emp_id(p_bu,p_user)    ,
"
"                                         cr0.pth_comp_pfx            ,
"
"                                         cr0.pth_trans_no    ,
"
"                                         NULL            ,
"
"                                         cr0.pth_pp_no            ,
"
"                                         cr0.pth_pp_seq_no        ,
"
"                                         cr0.pth_source_id    ,
"
"                                         cr0.pth_source_type    ,
"
"                                         NVL(cr0.pth_vi_flag,'N'),
"
"                                         v_oprn_id         ,
"
"                                         cr0.pth_so_schld_desc,
"
"                                         v_oprn_ln_seq,
"
"                                         cr0.pth_loc_id,
"
"                                         cr0.pth_loc_id,
"
"                                         func_find_plnt_loc_qry_desc(p_bu,cr0.pth_loc_id),
"
"                                         (cr0.pth_pri_rwk_qty + cr0.pth_sec_rwk_qty + cr0.pth_ppr_rwk_qty)
"
"                                         );
"
"
"
"                v_seq_no := 1;
"
"
"
"            FOR cr_ser IN c_ser(cr0.pth_plnt,cr0.pth_trans_no)
"
"            LOOP
"
"
"
"
"
"                DBMS_OUTPUT.PUT_LINE('LN Serial');
"
"
"
"                INSERT INTO rework_order_ser_dtls(
"
"                                                rosd_bu    ,
"
"                                                rosd_plnt,
"
"                                                rosd_rwk_ord_no,
"
"                                                rosd_seq_no    ,
"
"                                                rosd_ser_no    ,
"
"                                                rosd_sys_ls_no    ,
"
"                                                rosd_source_id    ,
"
"                                                rosd_source_type,
"
"                                                rosd_ser_status,
"
"                                                rosd_cre_by    ,
"
"                                                rosd_cre_date,
"
"                                                rosd_upd_by    ,
"
"                                                rosd_upd_date    ,
"
"                                                rosd_qty,
"
"                                                rosd_prod_ord_no,
"
"                                                rosd_prim_rwk_qty,
"
"                                                rosd_secon_rwk_qty,
"
"                                                rosd_cre_emp_id,
"
"                                                rosd_cre_ip_addr,
"
"                                                rosd_cre_os_user
"
"                                                )
"
"                                        VALUES(p_bu    ,
"
"                                               cr0.pth_plnt,
"
"                                               v_ord_no,
"
"                                               v_seq_no    ,
"
"                                               cr_ser.pcsh_serialno    ,
"
"                                               cr_ser.pcsh_sys_ls_no,
"
"                                               cr_ser.pcsh_source_id    ,
"
"                                               cr_ser.pcsh_source_type    ,
"
"                                               'R',
"
"                                               p_user    ,
"
"                                               SYSDATE,
"
"                                               NULL    ,
"
"                                               NULL    ,
"
"                                               CASE WHEN cr_ser.pcsh_prim_rwk_inside > 0 AND cr_ser.pcsh_secon_rwk_inside = 0 THEN
"
"                                               cr_ser.pcsh_prim_rwk_inside
"
"                                                    WHEN cr_ser.pcsh_secon_rwk_inside > 0 AND cr_ser.pcsh_prim_rwk_inside = 0 THEN
"
"                                               cr_ser.pcsh_secon_rwk_inside ELSE cr_ser.pcsh_secon_rwk_inside + cr_ser.pcsh_prim_rwk_inside END,
"
"                                               cr_ser.pcshh_prod_ord_no,
"
"                                               nvl(cr_ser.pcsh_prim_rwk_inside,0),
"
"                                               NVL(cr_ser.pcsh_secon_rwk_inside,0),
"
"                                               func_find_emp_id(p_bu,p_user)    ,
"
"                                                   audit_info.get_ip_address    ,
"
"                                                              audit_info.get_os_user
"
"                                               );
"
"
"
"                                v_seq_no :=  v_seq_no + 1;
"
"
"
"            END LOOP c_ser;
"
"
"
"
"
"            IF cr0.pth_prod_ord_no IS NOT NULL THEN
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu,cr0.pth_prod_id,cr0.pth_prod_rev) IN ('L','O') THEN
"
"
"
"               proc_upd_oprn_status_qtys(p_bu,
"
"                                         cr0.pth_plnt,
"
"                                         cr0.pth_prod_ord_no,
"
"                                         v_oprn_id,
"
"                                         v_oprn_ln_seq,
"
"                                         cr0.pth_comp_sf_code,
"
"                                         0,                -- p_queue_qty
"
"                                         0,                -- p_run_qty
"
"                                         0,                -- p_os_run_qty
"
"                                         0,                -- p_qc_qty
"
"                                         0,                -- p_st_qty
"
"                                         0,                -- p_comp_qty
"
"                                         -(cr0.pth_pri_rwk_qty + cr0.pth_sec_rwk_qty ),    -- p_rej_qty
"
"                                         (cr0.pth_pri_rwk_qty  + cr0.pth_sec_rwk_qty + cr0.pth_ppr_rwk_qty),    -- p_rework_qty
"
"                                         0,                -- p_os_rework_qty
"
"                                         0,                -- p_return_qty
"
"                                         0,                -- p_scrap_qty
"
"                                         0,                -- p_dis_ass_qty
"
"                                         0,                -- p_cs_qty
"
"                                         0,                --p_prev_proc_comp_qty
"
"                                         cr0.pth_sys_ls_no,
"
"                                         cr0.pth_lot_no,
"
"                                         NULL,
"
"                                         cr0.pth_route_card_no,
"
"                                         'PQC',
"
"                                         p_user,
"
"                                         cr0.pth_ppr_rwk_qty        -- p_pre_process_rej_Qty
"
"                                         );
"
"
"
"                ELSIF func_find_prod_ser_lot_type(p_bu,cr0.pth_prod_id,cr0.pth_prod_rev) IN ('S') THEN
"
"
"
"                    FOR cr_ser IN c_ser(cr0.pth_plnt,cr0.pth_trans_no)
"
"                    LOOP
"
"
"
"                        UPDATE prod_ord_oper_status
"
"                           SET pros_rej_qty        = pros_rej_qty - 1,
"
"                               pros_rework_qty        = pros_rework_qty + 1
"
"                         WHERE pros_bu        = p_bu
"
"                           AND pros_plnt    = cr0.pth_plnt
"
"                           AND pros_ord_no    = cr0.pth_prod_ord_no
"
"                           AND pros_oprn_id    = v_oprn_id
"
"                           AND pros_oprn_ln_seq = v_oprn_ln_seq
"
"                           AND pros_sf_code    = cr0.pth_comp_sf_code
"
"                           AND (pros_sys_ls_no    = cr_ser.pcsh_sys_ls_no OR (pros_sys_ls_no IS NULL AND cr_ser.pcsh_sys_ls_no IS NULL))
"
"                           AND (pros_ser_no    =  cr_ser.pcsh_serialno OR (pros_ser_no IS NULL AND cr_ser.pcsh_serialno IS NULL))
"
"                           AND pros_rej_qty > 0
"
"                           AND pros_type IN ('PQC');
"
"
"
"                    END LOOP;
"
"                END IF;
"
"                END IF;
"
"
"
"            FOR cr_ser IN c_ser(cr0.pth_plnt,cr0.pth_trans_no)
"
"            LOOP
"
"
"
"                IF cr_ser.pcsh_prim_rej_qty > 0 THEN
"
"
"
"                   UPDATE prod_comp_srlnos_hist
"
"                      SET pcsh_prim_rwk_in_proc_qty = pcsh_prim_rwk_in_proc_qty  + cr_ser.pcsh_prim_rej_qty,
"
"                          pcsh_prim_rwk_inside      = pcsh_prim_rwk_inside       - cr_ser.pcsh_prim_rej_qty,
"
"                          pcsh_upd_by               = p_user,
"
"                          pcsh_upd_date             = SYSDATE
"
"                    WHERE pcsh_bu           = p_bu
"
"                      AND pcsh_plnt         = cr0.pth_plnt
"
"                      AND pcsh_doc_no       = cr0.pth_trans_no
"
"                      AND pcsh_serialno     = cr_ser.pcsh_serialno
"
"                      AND pcsh_sys_ls_no    = cr_ser.pcsh_sys_ls_no
"
"                      AND pcsh_user         = p_user;
"
"
"
"                               IF SQL%NOTFOUND THEN
"
"
"
"                       UPDATE prod_comp_srlnos
"
"                      SET pcs_prim_rwk_in_proc_qty = pcs_prim_rwk_in_proc_qty  + cr_ser.pcsh_prim_rej_qty,
"
"                          pcs_prim_rwk_inside      = pcs_prim_rwk_inside       - cr_ser.pcsh_prim_rej_qty,
"
"                          pcs_upd_by               = p_user,
"
"                          pcs_upd_date             = SYSDATE
"
"                    WHERE pcs_bu           = p_bu
"
"                      AND pcs_plnt         = cr0.pth_plnt
"
"                      AND pcs_doc_no       = cr0.pth_trans_no
"
"                      AND pcs_serialno     = cr_ser.pcsh_serialno
"
"                      AND pcs_sys_ls_no    = cr_ser.pcsh_sys_ls_no
"
"                      AND pcs_user         = p_user;
"
"                END IF;
"
"
"
"
"
"                   UPDATE prod_transfer_hist
"
"                      SET pth_prim_rwk_in_proc_qty = pth_prim_rwk_in_proc_qty + cr_ser.pcsh_prim_rej_qty,
"
"                          pth_prim_rwk_inside      = pth_prim_rwk_inside      - cr_ser.pcsh_prim_rej_qty,
"
"                          pth_upd_by                = p_user,
"
"                          pth_upd_date              = SYSDATE
"
"                    WHERE pth_bu           = p_bu
"
"                      AND pth_plnt         = cr0.pth_plnt
"
"                      AND (pth_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pth_prod_ord_no IS NULL))
"
"                      AND pth_trans_no     = cr0.pth_trans_no
"
"                      AND pth_user         = p_user
"
"                      AND pth_return_flag  = 'Y';
"
"                IF SQL%NOTFOUND THEN
"
"                       UPDATE prod_transfer
"
"                      SET pt_prim_rwk_in_proc_qty = pt_prim_rwk_in_proc_qty + cr_ser.pcsh_prim_rej_qty,
"
"                          pt_prim_rwk_inside      = pt_prim_rwk_inside      - cr_ser.pcsh_prim_rej_qty,
"
"                          pt_upd_by                = p_user,
"
"                          pt_upd_date              = SYSDATE
"
"                    WHERE pt_bu           = p_bu
"
"                      AND pt_plnt         = cr0.pth_plnt
"
"                      AND (pt_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pt_prod_ord_no IS NULL))
"
"                      AND pt_trans_no     = cr0.pth_trans_no
"
"                      AND pt_user         = p_user
"
"                      AND pt_return_flag  = 'Y';
"
"                END IF;
"
"
"
"                    DBMS_OUTPUT.PUT_LINE('Serial Update ->'||' ' ||cr_ser.pcsh_prim_rej_qty||' ' ||cr_ser.pcsh_serialno||' ' ||cr_ser.pcsh_sys_ls_no);
"
"
"
"                END IF;
"
"
"
"                IF cr_ser.pcsh_secon_rej_qty > 0 THEN
"
"
"
"                   UPDATE prod_comp_srlnos_hist
"
"                      SET pcsh_secon_rwk_in_proc_qty = pcsh_secon_rwk_in_proc_qty  + cr_ser.pcsh_secon_rej_qty,
"
"                          pcsh_secon_rwk_inside      = pcsh_secon_rwk_inside       - cr_ser.pcsh_secon_rej_qty,
"
"                          pcsh_upd_by               = p_user,
"
"                          pcsh_upd_date             = SYSDATE
"
"                    WHERE pcsh_bu           = p_bu
"
"                      AND pcsh_plnt         = cr0.pth_plnt
"
"                      AND pcsh_doc_no       = cr0.pth_trans_no
"
"                      AND pcsh_serialno     = cr_ser.pcsh_serialno
"
"                      AND pcsh_sys_ls_no    = cr_ser.pcsh_sys_ls_no
"
"                      AND pcsh_user         = p_user;
"
"
"
"                                IF SQL%NOTFOUND THEN
"
"                       UPDATE prod_comp_srlnos
"
"                      SET pcs_secon_rwk_in_proc_qty = pcs_secon_rwk_in_proc_qty  + cr_ser.pcsh_secon_rej_qty,
"
"                          pcs_secon_rwk_inside     = pcs_secon_rwk_inside       - cr_ser.pcsh_secon_rej_qty,
"
"                              pcs_upd_by               = p_user,
"
"                              pcs_upd_date             = SYSDATE
"
"                    WHERE pcs_bu           = p_bu
"
"                      AND pcs_plnt         = cr0.pth_plnt
"
"                      AND pcs_doc_no       = cr0.pth_trans_no
"
"                      AND pcs_serialno     = cr_ser.pcsh_serialno
"
"                      AND pcs_sys_ls_no    = cr_ser.pcsh_sys_ls_no
"
"                      AND pcs_user         = p_user;
"
"                END IF;
"
"
"
"
"
"                   UPDATE prod_transfer_hist
"
"                      SET pth_secon_rwk_in_proc_qty = pth_secon_rwk_in_proc_qty + cr_ser.pcsh_secon_rej_qty,
"
"                          pth_secon_rwk_inside      = pth_secon_rwk_inside      - cr_ser.pcsh_secon_rej_qty,
"
"                          pth_upd_by                = p_user,
"
"                          pth_upd_date              = SYSDATE
"
"                    WHERE pth_bu           = p_bu
"
"                      AND pth_plnt         = cr0.pth_plnt
"
"                      AND (pth_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pth_prod_ord_no IS NULL))
"
"                      AND pth_trans_no     = cr0.pth_trans_no
"
"                      AND pth_user         = p_user
"
"                      AND pth_return_flag  = 'Y';
"
"                             IF SQL%NOTFOUND THEN
"
"                   UPDATE prod_transfer
"
"                      SET pt_secon_rwk_in_proc_qty = pt_secon_rwk_in_proc_qty + cr_ser.pcsh_secon_rej_qty,
"
"                          pt_secon_rwk_inside      = pt_secon_rwk_inside      - cr_ser.pcsh_secon_rej_qty,
"
"                          pt_upd_by                = p_user,
"
"                          pt_upd_date              = SYSDATE
"
"                    WHERE pt_bu           = p_bu
"
"                      AND pt_plnt         = cr0.pth_plnt
"
"                      AND (pt_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pt_prod_ord_no IS NULL))
"
"                      AND pt_trans_no     = cr0.pth_trans_no
"
"                      AND pt_user         = p_user
"
"                      AND pt_return_flag  = 'Y';
"
"                END IF;
"
"                END IF;
"
"
"
"
"
"            END LOOP;
"
"
"
"
"
"
"
"              /*  IF cr1.bqac_req_rwk_appr = 'P' THEN
"
"
"
"                   UPDATE rework_order_hd
"
"                      SET rwohd_status   = 'A',
"
"                          rwohd_upd_by   = p_user,
"
"                          rwohd_upd_date = SYSDATE
"
"                    WHERE rwohd_bu     = p_bu
"
"                      AND rwohd_plnt   = cr0.pth_plnt
"
"                      AND rwohd_ord_no = v_ord_no;
"
"
"
"                ELSIF cr1.bqac_req_rwk_appr = 'N'  THEN
"
"
"
"                    FOR c_qty IN (SELECT rosd_prim_rwk_qty  pcsh_prim_rwk_inside,
"
"                                         rosd_secon_rwk_qty pcsh_secon_rwk_inside,rosd_seq_no
"
"                                    FROM rework_order_ser_dtls
"
"                                   WHERE rosd_bu = p_bu
"
"                                     AND rosd_plnt = cr0.pth_plnt
"
"                                     AND rosd_rwk_ord_no = v_ord_no
"
"                                   )
"
"                    LOOP
"
"
"
"                       IF cr1.bqac_req_rwk_type = 'S' THEN
"
"                          v_scrap_qty  :=  v_scrap_qty + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside);
"
"                          v_repair_qty := v_repair_qty + 0;
"
"                          v_disass_qty :=  v_disass_qty + 0;
"
"
"
"                        UPDATE rework_order_ser_dtls
"
"                           SET rosd_repair_qty =  0      ,
"
"                               rosd_scrap_qty  =   rosd_scrap_qty +  (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside)     ,
"
"                               rosd_dis_assemble = 0
"
"                         WHERE rosd_bu = p_bu
"
"                               AND rosd_plnt = cr0.pth_plnt
"
"                                   AND rosd_rwk_ord_no = v_ord_no
"
"                                   AND rosd_seq_no = c_qty.rosd_seq_no;
"
"
"
"                       ELSIF cr1.bqac_req_rwk_type = 'R' THEN
"
"                          v_scrap_qty  :=  0;
"
"                          v_repair_qty := v_repair_qty +  (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside);
"
"                          v_disass_qty := 0;
"
"
"
"                            UPDATE rework_order_ser_dtls
"
"                           SET rosd_repair_qty =   rosd_repair_qty + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside)      ,
"
"                               rosd_scrap_qty  =   0     ,
"
"                               rosd_dis_assemble = 0
"
"                         WHERE rosd_bu = p_bu
"
"                               AND rosd_plnt = cr0.pth_plnt
"
"                                   AND rosd_rwk_ord_no = v_ord_no
"
"                                   AND rosd_seq_no = c_qty.rosd_seq_no;
"
"
"
"                       ELSIF cr1.bqac_req_rwk_type = 'D' THEN
"
"                          v_scrap_qty  := 0;
"
"                          v_repair_qty :=  0;
"
"                          v_disass_qty :=  v_disass_qty + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside);
"
"
"
"                        UPDATE rework_order_ser_dtls
"
"                           SET rosd_repair_qty =   0   ,
"
"                               rosd_scrap_qty  =   0     ,
"
"                               rosd_dis_assemble = rosd_dis_assemble + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside)
"
"                         WHERE rosd_bu = p_bu
"
"                               AND rosd_plnt = cr0.pth_plnt
"
"                                   AND rosd_rwk_ord_no = v_ord_no
"
"                                   AND rosd_seq_no = c_qty.rosd_seq_no;
"
"                       END IF;
"
"
"
"                    END LOOP;
"
"
"
"                   UPDATE rework_order_hd
"
"                      SET rwohd_status       = 'A',
"
"                          rwohd_sel_flag     = 'Y',
"
"                          rwohd_user         = p_user,
"
"                          rwohd_scrap_qty    = v_scrap_qty,
"
"                          rwohd_repair_qty   = v_repair_qty,
"
"                          rwohd_dis_assemble = v_disass_qty,
"
"                          rwohd_upd_by       = p_user,
"
"                          rwohd_upd_date     = SYSDATE
"
"                    WHERE rwohd_bu     = p_bu
"
"                      AND rwohd_plnt   = cr0.pth_plnt
"
"                      AND rwohd_ord_no = v_ord_no;
"
"
"
"                      UPDATE rework_order_ser_dtls
"
"                         SET rosd_sel_flag = 'Y',
"
"                             rosd_sel_user = p_user,
"
"                           rosd_upd_by = p_user,
"
"                           rosd_upd_date = SYSDATE
"
"                       WHERE rosd_bu = p_bu
"
"                         AND rosd_plnt = cr0.pth_plnt
"
"                            AND rosd_rwk_ord_no = v_ord_no;
"
"
"
"                   proc_cre_rwk_comp_rec_new(p_bu,
"
"                                             TRUNC(p_doc_date),
"
"                                             p_user,
"
"                                             v_rw_comp,
"
"                                             v_ord_no,
"
"                                             p_result => v_rw_comp1
"
"                                             );
"
"
"
"                END IF; */
"
"
"
"                v_ord_no1 := v_ord_no1||v_ord_no||' ';
"
"
"
"--             END IF;
"
"
"
"
"
"--          CLOSE c1;
"
"
"
"          IF v_first_no = v_last_no THEN
"
"               v_ord_no1     := v_first_no;
"
"            ELSE
"
"               v_ord_no1     := v_first_no||'~'||v_last_no;
"
"            END IF;
"
"
"
"       END LOOP; --c0 End loop
"
"       END IF;
"
"
"
"       IF v_ord_no1 IS NOT NULL THEN
"
"          p_rwo_res := v_ord_no1;--func_find_order_no_substr(v_ord_no1);
"
"       END IF;
"
"
"
"       IF v_rw_comp IS NOT NULL THEN
"
"          p_rwc_res := v_rw_comp;
"
"       END IF;
"
"
"
"       DBMS_OUTPUT.PUT_LINE(p_rwo_res);
"
"
"
"    END    proc_cre_rework_frm_rej;
"
"
"
"PROCEDURE proc_cre_rework_frm_line_rej(p_bu                VARCHAR2,
"
"                                      p_doc_date        DATE,
"
"                                      p_user            VARCHAR2,
"
"                                      p_rwo_res        OUT    VARCHAR2,
"
"                                      p_rwc_res        OUT    VARCHAR2,
"
"                                      p_check        OUT    VARCHAR2
"
"                                      )
"
"    IS
"
"    CURSOR c_line
"
"    IS
"
"        SELECT pth_plnt,
"
"           pth_trans_no,
"
"           ptlre_pg_id,
"
"           ptlre_rwk_inside,
"
"               ptlre_ser_no,
"
"           NVL(ptlre_sys_ls_no,pth_sys_ls_no) pth_sys_ls_no,
"
"           pth_source_id,
"
"           pth_source_type,
"
"           ptlre_ret_cur,
"
"           ptlre_suplr_id,
"
"           ptlre_rwk_outside,
"
"           ptlre_rwk_supplier,
"
"           ptlre_qty,
"
"           pth_prod_ord_no,
"
"           ptlre_oprn_ln_seq
"
"      FROM prod_transfer_hist,
"
"           prod_transfer_line_rej_entry
"
"     WHERE pth_bu = ptlre_bu
"
"           AND pth_plnt = ptlre_plnt
"
"           AND pth_trans_no = ptlre_doc_no
"
"           AND pth_line_id = ptlre_line_id
"
"           AND pth_prod_id = ptlre_prod_id
"
"           AND pth_prod_rev = ptlre_prod_rev
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_sel_user = p_user
"
"       AND ptlre_sel_flag = 'Y'
"
"       AND ptlre_rwk_inside > 0
"
"     UNION ALL
"
"      SELECT pt_plnt,
"
"           pt_trans_no,
"
"           ptlre_pg_id,
"
"           ptlre_rwk_inside,
"
"               ptlre_ser_no,
"
"           NVL(ptlre_sys_ls_no,pt_sys_ls_no) pth_sys_ls_no,
"
"           pt_source_id,
"
"           pt_source_type,
"
"           ptlre_ret_cur,
"
"           ptlre_suplr_id,
"
"           ptlre_rwk_outside,
"
"           ptlre_rwk_supplier,
"
"           ptlre_qty,
"
"           pt_prod_ord_no,
"
"           ptlre_oprn_ln_seq
"
"      FROM prod_transfer,
"
"           prod_transfer_line_rej_entry
"
"     WHERE pt_bu = ptlre_bu
"
"           AND pt_plnt = ptlre_plnt
"
"           AND pt_trans_no = ptlre_doc_no
"
"           AND pt_line_id = ptlre_line_id
"
"           AND pt_prod_id = ptlre_prod_id
"
"           AND pt_prod_rev = ptlre_prod_rev
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_sel_user = p_user
"
"       AND ptlre_sel_flag = 'Y'
"
"       AND ptlre_rwk_inside > 0;
"
"
"
"    CURSOR c0
"
"        IS
"
"    SELECT pth_plnt,
"
"           pth_prod_ord_no,
"
"           pth_line_id ,
"
"           pth_trans_no,
"
"           ptlre_pg_id,
"
"           pth_pp_no,
"
"           pth_pp_seq_no,
"
"           pth_prod_id,
"
"           pth_prod_rev,
"
"           SUM(ptlre_rwk_inside) pth_pri_rwk_qty,
"
"           0 pth_sec_rwk_qty,
"
"           0 pth_ppr_rwk_qty,
"
"           ptlre_sf_code,
"
"           pth_sf_code,
"
"           pth_sys_ls_no pth_sys_ls_no,
"
"           pth_lot_no,
"
"           pth_ser_no,
"
"           pth_route_card_no,
"
"           pth_so_pfx,
"
"           pth_so_no,
"
"           pth_so_seq_no,
"
"           pth_so_sub_seq_no,
"
"           pth_proj_id,
"
"           pth_task_id,
"
"           pth_reference,
"
"           pth_source_id,
"
"           pth_source_type,
"
"           pth_vi_flag,
"
"           pth_temp_sys_ls_no,
"
"           pth_temp_lot_no,
"
"           pth_temp_ser_no,
"
"           pth_child_sys_ls_no,
"
"           pth_child_lot_no,
"
"           pth_rcpt_store_id,
"
"           pth_so_schld_desc,
"
"           pth_pg_type,
"
"           pth_oprn_ln_seq,
"
"       pth_loc_id
"
"      FROM prod_transfer_hist,
"
"           prod_transfer_line_rej_entry
"
"     WHERE pth_bu = ptlre_bu
"
"           AND pth_plnt = ptlre_plnt
"
"           AND pth_trans_no = ptlre_doc_no
"
"           AND pth_line_id = ptlre_line_id
"
"           AND pth_prod_id = ptlre_prod_id
"
"           AND pth_prod_rev = ptlre_prod_rev
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_sel_user = p_user
"
"       AND ptlre_sel_flag = 'Y'
"
"       AND ptlre_rwk_inside > 0
"
"       and pth_bu          = p_bu
"
"       AND pth_user        = p_user
"
"       AND pth_return_flag     = 'Y'
"
"       AND pth_prim_rwk_inside > 0
"
"       AND pth_line_id IS NOT NULL
"
"      GROUP BY pth_plnt,
"
"           pth_prod_ord_no,
"
"           pth_line_id ,
"
"           pth_trans_no,
"
"           ptlre_pg_id,
"
"           pth_pp_no,
"
"           pth_pp_seq_no,
"
"           pth_prod_id,
"
"           pth_prod_rev,
"
"           ptlre_sf_code,
"
"           pth_sf_code,
"
"           pth_sys_ls_no ,
"
"           pth_lot_no,
"
"           pth_ser_no,
"
"           pth_route_card_no,
"
"           pth_so_pfx,
"
"           pth_so_no,
"
"           pth_so_seq_no,
"
"           pth_so_sub_seq_no,
"
"           pth_proj_id,
"
"           pth_task_id,
"
"           pth_reference,
"
"           pth_source_id,
"
"           pth_source_type,
"
"           pth_vi_flag,
"
"           pth_temp_sys_ls_no,
"
"           pth_temp_lot_no,
"
"           pth_temp_ser_no,
"
"           pth_child_sys_ls_no,
"
"           pth_child_lot_no,
"
"           pth_rcpt_store_id,
"
"           pth_so_schld_desc,
"
"           pth_pg_type,
"
"           pth_oprn_ln_seq, pth_loc_id
"
"     UNION
"
"     SELECT    pt_plnt pth_plnt,
"
"           pt_prod_ord_no pth_prod_ord_no,
"
"           pt_line_id pth_line_id ,
"
"           pt_trans_no pth_trans_no,
"
"           ptlre_pg_id,
"
"           pt_pp_no pth_pp_no,
"
"           pt_pp_seq_no pth_pp_seq_no,
"
"           pt_prod_id  pth_prod_id,
"
"           pt_prod_rev pth_prod_rev,
"
"           SUM(ptlre_rwk_inside) pth_pri_rwk_qty,
"
"           0 pth_sec_rwk_qty,
"
"           0 pth_ppr_rwk_qty,
"
"           ptlre_sf_code  pth_comp_sf_code,
"
"           pt_sf_code pth_sf_code,
"
"           pt_sys_ls_no pth_sys_ls_no,
"
"           pt_lot_no pth_lot_no,
"
"           pt_ser_no pth_ser_no,
"
"           pt_route_card_no pth_route_card_no,
"
"           pt_so_pfx pth_so_pfx,
"
"           pt_so_no pth_so_no,
"
"           pt_so_seq_no pth_so_seq_no,
"
"           pt_so_sub_seq_no pth_so_sub_seq_no,
"
"           pt_proj_id pth_proj_id,
"
"           pt_task_id pth_task_id,
"
"           pt_reference pth_reference,
"
"           pt_source_id pth_source_id,
"
"           pt_source_type pth_source_type,
"
"           pt_vi_flag pth_vi_flag,
"
"           pt_temp_sys_ls_no pth_temp_sys_ls_no,
"
"           pt_temp_lot_no pth_temp_lot_no,
"
"           pt_temp_ser_no pth_temp_ser_no,
"
"           pt_child_sys_ls_no pth_child_sys_ls_no,
"
"           pt_child_lot_no pth_child_lot_no,
"
"           pt_rcpt_store_id pth_rcpt_store_id,
"
"           pt_so_schld_desc pth_so_schld_desc,
"
"           pt_pg_type pth_pg_type,
"
"           pt_oprn_ln_seq pth_oprn_ln_seq,
"
"       pt_loc_id pth_loc_id
"
"      FROM prod_transfer,
"
"      prod_transfer_line_rej_entry
"
"     WHERE pt_bu = ptlre_bu
"
"           AND pt_plnt = ptlre_plnt
"
"           AND pt_trans_no = ptlre_doc_no
"
"           AND pt_line_id = ptlre_line_id
"
"           AND pt_prod_id = ptlre_prod_id
"
"           AND pt_prod_rev = ptlre_prod_rev
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_sel_user = p_user
"
"       AND ptlre_sel_flag = 'Y'
"
"       AND ptlre_rwk_inside > 0
"
"       AND pt_bu          = p_bu
"
"       AND pt_user        = p_user
"
"       AND pt_return_flag     = 'Y'
"
"       AND pt_prim_rwk_inside > 0
"
"       AND pt_line_id IS NOT NULL
"
"       GROUP BY pt_plnt ,
"
"           pt_prod_ord_no ,
"
"           pt_line_id,
"
"           pt_trans_no ,
"
"           ptlre_pg_id,
"
"           pt_pp_no ,
"
"           pt_pp_seq_no ,
"
"           pt_prod_id  ,
"
"           pt_prod_rev ,
"
"           ptlre_sf_code  ,
"
"           pt_sf_code ,
"
"           pt_sys_ls_no ,
"
"           pt_lot_no ,
"
"           pt_ser_no,
"
"           pt_route_card_no ,
"
"           pt_so_pfx ,
"
"           pt_so_no ,
"
"           pt_so_seq_no ,
"
"           pt_so_sub_seq_no ,
"
"           pt_proj_id ,
"
"           pt_task_id ,
"
"           pt_reference ,
"
"           pt_source_id ,
"
"           pt_source_type ,
"
"           pt_vi_flag ,
"
"           pt_temp_sys_ls_no ,
"
"           pt_temp_lot_no ,
"
"           pt_temp_ser_no ,
"
"           pt_child_sys_ls_no ,
"
"           pt_child_lot_no ,
"
"           pt_rcpt_store_id ,
"
"           pt_so_schld_desc,
"
"           pt_pg_type,
"
"           pt_oprn_ln_seq,
"
"       pt_loc_id;
"
"
"
"    CURSOR c_ser(c_plnt VARCHAR2 , c_trans_no  VARCHAR2 ,c_sf_code  VARCHAR2)
"
"    IS
"
"    SELECT pth_plnt,
"
"           pth_trans_no,
"
"           ptlre_pg_id,
"
"           ptlre_rwk_inside,
"
"               ptlre_ser_no,
"
"           NVL(ptlre_sys_ls_no,pth_sys_ls_no) ptlre_sys_ls_no,
"
"           pth_source_id,
"
"           pth_source_type,
"
"           ptlre_ret_cur,
"
"           ptlre_suplr_id,
"
"           ptlre_rwk_outside,
"
"           ptlre_rwk_supplier,
"
"           ptlre_qty,
"
"           pth_prod_ord_no
"
"      FROM prod_transfer_hist,
"
"           prod_transfer_line_rej_entry
"
"     WHERE pth_bu = ptlre_bu
"
"           AND pth_plnt = ptlre_plnt
"
"           AND pth_trans_no = ptlre_doc_no
"
"           AND pth_line_id = ptlre_line_id
"
"           AND pth_prod_id = ptlre_prod_id
"
"           AND pth_prod_rev = ptlre_prod_rev
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_sel_user = p_user
"
"       AND ptlre_sel_flag = 'Y'
"
"       AND ptlre_rwk_inside > 0
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_plnt = c_plnt
"
"       AND ptlre_doc_no = c_trans_no
"
"       AND ptlre_sf_code = c_sf_code
"
"     UNION ALL
"
"      SELECT pt_plnt,
"
"           pt_trans_no,
"
"           ptlre_pg_id,
"
"           ptlre_rwk_inside,
"
"               ptlre_ser_no,
"
"           NVL(ptlre_sys_ls_no,pt_sys_ls_no) ptlre_sys_ls_no,
"
"           pt_source_id,
"
"           pt_source_type,
"
"           ptlre_ret_cur,
"
"           ptlre_suplr_id,
"
"           ptlre_rwk_outside,
"
"           ptlre_rwk_supplier,
"
"           ptlre_qty,
"
"           pt_prod_ord_no
"
"      FROM prod_transfer,
"
"           prod_transfer_line_rej_entry
"
"     WHERE pt_bu = ptlre_bu
"
"           AND pt_plnt = ptlre_plnt
"
"           AND pt_trans_no = ptlre_doc_no
"
"           AND pt_line_id = ptlre_line_id
"
"           AND pt_prod_id = ptlre_prod_id
"
"           AND pt_prod_rev = ptlre_prod_rev
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_sel_user = p_user
"
"       AND ptlre_sel_flag = 'Y'
"
"       AND ptlre_rwk_inside > 0
"
"       AND ptlre_bu = p_bu
"
"       AND ptlre_plnt = c_plnt
"
"       AND ptlre_doc_no = c_trans_no
"
"       AND ptlre_sf_code = c_sf_code;
"
"
"
"    CURSOR c1(c_plnt    VARCHAR2)
"
"        IS
"
"    SELECT bqac_req_rwk_appr,
"
"           bqac_cre_rwk_frm_comp,
"
"           bqac_req_rwk_type,
"
"           bqac_qc_recom_impl_rqrd
"
"      FROM bu_qcm_appl_ctrl
"
"     WHERE bqac_bu   = p_bu
"
"       AND bqac_plnt = c_plnt;
"
"
"
"    CURSOR c2(c_plnt    VARCHAR2,
"
"          c_trans_no     VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM (SELECT ptph_seq_no,
"
"                   ptph_oprn_id,
"
"                   ptph_oprn_ln_seq
"
"          FROM prod_transfer_process_hist
"
"         WHERE ptph_bu         = p_bu
"
"           AND ptph_plnt     = c_plnt
"
"           AND ptph_trans_no = c_trans_no
"
"
"
"         UNION
"
"         SELECT ptp_seq_no ptph_seq_no,
"
"                ptp_oprn_id ptph_oprn_id,
"
"                ptp_oprn_ln_seq ptph_oprn_ln_seq
"
"           FROM prod_transfer_process
"
"         WHERE ptp_bu         = p_bu
"
"           AND ptp_plnt     = c_plnt
"
"           AND ptp_trans_no = c_trans_no
"
"           )
"
"     WHERE ROWNUM = 1
"
"     ORDER BY ptph_seq_no DESC;
"
"
"
"    CURSOR c3(c_prod_id        VARCHAR2,
"
"              c_prod_rev    NUMBER,
"
"              c_sys_ls_no   VARCHAR2,
"
"              c_sou_type    VARCHAR2,
"
"          c_sou_id           VARCHAR2)
"
"        IS
"
"    SELECT     plsn_sys_ls_no,
"
"           plsn_lot_no,
"
"           plsn_ser_no
"
"      FROM prod_lot_ser_nos
"
"     WHERE plsn_bu        = p_bu
"
"       AND plsn_prod_id    = c_prod_id
"
"       AND plsn_prod_rev    = c_prod_rev
"
"       AND plsn_sys_ls_no    = c_sys_ls_no
"
"       AND plsn_source_id   = c_sou_id
"
"       AND plsn_source_type = c_sou_type;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"
"
"       v_ord_no        VARCHAR2(30);
"
"       v_rw_comp        VARCHAR2(4000);
"
"       v_rw_comp1        VARCHAR2(4000);
"
"       v_ord_no1         VARCHAR2(4000);
"
"       v_oprn_id        VARCHAR2(15);
"
"       v_sys_ls_no         NUMBER;
"
"       v_lot_no        VARCHAR2(50);
"
"       v_ser_no        VARCHAR2(50);
"
"       v_scrap_qty        NUMBER:= 0 ;
"
"       v_repair_qty        NUMBER:= 0;
"
"       v_disass_qty        NUMBER:= 0;
"
"       v_seq_no            NUMBER;
"
"       v_loop     NUMBER;
"
"       v_oprn_ln_seq    VARCHAR2(20);
"
"
"
"    BEGIN
"
"
"
"       p_check := 'N';
"
"
"
"       FOR cr_line IN c_line
"
"       LOOP
"
"
"
"                   UPDATE prod_transfer_hist
"
"                    SET pth_prim_ret_cur           = pth_prim_ret_cur + cr_line.ptlre_ret_cur,
"
"                    pth_prim_suplr_id      = pth_prim_suplr_id + cr_line.ptlre_suplr_id,
"
"                    pth_prim_rwk_inside    = pth_prim_rwk_inside + cr_line.ptlre_rwk_inside,
"
"                    pth_prim_rwk_outside   = pth_prim_rwk_outside + cr_line.ptlre_rwk_outside,
"
"                    pth_prim_rwk_supplier  = pth_prim_rwk_supplier + cr_line.ptlre_rwk_supplier,
"
"                    pth_user               = p_user,
"
"                    pth_return_flag        = 'Y',
"
"                    pth_upd_by             = p_user,
"
"                    pth_upd_date           = SYSDATE
"
"                      WHERE pth_bu       = p_bu
"
"                        AND pth_plnt     = cr_line.pth_plnt
"
"                        AND pth_trans_no = cr_line.pth_trans_no
"
"                        AND pth_line_id IS NOT NULL;
"
"
"
"                      IF SQL%NOTFOUND THEN
"
"
"
"                     UPDATE prod_transfer
"
"                        SET pt_prim_ret_cur       = pt_prim_ret_cur + cr_line.ptlre_ret_cur,
"
"                    pt_prim_suplr_id      = pt_prim_suplr_id + cr_line.ptlre_suplr_id,
"
"                    pt_prim_rwk_inside    = pt_prim_rwk_inside + cr_line.ptlre_rwk_inside,
"
"                    pt_prim_rwk_outside   = pt_prim_rwk_outside + cr_line.ptlre_rwk_outside,
"
"                    pt_prim_rwk_supplier  = pt_prim_rwk_supplier + cr_line.ptlre_rwk_supplier,
"
"                    pt_user               = p_user,
"
"                    pt_return_flag        = 'Y',
"
"                    pt_upd_by             = p_user,
"
"                    pt_upd_date           = SYSDATE
"
"                      WHERE pt_bu       = p_bu
"
"                        AND pt_plnt     = cr_line.pth_plnt
"
"                        AND pt_trans_no = cr_line.pth_trans_no
"
"                        AND pt_line_id IS NOT NULL;
"
"            END IF;
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Update');
"
"
"
"            p_check := 'Y';
"
"
"
"       END LOOP c_ser;
"
"
"
"      IF p_check = 'Y' THEN
"
"
"
"       FOR cr0 IN c0
"
"       LOOP
"
"
"
"          DBMS_OUTPUT.PUT_LINE('Loop');
"
"
"
"          OPEN c1(cr0.pth_plnt);
"
"          FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20560,'PLN' || ' ' ||cr0.pth_plnt||' - ' ||'Planning Control not defined.');
"
"         END IF;
"
"
"
"         IF cr1.bqac_cre_rwk_frm_comp = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20560,'PLN' || ' ' ||cr0.pth_plnt||' - ' ||'Not able to create Rework Document from TQM.');
"
"         END IF;
"
"
"
"             IF cr1.bqac_cre_rwk_frm_comp = 'Y' THEN--AND cr1.bqac_qc_recom_impl_rqrd = 'N' THEN
"
"
"
"                IF cr0.pth_pg_type NOT IN ('C') THEN
"
"
"
"                OPEN c2 (cr0.pth_plnt, cr0.pth_trans_no);
"
"                FETCH c2 INTO cr2;
"
"
"
"                   IF c2%NOTFOUND OR cr2.ptph_oprn_id IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20476,'SFM');
"
"                   ELSE
"
"                    v_oprn_id := cr2.ptph_oprn_id;
"
"                    v_oprn_ln_seq := cr2.ptph_oprn_ln_seq;
"
"                   END IF;
"
"
"
"                CLOSE c2;
"
"
"
"                END IF;
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu, cr0.pth_prod_id, cr0.pth_prod_rev) NOT IN ('N') AND
"
"                   func_find_prod_ser_no_opt(p_bu, cr0.pth_prod_id, cr0.pth_prod_rev) IN ('T') AND
"
"                   cr0.pth_child_sys_ls_no IS NOT NULL AND INSTR(cr0.pth_sf_code, '1') = 0 THEN
"
"
"
"                   OPEN c3(cr0.pth_prod_id, cr0.pth_prod_rev, cr0.pth_child_sys_ls_no, cr0.pth_source_type, cr0.pth_source_id);
"
"                   FETCH c3 INTO cr3;
"
"
"
"                      IF c3%FOUND THEN
"
"                         v_sys_ls_no := cr3.plsn_sys_ls_no;
"
"                         v_lot_no    := cr3.plsn_lot_no;
"
"                      ELSE
"
"                         RAISE_APPLICATION_ERROR(-20969,'ICM'||cr0.pth_prod_id||'~'||cr0.pth_prod_rev||'~'||cr0.pth_child_sys_ls_no||'~'||cr0.pth_source_id||'~'||cr0.pth_source_type);
"
"                      END IF;
"
"
"
"                   CLOSE c3;
"
"                ELSE
"
"                   v_sys_ls_no := cr0.pth_sys_ls_no;
"
"                   v_lot_no    := cr0.pth_lot_no;
"
"                   v_ser_no    := cr0.pth_ser_no;
"
"                END IF;
"
"
"
"            --v_ord_no     := func_find_pfx_nextno(p_bu,p_doc_date,'RWO',p_user);
"
"
"
"                v_ord_no     :=func_find_pfx_nextno(p_bu,
"
"                            p_doc_date,
"
"                            func_find_vou_dflt_pfx(p_bu,
"
"                                     cr0.pth_plnt,
"
"                                     cr0.pth_loc_id,
"
"                                     'RWO',
"
"                                     'RPO'),
"
"                                     p_user);
"
"
"
"                /*func_find_pfx_nextno(    p_bu,
"
"                            p_doc_date,
"
"                            func_find_get_mfg_pfx(p_bu,
"
"                                     cr0.pth_loc_id,
"
"                                     cr0.pth_plnt,
"
"                                     'RWO'),
"
"                                     p_user);*/
"
"
"
"
"
"
"
"
"
"
"
"            DBMS_OUTPUT.PUT_LINE('HD');
"
"
"
"            INSERT INTO rework_order_hd (rwohd_bu        ,
"
"                                         rwohd_plnt        ,
"
"                     rwohd_ord_pfx,
"
"                                         rwohd_ord_no        ,
"
"                                         rwohd_date        ,
"
"                                         rwohd_prod_id        ,
"
"                                         rwohd_prod_rev        ,
"
"                                         rwohd_prod_ord_no    ,
"
"                                         rwohd_rework_qty    ,
"
"                                         rwohd_sys_ls_no          ,
"
"                                         rwohd_lot_no        ,
"
"                                         rwohd_serial_no    ,
"
"                                         rwohd_route_card_no    ,
"
"                                         rwohd_so_pfx        ,
"
"                                         rwohd_so_no        ,
"
"                                         rwohd_so_seq_no    ,
"
"                                         rwohd_so_sub_seq_no      ,
"
"                                         rwohd_proj_id            ,
"
"                                         rwohd_task_id            ,
"
"                                         rwohd_reference    ,
"
"                                         rwohd_status        ,
"
"                                         rwohd_line_id        ,
"
"                                         rwohd_rec_source    ,
"
"                                         rwohd_ord_type        ,
"
"                                         rwohd_prim_rwk_qty    ,
"
"                                         rwohd_secon_rwk_qty    ,
"
"                                         rwohd_ppr_rwk_qty    ,
"
"                                         rwohd_rcpt_store_id    ,
"
"                                         rwohd_sf_code        ,
"
"                                         rwohd_cre_by        ,
"
"                                         rwohd_cre_date        ,
"
"                                         rwohd_sou_doc_pfx    ,
"
"                                         rwohd_sou_doc_no    ,
"
"                                         rwohd_sou_doc_line_no    ,
"
"                                         rwohd_pp_no              ,
"
"                                         rwohd_pp_seq_no          ,
"
"                                         rwohd_source_id          ,
"
"                                         rwohd_source_type    ,
"
"                                         rwohd_vi_flag        ,
"
"                                         rwohd_oprn_id        ,
"
"                                         rwohd_so_schld_desc,
"
"                                         rwohd_oprn_ln_seq,
"
"                                         rwohd_cre_emp_id,
"
"                                         rwohd_cre_ip_addr,
"
"                                         rwohD_cre_os_user
"
"                                         )
"
"                                    VALUES(p_bu            ,
"
"                                         cr0.pth_plnt        ,
"
"                                         func_find_get_mfg_pfx(p_bu,
"
"                                                               cr0.pth_loc_id,
"
"                                                               cr0.pth_plnt,
"
"                                                               'RWO'),
"
"                                         v_ord_no        ,
"
"                                         TRUNC(p_doc_date)        ,
"
"                                         cr0.pth_prod_id    ,
"
"                                         cr0.pth_prod_rev    ,
"
"                                         cr0.pth_prod_ord_no    ,
"
"                                         (cr0.pth_pri_rwk_qty + cr0.pth_sec_rwk_qty + cr0.pth_ppr_rwk_qty),
"
"                                         v_sys_ls_no        ,
"
"                                         v_lot_no            ,
"
"                                         v_ser_no        ,
"
"                                         cr0.pth_route_card_no    ,
"
"                                         cr0.pth_so_pfx        ,
"
"                                         cr0.pth_so_no        ,
"
"                                         cr0.pth_so_seq_no    ,
"
"                                         cr0.pth_so_sub_seq_no    ,
"
"                                         cr0.pth_proj_id          ,
"
"                                         cr0.pth_task_id          ,
"
"                                         CASE WHEN cr0.pth_pri_rwk_qty > 0 THEN 'REWORK DOC FOR PRIMARY REJECTION' WHEN cr0.pth_sec_rwk_qty > 0     THEN 'REWORK DOC FOR SECONDARY REJECTION' END,
"
"                                         'E'            ,
"
"                                         cr0.pth_line_id            ,
"
"                                         'S'            ,
"
"                                         'RPO'            ,
"
"                                         cr0.pth_pri_rwk_qty      ,
"
"                                         0      ,
"
"                                         0    ,
"
"                                         NULL            ,
"
"                                         cr0.ptlre_sf_code    ,
"
"                                         p_user            ,
"
"                                         SYSDATE        ,
"
"                                         NULL            ,
"
"                                         cr0.pth_trans_no    ,
"
"                                         NULL            ,
"
"                                         cr0.pth_pp_no            ,
"
"                                         cr0.pth_pp_seq_no        ,
"
"                                         cr0.pth_source_id    ,
"
"                                         cr0.pth_source_type    ,
"
"                                         NVL(cr0.pth_vi_flag,'N'),
"
"                                         NVL(cr0.ptlre_pg_id,v_oprn_id),
"
"                                         cr0.pth_so_schld_desc,
"
"                                         NVL(cr0.pth_oprn_ln_seq,v_oprn_ln_seq),
"
"                                         func_find_emp_id(p_bu,p_user)    ,
"
"                                         audit_info.get_ip_address    ,
"
"                                                        audit_info.get_os_user
"
"                                         );
"
"
"
"
"
"
"
"    IF func_find_prod_ser_lot_type (p_bu,cr0.pth_prod_id,cr0.pth_prod_rev) IN ('S','O') THEN
"
"
"
"    v_seq_no := 1;
"
"
"
"            FOR cr_ser IN c_ser(cr0.pth_plnt,cr0.pth_trans_no,cr0.ptlre_sf_code)
"
"            LOOP
"
"
"
"                DBMS_OUTPUT.PUT_LINE('LN Serial');
"
"
"
"                INSERT INTO rework_order_ser_dtls(
"
"                                                rosd_bu    ,
"
"                                                rosd_plnt,
"
"                                                rosd_rwk_ord_no,
"
"                                                rosd_seq_no    ,
"
"                                                rosd_ser_no    ,
"
"                                                rosd_sys_ls_no    ,
"
"                                                rosd_source_id    ,
"
"                                                rosd_source_type,
"
"                                                rosd_ser_status,
"
"                                                rosd_cre_by    ,
"
"                                                rosd_cre_date,
"
"                                                rosd_upd_by    ,
"
"                                                rosd_upd_date    ,
"
"                                                rosd_qty,
"
"                                                rosd_prod_ord_no,
"
"                                                rosd_prim_rwk_qty,
"
"                                                rosd_secon_rwk_qty,
"
"                                                rosd_cre_emp_id,
"
"                                                rosd_cre_ip_addr,
"
"                                                rosd_cre_os_user
"
"                                                )
"
"                                        VALUES(p_bu    ,
"
"                                               cr0.pth_plnt,
"
"                                               v_ord_no,
"
"                                               v_seq_no    ,
"
"                                               cr_ser.ptlre_ser_no    ,
"
"                                               cr_ser.ptlre_sys_ls_no,
"
"                                               cr0.pth_source_id    ,
"
"                                               cr0.pth_source_type    ,
"
"                                               'R',
"
"                                               p_user    ,
"
"                                               SYSDATE,
"
"                                               NULL    ,
"
"                                               NULL    ,
"
"                                               cr_ser.ptlre_rwk_inside,
"
"                                               cr0.pth_prod_ord_no,
"
"                                               nvl(cr_ser.ptlre_rwk_inside,0),
"
"                                               0,
"
"                                               func_find_emp_id(p_bu,p_user)    ,
"
"                                               audit_info.get_ip_address    ,
"
"                                                              audit_info.get_os_user
"
"                                               );
"
"
"
"                                v_seq_no :=  v_seq_no + 1;
"
"
"
"            END LOOP c_ser;
"
"
"
"        END IF;
"
"
"
"            IF cr0.pth_prod_ord_no IS NOT NULL THEN
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu,cr0.pth_prod_id,cr0.pth_prod_rev) IN ('L') THEN
"
"
"
"               proc_upd_oprn_status_qtys(p_bu,
"
"                                         cr0.pth_plnt,
"
"                                         cr0.pth_prod_ord_no,
"
"                                         NVL(cr0.ptlre_pg_id,v_oprn_id),
"
"                                         NVL(cr0.pth_oprn_ln_seq,v_oprn_ln_seq),
"
"                                         cr0.ptlre_sf_code,
"
"                                         0,                -- p_queue_qty
"
"                                         0,                -- p_run_qty
"
"                                         0,                -- p_os_run_qty
"
"                                         0,                -- p_qc_qty
"
"                                         0,                -- p_st_qty
"
"                                         0,                -- p_comp_qty
"
"                                         -(cr0.pth_pri_rwk_qty + cr0.pth_sec_rwk_qty ),    -- p_rej_qty
"
"                                         (cr0.pth_pri_rwk_qty  + cr0.pth_sec_rwk_qty + cr0.pth_ppr_rwk_qty),    -- p_rework_qty
"
"                                         0,                -- p_os_rework_qty
"
"                                         0,                -- p_return_qty
"
"                                         0,                -- p_scrap_qty
"
"                                         0,                -- p_dis_ass_qty
"
"                                         0,                -- p_cs_qty
"
"                                         0,                --p_prev_proc_comp_qty
"
"                                         cr0.pth_sys_ls_no,
"
"                                         cr0.pth_lot_no,
"
"                                         NULL,
"
"                                         cr0.pth_route_card_no,
"
"                                         'PQC',
"
"                                         p_user,
"
"                                         cr0.pth_ppr_rwk_qty        -- p_pre_process_rej_Qty
"
"                                         );
"
"
"
"                ELSIF func_find_prod_ser_lot_type(p_bu,cr0.pth_prod_id,cr0.pth_prod_rev) IN ('S','O') THEN
"
"
"
"                    FOR cr_ser IN c_ser(cr0.pth_plnt,cr0.pth_trans_no,cr0.ptlre_sf_code)
"
"                    LOOP
"
"
"
"                        UPDATE prod_ord_oper_status
"
"                           SET pros_rej_qty        = pros_rej_qty - 1,
"
"                               pros_rework_qty    = pros_rework_qty + 1
"
"                         WHERE pros_bu        = p_bu
"
"                           AND pros_plnt    = cr0.pth_plnt
"
"                           AND pros_ord_no    = cr0.pth_prod_ord_no
"
"                           AND pros_oprn_id    = NVL(cr0.ptlre_pg_id,v_oprn_id)
"
"                           AND pros_oprn_ln_seq    = NVL(cr0.pth_oprn_ln_seq,v_oprn_ln_seq)
"
"                           AND pros_sf_code    = cr0.ptlre_sf_code
"
"                           AND (pros_sys_ls_no    = cr_ser.ptlre_sys_ls_no OR (pros_sys_ls_no IS NULL AND cr_ser.ptlre_sys_ls_no IS NULL))
"
"                           AND (pros_ser_no    =  cr_ser.ptlre_ser_no OR (pros_ser_no IS NULL AND cr_ser.ptlre_ser_no IS NULL))
"
"                           AND pros_rej_qty > 0
"
"                           AND pros_type IN ('PQC');
"
"
"
"                    END LOOP;
"
"                END IF;
"
"                END IF;
"
"
"
"            FOR cr_ser IN c_ser(cr0.pth_plnt,cr0.pth_trans_no,cr0.ptlre_sf_code)
"
"            LOOP
"
"
"
"                IF cr_ser.ptlre_rwk_inside > 0 THEN
"
"
"
"                   UPDATE prod_transfer_line_rej_entry
"
"                      SET ptlre_rwk_in_proc_qty     = ptlre_rwk_in_proc_qty  + cr_ser.ptlre_rwk_inside,
"
"                          ptlre_rwk_inside      = ptlre_rwk_inside       - cr_ser.ptlre_rwk_inside,
"
"                          ptlre_upd_by               = p_user,
"
"                          ptlre_upd_date             = SYSDATE
"
"                    WHERE ptlre_bu           = p_bu
"
"                      AND ptlre_plnt         = cr0.pth_plnt
"
"                      AND ptlre_doc_no       = cr0.pth_trans_no
"
"                      AND ptlre_sf_code      = cr0.ptlre_sf_code
"
"                      AND (ptlre_ser_no     = cr_ser.ptlre_ser_no OR ptlre_ser_no IS NULL)
"
"                      AND (ptlre_sys_ls_no    = cr_ser.ptlre_sys_ls_no OR ptlre_sys_ls_no IS NULL)
"
"                      AND ptlre_sel_user         = p_user;
"
"
"
"
"
"
"
"                   UPDATE prod_transfer_hist
"
"                      SET pth_prim_rwk_in_proc_qty = pth_prim_rwk_in_proc_qty + cr_ser.ptlre_rwk_inside,
"
"                          pth_prim_rwk_inside      = pth_prim_rwk_inside      - cr_ser.ptlre_rwk_inside,
"
"                          pth_upd_by                = p_user,
"
"                          pth_upd_date              = SYSDATE
"
"                    WHERE pth_bu           = p_bu
"
"                      AND pth_plnt         = cr0.pth_plnt
"
"                      AND (pth_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pth_prod_ord_no IS NULL))
"
"                      AND pth_trans_no     = cr0.pth_trans_no
"
"                      AND pth_user         = p_user
"
"                      AND pth_return_flag  = 'Y';
"
"
"
"                IF SQL%NOTFOUND THEN
"
"                       UPDATE prod_transfer
"
"                      SET pt_prim_rwk_in_proc_qty = pt_prim_rwk_in_proc_qty + cr_ser.ptlre_rwk_inside,
"
"                          pt_prim_rwk_inside      = pt_prim_rwk_inside      - cr_ser.ptlre_rwk_inside,
"
"                          pt_upd_by                = p_user,
"
"                          pt_upd_date              = SYSDATE
"
"                    WHERE pt_bu           = p_bu
"
"                      AND pt_plnt         = cr0.pth_plnt
"
"                      AND (pt_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pt_prod_ord_no IS NULL))
"
"                      AND pt_trans_no     = cr0.pth_trans_no
"
"                      AND pt_user         = p_user
"
"                      AND pt_return_flag  = 'Y';
"
"                END IF;
"
"
"
"
"
"
"
"                END IF;
"
"
"
"                /*IF cr_ser.pcsh_secon_rej_qty > 0 THEN
"
"
"
"                   UPDATE prod_comp_srlnos_hist
"
"                      SET pcsh_secon_rwk_in_proc_qty = pcsh_secon_rwk_in_proc_qty  + cr_ser.pcsh_secon_rej_qty,
"
"                          pcsh_secon_rwk_inside      = pcsh_secon_rwk_inside       - cr_ser.pcsh_secon_rej_qty,
"
"                          pcsh_upd_by               = p_user,
"
"                          pcsh_upd_date             = SYSDATE
"
"                    WHERE pcsh_bu           = p_bu
"
"                      AND pcsh_plnt         = cr0.pth_plnt
"
"                      AND pcsh_doc_no       = cr0.pth_trans_no
"
"                      AND pcsh_serialno     = cr_ser.pcsh_serialno
"
"                      AND pcsh_sys_ls_no    = cr_ser.pcsh_sys_ls_no
"
"                      AND pcsh_user         = p_user;
"
"                                IF SQL%NOTFOUND THEN
"
"                       UPDATE prod_comp_srlnos
"
"                      SET pcs_secon_rwk_in_proc_qty = pcs_secon_rwk_in_proc_qty  + cr_ser.pcsh_secon_rej_qty,
"
"                          pcs_secon_rwk_inside     = pcs_secon_rwk_inside       - cr_ser.pcsh_secon_rej_qty,
"
"                              pcs_upd_by               = p_user,
"
"                              pcs_upd_date             = SYSDATE
"
"                    WHERE pcs_bu           = p_bu
"
"                      AND pcs_plnt         = cr0.pth_plnt
"
"                      AND pcs_doc_no       = cr0.pth_trans_no
"
"                      AND pcs_serialno     = cr_ser.pcsh_serialno
"
"                      AND pcs_sys_ls_no    = cr_ser.pcsh_sys_ls_no
"
"                      AND pcs_user         = p_user;
"
"                END IF;
"
"
"
"
"
"                   UPDATE prod_transfer_hist
"
"                      SET pth_secon_rwk_in_proc_qty = pth_secon_rwk_in_proc_qty + cr_ser.pcsh_secon_rej_qty,
"
"                          pth_secon_rwk_inside      = pth_secon_rwk_inside      - cr_ser.pcsh_secon_rej_qty,
"
"                          pth_upd_by                = p_user,
"
"                          pth_upd_date              = SYSDATE
"
"                    WHERE pth_bu           = p_bu
"
"                      AND pth_plnt         = cr0.pth_plnt
"
"                      AND (pth_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pth_prod_ord_no IS NULL))
"
"                      AND pth_trans_no     = cr0.pth_trans_no
"
"                      AND pth_user         = p_user
"
"                      AND pth_return_flag  = 'Y';
"
"                             IF SQL%NOTFOUND THEN
"
"                   UPDATE prod_transfer
"
"                      SET pt_secon_rwk_in_proc_qty = pt_secon_rwk_in_proc_qty + cr_ser.pcsh_secon_rej_qty,
"
"                          pt_secon_rwk_inside      = pt_secon_rwk_inside      - cr_ser.pcsh_secon_rej_qty,
"
"                          pt_upd_by                = p_user,
"
"                          pt_upd_date              = SYSDATE
"
"                    WHERE pt_bu           = p_bu
"
"                      AND pt_plnt         = cr0.pth_plnt
"
"                      AND (pt_prod_ord_no = cr0.pth_prod_ord_no OR (cr0.pth_prod_ord_no IS NULL AND pt_prod_ord_no IS NULL))
"
"                      AND pt_trans_no     = cr0.pth_trans_no
"
"                      AND pt_user         = p_user
"
"                      AND pt_return_flag  = 'Y';
"
"                END IF;
"
"                END IF;*/
"
"
"
"
"
"            END LOOP;
"
"
"
"                IF cr1.bqac_req_rwk_appr = 'P' THEN
"
"
"
"                       UPDATE rework_order_hd
"
"                      SET rwohd_status   = 'A',
"
"                          rwohd_upd_by   = p_user,
"
"                          rwohd_upd_date = SYSDATE
"
"                    WHERE rwohd_bu     = p_bu
"
"                      AND rwohd_plnt   = cr0.pth_plnt
"
"                      AND rwohd_ord_no = v_ord_no;
"
"
"
"                ELSIF cr1.bqac_req_rwk_appr = 'N'  THEN
"
"
"
"                IF func_find_prod_ser_lot_type(p_bu,cr0.pth_prod_id,cr0.pth_prod_rev) IN('S','O') THEN
"
"
"
"                    FOR c_qty IN (SELECT rosd_prim_rwk_qty  pcsh_prim_rwk_inside,
"
"                                         rosd_secon_rwk_qty pcsh_secon_rwk_inside,rosd_seq_no
"
"                                    FROM rework_order_ser_dtls
"
"                                   WHERE rosd_bu = p_bu
"
"                                     AND rosd_plnt = cr0.pth_plnt
"
"                                     AND rosd_rwk_ord_no = v_ord_no
"
"                                   )
"
"                    LOOP
"
"
"
"                       IF cr1.bqac_req_rwk_type = 'S' THEN
"
"                          v_scrap_qty  :=  v_scrap_qty + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside);
"
"                          v_repair_qty := v_repair_qty + 0;
"
"                          v_disass_qty :=  v_disass_qty + 0;
"
"
"
"                        UPDATE rework_order_ser_dtls
"
"                           SET rosd_repair_qty =  0      ,
"
"                               rosd_scrap_qty  =   rosd_scrap_qty +  (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside)     ,
"
"                               rosd_dis_assemble = 0
"
"                         WHERE rosd_bu = p_bu
"
"                               AND rosd_plnt = cr0.pth_plnt
"
"                                   AND rosd_rwk_ord_no = v_ord_no
"
"                                   AND rosd_seq_no = c_qty.rosd_seq_no;
"
"
"
"                       ELSIF cr1.bqac_req_rwk_type = 'R' THEN
"
"                          v_scrap_qty  :=  0;
"
"                          v_repair_qty := v_repair_qty +  (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside);
"
"                          v_disass_qty := 0;
"
"
"
"                            UPDATE rework_order_ser_dtls
"
"                           SET rosd_repair_qty =   rosd_repair_qty + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside)      ,
"
"                               rosd_scrap_qty  =   0     ,
"
"                               rosd_dis_assemble = 0
"
"                         WHERE rosd_bu = p_bu
"
"                               AND rosd_plnt = cr0.pth_plnt
"
"                                   AND rosd_rwk_ord_no = v_ord_no
"
"                                   AND rosd_seq_no = c_qty.rosd_seq_no;
"
"
"
"                       ELSIF cr1.bqac_req_rwk_type = 'D' THEN
"
"                          v_scrap_qty  := 0;
"
"                          v_repair_qty :=  0;
"
"                          v_disass_qty :=  v_disass_qty + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside);
"
"
"
"                        UPDATE rework_order_ser_dtls
"
"                           SET rosd_repair_qty =   0   ,
"
"                               rosd_scrap_qty  =   0     ,
"
"                               rosd_dis_assemble = rosd_dis_assemble + (c_qty.pcsh_prim_rwk_inside + c_qty.pcsh_secon_rwk_inside)
"
"                         WHERE rosd_bu = p_bu
"
"                               AND rosd_plnt = cr0.pth_plnt
"
"                                   AND rosd_rwk_ord_no = v_ord_no
"
"                                   AND rosd_seq_no = c_qty.rosd_seq_no;
"
"                       END IF;
"
"
"
"                    END LOOP;
"
"
"
"                   UPDATE rework_order_hd
"
"                      SET rwohd_status       = 'A',
"
"                          rwohd_sel_flag     = 'Y',
"
"                          rwohd_user         = p_user,
"
"                          rwohd_scrap_qty    = v_scrap_qty,
"
"                          rwohd_repair_qty   = v_repair_qty,
"
"                          rwohd_dis_assemble = v_disass_qty,
"
"                          rwohd_upd_by       = p_user,
"
"                          rwohd_upd_date     = SYSDATE
"
"                    WHERE rwohd_bu     = p_bu
"
"                      AND rwohd_plnt   = cr0.pth_plnt
"
"                      AND rwohd_ord_no = v_ord_no;
"
"
"
"                      UPDATE rework_order_ser_dtls
"
"                         SET rosd_sel_flag = 'Y',
"
"                             rosd_sel_user = p_user,
"
"                           rosd_upd_by = p_user,
"
"                           rosd_upd_date = SYSDATE
"
"                       WHERE rosd_bu = p_bu
"
"                         AND rosd_plnt = cr0.pth_plnt
"
"                            AND rosd_rwk_ord_no = v_ord_no  ;
"
"                END IF;
"
"
"
"                IF func_find_prod_ser_lot_type(p_bu,cr0.pth_prod_id,cr0.pth_prod_rev) IN('N','L') THEN
"
"                                                       UPDATE rework_order_hd
"
"                                      SET rwohd_status       = 'A',
"
"                                          rwohd_sel_flag     = 'Y',
"
"                                          rwohd_user         = p_user,
"
"                                          rwohd_scrap_qty    = CASE WHEN cr1.bqac_req_rwk_type = 'S' THEN cr0.pth_pri_rwk_qty ELSE 0 END,
"
"                                          rwohd_repair_qty   =  CASE WHEN cr1.bqac_req_rwk_type = 'R' THEN cr0.pth_pri_rwk_qty ELSE 0 END,
"
"                                          rwohd_dis_assemble =  CASE WHEN cr1.bqac_req_rwk_type = 'D' THEN cr0.pth_pri_rwk_qty ELSE 0 END,
"
"                                          rwohd_upd_by       = p_user,
"
"                                              rwohd_upd_date     = SYSDATE
"
"                                        WHERE rwohd_bu     = p_bu
"
"                                      AND rwohd_plnt   = cr0.pth_plnt
"
"                                                      AND rwohd_ord_no = v_ord_no;
"
"
"
"
"
"                END IF;
"
"
"
"                   proc_cre_rwk_comp_rec_new(p_bu,
"
"                                             TRUNC(p_doc_date),
"
"                                             p_user,
"
"                                             v_rw_comp,
"
"                                             v_ord_no,
"
"                                             p_result => v_rw_comp1
"
"                                             );
"
"
"
"                END IF;
"
"
"
"                v_ord_no1 := v_ord_no1||v_ord_no||' ';
"
"
"
"             END IF;
"
"
"
"          CLOSE c1;
"
"
"
"       END LOOP; --c0 End loop
"
"
"
"       END IF;
"
"
"
"       IF v_ord_no1 IS NOT NULL THEN
"
"          p_rwo_res := func_find_order_no_substr(v_ord_no1);
"
"       END IF;
"
"
"
"       IF v_rw_comp IS NOT NULL THEN
"
"          p_rwc_res := v_rw_comp;
"
"       END IF;
"
"
"
"       DBMS_OUTPUT.PUT_LINE(p_rwo_res);
"
"
"
"    END    proc_cre_rework_frm_line_rej;
"
"
"
"    PROCEDURE proc_cre_ser_rwk_comp_rec(p_bu             VARCHAR2,
"
"                                        p_doc_no        VARCHAR2,
"
"                                        p_doc_date        DATE,
"
"                                        p_user           VARCHAR2,
"
"                                        p_res       OUT    VARCHAR2,
"
"                                        p_result    OUT    VARCHAR2,
"
"                                        p_check        OUT VARCHAR
"
"                                        )
"
"    IS
"
"    CURSOR c0
"
"        IS
"
"    SELECT *
"
"      FROM rework_order_hd
"
"     WHERE rwohd_bu       = p_bu
"
"       AND rwohd_status   = 'A'
"
"       AND rwohd_user     = p_user
"
"       AND (rwohd_ord_no  = p_doc_no OR p_doc_no IS NULL)
"
"       AND rwohd_sel_flag = 'Y'
"
"      AND func_find_prod_ser_lot_type(rwohd_bu,rwohd_prod_id,rwohd_prod_rev) IN ('S','O')
"
"       AND ((rwohd_rework_qty - (rwohd_in_proc_qty + rwohd_proc_qty)) >= 0)
"
"       AND EXISTS( SELECT 1
"
"                    FROM rework_order_ser_dtls
"
"                   WHERE rosd_bu = rwohd_bu
"
"                     AND rosd_plnt = rwohd_plnt
"
"                     AND rosd_rwk_ord_no = rwohd_ord_no);
"
"
"
"    CURSOR c2(c_plnt         VARCHAR2,
"
"          c_ord_no         VARCHAR2)
"
"    IS
"
"    SELECT prohd_uom,
"
"           prod_uom,
"
"           NVL(func_find_uom_conversion(p_bu, prohd_prod_id, prohd_prod_rev, prod_uom, prohd_uom),prohd_conv_factor) prohd_conv_factor
"
"      FROM prod_order_hd,
"
"           products
"
"     WHERE prohd_bu          = prod_bu
"
"       AND prohd_prod_id  = prod_id
"
"       AND prohd_prod_rev = prod_rev
"
"       AND prohd_bu          = p_bu
"
"       AND prohd_plnt     = c_plnt
"
"       AND prohd_ord_no   = c_ord_no;
"
"
"
"    CURSOR c3(c_plnt VARCHAR2)
"
"    IS
"
"    SELECT store_id
"
"      FROM stores
"
"     WHERE store_bu       = p_bu
"
"       AND store_plnt     = c_plnt
"
"       AND store_physical = 'J';
"
"
"
"    CURSOR c_oprn(c_plnt    VARCHAR2,
"
"              c_ord_no  VARCHAR2,
"
"              c_oprn_id VARCHAR2)
"
"    IS
"
"    SELECT pror_seq_no
"
"      FROM prod_order_routing
"
"     WHERE pror_bu        = p_bu
"
"       AND pror_plnt    = c_plnt
"
"       AND pror_ord_no  = c_ord_no
"
"       AND pror_oprn_id = c_oprn_id;
"
"
"
"     CURSOR c_rcp_store(c_plnt    VARCHAR2,
"
"                c_ord_no  VARCHAR2,
"
"                c_oprn_id VARCHAR2)
"
"    IS
"
"    SELECT pror_rcp_store
"
"      FROM prod_order_routing
"
"     WHERE pror_bu        = p_bu
"
"       AND pror_plnt    = c_plnt
"
"       AND pror_ord_no  = c_ord_no
"
"       AND pror_oprn_id = c_oprn_id;
"
"
"
"
"
"
"
"    CURSOR c4(c_rwk_ord_no VARCHAR2)
"
"    IS
"
"    SELECT istln_prod_id,
"
"           istln_prod_rev,
"
"           istln_uom,
"
"           istln_prod_uom,
"
"           istln_conv_factor,
"
"           isthd_issueto_id,
"
"           istln_trans_qty,
"
"           istln_unit_cost
"
"      FROM inv_stock_trans_hd,
"
"           inv_stock_trans_ln
"
"     WHERE isthd_bu       = istln_bu
"
"       AND isthd_doc_no   = istln_doc_no
"
"       AND isthd_doc_oper = 'I'
"
"       AND isthd_status   = 'O'
"
"       AND istln_status   = 'O'
"
"       AND isthd_dc_type  = 'RW'
"
"       AND istln_ord_type = 'RW'
"
"       AND isthd_bu       = p_bu
"
"       AND istln_ord_no   = c_rwk_ord_no;
"
"
"
"    CURSOR c5(c_plnt      VARCHAR2,
"
"          c_prod_id   VARCHAR2,
"
"          c_prod_rev  NUMBER)
"
"        IS
"
"    SELECT *
"
"      FROM bom_hd,
"
"           routing_ln,
"
"           bom_ln
"
"     WHERE bomhd_bu               = rouln_bu
"
"       AND bomhd_plnt          = rouln_plnt
"
"       AND bomhd_bom_no        = rouln_bom_no
"
"       AND rouln_bu               = bomln_bu
"
"       AND rouln_plnt          = bomln_plnt
"
"       AND rouln_bom_no        = bomln_bom_no
"
"       AND rouln_oprn_seq_no = bomln_oprn_seq_no
"
"       AND bomhd_bu            = p_bu
"
"       AND bomhd_plnt          = c_plnt
"
"       AND bomhd_prod_id       = c_prod_id
"
"       AND bomhd_prod_rev      = c_prod_rev
"
"       AND (TRUNC (p_doc_date) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"       AND bomln_plnnd_mat_flag = 'N'
"
"       AND bomhd_status        = 'A'
"
"       AND bomhd_primary       = 'Y';
"
"
"
"    CURSOR c6(c_plnt        VARCHAR2,
"
"              c_doc_no        VARCHAR2,
"
"          c_seq_no        NUMBER)
"
"    IS
"
"    SELECT *
"
"      FROM inv_issue_dtls_view
"
"     WHERE isthd_bu     = p_bu
"
"       AND isthd_plnt   = c_plnt
"
"       AND isthd_doc_no = c_doc_no
"
"       AND istln_seq_no = c_seq_no;
"
"       /*
"
"     CURSOR c7(c_plnt VARCHAR2)
"
"        IS
"
"    SELECT planctrl_rwk_frm_comp_flag
"
"      FROM planning_control
"
"     WHERE planctrl_bu   = p_bu
"
"       AND planctrl_plnt = c_plnt;*/
"
"
"
"    CURSOR c8(c_plnt VARCHAR2)
"
"        IS
"
"    SELECT bqac_req_rwk_appr,
"
"           bqac_cre_rwk_frm_comp,
"
"           bqac_req_rwk_type,
"
"           bqac_qc_recom_impl_rqrd,
"
"           bqac_qc_recom_qty_rqrd,
"
"           bqac_auto_gen_disass_flag
"
"      FROM bu_qcm_appl_ctrl
"
"     WHERE bqac_bu   = p_bu
"
"       AND bqac_plnt = c_plnt;
"
"
"
"    CURSOR c9(c_plnt        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM bu_qcm_appl_ctrl
"
"     WHERE bqac_bu   = p_bu
"
"       AND bqac_plnt = c_plnt;
"
"
"
"    CURSOR c10(c_plnt        VARCHAR2,
"
"           c_prod_ord_no    VARCHAR2,
"
"           c_prod_id        VARCHAR2,
"
"           c_prod_rev        NUMBER)
"
"        IS
"
"    SELECT ptmcvw_prod_id,
"
"           ptmcvw_prod_rev,
"
"           ptmcvw_store_id,
"
"           SUM(ptcdvw_cons_qty) ptcdvw_cons_qty,
"
"           ptcdvw_sys_ls_no,
"
"           ptcdvw_lot_no,
"
"           ptcdvw_ser_no,
"
"           ptcdvw_source_type,
"
"           ptcdvw_source_id
"
"      FROM prod_transfer_query_vw,
"
"           prod_transfer_mat_cons_vw,
"
"           prod_transfer_cons_detail_vw
"
"     WHERE ptqvw_bu          = ptmcvw_bu
"
"       AND ptqvw_plnt        = ptmcvw_plnt
"
"       AND ptqvw_trans_no    = ptmcvw_trans_no
"
"       AND ptmcvw_bu         = ptcdvw_bu
"
"       AND ptmcvw_plnt       = ptcdvw_plnt
"
"       AND ptmcvw_trans_no   = ptcdvw_trans_no
"
"       AND ptmcvw_seq_no     = ptcdvw_seq_no
"
"       AND ptqvw_bu          = p_bu
"
"       AND ptqvw_plnt     = c_plnt
"
"       AND ptqvw_prod_ord_no = c_prod_ord_no
"
"       AND ptmcvw_prod_id    = c_prod_id
"
"       AND ptmcvw_prod_rev   = c_prod_rev
"
"       AND ptqvw_status      = 'A'
"
"       AND ptqvw_code_type   = 'P'
"
"       AND ptmcvw_mat_type   = 'S'
"
"     GROUP BY ptmcvw_prod_id,
"
"              ptmcvw_prod_rev,
"
"              ptmcvw_store_id,
"
"              ptcdvw_sys_ls_no,
"
"              ptcdvw_lot_no,
"
"              ptcdvw_ser_no,
"
"              ptcdvw_source_type,
"
"              ptcdvw_source_id;
"
"
"
"    CURSOR c11(c_plnt        VARCHAR2,
"
"           c_prod_id        VARCHAR2,
"
"           c_prod_rev        NUMBER)
"
"        IS
"
"    SELECT *
"
"      FROM products,
"
"           prod_plants
"
"     WHERE prod_bu          = prodplnt_bu
"
"       AND prod_id          = prodplnt_prod_id
"
"       AND prod_rev      = prodplnt_prod_rev
"
"       AND prodplnt_bu       = p_bu
"
"       AND prodplnt_plnt     = c_plnt
"
"       AND prodplnt_prod_id  = c_prod_id
"
"       AND prodplnt_prod_rev = c_prod_rev
"
"       AND prod_status = 'A'
"
"       AND prodplnt_status = 'A';
"
"
"
"
"
"
"
"
"
"    CURSOR c12(c_oprn_id         VARCHAR2,
"
"           c_bom_no        VARCHAR2,
"
"           c_plnt        VARCHAR2,
"
"       c_prod_id    VARCHAR2,
"
"       c_prod_rev NUMBER,
"
"       c_loc_id VARCHAR2
"
"          )
"
"    IS
"
"    SELECT DECODE(prodplnt_cls_type,'RP','S','BP','B','S') prod_type,
"
"           pbsp_sou_prod_id par_prod_id,
"
"           pbsp_sou_prod_rev par_prod_rev,
"
"           pbsp_prod_id scrap_prod_id,
"
"           pbsp_prod_rev scrap_prod_rev,
"
"           pbsp_tar_store_id,
"
"           func_find_product_uom(pbsp_bu,pbsp_prod_id,pbsp_prod_rev) scrap_uom,
"
"           pbsp_rct_qty qty
"
"      FROM bom_hd,
"
"           routing_ln,
"
"           proc_by_scr_prod,
"
"           prod_plants
"
"     WHERE bomhd_bu     = rouln_bu
"
"       AND bomhd_plnt     = rouln_plnt
"
"       AND bomhd_bom_no     = rouln_bom_no
"
"       AND rouln_bu     = pbsp_bu
"
"       AND rouln_plnt     = pbsp_plnt
"
"       AND rouln_bom_no     = pbsp_bom_no
"
"       AND rouln_oprn_seq_no= pbsp_oprn_seq_no
"
"       AND prodplnt_bu    = pbsp_bu
"
"       AND prodplnt_plnt    = pbsp_plnt
"
"       AND prodplnt_prod_id = pbsp_prod_id
"
"       AND prodplnt_prod_rev= pbsp_prod_rev
"
"       AND prodplnt_status    = 'A'
"
"       AND bomhd_status    = 'A'
"
"       AND bomhd_bu        = p_bu
"
"       AND bomhd_plnt    = c_plnt
"
"       AND bomhd_bom_no     = c_bom_no
"
"       AND rouln_oprn_id    = c_oprn_id
"
"       AND pbsp_prod_type   =  'RR'
"
"       AND pbsp_auto_gen_flag = 'Y'
"
" UNION
"
"SELECT DECODE(prodplnt_cls_type,'RP','S','BP','B','S') prod_type,
"
"       c_prod_id par_prod_id,
"
"       c_prod_Rev par_prod_rev,
"
"       prod_scrap_prod_id scrap_prod_id,
"
"       prod_scrap_prod_Rev scrap_prod_rev,
"
"       ppl_dflt_store_id  pbsp_tar_store_id,
"
"       prod_uom scrap_uom,
"
"       1 qty
"
"  FROM products, prod_plants, prod_plants_loc
"
" WHERe prod_bu  =   prodplnt_bu
"
"   ANd prod_id  =   prodplnt_prod_id
"
"   AND prod_rev =   prodplnt_prod_rev
"
"   AND prodplnt_bu  =   ppl_bu
"
"   AND prodplnt_plnt    =   ppl_plnt
"
"   AND prodplnt_prod_id =   ppl_prod_id
"
"   AND prodplnt_prod_rev    =   ppl_prod_rev
"
"   AND prod_status = 'A'
"
"   AND prodplnt_status = 'A'
"
"   AND prod_bu  =   p_bu
"
"   AND ppl_plnt =   c_plnt
"
"   AND ppl_plnt_loc_id  = c_loc_id
"
"   ANd prod_id =    c_prod_id
"
"   AND prod_rev =   c_prod_Rev
"
"   AND NOT EXISTS (    SELECT 1
"
"             FROM proc_by_scr_prod
"
"            WHERE pbsp_bu = p_bu
"
"              AND pbsp_plnt=    c_plnt
"
"              AND pbsp_bom_no=    c_bom_no
"
"              AND pbsp_oprn_seq_no    = (    SELECT rouln_oprn_seq_no
"
"                               FROM routing_ln
"
"                                  WHERE rouln_bu     = pbsp_bu
"
"                                    AND rouln_plnt    = pbsp_plnt
"
"                                    AND rouln_bom_no    = pbsp_bom_no
"
"                                AND rouln_oprn_id    = c_oprn_id));
"
"
"
"       CURSOR c13(c_plnt VARCHAR2,c_prod_ord_no VARCHAR2)
"
"         IS
"
"       SELECT prohd_bom_no
"
"         FROM(
"
"       SELECT prohd_bom_no
"
"         FROM prod_order_hd
"
"        WHERE prohd_bu = p_bu
"
"          AND prohd_plnt = c_plnt
"
"          AND prohd_ord_no = c_prod_ord_no
"
"      UNION ALL
"
"      SELECT prohdh_bom_no
"
"        FROM prod_order_hd_hist
"
"       WHERE prohdh_bu = p_bu
"
"         AND prohdh_plnt = c_plnt
"
"         AND prohdh_ord_no = c_prod_ord_no);
"
"
"
"    CURSOR c14(c_plnt VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM planning_control
"
"     WHERE planctrl_bu = p_bu
"
"       AND planctrl_plnt = c_plnt;
"
"
"
"
"
"    /*CURSOR c_ctrl(c_plnt VARCHAR)
"
"    IS
"
"    SELECT planctrl_scrap_from
"
"      FROM planning_control
"
"     WHERE planctrl_bu = p_bu
"
"       AND planctrl_plnt = c_plnt;*/
"
"
"
"    CURSOR c_grn(c_plnt    VARCHAR2,c_receipt_pfx    VARCHAR2,c_receipt_no    VARCHAR2,c_seq_no    NUMBER)
"
"    IS
"
"    SELECT porlh_conv_factor
"
"      FROM (
"
"    SELECT porl_conv_factor porlh_conv_factor
"
"      FROM pur_ord_receipt_hd,
"
"           pur_ord_receipt_ln
"
"     WHERE porh_bu = porl_bu
"
"       AND porh_receipt_no = porl_receipt_no
"
"       AND porh_bu = p_bu
"
"       AND porh_plnt = c_plnt
"
"       AND porh_receipt_no = c_receipt_no
"
"       AND porl_seq_no = c_seq_no
"
"     UNION ALL
"
"    SELECT porlh_conv_factor
"
"      FROM pur_ord_receipt_hd_hist,
"
"           pur_ord_receipt_ln_hist
"
"     WHERE porhh_bu = porlh_bu
"
"       AND porhh_receipt_no = porlh_receipt_no
"
"       AND porhh_bu = p_bu
"
"       AND porhh_plnt = c_plnt
"
"       AND porhh_receipt_pfx = c_receipt_pfx
"
"       AND porhh_receipt_no = c_receipt_no
"
"       AND porlh_seq_no = c_seq_no);
"
"
"
"    CURSOR c_ser(c_plnt        VARCHAR2,c_ord_no    VARCHAR2)
"
"    IS
"
"    SELECT rosd_qty
"
"      FROM rework_order_ser_dtls
"
"     WHERE rosd_bu   = p_bu
"
"       AND rosd_plnt = c_plnt
"
"       AND rosd_rwk_ord_no = c_ord_no
"
"       AND rosd_sel_flag =  'Y'
"
"       AND rosd_sel_user = p_user;
"
"
"
"CURSOR c_wh(c_plnt        VARCHAR2)
"
"IS
"
"SELECT store_id
"
"  FROM stores
"
" WHERE store_bu = p_bu
"
"   AND store_plnt = c_plnt
"
"   AND store_physical ='E';
"
"
"
"
"
"CURSOR c_rej_wh(c_plnt      VARCHAR2,
"
"                c_loc_id    VARCHAR2,
"
"                c_prod_id   VARCHAR2,
"
"                c_prod_rev  NUMBER
"
"                )
"
"  IS
"
"SELECT ppl_rejt_store_id
"
"  FROM prod_plants_loc
"
" WHERE ppl_bu       = p_bu
"
"   AND ppl_plnt     = c_plnt
"
"   AND ppl_prod_id  = c_prod_id
"
"   AND ppl_prod_rev = c_prod_Rev
"
"   AND ppl_plnt_loc_id = c_loc_id ;
"
"
"
"
"
"       v_doc_no            VARCHAR2(30);
"
"       v_so_seq_no            NUMBER;
"
"       v_conv_factor        NUMBER;
"
"       v_year            NUMBER(6);
"
"       v_period              NUMBER(2);
"
"       v_rej_store            VARCHAR2(10);
"
"       v_targ_store                VARCHAR2(10);
"
"       v_scrap_prod_id        VARCHAR2(25);
"
"       v_scrap_prod_rev        NUMBER(5);
"
"       v_scrap_uom            VARCHAR2(5);
"
"       v_prod_uom            VARCHAR2(5);
"
"       v_scrap_qty            NUMBER;
"
"       v_comp_sf_code        VARCHAR2(50);
"
"       v_seq_no                    NUMBER;
"
"       v_dis_ass_seq_no        NUMBER;
"
"       v_dis_ass_sub_seq_no        NUMBER;
"
"       v_store_id            VARCHAR2(15);
"
"       v_result            VARCHAR2(100);
"
"       v_lot_no            VARCHAR2(50);
"
"       v_ser_no            VARCHAR2(50);
"
"       v_scrap_seq_no        NUMBER(5);
"
"       v_cnt             NUMBER(5) := 0;
"
"       v_res            VARCHAR2(500);
"
"       v_qc_flag            VARCHAR2(1) := 'N';
"
"       v_disass_qty            NUMBER(12,3) := 0;
"
"       v_disass_lot_qty        NUMBER(12,3) := 0;
"
"       v_disass_rem_qty        NUMBER(12,3) := 0;
"
"       v_scrap_cost            NUMBER(17,5);
"
"       v_ser_seq                    NUMBER(5);
"
"       v_in_proc                    NUMBER;
"
"       v_pfx                   VARCHAR2(10);
"
"
"
"       v_unit_cost                  NUMBER(17,5);
"
"           v_mat_seq_no                 NUMBER(5) := 0;
"
"      cr0                c0%ROWTYPE;
"
"       cr2                c2%ROWTYPE;
"
"       cr3                c3%ROWTYPE;
"
"       cr6                c6%ROWTYPE;
"
"       --cr7                c7%ROWTYPE;
"
"       cr8                c8%ROWTYPE;
"
"       cr9                c9%ROWTYPE;
"
"       cr11                c11%ROWTYPE;
"
"       cr13                c13%ROWTYPE;
"
"       cr14                c14%ROWTYPE;
"
"       cr12                c12%ROWTYPE;
"
"       --c1_ctrl            c_ctrl%ROWTYPE;
"
"         r_rej_wh     c_rej_wh%ROWTYPE;
"
"       cr_grn            c_grn%ROWTYPE;
"
"
"
"       cr_oprn            c_oprn%ROWTYPE;
"
"       cr_rcp                       c_rcp_store%ROWTYPE;
"
"       cr_ser            c_ser%ROWTYPE;
"
"       v_rework_qty        NUMBER(12,3);
"
"       r_wh                c_wh%ROWTYPE;
"
"
"
"
"
"
"
"    BEGIN
"
"
"
"        p_check := 'N';
"
"
"
"       proc_find_year_period(p_bu,
"
"                             TRUNC(p_doc_date),
"
"                             v_year,
"
"                             v_period);
"
"
"
"       FOR r_upd IN (SELECT *
"
"                       FROM rework_order_ser_dtls
"
"                      WHERE rosd_bu = p_bu
"
"                        AND (rosd_rwk_ord_no = p_doc_no OR p_doc_no IS NULL)
"
"                        AND rosd_sel_flag = 'Y'
"
"                        AND rosd_sel_user = p_user
"
"                    )
"
"       LOOP
"
"
"
"
"
"            UPDATE rework_order_hd
"
"               SET rwohd_repair_qty   = rwohd_repair_qty + r_upd.rosd_repair_qty,
"
"                   rwohd_scrap_qty    = rwohd_scrap_qty + r_upd.rosd_scrap_qty,
"
"                   rwohd_dis_assemble = rwohd_dis_assemble + r_upd.rosd_dis_assemble,
"
"                   rwohd_sel_flag     = 'Y',
"
"                   rwohd_user         = p_user
"
"             WHERE rwohd_bu     = p_bu
"
"               AND rwohd_plnt   = r_upd.rosd_plnt
"
"               AND rwohd_ord_no = r_upd.rosd_rwk_ord_no;
"
"
"
"            DBMS_OUTPUT.PUT_LINE('TEST'||' ' ||r_upd.rosd_repair_qty);
"
"
"
"
"
"
"
"
"
"       END LOOP r_upd;
"
"
"
"
"
"                          OPEN c0;
"
"                   FETCH c0 INTO cr0;
"
"                   IF c0%FOUND THEN
"
"                     p_check := 'Y';
"
"                   ELSE
"
"                     p_check := 'N';
"
"                   END IF;
"
"                      CLOSE c0;
"
"
"
"
"
"       IF p_check = 'Y' THEN
"
"
"
"
"
"       FOR cr0 IN c0
"
"       LOOP
"
"
"
"          --v_doc_no := func_find_pfx_nextno(p_bu,p_doc_date,'RWC',p_user);
"
"
"
"              /*v_doc_no     := func_find_pfx_nextno(    p_bu,
"
"                            p_doc_date,
"
"                            func_find_get_mfg_pfx(p_bu,
"
"                                     cr0.RWOHD_PLNT_LOC_ID,
"
"                                     cr0.rwohd_plnt,
"
"                                     'RWC'),
"
"                                     p_user);*/
"
"
"
"      v_pfx := func_find_vou_dflt_pfx(p_bu,
"
"                                    cr0.rwohd_plnt,
"
"                                   cr0.rwohd_plnt_loc_id,
"
"                    CASE WHEN cr0.rwohd_ord_type = 'RW' THEN 'CSWC' ELSE 'RWC' END,
"
"                     CASE WHEN cr0.rwohd_ord_type = 'RPO' THEN 'RCPO'
"
"                          WHEN cr0.rwohd_ord_type = 'RFI' THEN 'RCFI'
"
"                          WHEN cr0.rwohd_ord_type = 'RPR' THEN 'RCPR'
"
"                          WHEN cr0.rwohd_ord_type = 'RSC' THEN 'RCSC'
"
"                          WHEN cr0.rwohd_ord_type = 'RWS' THEN 'RCWS'
"
"                          WHEN cr0.rwohd_ord_type = 'RSR' THEN 'RCSR'
"
"                          WHEN cr0.rwohd_ord_type = 'RST' THEN 'RCST'
"
"                          WHEN cr0.rwohd_ord_type = 'RPD' THEN 'RCPD'
"
"                          WHEN cr0.rwohd_ord_type = 'RRD' THEN 'RCRD'
"
"                          WHEN cr0.rwohd_ord_type = 'RSA' THEN 'RCSA'
"
"                          WHEN cr0.rwohd_ord_type = 'RRR' THEN 'RCRR'
"
"                          WHEN cr0.rwohd_ord_type = 'RW' THEN 'CSWC'
"
"                     END);
"
"
"
"    v_doc_no := func_find_pfx_nextno(p_bu,
"
"                                    TRUNC(p_doc_date),
"
"                                    v_pfx,
"
"                                    p_user);
"
"
"
"
"
"                  DBMS_OUTPUT.PUT_LINE('TEST'||' ' ||v_doc_no);
"
"
"
"          IF (cr0.rwohd_ord_type IN ('PO','PS') AND cr0.rwohd_prod_ord_no IS NOT NULL) THEN
"
"
"
"                 OPEN c2(cr0.rwohd_plnt, cr0.rwohd_prod_ord_no);
"
"                 FETCH c2 INTO cr2;
"
"                    v_conv_factor := cr2.prohd_conv_factor;
"
"                 CLOSE c2;
"
"
"
"          ELSIF cr0.rwohd_ord_type IN ('PR','SC') THEN
"
"
"
"            OPEN c_grn(cr0.rwohd_plnt,cr0.rwohd_sou_doc_pfx,cr0.rwohd_sou_doc_no,cr0.rwohd_sou_doc_line_no);
"
"            FETCH c_grn INTO cr_grn;
"
"                IF c_grn%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20459,'SFM');
"
"                ELSE
"
"                    v_conv_factor := cr_grn.porlh_conv_factor;
"
"                END IF;
"
"            CLOSE c_grn;
"
"
"
"          ELSE
"
"            v_conv_factor := 1;
"
"          END IF;
"
"
"
"          IF cr0.rwohd_ord_type NOT IN ('MT') THEN
"
"
"
"          /*   OPEN c3(cr0.rwohd_plnt);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20270,'ICM');
"
"                ELSE
"
"                   v_rej_store := cr3.store_id;
"
"                END IF;
"
"
"
"             CLOSE c3;*/
"
"
"
"          OPEN c_rej_wh(cr0.rwohd_plnt,cr0.rwohd_plnt_loc_id,cr0.rwohd_prod_id, cr0.rwohd_prod_rev);
"
"         FETCH c_rej_wh INTO r_rej_wh;
"
"
"
"            IF c_rej_wh%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20270,'ICM');
"
"            ELSE
"
"               v_rej_store := r_rej_wh.ppl_rejt_store_id;
"
"            END IF;
"
"
"
"         CLOSE c_rej_wh;
"
"
"
"          ELSE
"
"
"
"             OPEN c6(cr0.rwohd_plnt, cr0.rwohd_sou_doc_no, cr0.rwohd_sou_doc_line_no);
"
"             FETCH c6 INTO cr6;
"
"
"
"                IF c6%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20270,'ICM');
"
"            ELSE
"
"               v_rej_store := cr6.isthd_issuefm_store_id;
"
"                END IF;
"
"
"
"             CLOSE c6;
"
"
"
"          END IF;
"
"
"
"          IF (cr0.rwohd_ord_type IN ('SR','PR','RD') AND cr0.rwohd_repair_qty > 0) THEN
"
"
"
"             IF cr0.rwohd_ord_type IN ('SR') THEN
"
"
"
"                OPEN c9(cr0.rwohd_plnt);
"
"                FETCH c9 INTO cr9;
"
"
"
"                   IF c9%NOTFOUND THEN
"
"                      RAISE_APPLICATION_ERROR(-20022,'ADM');
"
"                   ELSE
"
"
"
"                      IF cr9.bqac_sr_tar_flag = 'Y' THEN
"
"
"
"                       /*  IF cr9.bqac_sr_tar_wh IS NULL THEN
"
"                            RAISE_APPLICATION_ERROR(-20270, 'ICM');
"
"                         ELSE */
"
"                            --v_targ_store := cr9.bqac_sr_tar_wh;
"
"                            v_targ_store := func_find_deflt_storeid(p_bu, cr0.rwohd_plnt, cr0.rwohd_plnt_loc_id,  cr0.rwohd_prod_id, cr0.rwohd_prod_rev,'N');
"
"                        -- END IF;
"
"                      ELSE
"
"                         v_targ_store := func_find_deflt_storeid(p_bu, cr0.rwohd_plnt, cr0.rwohd_plnt_loc_id, cr0.rwohd_prod_id, cr0.rwohd_prod_rev,'N');
"
"                      END IF;
"
"
"
"                   END IF;
"
"
"
"                CLOSE c9;
"
"
"
"             ELSE
"
"                v_targ_store := func_find_deflt_storeid(p_bu, cr0.rwohd_plnt, cr0.rwohd_plnt_loc_id,  cr0.rwohd_prod_id, cr0.rwohd_prod_rev,'N');
"
"             END IF;
"
"
"
"          ELSIF cr0.rwohd_ord_type IN ('PO','PS','WS','ST','FI','MT') THEN
"
"             v_targ_store := NULL;
"
"          END IF;
"
"
"
"          IF cr0.rwohd_ord_type IN ('PO','SC') THEN
"
"             OPEN c_rcp_store(cr0.rwohd_plnt,cr0.rwohd_prod_ord_no,cr0.rwohd_oprn_id);
"
"                  FETCH c_rcp_store INTO cr_rcp;
"
"                  IF c_rcp_store%FOUND THEN
"
"                     v_targ_store := cr_rcp.pror_rcp_store;
"
"                  END IF;
"
"             CLOSE c_rcp_store;
"
"          END IF;
"
"
"
"          IF cr0.rwohd_ord_type = 'RD' THEN
"
"          OPEN c3(cr0.rwohd_plnt);
"
"                       FETCH c3 INTO cr3;
"
"
"
"                          IF c3%NOTFOUND THEN
"
"                             RAISE_APPLICATION_ERROR(-20270,'ICM');
"
"                          ELSE
"
"                             v_rej_store := cr3.store_id;
"
"                          END IF;
"
"
"
"             CLOSE c3;
"
"          END IF;
"
"
"
"
"
"          IF func_find_product_qc_req_rw(p_bu, cr0.rwohd_plnt, cr0.rwohd_prod_id, cr0.rwohd_prod_rev) IN ('CP','FR') THEN
"
"             v_qc_flag  := 'Y';
"
"          ELSE
"
"             v_qc_flag := 'N';
"
"          END IF;
"
"
"
"             IF cr0.rwohd_ord_type IN ('RW') THEN
"
"
"
"                         OPEN c_wh(cr0.rwohd_plnt);
"
"                         FETCH c_wh INTO r_wh;
"
"                             IF c_wh%FOUND AND cr0.rwohd_csr_no IS NOT NULL THEN
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||cr0.rwohd_loc_id);
"
"                                 v_targ_store := func_find_store_fr_type(p_bu,cr0.rwohd_plnt,cr0.RWOHD_PLNT_LOC_ID,'G');
"
"                                 v_rej_store := func_find_store_fr_type(p_bu,cr0.rwohd_plnt,cr0.RWOHD_PLNT_LOC_ID,'E');
"
"
"
"                             ELSE
"
"                                 v_targ_store := func_find_store_fr_type(p_bu,cr0.rwohd_plnt,cr0.RWOHD_PLNT_LOC_ID,'G');
"
"                                 v_rej_store  := func_find_store_fr_type(p_bu,cr0.rwohd_plnt,cr0.RWOHD_PLNT_LOC_ID,'R');
"
"
"
"                             END IF;
"
"                         CLOSE c_wh;
"
"
"
"                               END IF;
"
"
"
"
"
"            v_rework_qty := 0;
"
"
"
"            OPEN c_ser(cr0.rwohd_plnt,cr0.rwohd_ord_no);
"
"            FETCH c_ser INTO cr_ser;
"
"
"
"                IF c_ser%NOTFOUND THEN
"
"                    v_rework_qty := (cr0.rwohd_repair_qty + cr0.rwohd_scrap_qty + cr0.rwohd_dis_assemble);
"
"                END IF;
"
"
"
"            CLOSE c_ser;
"
"
"
"            FOR cr_ser IN c_ser(cr0.rwohd_plnt,cr0.rwohd_ord_no)
"
"            LOOP
"
"                v_rework_qty := v_rework_qty + cr_ser.rosd_qty;
"
"            END LOOP;
"
"
"
"
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||cr0.rwohd_repair_qty);
"
"
"
"          INSERT INTO rework_order_comp_hd( rwochd_bu        ,
"
"                                            rwochd_plnt        ,
"
"                                            rwochd_comp_pfx,
"
"                        rwochd_doc_no        ,
"
"                        rwochd_date        ,
"
"                        rwochd_year         ,
"
"                        rwochd_period       ,
"
"                        rwochd_rw_ord_no    ,
"
"                        rwochd_prod_id      ,
"
"                        rwochd_prod_rev     ,
"
"                        rwochd_comp_qty     ,
"
"                        rwochd_scrap_qty    ,
"
"                        rwochd_status        ,
"
"                        rwochd_cre_by        ,
"
"                        rwochd_cre_date     ,
"
"                        rwochd_upd_by        ,
"
"                        rwochd_upd_date     ,
"
"                        rwochd_line_id        ,
"
"                        rwochd_prod_ord_no  ,
"
"                        rwochd_dis_assemble ,
"
"                        rwochd_material_cost,
"
"                        rwochd_res_cost        ,
"
"                        rwochd_ot_cost        ,
"
"                        rwochd_unit_cost    ,
"
"                        rwochd_so_pfx        ,
"
"                        rwochd_so_no        ,
"
"                        rwochd_so_seq_no    ,
"
"                        rwochd_so_sub_seq_no,
"
"                        rwochd_proj_id        ,
"
"                        rwochd_task_id        ,
"
"                        rwochd_ord_type        ,
"
"                        rwochd_conv_factor  ,
"
"                        rwochd_comp_stk_qty ,
"
"                        rwochd_sf_code         ,
"
"                        rwochd_source        ,
"
"                        rwochd_sou_store    ,
"
"                        rwochd_target_store ,
"
"                        rwochd_sys_ls_no    ,
"
"                        rwochd_lot_no        ,
"
"                        rwochd_ser_no        ,
"
"                        rwochd_route_card_no,
"
"                        rwochd_source_type  ,
"
"                        rwochd_source_id    ,
"
"                        rwochd_trans_qty    ,
"
"                        rwochd_reference    ,
"
"                        rwochd_source_pfx   ,
"
"                        rwochd_source_no    ,
"
"                        rwochd_source_line  ,
"
"                        rwochd_pp_no        ,
"
"                        rwochd_pp_seq_no    ,
"
"                        rwochd_vi_flag      ,
"
"                        rwochd_oprn_id      ,
"
"                        rwochd_qc_flag      ,
"
"                        rwochd_so_schld_desc,
"
"                        rwochd_stl_doc_no,
"
"                        rwochd_stl_seq_no,
"
"                        rwochd_cre_emp_id,
"
"                        rwochd_cre_ip_addr,
"
"                        rwochd_cre_os_user,
"
"                        rwochd_loc_id,
"
"                        rwochd_plnt_loc_id,
"
"                        rwochd_plnt_loc_name,
"
"                        rwochd_csr_no
"
"                        )
"
"                        VALUES (p_bu            ,
"
"                        cr0.rwohd_plnt        ,
"
"                        v_pfx,--func_find_get_mfg_pfx(p_bu,cr0.rwohd_plnt_loc_id,cr0.rwohd_plnt,'RWC'),
"
"                        v_doc_no        ,
"
"                        TRUNC (p_doc_date)    ,
"
"                        v_year            ,
"
"                        v_period        ,
"
"                        cr0.rwohd_ord_no    ,
"
"                        cr0.rwohd_prod_id    ,
"
"                        cr0.rwohd_prod_rev        ,
"
"                        cr0.rwohd_repair_qty      ,
"
"                        cr0.rwohd_scrap_qty    ,
"
"                        'N'            ,
"
"                        p_user            ,
"
"                        SYSDATE            ,
"
"                        NULL            ,
"
"                        NULL            ,
"
"                        cr0.rwohd_line_id    ,
"
"                        cr0.rwohd_prod_ord_no    ,
"
"                        cr0.rwohd_dis_assemble    ,
"
"                        0            ,
"
"                        0            ,
"
"                        0            ,
"
"                        0            ,
"
"                        cr0.rwohd_so_pfx    ,
"
"                        cr0.rwohd_so_no        ,
"
"                        cr0.rwohd_so_seq_no    ,
"
"                        cr0.rwohd_so_sub_seq_no    ,
"
"                        cr0.rwohd_proj_id    ,
"
"                        cr0.rwohd_task_id    ,
"
"                         CASE WHEN cr0.rwohd_ord_type = 'RPO' THEN 'RCPO'
"
"                          WHEN cr0.rwohd_ord_type = 'RFI' THEN 'RCFI'
"
"                          WHEN cr0.rwohd_ord_type = 'RPR' THEN 'RCPR'
"
"                          WHEN cr0.rwohd_ord_type = 'RSC' THEN 'RCSC'
"
"                          WHEN cr0.rwohd_ord_type = 'RWS' THEN 'RCWS'
"
"                          WHEN cr0.rwohd_ord_type = 'RSR' THEN 'RCSR'
"
"                          WHEN cr0.rwohd_ord_type = 'RST' THEN 'RCST'
"
"                          WHEN cr0.rwohd_ord_type = 'RPD' THEN 'RCPD'
"
"                          WHEN cr0.rwohd_ord_type = 'RRD' THEN 'RCRD'
"
"                          WHEN cr0.rwohd_ord_type = 'RSA' THEN 'RCSA'
"
"                          WHEN cr0.rwohd_ord_type = 'RRR' THEN 'RCRR'
"
"                          WHEN cr0.rwohd_ord_type = 'RW' THEN 'RW'
"
"                        END     ,
"
"                        v_conv_factor        ,
"
"                        (cr0.rwohd_repair_qty/v_conv_factor),
"
"                        cr0.rwohd_sf_code    ,
"
"                        'S'            ,
"
"                        v_rej_store        ,
"
"                        v_targ_store        ,
"
"                        cr0.rwohd_sys_ls_no    ,
"
"                        cr0.rwohd_lot_no    ,
"
"                        cr0.rwohd_serial_no    ,
"
"                        cr0.rwohd_route_card_no    ,
"
"                        cr0.rwohd_source_type    ,
"
"                        cr0.rwohd_source_id    ,
"
"                        v_rework_qty,
"
"                        cr0.rwohd_reference    ,
"
"                        cr0.rwohd_sou_doc_pfx    ,
"
"                        cr0.rwohd_sou_doc_no    ,
"
"                        cr0.rwohd_sou_doc_line_no,
"
"                        cr0.rwohd_pp_no        ,
"
"                        cr0.rwohd_pp_seq_no    ,
"
"                        cr0.rwohd_vi_flag    ,
"
"                        cr0.rwohd_oprn_id    ,
"
"                        v_qc_flag        ,
"
"                        cr0.rwohd_so_schld_desc,
"
"                        cr0.rwohd_stl_doc_no,
"
"                        cr0.rwohd_stl_seq_no,
"
"                                    func_find_emp_id(p_bu,p_user)    ,
"
"                        audit_info.get_ip_address    ,
"
"                                       audit_info.get_os_user  ,
"
"                        cr0.RWOHD_PLNT_LOC_ID,
"
"                        cr0.RWOHD_PLNT_LOC_ID,
"
"                        func_find_plnt_loc_qry_desc(p_bu,cr0.RWOHD_PLNT_LOC_ID),
"
"                        cr0.rwohd_csr_no
"
"                        );
"
"
"
"            FOR cr_ord_ser IN (SELECT *
"
"                                 FROM rework_order_ser_dtls
"
"                                WHERE rosd_bu   = p_bu
"
"                                  AND rosd_plnt = cr0.rwohd_plnt
"
"                                  AND rosd_rwk_ord_no = cr0.rwohd_ord_no
"
"                                  AND rosd_sel_flag = 'Y'
"
"                                  AND rosd_sel_user = p_user
"
"                                  )
"
"            LOOP
"
"
"
"                --RAISE_APPLICATION_ERROR(-20999,'HRM'||' ' ||cr_ord_ser.rosd_ser_no);
"
"
"
"                SELECT NVL(MAX(rocsd_seq_no),0) + 1
"
"                  INTO v_ser_seq
"
"                  FROM rework_order_comp_ser_dtls
"
"                 WHERE rocsd_bu     = p_bu
"
"                   AND rocsd_plnt = cr0.rwohd_plnt
"
"                   AND rocsd_doc_no = v_doc_no;
"
"
"
"                INSERT INTO rework_order_comp_ser_dtls(
"
"                                                        rocsd_bu    ,
"
"                                                        rocsd_plnt    ,
"
"                                                        rocsd_doc_no,
"
"                                                        rocsd_seq_no,
"
"                                                        rocsd_ser_no,
"
"                                                        rocsd_sys_ls_no,
"
"                                                        rocsd_source_id,
"
"                                                        rocsd_source_type,
"
"                                                        rocsd_ser_status,
"
"                                                        rocsd_cre_by    ,
"
"                                                        rocsd_cre_date    ,
"
"                                                        rocsd_cre_emp_id,
"
"                                                        rocsd_cre_ip_addr,
"
"                                                        rocsd_cre_os_user,
"
"                                                        rocsd_upd_by    ,
"
"                                                        rocsd_upd_date
"
"                                                        )
"
"                                                 VALUES(p_bu,
"
"                                                        cr0.rwohd_plnt,
"
"                                                        v_doc_no,
"
"                                                        v_ser_seq,
"
"                                                        cr_ord_ser.rosd_ser_no,
"
"                                                        cr_ord_ser.rosd_sys_ls_no    ,
"
"                                                        cr_ord_ser.rosd_source_id    ,
"
"                                                        cr_ord_ser.rosd_source_type,
"
"                                                        CASE WHEN cr0.rwohd_repair_qty > 0 THEN 'A'
"
"                                                             WHEN cr0.rwohd_scrap_qty > 0 THEN 'S'
"
"                                                             WHEN cr0.rwohd_dis_assemble > 0 THEN 'D'
"
"                                                        END    ,
"
"                                                        p_user,
"
"                                                        SYSDATE,
"
"                                                        func_find_emp_id(p_bu,p_user)    ,
"
"                                                                            audit_info.get_ip_address    ,
"
"                                                                       audit_info.get_os_user        ,
"
"                                                        NULL,
"
"                                                        NULL
"
"                                                        );
"
"
"
"            END LOOP cr_ord_ser;
"
"
"
"
"
"            FOR cr_mat IN (SELECT *
"
"                             FROM rework_ord_mat_req_dtls
"
"                            WHERE romrd_bu = p_bu
"
"                              AND romrd_plnt = cr0.rwohd_plnt
"
"                              AND romrd_rwk_ord_no = cr0.rwohd_ord_no
"
"                              AND romrd_rqrd_qty > 0
"
"                              ORDER BY romrd_seq_no)
"
"             LOOP
"
"
"
"                  SELECT NVL(MAX(rocmrd_seq_no),0) + 1
"
"                    INTO v_mat_seq_no
"
"                    FROM rework_ord_comp_mat_req_dtls
"
"                   WHERE rocmrd_bu = p_bu
"
"                     AND rocmrd_plnt = cr0.rwohd_plnt
"
"                     AND rocmrd_doc_no = v_doc_no;
"
"
"
"                     v_unit_cost := func_find_unitcost(p_bu,cr_mat.romrd_prod_id    ,
"
"                                    cr_mat.romrd_prod_rev    ,
"
"                                    cr_mat.romrd_sou_store_id);
"
"
"
"                   INSERT INTO rework_ord_comp_mat_req_dtls(rocmrd_bu    ,
"
"                                    rocmrd_plnt    ,
"
"                                    rocmrd_doc_no    ,
"
"                                    rocmrd_seq_no    ,
"
"                                    rocmrd_prod_id    ,
"
"                                    rocmrd_prod_rev    ,
"
"                                    rocmrd_cons_store,
"
"                                    rocmrd_rqrd_qty    ,
"
"                                    rocmrd_cons_qty    ,
"
"                                    rocmrd_alloc_qty,
"
"                                    rocmrd_unit_cost,
"
"                                    rocmrd_ext_cost    ,
"
"                                    rocmrd_cre_by    ,
"
"                                    rocmrd_cre_date    ,
"
"                                    rocmrd_cre_emp_id,
"
"                                    rocmrd_cre_ip_addr,
"
"                                    rocmrd_cre_os_user,
"
"                                    rocmrd_upd_by    ,
"
"                                    rocmrd_upd_date
"
"                                    )
"
"                                 VALUES(p_bu            ,
"
"                                                cr0.rwohd_plnt        ,
"
"                                                v_doc_no    ,
"
"                                    v_mat_seq_no    ,
"
"                                    cr_mat.romrd_prod_id    ,
"
"                                    cr_mat.romrd_prod_rev    ,
"
"                                    cr_mat.romrd_sou_store_id,
"
"                                    cr_mat.romrd_rqrd_qty     ,
"
"                                    cr_mat.romrd_rqrd_qty    ,
"
"                                    0,
"
"                                    v_unit_cost,
"
"                                    v_unit_cost * cr_mat.romrd_rqrd_qty    ,
"
"                                    p_user    ,
"
"                                    SYSDATE    ,
"
"                                    func_find_emp_id(p_bu,p_user)    ,
"
"                                    audit_info.get_ip_address    ,
"
"                                                   audit_info.get_os_user        ,
"
"                                    NULL    ,
"
"                                    NULL);
"
"                 END LOOP;
"
"
"
"        --raise_application_error(-20999,'HRM'||cr0.rwohd_proc_qty||'/'||cr0.rwohd_in_proc_qty||'/'||cr0.rwohd_rework_qty);
"
"
"
"        IF func_find_prod_ser_lot_type(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev) IN ('L','N') THEN
"
"
"
"
"
"---raise_application_error(-20999,'HRM'||cr0.rwohd_proc_qty||'/'||cr0.rwohd_in_proc_qty||'/'||cr0.rwohd_rework_qty);
"
"              UPDATE rework_order_hd
"
"             SET rwohd_in_proc_qty  = rwohd_in_proc_qty + (cr0.rwohd_repair_qty + cr0.rwohd_scrap_qty + cr0.rwohd_dis_assemble),
"
"                 rwohd_repair_qty    = rwohd_repair_qty - cr0.rwohd_repair_qty,
"
"                 rwohd_scrap_qty    = rwohd_scrap_qty - cr0.rwohd_scrap_qty,
"
"                 rwohd_dis_assemble = rwohd_dis_assemble - cr0.rwohd_dis_assemble,
"
"                     rwohd_sel_flag     = 'N',
"
"                     rwohd_upd_by       = p_user,
"
"                     rwohd_upd_date    = SYSDATE
"
"               WHERE rwohd_bu       = p_bu
"
"             AND rwohd_plnt   = cr0.rwohd_plnt
"
"             AND rwohd_ord_no = cr0.rwohd_ord_no;
"
"
"
"
"
"        ELSIF func_find_prod_ser_lot_type(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev) IN ('S','O') THEN
"
"
"
"          FOR r_ser IN (SELECT *
"
"                  FROM rework_order_ser_dtls
"
"                 WHERE rosd_bu   = p_bu
"
"                   AND rosd_plnt = cr0.rwohd_plnt
"
"                   AND rosd_rwk_ord_no = cr0.rwohd_ord_no
"
"                   AND rosd_sel_flag = 'Y'
"
"                   AND rosd_sel_user = p_user)
"
"          LOOP
"
"
"
"
"
"
"
"    --
"
"--    raise_application_error(-20999,'HRM'||r_ser.rosd_repair_qty||'/'||r_ser.rosd_scrap_qty ||'/'||r_ser.rosd_dis_assemble);
"
"                  UPDATE rework_order_hd
"
"                 SET rwohd_in_proc_qty  = rwohd_in_proc_qty + (r_ser.rosd_repair_qty + r_ser.rosd_scrap_qty + r_ser.rosd_dis_assemble),
"
"                     rwohd_repair_qty    = rwohd_repair_qty - r_ser.rosd_repair_qty,
"
"                     rwohd_scrap_qty    = rwohd_scrap_qty - r_ser.rosd_scrap_qty,
"
"                     rwohd_dis_assemble = rwohd_dis_assemble - r_ser.rosd_dis_assemble,
"
"                     rwohd_sel_flag     = 'N',
"
"                     rwohd_upd_by       = p_user,
"
"                     rwohd_upd_date    = SYSDATE
"
"                   WHERE rwohd_bu       = p_bu
"
"                     AND rwohd_plnt   = r_ser.rosd_plnt
"
"                    AND rwohd_ord_no = r_ser.rosd_rwk_ord_no;
"
"
"
"
"
"
"
"
"
"
"
"
"
"                  UPDATE rework_order_ser_dtls
"
"                     SET rosd_in_proc_qty  = rosd_in_proc_qty + (r_ser.rosd_repair_qty + r_ser.rosd_scrap_qty + r_ser.rosd_dis_assemble),
"
"                     rosd_repair_qty   = rosd_repair_qty - r_ser.rosd_repair_qty,
"
"                     rosd_scrap_qty    = rosd_scrap_qty - r_ser.rosd_scrap_qty,
"
"                     rosd_dis_assemble = rosd_dis_assemble - r_ser.rosd_dis_assemble,
"
"                     rosd_sel_flag     = 'N',
"
"                     rosd_upd_by       = p_user,
"
"                     rosd_upd_date     = SYSDATE
"
"                   WHERE rosd_bu            = p_bu
"
"                 AND rosd_plnt         = r_ser.rosd_plnt
"
"                 AND rosd_ser_no       = r_ser.rosd_ser_no
"
"                 AND rosd_seq_no       = r_ser.rosd_seq_no
"
"                 AND rosd_rwk_ord_no   = r_ser.rosd_rwk_ord_no;
"
"
"
"          END LOOP;
"
"
"
"        END IF;
"
"
"
"          UPDATE rework_order_ser_dtls
"
"             SET rosd_sel_flag = 'N',
"
"                 rosd_sel_user = NULL
"
"           WHERE rosd_bu = p_bu
"
"             AND rosd_plnt = cr0.rwohd_plnt
"
"             AND rosd_rwk_ord_no = cr0.rwohd_ord_no;
"
"
"
"          IF cr0.rwohd_repair_qty > 0 THEN
"
"
"
"             INSERT INTO rework_item_grades(rig_bu              ,
"
"                        rig_plnt            ,
"
"                        rig_doc_no          ,
"
"                        rig_seq_no          ,
"
"                        rig_prod_id         ,
"
"                        rig_prod_rev        ,
"
"                        rig_rcpt_qty        ,
"
"                        rig_cre_by          ,
"
"                        rig_cre_date        ,
"
"                        rig_cre_emp_id,
"
"                        rig_cre_ip_addr,
"
"                        rig_cre_os_user,
"
"                        rig_upd_by          ,
"
"                        rig_upd_date        ,
"
"                        rig_stk_qty         )
"
"                    VALUES (p_bu                ,
"
"                        cr0.rwohd_plnt      ,
"
"                        v_doc_no             ,
"
"                        1               ,
"
"                        cr0.rwohd_prod_id   ,
"
"                        cr0.rwohd_prod_rev  ,
"
"                        cr0.rwohd_repair_qty,
"
"                        p_user          ,
"
"                        SYSDATE             ,
"
"                        func_find_emp_id(p_bu,p_user)    ,
"
"                        audit_info.get_ip_address    ,
"
"                                       audit_info.get_os_user        ,
"
"                        NULL               ,
"
"                        NULL            ,
"
"                        cr0.rwohd_repair_qty);
"
"
"
"          END IF;
"
"
"
"          IF cr0.rwohd_scrap_qty > 0 THEN
"
"
"
"              OPEN c13(cr0.rwohd_plnt,cr0.rwohd_prod_ord_no);
"
"              FETCH c13 INTO cr13;
"
"              CLOSE c13;
"
"
"
"
"
"           /* OPEN c_ctrl(cr0.rwohd_plnt);
"
"            FETCH c_ctrl INTO c1_ctrl;
"
"
"
"                    /*Scrap move based on BOM */
"
"
"
"       -- IF c1_ctrl.planctrl_scrap_from = 'B' THEN
"
"
"
"              OPEN c12(cr0.rwohd_oprn_id,cr13.prohd_bom_no,cr0.rwohd_plnt, cr0.rwohd_prod_id, cr0.rwohd_prod_rev, cr0.rwohd_plnt_loc_id);
"
"              FETCH c12 INTO cr12;
"
"              IF c12%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20597,'SFM'||cr0.rwohd_prod_id||'~'||cr0.rwohd_prod_rev);
"
"              END IF;
"
"              CLOSE C12;
"
"
"
"         FOR cr12 IN c12(cr0.rwohd_oprn_id,cr13.prohd_bom_no,cr0.rwohd_plnt, cr0.rwohd_prod_id, cr0.rwohd_prod_rev, cr0.rwohd_plnt_loc_id)
"
"         LOOP
"
"
"
"            SELECT NVL(MAX(rcs_seq_no),0)+1
"
"               INTO v_scrap_seq_no
"
"               FROM rework_comp_scrap
"
"              WHERE rcs_bu     = p_bu
"
"                AND rcs_plnt   = cr0.rwohd_plnt
"
"                AND rcs_doc_no = v_doc_no;
"
"
"
"                -- v_scrap_prod_id := func_find_scrap_prod_id(p_bu, cr0.rwohd_prod_id, cr0.rwohd_prod_rev);
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"                 v_prod_uom      := func_find_product_uom(p_bu, cr0.rwohd_prod_id, cr0.rwohd_prod_rev);
"
"
"
"                 v_scrap_uom      := func_find_product_uom(p_bu, cr12.scrap_prod_id, cr12.scrap_prod_rev);
"
"
"
"                 v_scrap_qty := cr0.rwohd_scrap_qty * cr12.qty;
"
"
"
"
"
"
"
"                OPEN c14(cr0.rwohd_plnt);
"
"                FETCH c14 INTO cr14;
"
"                IF c14%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20560,'PLN' ||'Planning control not defined');
"
"                END IF;
"
"                CLOSE c14;
"
"
"
"               /* IF cr14.planctrl_scrap_costbasis = 'S' THEN
"
"                    v_scrap_cost := func_find_std_price(p_bu,cr12.scrap_prod_id,cr12.scrap_prod_rev);
"
"                ELSIF cr14.planctrl_scrap_costbasis IN ('M','R') THEN
"
"                      v_scrap_cost :=  func_find_sfg_unitcost(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev,func_find_store_fr_type(p_bu,cr0.rwohd_plnt,cr0.rwohd_loc_id,'J'),cr0.rwohd_prod_ord_no,cr0.rwohd_sf_code,cr0.rwohd_sys_ls_no);
"
"
"
"                END IF;*/
"
"
"
"               v_scrap_cost := func_find_std_price(p_bu,cr12.scrap_prod_id,cr12.scrap_prod_rev);
"
"                DBMS_OUTPUT.PUT_LINE(v_doc_no||cr12.scrap_prod_id||cr12.pbsp_tar_store_id);
"
"                 INSERT INTO rework_comp_scrap (rcs_bu             ,
"
"                                rcs_plnt         ,
"
"                                rcs_doc_no       ,
"
"                                rcs_seq_no       ,
"
"                                rcs_prod_id      ,
"
"                                rcs_prod_rev     ,
"
"                                rcs_uom             ,
"
"                                rcs_store_id     ,
"
"                                rcs_scrap_qty    ,
"
"                                rcs_unit_cost    ,
"
"                                rcs_cre_by       ,
"
"                                rcs_cre_date     ,
"
"                                rcs_cre_emp_id ,
"
"                                rcs_cre_ip_addr ,
"
"                                rcs_cre_os_user
"
"                                )
"
"                             VALUES(p_bu            ,
"
"                                cr0.rwohd_plnt  ,
"
"                                v_doc_no        ,
"
"                                v_scrap_seq_no  ,
"
"                                cr12.scrap_prod_id ,
"
"                                cr12.scrap_prod_rev,
"
"                                v_scrap_uom    ,
"
"                                cr12.pbsp_tar_store_id,
"
"                                v_scrap_qty    ,
"
"                                v_scrap_cost,
"
"                                p_user        ,
"
"                                SYSDATE        ,
"
"                                func_find_emp_id(p_bu,p_user)    ,
"
"                                               audit_info.get_ip_address    ,
"
"                                               audit_info.get_os_useR
"
"                       );
"
"
"
"
"
"
"
"         END LOOP c12;
"
"
"
"         --ELSIF c1_ctrl.planctrl_scrap_from = 'P' THEN     /*Scrap move based on item master*/
"
"
"
"
"
"                 SELECT NVL(MAX(rcs_seq_no),0)+1
"
"                   INTO v_scrap_seq_no
"
"                   FROM rework_comp_scrap
"
"                  WHERE rcs_bu     = p_bu
"
"                AND rcs_plnt   = cr0.rwohd_plnt
"
"                AND rcs_doc_no = v_doc_no;
"
"
"
"                 v_scrap_prod_id := func_find_scrap_prod_id(p_bu, cr0.rwohd_prod_id, cr0.rwohd_prod_rev);
"
"
"
"                 IF v_scrap_prod_id IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20597,'SFM'||cr0.rwohd_prod_id||'~'||cr0.rwohd_prod_rev);
"
"                 END IF;
"
"
"
"                 v_scrap_prod_rev := func_find_max_prod_rev(p_bu, v_scrap_prod_id);
"
"
"
"                 OPEN c11(cr0.rwohd_plnt, v_scrap_prod_id, v_scrap_prod_rev);
"
"                 FETCH c11 INTO cr11;
"
"
"
"                IF c11%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20267,'ICM'||' '||cr0.rwohd_plnt||v_scrap_prod_id||v_scrap_prod_rev);
"
"                END IF;
"
"
"
"                 CLOSE c11;
"
"
"
"                 v_prod_uom      := func_find_product_uom(p_bu, cr0.rwohd_prod_id, cr0.rwohd_prod_rev);
"
"
"
"                 v_scrap_uom      := func_find_product_uom(p_bu, v_scrap_prod_id, v_scrap_prod_rev);
"
"
"
"                IF v_prod_uom <> v_scrap_uom THEN
"
"
"
"                IF func_find_prod_ser_lot_type(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev) IN ('S','O') AND
"
"                   func_find_prod_net_weight(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev) <= 0 THEN
"
"
"
"                   raise_application_error(-20141,'ICM'||cr0.rwohd_prod_id||'/'||cr0.rwohd_prod_rev);
"
"
"
"                END IF;
"
"
"
"                    v_scrap_qty       := cr0.rwohd_scrap_qty * (CASE WHEN func_find_prod_ser_lot_type(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev) IN ('S','O') THEN
"
"                                                                          func_find_prod_net_weight(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev)
"
"                                                 ELSE func_find_uom_conversion(p_bu,cr0.rwohd_prod_id,cr0.rwohd_prod_rev,v_prod_uom,v_scrap_uom)
"
"                                             END);
"
"
"
"                ELSE
"
"                    v_scrap_qty       := cr0.rwohd_scrap_qty;
"
"                END IF;
"
"
"
"                 INSERT INTO rework_comp_scrap (rcs_bu             ,
"
"                                                rcs_plnt         ,
"
"                                                rcs_doc_no       ,
"
"                                                rcs_seq_no       ,
"
"                                                rcs_prod_id      ,
"
"                                                rcs_prod_rev     ,
"
"                                                rcs_uom             ,
"
"                                                rcs_store_id     ,
"
"                                                rcs_scrap_qty    ,
"
"                                                rcs_unit_cost    ,
"
"                                                rcs_cre_by       ,
"
"                                                rcs_cre_date    ,
"
"                                                rcs_cre_emp_id,
"
"                                                rcs_cre_ip_addr,
"
"                                                rcs_cre_os_user)
"
"                                             VALUES(p_bu            ,
"
"                                                cr0.rwohd_plnt  ,
"
"                                                v_doc_no        ,
"
"                                                v_scrap_seq_no  ,
"
"                                                v_scrap_prod_id ,
"
"                                                v_scrap_prod_rev,
"
"                                                v_scrap_uom    ,
"
"                                                func_find_deflt_storeid(p_bu, cr0.rwohd_plnt, cr0.rwohd_plnt_loc_id,  v_scrap_prod_id, v_scrap_prod_rev, 'N'),
"
"                                                v_scrap_qty    ,
"
"                                                func_find_unitcost(p_bu, v_scrap_prod_id, v_scrap_prod_rev, func_find_deflt_storeid(p_bu, cr0.rwohd_plnt, cr0.rwohd_plnt_loc_id,  v_scrap_prod_id, v_scrap_prod_rev, 'N')),
"
"                                                p_user        ,
"
"                                               SYSDATE    ,
"
"                                                 func_find_emp_id(p_bu,p_user)    ,
"
"                                                 audit_info.get_ip_address    ,
"
"                                                                audit_info.get_os_user
"
"                                               );
"
"         --END IF ; --Planning
"
"        -- CLOSE c_ctrl;
"
"         END IF;
"
"
"
"
"
"          FOR cr4 IN c4(cr0.rwohd_ord_no)
"
"          LOOP
"
"
"
"                 SELECT NVL(MAX(rscd_seq_no),0)+1
"
"                   INTO v_seq_no
"
"                   FROM rework_scrap_cons_detail
"
"                  WHERE rscd_bu = p_bu
"
"                    AND rscd_plnt = cr0.rwohd_plnt
"
"                    AND rscd_doc_no = v_doc_no;
"
"
"
"                 INSERT INTO rework_scrap_cons_detail(rscd_bu        ,
"
"                                      rscd_plnt        ,
"
"                                      rscd_doc_no    ,
"
"                                      rscd_seq_no    ,
"
"                                      rscd_store_id    ,
"
"                                      rscd_prod_id    ,
"
"                                      rscd_prod_rev    ,
"
"                                      rscd_rqrd_qty    ,
"
"                                      rscd_cons_qty    ,
"
"                                      rscd_allocated_qty,
"
"                                      rscd_source    ,
"
"                                      rscd_vat_qty    ,
"
"                                      rscd_cons_type    ,
"
"                                      rscd_item_cost    ,
"
"                                      rscd_uom        ,
"
"                                      rscd_prod_uom    ,
"
"                                      rscd_conv_factor    ,
"
"                                      rscd_unit_cost    ,
"
"                                      rscd_oprn_id    ,
"
"                                      rscd_dept_id    ,
"
"                                      rscd_cre_by    ,
"
"                                      rscd_cre_date    ,
"
"                                      rscd_cre_emp_id,
"
"                                      rscd_cre_ip_addr,
"
"                                      rscd_cre_os_user)
"
"                                           VALUES(p_bu           ,
"
"                                      cr0.rwohd_plnt       ,
"
"                                      v_doc_no           ,
"
"                                      v_seq_no           ,
"
"                                      cr4.isthd_issueto_id ,
"
"                                      cr4.istln_prod_id       ,
"
"                                      cr4.istln_prod_rev   ,
"
"                                      cr4.istln_trans_qty  ,
"
"                                      cr4.istln_trans_qty  ,
"
"                                      0               ,
"
"                                      'S'           ,
"
"                                      0               ,
"
"                                      'N'           ,
"
"                                      cr4.istln_unit_cost  ,
"
"                                      cr4.istln_uom       ,
"
"                                      cr4.istln_prod_uom   ,
"
"                                      cr4.istln_conv_factor,
"
"                                      cr4.istln_unit_cost  ,
"
"                                      NULL           ,
"
"                                      NULL           ,
"
"                                      p_user           ,
"
"                                      SYSDATE    ,
"
"                                      func_find_emp_id(p_bu,p_user)    ,
"
"                                             audit_info.get_ip_address    ,
"
"                                          audit_info.get_os_user  );
"
"          END LOOP c4;
"
"
"
"
"
"
"
"          OPEN c8(cr0.rwohd_plnt);
"
"          FETCH c8 INTO cr8;
"
"
"
"         IF c8%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20560,'PLN' || ' ' ||cr0.rwohd_plnt||' - ' ||'Planning Control not defined.');
"
"         END IF;
"
"
"
"          CLOSE c8;
"
"
"
"          IF cr0.rwohd_ord_type IN ('MT') AND cr0.rwohd_dis_assemble > 0 THEN
"
"
"
"         FOR cr5 IN c5(cr0.rwohd_plnt, cr0.rwohd_prod_id, cr0.rwohd_prod_rev)
"
"         LOOP
"
"
"
"            SELECT NVL(MAX(rwocln_seq_no),0) + 1
"
"              INTO v_dis_ass_seq_no
"
"              FROM rework_order_cons_ln
"
"             WHERE rwocln_bu     = p_bu
"
"               AND rwocln_plnt     = cr0.rwohd_plnt
"
"               AND rwocln_doc_no = v_doc_no;
"
"
"
"            v_store_id := func_find_deflt_storeid(p_bu, cr0.rwohd_plnt, cr0.rwohd_loc_id, cr5.bomln_prod_id, cr5.bomln_prod_rev, 'N');
"
"
"
"            UPDATE rework_order_cons_ln
"
"               SET rwocln_qty      = rwocln_qty + (cr5.bomln_required_qty * cr0.rwohd_dis_assemble),
"
"               rwocln_upd_by   = p_user,
"
"               rwocln_upd_date = SYSDATE
"
"             WHERE rwocln_bu       = p_bu
"
"               AND rwocln_plnt     = cr0.rwohd_plnt
"
"               AND rwocln_doc_no   = v_doc_no
"
"               AND rwocln_prod_id  = cr5.bomln_prod_id
"
"               AND rwocln_prod_rev = cr5.bomln_prod_rev
"
"               AND rwocln_store_id = v_store_id;
"
"
"
"            IF SQL%NOTFOUND THEN
"
"
"
"               INSERT INTO rework_order_cons_ln (rwocln_bu       ,
"
"                             rwocln_plnt       ,
"
"                             rwocln_doc_no       ,
"
"                             rwocln_seq_no       ,
"
"                             rwocln_prod_id    ,
"
"                             rwocln_prod_rev   ,
"
"                             rwocln_uom       ,
"
"                             rwocln_qty       ,
"
"                             rwocln_cons_type  ,
"
"                             rwocln_narration  ,
"
"                             rwocln_oprn_id    ,
"
"                             rwocln_unit_cost  ,
"
"                             rwocln_store_id   ,
"
"                             rwocln_cre_by       ,
"
"                             rwocln_cre_date   ,
"
"                             rwocln_mat_type   ,
"
"                             rwocln_source_id  ,
"
"                             rwocln_source_type,
"
"                             rwocln_cre_emp_id,
"
"                             rwocln_cre_ip_addr,
"
"                             rwocln_cre_os_user)
"
"                          VALUES(p_bu           ,
"
"                             cr0.rwohd_plnt       ,
"
"                             v_doc_no       ,
"
"                             v_dis_ass_seq_no  ,
"
"                             cr5.bomln_prod_id ,
"
"                             cr5.bomln_prod_rev,
"
"                             func_find_product_uom(p_bu, cr5.bomln_prod_id, cr5.bomln_prod_rev),
"
"                             cr5.bomln_required_qty * cr0.rwohd_dis_assemble,
"
"                             'AC'             ,
"
"                             'REWORK DISASSEMBLE',
"
"                             NULL           ,
"
"                             func_find_unitcost(p_bu, cr5.bomln_prod_id, cr5.bomln_prod_rev, v_store_id),
"
"                             v_store_id       ,
"
"                             p_user            ,
"
"                             SYSDATE       ,
"
"                             'S'           ,
"
"                             v_store_id       ,
"
"                             'W'        ,
"
"                             func_find_emp_id(p_bu,p_user)    ,
"
"                                 audit_info.get_ip_address    ,
"
"                                 audit_info.get_os_user  );
"
"
"
"               IF func_find_prod_ser_lot_type(p_bu, cr5.bomln_prod_id, cr5.bomln_prod_rev) IN ('L','O') THEN
"
"              v_lot_no := func_find_lot_next_no(p_bu, cr0.rwohd_plnt, TRUNC(p_doc_date), cr5.bomln_prod_id, cr5.bomln_prod_rev);
"
"               END IF;
"
"
"
"               IF func_find_prod_ser_lot_type(p_bu, cr5.bomln_prod_id, cr5.bomln_prod_rev) IN ('S','O') THEN
"
"              v_ser_no := func_find_ser_next_no(p_bu, TRUNC(p_doc_date), cr5.bomln_prod_id, cr5.bomln_prod_rev);
"
"               END IF;
"
"
"
"               proc_gen_rwk_lot_ser_dtls (p_bu,
"
"                                          cr0.rwohd_plnt,
"
"                                          v_doc_no,
"
"                                          v_dis_ass_seq_no,
"
"                                          v_store_id,
"
"                                          cr5.bomln_required_qty * cr0.rwohd_dis_assemble,
"
"                                          v_lot_no,
"
"                                          v_ser_no,
"
"                                          cr5.bomln_required_qty * cr0.rwohd_dis_assemble,
"
"                                          p_user,
"
"                                          'A',
"
"                                          v_result);
"
"            END IF;
"
"
"
"         END LOOP c5;
"
"
"
"          END IF;
"
"
"
"
"
"
"
"          IF cr8.bqac_auto_gen_disass_flag = 'Y' AND cr0.rwohd_dis_assemble > 0 THEN
"
"
"
"         FOR cr5 IN c5(cr0.rwohd_plnt, cr0.rwohd_prod_id, cr0.rwohd_prod_rev)
"
"         LOOP
"
"
"
"            SELECT NVL(MAX(rwocln_seq_no),0) + 1
"
"              INTO v_dis_ass_seq_no
"
"              FROM rework_order_cons_ln
"
"             WHERE rwocln_bu     = p_bu
"
"               AND rwocln_plnt     = cr0.rwohd_plnt
"
"               AND rwocln_doc_no = v_doc_no;
"
"
"
"            v_store_id   := cr5.rouln_cons_store;
"
"            v_disass_qty := cr5.bomln_required_qty * cr0.rwohd_dis_assemble;
"
"
"
"            UPDATE rework_order_cons_ln
"
"               SET rwocln_qty      = rwocln_qty + v_disass_qty,
"
"                   rwocln_upd_by   = p_user,
"
"                   rwocln_upd_date = SYSDATE
"
"             WHERE rwocln_bu       = p_bu
"
"               AND rwocln_plnt     = cr0.rwohd_plnt
"
"               AND rwocln_doc_no   = v_doc_no
"
"               AND rwocln_prod_id  = cr5.bomln_prod_id
"
"               AND rwocln_prod_rev = cr5.bomln_prod_rev
"
"               AND rwocln_store_id = v_store_id;
"
"
"
"            IF SQL%NOTFOUND THEN
"
"
"
"               INSERT INTO rework_order_cons_ln (rwocln_bu       ,
"
"                                                 rwocln_plnt       ,
"
"                                                 rwocln_doc_no       ,
"
"                                                 rwocln_seq_no       ,
"
"                                                 rwocln_prod_id    ,
"
"                                                 rwocln_prod_rev   ,
"
"                                                 rwocln_uom       ,
"
"                                                 rwocln_qty       ,
"
"                                                 rwocln_cons_type  ,
"
"                                                 rwocln_narration  ,
"
"                                                 rwocln_oprn_id    ,
"
"                                                 rwocln_unit_cost  ,
"
"                                                 rwocln_store_id   ,
"
"                                                 rwocln_cre_by       ,
"
"                                                 rwocln_cre_date   ,
"
"                                                 rwocln_mat_type   ,
"
"                                                 rwocln_source_id  ,
"
"                                                 rwocln_source_type,
"
"                                                 rwocln_cre_emp_id,
"
"                                                 rwocln_cre_ip_addr,
"
"                                                 rwocln_cre_os_user)
"
"                                          VALUES(p_bu           ,
"
"                                                 cr0.rwohd_plnt       ,
"
"                                                 v_doc_no       ,
"
"                                                 v_dis_ass_seq_no  ,
"
"                                                 cr5.bomln_prod_id ,
"
"                                                 cr5.bomln_prod_rev,
"
"                                                 func_find_product_uom(p_bu, cr5.bomln_prod_id, cr5.bomln_prod_rev),
"
"                                                 v_disass_qty,
"
"                                                 'AC'             ,
"
"                                                 'REWORK DISASSEMBLE',
"
"                                                 NULL           ,
"
"                                                 func_find_unitcost(p_bu, cr5.bomln_prod_id, cr5.bomln_prod_rev, v_store_id),
"
"                                                 v_store_id       ,
"
"                                                 p_user            ,
"
"                                                 SYSDATE       ,
"
"                                                 'S'           ,
"
"                                                 v_store_id       ,
"
"                                                 'W'    ,
"
"                                                 func_find_emp_id(p_bu,p_user)    ,
"
"                                                   audit_info.get_ip_address    ,
"
"                                                                 audit_info.get_os_user
"
"                                                 );
"
"
"
"               v_disass_rem_qty := v_disass_qty;
"
"
"
"               IF func_find_prod_ser_lot_type(p_bu, cr5.bomln_prod_id, cr5.bomln_prod_rev) IN ('L','S','O') THEN
"
"
"
"                  FOR cr10 IN c10(cr0.rwohd_plnt, cr0.rwohd_prod_ord_no, cr5.bomln_prod_id, cr5.bomln_prod_rev)
"
"                  LOOP
"
"
"
"                     SELECT NVL (MAX (rwolsd_sub_seq_no), 0) + 1
"
"                       INTO v_dis_ass_sub_seq_no
"
"                       FROM rework_order_lot_ser_dtls
"
"                      WHERE rwolsd_bu     = p_bu
"
"                        AND rwolsd_plnt   = cr0.rwohd_plnt
"
"                        AND rwolsd_doc_no = v_doc_no
"
"                        AND rwolsd_seq_no = v_dis_ass_seq_no;
"
"
"
"                     IF cr10.ptcdvw_cons_qty >= v_disass_rem_qty THEN
"
"                        v_disass_lot_qty := v_disass_rem_qty;
"
"                        v_disass_rem_qty := 0;
"
"                     ELSE
"
"                        v_disass_lot_qty := cr10.ptcdvw_cons_qty;
"
"                        v_disass_rem_qty := v_disass_rem_qty - cr10.ptcdvw_cons_qty;
"
"                     END IF;
"
"
"
"                     INSERT INTO rework_order_lot_ser_dtls(rwolsd_bu              ,
"
"                                                           rwolsd_plnt              ,
"
"                                                           rwolsd_doc_no          ,
"
"                                                           rwolsd_seq_no          ,
"
"                                                           rwolsd_sub_seq_no      ,
"
"                                                           rwolsd_sys_ls_no       ,
"
"                                                           rwolsd_lot_no          ,
"
"                                                           rwolsd_ser_no          ,
"
"                                                           rwolsd_qty              ,
"
"                                                           rwolsd_source_type     ,
"
"                                                           rwolsd_source_id       ,
"
"                                                           rwolsd_cre_by          ,
"
"                                                           rwolsd_cre_date       ,
"
"                                                           rwolsd_cre_emp_id,
"
"                                                           rwolsd_cre_ip_addr,
"
"                                                           rwolsd_cre_os_user)
"
"                                                    VALUES(p_bu                  ,
"
"                                                           cr0.rwohd_plnt         ,
"
"                                                           v_doc_no              ,
"
"                                                           v_dis_ass_seq_no       ,
"
"                                                           v_dis_ass_sub_seq_no   ,
"
"                                                           cr10.ptcdvw_sys_ls_no  ,
"
"                                                           cr10.ptcdvw_lot_no     ,
"
"                                                           cr10.ptcdvw_ser_no     ,
"
"                                                           v_disass_lot_qty       ,
"
"                                                           cr10.ptcdvw_source_type,
"
"                                                           cr10.ptcdvw_source_id  ,
"
"                                                           p_user                 ,
"
"                                                           SYSDATE                ,
"
"                                                           func_find_emp_id(p_bu,p_user)    ,
"
"                                                               audit_info.get_ip_address    ,
"
"                                                           audit_info.get_os_user  );
"
"
"
"                     EXIT WHEN v_disass_rem_qty = 0;
"
"
"
"                  END LOOP c10;
"
"
"
"               END IF;
"
"
"
"            END IF;
"
"
"
"          END LOOP c5;
"
"
"
"          END IF;
"
"
"
"          IF cr0.rwohd_ord_type IN ('MT','PS') THEN
"
"
"
"         proc_rework_approve_new(p_bu,
"
"                                 cr0.rwohd_plnt,
"
"                                 v_doc_no,
"
"                                 p_user,
"
"                                 1,
"
"                                 p_result);
"
"
"
"          END IF;
"
"
"
"          v_cnt := v_cnt + 1;
"
"
"
"          IF v_cnt = 1 THEN
"
"                v_res := v_doc_no;
"
"          END IF;
"
"
"
"       END LOOP;
"
"
"
"       END IF;
"
"
"
"       IF v_cnt = 1 THEN
"
"          p_res := v_res;
"
"       ELSE
"
"          p_res := v_res || ' ' ||v_doc_no;
"
"       END IF;
"
"
"
"    END    proc_cre_ser_rwk_comp_rec;
"
"
"
"END pkg_rework_serial_comp;"
/
