CREATE OR REPLACE
"PACKAGE BODY        pkg_field_visit_rpt1
"
"AS
"
"   PROCEDURE proc_ins_iss_doc1 (p_bu                 VARCHAR2,
"
"                               p_plnt               VARCHAR2,
"
"                               p_plnt_loc           VARCHAR2,
"
"                               p_plnt_loc_name      VARCHAR2,
"
"                               p_date               DATE,
"
"                               p_to_plnt            VARCHAR2,
"
"                               p_doc_no             VARCHAR2,
"
"                               p_frm_store_id       VARCHAR2,
"
"                               p_lang               NUMBER,
"
"                               p_user               VARCHAR2,
"
"                               p_res            OUT VARCHAR2)
"
"   IS
"
"      CURSOR c_mat
"
"      IS
"
"         SELECT *
"
"           FROM csd_mtrl_trckg
"
"          WHERE cmt_sel_flag = 'Y'
"
"            AND cmt_sel_user = p_user
"
"        AND cmt_bu = p_bu
"
"        AND cmt_wo_asgn_unit = p_plnt
"
"        AND cmt_store_id = p_frm_store_id
"
"        --AND cmt_doc_no = p_doc_no
"
"        --AND cmt_wo_asgn_unit = cmt_sou_plnt
"
"            AND cmt_type = 'I'
"
"            AND p_to_plnt IS NOT NULL;
"
"
"
"  CURSOR c3(c_store_id    VARCHAR2,
"
"            c_prod_id    VARCHAR2,
"
"            c_prod_rev    NUMBER)
"
"      IS
"
"  SELECT SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) batch_stk_qty,sb_batch_id
"
"    FROM stocks_batches
"
"   WHERE sb_bu = p_bu
"
"     AND sb_store_id = c_store_id
"
"     AND sb_prod_id = c_prod_id
"
"     AND sb_prod_rev = c_prod_rev
"
"     AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"   GROUP BY sb_batch_id
"
"   ORDER BY sb_batch_id;
"
"
"
"      v_issdoc_no         VARCHAR2 (30);
"
"      v_seq_no            NUMBER := 1;
"
"      v_issuer_id         VARCHAR2 (30);
"
"      v_issuer_name       VARCHAR2 (60);
"
"      v_issuer_pos_id     VARCHAR2 (30);
"
"      v_issuer_pos_name   VARCHAR2 (60);
"
"      dummy1              VARCHAR2 (100);
"
"      dummy2              VARCHAR2 (100);
"
"      v_year              NUMBER;
"
"      v_period            NUMBER;
"
"      v_to_wh             VARCHAR2 (10);
"
"      v_sys_ls_no         NUMBER (15);
"
"      v_source_id         VARCHAR2 (10);
"
"      v_source_type       VARCHAR2 (1);
"
"      var_lot_seq_no      NUMBER;
"
"      v_start             NUMBER;
"
"      v_start_no          VARCHAR2 (15);
"
"      v_end_no            VARCHAR2 (15);
"
"      v_chk               VARCHAR2 (1) := 'N';
"
"      var_pack_no      VARCHAR2(100);
"
"      var_dc_no          VARCHAR2(100);
"
"      v_cust_doc_no      VARCHAR2(15);
"
"      var_bal_qty      NUMBER;
"
"      var_upd_qty         NUMBER;
"
"      v_plnt_loc      VARCHAR2(10);
"
"      v_plnt_loc_name     VARCHAR2(50);
"
"      v_sub_seq_no  NUMBER;
"
"      v_csr_no                VARCHAR2(15);
"
"   BEGIN
"
"
"
"      v_year := func_find_year (p_bu, p_date);
"
"      v_period := func_find_period (p_bu, p_date);
"
"
"
"      proc_get_emp_det (p_bu,
"
"                        p_user,
"
"                        v_issuer_id,
"
"                        v_issuer_name,
"
"                        v_issuer_pos_id,
"
"                        v_issuer_pos_name,
"
"                        dummy1,
"
"                        dummy2,
"
"                        p_lang);
"
"
"
"      v_start := 1;
"
"
"
"      v_issdoc_no := func_find_icm_next_id (p_bu,p_date,'MI',p_frm_store_id,p_user);
"
"
"
"      IF v_start = 1 THEN
"
"         v_start_no := v_issdoc_no;
"
"      END IF;
"
"
"
"      v_end_no := v_issdoc_no;
"
"
"
"      BEGIN
"
"         SELECT store_id
"
"           INTO v_to_wh
"
"           FROM stores
"
"          WHERE store_bu = p_bu
"
"            AND store_plnt = p_to_plnt
"
"            AND store_physical = 'E';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"            raise_application_error (-20768,'ICM '|| 'Cust. Serv. (DC) W/H not found.'|| p_bu|| ' /'|| p_to_plnt);
"
"      END;
"
"
"
"      BEGIN
"
"      SELECT bupld_loc_id,bupld_loc_name
"
"        INTO v_plnt_loc,v_plnt_loc_name
"
"        FROM bus_unit_plants_loc_dtls
"
"       WHERE bupld_bu = p_bu
"
"         AND bupld_plnt = p_plnt;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        raise_application_error (-20768,'ICM '|| 'Unit Location not found.'|| p_bu|| ' /'|| p_plnt);
"
"      END;
"
"
"
"
"
"        BEGIN
"
"      SELECT cmt_csr_no
"
"        INTO v_csr_no
"
"        FROM csd_mtrl_trckg
"
"          WHERE cmt_sel_flag = 'Y'
"
"            AND cmt_sel_user = p_user
"
"        AND cmt_bu = p_bu
"
"        AND cmt_wo_asgn_unit = p_plnt
"
"        AND cmt_store_id = p_frm_store_id
"
"            AND cmt_type = 'I'
"
"            AND p_to_plnt IS NOT NULL;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        raise_application_error (-20999,'HRM '|| 'CSR No. Not Found');
"
"      END;
"
"
"
"      INSERT INTO inv_stock_trans_hd (isthd_bu,
"
"                                      isthd_plnt,
"
"                                      isthd_ref_unit,
"
"                                      isthd_doc_no,
"
"                                      isthd_doc_oper,
"
"                                      isthd_issuefm_store_id,
"
"                                      isthd_issueto_type,
"
"                                      isthd_issueto_id,
"
"                                      isthd_trans_date,
"
"                                      isthd_year,
"
"                                      isthd_period,
"
"                                      isthd_status,
"
"                                      isthd_reference,
"
"                                      isthd_issuer_id,
"
"                                      isthd_issuer_name,
"
"                                      isthd_issuer_pos_id,
"
"                                      isthd_issuer_pos_name,
"
"                                      isthd_cre_by,
"
"                                      isthd_cre_date,
"
"                      isthd_rec_src_flag,
"
"                      isthd_plnt_loc_id,
"
"                      isthd_plnt_loc_name,
"
"                      isthd_issueto_plnt,
"
"                      isthd_issueto_plnt_loc_id,
"
"                      isthd_csr_doc_no)
"
"               VALUES (p_bu,
"
"                     p_plnt,
"
"                     p_to_plnt,
"
"                     v_issdoc_no,
"
"                     'T',
"
"                     p_frm_store_id,
"
"                     'I',
"
"                     v_to_wh,
"
"                     p_date,
"
"                     v_year,
"
"                     v_period,
"
"                     'N',
"
"                     'MATERIAL ISSUANCE CREATED FROM BRANCH TRANSFER FROM W/H.'
"
"                     || ' : '
"
"                     || p_frm_store_id
"
"                     || ' '
"
"                     || 'FROM UNIT'
"
"                     || p_plnt,
"
"                     v_issuer_id,
"
"                     v_issuer_name,
"
"                     v_issuer_pos_id,
"
"                     v_issuer_pos_name,
"
"                     p_user,
"
"                     SYSDATE,
"
"                     'M',
"
"                     v_plnt_loc,
"
"                     v_plnt_loc_name,
"
"                     p_to_plnt,
"
"                     p_plnt_loc,
"
"                     v_csr_no
"
"                    );
"
"
"
"                  v_start := v_start + 1;
"
"
"
"      FOR r_mat IN c_mat
"
"      LOOP
"
"         INSERT INTO inv_stock_trans_ln (istln_bu,
"
"                                         istln_doc_no,
"
"                                         istln_seq_no,
"
"                                         istln_prod_id,
"
"                                         istln_prod_rev,
"
"                                         istln_uom,
"
"                                         istln_prod_uom,
"
"                                         istln_conv_factor,
"
"                                         istln_prod_cls,
"
"                                         istln_rqst_qty,
"
"                                         istln_trans_qty,
"
"                                         istln_accepted_qty,
"
"                                         istln_unit_cost,
"
"                                         istln_reference,
"
"                                         istln_status,
"
"                                         istln_ord_qty,
"
"                                         istln_mat_type,
"
"                                         istln_cre_by,
"
"                                         istln_cre_date,
"
"                                         istln_type,
"
"                                         istln_ord_type,
"
"                                         istln_ord_pfx,
"
"                                         istln_ord_no,
"
"                                         istln_ord_seq_no,
"
"                                         istln_ord_sub_seq_no)
"
"              VALUES (p_bu,
"
"                        v_issdoc_no,
"
"                        v_seq_no,
"
"                        r_mat.cmt_prod_id,
"
"                        r_mat.cmt_prod_rev,
"
"                        func_find_product_uom (p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev),
"
"                        func_find_product_uom (p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev),
"
"                        1,
"
"                        func_find_product_class (p_bu,p_plnt,r_mat.cmt_prod_id,r_mat.cmt_prod_rev),
"
"                        r_mat.cmt_trans_qty,
"
"                        r_mat.cmt_trans_qty,
"
"                        r_mat.cmt_trans_qty,
"
"                        r_mat.cmt_unit_cost,
"
"                        'MATERIAL ISSUANCE CREATED FROM FVR-BRANCH TRANSFER',
"
"                        'N',
"
"                        0,
"
"                        'S',
"
"                        p_user,
"
"                        SYSDATE,
"
"                        'NA',
"
"                        'FB', --Field Visit Branch
"
"                        NULL,
"
"                        r_mat.cmt_doc_no,
"
"                        NULL,
"
"                        NULL);
"
"
"
"
"
"          proc_upd_stocks(p_bu,
"
"                          p_frm_store_id,
"
"                          NULL,
"
"                          r_mat.cmt_prod_id,
"
"                          r_mat.cmt_prod_rev,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          r_mat.cmt_trans_qty,
"
"                          r_mat.cmt_unit_cost,
"
"                          r_mat.cmt_unit_cost,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          v_seq_no,
"
"                          0,
"
"                          NULL,
"
"                          v_issdoc_no,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          v_year,
"
"                          v_period,
"
"                          p_date,
"
"                          NULL,
"
"                          'ICM',
"
"                          'MI',
"
"                          NULL,
"
"                          p_user,
"
"                          SYSDATE,
"
"                          NULL,
"
"                          func_find_product_class (p_bu,p_plnt,r_mat.cmt_prod_id,r_mat.cmt_prod_rev),
"
"                          NULL,
"
"                          'PO',
"
"                          NULL,
"
"                          NULL,
"
"                          0/*,
"
"              p_prod_cls_desc => r_prod.prod_cls_desc,
"
"              p_prod_sub_cls_id => r_prod.prod_sub_cls,
"
"              p_prod_sub_cls_desc => r_prod.prod_subcls_desc,
"
"              p_prod_grp_id => r_prod.prod_group_id,
"
"              p_prod_grp_desc => r_prod.prod_grp_desc,
"
"              p_prod_sub_grp_id => r_prod.prod_subgroup_id,
"
"              p_prod_sub_grp_desc => r_prod.prod_subgrp_desc,
"
"              p_prod_cls_type => r_prod.prod_cls_type*/
"
"                         );
"
"
"
"         v_sys_ls_no := r_mat.cmt_sys_ls_no;
"
"         v_source_type := r_mat.cmt_source_type;
"
"         v_source_id := r_mat.cmt_source_id;
"
"
"
"        IF func_find_prod_ser_lot_type(p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev) IN ('L','S') THEN
"
"     IF v_sys_ls_no IS NULL AND r_mat.cmt_serial_no IS NOT NULL THEN
"
"       SELECT lss_sys_ls_no
"
"         INTO v_sys_ls_no
"
"         FROM lot_ser_stocks
"
"        WHERE lss_bu = p_bu
"
"          AND lss_store_id = r_mat.cmt_store_id
"
"          AND lss_prod_id = r_mat.cmt_prod_id
"
"          AND lss_prod_rev = r_mat.cmt_prod_rev
"
"          AND lss_lot_no IS NULL
"
"          AND lss_ser_no = r_mat.cmt_serial_no;
"
"     END IF;
"
"    END IF;
"
"
"
"         SELECT NVL (MAX (isbd_sub_seq_no), 0) + 1
"
"           INTO var_lot_seq_no
"
"           FROM inv_stock_batch_details
"
"          WHERE isbd_bu = p_bu
"
"            AND isbd_issue_doc_no = v_issdoc_no
"
"            AND isbd_seq_no = v_seq_no;
"
"
"
"         INSERT INTO inv_stock_batch_details (isbd_bu,
"
"                                              isbd_issue_doc_no,
"
"                                              isbd_seq_no,
"
"                                              isbd_sub_seq_no,
"
"                                              isbd_sys_ls_no,
"
"                                              isbd_lot_no,
"
"                                              isbd_serial_no,
"
"                                              isbd_source_type,
"
"                                              isbd_source_id,
"
"                                              isbd_trans_qty,
"
"                                              isbd_stk_trans_qty,
"
"                                              isbd_excs_qty,
"
"                                              isbd_trnf_acpt_qty,
"
"                                              isbd_ins_rec,
"
"                                              isbd_cre_by,
"
"                                              isbd_cre_date)
"
"                      VALUES (p_bu,
"
"                          v_issdoc_no,
"
"                          v_seq_no,
"
"                          var_lot_seq_no,
"
"                          v_sys_ls_no,
"
"                          NULL,
"
"                          r_mat.cmt_serial_no,
"
"                          v_source_type,
"
"                          v_source_id,
"
"                          r_mat.cmt_trans_qty,
"
"                          r_mat.cmt_trans_qty,
"
"                          0,
"
"                          r_mat.cmt_trans_qty,
"
"                          'Y',
"
"                          p_user,
"
"                          SYSDATE);
"
"
"
"         var_bal_qty := r_mat.cmt_trans_qty;
"
"
"
"         IF func_find_prod_cost_method (p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev) NOT IN ('MAC') AND
"
"         func_find_prod_ser_lot_type(p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev) IN ('N') THEN
"
"
"
"    v_sub_seq_no := 0;
"
"     FOR cr3 IN c3(p_frm_store_id,r_mat.cmt_prod_id,r_mat.cmt_prod_rev)
"
"     LOOP
"
"
"
"              IF var_bal_qty > cr3.batch_stk_qty THEN
"
"                var_upd_qty := cr3.batch_stk_qty;
"
"                var_bal_qty := var_bal_qty - cr3.batch_stk_qty;
"
"              ELSE
"
"                var_upd_qty := var_bal_qty;
"
"                var_bal_qty := 0;
"
"              END IF;
"
"
"
"         v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"            INSERT INTO inv_stock_trans_cost_batch (istcb_bu,
"
"                                                    istcb_doc_no,
"
"                                                    istcb_seq_no,
"
"                                                    istcb_sub_seq_no,
"
"                                                    istcb_batch_no,
"
"                                                    istcb_trans_qty,
"
"                                                    istcb_unit_cost,
"
"                                                    istcb_cre_by,
"
"                                                    istcb_cre_date,
"
"                                                    istcb_ins_rec,
"
"                                                    istcb_stk_trans_qty)
"
"                        VALUES (p_bu,
"
"                            v_issdoc_no,
"
"                            v_seq_no,
"
"                            v_sub_seq_no,
"
"                            cr3.sb_batch_id,
"
"                            var_upd_qty,
"
"                            r_mat.cmt_unit_cost,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            'Y',
"
"                            var_upd_qty);
"
"           EXIT WHEN var_bal_qty = 0;
"
"         END LOOP c3;
"
"         END IF;
"
"
"
"         v_seq_no := v_seq_no + 1;
"
"         v_chk := 'Y';
"
"
"
"    proc_ins_cmt_hist1 (p_bu,
"
"                       r_mat.cmt_doc_no,
"
"                       p_date,
"
"                       p_frm_store_id,
"
"                       r_mat.cmt_prod_id,
"
"                       r_mat.cmt_prod_rev,
"
"                       r_mat.cmt_serial_no,
"
"                       r_mat.cmt_csr_id,
"
"                       r_mat.cmt_serv_wo_no,
"
"                       r_mat.cmt_wo_asgn_unit,
"
"                       r_mat.cmt_csr_no,
"
"                       -r_mat.cmt_trans_qty,
"
"                       0,
"
"                       r_mat.cmt_wo_qty,
"
"                       0,
"
"                       r_mat.cmt_rpr_comp_flag,
"
"                       p_user,
"
"                       v_sys_ls_no,
"
"                       v_source_type,
"
"                       v_source_id,
"
"                       r_mat.cmt_batch_no,
"
"                       'QOH',
"
"                       r_mat.cmt_fvr_no,
"
"                       r_mat.cmt_fvr_seq_no,
"
"                       r_mat.cmt_rwk_ord_no,
"
"                       r_mat.cmt_type,
"
"                       r_mat.cmt_status,
"
"                       'STOCK DECREASE - BRANCH TO BRANCH',
"
"                       r_mat.cmt_unit_cost,
"
"                       r_mat.cmt_branch_miv_no,
"
"                       r_mat.cmt_wo_asgn_unit ,
"
"                       r_mat.cmt_fv_type,
"
"               r_mat.cmt_cust_id
"
"               );
"
"
"
"
"
"    proc_ins_cmt_hist1(p_bu,
"
"                       r_mat.cmt_doc_no,
"
"                       p_date,
"
"                       p_frm_store_id,
"
"                       r_mat.cmt_prod_id,
"
"                       r_mat.cmt_prod_rev,
"
"                       r_mat.cmt_serial_no,
"
"                       r_mat.cmt_csr_id,
"
"                       r_mat.cmt_serv_wo_no,
"
"                       r_mat.cmt_wo_asgn_unit,
"
"                       r_mat.cmt_csr_no,
"
"                       0,
"
"                       r_mat.cmt_trans_qty,
"
"                       r_mat.cmt_wo_qty,
"
"                       0,
"
"                       r_mat.cmt_rpr_comp_flag,
"
"                       p_user,
"
"                       v_sys_ls_no,
"
"                       v_source_type,
"
"                       v_source_id,
"
"                       r_mat.cmt_batch_no,
"
"                       'SIT',
"
"                       r_mat.cmt_fvr_no,
"
"                       r_mat.cmt_fvr_seq_no,
"
"                       r_mat.cmt_rwk_ord_no,
"
"                       r_mat.cmt_type,
"
"                       r_mat.cmt_status,
"
"                       'TRANSIT STOCK INCREASE - BRANCH TO BRANCH',
"
"                       r_mat.cmt_unit_cost,
"
"                       r_mat.cmt_branch_miv_no,
"
"                       r_mat.cmt_wo_asgn_unit,
"
"                       r_mat.cmt_fv_type,
"
"               r_mat.cmt_cust_id
"
"               );
"
"
"
"
"
"
"
"      IF v_chk = 'Y' THEN
"
"
"
"         UPDATE csd_mtrl_trckg
"
"            SET cmt_sel_flag = 'N',
"
"            cmt_sel_user = NULL,
"
"            cmt_status = 'B'
"
"          WHERE cmt_bu = p_bu
"
"            AND cmt_sel_flag = 'Y'
"
"            AND cmt_sel_user = p_user
"
"        AND cmt_doc_no = r_mat.cmt_doc_no
"
"            AND cmt_type = 'I'
"
"            AND p_to_plnt IS NOT NULL;
"
"
"
"         IF v_start_no <> v_end_no THEN
"
"            p_res := v_start_no || '-' || v_end_no;
"
"         ELSE
"
"            p_res := v_start_no;
"
"         END IF;
"
"      ELSE
"
"         p_res := 'Document not created.';
"
"      END IF;
"
"      END LOOP;
"
"/*
"
"    proc_issue_mat_frm_mi_crm(p_bu,
"
"                p_plnt,
"
"                v_issdoc_no,
"
"                p_user,
"
"                p_lang,
"
"                var_dc_no,
"
"                var_pack_no
"
"                    );*/
"
"
"
"     p_res := v_issdoc_no;
"
"
"
"     proc_validate_stocks(p_bu);
"
"
"
"   END proc_ins_iss_doc1;
"
"
"
"
"
"
"
"
"
"   PROCEDURE proc_ins_cmt_hist1 (p_bu               VARCHAR2,
"
"                                p_doc_no           VARCHAR2,
"
"                                p_date             DATE,
"
"                                p_store_id         VARCHAR2,
"
"                                p_prod_id          VARCHAR2,
"
"                                p_prod_rev         NUMBER,
"
"                                p_ser_no           VARCHAR2,
"
"                                p_csr_id           VARCHAR2,
"
"                                p_wo_no            VARCHAR2,
"
"                                p_wo_unit          VARCHAR2,
"
"                                p_csr_no           VARCHAR2,
"
"                                p_trans_qty        NUMBER,
"
"                                p_transit_qty      NUMBER,
"
"                                p_wo_qty           NUMBER,
"
"                                p_buf_stk_qty      NUMBER,
"
"                                p_rpr_comp_flag    VARCHAR2,
"
"                                p_user             VARCHAR2,
"
"                                p_sys_ls_no        VARCHAR2,
"
"                                p_source_type      VARCHAR2,
"
"                                p_source_id        VARCHAR2,
"
"                                p_batch_no         VARCHAR2,
"
"                                p_bucket_type      VARCHAR2,
"
"                                p_fvr_no           VARCHAR2,
"
"                                p_fvr_seq_no       NUMBER,
"
"                                p_rwk_ord_no       VARCHAR2,
"
"                                p_type             VARCHAR2,
"
"                                p_status           VARCHAR2,
"
"                                p_ref              VARCHAR2,
"
"                                p_unit_cost        NUMBER,
"
"                                p_branch_miv_no    VARCHAR2,
"
"                p_sou_plnt        VARCHAR2,
"
"                p_fv_type       VARCHAR2,
"
"                p_cust_id        VARCHAR2)
"
"   IS
"
"      v_trans_no   VARCHAR2 (15);
"
"   BEGIN
"
"
"
"      SELECT NVL (MAX (TO_NUMBER (cmth_trans_no)), 0) + 1
"
"        INTO v_trans_no
"
"        FROM csd_mtrl_trckg_hist
"
"       WHERE cmth_bu = p_bu;
"
"
"
"      INSERT INTO csd_mtrl_trckg_hist (cmth_bu,
"
"                                       cmth_trans_no,
"
"                                       cmth_doc_no,
"
"                                       cmth_trans_date,
"
"                                       cmth_store_id,
"
"                                       cmth_prod_id,
"
"                                       cmth_prod_rev,
"
"                                       cmth_serial_no,
"
"                                       cmth_csr_id,
"
"                                       cmth_serv_wo_no,
"
"                                       cmth_wo_asgn_unit,
"
"                                       cmth_csr_no,
"
"                                       cmth_trans_qty,
"
"                                       cmth_tranit_qty,
"
"                                       cmth_wo_qty,
"
"                                       cmth_buf_stk_qty,
"
"                                       cmth_rpr_comp_flag,
"
"                                       cmth_cre_by,
"
"                                       cmth_cre_date,
"
"                                       cmth_sys_ls_no,
"
"                                       cmth_source_type,
"
"                                       cmth_source_id,
"
"                                       cmth_batch_no,
"
"                                       cmth_bucket_type,
"
"                                       cmth_fvr_no,
"
"                                       cmth_fvr_seq_no,
"
"                                       cmth_rwk_ord_no,
"
"                                       cmth_type,
"
"                                       cmth_status,
"
"                                       cmth_ref,
"
"                                       cmth_unit_cost,
"
"                                       cmth_branch_miv_no,
"
"                       cmth_cust_id,
"
"                       cmth_prod_cls_id,
"
"                       cmth_prod_cls_desc,
"
"                       cmth_prod_subcls_id,
"
"                       cmth_prod_subcls_desc,
"
"                       cmth_prod_grp_id,
"
"                       cmth_prod_grp_desc,
"
"                       cmth_prod_subgrp_id,
"
"                       cmth_prod_subgrp_desc,
"
"                       cmth_prod_cls_type)
"
"           VALUES (p_bu,
"
"                   v_trans_no,
"
"                   p_doc_no,
"
"                   p_date,
"
"                   p_store_id,
"
"                   p_prod_id,
"
"                   p_prod_rev,
"
"                   p_ser_no,
"
"                   p_csr_id,
"
"                   p_wo_no,
"
"                   p_wo_unit,
"
"                   p_csr_no,
"
"                   p_trans_qty,
"
"                   p_transit_qty,
"
"                   p_wo_qty,
"
"                   p_buf_stk_qty,
"
"                   p_rpr_comp_flag,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   p_sys_ls_no,
"
"                   p_source_type,
"
"                   p_source_id,
"
"                   p_batch_no,
"
"                   p_bucket_type,
"
"                   p_fvr_no,
"
"                   p_fvr_seq_no,
"
"                   p_rwk_ord_no,
"
"                   p_type,
"
"                   p_status,
"
"                   p_ref,
"
"                   p_unit_cost,
"
"                   p_branch_miv_no,
"
"               p_cust_id,
"
"            (SELECT prodplnt_cls
"
"               FROM prod_plants
"
"              WHERE prodplnt_bu = p_bu
"
"            AND prodplnt_plnt = p_wo_unit
"
"            AND prodplnt_prod_id = p_prod_id
"
"            AND prodplnt_prod_rev = p_prod_rev),
"
"            (SELECT class_desc1
"
"               FROM classes
"
"              WHERE class_bu = p_bu
"
"            AND class_id = (SELECT prodplnt_cls
"
"                      FROM prod_plants
"
"                     WHERE prodplnt_bu = p_bu
"
"                       AND prodplnt_plnt = p_wo_unit
"
"                       AND prodplnt_prod_id = p_prod_id
"
"                       AND prodplnt_prod_rev = p_prod_rev)),
"
"            (SELECT prodplnt_sub_cls
"
"               FROM prod_plants
"
"              WHERE prodplnt_bu = p_bu
"
"            AND prodplnt_plnt = p_wo_unit
"
"            AND prodplnt_prod_id = p_prod_id
"
"            AND prodplnt_prod_rev = p_prod_rev),
"
"            (SELECT subcls_desc1
"
"               FROM sub_classes
"
"              WHERE subcls_bu = p_bu
"
"            AND subcls_id = (SELECT prodplnt_sub_cls
"
"                       FROM prod_plants
"
"                      WHERE prodplnt_bu = p_bu
"
"                        AND prodplnt_plnt = p_wo_unit
"
"                        AND prodplnt_prod_id = p_prod_id
"
"                        AND prodplnt_prod_rev = p_prod_rev)) ,
"
"            (SELECT prod_group_id
"
"               FROM products
"
"              WHERE prod_bu = p_bu
"
"            AND prod_id = p_prod_id
"
"            AND prod_rev = p_prod_rev),
"
"            (SELECT pgrp_group_desc1
"
"               FROM prod_group
"
"              WHERE pgrp_bu = p_bu
"
"            AND pgrp_group_id = (SELECT prod_group_id
"
"                           FROM products
"
"                          WHERE prod_bu = p_bu
"
"                        AND prod_id = p_prod_id
"
"                        AND prod_rev = p_prod_rev)),
"
"            (SELECT prod_subgroup_id
"
"               FROM products
"
"              WHERE prod_bu = p_bu
"
"            AND prod_id = p_prod_id
"
"            AND prod_rev = p_prod_rev),
"
"            (SELECT psgrp_subgroup_desc1
"
"               FROM prod_sub_group
"
"              WHERE psgrp_bu = p_bu
"
"            AND psgrp_subgroup_id = (SELECT prod_subgroup_id
"
"                           FROM products
"
"                          WHERE prod_bu = p_bu
"
"                            AND prod_id = p_prod_id
"
"                            AND prod_rev = p_prod_rev)),
"
"            func_find_prod_class_type(p_bu,p_wo_unit,p_prod_id,p_prod_rev) );
"
"   END proc_ins_cmt_hist1;
"
"
"
"END pkg_field_visit_rpt1;"
/
