CREATE OR REPLACE
"PACKAGE BODY pkg_stk_qc
"
"AS
"
"  PROCEDURE proc_load_stk_frm_insp_rqst(p_bu        VARCHAR2,
"
"                                        p_pln_no    VARCHAR2,
"
"                                        p_store_id    VARCHAR2,
"
"                                        p_ason_date    DATE,
"
"                                        p_user        VARCHAR2,
"
"                                        p_user_emp    VARCHAR2
"
"                                        )
"
"  AS
"
"    v_ip_addr   VARCHAR2 (20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user   VARCHAR2 (50) := Audit_Info.Get_Os_User;
"
"  BEGIN
"
"
"
"    DELETE tqm_qc_plan_temp
"
"     WHERE tqpt_bu = p_bu
"
"       AND tqpt_pln_no = p_pln_no;
"
"
"
"    INSERT INTO tqm_qc_plan_temp(tqpt_bu,
"
"                                 tqpt_pln_no,
"
"                                 tqpt_seq_no,
"
"                                 tqpt_matl_type,
"
"                                 tqpt_store_id,
"
"                                 tqpt_prod_id,
"
"                                 tqpt_prod_rev,
"
"                                 tqpt_prod_desc,
"
"                                 tqpt_prod_uom,
"
"                                 tqpt_sys_ls_no,
"
"                                 tqpt_lot_no,
"
"                                 tqpt_ser_no,
"
"                                 tqpt_sou_type,
"
"                                 tqpt_sou_id,
"
"                                 tqpt_bin_id,
"
"                                 tqpt_so_type,
"
"                                 tqpt_so_pfx,
"
"                                 tqpt_so_no,
"
"                                 tqpt_so_seq_no,
"
"                                 tqpt_proj_id,
"
"                                 tqpt_so_schld_desc,
"
"                                 tqpt_prod_ord_no,
"
"                                 tqpt_sf_code,
"
"                                 tqpt_compld_oprn_seq,
"
"                                 tqpt_compld_proc_id,
"
"                                 tqpt_qty,
"
"                                 tqpt_sel_qty,
"
"                                 tqpt_cre_by,
"
"                                 tqpt_cre_emp_id,
"
"                                 tqpt_cre_ip_addr,
"
"                                 tqpt_cre_os_user,
"
"                                 tqpt_cre_date,
"
"                                 tqpt_prod_cls,
"
"                                 tqpt_prod_sub_cls,
"
"                                 tqpt_prod_grp,
"
"                                 tqpt_prod_sub_grp,
"
"				 tqpt_heat_no,
"
"				 tqpt_test_no,
"
"				 tqpt_expiry_date,
"
"				 tqpt_unit_cost
"
"                                )
"
"                         SELECT p_bu,
"
"                                p_pln_no,
"
"                                ROW_NUMBER () OVER (ORDER BY stock_prod_id) seq_no,
"
"                                stock_matl_type,
"
"                                stock_store_id,
"
"                                stock_prod_id,
"
"                                stock_prod_rev,
"
"                                prod_desc11,
"
"                                prod_uom,
"
"                                stock_sys_ls_no,
"
"                                stock_lot_no,
"
"                                stock_ser_no,
"
"                                stock_source_type,
"
"                                stock_source_id,
"
"                                stock_bin_id,
"
"                                stock_so_type,
"
"                                stock_so_pfx,
"
"                                stock_so_no,
"
"                                stock_so_seq_no,
"
"                                stock_proj_id,
"
"                                stock_so_schld_desc,
"
"                                stock_prod_ord_no,
"
"                                stock_sf_code,
"
"                                stock_compld_oprn_seq,
"
"                                stock_compld_proc_id,
"
"                                Stk_Qty Trans_Qty,
"
"                                0,
"
"                                p_user,
"
"                                p_user_emp,
"
"                                '-',
"
"                                '-',
"
"                                SYSDATE,
"
"                                prod_cls,
"
"                                prod_sub_cls,
"
"                                prod_group_id,
"
"                                prod_subgroup_id,
"
"                                heat_no,
"
"                                test_no,
"
"				expiry_date,
"
"				unit_cost
"
"      FROM(SELECT 'S' stock_matl_type,stock_store_id,stock_prod_id,stock_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,NULL stock_bin_id,
"
"                  'N' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date,NULL unit_cost
"
"             FROM stocks, stores, products
"
"            WHERE stock_bu = store_bu
"
"              AND stock_store_id = store_id
"
"              AND prod_bu = stock_bu
"
"              AND prod_id = stock_prod_id
"
"              AND prod_rev = stock_prod_rev
"
"              AND stock_bu = p_bu
"
"              AND stock_store_id = p_store_id
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              AND (stock_qty_hand - (stock_qty_mi_allocated+stock_qty_picked)) > 0
"
"           UNION ALL
"
"           SELECT 'S' sqoh_matl_type,sqoh_store_id,sqoh_prod_id,sqoh_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,
"
"		  (SELECT binstk_bin_id FROM bin_stocks WHERE binstk_bu = sqoh_bu AND binstk_store_id = sqoh_store_id
"
"		     AND binstk_prod_id = sqoh_prod_id AND binstk_prod_rev = sqoh_prod_rev
"
"		     AND binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked) > 0
"
"		     AND ROWNUM = 1) stock_bin_id,
"
"                  sqoh_type,sqoh_so_ord_pfx,sqoh_so_ord_no,sqoh_seq_no,sqoh_proj_id,sqoh_so_schld_desc,
"
"	          NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (sqoh_so_qty - (sqoh_so_alloc_qty)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date,sqoh_unit_cost unit_cost
"
"             FROM so_qty_on_hand, stores, products
"
"            WHERE sqoh_bu = store_bu
"
"              AND sqoh_store_id = store_id
"
"              AND prod_bu = sqoh_bu
"
"              AND prod_id = sqoh_prod_id
"
"              AND prod_rev = sqoh_prod_rev
"
"              AND sqoh_bu = p_bu
"
"              AND sqoh_store_id = p_store_id
"
"              --AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'I'
"
"              AND (sqoh_so_qty - (sqoh_so_alloc_qty)) > 0
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,NULL lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'N' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (lss_qty_hand - lss_qty_allocated) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date,lss_unit_cost unit_cost
"
"             FROM lot_ser_stocks, stores, products
"
"            WHERE lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"              AND lss_store_id = p_store_id
"
"              AND store_bin_flag = 'N'
"
"              AND prod_ser_lot_opt <> 'N'
"
"              AND (lss_qty_hand - lss_qty_allocated) > 0
"
"	      AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"	   UNION ALL
"
"           SELECT 'S' stock_matl_type,binstk_store_id,binstk_prod_id,binstk_prod_rev,prod_desc11,prod_uom,
"
"                  NULL stock_sys_ls_no,NULL stock_lot_no,NULL stock_ser_no,NULL stock_source_type,NULL stock_source_id,binstk_bin_id stock_bin_id,
"
"                  'N' stock_so_type,NULL stock_so_pfx,NULL stock_so_no,NULL stock_so_seq_no,NULL stock_proj_id,NULL stock_so_schld_desc,
"
"                  NULL stock_prod_ord_no,NULL stock_sf_code,NULL stock_compld_oprn_seq,NULL stock_compld_proc_id,
"
"                  (binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,NULL heat_no,NULL test_no,NULL expiry_date,NULL unit_cost
"
"             FROM bin_stocks, stores, products
"
"            WHERE binstk_bu = store_bu
"
"              AND binstk_store_id = store_id
"
"              AND prod_bu = binstk_bu
"
"              AND prod_id = binstk_prod_id
"
"              AND prod_rev = binstk_prod_rev
"
"              AND binstk_bu = p_bu
"
"              AND binstk_store_id = p_store_id
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt = 'N'
"
"	      AND prod_indicator = 'N'
"
"              AND (binstk_bin_qoh - (binstk_qty_allocated+binstk_qty_picked)) > 0
"
"           UNION ALL
"
"           SELECT 'S' lss_matl_type,lss_store_id,lss_prod_id,lss_prod_rev,prod_desc11,prod_uom,lss_sys_ls_no,
"
"                  lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,bsld_bin_id lss_bin_id,CASE WHEN lss_so_no IS NOT NULL THEN 'SO' ELSE 'N' END lss_so_type,lss_so_pfx,
"
"                  lss_so_no,lss_so_seq_no,NULL lss_proj_id,lss_so_ref,
"
"                  NULL lss_prod_ord_no,NULL lss_sf_code,NULL lss_compld_oprn_seq,NULL lss_compld_proc_id,
"
"                  (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) Stk_Qty,
"
"                  prod_cls,prod_sub_cls,prod_group_id,prod_subgroup_id,lss_heat_no,lss_test_no,lss_expiry_date,lss_unit_cost unit_cost
"
"             FROM lot_ser_stocks,bin_serial_lot_details, stores, products
"
"            WHERE lss_bu = bsld_bu
"
"	      AND lss_store_id = bsld_store_id
"
"	      AND lss_prod_id = bsld_prod_id
"
"	      AND lss_prod_rev = bsld_prod_rev
"
"	      AND lss_sys_ls_no = bsld_sys_ls_no
"
"	      AND lss_bu = store_bu
"
"              AND lss_store_id = store_id
"
"              AND prod_bu = lss_bu
"
"              AND prod_id = lss_prod_id
"
"              AND prod_rev = lss_prod_rev
"
"              AND lss_bu = p_bu
"
"              AND lss_store_id = p_store_id
"
"              AND store_bin_flag = 'Y'
"
"              AND prod_ser_lot_opt <> 'N'
"
"	      AND bsld_sf_code IS NULL
"
"              AND (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) > 0
"
"	      AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"          ) t1;
"
"
"
"   END proc_load_stk_frm_insp_rqst;
"
"
"
"  PROCEDURE proc_ins_rqst_frm_insp_rqst(p_bu		VARCHAR2,
"
"                                        p_pln_no	VARCHAR2,
"
"					p_user		VARCHAR2,
"
"					p_user_emp	VARCHAR2
"
"				       )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM tqm_qc_plan_temp,stores,products
"
"   WHERE tqpt_bu = store_bu
"
"     AND tqpt_store_id = store_id
"
"     AND prod_bu = tqpt_bu
"
"     AND prod_id = tqpt_prod_id
"
"     AND prod_rev = tqpt_prod_rev
"
"     AND tqpt_bu = p_bu
"
"     AND tqpt_pln_no = p_pln_no
"
"     AND tqpt_sel_flag = 'Y'
"
"     AND tqpt_sel_user = p_user;
"
"
"
"    v_seq_no        NUMBER;
"
"    v_sub_seq_no    NUMBER;
"
"
"
"    v_rcpt_unitcost    NUMBER(17,5);
"
"
"
"    v_cb_bal_qty	NUMBER(12,3);
"
"    v_cb_upd_qty	NUMBER(12,3);
"
"
"
"  BEGIN
"
"
"
"    FOR r_hd IN (SELECT *
"
"                   FROM tqm_qc_plan_hd
"
"          WHERE tqphd_bu = p_bu
"
"            AND tqphd_pln_no = p_pln_no)
"
"    LOOP
"
"
"
"      SELECT NVL(MAX(tqpln_seq_no),0) INTO v_seq_no
"
"        FROM tqm_qc_plan_ln
"
"       WHERE tqpln_bu = p_bu
"
"         AND tqpln_pln_no = p_pln_no;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      UPDATE tqm_qc_plan_ln
"
"         SET tqpln_receipt_qty = tqpln_receipt_qty + cr1.tqpt_sel_qty,
"
"	     tqpln_stk_receipt_qty = tqpln_stk_receipt_qty + cr1.tqpt_sel_qty
"
"       WHERE tqpln_bu = p_bu
"
"         AND tqpln_pln_no = p_pln_no
"
"	 AND tqpln_prod_id = cr1.tqpt_prod_id
"
"	 AND tqpln_prod_rev = cr1.tqpt_prod_rev
"
"      RETURNING tqpln_seq_no INTO v_seq_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"        v_seq_no := v_seq_no + 1;
"
"
"
"        INSERT INTO tqm_qc_plan_ln(tqpln_bu,
"
"                                   tqpln_pln_no,
"
"                                   tqpln_seq_no,
"
"                                   tqpln_mat_type,
"
"                                   tqpln_prod_id,
"
"                                   tqpln_prod_rev,
"
"                                   tqpln_prod_desc1,
"
"                                   tqpln_uom,
"
"                                   tqpln_prod_uom,
"
"                                   tqpln_conv_factor,
"
"                                   tqpln_receipt_qty,
"
"                                   tqpln_stk_receipt_qty,
"
"                                   tqpln_status,
"
"                                   tqpln_insp_mode,
"
"                                   tqpln_qc_oper,
"
"                                   tqpln_prod_ord_no,
"
"                                   tqpln_sf_code,
"
"                                   tqpln_sou_oprn_seq,
"
"                                   tqpln_sou_proc_id,
"
"                                   tqpln_tar_oprn_seq,
"
"                                   tqpln_tar_proc_id,
"
"                                   tqpln_sou_sf_code,
"
"                                   tqpln_so_type,
"
"                                   tqpln_so_no,
"
"                                   tqpln_so_seq_no,
"
"                                   tqpln_proj_id,
"
"                                   tqpln_so_schld_desc,
"
"                                   tqpln_store_id,
"
"                                   tqpln_cre_by,
"
"                                   tqpln_cre_date,
"
"                                   tqpln_prod_cls,
"
"                                   tqpln_prod_cls_desc,
"
"                                   tqpln_prod_subcls,
"
"                                   tqpln_prod_subcls_desc,
"
"                                   tqpln_prod_grp,
"
"                                   tqpln_prod_grp_desc,
"
"                                   tqpln_prod_subgrp,
"
"                                   tqpln_prod_subgrp_desc,
"
"                                   tqpln_vou_no,
"
"                                   tqpln_vou_line_no,
"
"                                   tqpln_vou_appl,
"
"                                   tqpln_vou_type,
"
"				   tqpln_unit_cost
"
"                                  )
"
"                            VALUES(p_bu,
"
"                                   p_pln_no,
"
"                                   v_seq_no,
"
"                                   'PR',--cr1.tqpt_matl_type,
"
"                                   cr1.tqpt_prod_id,
"
"                                   cr1.tqpt_prod_rev,
"
"                                   cr1.tqpt_prod_desc,
"
"                                   cr1.tqpt_prod_uom,
"
"                                   cr1.tqpt_prod_uom,
"
"                                    1,
"
"                                   cr1.tqpt_sel_qty,
"
"                                   cr1.tqpt_sel_qty,
"
"                                   'N',
"
"                                   (SELECT tqphd_insp_mode FROM tqm_qc_plan_hd WHERE tqphd_bu = p_bu AND tqphd_pln_no = p_pln_no),
"
"                                   'W',
"
"                                   cr1.tqpt_prod_ord_no,
"
"                                   cr1.tqpt_sf_code,
"
"                                   cr1.tqpt_compld_oprn_seq,
"
"                                   cr1.tqpt_compld_proc_id,
"
"                                   cr1.tqpt_compld_oprn_seq,
"
"                                   cr1.tqpt_compld_proc_id,
"
"                                   cr1.tqpt_sf_code,
"
"                                   cr1.tqpt_so_type,
"
"                                   cr1.tqpt_so_no,
"
"                                   cr1.tqpt_so_seq_no,
"
"                                   cr1.tqpt_proj_id,
"
"                                   cr1.tqpt_so_schld_desc,
"
"                                   cr1.tqpt_store_id,
"
"                                   p_user,
"
"                                   SYSDATE,
"
"                                   cr1.tqpt_prod_cls,
"
"                                   cr1.tqpt_prod_cls_desc,
"
"                                   cr1.tqpt_prod_sub_cls,
"
"                                   cr1.tqpt_prod_sub_cls_desc,
"
"                                   cr1.tqpt_prod_grp,
"
"                                   cr1.tqpt_prod_grp_desc,
"
"                                   cr1.tqpt_prod_sub_grp,
"
"                                   cr1.tqpt_prod_sub_grp_desc,
"
"                                   p_pln_no,
"
"                                   v_seq_no,
"
"                                   'TQM',
"
"                                   'IR',
"
"				   cr1.tqpt_unit_cost
"
"                                  );
"
"      END IF;
"
"
"
"      UPDATE tqm_qc_plan_lot_serial_dtls
"
"         SET tqplsd_lot_qty = tqplsd_lot_qty + cr1.tqpt_sel_qty,
"
"	     tqplsd_proc_qty = tqplsd_proc_qty + cr1.tqpt_sel_qty,
"
"	     tqplsd_stk_rcpt_qty = tqplsd_stk_rcpt_qty + cr1.tqpt_sel_qty
"
"       WHERE tqplsd_bu = p_bu
"
"         AND tqplsd_pln_no = p_pln_no
"
"         AND tqplsd_seq_no = v_seq_no
"
"         AND (tqplsd_sys_ls_no = cr1.tqpt_sys_ls_no OR (tqplsd_sys_ls_no IS NULL AND cr1.tqpt_sys_ls_no IS NULL));
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"	SELECT NVL(MAX(tqplsd_sub_seq_no),0) + 1 INTO v_sub_seq_no
"
"          FROM tqm_qc_plan_lot_serial_dtls
"
"         WHERE tqplsd_bu = p_bu
"
"           AND tqplsd_pln_no = p_pln_no
"
"           AND tqplsd_seq_no = v_seq_no;
"
"
"
"        INSERT INTO tqm_qc_plan_lot_serial_dtls(tqplsd_bu,
"
"                                                tqplsd_pln_no,
"
"                                                tqplsd_seq_no,
"
"                                                tqplsd_sub_seq_no,
"
"                                                tqplsd_lot_type,
"
"                                                tqplsd_sys_ls_no,
"
"                                                tqplsd_lot_no,
"
"                                                tqplsd_serial_no,
"
"                                                tqplsd_source_type,
"
"                                                tqplsd_source_id,
"
"                                                tqplsd_bin_id,
"
"                                                tqplsd_lot_qty,
"
"                                                tqplsd_proc_qty,
"
"                                                tqplsd_stk_rcpt_qty,
"
"                                                tqplsd_expiry_date,
"
"                                                tqplsd_cre_by,
"
"                                                tqplsd_cre_date,
"
"					        tqplsd_heat_no,
"
"                                                tqplsd_test_no,
"
"						tqplsd_unit_cost
"
"                                               )
"
"                                         VALUES(p_bu,
"
"                                                p_pln_no,
"
"                                                v_seq_no,
"
"                                                v_sub_seq_no,
"
"                                                (SELECT prod_ser_lot_opt FROM products WHERE prod_bu = p_bu AND prod_id = cr1.tqpt_prod_id AND prod_rev = cr1.tqpt_prod_rev),
"
"                                                cr1.tqpt_sys_ls_no,
"
"                                                cr1.tqpt_lot_no,
"
"                                                cr1.tqpt_ser_no,
"
"                                                cr1.tqpt_sou_type,
"
"                                                cr1.tqpt_sou_id,
"
"                                                cr1.tqpt_bin_id,
"
"                                                cr1.tqpt_sel_qty,
"
"                                                cr1.tqpt_sel_qty,
"
"                                                cr1.tqpt_sel_qty,
"
"                                                cr1.tqpt_expiry_date,
"
"                                                p_user,
"
"                                                SYSDATE,
"
"					        cr1.tqpt_heat_no,
"
"					        cr1.tqpt_test_no,
"
"						cr1.tqpt_unit_cost
"
"                                               );
"
"      END IF;
"
"
"
"      v_rcpt_unitcost := func_find_unitcost(p_bu,cr1.tqpt_prod_id,cr1.tqpt_prod_rev,cr1.tqpt_store_id);
"
"
"
"      proc_upd_stocks(p_bu,
"
"                  cr1.tqpt_store_id,
"
"                  NULL,
"
"                  cr1.tqpt_prod_id,
"
"                  cr1.tqpt_prod_rev,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  cr1.tqpt_sel_qty,
"
"                  v_rcpt_unitcost,
"
"                  v_rcpt_unitcost,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  0,
"
"                  v_seq_no,
"
"                  0,
"
"                  NULL,
"
"                  p_pln_no,
"
"                  NULL,
"
"                  NULL,
"
"                  NULL,
"
"                  r_hd.tqphd_pln_year,
"
"                  r_hd.tqphd_pln_period,
"
"                  r_hd.tqphd_pln_date,
"
"                  NULL,
"
"                  'TQM',
"
"                  'QC',
"
"                  NULL,
"
"                  p_user,
"
"                  SYSDATE,
"
"                  NULL,
"
"                  cr1.tqpt_prod_cls,
"
"                  NULL,
"
"                  NULL,
"
"                  NULL,
"
"                  NULL,
"
"                  0,
"
"                  p_prod_cls_desc => cr1.tqpt_prod_cls_desc,
"
"                  p_prod_sub_cls_id => cr1.tqpt_prod_sub_cls,
"
"                  p_prod_sub_cls_desc => cr1.tqpt_prod_sub_cls_desc,
"
"                  p_prod_grp_id => cr1.tqpt_prod_grp,
"
"                  p_prod_grp_desc    => cr1.tqpt_prod_grp_desc,
"
"                  p_prod_sub_grp_id => cr1.tqpt_prod_sub_grp,
"
"                  p_prod_sub_grp_desc => cr1.tqpt_prod_sub_grp_desc
"
"                 );
"
"
"
"        IF cr1.tqpt_so_no IS NOT NULL OR cr1.tqpt_proj_id IS NOT NULL THEN
"
"
"
"          proc_upd_so_stocks(p_bu,
"
"                             cr1.tqpt_store_id,
"
"                             cr1.tqpt_prod_id,
"
"                             cr1.tqpt_prod_rev,
"
"                             0,
"
"                             cr1.tqpt_sel_qty,
"
"                             v_rcpt_unitcost,
"
"                             cr1.tqpt_so_pfx,
"
"                             cr1.tqpt_so_no,
"
"                             cr1.tqpt_so_seq_no,
"
"                             NULL,
"
"                             r_hd.tqphd_pln_date,
"
"                             'QC',
"
"                             NULL,
"
"                             p_pln_no,
"
"                             NULL,
"
"                             NULL,
"
"                             p_pln_no,
"
"                             v_seq_no,
"
"                             'QC',
"
"                             'TQM',
"
"                             'STOCK QC',
"
"                             'STOCK QC',
"
"                             p_user,
"
"                             cr1.tqpt_so_type,
"
"                             cr1.tqpt_proj_id,
"
"			     p_so_prj_schld_desc => cr1.tqpt_so_no
"
"                            );
"
"
"
"      END IF;
"
"
"
"      IF cr1.prod_ser_lot_opt = 'N' AND cr1.store_bin_flag = 'Y' THEN
"
"
"
"        proc_upd_bin_stocks(p_bu,
"
"			    cr1.tqpt_store_id,
"
"			    cr1.tqpt_prod_id,
"
"			    cr1.tqpt_prod_rev,
"
"			    cr1.tqpt_bin_id,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    0,
"
"			    cr1.tqpt_sel_qty,
"
"			    0,
"
"			    0,
"
"			    v_rcpt_unitcost,
"
"			    TRUNC(r_hd.tqphd_pln_date),
"
"			    'QC',
"
"			    NULL,
"
"			    p_pln_no,
"
"			    v_seq_no,
"
"			    'TQM',
"
"			    p_user,
"
"			    p_crate_id => NULL,
"
"			    p_prod_ord_no => NULL,
"
"			    p_sf_code => NULL
"
"			   );
"
"
"
"      END IF;
"
"
"
"      IF cr1.prod_ser_lot_opt <> 'N' THEN
"
"
"
"        proc_upd_lot_ser_stocks(p_bu,
"
"                                cr1.tqpt_store_id,
"
"                                cr1.tqpt_prod_id,
"
"                                cr1.tqpt_prod_rev,
"
"                                cr1.tqpt_sys_ls_no,
"
"                                0,
"
"                                cr1.tqpt_sel_qty,
"
"                                0,
"
"                                v_rcpt_unitcost,
"
"				cr1.prod_ser_lot_opt,
"
"                                cr1.tqpt_lot_no,
"
"                                cr1.tqpt_ser_no,
"
"                                cr1.tqpt_sou_type,
"
"                                cr1.tqpt_sou_id,
"
"                                CASE WHEN cr1.prod_expr_flag = 'Y' THEN cr1.tqpt_expiry_date ELSE NULL END,
"
"                                TRUNC(r_hd.tqphd_pln_date),
"
"                                'QC',
"
"                                NULL,
"
"                                p_pln_no,
"
"                                v_seq_no,
"
"                                'TQM',
"
"                                'STOCK QC',
"
"                                'STOCK QC',
"
"                                p_user
"
"                               );
"
"
"
"        IF cr1.store_bin_flag = 'Y' THEN
"
"
"
"	  proc_upd_bin_stocks(p_bu,
"
"			      cr1.tqpt_store_id,
"
"			      cr1.tqpt_prod_id,
"
"			      cr1.tqpt_prod_rev,
"
"			      cr1.tqpt_bin_id,
"
"			      cr1.tqpt_sys_ls_no,
"
"			      cr1.tqpt_lot_no,
"
"			      cr1.tqpt_ser_no,
"
"			      cr1.tqpt_sou_type,
"
"			      cr1.tqpt_sou_id,
"
"			      0,
"
"			      cr1.tqpt_sel_qty,
"
"			      0,
"
"			      0,
"
"			      v_rcpt_unitcost,
"
"			      TRUNC(r_hd.tqphd_pln_date),
"
"			      'QC',
"
"			      NULL,
"
"			      p_pln_no,
"
"			      v_seq_no,
"
"			      'TQM',
"
"			      p_user,
"
"			      p_crate_id => NULL,
"
"			      p_prod_ord_no => NULL,
"
"			      p_sf_code => NULL
"
"			     );
"
"
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"    IF cr1.prod_cost_method <> 'MAC' AND (cr1.prod_ser_lot_opt = 'N' OR cr1.prod_cb_level <> 'L') THEN
"
"
"
"      v_cb_bal_qty := cr1.tqpt_sel_qty;
"
"
"
"      SELECT NVL(MAX(tqpcb_sub_seq_no),0) INTO v_sub_seq_no
"
"        FROM tqm_qc_plan_cost_batch
"
"       WHERE tqpcb_bu = p_bu
"
"         AND tqpcb_pln_no = p_pln_no
"
"	 AND tqpcb_seq_no = v_seq_no;
"
"
"
"      FOR r_cb IN (SELECT sb_batch_id,sb_bc_unit_cost,SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) stk_qty
"
"                     FROM stocks_batches
"
"                    WHERE sb_bu = p_bu
"
"                      AND sb_store_id = cr1.tqpt_store_id
"
"                      AND sb_prod_id = cr1.tqpt_prod_id
"
"                      AND sb_prod_rev = cr1.tqpt_prod_rev
"
"                      AND TRUNC(sb_trans_date) <= r_hd.tqphd_pln_date
"
"                    GROUP BY sb_batch_id,sb_bc_unit_cost,sb_cost_method
"
"                   HAVING SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                    ORDER BY DECODE(sb_cost_method,'FIFO',sb_batch_id,NULL) ASC,DECODE(sb_cost_method,'LIFO',sb_batch_id,NULL) DESC)
"
"      LOOP
"
"
"
"	v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	IF v_cb_bal_qty > r_cb.stk_qty THEN
"
"          v_cb_upd_qty := r_cb.stk_qty;
"
"          v_cb_bal_qty := v_cb_bal_qty - r_cb.stk_qty;
"
"        ELSE
"
"          v_cb_upd_qty := v_cb_bal_qty;
"
"          v_cb_bal_qty := 0;
"
"        END IF;
"
"
"
"        proc_upd_stock_batches(p_bu,
"
"			       cr1.tqpt_store_id,
"
"			       cr1.tqpt_prod_id,
"
"			       cr1.tqpt_prod_rev,
"
"			       r_cb.sb_batch_id,
"
"			       0,
"
"			       0,
"
"			       v_cb_upd_qty,
"
"			       0,
"
"			       r_cb.sb_bc_unit_cost,
"
"			       r_cb.sb_bc_unit_cost,
"
"			       0,
"
"			       0,
"
"			       0,
"
"			       0,
"
"			       'N',
"
"			       r_hd.tqphd_pln_date,
"
"			       NULL,
"
"			       p_pln_no,
"
"			       v_seq_no,
"
"			       'MI',
"
"			       NULL,
"
"			       p_pln_no,
"
"			       v_seq_no,
"
"			       NULL,
"
"			       cr1.tqpt_prod_cls,
"
"			       'QC',
"
"			       'ICM',
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       p_user,
"
"			       p_prod_cls_desc => cr1.tqpt_prod_cls_desc,
"
"			       p_prod_subcls => cr1.tqpt_prod_sub_cls,
"
"			       p_prod_subcls_desc => cr1.tqpt_prod_sub_cls_desc,
"
"			       p_prod_grp => cr1.tqpt_prod_grp,
"
"			       p_prod_grp_desc => cr1.tqpt_prod_grp_desc,
"
"			       p_prod_subgrp => cr1.tqpt_prod_sub_grp,
"
"			       p_prod_subgrp_desc => cr1.tqpt_prod_sub_grp_desc
"
"    	                      );
"
"
"
"        INSERT INTO tqm_qc_plan_cost_batch(tqpcb_bu,
"
"                                           tqpcb_pln_no,
"
"                                           tqpcb_seq_no,
"
"                                           tqpcb_sub_seq_no,
"
"                                           tqpcb_batch_no,
"
"                                           tqpcb_sys_ls_no,
"
"                                           tqpcb_insp_qty,
"
"                                           tqpcb_unit_cost,
"
"                                           tqpcb_cre_by,
"
"                                           tqpcb_cre_emp_id,
"
"                                           tqpcb_cre_ip_addr,
"
"                                           tqpcb_cre_os_user,
"
"                                           tqpcb_cre_date
"
"                                          )
"
"	                            VALUES(p_bu,
"
"				           p_pln_no,
"
"					   v_seq_no,
"
"					   v_sub_seq_no,
"
"					   r_cb.sb_batch_id,
"
"					   cr1.tqpt_sys_ls_no,
"
"					   v_cb_upd_qty,
"
"					   r_cb.sb_bc_unit_cost,
"
"					   p_user,
"
"					   p_user_emp,
"
"					   '-',
"
"					   '-',
"
"					   SYSDATE
"
"					  );
"
"
"
"	EXIT WHEN v_cb_bal_qty = 0;
"
"      END LOOP;
"
"
"
"   END IF;
"
"
"
"   IF cr1.prod_cost_method <> 'MAC' AND cr1.prod_cb_level = 'L' THEN
"
"
"
"        v_cb_bal_qty := cr1.tqpt_sel_qty;
"
"
"
"        SELECT NVL(MAX(tqpcb_sub_seq_no),0) INTO v_sub_seq_no
"
"          FROM tqm_qc_plan_cost_batch
"
"         WHERE tqpcb_bu = p_bu
"
"           AND tqpcb_pln_no = p_pln_no
"
"	   AND tqpcb_seq_no = v_seq_no;
"
"
"
"	 FOR r_cb IN(SELECT sb_batch_id,sb_bc_unit_cost,
"
"		            SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) stk_qty,
"
"			    sb_grn_bill_no,sb_grn_bill_date
"
"                       FROM stocks_batches
"
"                      WHERE sb_bu = p_bu
"
"			AND sb_store_id = cr1.tqpt_store_id
"
"			AND sb_prod_id = cr1.tqpt_prod_id
"
"			AND sb_prod_rev = cr1.tqpt_prod_rev
"
"			AND EXISTS(SELECT 1
"
"				     FROM ls_stk_batch_dtls
"
"				    WHERE lssbd_bu = sb_bu
"
"				      AND lssbd_store_id = sb_store_id
"
"			              AND lssbd_prod_id = sb_prod_id
"
"			              AND lssbd_prod_rev = sb_prod_rev
"
"			              AND lssbd_sys_ls_no = cr1.tqpt_sys_ls_no
"
"			              AND lssbd_batch_no = sb_batch_id)
"
"		        AND (sb_qty_in - sb_qty_out) > 0
"
"                     GROUP BY sb_batch_id,sb_bc_unit_cost,sb_cost_method,sb_grn_bill_no,sb_grn_bill_date
"
"                     HAVING SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                     ORDER BY DECODE(sb_cost_method,'FIFO',sb_batch_id,NULL) ASC,DECODE(sb_cost_method,'LIFO',sb_batch_id,NULL) DESC)
"
"         LOOP
"
"
"
"	     v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	     IF v_cb_bal_qty > r_cb.stk_qty THEN
"
"                v_cb_upd_qty := r_cb.stk_qty;
"
"                v_cb_bal_qty := v_cb_bal_qty - r_cb.stk_qty;
"
"             ELSE
"
"                v_cb_upd_qty := v_cb_bal_qty;
"
"                v_cb_bal_qty := 0;
"
"             END IF;
"
"
"
"	     proc_upd_stock_batches(p_bu,
"
"			            cr1.tqpt_store_id,
"
"			            cr1.tqpt_prod_id,
"
"			            cr1.tqpt_prod_rev,
"
"			            r_cb.sb_batch_id,
"
"			            0,
"
"			            0,
"
"			            v_cb_upd_qty,
"
"			            0,
"
"			            r_cb.sb_bc_unit_cost,
"
"			            r_cb.sb_bc_unit_cost,
"
"			            0,
"
"			            0,
"
"			            0,
"
"			            0,
"
"			            'N',
"
"			            r_hd.tqphd_pln_date,
"
"			            NULL,
"
"			            p_pln_no,
"
"			            v_seq_no,
"
"			            'MI',
"
"			            NULL,
"
"			            p_pln_no,
"
"			            v_seq_no,
"
"			            NULL,
"
"			            cr1.tqpt_prod_cls,
"
"			            'QC',
"
"			            'ICM',
"
"			            NULL,
"
"			            NULL,
"
"			            NULL,
"
"			            NULL,
"
"			            p_user,
"
"			            p_prod_cls_desc => cr1.tqpt_prod_cls_desc,
"
"			            p_prod_subcls => cr1.tqpt_prod_sub_cls,
"
"			            p_prod_subcls_desc => cr1.tqpt_prod_sub_cls_desc,
"
"			            p_prod_grp => cr1.tqpt_prod_grp,
"
"			            p_prod_grp_desc => cr1.tqpt_prod_grp_desc,
"
"			            p_prod_subgrp => cr1.tqpt_prod_sub_grp,
"
"			            p_prod_subgrp_desc => cr1.tqpt_prod_sub_grp_desc
"
"    	                            );
"
"
"
"
"
"             INSERT INTO tqm_qc_plan_cost_batch(tqpcb_bu,
"
"                                                tqpcb_pln_no,
"
"                                                tqpcb_seq_no,
"
"                                                tqpcb_sub_seq_no,
"
"                                                tqpcb_batch_no,
"
"                                                tqpcb_sys_ls_no,
"
"                                                tqpcb_insp_qty,
"
"                                                tqpcb_unit_cost,
"
"                                                tqpcb_cre_by,
"
"                                                tqpcb_cre_emp_id,
"
"                                                tqpcb_cre_ip_addr,
"
"                                                tqpcb_cre_os_user,
"
"                                                tqpcb_cre_date
"
"                                                )
"
"	                                 VALUES(p_bu,
"
"				                p_pln_no,
"
"					        v_seq_no,
"
"					        v_sub_seq_no,
"
"					        r_cb.sb_batch_id,
"
"					        cr1.tqpt_sys_ls_no,
"
"					        v_cb_upd_qty,
"
"					        r_cb.sb_bc_unit_cost,
"
"					        p_user,
"
"					        p_user_emp,
"
"					        '-',
"
"					        '-',
"
"					        SYSDATE
"
"					        );
"
"
"
"	    EXIT WHEN v_cb_bal_qty = 0;
"
"
"
"         END LOOP;
"
"
"
"      IF v_cb_bal_qty > 0 THEN
"
"        Raise_Application_Error(-20999,'Cost Batch not Available.');
"
"      END IF;
"
"
"
"      END IF;
"
"
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"  END proc_ins_rqst_frm_insp_rqst;
"
"
"
"  PROCEDURE proc_can_rqst_frm_insp_rqst(p_bu        VARCHAR2,
"
"                                        p_pln_no    VARCHAR2,
"
"                                        p_pln_seq    NUMBER,
"
"                                        p_user        VARCHAR2,
"
"                                        p_user_emp    VARCHAR2
"
"                                        )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM tqm_qc_plan_ln,stores,products
"
"   WHERE store_bu = tqpln_bu
"
"     AND store_id = tqpln_store_id
"
"     AND prod_bu = tqpln_bu
"
"     AND prod_id = tqpln_prod_id
"
"     AND prod_rev = tqpln_prod_rev
"
"     AND tqpln_bu = p_bu
"
"     AND tqpln_pln_no = p_pln_no
"
"     AND (tqpln_seq_no = p_pln_seq OR p_pln_seq IS NULL)
"
"     AND tqpln_status = 'N';
"
"
"
"    v_rcpt_unitcost    NUMBER(17,5);
"
"
"
"  BEGIN
"
"
"
"    FOR r_hd IN (SELECT *
"
"                   FROM tqm_qc_plan_hd
"
"                  WHERE tqphd_bu = p_bu
"
"                    AND tqphd_pln_no = p_pln_no)
"
"    LOOP
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        v_rcpt_unitcost := func_find_unitcost(p_bu,cr1.tqpln_prod_id,cr1.tqpln_prod_rev,cr1.tqpln_store_id);
"
"
"
"        proc_upd_stocks(p_bu,
"
"                    cr1.tqpln_store_id,
"
"                    NULL,
"
"                    cr1.tqpln_prod_id,
"
"                    cr1.tqpln_prod_rev,
"
"                    0,
"
"                    0,
"
"                    0,
"
"                    0,
"
"                    -cr1.tqpln_receipt_qty,
"
"                    v_rcpt_unitcost,
"
"                    v_rcpt_unitcost,
"
"                    0,
"
"                    0,
"
"                    0,
"
"                    0,
"
"                    0,
"
"                    cr1.tqpln_seq_no,
"
"                    0,
"
"                    NULL,
"
"                    p_pln_no,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    r_hd.tqphd_pln_year,
"
"                    r_hd.tqphd_pln_period,
"
"                    r_hd.tqphd_pln_date,
"
"                    NULL,
"
"                    'TQM',
"
"                    'QC',
"
"                    NULL,
"
"                    p_user,
"
"                    SYSDATE,
"
"                    NULL,
"
"                    cr1.tqpln_prod_cls,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    0,
"
"                p_prod_cls_desc => cr1.tqpln_prod_cls_desc,
"
"                p_prod_sub_cls_id => cr1.tqpln_prod_subcls,
"
"                p_prod_sub_cls_desc => cr1.tqpln_prod_subcls_desc,
"
"                p_prod_grp_id => cr1.tqpln_prod_grp,
"
"                p_prod_grp_desc    => cr1.tqpln_prod_grp_desc,
"
"                p_prod_sub_grp_id => cr1.tqpln_prod_subgrp,
"
"                p_prod_sub_grp_desc => cr1.tqpln_prod_subgrp_desc
"
"                   );
"
"
"
"        IF cr1.tqpln_so_no IS NOT NULL OR cr1.tqpln_proj_id IS NOT NULL THEN
"
"
"
"      proc_upd_so_stocks(p_bu,
"
"                       cr1.tqpln_store_id,
"
"                       cr1.tqpln_prod_id,
"
"                       cr1.tqpln_prod_rev,
"
"                       0,
"
"                       -cr1.tqpln_receipt_qty,
"
"                       v_rcpt_unitcost,
"
"                       NULL,
"
"                       cr1.tqpln_so_no,
"
"                       cr1.tqpln_so_seq_no,
"
"                       NULL,
"
"                       r_hd.tqphd_pln_date,
"
"                       'QC',
"
"                       NULL,
"
"                       p_pln_no,
"
"                       NULL,
"
"                       NULL,
"
"                       p_pln_no,
"
"                       cr1.tqpln_seq_no,
"
"                       'QC',
"
"                       'TQM',
"
"                       'STOCK QC',
"
"                       'STOCK QC',
"
"                       p_user,
"
"                       cr1.tqpln_so_type,
"
"                       cr1.tqpln_proj_id,
"
"                       NULL
"
"                      );
"
"    END IF;
"
"
"
"      IF cr1.prod_ser_lot_opt = 'N' AND cr1.store_bin_flag = 'Y' THEN
"
"
"
"      FOR r_ls IN (SELECT *
"
"                     FROM tqm_qc_plan_lot_serial_dtls
"
"                    WHERE tqplsd_bu = p_bu
"
"                      AND tqplsd_pln_no = p_pln_no
"
"                      AND tqplsd_seq_no = cr1.tqpln_seq_no
"
"                   ORDER BY tqplsd_sub_seq_no)
"
"      LOOP
"
"
"
"        proc_upd_bin_stocks(p_bu,
"
"			    cr1.tqpln_store_id,
"
"			    cr1.tqpln_prod_id,
"
"			    cr1.tqpln_prod_rev,
"
"			    r_ls.tqplsd_bin_id,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    0,
"
"			    -r_ls.tqplsd_lot_qty,
"
"			    0,
"
"			    0,
"
"			    v_rcpt_unitcost,
"
"			    TRUNC(r_hd.tqphd_pln_date),
"
"			    'QC',
"
"			    NULL,
"
"			    p_pln_no,
"
"			    cr1.tqpln_seq_no,
"
"			    'TQM',
"
"			    p_user,
"
"			    p_crate_id => NULL,
"
"			    p_prod_ord_no => NULL,
"
"			    p_sf_code => NULL
"
"			   );
"
"
"
"      END LOOP;
"
"      END IF;
"
"
"
"    IF cr1.prod_ser_lot_opt <> 'N' THEN
"
"
"
"      FOR r_ls IN (SELECT *
"
"                     FROM tqm_qc_plan_lot_serial_dtls
"
"                    WHERE tqplsd_bu = p_bu
"
"                      AND tqplsd_pln_no = p_pln_no
"
"                      AND tqplsd_seq_no = cr1.tqpln_seq_no
"
"                   ORDER BY tqplsd_sub_seq_no)
"
"      LOOP
"
"
"
"        proc_upd_lot_ser_stocks(p_bu,
"
"                                cr1.tqpln_store_id,
"
"                                cr1.tqpln_prod_id,
"
"                                cr1.tqpln_prod_rev,
"
"                                r_ls.tqplsd_sys_ls_no,
"
"                                0,
"
"                                -r_ls.tqplsd_lot_qty,
"
"                                0,
"
"                                v_rcpt_unitcost,
"
"                                cr1.prod_ser_lot_opt,
"
"                                r_ls.tqplsd_lot_no,
"
"                                r_ls.tqplsd_serial_no,
"
"                                r_ls.tqplsd_source_type,
"
"                                r_ls.tqplsd_source_id,
"
"                                CASE WHEN cr1.prod_expr_flag = 'Y' THEN r_ls.tqplsd_expiry_date ELSE NULL END,
"
"                                TRUNC(r_hd.tqphd_pln_date),
"
"                                'QC',
"
"                                NULL,
"
"                                p_pln_no,
"
"                                cr1.tqpln_seq_no,
"
"                                'TQM',
"
"                                'STOCK QC',
"
"                                'STOCK QC',
"
"                                p_user
"
"                                );
"
"
"
"        IF cr1.store_bin_flag = 'Y' THEN
"
"
"
"	  proc_upd_bin_stocks(p_bu,
"
"			      cr1.tqpln_store_id,
"
"			      cr1.tqpln_prod_id,
"
"			      cr1.tqpln_prod_rev,
"
"			      r_ls.tqplsd_bin_id,
"
"			      r_ls.tqplsd_sys_ls_no,
"
"			      r_ls.tqplsd_lot_no,
"
"			      r_ls.tqplsd_serial_no,
"
"			      r_ls.tqplsd_source_type,
"
"			      r_ls.tqplsd_source_id,
"
"			      0,
"
"			      -r_ls.tqplsd_lot_qty,
"
"			      0,
"
"			      0,
"
"			      v_rcpt_unitcost,
"
"			      TRUNC(r_hd.tqphd_pln_date),
"
"			      'QC',
"
"			      NULL,
"
"			      p_pln_no,
"
"			      cr1.tqpln_seq_no,
"
"			      'TQM',
"
"			      p_user,
"
"			      p_crate_id => NULL,
"
"			      p_prod_ord_no => NULL,
"
"			      p_sf_code => NULL
"
"			     );
"
"
"
"	END IF;
"
"
"
"      END LOOP;
"
"
"
"    END IF;
"
"
"
"      FOR r_cb IN (SELECT tqpcb_batch_no,tqpcb_unit_cost,tqpcb_insp_qty
"
"                     FROM tqm_qc_plan_cost_batch
"
"                    WHERE tqpcb_bu = p_bu
"
"                      AND tqpcb_pln_no = p_pln_no
"
"                      AND tqpcb_seq_no = cr1.tqpln_seq_no
"
"		    ORDER BY tqpcb_sub_seq_no)
"
"      LOOP
"
"
"
"        proc_upd_stock_batches(p_bu,
"
"			       cr1.tqpln_store_id,
"
"			       cr1.tqpln_prod_id,
"
"			       cr1.tqpln_prod_rev,
"
"			       r_cb.tqpcb_batch_no,
"
"			       0,
"
"			       0,
"
"			       -r_cb.tqpcb_insp_qty,
"
"			       0,
"
"			       r_cb.tqpcb_unit_cost,
"
"			       r_cb.tqpcb_unit_cost,
"
"			       0,
"
"			       0,
"
"			       0,
"
"			       0,
"
"			       'N',
"
"			       r_hd.tqphd_pln_date,
"
"			       NULL,
"
"			       p_pln_no,
"
"			       cr1.tqpln_seq_no,
"
"			       'MI',
"
"			       NULL,
"
"			       p_pln_no,
"
"			       cr1.tqpln_seq_no,
"
"			       NULL,
"
"			       cr1.tqpln_prod_cls,
"
"			       'QC',
"
"			       'ICM',
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       p_user,
"
"			       p_prod_cls_desc => cr1.tqpln_prod_cls_desc,
"
"			       p_prod_subcls => cr1.tqpln_prod_subcls,
"
"			       p_prod_subcls_desc => cr1.tqpln_prod_subcls_desc,
"
"			       p_prod_grp => cr1.tqpln_prod_grp,
"
"			       p_prod_grp_desc => cr1.tqpln_prod_grp_desc,
"
"			       p_prod_subgrp => cr1.tqpln_prod_subgrp,
"
"			       p_prod_subgrp_desc => cr1.tqpln_prod_subgrp_desc
"
"    	                      );
"
"
"
"      END LOOP;
"
"
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"  END proc_can_rqst_frm_insp_rqst;
"
"
"
"END pkg_stk_qc;"
/
